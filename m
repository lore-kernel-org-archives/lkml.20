Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEA03128DF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 04:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791519330; cv=none; b=fo8p9Xnde17JClJlbRROV6NvhuMoz2YtSSEY2dsEJPcstME97kiTnZXYGm3eNxzQxmFpCGXx7HlQ8r/nReHqxL3ZjRC5bjfTguukNongQ7K2g0VdqJYabhcMypyn5huWUu4JZDQYP+mGzxb+dranEO5G5OaPVl/BvdjIzO8e7mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791519330; c=relaxed/simple;
	bh=obDhGb5RLj9PYZ2eyCinsmiE9t59PJFY5sRh7w8PNpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cp/XYZ30HDcwB6wWgsTvQ8cI1mAXsHpqe3QIt0eHqP8PAxfVBihiPEYSVWrjobJqdBYTHvCzoSMlmyXm9JrfOu2ibqfpV8N+WQkUaiFMvdqZunLZ1ISkw5NPPrQQbVSawDT2v61k4uR7kp/TCXIKAOjVrS/5NCTCxM1JQtPvdc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=kZpnoeZP; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="kZpnoeZP"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5339733feb9so33192131cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 21:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791519319; x=1792124119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnWq/2eDeNny1MK29b1wAOjSKjT1sD+08M0tNeVnBUM=;
        b=kZpnoeZPlcvKM0n9ji/eQOOihiVhLVb5lnDDkenAEGA2XoYdXbHy9WCxh5xn7CHsgu
         FoVXGD0WEgKcg8pT5pQwBYqyGT25XPl/ejMgHN9mIp/2UGkumZUz5woaEWJR4Y5vi7WQ
         U8QUwch5VMisthQTiBIGfnsSfzgpHVuhdDGas09I+JGCyg4aWI7jLhoeGQeLez0kdCOw
         rxBF775qHoZoj3yTp9SvgCRZFdLuZUSMy8KmeR50pHOdpZWKnM7/Imp3mD2Z674WoZkW
         sxCzQt6RzRLEr8bfJ5XcSxV3upYwloV81lExbTX9FnzavZDS7/5+y+K+co8FAPTht86J
         BKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791519319; x=1792124119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnWq/2eDeNny1MK29b1wAOjSKjT1sD+08M0tNeVnBUM=;
        b=N1Mt3p4W+2xGyLvhTNY3CoqLSZgmLX3Lv1V8Xs/ZHa201Qh6rG5jM1WWNZwwITHtTU
         znrQO4Y4aZWIOH+551wSoxDPRNmql1/J4owEBdLnIA4osPTymW7smWi/uMUIXvJqXqMF
         640gdHJsLADbct0gzv2hu51jTAMYNkg4OPbKXJaHHkzXxx/90FW4+8sUpQkbM1dgcSJ9
         /eYAdvquQLBY5xjhrRYjxFYAFBiUeuuv6Uw7JlEc9yCJg92nloas9kKE9DOfHAvSawwb
         4P9h14DC29MOZDbsU441hmsraRzv8o+m5uliw5ofr5H6xV4z98bAOFs4MJb/t4Rm0Mt5
         fvcg==
X-Forwarded-Encrypted: i=1; AKwUvByw7x0apKldyYWq421DJYlG34zdloQgX20lBCEGfHGwIHErAT11vL+/6c0dTaZwR+1kTTzZDIW8R9i9HAw=@vger.kernel.org
X-Gm-Message-State: AFuF++lBT7erzVHMqXCnokrL82VZxuOMoIW8ZSJ/dzAgVraOmEkhT3CE
	xGEmWH8N2fY/ifAJI4nPfduwLn/I2oQA6B9D/0/dCtLNaygLPkewcG+AiTGkUl1Xmg==
X-Gm-Gg: AYBFou1RNuBGWOq4SXelvZQZSfu6eQav6bhYuOabjbP+VWJf92T1egMmtYjK1IkrxPh
	Jsr8iJ/8nFkL1XctEKplqUnJjHSf6tBP5hyUNUxsSf9+KUsqJoI9Vq09ISKQtJjpIR2uQi+QEyk
	JgMvR2VWSZSukHIr/ZUHqpyvEapgaTZ6DKFzRfTeJOHQWVDWnO5ODmkGnPb2Vj9iFNSEJQzFVsj
	+INaTFeBbtUTdqXkQZnRRSzqTMAYJa8iJxWZoESb+aVOO4e+0QHPM40gBZt8oLFczEYLxMT4WqH
	iXss6DJIRm1bptscog7Xyrty6lNvJoXmmvayaXrEIif7c/j7/taCnFz7iDrE47pr4nyOC+viQKI
	fp3kVnODGc5zY6nXM68Lhbee0qYp6iiIMs3As3jqurE4yj8DK7ieXsDjXPC12TnAGKWHPvsEoJ7
	1Uqgh4eMlaa/yd2zkXnxZ6k3eA721Dp63pdq864HsuwBmAc6Gsd9lsuclOjC4FEUWSfAeVVML+y
	uu0e5WtVJWcj1b391AHPw==
X-Received: by 2002:a05:620a:17a3:b0:93e:84e5:3c66 with SMTP id af79cd13be357-93ebd21ffd0mr104850285a.40.1791519319093;
        Thu, 08 Oct 2026 21:15:19 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98906c3sm96184185a.26.2026.10.08.21.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:15:18 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	David Wei <dw@davidwei.uk>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH] io_uring: do not charge user provided SQ/CQ rings to RLIMIT_MEMLOCK
Date: Fri,  9 Oct 2026 00:14:55 -0400
Message-ID: <20261009041455.1974346-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <3b9d9c06-c6e8-4166-87d9-c7c220ad0b58@kernel.dk>
References: <3b9d9c06-c6e8-4166-87d9-c7c220ad0b58@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/8/26 1:11 PM, Jens Axboe wrote:
> Honestly, after taking a closer look at this, I think we're better off
> with your original patch and one on top for pbuf rings. Please check:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/log/?h=io_uring-7.3
>
> for the top 2 commits. If you can re-test one more time, that'd be
> great...

That works for me, and the two commits look good.

I tested io_uring-7.3 at 9f0c88b7f884 as a user without CAP_IPC_LOCK and
the default 8 MiB limit. Number of objects created out of 64, with 4096
entries per ring and 32768 entries per buffer ring:

                                        v6.13  v7.3-rc4  9f0c88b7f884
  rings, io_uring_queue_init()             64        16            64
  rings, io_uring_queue_init_mem()         64        21            64
  buffer rings, IOU_PBUF_RING_MMAP         64        15            64
  buffer rings, user memory                64        15            64

30 processes with 142 NO_MMAP rings of 64 entries each, which is what 30
PostgreSQL 18 clusters with default settings create, all get their rings.
On v7.3-rc4 7 of them do.

The per-user locked_vm count stays balanced over ring create, close and
resize and over buffer ring register and unregister. Registered buffers
and IORING_REGISTER_MEM_REGION regions are charged and refused past the
limit as before. Every liburing test gives the same result as on the
previous tip of the branch (c746673517c6).

For the buffer ring patch:

Tested-by: Hengyu Liang <hengyul@cs.unc.edu>
