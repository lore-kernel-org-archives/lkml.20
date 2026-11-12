Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483660;
	b=2hegXgIqWCP0rtWd/QnllI8NqCZOTK86lbSy5yZzd2VGv1g/YG9lqaDsH/AbsZ1qcXWX
	 cfo6wzmxDAszYaqcGBo+CngS0Q+37aU3dzN353aYRl+9KMUjrMXn1LfUl3fH3tsR9YERl
	 0UxOMZD3A4hfApJoQDZtFyqKH/4T6cyVKjuQWPboXhSnDsuDd2oBtvBi5buw/3DVLQODD
	 tzuU7WmjGVxKdrYPR8Gcf9vIYY1lQ5Kt1F9lJ+iwxh11rADvnvFakkzJ8qibCEFtDhhfT
	 PJitCB/ktSh3GtMOXtc6XnzpvtaOJTGjjYXEo+upSgmAoTvYfRDE8pUNBqlHbcCtzMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gd5qaOSUVWh2d2v6VyXcOF3/P2fT705qxQ3nPfB37vE=;
	b=oZj2dZ9f9hXZAEK4eWRnDbdwvn/X5/Ywq3/x8S95vjdxI94rGEXBDgKNQ0N+3Lymy5F1
	 skaiGrphNM1gUPyVWsn/6clV+Zu4jxPnqsLLM7YKWId012SxScEzakLkA9U+0SYMOeG6Y
	 qd3Dqfka2BUFm4T44bzEu8zdRCcmkmu/JPeH5XorKK2Yx2HuoRy2LVnlKmzYj8tmptx54
	 KHX+q30Tq7rsRJ8qvxdQDtDOz49yrMLDvWT1SKhOGVEanyMVU33LOU0vkyEkxy1IL2m2c
	 jaolGztnTwMHX377Exj8o76GbXm9u9csVVZGABHcssb8Lu17t98ZXnnCPvsyUWqfUQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KEmPplNn;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAFE606A8B2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AAFE606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KEmPplNn
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37628596783so4188135eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483660; x=1795088460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gd5qaOSUVWh2d2v6VyXcOF3/P2fT705qxQ3nPfB37vE=;
        b=KEmPplNnoiOlOa7kWqvKF07gxkGykUViIUtmPh+kP7nQPzhyUQI2a1DrOFo26kA+FN
         C9UmWiuEgkum7U3lnZF2VFTEPJX3p4Ml61IrlT+cGHzD8hsnZNObZ95CR63hz98/GdN6
         oVVLS/uTLJOs5GgM9aOpfrcCHJAATOXLlBLr16lks61jshecz3PHzThBl0mKt6RU4nux
         UWdgHb+cuuerQdqnC2PXOfrZbzzzfXprb4boxxMY5F9Wz3GGu8Xd/EcnThJ8SnNGD12u
         N18W9NAt3u7Q25ugmUdER6ODPxbAGOEuAUNq3WrXdURkhdVsz7uqGd27gWnkRxKiObNB
         +Y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483660; x=1795088460;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gd5qaOSUVWh2d2v6VyXcOF3/P2fT705qxQ3nPfB37vE=;
        b=vspic/om+yRCUvjCQ+PBRFkX+CHqpXbGsSwSgAyMmLSp5Okh4KDXtyIusvTOL4OwCS
         AZhLB0HH3KU3EqNkne38siAx+/flTT51bkpCQ0vV1o+/ZrLRwQtNxDk07zyuWOLIuXhS
         NjIjcLyy6GAfz+Exd29Ft2GndkmvtXoOHPdHg7YG5aLzzNfDz/hkbEhoVmi1wcb30EEX
         tSvoFpW5229H/wRLRxRSptIHk/am1bBpTXuuqO2/J8UvXJKegUCD6cwJwE7q+Bk9jYJj
         cfMEhGcNcAAT2bWQ2XLjWRkUIYmxcivmZ+II6cDRrA0e4Gagoi+mp2zkL4q0gJ2qPRZ7
         48Nw==
