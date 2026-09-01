Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE5E42C51C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788230702; cv=none; b=Y2G5BygppyulKRsbeqowZTzsS01QGwxiSEsfYWC2vyVQiHQz+ExYFu+iP4uRYXS9ypW+YJ/SRMm8ZTSnYJFjHZ5hpymURlXKBtH26GY6tC791T2eQoVKCNYx1CikY6AQdlqLcCJRbVDjLlJw4uIYM4NQcKSRn9Be9Czp2UJSooY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788230702; c=relaxed/simple;
	bh=kWQopJYVhVzSr5LJOLRd3C0glY/JYUvMBW43bdSD4UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OlmWPUkeOgDDE7ccsK7v/yzcrC48F4J2AXdstgBFswAqKBaaSyglGqakIz8q2CsybuqVLk485FBTrJAN7NuVEt02QNlgdzwp57tnFyxDOFX1EyLf5ouAaiZWEwuBLTqKzmX5M3yk1+8IOA4lDv9wxBHxF1KFTWDAwuHFT6nzF3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gca0O3Yd; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gca0O3Yd"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8541875f596so2296921b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788230687; x=1788835487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9jd26Ppvw5fHt+qxt/SOP4lhOx5XYoaqJMElffwYH7o=;
        b=gca0O3YdRh/njgvM2PNMakU9jz7M52RX/pTWyeSTEQQYijSnb5vBEagXzYpdbJ7U+R
         qet+ZMUAAaqhYAoP0CuCQJRFNw7BOT0Xyi82idwVQ8AJXRPLqTiBhGJqu+y+WZHQmhLm
         mWwNtMBhNeVNKmSS+GHrRJ+82mhZcLIvG1AIpShBdC5wCvAYcyxY3zF2RkeGH6Emv/uh
         fBOSB1JchWF65EqNw70oq4CRRNYBxLU9sMgx8JCB+xWKeDq40GZi9vLI/5SoY98aHRis
         A7XSWcEYQzrouh4sVDMQyhlXsOEU2kydwdrrLCx6TjVme+3Zqe1ALCJ9IfjC11I+T2II
         MPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230687; x=1788835487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9jd26Ppvw5fHt+qxt/SOP4lhOx5XYoaqJMElffwYH7o=;
        b=jkoYbyhCugk5MJVy4RAFegutGgiUPnDzk8UeIEJC4rFptC0gAaqRhPffWtsI+IrNwj
         5I4XXTDWOe/UMrdREKDftbQWHGY3Y/t7nvokPJdeIxXulKLUS8WpPZlg3beh5xFONHl9
         Fe3JU/URbQogfvgwu4JJbHxs4iPLFm7/Tj5+OyDYWY79aeEGj+1g8Nl019ni08M7A8D3
         7tTZQ/i+bLn9bxdVEirrmJaN9x+JrcJv1LS3OrZHns7NgFqSlfF4XhNoAOTBZWpj1OkS
         MiPvw69gQ2DwJb++gc1x2NsA7bzM7yqL94co8qMnD4GTmmmIIpr7wdP6YicI2VwGB2v+
         m3Og==
X-Forwarded-Encrypted: i=1; AHgh+RqSJyo6xkP6pR6N7ixNjPQ9NdIY5zKL5QP3gy6jBrdovgQKN36pFvSpnNCIY8qFGheEB4ILfAfglYwaoZY=@vger.kernel.org
X-Gm-Message-State: AFuF++mly6ZBkLL/cDQQHBHXhivKTw36d8NnYWKnRQZXhXCG5SJYQiwo
	Lll8glJjtcMj6gRPKwFYNHKVWwAA4epaQ676/BNuhPwETRjVYFm+nzDd
