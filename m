Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7A825B084
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106616; cv=none; b=nIUyvbDas3u8bJDoQv7lhVgvVz+DuWLLR6vKE/XEmOcAm5h169azE7noLev1CYjhIyuHiJ/YX1VcW4yQ35r1XJz4wSbTv5wSboLMtIvidJie4hcnQhrC5MG49zvv3cI0ECSsGb2XZ5QUkbVJmRcVo9pvQM0XHUcz23J+cStHMKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106616; c=relaxed/simple;
	bh=f7QPvMTT9b9wXpDl9a7IsqJk222Pi1TGuQ32NsZvNfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RmALfzvKNajs0fjKDqdV6jhFjzAWyjTExiaZCvf3dA1MrgFkL0qGxygshQvIv0hCK2kTe08aMyYats6VgH8DjLsIVLv/XQVsTg/IP1P4gIdmtfSmfEv+L1u8s8hqVICbgzdaeZxqmO/CEijaRlnYwE232azRG4bfwzfioBZ5fZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=ZBvoZlrR; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="ZBvoZlrR"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6b1c75f0049so555964eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1789106614; x=1789711414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+BjoqHo0QynWJyv+c8A4+PUEN5brhXPIQlpmzw83mcU=;
        b=ZBvoZlrRf62M2DrlBCQfPtUdqpvRn1LjpgXG68kk5mRx1JKy8xlwzKfLM8fk/1yKzo
         sTIMJn8BFw8dJs++Wsazek9guQiJjUOLTGwzW1ZaieHFNwi0Nnv4O4VH7q2zZfHculgy
         UCdWzw39eNk6RowhP+a/uJn7pyUlnIHDEpZh6ADFnn0KmRoHuUZrkMhBVjo1WVq4RmOK
         qDNMUWGq7Vpa3TUIPt0zW47oUoD/RdyJzxkIjqAixVkNU/2cfICZ6AoB5g0VET/149VS
         T918RoxMbiYeFSvRndVmdM/upadwfaco/fiHTy1g0ZaRWAl38I6BclmK9zMcZ6He2yPd
         DI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789106614; x=1789711414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+BjoqHo0QynWJyv+c8A4+PUEN5brhXPIQlpmzw83mcU=;
        b=Rf0omVNLMCLNFZ7B2uMLXI1TeS0rMRm5LG7MgKias7OkaJtIaGbmjmW9peb9821i3Y
         S8RlQilw9MOVwwbws55TLY7O1iMHzAfnHus+UsS6vkrumsZEiipz7dbkBI2/XXIhHj1D
         TS/Y7BJR+8rRu6PI5l8NcRT33fXG5frBws85QrLIWMa/YUmPjWaEr6WmarPp3B7nNGma
         npuYgdqDZKg6+s1n+gf8JRf+Y8I6zh0FlNGZLkAx+oh5JPfmyll0bYkGjTkgDsANQRBQ
         x5hG+2JPA/8ZRnXr9garUplpG8LuoQEsQWrlLhNq+V6/Dshaumfga40yfvbmIuQXyjJk
         BfGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLnb57+QPH/sY1tWGEGMLUYP2MlepfL9mEuwdU6ShIH0kSMJ8ZlHV/JGw6Iu7N/RGkGtO0PCx3MLCoqMw=@vger.kernel.org
X-Gm-Message-State: AFuF++lHZfCrLlmM3iQ2dMXPNRFAoOWzrUikttkdzZNpSRI4VIODJVCI
	99bfv+jHZeWpHZ0IdjDl4OhCGVqQxV2YnfvcVA2OYHMQtqbG+hTIrNBa0Pc1/bwIoDU=
