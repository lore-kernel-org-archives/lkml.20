Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE7E3EC684
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788498761; cv=pass; b=YMCMFEdQw5vN9WCcHi9BlqnGM7eaAswcejWLh9X83I59aywBB1DLwy1Acw6RfbkF+Oi3XSJO9hnhAU57zCd63JzoYZ4KbLh1R4oWk2diO5bQTvvLIxk+GvEYUEAS89q5BiOUJ45IoF1uiCb5nLw95VtjN7mtNYLr0zBf6Pc+yRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788498761; c=relaxed/simple;
	bh=6WveVFYX9QpyiA+QgSDLEf2RjnyJ7y5v4ciIKEpCkN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVbmLqDjp31PmQtIM52Ng9hql4Xt5bOHSCrCcf01VAb6asYGdnvpfuiV4tRzbZrqfOyTRgqZi7RCzK5jq6IwROyaryDsw26jZmYsfg9DXoxTjZrdgjEad2nh4dXFGS+bb9ozOlU1rXyJXmQapcpmd7CYqLZ3O5fUZwtAhhx9zsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mS+pVSU/; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mS+pVSU/"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-46adf49ff3dso362622fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 22:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788498758; cv=none;
        d=google.com; s=arc-20260327;
        b=lxWdI1sdxfxLflcX1dwiDFICOX34YE+ucwUnDFuQPoxH6oQgc9UBccl9p9qMwkanZN
         jBHXAmn0XTGO61Dt8tTiWEm9Grd/zjn6PogixpOvk5O3JnkfQdWIhNh1HWj7+bLjQcte
         bxYA7fiA4bSDPC1d1jxMSavJWmio8fpswaNAQWmBvVYI5EMdzex7oj+hpqlPprS3VB/E
         9aokGcC5dyEOfhKZc7HeqtVgzl7MCUw8ramujIFQ49dVDtqg7UL+Shgn5XXStuH+/Bas
         mDvE64qdjkK6s+1U0D78B3Ty8XGu5m6BuwZd1DjbJEFHnjYft4EGGLymIuPey/fmSXyX
         SuDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dxBBEpiO4i6retM/Nk4A5bzdXUX6zMxq9qRuaBUkcIs=;
        fh=7b2N4EqFy4WtBljhufsIgXoJdmBJ9r1FnP8Sx0pYo3Q=;
        b=QNWie+KIClZQhPfmoRYE8qMaeWQnzEhtrwSymyAADZLsNbCs//DwDvPzVuoNXLhNDX
         AVF0yKmUfkWh08YdR88iQrKP5tnhiqm0sbGFofswfyX+cic0qUCoGhpcvyP1BKrqUuNM
         FS8nkpQPyJTtptaOT5gy99ofL90JpYMhetIaAqK3zOtcGvg0Zb2BPUbGXi7iI2kWNjgQ
         J2uEQ0spZ7Pmh885I1FSHynTh0U9pyHgN86Owh5NAf4HkBIHUS61i0sLlYf7P9ZQKANf
         ZEmVe24pTaJsLk3zDnLzWuuvH2VRwWOlONwJZ0/3kmfBGhVPiXX2TBfSvisdmpuGRaMZ
         bwBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788498758; x=1789103558; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxBBEpiO4i6retM/Nk4A5bzdXUX6zMxq9qRuaBUkcIs=;
        b=mS+pVSU/UFZc0YC/eU5rRSWERtRgtYA/94QZJHdpN4fYlOJ/t5TejoiIBP9zgJXpH+
         L1yIwHo8863kLUTwBsguFy2A9emelDktw+kdR2MPGcKI4ETc4zIEywVt6S8Vp4tkQBEB
         LUFRcwavfIwfAOZjmHLViTpCN1vw9Jx6YQdeRD9JZbIf1wTZoPHS249gQGyiet9bnx2f
         AKWwB5gJP0HqgnhbKVDc1UzIJAtYst8sIvY9O9C4QC4uuCFUVWntN7ziGs+I+CSc5utp
         s/Z50lxD909UzUN8yfq6hnH65VAg9aD1XOpDVEYHqR0CzNZyhDREATzNNtIGApCof8I3
         BWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788498758; x=1789103558;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dxBBEpiO4i6retM/Nk4A5bzdXUX6zMxq9qRuaBUkcIs=;
        b=VD2zYjLoFxXhOXPtt8oMTdM3dMF2yW5uPoMIcqde367uMOJ8kgcCxOqC0U31xhceaD
         HBoWGJaLoLccX9zqGtDb2cHJjPLZ9TNknIGQNCDtuMSoKeCXQ5TjuzR2t5JI3NcVJaHd
         QPCAjdn1VBra1RWwzoUsnbey+Ps/Jgn8jRqFA9IO/DSRu3tuU0tZCs6dZFNrUTevm7mY
         +pLdI7pI+q1WYfXATn1o4fhrYCpVbDG6ggcddLkFkhj2Vu+dYEyTxq8mq2GhpwhlKA/E
         +TfEgjBTVf8L9L7ai9wYMLP6HfK72IT3cvOaqB3hYiRYSvWgAefHiv/INg2aOgiE3jNZ
         Tvqg==
