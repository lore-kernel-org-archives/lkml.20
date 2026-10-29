Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289010;
	b=QU6axjnFvXuI8tMrF63NSe/hpP8/PfbBVToMlKlQaPItb80gosMsQbdGdmvS/GOoneiZ
	 QOseBEcFKkJ1M5cFQeGFskggoKSxUPDNyAcUfNYIBQgyxMq+wsn/0DhzTQyTEsBPDn7A5
	 RN+rutxuPTTNzrNFiKSeEe+UKlFMla66xGlSBAM4cAYlMzsbYKocHqFbeeFTSc1H64v5o
	 gVK0kTwbEhQ4wOJ5DY3A+ydiIToP7rqqqD35RxWsnajFOaHRr0o3yILFoCTuMja9x/X9g
	 2VrpDMUemw6Lkj/CPXNgM+4vaf7XCpVyFoKV5y3dPkrD5g8BVuzR7BETGBNKdYQauxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=aJzBEwj2+x4j6CDStwSGH+/h447AGr3HtflqjrkNNp8=;
	b=As6+2TBGuxRgyboiXC03UJXZ403Sxx03DXlB0w271S31N5sBg4LHQINUNrB1nJmglNVn
	 Jb/Qksgh21uzq1pnF5cEmbt5McmYBquYOxXvntxbdGNSg4TdxE8p9acbwHwbT1SVjtF15
	 vn5Qw8VfQm/U89OtCM2hfJd3eToU/DbNi3ybHlpcl5okcOA6MWKUyHURDuKA8/osanDRo
	 pCwRZj9tz14zKaVDx1VA/JzlNlQC8gI84eHRr9jSFrFuDF+xRPXMix6Or4ec6rn8LVO6M
	 9oC9MCKwV0xfDztAmzc/LTTbUya2C7vqqVhIpW8Fb7HPYsaAjJufLWAjSSwRyRSZjCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sPn9Zjxu;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6624E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6624E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sPn9Zjxu
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-49ddddefadbso1119443fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793289008; x=1793893808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJzBEwj2+x4j6CDStwSGH+/h447AGr3HtflqjrkNNp8=;
        b=sPn9Zjxu/OgUIzLpljYFMA3n+mK4KEEUft17iahwWOyuzygHD6vArleT8TDLvcGFyz
         ztbKajILsvA+3IUrxTWIisN+VMPap49vjpQfimOkVfmpFR1bSnbc5LU7gFtTYLTbpRxh
         IKWA943bwIzlf4RkYYQWuSeZQVSUPGX/uvJSUXIbh7lJTjHySrj6oCT9kHAOvdCgx73c
         mAHxVIbgR0MBRzt6h6jwOl5xRh10mOVv8cpxCb3G2860Q8uk5IsPqBZ0rMEeHS1EK34e
         ZrwcRh6AgPYcd0vvJoW5TCEaFByyb9LdQgTQbkzedvI9m4XQ7SjU/WzTJQcf7ALid+VX
         H7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289008; x=1793893808;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJzBEwj2+x4j6CDStwSGH+/h447AGr3HtflqjrkNNp8=;
        b=cSqWRPKsgWf1XNLyHOrGEZRGzsOFtVa60PiA8mvLQ/tXRx8PJVe6dx9vwMX+1wkYUb
         M/hlKs01hHxahs06YgOIdaiFpUvDftI3ME61z8b9m78NYuQwdw/Si7Ajq6eeuHtasZ3Q
         TQD4oHRnToJvfUiz9Iy2JqnQCKFIT1rEiuH9cB97VYYMRa6Uywpr2yEIyIF7SyGi6sqK
         PqWos5GA8xKkrMOQc5K71GpPVxAFHZsYXLwaW2SvBBiAJI+RPq7+fxSBt4HfVkMnQzSt
         Rx9bb9r3g651f/6+o4AS1YZmEwdKcBmG763BHMK4WvMYnCCWbpVjDXIjrEuJhJ9y5AqA
         5O+w==
X-Forwarded-Encrypted: i=1; AKwUvBx77a3ZjcCfS+MLhq+Ocazr79nWzb4CjecJ6xjW7WfPykdCC28xwHe0E/7KSmHfiJUv020k3+X4raiVS6E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfbzF7NKuhlpzilLPudWqGaTqlOECNlkUSZjmec6t2H0Ekxkbk
	WSoTGL9xwdA/Afq5AhyhtJGu/7SpIqS22r+D+hS8uLnKbY9sRhgfQfMXkbEfGLR+6Ao=
X-Gm-Gg: AYBFou3MLL+QbC0MP4J3XxQkX5X6dcYAFkdywnZtttN7ofLtlycdUXWFaUtX26uaSAT
	cmycXY+mntgIBJqH/VSoNECENoJ2gAtIVYV/6FhJnXzbMGutu6pCDPJbxhx9pZrjiXZ0xmevwYJ
	frbXUtz7yDPya5vHI5E94FrVxSTOFsOTn7x5w64UuWfH1gCCecTHQEHgVYEZ4J/7N3griRXAQUv
	khi4MJ74Ppjpz02OrrDPnmr+lDeMagSVOiLBsIfTfptLAuT1337gR3kWemjp0LbWN11LwJM4RO8
	361zoBQv94d5WLNHpFtaXfAc+uh0TsCs42eagfuhrV7Y5EPek9hqe+14uZAXCgPlhwJ5SF2wNT7
	dV2NWfN6UlZkgmJ/rMaWpVtNjh/uxGQRS9ax/Ndyy3HzBsBl+jkxayLpV6HKyxpf9nccz/VGK17
	PX+aAPH+kgYfmYVEANupjfUW8LJaUHyi/Q1U0oP2mXKMAGG05DsaY2i4+fSOga1lWo6M1y3iiPf
	BtgGymoR4b/hgpOB4+IcUfTbv2b+yWesPBuw7yqZliWTqc0TNFRQQ12eRMve861uFZbHmHLQHky
	UJh2MgOYmzYj/KLDwU+iIqPXdnniDJE5kHmA+NMdzuQ2ZB6X4brD3a9go6VWJx4v7l/9cikUTVg
	hq/Ybe3eCkQ==
X-Received: by 2002:a05:6870:a58b:b0:48f:e21e:1e6d with SMTP id 586e51a60fabf-4a8bb5b9483mr4141687fac.48.1793289008181;
        Thu, 29 Oct 2026 08:50:08 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a901ff3779sm124024fac.4.2026.10.29.08.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:50:07 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <179328314078.648427.10086632105828535293@gmail.com>
References: <179328314078.648427.10086632105828535293@gmail.com>
Subject: Re: [PATCH] io_uring/net: fix multishot recv length limit
 accounting
Message-Id: <179328900747.1492023.9396413933198916424.b4-ty@b4>
Date: Thu, 29 Oct 2026 09:50:07 -0600
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


On Thu, 29 Oct 2026 07:12:20 -0700, Cheng Yongkang wrote:
> io_recv_finish() debits sr->mshot_total_len with min_t(int, sel->val,
> sr->mshot_total_len).  sel->val is the cumulative byte count of the
> request: on a bundle retry the receive path adds sr->done_io back to the
> return value, and the bundle branch in io_recv_finish() recovers the new
> bytes with this_ret = sel->val - sr->done_io.  The debit therefore uses
> the wrong value after a bundle retry, and the int cast truncates a limit
> above INT_MAX.
> 
> [...]

Applied, thanks!

[1/1] io_uring/net: fix multishot recv length limit accounting
      commit: 3e3aebb7570ccdde5cc49c9bfc8fd3a436b71b0c

Best regards,
-- 
Jens Axboe



