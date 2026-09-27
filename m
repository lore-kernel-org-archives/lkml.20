Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF179192B75
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 04:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790481630; cv=pass; b=CGOFiOT0okwSHwXlPqsWxGINt688vXCdSlOg0k7ZU63CybP2WJTIu+ukYBnvrWgv1OmJCRTEY5DEEPN8pZ/tpx8m7QrDGzeozuPFIOR6mDeSDkeVkqjLpsy39/mSyq7qicHcq3arAkyCDV4v5DLt+6ZXuKdDY62P15oGzp9rbgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790481630; c=relaxed/simple;
	bh=6VYfJ/iFF1s4RUDgb9ifvA9/YVQJniqLL6iBbH5T2DU=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJAterP/SALP4v+aPReaXXeccf1IwtvYg7tPBj2Tz+GU9u6WUTK8OlSRzIor+aeCFOfOQ9cqHr9qZalkvEKvtfcmqI75txhvcUBkucuz1mYx2jVfDASQzmRtws7hYz67ujjbsfgBlQdEKYImL4EOtmQM50GNQjJmH7fhxWdC0j0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3+HRKae; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3+HRKae"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43ac8d1eso16645707b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790481628; cv=none;
        d=google.com; s=arc-20260327;
        b=RWxjGaUi+aUkU3gqBmeiGNYokKYaHsG7gQyWKlDWxDsYjZ9g4ke0sHlM+mtcRQkgs2
         MFJl+CljbvozqMRajT/X2N74jx6n3kdN1DQE0G+LMnGzW9qYcxHEzpocs0Owh70ODwqF
         uGMQWZeB02q+hZwvmt8PU5MGRumnR6maUooCOPlke4EsC1I0SHqARqsUBuxpytrWDwGd
         +EY+sBaDNGsLnL1Bk8BsFO/oTwHfSGRoAcfvRey6qx4f6ll4aapUcvF0nwEMC0APPW1s
         gOf6r8TX7A7gWW6MwYc8tMm2H5WBciRudWSS2bXa0U3sDEdoV/qkuwQxRYkcrOUkH/3m
         62Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=xyNkhCgiiUIkRXYcRuY9lu1z6GloesYU3Yt8pS3/Dhc=;
        fh=XFFFLkuJMIdBLZeifXNtjfsdMzC3dCGMlp70y2b2Hmw=;
        b=aH2vMV4UAiea7HB4EhhS2+fDbMukxxy50666US7YIrnAWv1if+GcMi5WiaMwQ/Dijg
         U6FlQZSRmLIjZdCU0fu0I1fNVhRXh+uRq7560iVxR33/JmUePgvUDc/7bLQ20hDHoso7
         IncVIYgTSjaJTxrllTw4LcjH2D5ea7B7ezg+/nhZPRkAiHD9lUispLUcHuW/Xjr2+EIr
         htwKvHmEsfPOUvKAFSAIwJXr/Nki2gvZX1JKUEBEQNHSroZMCoRvP+Or8tejf35NCKSV
         woD/89Dn+KIfj71ZQOyIF1SgBnWgIPFAM41ffOY4kGZgdz6RkGxfORUd7nCbhKANAYPt
         KS0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790481628; x=1791086428; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xyNkhCgiiUIkRXYcRuY9lu1z6GloesYU3Yt8pS3/Dhc=;
        b=V3+HRKaeVgoyJVjL18rrG4QuEgRpBNRNN2k3IPBhIw6IfAF7nYQQVOuwHIQzqd40Tw
         hyQv3D9hCWUiCuuHmc9w11zL7b8bx9Bbso814xTLfja4AP2RrYaqb9P7ljZaEyQJ/PUY
         DlbT5dGQ9Uz/ZJF6CY6S19Qc8o37DYZpOKsxREwxbvkooy3HrcS9a7dl/27wsCKV9bXU
         sxybEz3rOvKzF01Hx1wI+cIocXEWY+QY0BmOVjcJtYsU4EItHAQnR8OI+BDDSAx6hkNJ
         AF/o4q/Fffrj2P+R3jAiYrqWD1hFEy/ZfCQQ0Q1CmVrmGiBlB3QCKMKXkw366q9NvA4P
         U7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790481628; x=1791086428;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xyNkhCgiiUIkRXYcRuY9lu1z6GloesYU3Yt8pS3/Dhc=;
        b=QeSvlvHzmNMcvKZDnltqtJsOdlDsE9pnSEg9A9ANgEpA26auVUNotsrX7MGcbCnyRY
         NrJ/3g2wKMkFVtrDkYPvzoP3fLMAINFywMhCf17eKvswFBUJ9NFja6RSNLUNZsnzKloB
         mym4QePqUNQ612zDYCQGzsbIZje/lkDyoouWIx7aIgeOp/bGZ7yT4B9XUGkvhVIepjAa
         TBkZZ/mujh7GdvR8ra8DxntjzA1aLrwmSESsn8m1otTBAVfLPG9R6bRkbRVhiv2BpKEl
         pehObmOQHleEJuTpbRuzd5i9LW7H+k9UHR/XJYbM81c338UKKl0Fdm+miNBX9h1ivzpd
         q+bw==
