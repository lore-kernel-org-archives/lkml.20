Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810674;
	b=4MdNXZhI1Mf6ewBZwj0Ft+5o5O18njwyce9khqX7+IrZ2++CgZeL523tZ53p3LViStzf
	 VGAxNvx2m6TQ1SrNrdNVy254tpMvZjMTL7mGdCMwtcC0G7wNP8Ys0Qtm/8qmOE81NQ6j2
	 SOpl2p0s/hpBXgJTcwlID9nfuT4sNVKbdfpp7TuoCUuD/th2cn/pQwG8K1kMb/a/0kdYV
	 QxK53+8ycZJr+c6/d2u6rcRzqVv6ZjN+qmhzlmbvfoAsiyZumYSoKiPDGIbl6Wst0xrdD
	 mw17e7vOX700ZNOM1qKLUix9Z6W0Ri1OofBApq0X1Mn5I90jlpfqIj64pKY02z+2NbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=v85/dxSKl2fjZlg4NNDW7kCAXPImgdYEhqBglpB1Uzc=;
	b=aHIYsXZ4mOVX2mBYWHffsrI18GU+UVXeLlxFrJorSmtuudkMYKSFiN+acXwDEvwvF4pc
	 uqLURm0MPOAAuLctOdtCo5HSrxvI0nxepPqhW+fF7bPbW7YQ0k2ecOvn4z0/lCNTOXdMT
	 W9wrdewgKnDVwrN/THKuDdGVZMBOM6EjauH1sZ9Mzct3IUB9pHfpAOkTsUNnrkLzGlMzI
	 dHceYMV+Jl3GLqHGwqoAoGq4iz++exlAe8nztpqyipgxbZRvlEbBgLg942/ewMUAPfUZx
	 M4/3t7Nc0szgczHvRJfnOc2luRESj8VPPUvOenvsj9VWoPr3a0XDBXGzTMy5rKnNhAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=G8i9hweE;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25D4606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D25D4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=G8i9hweE
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so2186605ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793810673; x=1794415473; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v85/dxSKl2fjZlg4NNDW7kCAXPImgdYEhqBglpB1Uzc=;
        b=G8i9hweEv60CP1G9mcCfOZy9YLt+NuQZcz1tPY8+2SRuWt9vdnKUaG9Nq9MMXDcw4w
         +3+aT7T1be68r8pVWQA/HSrQvgdd5OgkKJFaptkRZTnSOdxs5joe2KoKm3SjiSeI1Lz+
         /iXoeRdVzG2w8WO91j3BAK/2Y84OMDBtXn//32+21JJkMGC43JFetQndQ9l8zLDldcnU
         SSJ/iq3uI1FsuqQCQrnE2Gtltj2Y8X0lBE2R6OI/kvfWiD/yc22K6tlfVfFUveQ9Gbg1
         umtbb0VctW1l3mSnzrIcxdpMsDPMcdSPzkqmZy0/j7kTe3KWLsg+1jkS8EGzCebIuGOT
         bxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810673; x=1794415473;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v85/dxSKl2fjZlg4NNDW7kCAXPImgdYEhqBglpB1Uzc=;
        b=lJIQdDWHe+pMe4pFXbvK7Gxhv7SllZj8nnAVEFhQsUlWuEDY2sLg/b3/w6Xhq38yoz
         vhSe9g5KyrRedPYICBzeeb5k4BRABrwUC1sGOVUGBsjjMpNUtxPnsECle2GcJm1MOqZD
         7tUzu8obmRbC5VopjqspowSj26cKNAY3FCXuV87h1wGZrqi/n7W8+zT3PyGMMUHK0z8g
         NkjNXWyy6jltBIQ2dTbSopJpiXtKdxnZXN8S+BpHjKitqZzKimdO2ocivg/4vJri+JOO
         6a9vXvQYpI42nOaTBvcM3xagh32LZbVtLLjQt85m1+5X5kAjIzVdifsMPGUQg1uXpvih
         VVtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzJ/2EMFkjMricFh9GGhDqxHf2CEeDQ3/TRWeNI8WNBFZO4V3xKqgcnJhRLqRdnrb0Efg+K/KXhoO21wo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8sY+ZemhYV49d/EPyb/TIap5hizgu5k2Ln3yuH+x95fbwn91s
	UAN6xOUQNoAUMgJxSXdFbKLQpoDd+oUNFsexDMp8GS/O8B3FYmhtKYC4Jtr2q+aSxm8=
