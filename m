Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716263;
	b=gXbQjgalWmtYtpQw8zJS/KVKTIRqzdD7Cs9vOV9UJ4ZOFz+KKKOKqbmldV7AWfjAvbyA
	 W/cnv8QG6CMburOYvoG6IK0tTcmPWGvAvMYZnIansn7HDEVWRd2jZiMaetM1QOn5ojLnT
	 bbcwQQnkzmYHNOymGZHZnSgDsf63iVM1xBiqyyzc8p5SK1MqJFggUgUsBfViUnJI7/D40
	 oihgH+/+gfLt3OBue9oJkSVsA6gVE9hDmefPM37LupMSjtz91kaLw8WJ2a9Ck1h/59GFf
	 jCTTBfDpBmtaDhelZxfYstTNdQObA4s1EiXql4dKRY7Dymj7+HA0Q1nkjyzrPSi/IoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=BTySiT4CrPOODl9YOV1nelrNFr1QsD+JxPopoY3txQA=;
	b=HYAA52XjYXP+r/Y4O6COlm64h4djJAZGPw12sZhAdkNncPVncr1GPMu6e/gRJ7d80BAt
	 JpbXPMRGD3u/1V56fHyYuY/H/3eAxpOM1/xFCcUWlMhjlKIVf5bWp+xt8ItivhFVsQktM
	 q1Hv2p3bRyk6ZLRnvoZgkAJkemY1Nyl+mgByOOYLk9bBqBVwEdunEMShwQRwyZL+VhJae
	 h1Iunf8WCO2ZO7Fs/CFXn+QOd1S/ic5gH8Gqc3GzDnlQTvyB2HP2h39QavUGE9J5H0TIL
	 TEn8oBCrj/mw2aTlyBaNNdJkTpqxytRr46vr1FEgkX8eA/TnmmzrUG8gyqHwDtwomBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hpl39lt+;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927C5606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 927C5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hpl39lt+
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1ae18eb9b69so3126590c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716261; x=1794321061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTySiT4CrPOODl9YOV1nelrNFr1QsD+JxPopoY3txQA=;
        b=hpl39lt+1qTrI8kRcvim91PiMFAQRRR+f9nUT5vwtZytXDd/FttfTH6iHIo03yuyxl
         yRLqt4EZwoBlcCFgHW9bIzxE4lCrVSzXEw81wz2cixex7oTQY+asFmneLAvrr8RRL+6d
         XSigfM8vnhtLWXRnvszPAQWTJDNtgsgKyBlt1TGHDkiw1i+86OePnUG21PdBvMS3YVO3
         xlT/5eVwhxM0lZDf2MRBIfE9pvzZfo54IV/VlguI1EEIyrU3Jxf7YQ0uw872LCHettZu
         bYsLxfJXD+qT4u7qbJVSFKbubVM0HzMk7Jfn2ENt1nyKuQbUVxgLphwzI/tqXUz7zzy3
         GhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716261; x=1794321061;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTySiT4CrPOODl9YOV1nelrNFr1QsD+JxPopoY3txQA=;
        b=2P3QT7FFlg+KbX9FugvgKQBEpp1HtCSWhJvVhLou4PcUw2xC4kDhiohT3twY1Hyv/2
         s/aG55lO7kcafvExUDGPIgwq6VOcKLxzW5qSH83DJOKwOeDMrj8xyYRJKPaJh78+Vczd
         KCFSFecJexbq8CDHXy3h66bD3wZCmmRNSoidSI1jLfsFYBNHeq+4Z1LpmPmpBNv7Y/b1
         8yKFt6oOCsZs8zMzTWn1znEVspqPZESWrLbbg4Ly42Bj7yWBiPzf4YvR+4UV3R2XBjDr
         xPACsmMzaee/qtotMhj144g+emc92+LaV2RrbC5TS3JI8nBID8SEs9/ps3tQght+MDA8
         YSDg==
