Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716275;
	b=ur1JZe89fRtD2qtSvuQnq9ihyqJQ9mbUsEHJW87gD2kKnuz33ncCOphSByGSC77NGo3c
	 QBFmM6Ca03G8OBqAQzxGxpUdQ4e6nFTSDJn0ooGCqH9k1JrFSqXEcuyG95zDZNnYBSL5J
	 WL4Jmma+7qrWdBQdRDalGb4mJv9jvRBpRycsz7Ct8++p4ElxwmZQJFBca7crwdxq8oO0v
	 fmmoPqBCITkj9XL8NlKiySvYxgkUQmqC1aQQKd9riv2Clapf2KW0XbYYzFrzltOVFZFuv
	 QqefSUlSlJCSOTPFEYtxUdQldFny1d4UcLzGbTKX0JhmAPr0JDtHuemPkE/ZGt7BMpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=mQHIItj+qvoGznmNDSAc+oLyoddjsgyl65N2G457jxQ=;
	b=0hDBwJL9FxCSBqtyDH2OizeOsEN05+WW3gbmKfCxcqapmX2t8ac21WEKrslLZ7T5Pz4Y
	 8UDRjAW/O6hUcJaIjvTfXjC7GXmQqR2ztOB5XN/4TwnXDMqbMYweDh7+uKcZPmicLF1UG
	 g6q4ePp+LmYtUPfij73GnaAHvj+ZBa0juZA3kH7pZhjHAgN9wXg5p2BISyTLOtWk3qegX
	 G5+pOip4v150Z33kHP0oFeDNT8fopYUdsei2FhodPitIa+KoiktynKYff9p3BYQJWbhp+
	 spMVt0irRTZBC0sZ5zZt59qAgsmn/UhH5SuFBM3ppfHrbfGVq+yPjMpvh0jJjfSy2cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="jVnxhA/E";
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFAA606EE9D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFAA606EE9D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jVnxhA/E
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so5585188c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716274; x=1794321074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQHIItj+qvoGznmNDSAc+oLyoddjsgyl65N2G457jxQ=;
        b=jVnxhA/EG8/jwWHgyUd/YGEYAOWsVLRlwNPRXwYEGVwswK2+uIGauWBraLJnUWUA/t
         h4t6pngRbbrUOVUbmqrlWAVUK3/ta+8Zown4zVadfvmTepZik3oUQ0nWhWqTcs98Qb66
         02BsiQK1wpIb/OOt8q3I/7EIuN3e8R/LQhAdXYpgMIzEI1JUwWmQnBlbKGfgtP5z2r98
         5fZlpur1KqKKd59doL9dDbmgKB2ljBPZBLjqhSkoWF9OFIM/aX5CyXWKG+MrJbtp8m50
         4lzdrVw6eECucGAexedcU/afcUfRw5ncCH4jSpuo9V/mwzGNqPLBXWXtcd0RvEigPHVN
         /0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716274; x=1794321074;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQHIItj+qvoGznmNDSAc+oLyoddjsgyl65N2G457jxQ=;
        b=p+TYnbF9JERczhLaQXUoFR3rMK3S3jWcHoPjgL17onUa4HP1zHNRNi7SccHm8hdYjQ
         9+2pF5mWp6ZWqCIKq3TZyr6CRdrqhmRbaSjiI7dqNKeakDps0XSo6W42FqR07kSS1Uho
         a1st5LUMwMFEw8YjzL3Q857X+ncwujktLcBCCtTcP6Db0Jb+l0S3bSqdn120/6xa0bZz
         cxoEVliRHdp+Kt+LhRWFoPTr1iyQED2QA6aXxIJ+ijziDPibwEqelmfjDGUsdtBkdXU2
         su/sNz719c3lD7JoGO1Kxn5yy4xQ9QVF6wLMPbjRKWnB20wZjp5ASr3Z9wMEUnuLxrIb
         lwkQ==
