Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1891F542806
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060439; cv=none; b=kVVIHkJvkcrGu9Q0Mw4BTgo/VaAXFELhXKf/0UEpvFycKMB7YvDKRDl2wz8HWZBf1Bi9vxM/DgiB9t4ZQqMQQORM2Ut+Hubi0MKimH3dBJJhvq+CVzMyKHrz/ah1cV6c9mDCbgJW9RC6syeNWmphBlRnr9T/Tkzc9h2guxPH+Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060439; c=relaxed/simple;
	bh=Azb3ChUxnQli2+S5lscD/tH4AQE+bvqxYobuVYWHQ+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HJ0dRlyraH4Nl5EhfyRSmIRzd4one+XWCQ2RxSzv3CYjZRV8J3mys8V9SW0cAQGo+MbRTx9RXczOQNxoN3lYaAMUTQ8rqtHGH/t96vo0g5QbFFck7Ofpf/98lVt+95/NJP/TFJWwIu961recJk12Rorao7lyDAV/yy9muEqhOgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=iDbqLquQ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="iDbqLquQ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398b3d66515so7564941a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1789060430; x=1789665230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+sfjOHgzJyP82fsYeXuHc6zDgfl2ZB0n08E7UBdDAA8=;
        b=iDbqLquQy1Zo6f2z9J84HPloop4P7UGAkPjRLAoloRvS6KDJEwtkpLWwvaVYA9LJKC
         GcKN8zwylgliJWOUTxuHNrQPkecZiOgDPeXN8I1JmNRafxt4ai3M8bl3TNbgjPWKZ6Mt
         QbR1TBGsc00Y6pFelL0uFEx/ni/SeRgb2HPgbvHxH4fOshtxQtTxuRNW0cu5ZNBbkf8H
         EGi4PllFmat8uZjz50X5w8AhQHatUopBo1WvP5N2Fg6xrA6IWEvLFTY5z1M0zPaDRHAE
         V+37lvZoTBcH9aUM8habhUqZlHZLszNvBrKEi9xz75fWMWmEs54z5SzCkfsv8Bj0HWAo
         LxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789060430; x=1789665230;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+sfjOHgzJyP82fsYeXuHc6zDgfl2ZB0n08E7UBdDAA8=;
        b=c5/9BxX5I7cJI6WpGzzQ2KEF3a6287iWkmcQy6WhHo709VbUnwcRQeokVEq4c+Ehtx
         kxNPqpuMw1Zb4+VUfGLaN6DzgoUitczgOtGTP3/Tf/HKerHFSNMJIWLgbxTOBjit6hz+
         KuzDiTPfRxsTEnixQzPeg1EJa99cT4GWLZVQvZZ58XeFdu7SnOcNBLHtN1kGKfln7ETV
         +jcrXpqjEp17StiK1qkkoN3dd5PBe240AP+UWw2B8/3QdjXtrwPHdV8BsmFU0eqKmq52
         9cwSsiY1otulYVscCuvVO3/SLJ7wNHWa+aMn6cvJ148S21qrqOq9WrYtLppun9jXmj8l
         IHQg==
X-Forwarded-Encrypted: i=1; AKwUvByCbPuLyzSAlMK9KeRe7s9OcUYvDYFntY0FNeNNakJiR1szkvxHE1oBhyNPZ5YToG29mIDo6jWHVTHnZYk=@vger.kernel.org
X-Gm-Message-State: AFuF++mmEHUGLyEQ1BjfcvUzXcCHtAiEDXa3W5H30Hm6YxfXNXR3JXlB
	CxMy1nFdlj46i85ob33b9+Ew1qeAoxCC7dpY/XtchToNWvwxkO6LXYBi5Yhbst7/lbQ=
X-Gm-Gg: AYBFou0QXML7hYQjFUYIgm/MG12yC4mIH/20Jzk3SvtZPSHo4NZNDxknqfyoDLvoFeh
	kY8Irn5OErrMJudhIsCiUr/JODgz4OuEWP8iBPgIXHmylzUnzYr1uZCc3bR+Ov9C8V+Pk38qugj
	QJm00sSJ9m89TBYI2YN3nWTThWMRHYjYrvZcSYh69V+bflcypQRwTUzsfwDUBHkDrORdlH0KWoF
	aZbWwTR2Xm+eGMPri1ZLcVKxH8hrNxstuLGqGwupLVZjxyFxAT7Iz8sOOAbD/FAsrDLWCIKrvI6
	xtWOel2a9aZ6BpsfCm6oj4m49igI2C2IsuiqS9NJ5XnzCYh25bxv9k3KzuP8qXPKYKBamJs0GEO
	pvnOdO0DoqcZxM8gxw5eq//BxmTtKg5iX9tLQNyZ8V0DdGGCQWRNB78+A2XJ+6klVnUdEWUGyb7
	CsRZjtHuAE8xRKPwvVLaDUbhkdf9DAnvQuqv96WhhxQqDMu59XNmFvRvNog288Cf0L5BCJ6f52s
	vnPh4E1mHuuQAJcbIJ1AjoGU14tR3TfPg==
X-Received: by 2002:a17:90b:5343:b0:398:e46e:ade3 with SMTP id 98e67ed59e1d1-39b2628fc1amr67409060a91.23.1789060430253;
        Thu, 10 Sep 2026 10:13:50 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([4.7.95.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm59209809eec.24.2026.09.10.10.13.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 10:13:49 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sj@kernel.org,
	saravanand@crusoe.ai
Subject: Re: [PATCH] nvme-multipath: add fail_io_now sysfs attribute to fail queued I/O
Date: Thu, 10 Sep 2026 10:13:47 -0700
Message-ID: <20260910171347.19445-1-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <361d1726-ae09-4d21-a507-a792989e9f44@linux.ibm.com>
References: <20260904032605.65758-1-kiyer@crusoe.ai> <84112f53-5c05-46ca-97d0-550565fb941c@linux.ibm.com> <20260910015457.77845-1-kiyer@crusoe.ai> <361d1726-ae09-4d21-a507-a792989e9f44@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/10/26 2:00 AM, Nilay Shroff wrote:

> [...] So I think the policy would be better enforced at the point
> where we have actually determined that there is no usable path,
> rather than making nvme_available_path() return false
> unconditionally when fail_if_no_path is set.

Agreed. In v2 the check moves into the loop. With the policy set, a
path no longer counts as available if its controller is:

- CONNECTING: with ctrl_loss_tmo=-1 that is the entire outage. Same
  effect as FAILFAST_EXPIRED, policy-driven instead of timer-driven.

- LIVE with ANA inaccessible or persistent-loss: the target says no
  usable path, and today only controller deletion releases that I/O.

Everything else (RESETTING, ANA transitions) queues as before.

One interaction to call out: when all controllers are gone,
fail_if_no_path wins over the delayed_removal_secs queueing window --
an explicit fail policy beats a removal grace period. I'll document
that in the changelog.

> So I'm okay with keeping fail_if_no_path generic and transport-
> agnostic. The policy is essentially about what to do when there is
> no usable path i.e. fail the I/O or queue it— and that behavior
> isn't inherently specific to fabrics.

Ack, will keep it transport-agnostic in v2.

Thanks,
Krishna
