Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793046024;
	b=2TnnYm0aF+aHgamWFMpkf0E5t4HCrIs9XP9zMThlSAkDq+SjK4mana1Zo0f2UJ6v8baZ
	 qk1KFgUWZcdpSO0CWfKKFC1yFM40j9RmQLIxO1MYNayff4hxuxMacH1s0A/x+SBlUP3bx
	 GfIA/wUgHMZpPFIJdiMcnVSS2CM+P/1CwHvr4x//Gm+NCqcPGR7FZC4W++KlJvEt5Otvc
	 /Tn7xtzNh9Wi+/ThhpAAaUku7qeGc36C5SRRbGmovjvyRnZPNLBAZuzxxRtwHkJoWqX4C
	 PtFmNF5Mw0vgxAl4mCzmJ3mL2sZzY0j+IKTSz2YzqCocBPWzEkewrS9kkyjBT1Pi+0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tiqrTwHchu5NQ4MCw4tFVhQh0jairqrYOuJxWycQiL8=;
	b=BOKSdu2VVOzsijQmUQahSeObql0ezpfnW251NvoqZhm4RFvAdFIzWoMY7PsffRot2DRh
	 i5I0eAoSoGYVlfHRdJ9M1LdHn1QnleqtAUkHBjLj9gxAsI6sI1TI7ebzPFrGifAwHAi5G
	 qAHgJRJxHWzL7RBXW6t9GVgimqaZ5Te2WXvdiJjXzFVexA6tJeSXBOpUWTeZPjDLSm4NE
	 f634wcEUwzixKUHFguLlqB/Z5GB04CUBN9qkJn0IdoeyNKcPb3+JURJork9ZCb/OTv5t4
	 y2ekHRa64gCvpYLYIFwpsoWSNwt0gIouV1mrvufQzZf7WCse8RjizLmn4fALvVZbRcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A7p01nvB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01785606A337
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01785606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A7p01nvB
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so573462eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:20:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793046023; cv=none;
        d=google.com; s=arc-20260327;
        b=JhfV0NtK/R6x630mGpGFp3WDfP9x83h4luz7AR5PcdE+gmDNeFsmIQDiyyma72BJXG
         lqbMduXEEHWQVRdyYf3O67X5XR/GMS8SrN3fJoOu506MwiFrdPDJCRyUC0RMZAa6k8+r
         9PDHgVMSYvwqrHEuKhhh7KPiQkKctPlnU1x2EwqkUpugbjqIDT/F9jNPQf+f9ttezztC
         /8jqKgCgUAmJLYeU8B9sFU2ri+Lj/DwnejHYiM5gwtwsRH4aZ5Tj/JNr6DoFWR3LgMSs
         iHvq9eT0auW705bVW68ydki0iQylG4Fs6y5UT9tFpwzDf45FF+Bc7kw4SqRFO9y74lMt
         FfKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tiqrTwHchu5NQ4MCw4tFVhQh0jairqrYOuJxWycQiL8=;
        fh=S7x32knyo5TT+QeCzJTrDVmTFHaxzGwnhTvaP7QQ+54=;
        b=FCLYtUbG/Xo2d+rkS3M5RLwcNoQPBSO09zZDsrt0BGYEvmYVpu/cp+Nzij5QmaERMy
         4U3JFK3ycfTy/oEQTDj2gB2BFFo/9dz0NLoN8lQVt7GgjNpmmQpG2QResIJOOv+1g5cq
         EGF+3Kv4PVlpXc73aVzXM5LoJLhEID0k13924SLS30oNOxXwwEomuWYnui+0V/iGIMqS
         +VLClAuuhe+fo01D+v7Ur+manhttPTmCC8RlMCG0oNB0uffaYMKXXJTIUATWlhLSVwgH
         X4YA9GFPzqDw9nuOdeXasbLgH78mRDsYJxen0dgMu18CxB8H1nA2fCcVnna2JhtV9DlY
         dGmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793046023; x=1793650823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tiqrTwHchu5NQ4MCw4tFVhQh0jairqrYOuJxWycQiL8=;
        b=A7p01nvBMhHxGKu8wGxGgcMPF4l3Mf9+zLDGPVbMr8b64g31oQkECe1YKlmHs7IAuP
         A6ytqaZDhrsNC01oXLAzVdo2Prtm+k0s3PEgBvsjSYfQyhECYmw2qlwMEhgXD0QtZFIh
         +ZFmlE+Up5ioeWCGwA+Y+/mEXTqY/5sL6O0IK/zCcxbRimeXOZfLUvEHaFt32xn6Ntp1
         0iLvPCJa2i2ZO5CSJHkO8BhN66lYkGchPno5lGLS8imDUJDYtFGP7HjFWA6AF3Y31jyJ
         M5CITOmKWt9wQ4fUUlf/U14RgMTBtNRX9e4PlcxW7AL4n/1KW4CTI8u6HN4Zg0WvY18l
         /d9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046023; x=1793650823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tiqrTwHchu5NQ4MCw4tFVhQh0jairqrYOuJxWycQiL8=;
        b=04NpkXagd8eJbTA2G/TWQVny0UGm0+LGV3009vRvzTnTuiY3476tSUH6fqmBDrvtNv
         EsJR2jyJ+0fm1ymMTWFUOUFuLbwx1FoIp9Haqc4Opuo+HF2c1X+ETyKqgzsHW3YK+0PH
         0IM49bHrvpxLSkzBt/wINu/qX5twh8onTRvafNIA+MtoD55JAlWczgpvuLPG86fbhAPi
         vDcCkd56rMGZPbdOB3Gx5Goy/bqKJRk/UZH8eDka4LcOWvCmhcDQqDwvxss9mPbJVs5r
         NpGajb4kqVs8p2upNc+Zshn4OGdgZC6qHek9wNRn/eSRX7XmFiP2PwOY/H9fN3PPu1Hg
         tBBQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6BGPLDSaCJOQkpP6Ykf08sXrdrSEZFXpVSTLf1bUjY9XrXPAMJVG8cJnIsrC3bo34+0gcJb5lwxWtLTY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJF/BoMx1MloSpomp/Gu7n9BPEuSmgB60mzWMX5MwV5RLPr+Mzp
	MlbdIOcmkeMkPU9Joz6IdeiFBcvzVdVhhZ2UrQQiv9B+ibqDB7r0pE/hyRI7LaoCrg1WSR3ejaq
	88FvvGi+41H3D7aChfx0jYQzdlCxwT3TgxLc5
