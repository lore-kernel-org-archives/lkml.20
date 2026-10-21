Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792567563;
	b=3hSsdx3/vAvXDwKcC/eNLoC/3fNNXQJbTMk5/KAU3H64gZte0aZeIL9G+SB8zHJgJLRk
	 5JqtCIlbCIABLLeIc6s9l1oiWRfvDAeJ/Jzqj6DyAm2YAn8An4lwcdSGydmeXmsfX3nXN
	 huDImXOjXYlK41xpZ8ykZLpiEG9k5yQpqs6YCzm6dQvWqzw69pkgTZUx6N+gf7ZmqXJ/5
	 jQShvy0MmIRmJmiVmqEGYTfzfqafRReTgZuwPLe5DRty5EV7azuctLde/U5aXLXZqxKWO
	 cwIEd73v7AQHiLl58wUVz37Dr9W0HUy+9pOnmo2JGWhQNLu7jAHu3i3p1r5WKl06KPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792567563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6NK+Pu6Mo2Qewcl8SZlZRwKFnzkox4FNAGBJWGVjKm4=;
	b=Bs03GRtpyBPH/ffvmGA6q7ZU8JwV0wtJJjM2POkVZEv1KZTvFbiUhpVWLKkWZv0ArVl7
	 bNVsEIWwm53dxWaaFPTjX+qMnSOI3gKcTX/ANaKRDojkgIOEeCNMsZ5VseH+Wde59/TTG
	 NWFIaPghN4EM0rh90wb6iEqn+DQr5SwuYVmUWY888z49xXAzA/AkttCRvKr8b6SZMXC0D
	 YxP0BV1lS8cPb0JXR3ccoAsfCbhkiuRZOO48uAV1qYqrNsYhOW+KngclVC42wyd0l5s05
	 BP71m1rzMBCz4CWRSwntYdx0ILmbaSLIXBrFMaFSyZ+a32B5Q6zot4f9ZJR71l1At+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Im59a3l4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFF3606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BFF3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Im59a3l4
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4d870d54so244356f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792567562; cv=none;
        d=google.com; s=arc-20260327;
        b=lvYnPorEkd4o2uOQu+ZhZx8FLM5Xe7Jk+FRHkJWRMr7wXSJQ6BpbjrypSjvOEYAn5T
         92Dj9G254yYy1jUPd7QRaf2omzIXUfwjIWqIefjxI+yc+AZtlsADCBFWj66b5nLTairO
         uWX78rlqSrG7eFw8Y91X/TM24uGbwtwGWHEcvpJRvg+yMVSnIEtz9WmVuNt9O5P6S6oi
         XyJao2QCECrN2SYO0186ZDgI48o7JAD+dwdZwgakp946OvomltmFY4KI/aZ6WPl9zW6N
         Hmso+40Tl2wLlz8wg2nxT8Z31v5XOKdtclAA0TDvg+KOUKqXpIslozD92mb9FND/w06Y
         m6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6NK+Pu6Mo2Qewcl8SZlZRwKFnzkox4FNAGBJWGVjKm4=;
        fh=YOZZyaxo0uIH/S8ua+4CR7lnN6Ic4lcEW0FfKc26K/A=;
        b=ji/4GGfA+Srv9jS4yWLJumLorYe2sq3g3AS0kgnjBpeohU4lqF+Zfsd/pXAJy+SAM5
         Lb+Yr2HBufCYSMR4BonlDvfsaGcEQLGFspRcF26c7RMmQ0pPE6cQHHwf8+dgSeFzGAJ6
         hHL7ZqUswOh905AtLGYshwgWet3kOhC3mOtXdjVXHWQAAlb/RUllM24tViXYhR8ftlI4
         sMTwG2E5PSDBDbBrbttjWT4on+CTWAnVKjz5PaB2vu1wgcYuAFYVjEIwrd105wmFevtY
         fp/mDiqtcZu7o2psUgl2+8YEFsF4YWjf8vBBUTe3U/N5dqLZ+mvk+jDkw4snSuzlabPV
         FsDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792567562; x=1793172362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6NK+Pu6Mo2Qewcl8SZlZRwKFnzkox4FNAGBJWGVjKm4=;
        b=Im59a3l4DJYrtkXUTuv+8s3bZ0QE4tY64ScU4JwS5igTlyja2GRz5l1EcfbJkYSLXY
         UJlVmHV8nLZyNz+Y8Q30sN8LHCsAnQ211G3rTFBjSqbHxg4FMhC9EB8J3Imsb2013Yjj
         VW4se7FTDsZb9JTmvFxaDEhHv6KH3B0KfDmcgx3cb4YUHQHk2l7D/C5uPzp4eZdRC9wZ
         7XoM9Rc57XS2V42yXc3NCuQ9rAo2L1f10vM91wn7eH7UBnbYQ88k390aL8Yb9NvQBMkK
         XzovV9wnCg8UOIGVykobsEGexO1Qn9+Kb4AkuQM5KKlIBfuFnYkvx8VdylsQ0SVDFl08
         lGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792567562; x=1793172362;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6NK+Pu6Mo2Qewcl8SZlZRwKFnzkox4FNAGBJWGVjKm4=;
        b=m4i9cr3HeLFRvXBN3iuIVx3XBc5bpZ9c8XjXCbk+LntuGVO4nFWGvVUsX308KFP7nj
         1Pl1RFwy7hyUwtN9T4qqmokGCxY/KL7n1bid94hc1bw4HjuSSmddAW6mgSHEXWFIq5KQ
         9QLch/pg0/tFjZdPRQYCqSGRg7ih2yPFibFsQAQ/sBWeCSKaBrDXix1ta15N6ke5pDz0
         GopfRT+U0iW5bchH/sCD/kHMPKgvgHHjyuGTiVAP/Y3K0RtSbOIcb+3T3zb3Xfr+rHiJ
         Lk4uW9VyHa6LRswCJTEj8ZqLVX0cP+qSFi1piV5Xlmm8nz4Wkgt7nehTrRUyVtNuF13W
         GptQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZpTcQ68e0AW2xcELseQy8/Q0/DLrsypmQpQo0SA19INFJQeuMYjZhZ/fbwq2S+VNbq8JZS/HchqPuUfI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpiGBKWtgmeJRJaCWOxNDhWORloICTf8iXayFhuO3KlyaMwNn2
	JH5ldAWFOSzSUvBymObHT0amOx75nVHarsVc0V11VV+q6PatjwWtAFMxtpe1ywuPcI9Ka0xrKjR
	DW2qc5uAB+7QpJwRTTfowfIzGzpxQ7Hs=