X-Forwarded-Encrypted: i=1; AL+hErEmBeHPKowPy0FakyN9bZDN4XLQNIuyobp3t6nZYox7WkpToNY6GtsmxKlNGwsUHjmIJhsJbn2sdS/9jUc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P8NkUEITNKfVpZnQkC8I3BbtB/X2S2Ohe+n+uoXNI2dCx/3en
	ROzQ/EHAIDiZx4n6AcH+ZkLVppUVybzg6/0NXQEjap/B55jTye62HMWO
X-Gm-Gg: AYBFou1quvMT3akacP2KyTwHewj8ipTis5Ed22ilm5nQaDQjntukzrYWO4VijmVnOh4
	MIBH/w7fkOKhyibueOUXQHbFy139l+8XBFkldRnR5Z9wEyZ+Or0VZ/qmacIPUeAQuVOOVAkP0O/
	VNhUWFZt7n4b46FmZWfqyn2Cwxnm4Rti0gPgIlUmA8uEnkp2z9H9X0q7VvUinMB+v9M+0vFpZf1
	bqbJ5LB8S/cKJFiecBcBUD/GJ7wYZKBnIWHEREyLOepSx32Kp7sKvqtQIB0NEgBihMCF6oOiMFc
	mEFlqp2NvztOansPZF3RHAdmXQrxsTRvgaF2vRY7GntWx99JbFLE8QSVyLAtgLbdZNfs9jiBXpN
	+Igo4pTdy/kpvop3Nry22yPrqjbhGNfAjdFBlQePaIg5ueK6QYF3bS3pYdWNg61MnNjaRZoldA9
	l3D/L7V1KPhsFU+YpcIpCqov9FEs9/nhZ2D7iBfwQZQ8c1M6DWoIUO3lx45N3hXwnrmBcN/vl+X
	yEKmO+rzootrLfhkeXxzfBEkL8ERcyguNxB98ZjF1ekUyknPfcLNxOa3SGGcIZlSlox3r/FLgO9
	B9OtIBc+rEOrtuGb04C2BIsQ5GWnK5w2IOJ4rmBbXllnhSu6AxgbCwSUBE3rBBI=
X-Received: by 2002:a05:7022:1184:b0:1b2:6b1f:1d89 with SMTP id a92af1059eb24-1b3c0360627mr4336535c88.36.1794483659738;
        Thu, 12 Nov 2026 03:40:59 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm29245380eec.26.2026.11.12.03.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:59 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/6] media: iris: add platform data for kaanapali
Date: Thu, 12 Nov 2026 20:40:58 +0900
Message-ID: <20261112114058.428-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261001-kaanapali-iris-v4-4-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com> <20261001-kaanapali-iris-v4-4-642f9ac5e699@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 01 Oct 2026 20:47:24 +0530, Vikash Garodia wrote:
> +	.inst_caps = &platform_inst_cap_sm8550,

I ran 8K streams on the Lenovo Y700 Gen 5 (TB323FU, Kaanapali), on
v7.3 with an earlier version of this platform data that also uses
platform_inst_cap_sm8550, plus local line buffer fixes for 10-bit
output. Streams of 7680x4320, 30 frames, made with ffmpeg's testsrc2
and software encoders; decoded output compared against the software
decoders:

- HEVC 8-bit, VP9, AV1 8-bit and AV1 10-bit decode: bit-exact.
- H.264 decode: 2 of 30 frames output, nothing in the kernel log.
- H.264 encode: 3 of 30 frames decodable; HEVC encode: no output.
- HEVC Main10 decode: reset the board until I applied commit
  200473c198b2 ("media: iris: Fix iova allocation from restrict
  region", not in v7.3); with it, the session fails with -ENOMEM:
  the 222 MiB co-located MV buffer finds no contiguous IOVA range
  after the 11 capture buffers.

At 1080p and 4K, H.264 and HEVC decode and encode pass, and HEVC
Main10 decodes bit-exact.

With the SM8550 instance caps, VIDIOC_ENUM_FRAMESIZES reports 96x96 -
8192x8192 on the decoder and on the encoder. If H.264 decode and
H.264/HEVC encode are limited below 8K on this SoC, could the platform
data advertise the limit per codec, so that userspace gets an error at
S_FMT instead of a silent failure?

Thanks,
Joonhoe Kim