X-Forwarded-Encrypted: i=1; AKwUvByfMr0TS7VgkgLaNXiyYp/7zMJvWGMjHRIRo8etu6ujJjzFalRS+GitGLOhZgJSZOQOnaGYGteIlCTogRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dJuowKrqnLW6jkD19SuMXdANOZyc8xTKtb2bTBGhJH/SgHl7d
	qupcptBblTOFdROzX7IiZGaD55Ehopnse5ocUtvJNovhDgN9QQx4gxWM7iExfUNTJwBb/9qAZk9
	nLpy6iHc=
X-Gm-Gg: AYBFou2kLl/RtfsVrsJfk211d+99RLH4dGU3Bx8QsalqyrjAzypwXXDGhEwiaOppdZA
	47Jy4YRYAOtiIcxyW5hquL+8vCTe04zH5lGNcaNbefu61yLoJuZwYPCv/Zx+QPO8HdcxFXMrS9t
	VogicwvKL+jLRIRx3p9/htG0REXCan3z53keTX4vANEQ6qRyEHBRkrWdNb2dIHW3AglsGsVoVKe
	9aD3J7U1JomafUwjP0esZvom+FwYpWs06LcYfeb89FlJOZoD3tNy6/iabY+dRM4loGSYEAEHvVk
	3ZXZ8t8b0aH/AkeV2kk1u/38iSEO5QAbHQKRYJXkrQ6wLAzKXlRhpWiXR+i5xHhaxWX48xF94Vc
	3chh7c/uABkR1EaSAR/6vkJhSZO1jY1QN4f4/njYdlUM1+kJ7rUgEbzZ/TTgw9ZqPlT4BT+1aGS
	V7MMzeULtvDW3pC87Ws/QwB3d3EJICXUffAHF30rhaOfLtmih//mezujewWxmK2MLE9pXTIrARl
	6OJ/EGEL2OykA8HbEtBaMhInPACpLECbhLD+/1jLxpePKBCv5MUmlyuc9Dmq7iSN16C2SJOuBlx
	U5fDLxmohmFT32bgIyshFicrUCJj8l8mEP8BcInODROV2g1/5l+MMYTgwZudvWvAGT/14PpsIXM
	gHJnoASXfX6YO
X-Received: by 2002:a05:7022:3a03:b0:152:9e88:daaa with SMTP id a92af1059eb24-1ac5f181628mr22730703c88.36.1793716261056;
        Tue, 03 Nov 2026 06:31:01 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:00 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Shuai Liu <847807867@qq.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+675af112519ca34f5502@syzkaller.appspotmail.com
In-Reply-To: <tencent_BB08960D79E0261B5C1EB1E589787734E907@qq.com>
References: <tencent_BB08960D79E0261B5C1EB1E589787734E907@qq.com>
Subject: Re: [PATCH] io_uring/sqpoll: don't set IO_SQ_THREAD_SHOULD_STOP on
 thread exit
Message-Id: <179371626018.3691261.9700356493325892513.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:00 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 02 Nov 2026 16:05:42 +0800, Shuai Liu wrote:
> io_sq_thread_stop() carries a WARN_ON_ONCE() asserting that
> IO_SQ_THREAD_SHOULD_STOP isn't set yet, i.e. that stopping the SQPOLL
> thread is never attempted twice. Since commit 22d9db9fd64a
> ("io_uring/sqpoll: don't attach to a thread that is canceling"), the
> SQPOLL thread itself sets that bit on its way out, so that
> io_sq_offload_create() won't attach a new ring to a thread that is
> canceling.
> 
> [...]

Applied, thanks!

[1/1] io_uring/sqpoll: don't set IO_SQ_THREAD_SHOULD_STOP on thread exit
      commit: fca3ff9e2eee7d285585daf51942e0b5e2be354a

Best regards,
-- 
Jens Axboe