X-Gm-Gg: AYBFou199v6uJ2JSd3NLvpO7DCFeZeaBEy754Op9pz/v6YerqiKJI2nlvVwu5khsv+g
	to7BApQsH7XaMzC+45FGmQKteesosHSpZIuRv7+LjxQZK6zX2fQ+Luw38/LuDfe6A5ONgAhLaXk
	7FOVwLdKG3ATgo1C1O7C3KnUWUMG5ZeV0mmKjzkc5Qs/T2orCb+S6RxOv15PPJJFSR0LgHyjIQ5
	2WThYDfRKB0lNL4tjlJim6strj6m007AcdSLrsnnw2pEQ1r0vocOnohI4Kry+IlihRCBmKV9WG+
	gwO08VHw8ieUygdGSfUopLGCLubTzyrETduo0CFsaMpoK1hKaTMlFgF1rL+SizDam62ehv6b9p4
	FUqWHsii3HD2wkMAToqv0XgOLGsdGgbOb9NdA
X-Received: by 2002:a05:6000:2612:b0:48b:efb:4a66 with SMTP id
 ffacd0b85a97d-48e2641ddf2mr2067966f8f.6.1792567561509; Wed, 21 Oct 2026
 00:26:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013132033.4352-1-jun85566@gmail.com> <2026101310-crier-december-be03@gregkh>
In-Reply-To: <2026101310-crier-december-be03@gregkh>
From: Jun <jun85566@gmail.com>
Date: Wed, 21 Oct 2026 16:25:50 +0900
X-Gm-Features: AclHuK_5zzb9An2pyb1TF4wk3TZKJmT2QuQ5H9SZ4O5kutNbDUL7VIV13Fjrzho
Message-ID: <CAJ_OVWRUPXdpyGjLVp0LK9kMPRmWJKFmHAujO=S5cby5VnRv=Q@mail.gmail.com>
Subject: Re: [PATCH] usb-storage: option_ms: bound probe-time bulk transfers
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stern@rowland.harvard.edu, digidietze@draisberghof.de, 
	xiehongyu1@kylinos.cn, linux-usb@vger.kernel.org, 
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, 
	syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> So a broken device?

Yes, effectively. The reproducer emulates a USB device that completes
enumeration but does not respond to the subsequent bulk OUT transfer.
Without a timeout, the hub worker remains blocked while holding the
device mutex, preventing other operations such as usb_device_read()
from proceeding.

> That feels very long, are you sure that works well?

I've reduced the timeout to 5 seconds, using usb_modeswitch's 3
seconds timeout for similar bulk transfers as a reference, with some
additional margin.
I retested with the syzkaller reproducer under QEMU, and
initialization now proceeds after 5 seconds instead of 30.

> This should go below the --- line and is why sashiko is confused.

Thank you, I'll move the dependency note below the --- line

> No blank line above here is needed.

I'll remove the extra blank line.

Thanks for your review. I'll send v2 with these changes.

Lee Yongjun


2026=EB=85=84 10=EC=9B=94 14=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 1:18, =
Greg KH <gregkh@linuxfoundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Tue, Oct 13, 2026 at 10:20:33PM +0900, Lee Yongjun wrote:
> > The Option device initialization path issues bulk transfers
> > without a timeout. If a device does not complete a transfer,
> > the USB hub worker can remain blocked while holding the device
> > mutex, causing usb_device_read() to hang.
>
> So a broken device?
>
> > Use the timeout-aware bulk transfer helper for the transfers
> > in option_inquiry() and option_rezero(). This bounds the wait
> > for each probe-time transfer to 30 seconds.
>
> That feels very long, are you sure that works well?
>
> > Tested with the syzbot C reproducer under QEMU/KVM. The
> > patched kernel repeatedly completed USB device initialization
> > attempts after approximately 30 seconds without triggering
> > the previously observed hung-task warning.
> >
> > This patch depends on Hongyu Xie's pending v3 series:
> > https://lore.kernel.org/r/20261001123135.38831-1-xy521521@gmail.com/
>
> This should go below the --- line and is why sashiko is confused.
>
> > Fixes: 32ebbe7b6ad4 ("USB: usb-storage: add filter to "option_ms" to le=
ave unrecognized devices alone")
> > Reported-by: syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D7317196294d50d6e55c3
> > Assisted-by: LLM
> >
> > Signed-off-by: Lee Yongjun <jun85566@gmail.com>
>
> No blank line above here is needed.
>
> thanks,
>
> greg k-h
