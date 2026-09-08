Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573D1396D14
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867051; cv=none; b=r/eykb6YziOofyLKqI/trBpBCjSUVF2Cym/Cn12oetekldz/JhjxkPwZL9lX0G2kIoAa2mRbL73feSgn/7nbmVE8j/hWa9J5G8vhxEJenaaoPuJoce2wEqyTapQvC013mhJdztiNfgPHwOovTCh5ozCY4cpf0ue5cp9ZaQf7yp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867051; c=relaxed/simple;
	bh=31c0r96KNwxH60URkYG/Dq8KPtohqhJi7zlAxQBZBzw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S+EfWu/o5tIZV1Ba1a/1R+oapqCfCPPbKF/ARSmQYYwevgylih2F/4sCpXkyW/D94jRj/Db7TeQTxjdm1UZO+DyDuRgls6hMXxYybRqM1je4OsrtuhUto9SnxFlpl9nsobC38rUU5upqbGTFiyxYnCVHS7665oOt3oGANOo+aT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXkJi3CF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXkJi3CF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso39860615e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788867036; x=1789471836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0b12Cm5Gb+b1IM+WblZsuohOBmH8KyzuDASigLWND6Y=;
        b=RXkJi3CF5EKXr4Jk+Ckn41CPDahCn/gNYouc84Y5W6Z3zdTy3Ap+qx1+qzXYQ6BrOm
         6mH0AgChsnzIkc2EDOBx6JvrzAiIT5z6y3o9JPPHpkPzXhX+AQqPY+r+y8xBdADfv+wg
         UnSlFv2Vt4NqqLAtTFRYCsdOLgQwHC4Ga95ndGnJ/BbAMC53RmGWfn+BNwOTewLWy9GF
         n3LoHz30jGZO4b7GN0V20tbkKiNHKpkm/mVALHdTicBEF+bNeVLAfkBZYop0sZ/o2lo4
         MX70uvuFQLHQsRG/mT8fjGgl+IyphDiqLlEGIvgzXRN44pd3JjAIvAo9lDKJ0for0tWx
         2YZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788867037; x=1789471837;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0b12Cm5Gb+b1IM+WblZsuohOBmH8KyzuDASigLWND6Y=;
        b=SCLLHJ/lyYntbIqsLrErfnuB8OJo7WI+1yz/LngJ5f+B0axbT+hj0p9xo17wMazMem
         GB0RVLc0zuCGYVr1tWafJvaXLqgFy35ZNW4SgMWk9jTbcxJOSKpyR6sOztHrouVrnQt8
         hmMw5ne9pIHetRgMxm6GqafI7Re+Ip05+yhdxixdKXWsTjtP4DtHtiX4f2Lx6AZLZkxu
         4KuunHtWdDF1srmUrqu8LhFoHv9euDgA4ZttUNJRTxp9XBRlBRT1xHi16lfG6Aq8f6av
         hdta3Z9DcI9atYZiz6mSCI/dvvey9RR4hiWrZDAAr+cbVAYM9ZdJ6ME5v/zoYXOoXQRp
         uAkA==
X-Forwarded-Encrypted: i=1; AKwUvByCiTa/+uJSUe3ZaGenvpnc/7Lm8RqNz5RxhWEwxc6557JAmzVuffWNgQLDky7fmsV4ScnokwTOHdWZIp4=@vger.kernel.org
X-Gm-Message-State: AFuF++k7Y2kxMjzq4WdRzmqnx5yjWIxvk50cPuqOE1DizT28GCr02IQL
	gg6GAVt7iHpm85LjskmlP63Vmu0ISk0oC13qpKtnmtAOIkUtjI/uLjcXFpp0EEDD
