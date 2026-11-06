Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975991;
	b=j34GIc/lW1AgWKGHxQ9mqwoZpHrBXMpwOqxJAt32oqrNH10GCYnrhUucNK4dCwaVc1kq
	 Bjoxg812TvDQKrY2+iDTP0zNgc87hFzG5qlr29zl7fDpCi7vE6EWXCLaX09Ne7eYgdeVQ
	 8UAoIKWPgOVAWd+m3K4fhlR/9vbT9sgYqlnUq7hq6Yx/daa53AoROHd5hnRQfG6oDW7DX
	 KTT/PfaFOVY2dZNtlZvpO4NE9RrS/yyFnV21Q+1t4HSPHgzJLC3wvAbVPZ9LRSqvYEo8V
	 xIc+G7rnxE30WRcp1cK7Zj9X6q3iEz/sSrS5xiVsHrIqvKHqQi11D2qoIgxJtIg7uSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BI33hpZ4bTGQ1W8I7xzBVVJiQ5tzHH99Rr4lxg2VPLo=;
	b=RzK2EGV6p7b4aheZVJTNY64yCmptjIdCx9Q5N75Ea8BzrL7AiQFu76T4DECRjgGqlq51
	 UPdUC7EyhzFvG2zdoDfB5EPamyISln2MjdvgDL0C/mLHxiJFA1HEfyGWHir8aO/P2Tsyi
	 xL1No0X3EbvS5Dih6FcWezHJ6tgQmaSsG5wMddUtmtD71odhYam+ghQXrdNW9hTFgwo5B
	 +uqnTCio1QB5km85n5rXCgKgRT7TOg7tYcZhTeAB74aHO1t7BjlY/Re0SVdPEbOWujNUk
	 CmGcoDCKoAsRfE2BHdWzf9huA5xS39DTWDIBjReC/8lAffK/FE7J8zk2TGK7W+vPt+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=twwGumpt;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2224606A336
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2224606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=twwGumpt
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so1028104eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793975990; x=1794580790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BI33hpZ4bTGQ1W8I7xzBVVJiQ5tzHH99Rr4lxg2VPLo=;
        b=twwGumptiUj+ts/FuaqNnYTr+NPXEw5sOxF6f9nrRTPc/wqS4egEvAKRCphUMpdeWC
         bs2UWZ9GvrjOFVqCwDsp60sE3wrpWlpopHjA+pcvTrxDFKr34DPfhwGfhA0RW8NNN1AR
         91GFIVr9B2f4/9yypPZ7h7bw6j04IQ7s1hrAANgg6uE2S7yKxgY5XFDGt97y0oH/zEKE
         pdevGtxFgqxrufgfROsu2ft1oOG/7iV530NvsEtrp9ZWQHlDWe4/5d4E9Zf12fY0GEB6
         pmFlXNcph7eB8c4zM+PT1fUea7Nh6kY/qpotnUUYEa9Ra0dn0K9Z05je7LhIBlVPvO00
         neKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975990; x=1794580790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BI33hpZ4bTGQ1W8I7xzBVVJiQ5tzHH99Rr4lxg2VPLo=;
        b=cPT21Fafcwd3Bbc9kx5T/uHM+pP772bsE8/i6D5bmn3ERvAyhMH+G3B6bldqF5lyhH
         ImxQELWiS/iDneE7uFmymB+EJrDutdL1hNZ+pfZ7WiaEPsyML5gxS0urhmqGw3fvzk78
         dHDnOILmJrOTnw+MlhpTX641fZs/ihvQMnft+62rLqggBh/a5kH1OBmBn0sraZUOT+0s
         wbk+s10dkTjiK4Tw/j2t+O67yJ8e5Gic1lC95k1jH7fER0AuAmt4nXrwvBUQ108ZUQYz
         bHM2rm74lr2iEj4FH/5ts/LB0RaPOu1SOzet13mOEJURB3blDyaOZnP5OzxnI9XGKqHQ
         gs7w==
X-Forwarded-Encrypted: i=1; AL+hErEbLEN95ysXe4ZyUGgw/wyS3upjbbUwCD4VAGDpGjIHU0cBkIdXdhhlVRWSprVlPaFMoSEEfpGNMBLPhHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vatulcHFOIOz64UXmpoJkLhnFGP3oF+2hipx6LhHjkWwEySfN
	4R/zXte8aPbirfp8bcUbOxG/TbHSeeMZE3VLu3DXTqAWovUsh8MONm/W
X-Gm-Gg: AYBFou3zEDGFCWqKGqROgx+xkNay8JnQN9OSp5kIiKMYGecXP+huSbJTmIa6M3JdUSJ
	epfvk69jjeiyVzfScKjdcvF5t1HIUSrBWrkqC4cG5PL0FIY84CmF4LtjiFb1VuS0594qsqM6VlN
	f0W6yxe7ECkhmJbVlyh6Ig7kCeVjf7xmWUWj1S+boi2M24XhNsdjQxvS2ZfiZBrkmAMZU0Pt8Mn
	WQ2RT174qUFK68E2zet4YQv4SoKTpQzLndq71EjfpbiBwW1jdFAAqbQgrV20XrhTZEP4YuaDjEt
	S1HZi8F4LAdPVx8EJpK5U+Nb+tPYMK/XNXA0kur++4AM3B2vI6cUmuIElkF5SPQ0PrIJHcO889n
	FC6HMAr6WaNrhsBvRCMt1i4oQO9ROOmhGkZ1cRRXGpcElNg94xvFIpPfNig4igUkoOSUq+vRnwn
	f7NMzXLKNVNWtf6XiZKHiEZK7cSFvysF1J+dJ9xmPKv6GZDXyjf+bN3MMN0mLGopPe47vqpSAiY
	3NF3C4thpwHqtmPUTyKxeq3yt76grvFItAGoo1oBDm8+I4njXrL9Hu0bidswWFNd0ZEtngVodHI
	B//U1k+ZoayZGF5fiZwNuma5S1hDZAoSeBy494A=
X-Received: by 2002:a05:7301:d196:b0:36f:be1f:1191 with SMTP id 5a478bee46e88-36fbe1f11efmr2995180eec.29.1793975989305;
        Fri, 06 Nov 2026 06:39:49 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa6a649csm7182068eec.26.2026.11.06.06.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:39:48 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: dave@stgolabs.net,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH 2/5] rcutorture: Test duplicate call_rcu_tasks() callback enqueue
Date: Fri,  6 Nov 2026 22:39:10 +0800
Message-ID: <20261106143913.3627722-3-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106143913.3627722-1-kunwu.chan@gmail.com>
References: <20261106143913.3627722-1-kunwu.chan@gmail.com>
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

The rcu_test_debug_objects() function double-enqueues an rcu_head
to test debug-objects duplicate-callback detection, but only for
torture types whose ->debug_objects field is set.  This commit
therefore sets ->debug_objects for the "tasks" torture type so
that call_rcu_tasks()'s duplicate-callback detection is tested.

Suggested-by: Zqiang <qiang.zhang@linux.dev>
Cc: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/rcutorture.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 968343be4e0d..a056a79aa3d2 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -1221,6 +1221,7 @@ static struct rcu_torture_ops tasks_ops = {
 	.get_gp_data	= rcu_tasks_get_gp_data,
 	.irq_capable	= 1,
 	.slow_gps	= 1,
+	.debug_objects	= 1,
 	.name		= "tasks"
 };
 
-- 
2.43.0

