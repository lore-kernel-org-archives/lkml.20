Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793387708;
	b=opMNqZlbifaSAsf/dM520t1fzaUhy/LWjIvvyoHy4aY3IccfZJkeziY8RkxaA5l0vbCl
	 M4KoDcOyjUAXwkoQqzQXvmi1rURexrw3preBYKw4cL7BJjWdxiXBu1q6Ol/R5HDzRzEFq
	 pUtUE4/xv8Dg11UOKnfIN48rJFsXQ7ck14r9cSchyentKauo6n/EhxA6dyS2zfa98uDmF
	 KKxEiocgpr2YE5CYzien8HaFN3X8GZVIPw6TMe+0WT/+Wo7NxC7wLSUuP9FkJldKRUpKb
	 6eIPTWa8kjG3hrYEoXaTSRVivmelW1M00GI45GGiamY0Z4FgYkqZdRCSSOTKQ5VqC6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Wwz8Yp103gd0DAAgBvJpum3vsZo6aNuALT83OZ+t+08=;
	b=GXjAxolMSCEJZa368sSwpdA549c53vpbi9Eb7JE48+7JfbtuVDZbc+gqg+IVP130vVmL
	 Zjy1g+2YQX86azMagcyikcgpViulUqURsdv/oOJz/53lyTfz+L18LblLI+A9e0cnrFOQK
	 gmGMwRhpV6fDYQK86hLqcf2t9H7zMafOKHuFFf4IYYJqKK6teIb3UL2jRxwj3LBet9LaG
	 N0VnRFReUJFnG9eF9kAR9+dxzsw00SE86iFupxYTj2jqgrACMZoOxdZC8LfEoy/JeAsUt
	 yqWcXYM6LI4zmZNC2ljLqV/lzPm2UyGp8rCcPapxCx5eOCpI16qJYcFcsjR5fLBQHvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lh04UBir;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944E1606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 944E1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lh04UBir
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso5618115e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793387706; cv=none;
        d=google.com; s=arc-20260327;
        b=JPTYMrRfyndGbYawxGEcvFTyAK36qnNH0zn+mDXhICjzv5oNSfwZwBJqsOp2hD5y8i
         iAv3MIi+HUrls5F6lmD+LGcAXbFVdeWh8zCwE399P/ivjsRvRJ3J5bEyqRp/c9PBRIVW
         9ZtbUqQ57uvaXoE8SqozebScl/4T5dZtGNwgI6EfGNfg5w8v3DzEBoT0p11yZDbB4A88
         OanIFHO9yjqzrsPBVzvLU84mwffrZRdanXmvswfXHfWRybXF4xo/sAGAiUR6VY/DN0BT
         2bLrc5BbOT7e3CUP5gRHHkSQgSMGgpsHsUxCChDzvnvc/fsN979nLg8reDtqtAN+dSLV
         AKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wwz8Yp103gd0DAAgBvJpum3vsZo6aNuALT83OZ+t+08=;
        fh=HVb3qp6jGNf0J3H3WiHooCWaC/QoDkQ3zpF+E3/ocvA=;
        b=bGLyRxm7uiAdvft2t3rgC19y6GjWHiep+F7+WYQP40SxsEiI+ib+zWQKxk5MX6xJiX
         XuqjbuhkxDXyvs5wFpTNQfRNXkwoIt05hlGlDfwi/kkMdqYZmXyUGs4Iru/YmgoRDKHY
         78x3YA7ae44zCkUmK2MvZEnTI/jDK7ooOWSqDJU2SmltJ1CAEoSw/6jm5BzF6E3pb70Z
         Lf3Tvxxr+KFVM2Vos6SUEFkHhnqoYsQMWVSIVGQgSxJvLnXnz4yCzucn2K34PJk46FZ4
         AuDPb61MRo7O2dBdBfln1ua/LPGhMc2UQ8Vw2Qg/8qqX+Kc2Yw0QZy6nHtSOprmxgRdI
         hg6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793387706; x=1793992506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wwz8Yp103gd0DAAgBvJpum3vsZo6aNuALT83OZ+t+08=;
        b=Lh04UBirkCnGadwbSwLtHfqKooYRNbvh7y9kNmKahWDqJdroyjmJD3eGo6m9ViKORZ
         x11QLgSCFnP4YXc4+RjoSXbDQg9Rce75Wa15RoC/A/BvaF2HnHySXkTbsv35BIzXU761
         2btVviBTZskmsDvh14BuuS2erpWDOEQ//FQPbkbMaycHcxnLjtbleVTCWODZgcJdfU11
         U7hBx9JYxYz0NuV18wOIQqqn4+8oQtKp0MX/NQDBGiVLOSyc5OEvM0Xju+O/+Z1wK6S2
         shIHDwVFpPSiLz2WI8S7BWRIy36BOH+VI/nIwIs8ttrzxiD9Zdb0Icy77v2gTlOQw0kx
         juPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793387706; x=1793992506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wwz8Yp103gd0DAAgBvJpum3vsZo6aNuALT83OZ+t+08=;
        b=vWeNY0APk+4WWDqFwSgIabaxcuHYZkBwzhtpwGfMdCx/wNhvGAa2NpuVq2Zmj01sHj
         2vBkfWyzQ8iNkc2kbnYcAuaZej5e38e9vB44tCeydKvJxfzNh8pvvMFRKkyGmfxLwPHN
         TMPvCL/ccAqyGDBpAhWubKr6Wfbt5rCwqGPB8d7zGP66+FHThvTXJbO7xMY3XV8ah9hU
         Daq1Z4CrwSmdsLJ8c+KaGG2qlVHED8Xi1b52nlQ8LgB1ZiHpeAHQySEvoggDoTPD63BM
         662oM6JdoJ4Wsxjybp+8RdRP1h1ViiG/RFh82cfSScffo8hIxXnIUFk2viYQsGCxufNT
         GOlg==