X-Forwarded-Encrypted: i=1; AKwUvBxR0d9q6v2Z05jjEFH180OPd+EAXvY+nSCVJPEPyWdiD3CClrxfxvcvE0xyySRT3+gOSSjcXZ7VatfBYz8=@vger.kernel.org
X-Gm-Message-State: AFuF++mJvgi7qJ5KALvBtIPiTwAIr/vKtub49iBMfwqPLd+laiZSJ11U
	YOnR27WwQEqgxvlSdrUpjiGlplnsf+pUEXG+/nZ58MIiVTQizCZBbPxKInbKLNDFF/Tb4i7roy+
	3Y9CWA2udZhCkdHRX2ejgDPrV627aWtQkmJGCIofbhA==
X-Gm-Gg: AYBFou0/p/TWHwVpvB3u5cZoGyxR+Z/V0vUidiE6IBrSI0mIrTmkRTyWBS45JPLzFM0
	cqf3SeRTjANmwN66ZgHh1O1f59AbA4BnevQpL2ES3dTb9VwvK4/8+eGUKyRiX4EcEQtNxxIRR59
	MSPT1+hmGbMN0CN7X07nTCI4dz3td+QUhZ+67ylSYB/J2a9m4uXihE0VDGTd/af5VNdzPCEYPah
	9kCpEuIddHMTeZIPCM2Jf++hopbsGy+iJ+ryB4V/8727JrLrh2w58rqN5HopX3WhYRO4rfvb27N
	7T66/fJSc98sLZi2Zz1G41sFOFUn776D9DZWIuwl0DiT7pZ4AwQodF/1bDGQA/X6JERtBYt3JiR
	T/w==
X-Received: by 2002:a05:6820:81d8:b0:6b1:3db9:b758 with SMTP id
 006d021491bc7-6b6fb3d2f3emr2725515eaf.9.1788498758385; Thu, 03 Sep 2026
 22:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902050127.3767049-1-rafad900@gmail.com> <b99e8d15-9031-4d77-b1c1-2bd8cce6013e@rowland.harvard.edu>
 <CALp66yF0MZy9UKo_qGGeekxV0RNMNKZ_foqADVnqg+_YgEYqEA@mail.gmail.com> <de10753c-7504-4b55-b08b-cc8b91cd6711@rowland.harvard.edu>
In-Reply-To: <de10753c-7504-4b55-b08b-cc8b91cd6711@rowland.harvard.edu>
From: =?UTF-8?Q?Rafael_Alejandro_D=C3=ADaz_Cruz?= <rafad900@gmail.com>
Date: Thu, 3 Sep 2026 22:12:27 -0700
X-Gm-Features: AcwNN1WSMUq078TpF_DMpnvROz7RxjYdfagzJv4R9tDA_b0yZyXK_kH6J5oLoVI
Message-ID: <CALp66yHc7e7QYxNhKy_zMHe7gV=KrCexu0vB+AuStCWOM3D8hg@mail.gmail.com>
Subject: Re: [PATCH usb-next v1] USB: gadget: Fix UAF in gadgetfs_fill_super()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Which changes? Currently I'm on the new v1 and all I would do
is remove the top paragraph you said was unnecessary. Or do
you mean add the "Reviewed-by" tag that you added? (Thanks btw!)

I'm not sure either about adding it below the "---" line.
I haven't done that before....

I saw an example from some other patches and I guess I would
do the following:

 20 Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
 21 Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
 22 Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
 23 ---                                                      // ADD
THE PART BETWEEN THE "---" ?
 24 v2
 25 - Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
 26 ---
 27  drivers/usb/gadget/legacy/inode.c | 1 +
 28  1 file changed, 1 insertion(+)
 29
 30 diff --git a/drivers/usb

Is this correct?
