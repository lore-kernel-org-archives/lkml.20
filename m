Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B5A4772AC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987277; cv=none; b=gBp9OjQCPB9k3WSFeduoZ9k9mGsnO0qO6yltpRY+WY/jGoaTa+Z4cPGB7IZlNfOD1gO3D/JN9D5257X8kVDWqRnFo680CtZBrMAC9YyaoIsIS/DxfVMR4vjXMg5jKUZVFKDANfIUYSglZ1lArXd0Y+q4dcGBJLyXbBwEsm3Lkls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987277; c=relaxed/simple;
	bh=Vp8C7aOYmHWfWlwXA1cOxEnu/cK/tN6duAgIquolyQI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nhryd5K021q2OY87jkyO00JP1Ox4IAzNlCo8sjevgQzE0pqlod+StFzqZDwP6jqmRu4a35kcVayxH08lXhN9hzKBkK2QDYkGavoLL/gQht2rosZ3zifVpoodt0SvqoESwy9r9FkFGmCD/eQXyAjjjQj3Fs0oHyV4LVX/cNTxcmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFmPm+oo; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFmPm+oo"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so14165285e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789987274; x=1790592074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wASVZEAHXQVuqSirWWZ9H5tns/M0AboKjXEiHFDzbAo=;
        b=gFmPm+oobohmBSRJPxMNvl6Yux5hN/9SwnvbpFU8/zbqcBcEe0awQ84haPCAraS8du
         Ev60gxw1LEjOBWgT3ur+DOSs0rvB4daStw2EVZMqJvXq9KhDQ7s7TGzVdJSq30JAOzTR
         l82YP1AI6YW/uj6hIfkdy5LQGeA85dLt7G+3TX3IuemFSgOaC1AbxFnwiAelyK9TBj/s
         BA9kwYEzEtxQFK0hWiuLG7ZsvUVls0aC4PLODegYCXhDdLqg4ePv2kKf/MZqBWWyL0Sm
         OrFwloIz3EAWA3c/eT8HFlvhnfGCf9tk1dwLe5Jjvd5S/zrhZSTk9XrdvYqqCHq7fAg+
         h0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789987274; x=1790592074;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wASVZEAHXQVuqSirWWZ9H5tns/M0AboKjXEiHFDzbAo=;
        b=GDffGPTKVpxyZ98EMcD2iFeDR/IOQ7kTy1CjmVljvREAeIOySH8Eb+iNJJQgMT4WBj
         OgjnHgu4IPxTr5QJLuafGUBEcaUuWtHAj4OMB4n9S3036I89OMosnlPq/7/uVGvHiR0H
         xCHf/zqquoLNuRFF9x5+I9qminL+6q75n9LUP7vSKFpAuEqTyV2t2x9kV8V6ZWgPlFmQ
         nY2x2z7w0WO5Kuv7fpZCiWYOrsLSyvY+ouaHhgk2lDMVx+gjL6mE5VtyFCvbaZTRIC/o
         +NwKZX2L6LLGEWvdxtIWNR5Ebvg09u1QA8lvLh/h+eqyA97GUZKMjnDXQ7tXTdq7kFnq
         2vWw==
X-Forwarded-Encrypted: i=1; AKwUvBwiWlDnkRqM5wYjVmXI6tjKv9HZIhIhNzoz9dS/YHZ/bbnZvYOp52ZxNsizJaHiyn5lz8MTSQdkKedA4qw=@vger.kernel.org
X-Gm-Message-State: AFuF++kiZWHJ5EEv4FufdIWFNfWye4lsWQPLLsC+gO+kXJwk6Byk9FoW
	qpV5ibTPYI8yrOPXNS4QbtBB6He9vsHEJyVdavdCyVzDZLggm6vjwYbugMsuAEgZ