X-Forwarded-Encrypted: i=1; AKwUvByOCvS/vi7cbQbnPZkdDgyGQOITU1EX5hloRNXeHO34o6fFYZPhXqVmexjTzT2SX/CzQJPyiGqxd5c14Z4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lpTQxMCOWUxZiryBEOj2sdlkww3HToComrjebRql06C8b5XOl
	evHahKh7ojm8b1NgYif0p20G136sh7bJ/DL5CNZeiKQWgIwXEHiHDoDQnEUOfpAoBfs=
X-Gm-Gg: AYBFou0ujRFRXq8hJ7E+qWqVWgFaBVMYOlbQQpTgtw3QpamhQtV5g92pJxzFW54WJFq
	XwSYgBaxCYvD1fsGREcWNfymIojME8MM062U4qwU8hBPl6qvLFtqJ+6yFklsK4OFlJVBAsbI8Vi
	s57dKM2ePnshy7yACw7/8RkoCF+/pwBGsRrPodJ60SPz0uiI+Llq1mNvpyhMnaxj4pJ8mNT0st9
	WkpW7vylXcka6QU/EhOh44yDt6iZolWfJyL+XsxiAgCiEhi03+NFztR2UzSdqrOJ0yjtq04h2o8
	xXuacSh+faJceEVUd0X/X/gQ4VJaJ2NKEEUwDHxuYfk0E/M68huPSxDm+ikVKktnGEThUrGE/B1
	WAdEfj0BmSy7p32vvqn8As2gTeprwb9x8VAfgMswXIBwsps31AUtgbDHsN5Dj/KCRusMGbkv1Nz
	CGWtbMKpI++nsHJ6FBA3jAXvwnb6KjC7N4045keUfes7yfZUtDLoKuz47CL2H/KwhA0b5iTQlRD
	QlCr2dMLNrOJJIasAV9Ahmw+EIes1CJxKFlf3p8CFirty+ZxqpUMcvomf7Cfkq0Q+Vlpzr8Hm3T
	2YqSMie0otHnC0/oiOAIG2ZqkRfO0oQkkGN/C8xlzFmRbsfHj/cirxyYu7yMkzXarkH0dftLaA+
	UxiEiBY4Yg9gP
X-Received: by 2002:a05:7022:3a03:b0:152:9e88:daaa with SMTP id a92af1059eb24-1ac5f181628mr22731309c88.36.1793716273870;
        Tue, 03 Nov 2026 06:31:13 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:13 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Pavel Begunkov <asml.silence@gmail.com>, Kyle Bader <kbader@redhat.com>
Cc: Kyle Bader <kbader@ibm.com>, Anuj Gupta <anuj20.g@samsung.com>, 
 Kanchan Joshi <joshi.k@samsung.com>, Christoph Hellwig <hch@lst.de>, 
 Keith Busch <kbusch@kernel.org>, Tushar Gohad <tushar.gohad@intel.com>, 
 linux-block@vger.kernel.org, io-uring@vger.kernel.org, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Martin K. Petersen" <mkp@kernel.org>
In-Reply-To: <20261029155821.2983229-1-kbader@redhat.com>
References: <20261029155821.2983229-1-kbader@redhat.com>
Subject: Re: [PATCH v2] block: only fail dma-buf bios that need block layer
 PI
Message-Id: <179371627250.3691261.14418388073265426531.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:12 -0700
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


On Thu, 29 Oct 2026 15:58:21 +0000, Kyle Bader wrote:
> All dma-buf (P2P) I/O to a device with integrity data is rejected
> today, at registration and in blk_mq_submit_bio(). Only a bio for which
> the block layer generates or verifies PI needs that. The block layer
> then walks the bio_vecs, and a dma-buf bio has none.
> 
> Reject only those bios, and remove the check at registration. Then a
> submitter that attaches its own PI, for example with
> IORING_RW_ATTR_FLAG_PI, can do dma-buf I/O to such a device.
> 
> [...]

Applied, thanks!

[1/1] block: only fail dma-buf bios that need block layer PI
      commit: d734b6433b2fd248bc25a2ea1fa60c34b40ba15c

Best regards,
-- 
Jens Axboe