X-Forwarded-Encrypted: i=1; AKwUvByObk/0ci1Fkck15ZwWGoyWyNHIqsmD4KCmRPl+srdeyHuGWJjNKuk9I225qSmRM4SHG+inwN8NzMUyeaE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxAwteu2oTreQ9dvU5lP0jeNkLGAvIO3o3M+TFgcL8CNd9PPwa
	zNh2adriy9jLtOWG3nPyf9/NdvdjUAGbFLbqO9Ct2wS0dZC5RmhKtwGVhiPO/ReVmYPZNO9ZAk4
	HXSxS+TxUI8rsWWFafSdDdzYzNkWzRDg=
X-Gm-Gg: AYBFou1efYYZOBd5W9D8FIR1dd2HYa0Aa9VNXA/MT5Oa5BY9aao9oM08QD52XmJo1yj
	6AHG8vTQuskobvZy9S0NcyfPFUNpYttb8yyZ9T+/FSlzTC50oidMKt1w9hkP8bvkaGrP9YSdSDv
	SWP4sHGdefpdBcUTfjpFOg8csKNaTLlhrFr/dWJ/Er4JzI7mPZBxBT5DgEXjo64o/UfFKniNWNn
	YnCU9POqfQfKnPbdUGLlSreFkxsczoDOeE0srfkUBYSjczZ851TXfc3tKQudzI+iyznY2KbHqpg
	sUieRZLQQX74q7iokrv4nLL4QT7IlNDFt4wchWLwEtkW18/yG1ZU1yYZcWmVhK6pKeqIZPpuINw
	AsS/oKWNhz1xcqNMvtRRMEgVq6Fytygwazt+/azz6zz2DEwrjnlA4W9uol0u6OSXHtg==
X-Received: by 2002:a05:600c:3547:b0:4a5:cfc:1e95 with SMTP id
 5b1f17b1804b1-4ac182dbb5emr71896945e9.33.1793387705620; Fri, 30 Oct 2026
 12:15:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029192223.462367-1-paskripkin@gmail.com> <CAFyMnzbvDVvDuNfYgD26ThSyWDqt5u0TLHxF+Tp4=h8fkyepug@mail.gmail.com>
 <c18fe7d6-c738-4049-ab88-c12817f0108e@gmail.com>
In-Reply-To: <c18fe7d6-c738-4049-ab88-c12817f0108e@gmail.com>
From: Eric Anderson <ejona86@gmail.com>
Date: Fri, 30 Oct 2026 12:14:52 -0700
X-Gm-Features: AclHuK-AtoT3bHhyOTWnvQUvf8tYIVDrqm_gH-5GSXLbTYj5dOamoVaca_PF2hk
Message-ID: <CAFyMnzYYevg6W9yQzu+DgQg=n1721_XR4AG3104RgaPpbZZwKw@mail.gmail.com>
Subject: Re: [PATCH] mfd/rk8xx: fix sleep during RCU read side critical section
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pavel,

I tested the patch, and it didn't impact shutdown/restart of my Veyron
device (it continued working properly).

On Fri, Oct 30, 2026 at 7:44=E2=80=AFAM Pavel Skripkin <paskripkin@gmail.co=
m> wrote:
> Based on code I believe that it was indeed broken from the beginning.
> Also I've found previous attempt to fix it [1], so looks like problem is
> known for quite a long time

So Sebastian noticed the i2c regression due to his earlier change. But
spi wasn't actually broken when using SYS_OFF_MODE_POWER_OFF (as the
code is now); the board still powered down, just with the WARNING
noise. The thread on lore[1] is easier to follow, as it isn't split
into months.

In the thread, the feeling is the approach is a hack, because you
don't actually want to poweroff during _PREPARE. And Lee is concerned
about the hack:
> What's the bet that if accepted, this hack is still here in 5 years time?

The main argument for using _PREPARE for SPI is that it is a small,
simple workaround and could go in the LTS. Interestingly, because that
patch wasn't accepted, the hack continued living and i2c suffered. My
change then removed the spi hack.

1. https://lore.kernel.org/all/20240730180903.81688-1-sebastian.reichel@col=
labora.com/
