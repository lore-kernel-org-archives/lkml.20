Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE0236C9C5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811987; cv=none; b=PGU69VY+7neDvMMHwqHsuIy1Kb/nlwk1lym3VHmo3df3cCvO6QHAkD9/3S+mBROW1Cdia7SjVWpJWFWH87BdwcMENCpdVzT0XQ0MYEJxEsjeA+UWVixTpZdhXWu8l1xqP58vUiThBpBsL4pEkNU7yqtRiqGFYPTygsVeDnpqmhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811987; c=relaxed/simple;
	bh=MhR/O9YR+tLXH89Yp9WTGR6S+txwPZZ+ODULgnbvCjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VxAcByq/GIoDzJ+E0ZyuXCZMgZCVe++9jE2UdBz4SsmXUFZTSaEEDwLv/TzkUoCBBJgeUtrvCrWn/LWAIWm6Bxgwh+/c5Tp8xVC/asyvbVg7cHPOE8Pjwd6xw8ap+Spxcq6mPN29rnHB3xXk35X4XZqnvkl+qe7BzquYgO7Q1Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaYBtXBF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaYBtXBF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49e6b771d06so4881615e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791811984; x=1792416784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MhR/O9YR+tLXH89Yp9WTGR6S+txwPZZ+ODULgnbvCjQ=;
        b=PaYBtXBFe94Z+7s0xfiHmaNHmuzB86zdB6yEkNKSx9RY9LssGorfiZAON40jUyv9zt
         dTGIJzL5iqxoTz4HjzNezC3YSJ/JLWnXiR8M3fZK+QK81gY7Npuqthf1/gxvX2ZPDQeg
         CwbJ0u/gZfB6j/wqMewXerb0sWAvrbFgXfeyTAuH+FDaTe+12ukbkpbXwzReu0hpXajP
         d2XDe7P4pPFRHwUSivhWuhvl8ah+8F8FeFqmW/UYOUww/7RXe3p6UAN58bgv/4UViyvr
         4lwtXWE4VZWoMRLtZaqBK0RTgcEzGq//ifa/8V6pv+MZK3Ne8cF2mVw2nlmwYRTCtosZ
         syBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811984; x=1792416784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MhR/O9YR+tLXH89Yp9WTGR6S+txwPZZ+ODULgnbvCjQ=;
        b=ZSLtiZkEflEYvlVNjDJhgiweobqpzE1NdV6D46so3/Tq7BmCsRaXfbAcIgCdINnvjm
         kkiUc54WuzTftJbfCZTCXpnB93a6F7RDcw8sNKaLErBm8RO4ImQQuhXWymEYVirDFF+t
         SZFFQG88/u7tvNxZnLqAMUeqqUPHGoIA4Oy24MEK+A5XFa5VoI9y+3jLBUmyCE/7inZ7
         zMWLUmbLu0N9be2gueDLslbKR0eCJJjzjduFK+40fTPIVKm8h9RyybMoXobeO8PFyKb0
         YtXr28KNMQTbfQ2MW4LZyfIXilz8x9nIk/qCeV71zb4Uc6zM/mj5gDgQQNAfOhkC5hEi
         kmYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxI8scEwkGRnUuCwr4wiizVGknF1kzEDZG3GqIvapnSapZoW9t2p5UdSHuAvFtWOlZLS1OWxgde/poeTTo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAXlKPyHH2LfjIgsxCqBw8R3+7C8ibCBWe6r04Glvqse1iZiEF
	/MklC6agYYJf+DA9WDBOHPyiY2dYOZPci6pv5AdrRpMollAnQPDnPIX1
X-Gm-Gg: AYBFou3WGDoPTskNdfvr4MXZRlMBTYhag7AaC7kFv4Pu5haqWeXG3pxn9XUZhibZe2A
	r9opCfw4sy467nMONZ3OpZr/llHOkp3iXa1iiXZpfhy7gvbfbZ6STq3NbSg+TPshlPw8975Kl+A
	ozaHkirfpOm6iz8QRBlK3LcopWQJyRWjvAZv/Fl2Qg7thaE2xcte8vyKO7EGmjlpuFgyBx40e9j
	YPecFZlH5Y9tbxikj/xEH//C2hBX0ie77v3+SGZzvjeyKyxrCVxO1Wo6QNX+QeRi6wgm78u+Gbg
	0a4SL3csMFDSiGIFJfSqy4kGwV8u3fStfb7UHZ8EVjKXhKmF1ugFoOfaZVeMogc861fBE1cSOuF
	skUb2mFslBwKQEQn//fXBk8MPYpsacnOXsUISwkf3b0tQBZoRIPs7iC24MeCXKQ5N9Qhop92n+W
	Rm5J+jrfzcGRJZ7xh9vjC64xIKSDgggeVdQOe/pOyHo2vEMml/CS69yHsq9rKOmGSb/dO/9eqGZ
	xzYySKeznW8Iw23jlAv
X-Received: by 2002:a05:600c:1e0f:b0:4a1:8469:e6c8 with SMTP id 5b1f17b1804b1-4a18e46f48fmr168412175e9.1.1791811983844;
        Mon, 12 Oct 2026 06:33:03 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm538070235e9.9.2026.10.12.06.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:33:03 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: christian.loehle@arm.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH v3] sched/fair: remove dead code on enqueue_task_fair()
Date: Mon, 12 Oct 2026 16:33:00 +0300
Message-ID: <20261012133300.2617-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <fd3f9d83-cb5b-496b-b7c1-b40f31cf795e@arm.com>
References: <fd3f9d83-cb5b-496b-b7c1-b40f31cf795e@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On 9/11/26 17:02, Kayra Cizmeci wrote:
> > cfs_rq->curr == se path on enqueue_task_fair() seems to be unachievable.

> Sashiko disagrees so I had a look and indeed cfs_rq unthrottling reaches this:
> https://sashiko.dev/#/patchset/179033365207.2819794.11851486661940182495.tip-bot2%40tip-bot2
> See the splat below.

> I'm afraid we need to revert
> 819224e506bc ("sched/fair: Remove dead code on enqueue_task_fair()")
> on tip/sched/core.

Ah... Fuck. Yeah we need to. Thanks for catching this early.

> I guess it's non-obvious enough to deserve a comment...

Probably...

Thanks,
Kayra