X-Gm-Gg: AR+sD12shuPwxjUeXzB3OMeXRxjUuLdYfiINHyb9gaLer2hBaQRppSPZWiqRkPnhBfv
	z/HuKthRyfw2toE5ZZ7iJfK6/lyG1bzq+CRFf4V9cQJawSPMC3H5N/cRFEKl+WRwI69NliVD+Kx
	CzQL5n7HS1NJTOD+KCltmZSqyl3yOKdkh4jkVvitAlVLY2Z1DgCY/KnydzR9aGPKr4aSp61T5t7
	f3Zn/9Rb5kkPjXDXlf5CGP9wka/HrW+Y5eOJ/teORJ86Rmae8OxZuoaoMSGluPLQk10g2LMC6Fv
	2sJGOjaAIeQ7de10aVesVPBh1/nwpQfZyBsLxikvcU2RYSn4VCgpLSgDtvoErEx3LUroueFr5qo
	PsRXt/Ah1TUofAvIyv+eZBKgzEGqTR6YYVfuaSGTt+8mwATn7AwUAPTlXUkWaINA187a5xzvDvP
	q7BufAXA3jjnyuICE7zd3Xe1R2djdOIUocTV9vFWEKtkNN5c++IZt2x+8bxR93Gv6Vq/Qvg5kl2
	Qba8DOZlnk=
X-Received: by 2002:a05:6a00:4190:b0:82f:38df:681c with SMTP id d2e1a72fcca58-85629d0f13cmr46778444b3a.6.1788230687193;
        Mon, 31 Aug 2026 19:44:47 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85be6569d84sm301707b3a.22.2026.08.31.19.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:44:46 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: sh@gentwo.org
Cc: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	jstultz@google.com,
	cl@os.amperecomputing.com,
	shubhang@os.amperecomputing.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH v3] sched/core: Skip rq->avg_idle update without a valid idle_stamp
Date: Tue,  1 Sep 2026 10:44:38 +0800
Message-ID: <20260901024438.1830934-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <746602fd-e9d5-128f-bd6c-e5ce7c756916@gentwo.org>
References: <20260807-master-v3-1-c328354efed3@gentwo.org>
 <746602fd-e9d5-128f-bd6c-e5ce7c756916@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The diff of 4b603f1551a73 is its own evidence, which may be quicker to=0D
look at than the description:=0D
=0D
  -	if (rq->idle_stamp) {=0D
  -		u64 delta =3D rq_clock(rq) - rq->idle_stamp;=0D
  +void update_rq_avg_idle(struct rq *rq)=0D
  +{=0D
  +	u64 delta =3D rq_clock(rq) - rq->idle_stamp;=0D
=0D
The trigger moved on purpose, from the wakeup to idle switch-out.  The=0D
guard came off with it, and nothing about that fails to compile.=0D
=0D
Two things about it that the changelog leaves narrower than they are.=0D
=0D
rq->idle_stamp has exactly one setter, fair.c:14563, and it sits below the=
=0D
ttwu_pending bail-out at 14555.  So the reachable set is not the three=0D
examples but any path into idle that misses that one line, and since=0D
update_rq_avg_idle() zeroes the field on the way out, every such entry=0D
starts from zero again.=0D
=0D
The sample is not merely invalid, it saturates on the first hit.=0D
update_avg() adds diff/8, so a rq_clock() of ~1e12 on a few minutes of=0D
uptime moves avg_idle by ~1.25e11, against a clamp of=0D
2*max_idle_balance_cost in the 1e4..1e5 range.  Both places that consult=0D
avg_idle to decide whether an idle interval was long enough to be worth=0D
balancing, fair.c:14504 and 14584, then stop holding anything back.  It=0D
only ever adds newidle balancing, never removes it, which fits latency=0D
reports rather than wrong results.=0D
=0D
I also went looking for a stale stamp rather than a zero one and did not=0D
find one: 14674 clears it when newidle actually pulled a task, so no idle=0D
follows, and the other write is sched_init().  The field is either zero or=
=0D
this idle period's rq_clock, which is what the restored guard splits on.=0D
=0D
Reviewed-by: Zhan Xusheng <zhanxusheng@xiaomi.com>=0D
=0D
Thanks,=0D
Zhan Xusheng=0D