X-Gm-Gg: AYBFou179ERHVZo9elFGVF/BuN5VnTURqlD5QxnUyUpue4SYggIurB7S2MlkUDDumu1
	iu/LOBtgRqcwdeB2c9GAv/NBWs6GuN4rJ7hIn5GCG38Of16L+SdLjw8kO7JUjo2o8ch2x4pxfWY
	Kz7GuiSUuIFxNsx/EJwsqoFh7u4CKv1h9gQue5bGBBYHJHlfLcCVMOJLv10ihfXCqARpv83v4gX
	MjW0JXmNAaXh2RPmB7dfEzBmPRhH2Y4FC0yF8sS4fLd+ZXyIq1pNKAY8bYUGYeBxkwdnw/ZeHm9
	MbcTzcyQpb/2VHVMZfKWZUtTJE1ccH8wkCZdEJzsSzwyCxI1mf3ESQX+SWpaWuHVsv/HqRUo4F/
	PnBAhZs0HUNvyWQX6bBnr0oEtUgXAykoPQki+ttbSnIUWE9nQnkR6Seda4g4byhPxhzL71ZBpMZ
	OHRUGJ1BoMnTS1jNb2nkIhnPGCZ+7b3oaHWMf9+GmAI6TsQi5G7A78UDK2LNvycJvRmgTlbLpdb
	4x78LQZSgsNssvOARcGSkzJAb11b/KxlAE=
X-Received: by 2002:a05:600d:486:10b0:49c:fc6e:a3e1 with SMTP id 5b1f17b1804b1-49fc58682a5mr100899815e9.32.1789987273176;
        Mon, 21 Sep 2026 03:41:13 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0874c3sm300694495e9.14.2026.09.21.03.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:41:12 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:41:11 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Arnd Bergmann" <arnd@arndb.de>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "HyeongJun An" <sammiee5311@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: reduce stack usage in
 spi_nor_parse_sfdp()
Message-ID: <20260921114111.525a2257@pumpkin>
In-Reply-To: <20260921095924.2f845215@pumpkin>
References: <20260915194203.3511147-1-arnd@kernel.org>
	<DLKU0CTP0OES.30VZXJXDXRLNW@kernel.org>
	<20260921095924.2f845215@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 21 Sep 2026 09:59:24 +0100
David Laight <david.laight.linux@gmail.com> wrote:

> On Mon, 21 Sep 2026 09:55:37 +0200
> "Michael Walle" <mwalle@kernel.org> wrote:
> 
> > Hi Arnd,
> > 
> > On Tue Sep 15, 2026 at 9:40 PM CEST, Arnd Bergmann wrote:  
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > Two large spi_nor_flash_parameter structures on a function stack
> > > is really too much, and this can exceed an otherwise reasonable
> > > frame limit:
> > >
> > > drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
> > > drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
> > >
> > > Change one of them to a dynamic allocation to make this more reasonable.    
> > 
> > Thanks for taking care of that. Will you respin the patch with what
> > David suggested?  
> 
> This compiles...

It didn't - I thought I had compiled it :-(
Try:

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 641f17ad51a0..cec699b52f27 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1519,9 +1519,9 @@ int spi_nor_check_sfdp_signature(struct spi_nor *nor)
  */
 int spi_nor_parse_sfdp(struct spi_nor *nor)
 {
+       struct spi_nor_flash_parameter *save_params __free(kfree) = kmalloc_objs(*save_params, 2);
        const struct sfdp_parameter_header *param_header, *bfpt_header;
        struct sfdp_parameter_header *param_headers = NULL;
-       struct spi_nor_flash_parameter params, params2;
        struct sfdp_header header;
        struct device *dev = nor->dev;
        struct sfdp *sfdp;
@@ -1533,7 +1533,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
         * Get a backup of all the parameter to roll back to in case of an
         * error.
         */
-       memcpy(&params, nor->params, sizeof(params));
+       if (!save_params)
+               return -ENOMEM;
+       save_params[0] = *nor->params;

        /* Get the SFDP header. */
        err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &header);
@@ -1653,7 +1655,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)

        /* Parse optional parameter tables. */
        for (i = 0; i < header.nph; i++) {
-               memcpy(&params2, nor->params, sizeof(params2));
+               save_params[1] = *nor->params;
                param_header = &param_headers[i];

                switch (SFDP_PARAM_HEADER_ID(param_header)) {
@@ -1691,7 +1693,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
                         * spi_nor_flash_parameter data.
                         */
                        err = 0;
-                       memcpy(nor->params, &params2, sizeof(*nor->params));
+                       *nor->params = save_params[1];
                }
        }

@@ -1712,7 +1714,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 free_param_headers:
        kfree(param_headers);
        if (err)
-               memcpy(nor->params, &params, sizeof(*nor->params));
+               *nor->params = save_params[0];

        return err;
 }
--

David

...
> > 
> > -michael
> >   
> > > Fixes: d20029474a76 ("mtd: spi-nor: push the rollback mechanism into the sfdp module")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > ---
> > >  drivers/mtd/spi-nor/sfdp.c | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)    
> 