X-Gm-Gg: AYBFou0N6dRsp71Q0iSRM/A+ygHuMkNwFP6xrcR1vAtp3OQjkC29JgDGF4S8ChD8fzx
	f28iiEm8F6thHKX7HYPWbNycViF5yaULF9CTwmPSFKnlvpGwXdKXprAqnb6ghxwXMX9oYwnnRQw
	UdlxEgiFbONHj4m/nNMX+Zwtx85dt46YSZY9oD+fDVUp2VlTacWpein6YlcLKXNgvY5DFZHaJ8B
	y/oP9syJxZURLY4f+Z7PwUi/oQKdQtIQnuTeHyOLqxL9xA+8mpxkn89rDLl241Fn3Dbmhe6bufW
	QrMN9rGXRRHMXTaDqLV5M6xlTJ4myh5mYVBQ+C+k7azdNFCFbRy55eojKml15tXKfYQF7tlDvmn
	J6mowOB22Ap1k5Kvhg/yVPoxKYITiqyeMfbWkV2c=
X-Received: by 2002:a05:7300:cf94:b0:35c:99e1:c755 with SMTP id
 5a478bee46e88-369e86128c1mr10654244eec.38.1793046023002; Mon, 26 Oct 2026
 13:20:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019174930.7237-1-henryzhang62@gmail.com> <20261019174930.7237-4-henryzhang62@gmail.com>
 <CAPY8ntAyrZO5Oi5hxDfSKHdSFpJTR29J8kUDCL7Au0QCXR0iLg@mail.gmail.com>
In-Reply-To: <CAPY8ntAyrZO5Oi5hxDfSKHdSFpJTR29J8kUDCL7Au0QCXR0iLg@mail.gmail.com>
From: Henry Zhang <henryzhang62@gmail.com>
Date: Mon, 26 Oct 2026 13:20:11 -0700
X-Gm-Features: AclHuK-iBnPKK7sw-qt71TTD819kBJb9qh_63xWkNErRExQHTxQtY5RxBWBzRdo
Message-ID: <CANTW0yqXVVbim2UhZjHVr8HrruXb+jP9vCC9H_Nhuw+JiGkrJg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/vc4: dsi: Serialize host transfers
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 11:20=E2=80=AFAM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> On Mon, 19 Oct 2026 at 18:55, Henry Zhang <henryzhang62@gmail.com> wrote:
> >
> > vc4_dsi_host_transfer() fills the command FIFOs and the TXPKT registers
> > and waits on a single completion without any locking. Two callers
> > sending at the same time, for example a panel driver and a backlight
> > update, can overwrite each other's packets, and the timeout recovery
> > added in the previous patch could reset the block under a transfer
> > that is still in flight.
> >
> > Hold a mutex for the whole host transfer, including the recovery.
> >
> > Signed-off-by: Henry Zhang <henryzhang62@gmail.com>
>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Hi Dave,

Thanks for the reviews. Our mails crossed: I sent v3 shortly after,
see:
https://lore.kernel.org/r/20261026191618.9430-1-henryzhang62@gmail.com

Please don't apply v2. Further testing on a Raspberry Pi 4 showed that
the recovery in v2 2/3 can turn a lane error into an interrupt storm
that hangs the system. v3 rate-limits the error messages, masks the
interrupts during the reset and only recovers while the block is
enabled.

v3 1/4 is unchanged from v2 1/3, so your Reviewed-by still applies
there.

v3 3/4 is not the same as v2 3/3: the lock is now also taken in the
bridge pre_enable, enable, disable and post_disable callbacks, and the
patch comes before the recovery, so I did not carry your tag over.
I'd be grateful if you could have another look.

An automated review of v3 found a race in 4/4: an error interrupt can
still run during the reset. I'll fix it in v4 by keeping the handler
out with disable_irq() around the reset; 1/4 to 3/4 won't change.

Henry