X-Gm-Gg: AYBFou2P05vTMuNTG8Fs53398HFp7wDLKbpaO/liG/ffyq74pv/d3kaFRkhtpfdNL9F
	Uc/PgboWDmhKeSwGRiRw64ICicVk2b3oFVjOlPMSUfsWqfwHtkVa/XIvGWvj/NwEm1dZ9qPv1iq
	tb5RSk/E8PhzYsirox6b+RqPJY6Rht9LFjHIjZz9pnUdzxIxsyEvzzB7dbPWv8r9uh7zH5a06Kd
	3SpFdme05kr6UmTKa81l0+qzjIV69OXpkfGB7vtR1TUn61TyNY7EzmfMiXKGCDL2iv176Icec1M
	4Pvv0ymyfRr5QPKaoGQTPyaWlklyaFjbcqetawLjUWiEyNiRoWrGpf9AmFzeEIBYFxn7+8Dvb0S
	IHB9vvtR31fOZtqVVJFHxxuuNT4Hu5l4AMysg8l6Egdif7gt6nN+Q9KDCYbOQuZJQxGfVQ+BKx3
	dQfAPK3ToMNwdHyeOpBVNOh/3UaTCMp/5ZfwJj0JQ4HaBag3K5GkqjcszqDl5fq5F7FfrbIsLJy
	Udv5Njj6yQVm1zetXKq623hbCs7MBhh/7cknW+g42IsY2cW7kljspiYR9hK5qQktgqgwyzXaAbm
	1lJlOmAWkGtHPvrghgFje0Y/EgeSanvLVuSopNEUj8EICkQl7dL/
X-Received: by 2002:a17:903:37c7:b0:2e9:cd03:b432 with SMTP id d9443c01a7336-2eb36501f0dmr158595375ad.60.1793810673005;
        Wed, 04 Nov 2026 08:44:33 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:bbc3:cdac:2cd9:7fc5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0910faaasm10192365ad.47.2026.11.04.08.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:44:32 -0800 (PST)
Date: Wed, 4 Nov 2026 10:44:30 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Message-ID: <autg7vGliR7-lH-V@p14s>
References: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
 <15d90126debc21c116c9e862a007afa4d81f704c.1793117996.git.u.kleine-koenig@baylibre.com>
 <auoAZs66RA5OYjJo@p14s>
 <auod0uYPow76TEb8@monoceros>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auod0uYPow76TEb8@monoceros>

On Tue, Nov 03, 2026 at 06:49:59PM +0100, Uwe Kleine-König wrote:
> Hello Mathieu,
> 
> On Tue, Nov 03, 2026 at 09:40:22AM -0600, Mathieu Poirier wrote:
> > On Tue, Oct 27, 2026 at 05:25:20PM +0100, Uwe Kleine-König wrote:
> > > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> > > index da3cddbe7d4c..3c749a39e5da 100644
> > > --- a/drivers/remoteproc/remoteproc_elf_loader.c
> > > +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> > > @@ -227,35 +227,45 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
> > >  			break;
> > >  		}
> > >  
> > > -		/* grab the kernel address for this device address */
> > > -		ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
> > > -		if (!ptr) {
> > > -			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> > > -				memsz);
> > > -			ret = -EINVAL;
> > > -			break;
> > > -		}
> > > +		if (rproc->ops->memcpy_tova) {
> > > +			ret = rproc->ops->memcpy_tova(rproc, da, elf_data + offset, filesz, memsz);
> > > +			if (ret) {
> > > +				dev_err(dev, "Failed to copy segment %d to device address 0x%llx: %pe\n",
> > > +					i, da, ERR_PTR(ret));
> > > +				break;
> > > +			}
> > 
> > I really like your patch, but I'm wondering why you decided to move
> > rproc_da_to_va() in ops->memcpy_tova().  Right now it is called in both path,
> > i.e with and without ops->memcpy_tova().  Wouldn't it be better to
> > unconditionally leave rproc_da_to_va() in rproc_elf_load_segments()?
> 
> The reason is that on ADI's SC846 the memory for the remote processor
> isn't directly accessible by Linux. So there is no virtual address for
> the given device address and thus the implementation of .memcpy_tova()
> on that machine won't use rproc_da_to_va(). 

That is a valid use case - please add something to that effect in the
changelog.

> 
> Best regards
> Uwe