X-Gm-Gg: AYBFou1HxRycXomA1qude9zIl9zxQocD+3w6heqMUvNId83sc6dc1QLPEtgIggS0k91
	xEktfri+tfqYY7z3AuukYmJZJyntsHQQs0zd0PWa7Miym7iXiisFB3rrORfCKTPnRtdTJzzKJVV
	CV1haoEekJeN+TATpEnIM18zyZTu7xqouA8tdo1XF9TvzhLD0CB5vjhbMGeSa3sd6OKFavVQTeb
	cDTmurGQFwFqLDEwmVeimtVErofoBchHZNoegFjP5Rb1LQ/NQIzgM6wGb+lZFAkBu6CHAyU3TrZ
	SVznBJNQaNrq0nhnV/NMawpQe5qOMKI+vZhQ7oy+WWDrhnwCe7US76UOHaaWwvlfUAmtgiMXHe4
	bSb50m1y22dEVvzA1r/H2AXv+iol+MABUkFWt+DH/E55ES2viMUTeNEc+BDmIeG1LqWE5NIJCo/
	3B4blnrlyvdRqA495zQ6qn+IhRgLPWcVMf0NDqe1M6PSZbkhhLukfYdabckb7GNaHQdO6mlSVbH
	RwEiTBUMtYX5YamcLKop+xRYnZOpHyFuDdYxMi8m6Xe74XZAwQsHQ==
X-Received: by 2002:a05:6820:c3c8:b0:6b1:535a:eb8 with SMTP id 006d021491bc7-6c0ba245822mr1214669eaf.2.1789106613729;
        Thu, 10 Sep 2026 23:03:33 -0700 (PDT)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([2601:647:4380:3400:61fa:b5a6:b380:6ce0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fb3ddasm2965890eec.30.2026.09.10.23.03.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 23:03:33 -0700 (PDT)
From: Saravanan D <saravanand@crusoe.ai>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: Saravanan D <saravanand@crusoe.ai>,
	linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Jens Axboe <axboe@kernel.dk>,
	Daniel Wagner <dwagner@suse.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] nvme-tcp: allow setting per-queue io_cpu through sysfs
Date: Thu, 10 Sep 2026 23:03:28 -0700
Message-ID: <20260911060330.59998-1-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <8dfee10f-89f3-463b-8d16-587873c3394c@linux.ibm.com>
References: <20260909211432.6741-1-saravanand@crusoe.ai> <8dfee10f-89f3-463b-8d16-587873c3394c@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 10 Sep 2026 13:55:59 +0530 Nilay Shroff <nilay@linux.ibm.com> wrote:
> I wonder if we should avoid introducing a transport-specific tcp_queues
> hierarchy here. io_cpu describes CPU placement of an NVMe I/O queue
> rather than something inherently specific to TCP, and other transports
> may have similar queue-level attributes in the future. Could we instead
> introduce a generic "queues/<qid>/" hierarchy under each NVMe
> controller, e.g.
>
>       /sys/class/nvme/nvmeX/queues/<qid>/
>
> and have transports expose queue-specific attributes there?

Thanks for your review.

A controller is backed by exactly one transport, so we can adopt the
transport-neutral /sys/class/nvme/nvmeX/queues/<qid>/ path with the
creation staying outside of core in nvme-tcp, which owns the queue
lifecycle. The core only knows ctrl->queue_count and never sees
individual queue lifecycle.

No other transport has queue attributes today, so a controller backed
by rdma will have no queues directory at all. The path appears only
where a transport populates it, and if another transport grows queue
attributes later, the creation can move into the core without any
ABI change.

> So could we expose this state through an additional read-only
> attribute alongside io_cpu, for example:
>
>      /sys/class/nvme/nvmeX/queues/<qid>/io_cpu
>      /sys/class/nvme/nvmeX/queues/<qid>/managed
>
> where "managed" indicates who currently owns the CPU placement. For
> example, "1" could indicate that io_cpu is driver-managed and "0"
> indicates it is managed by the control plane or user.

Agreed, I can add the read-only managed attribute, 1 when the io_cpu is
driver managed and 0 when the user assigned it in the next version.

Both suggestions look good to me. I will wait for Sagi or Keith to
weigh in before spinning v4.

Saravanan D.
