Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832732;
	b=lVZ6SpNTsvEO5KVVZjTxsUwpkpI0mjVI2ilkUPGB89RQv7Mef5GrH3dZgo8ncvkeg3o1
	 6KVi/daBpINRlqOZt4SN2VCbookvl6V9ag1HzkmK2qY8+1A/RmedxBLtOiH9F8/ZC//Sc
	 Xp58Xcapn8xGef7RdWFNvkzKGHEw+ujb08A3uAUtYHOXFUy70ZDYORMhXrz1zKorDx/Q6
	 vfCnoNQciAZ9mBVCk/CEfm2k+py0PPkj/IrvoetexQfBvVVdXXi2f2wXAkSfrBzhHaR98
	 729GmqZKslpWkCP7QjQ99dvUKiiBLgx2gZoynor06mNO2ozd9W7g506a2ri9h+2AS3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3PZYt1daQSeYExHxoL5A7mAZahkiXN58Qu2cjjFDeCI=;
	b=ty8Zg9qYcfK3p4/CsXPI5NaFpfSzq/sQCs3+TUZOsPs8cWbEgYxY2y2GsD+XfCOU97KM
	 eB/XlqkIkRhQe2dkDUSdWueo01P6sXfBO6jppQ+BHjfEi4F+CQ9BSmJGKKeSYPt0VQCSm
	 Ou+8Hs0L0z+Z2XSOUU1fW0dXLstJvXKT2SCCXoxoYrsg5IENuIs2ycQe+mYbvQ+76lhoO
	 5zj0YYuFWDAOJcejxM+6RC4QbFcOG/acOrwieajW3uSZ4YL69nOM0P0SmXwKMSWtaSupP
	 NNHvVyhjbLopusbFVcuqlOc/GCjU93NN7NpWze7rXBCkGFqWvggA+sKETJfPtpu5PZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nwtVQorC;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E523606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E523606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nwtVQorC
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso88710266b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832731; x=1795437531; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3PZYt1daQSeYExHxoL5A7mAZahkiXN58Qu2cjjFDeCI=;
        b=nwtVQorCev+xidg6/G0Xnd8EwYCES7B74F9FBb177/oQMt6yREPQ9fstvg+bBb8rh0
         yb1lWkUz8yMT6kuyB3jZ0X/nOOpWoYOx+NMUP45qaU/7no6E7W8JGgOrPZGcCtLRpgTC
         XJHCo+dDczh6eZwh3MiBjbTAG9mGRDRmSa47Uuf1j/qyrxieZQ1nb+gWP6ovhCKPplC3
         Z3OcumTU/ysjViYZDKfzn6DeVq3znCJx2QbaVRtX4CVoG7U1YVhLnU5CUpOgWa70acc2
         qkYQ2gX7vu3/k2glwHGqyqWiunZ4fblkHIxjEZSs0CIXGeqylD0xsrvHcXAScX8JiHZP
         J6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832731; x=1795437531;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3PZYt1daQSeYExHxoL5A7mAZahkiXN58Qu2cjjFDeCI=;
        b=QiVa2YEgSqQlDSyfEaH1yP3Cg84atCiom3qR0i/f6Ot/OnhwQEYOx4vdYo5qZEBv4J
         NFGlvYb5nXLd72ehq3GCp/C8BtptDvt2DWc0F68Ki45BggNbAgjAaTrxF3VX8hL2zEoJ
         SlQ4Ia3MCchIHeAyiL7IqflLa/CSzmmYXbT7TCmiKiOANIt4mGqy3sROa9dteoGnwAUy
         mxOSBxZbdwNArlKZSG2WU9GucxMDNR1cVfYYY9bhWPe2ETUtTVP8Rqy5+s7D2ATelNeB
         A3bkKDFOX8qhmlZcZ+cfdh4Y5vq1k6FnYORzMccvaxIWg0TQ1ZQ370yHL6fP9piAKWi0
         iwpQ==
X-Forwarded-Encrypted: i=1; AL+hErF5IjBoYPnfEUip7k+7+OZF9HlzE7q9Zee1NGL61cX0dsdjRaxm3fVxb6XyiY651fZb12pxvTf7jWkQK9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gG1r49VLrG5JsaDhVK5PA4H09a9ZltCTDjJ1Rayv84Kirbdox
	KKkuLBOpc++hfCS/LbiKrvB+8Nvqo0etMrnoASkUUjOytmtRe6jCFKF0
X-Gm-Gg: AYBFou0a0SvPUY4rHhQ04f/rvDPAPdPnvJoWyzhtWx65RXl3bBGayjx2DcT4uD/HWnS
	zJnXKzLKdDwE7KjvIvUe89IKi8picNHFRV4OTR5IBySDxYAsnHJ0RIKnKdtEnPs93VN7W4IQKHa
	xccnNtDLz5Saahv9BiWsm1yN6C2Y/lcsyNA3ZyzAx7z+wXpXnmkN4Ek9QQXYQ4rDyMrp4iiDHHe
	5y++DQZi1WN3R/YC/MdF/EsKB9OtuopgToXUT9X+WrEViHz4MtaWYKXEi7BIP2bQMpbYOZhJkui
	UAfteTjiMgIE6tCyGHsg6JWKepfklSgS8Zg5TfbQowkfUPj9QEDCA7c0s7LPJtE2vOtIcV2kMOX
	3+J02FFdS7XVlHyowZQPaZuw9egLfb7+OrUfsM23gRA4oOtk7EysILleJy12+cd7/A7UeWDV2+n
	sbg6Zr1jiWx6fduEnLfajWTQfqgekFOp9F+EBMk0VSj0Dzhj6bATQOiO8vCMWMX8lsfvYbqtRM+
	DzvRea92MpbvM0s+t3PGY66u0EzsOfcZ36Tlc+vG6c/ADgn0ngC/HZtM7ux5EfoHOin2gfvZm0s
	NSnUZRMtKIfGvUrOc3DLQMRfbOGybco3+7ARRxs0wkPzbWX6PzRoAGpzASYGeXW9y9N5qDHiP3/
	xzzXvCwWVML+eaUafJiIZQcwNRplzGQISDXqvDp5aJo7/jvoXjCkvSfTIHhlQEzSWEGa8WFQp6v
	JsZB7ni5MCihng
X-Received: by 2002:a17:907:7b83:b0:c41:b4e4:7958 with SMTP id a640c23a62f3a-c5095dd7931mr810371866b.0.1794832730779;
        Mon, 16 Nov 2026 04:38:50 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b79d19sm408995966b.71.2026.11.16.04.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:38:49 -0800 (PST)
Date: Mon, 16 Nov 2026 15:38:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: atomisp: Remove unused get_sp_code_addr()
Message-ID: <avr5VoP2Xtc3Chpe@stanley.mountain>
References: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
 <20261116120703.6681-2-chaulagainavishek14@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116120703.6681-2-chaulagainavishek14@gmail.com>

On Mon, Nov 16, 2026 at 12:06:57PM +0000, Avishek Chaulagain wrote:
> get_sp_code_addr() has no callers anywhere in the tree. Remove the
> unused function and its declaration.
> 
> Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
> ---
>  .../atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h     | 1 -
>  .../staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c    | 5 -----
>  2 files changed, 6 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
> index 3cd69284f..e00308818 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
> +++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
> @@ -26,7 +26,6 @@ typedef struct {
>  } ia_css_spctrl_cfg;
>  
>  /* Get the code addr in DDR of SP */
> -ia_css_ptr get_sp_code_addr(sp_ID_t  sp_id);

Dangling comment.

regards,
dan carpenter