X-Forwarded-Encrypted: i=1; AKwUvBynlG849XJ1FFVjshNM7YNA9t9M/Cmweov6BZGogSoVCNvcRgJXHLVRTPFpc1++B8u0X4AXsMAN40cG+4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+S+Ciy0wiRaScza+6aqnZso+1YmydPaEaRCgiR8I7QQy0qRDD
	ZVx1YNACXo1fJ1dphzxMbAzxxlnwjAg23g2mrLMTGHxlXadVcm6koxdni/0GY9GdG7X/pdFju78
	0sACddn6mpc0FHQrlkvosVwQeDv3KeZ4=
X-Gm-Gg: AYBFou0VidQ8GwTu5V7j496SaAUx/gjl6Zx5aNTWmgqxY/rMpkYuH1lN0wgoA9lF7zg
	qjeDWPeuP/3z2TGo3keoLNXIuTytN11O9OrX8b+1ROQ+FY8ROYui7Y8z6V5S6YTLoVoBvAkEO2M
	MU/rXspXsC6m02Jq30QL2ITIia7kMA9cTIG8O3QGFItoCrcp8QpGcT07NU297Yr9YxOxOxvrNI5
	evYYa0mK68FGO96FIfvcSCt97Hmds2mDbVaOnKw9aobDuzDc3MhEl8gBEpZsi6U7y2Jwz4Z4ewy
	RzV798O2Vn9GGP+tNdIexu9DaLwGKQDGxi5br6vwlphMvulgh6klY/rLW0UM15/qSI5wsOLpePx
	Es6kBXREWxK5Y4NjLPxn0/ZTU9OTaVvYuy1WQ5/7QRT3+KjB66ZVqxJrF3e66LBj2b7BwDIYgRB
	ZW+qFK/8Dlf7oSFG0ToWI=
X-Received: by 2002:a05:690c:6d82:b0:873:5c0f:28c with SMTP id
 00721157ae682-8a64be54149mr54815777b3.54.1790481627796; Sat, 26 Sep 2026
 21:00:27 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 26 Sep 2026 21:00:25 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 26 Sep 2026 21:00:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <96eedd54-7d2d-49a8-97a4-44342460c9fc@linuxfoundation.org>
References: <CA+Z0x2JTGOsnu7gNPWBfxCZD0vesbezJ7-yhT1sOOuUdmdcQRQ@mail.gmail.com>
 <CA+Z0x2+wLqeT84WGYsWQ1bPu1mz_A72_Ka3vv9u6RHdtQvc_Xg@mail.gmail.com> <96eedd54-7d2d-49a8-97a4-44342460c9fc@linuxfoundation.org>
From: Jason Colapietro <jasoncola1@gmail.com>
Date: Sat, 26 Sep 2026 21:00:25 -0700
X-Gm-Features: AclHuK-qq7ZroknohQuLiTUxmgTMYcUwu4Pqb5flHoGK3deX0Cb6IkP0dtbLjic
Message-ID: <CA+Z0x2KoEghFkYKmXckq3ezLo5bvgHJ7yG=JqjHu6Ga3t1wuew@mail.gmail.com>
Subject: Re: [PATCH v7] usbip: make remote list honor parsable output
To: Shuah Khan <skhan@linuxfoundation.org>, shuah@kernel.org, 
	valentina.manea.m@gmail.com
Cc: greg@kroah.com, i@zenithal.me, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shuah and all,

The exact v7 patch has now been built and tested with a native Linux
USB/IP stack.

Test setup: Alpine Linux 3.23.4 on aarch64, kernel 6.18.53-0-lts,
usbip-utils 2.0. A QEMU USB mass-storage device (46f4:0001, busid 2-1)
was bound to usbip-host and exported by usbipd. The client connected
to 127.0.0.1:3240.

With the unpatched client, "usbip list -p -r 127.0.0.1" still printed
the human-readable "Exportable USB devices" report, reproducing the
bug. With the v7 client, the same command returned:

    busid=2-1#usbid=46f4:0001#

"usbip list -r 127.0.0.1" retained its human-readable output,
including the device path and interface details. After unbinding the
device, the parsable command exited successfully with zero bytes on
stdout; rebinding restored the record.

I also attached busid 2-1 through the v7 client. "usbip port" showed
it imported through vhci_hcd at port 08, and lsusb showed the device
on both the original and virtual host buses. Detach succeeded, leaving
no imported port. The build, list, attach, and detach commands all
exited successfully.

This was one Linux VM with an emulated USB device and TCP loopback. I
have not tested physical USB hardware or two separate machines. The
existing option-order behavior is unchanged: -p must precede -r.

Thanks,
Jason

On Wed, 23 Sep 2026 02:44:58 -0600, Shuah Khan
<skhan@linuxfoundation.org> wrote:
> On 9/14/26 11:43, Jason Colapietro wrote:
> > Hi all,
> >
> > Friendly ping on v7, sent September 7. The code remains identical to
> > v6; v7 only corrected the Assisted-by trailer format. Please let me
> > know if any further changes or native Linux/USB-IP testing would help
> > move this forward.
> >
>
> Sorry. It is important to test end to end on a Linux machine to verify
> patches. I can't accept patches that aren't tested on macOS - it just
> doesn't make sense to do so.
>
> thanks,
> -- Shuah