X-Gm-Gg: AYBFou2Nj11lt27Ztm+m8uzIMuOW4egUzlAhl384gDkItd36WSFeneB/7clGYpX+7Nt
	KjQWAYSedMb7VIp9OXC1YrNWXcH767gkd18+cqYTMHQ855jopxFqTmDqsN1UmV/WF87pJNiBv3F
	C+MT/yDpVacvdFrJk8OfypNuSso9V4iQ6IPUB7AhN4LoKy1zkCuXmxGxGZjJ8e1gFNgDWG2ttsC
	RhPwWbzHYrEoVPrTKuWJy42V2LhRykymUZxmgpbe7PKj8s9wvTGLV3V0Vwz5/ufHnbJq6XEmy9B
	1zKWiLchJu/FoCJYvyJc10fk0xQqDUSSBuHciKMaHtEV2DAHm1vLuLqExIXI3krOaPaj+w7sRzi
	+3IXeqKK7zP28AWvgkTFasyeN+DX61w+prbh45gBzkZurY3LaG107yAYxDCG5B5vphG3LgKZe+d
	O1eTShisr765ORnoEVo+aOGLqsYLlWOJYFV8JwzDM6ZiAJd4zdjG5AkshMaI2S8dS5bfBlgm1A6
	3M7CDy3Id/lP6fsLYGyT25Z6L3gpJXkZMj1L41Jd1N7+bvmVESqTKOVRTZyuFgmhnKPDDabIMr1
	2sAnqifkkS18iNUDGNdK7BSTz1/tTtRW6fUtCBkt7fEjzbc2GXWR1XHb+iS7AgbT4qJvfrzLwwz
	TWKJZUHQjVvgcMvEksbXvyafcVsuuNGx303Ub9ovi/2PiDOGAJIVUndthNsP4JS7//evpIA==
X-Received: by 2002:a05:600c:1c23:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49cf820a8e3mr314405825e9.3.1788867036409;
        Tue, 08 Sep 2026 04:30:36 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4761dd1sm331050675e9.0.2026.09.08.04.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:30:36 -0700 (PDT)
Date: Tue, 8 Sep 2026 13:30:33 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org,
 syzbot+59d5e6a8ed04e6a000c8@syzkaller.appspotmail.com
Subject: Re: [PATCH] nfc: nfcmrvl: fix null pointer dereference in
 nfcmrvl_bulk_complete
Message-ID: <20260908133033.000037c5@gmail.com>
In-Reply-To: <20260831104110.1307-1-joshua.crofts1@gmail.com>
References: <20260831104110.1307-1-joshua.crofts1@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 10:41:10 +0000
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> A race condition in the current implementation can cause a null pointer
> dereference. When nfcmrvl_nci_register_dev() calls nci_register_device(),
> the NCI device is immediately exposed to userspace. If userspace brings
> up the device before probe() finishes assigning drv_data->priv,
> submitted bulk URBs can complete while priv is still NULL.
> 
> Additionally, nfcmrvl_bulk_complete() incorrectly checked
> NFCMRVL_NCI_RUNNING on drv_data->flags instead of drv_data->priv->flags.
> 
> Fix this by adding a NULL check and testing NFCMRVL_NCI_RUNNING on
> drv_data->priv->flags before processing the completed URB.
> 
> Fixes: f26e30cc6b50 ("NFC: nfcmrvl: Initial commit for Marvell NFC driver")
> Reported-by: syzbot+59d5e6a8ed04e6a000c8@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=59d5e6a8ed04e6a000c8
> Tested-by: syzbot+59d5e6a8ed04e6a000c8@syzkaller.appspotmail.com
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
>  drivers/nfc/nfcmrvl/usb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
> index c7f2afe00b93..c22d783718fe 100644
> --- a/drivers/nfc/nfcmrvl/usb.c
> +++ b/drivers/nfc/nfcmrvl/usb.c
> @@ -61,7 +61,7 @@ static void nfcmrvl_bulk_complete(struct urb *urb)
>  	dev_dbg(&drv_data->udev->dev, "urb %p status %d count %d\n",
>  		urb, urb->status, urb->actual_length);
>  
> -	if (!test_bit(NFCMRVL_NCI_RUNNING, &drv_data->flags))
> +	if (!drv_data->priv || !test_bit(NFCMRVL_NCI_RUNNING, &drv_data->priv->flags))
>  		return;
>  
>  	if (!urb->status) {

Hi David,

gentle ping on this patch.

-- 
Kind regards,
Joshua Crofts
