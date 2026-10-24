Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792860496;
	b=u03G6tJETnW3fmhUJo5omG7oqpFfdkCTN8a66ukxJ5IliPUL+dhOOYIKMs0l2KlreWZc
	 jgNAJQZOEks7z3qBUeD0rMD3ca07YNykg4X4lELAXV/RcQC91s5XmnI41/JkhgrAEuyuB
	 e+LU+CnHM4la/dYn+tvJZebLiHxUJyduMWNIpTlLA3w0+dqQJjX8eVZIgnk0QluWRJFJg
	 ujyH/CuxjJ79/Ddp7OYsa7kDWXx5jPibuL6blYJ+5lYFpX1T7sPL5qFUkJdS/LR42PjMK
	 e6O7xsN57PBI/+rqZBmiNhue6zKj7I4/XL7z74w2IA3dfDDhrLUwfTCojQKCliGmPSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792860496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=isFDLv8vN/snFPyaQLe+9KSLlWtekB0w1jnYJnzpvG4=;
	b=zrFLqyoo2sUQB+NG47ZL4l7YZY+9JTAADoXyZnCqXIUcU7t+IgVq6jjnfRSx6hBtUHhx
	 F73vNRgZgDazunycO7Whk/8/KngGmmoZei6wGi5vn22yH0kw8XQJD1aCkne+0pGEICZwY
	 mFXK/77FjRyOGb+b8p1iq+M9MZ0yKjGhEUYOxtwIhlpgFLhS2O+FinLMjiV4ZsRnEMWsw
	 ykkfp2tKRM0hKJKVXWsM3RfP4CXuhPppw3qzP6YXj6LNUBFYQtpaC6lYOwG7SHegR7Yv9
	 UsKcD687hUSDhhQ2Xv99JbpgWXK3tT7G4CjMg8V56XENjCarme2j8AS/+Ps0fPp6CDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=uGZeaz9N;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6711F606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6711F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=uGZeaz9N
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1502622a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792860496; x=1793465296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=isFDLv8vN/snFPyaQLe+9KSLlWtekB0w1jnYJnzpvG4=;
        b=uGZeaz9NSx8x8gU+5cVfYPY+kB08j9XyRrFWMUzY05K9ULUlFZQLvOrYR7d5zfdDSY
         OENhR8C/AekQGYvo/bT99vvkW0/rKfFydRbWCkudpEC0XmNB+0ARnxjo9WXk3bFqQ8VS
         uI3IPA3/93wuN88jA+BPyVvpnS5zfJERS+7UwiKD2f+0zromq4oVSdAN7HZ5eXwBaNwF
         fd3QeQSFGRU2sZjJwNMwF748LcB9ExXzJ4z0p/tlV8UV8KhSJ48HIq3QlNFDfquR+HKs
         Z34YDIG1yDQCcyA5B3ljIYIlxKnCq7RPrMq+WCK41KYLmQHDI5agHHnYfDXYhWpx/4ZP
         2XyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792860496; x=1793465296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=isFDLv8vN/snFPyaQLe+9KSLlWtekB0w1jnYJnzpvG4=;
        b=FTEFxG5XbgZxYyku3kUxcxsYZWLtrfyynLMw89cw/gR/ksM3HbrB2mokRx6/YDzRaa
         Jds2qE5lVI495TVy8pukK1vQ99+c2rMVSAunlSOKD/I9N5tOO2sxklEtVZLTPJKdfvhQ
         81jB8lXZGv6q3Vh+mbRzLKLvu9m7Y75q5oW1TKkBp8fp3yWSkW4Fd8XP+l2botTJkrNU
         RwnIgUXZ7VrJ6MJ8BbAqu9Q4BBmHhzMPpb+5xqicKk0Us9jESsW98mbQ9Q5eM+x6Qe/2
         tM3vJLAxygxfZAFSZ4wKHwBi3o0r/hqj7dbhiD1FLWuVE6nN0Yi7UJ/QfJYe0gGL1G9h
         m+rA==
X-Forwarded-Encrypted: i=1; AKwUvBzqAoc9lTALnRQ+xUNABFNNH4WtXQ7G77Xy8OIbJ0OaP3I/+Z478UgYaGSnEPMR5ZUJtnTeDL/rJf+uYu0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKN8k95j41z5kNUTetelQWKsiGaxfRZo1IaVlgeF9oXfuUOVs+3
	H2PogODfsoh7ON2t8e3xS0yXusXrPmo5WZqEbgZ7fjoDAX4q4NLmIUpxmXfA89a1U6I=
X-Gm-Gg: AYBFou1AE0cG5plc35AWHnNbLyFMaokFjw5YRPjZhedE8bJIfWdTjBtR+5ZcVBS0w05
	/hKTCqxrtFZh+6bdposvAEfFeq7qXc4IQnQFfJ7ELGOMwj4Qxm7HwcRIGdhfpiXz0dW8jvoqLFH
	4Sl6fP4tQHC/xWImCkusFquXlunUVqHQdcSak6/HcwYxYP3tPoVkbpSdy8NCDtdBRsNMLp2lK12
	3Gt0suSFREpuee9wcVgcD+GdXaLPdfllHmK1TIhudjE1YCrimMos4PsECBh3yV+DiOLwVjwwfs5
	5auMLwRLJhQxXQwDOtWeYbPlYm6YDACja45tKcmuiT/BrspedK1+5vZ+i3q8EfzFp0+NfjBSHHk
	ITPhNhoJUg7WL9ySXEY0TFZkOJcl8Fi/yytcGM9+Hq7h4MQqVcTtMUBeb9EiSYrAguqm8+gQvJU
	R7D/rNmd4nZNu6onTlakzBc8NYemmEwDwzt+MHvHgF0BogklPjrLEedTDCQl9UkNRZItEEVkbyk
	0cD9iku01BNnLw3pt6DxBK3pYDi1UIHYIHtNGltJeknMKWbXcHNGVK44X6YCPTkBa/ay/UXfORR
	SY9ntKPYQnyNDFmOzxwCQ1PjsEw635F0+3+eZr46rQxUWzH2bxZoMoNRPyAja1FV
X-Received: by 2002:a17:90b:582d:b0:3ac:c024:b275 with SMTP id 98e67ed59e1d1-3ade9b2ef33mr2135648a91.9.1792860495722;
        Sat, 24 Oct 2026 09:48:15 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:dba3:be57:a674:a67f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba31797sm2193053a91.1.2026.10.24.09.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:48:15 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v3 2/2] RDMA/srpt: widen the indirect RDMA context counters
Date: Sun, 25 Oct 2026 01:48:05 +0900
Message-ID: <20261024164805.3531156-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <65d23010-ca3e-402f-8384-732678b6ffb3@acm.org>
References: <20261022143901.2991062-1-yhlee@isslab.korea.ac.kr> <20261022143901.2991062-3-yhlee@isslab.korea.ac.kr> <65d23010-ca3e-402f-8384-732678b6ffb3@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 22 Oct 2026 08:57:04 -0700, Bart Van Assche wrote:
> Why int, which is signed, instead of an unsigned type?

v4 is posted and 2/2 is unchanged, still int. The cover letter keeps the
offer to make both unsigned int and turn the WARN_ON in
srpt_rdma_read_done() into == 0 if you prefer that.

https://lore.kernel.org/linux-rdma/20261024162852.3528224-1-yhlee@isslab.korea.ac.kr

Thanks,
Yehyeong
