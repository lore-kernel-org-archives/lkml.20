Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3B034750F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792118701; cv=none; b=ooHLn5vFZ1raJGfATJ07Ee29hWMgZ8zGdxLBZY/1sh53RiD/8l4ciZpTTDcKeRyCGcHL0f0g+tiEwO1IKuYC3rT87k481N7f9AHfwPhSBaipAEOcWZ2ujkQk8WMnpGCE9C7JYROpyjTsmfzO3XjX9bt/NN2RghPIm6dEJl/r0/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792118701; c=relaxed/simple;
	bh=0Vxm4VZCZ8jpZLCSVg0ggNJMQhCWNG8XahSTGZ9xNlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jt95MSzzfdB1VVqzvJjTPGRb2Lt3/2FL2yOt35YrWwLegCeAw9g5Wn6YTG4pZIEYYCHs4wCRC11GJ2SvnWQzDXjZCJ8ydngft9489cJw2u7DA9kozkHj5mSqmfppNchoN/g8+b7CSO6MSzIQDQ5XtlJbFRduU0ylKHtdIyTEhNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0/xjsdw; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0/xjsdw"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2dd9cbb661bso43406085ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792118700; x=1792723500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhQu6i5bnomJdqlUlby+n7UCmgHRVsFKdREdnXuUkFg=;
        b=g0/xjsdwYah8Qb5dh7lkmite/VXew6BEbd1hvCLTn/1Yx08UtcS6BOw2365TdjI2JV
         wJMACAcM+SGvoZC2C4xRu8JgXr6th25nQNOPVEx3UbC2S9R9mJh72y17MNaTQkFBVFyK
         qnIeADbUIUUa4GyaSeOYoKwRE9ZKtnX3kXwf0ePhkxiPo6DZgcwl3mb9ZRRbJYk1VtxS
         GffZ4E29zxTpMHuCt2L+7DDgFQquI0/r7ONAiAjcssQrYhHg59PDnACtq5HsOXIGldzQ
         CWUfC6bGiHJ3fFKq1yn4UOtLvKUW/QkFCpe5o5C9pUMOFcJQ/pvMK5nzne/od1Qwga/Y
         IwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792118700; x=1792723500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bhQu6i5bnomJdqlUlby+n7UCmgHRVsFKdREdnXuUkFg=;
        b=qYDFiLEQh5Dhb5rb+2n9T9G2gFUVV0Zv8A1tnJYilv7/PGgo55/oIvyHNIcsQX3jeT
         YIkQzVv9DMYLS518LnxZHnliuXatHQuiCrfGqQBbWnBM8nuSxYH2W5eccGwnrs5vlyob
         99bYYhNhV4nifJ3EL9hIwWJpRCvek/tFfbw0ZmBLl9hQxMYG9X4tmFYEZs95JtiNOf8W
         9uafmnCTt+sr/ASQqjRB24bRBIwWgr/kTIn/r/0vNqNYOupyFxYnHxQ/uEY4Xi71TSWy
         7ihteucBLbkXiyRQYvfQs9ie9rbyEeraLhYGP6D58/AeVEi+YyJL8lBKNFuhUX81BpQr
         onGg==
X-Forwarded-Encrypted: i=1; AKwUvBwWE6SZ72m8+Lp24U7XcNjjWgjtCvpCfHUYa+P7Sr6IpXCbWS/Gc3FGnWM8E1nUcilxfcIfpK7IOu48x/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLALP5zx+4Efe1qFKO7RrMFVTmA/OJYQnqxeJplVpF8x3Dx41j
	ZrqI3mg4GarYA9Yh4RJa4nzBMCdQWxCdy0PF0E9dtKTVLxLRtSbEUiDj
X-Gm-Gg: AYBFou0MoGgut3u0+hF6VSSfsKdzfe19oJ93csJi+626Q61e94IUMISLnkgdAegrBTa
	d7p3YC1a5iZzbjoysiR33dj9EK/GXgLlAKCtxH/FlmwEu9Uld6BzFLf3RyUnLOo76B+/7lTaaSG
	Tx3oyunkd7qLk/UuDR95Zlu1eFW4j389aZGgxuxQDdp3OLgSkshKaj+5RhbFBbZMJdUuAWpS1r/
	4XSWdAqZ+j5eNi00VL7e4x0p0IsCkZjUqSlNxoXOVPMkXSMshv5/MJUnnFowZFU1DoBUjmNvWJP
	QG9CZdvsGtN/rYGTCYTe2kYXSFMFH/c+BRZbpilCK18GxwLeNVzNEm0HRpbny1Y15dThKHJMQrn
	RTErK+Kc42wHQJ7egcbFY5YKZVexN6RLocor09IESrHnB1GOE0CH7/SYJkT8bvn4TDITeyiJp7C
	NSAcW+8oy3dUBP2KBUQuYVr8EZ/7c5T9+YzhoVNJGyVmBmg2oBtoE+u85exml9OAklmZBA9p2T8
	Y9DVG4HLCQ=
X-Received: by 2002:a17:90a:b90:b0:3ab:be66:ddb7 with SMTP id 98e67ed59e1d1-3abbe66df61mr9344941a91.47.1792118699948;
        Thu, 15 Oct 2026 19:44:59 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc48f4cadsm1769353a91.12.2026.10.15.19.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:44:59 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Jens Axboe <axboe@kernel.dk>,
	Keith Busch <kbusch@kernel.org>,
	Hannes Reinecke <hare@kernel.org>,
	linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iov_iter: validate extracted segment for bvec alignment
Date: Fri, 16 Oct 2026 11:44:37 +0900
Message-ID: <20261016024439.4069212-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015181702.21329d323eb40d145a6d0c9d@linux-foundation.org>
References: <20261015061907.2713943-1-4ncienth@gmail.com> <20261015181702.21329d323eb40d145a6d0c9d@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Yes for bio-based drivers, but not necessarily for blk-mq hardware drivers.

The worst effect I have confirmed is an alignment-contract bypass.  An
unprivileged O_DIRECT preadv() produced bvecs with offset/length pairs
(1, 4095) and (0, 1).  The bio reached brd_submit_bio(), and the read
completed 4096 bytes instead of failing with -EINVAL.

I have not demonstrated harmful behavior on real DMA hardware.  For a
normal blk-mq target, blk_mq_submit_bio() calls __bio_split_to_limits(),
where bio_split_io_at() rejects the misaligned bvec before queue_rq().
Virtio-blk and loop both returned -EINVAL in my controls.

So a bio-based driver can receive a bvec which violates its advertised
dma_alignment, but any further effect is driver-specific.  I have not
reproduced memory corruption or a crash on real hardware.
