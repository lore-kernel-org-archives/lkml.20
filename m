Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297402;
	b=X6gnoKVJJ9aSdsmiGgLAAhbLsBcJxcOSvAmVz3RTPphcXvRu5L6zKeCSwPEktVnzW/y3
	 UTIYB/BmRCHX9jb8m9YB+xQ0VCvoYo7oz4vmnOS6rb1MTI33L8hgylDjsCHB4scpwusii
	 slFKBhE11TegS64DErpWbIIrzVozqhQyUKNEIsbV0Ya3K1LDaeYSKE/IP5yljN/ASexut
	 I6SWaUQ7WliEeCJztV3Yf/GjXdHxGs0GU7VoEXyUuIEhVUFHSOhgQSGFJ/I9ugKUqx62s
	 XLdi6VB+zP2ItvA2gIjMISBANuvRtn95PnJQqMo515gq5FEPcbzcGioFeAFzvHLifJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RlQUuYiz1FCtWrnI0FR4amz6PP3ZtOjRWsNP3c3RScw=;
	b=mnpZ/VZGWBwNXpxTe01Z7aDQxWFQO3T9CsvEoXr8xQlDT3D6Tg6KVVPvLXp1g9QTnyGF
	 MaS93CdGjzNg8DEsnEZJYx1bDPUl9Ltuk0YMiUjBDvE6+22R662wESR8G29gAY2UURyKf
	 jmejtSWB2tgGmUFvxSlQN45IqyOOVbCmGvibJVgbRJZsLzaBqrKD4oqb70qcFL+UM8ywe
	 U1Y7pJ1QsjTLuuDS27TvnVTZMfc4oglJqv6GgKU0LwdF4VhRleoi0eknnBmjmIZrH+sJL
	 luNOwDru2se1T+18MQexFpKgDa10Ozm/LrYcw8WvEcBReTSPdB+heuDqa3cNV7iCsBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=Xg4K3yuf;
	arc=none smtp.remote-ip=74.125.230.197
Received: from mail-qk2-f5.google.com (mail-qk2-f5.google.com [74.125.230.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F2D60A3817
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53F2D60A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=Xg4K3yuf
Received: by mail-qk2-f5.google.com with SMTP id af79cd13be357-93cafb09378so121125185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1793297400; x=1793902200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RlQUuYiz1FCtWrnI0FR4amz6PP3ZtOjRWsNP3c3RScw=;
        b=Xg4K3yufJiDKy1nLDLDolUzOXCylFf4dVPixfUWzJM314JVKpNGNgsDXm9hRXOwgtg
         zcTePD+4YKcudndMWVHz7cYAc6e+Qa5LMgRlZpZToTAAW4paAre25wbbrngIJuDwxzHs
         Qce7jr+X5ZqZQWvavz4EzAePVpaRs8uVIjzCpV8jbKD5ge5+eiPq8VEAvddnI7PJHZfu
         9tgB2zK00oTffZsleRejkG0eIT0Zc7lpzsDTG+DPN00zDNIvECvIkYpdlgWemf4yJrN3
         Fm615h+K5RkaZg9p8NU10M4PP+NrwPAVwSKSwiIENJ9OYkHxTtdqbnztIiALdubjE6Yt
         dpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297400; x=1793902200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlQUuYiz1FCtWrnI0FR4amz6PP3ZtOjRWsNP3c3RScw=;
        b=E01FDue8LfwDfib1k2YqQASHhBY/oQbl9adkarImtjmiUXr4CYdf/HkAE2vyTyYBFd
         7zg3/OyT2ius/cGND2cTL/M19W8tIqZH0pyWoTsdyPscT42nOpCivzIZTdyAsgnRKUdg
         HijZ83vn6WoFTFHDpzacP6KToiOqGpSUWaew4YOZrFXArRefVtRw+4ORgNOJUlUgFBS8
         uWdjbP2shM/hFDkhjweQZ/uE8MbCWMuk7GVGXWYVkTM8zWRkH34FfxfdqwTGsuCEXKSR
         ZTga6xr0tGZ9IIrn9Gc7qqkM9XBIbkau/AiKga896MgPikfOc/4MNnC1ZseV4XtoxWI2
         HxFg==
X-Forwarded-Encrypted: i=1; AKwUvByL69WoDmerz+0f/Lanka7OuUI1leofO/NaliyO9wyuqOCUeDf5rW7O1VOPimapVpihwKCICP1RDJzNlCc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMgt7GfaPXTgMubFlvHxOGuc/Jub50sHaIW4AGdsG1M2RMzqar
	vTa3MtJWQkcJQ32cwV1k+MtAktUHYYWc6XnUgSJZYyzZ76zEGKT4eKZr+CxyIceUKns=
X-Gm-Gg: AYBFou0rK3W8IBvGb8QaJYvBTVU1l98zZcNsIM5PKHutYL/ChqcajYl2edb2Zl6qnga
	99IvSYNFirmlgdCdMmBAOwAeA+vl/bhRtFLzSXZEFbtpdLqcNvOzt7YJ90J3tulQe5EqLZTsbwB
	0IsZMR/S8xt5DqB44P/km/aSB6yrH8u766m7P4RV+HvQ+isArz58lCpnA6aqC+/iqMAMwIEfE/7
	zvIRIfvBYUNk43huGSuwvbD69QDn9rI+nL1ntvEHCX9LNVZWvDZO4b82PraCsb4ifVyG6x+qIRV
	rc54TvGv93UvpOgnXUeK/fqQG/ewyeSRv/CtOrGbW+SOnu+fLdC4LaosROmm6kd33e/ZAuHSgkc
	3JLLTXm1Xdjv4dixcHJw6XwmYnYXxozZuJJP6Ul9+p5vczGlUpfr9UJexhV58LnQJaxmtUKo0g3
	Noqw7C/+eLIL5M6aKwraafTpIwRVYLnHXriC6ARkAtmUmNdhzAEEkOqXWhAN6d0C0HXG42KXMRi
	yb9AGp8oS1v4NUrAbC2q+991tsZCcLjDBlCCNH0f6TPDH+7CyVOfJaAlAjBWxhm7YTMM3b/hBVY
	Q5w64iTyHAtubvegqiD/Uu36LK3RKa+Fsc7/t8zx70+CEmxnFd9MREJwu/ux1Rn3qdmfVhJvj+W
	QBaYhoVYxpPQuDtj30pEoKm+Vfeaex6NmR/pm
X-Received: by 2002:a05:620a:a0cd:20b0:944:12d5:fd45 with SMTP id af79cd13be357-94412d5fd66mr399408385a.70.1793297400257;
        Thu, 29 Oct 2026 11:10:00 -0700 (PDT)
Received: from localhost ([2600:4040:2047:3600:64c0:68e:df43:40e2])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-9442120c8d6sm6925185a.21.2026.10.29.11.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 11:09:59 -0700 (PDT)
From: David Lee <david.lee@trailofbits.com>
To: jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: David Lee <david.lee@trailofbits.com>,
	Kyle Zeng <kylebot@openai.com>,
	Dominik 'Disconnect3d' Czarnota <dominik.czarnota@trailofbits.com>,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v2] net/sched: sch_qfq: prevent aggregate self-replacement
Date: Thu, 29 Oct 2026 14:09:57 -0400
Message-ID: <20261029180957.43015-1-david.lee@trailofbits.com>
X-Mailer: git-send-email 2.54.0
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

From: Kyle Zeng <kylebot@openai.com>

qfq_change_class() snapshots the current aggregate settings while
holding the qdisc tree lock, but drops the lock before selecting the
destination aggregate. During that gap, qfq_enqueue() can move the
class to an aggregate matching the requested settings.

When qfq_change_class() resumes, qfq_find_agg() then returns cl->agg.
If it is a singleton, qfq_deact_rm_from_agg() frees the aggregate
before qfq_add_to_agg() immediately accesses the same pointer, causing
a use-after-free.

While holding the tree lock, skip the replacement when the destination
is already the current aggregate. Any estimator replacement has already
completed, so the class change can finish normally.

Fixes: 462dbc9101ac ("pkt_sched: QFQ Plus: fair-queueing service at DRR cost")
Link: https://lore.kernel.org/netdev/20260731140533.566493-1-david.lee@trailofbits.com/
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
Co-developed-by: David Lee <david.lee@trailofbits.com>
Signed-off-by: David Lee <david.lee@trailofbits.com>
---
Changes in v2:
- Add the net tree prefix to the subject.
- Restore attribution.
- Remove Assisted-by and add stable to Cc.

v1: https://lore.kernel.org/netdev/20260731140533.566493-1-david.lee@trailofbits.com/

Bug found and triaged by OpenAI Security Research and
validated by Trail of Bits.

 net/sched/sch_qfq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/sched/sch_qfq.c b/net/sched/sch_qfq.c
index 6f3b7273c..e900890e9 100644
--- a/net/sched/sch_qfq.c
+++ b/net/sched/sch_qfq.c
@@ -517,11 +517,14 @@ static int qfq_change_class(struct Qdisc *sch, u32 classid, u32 parentid,
 		sch_tree_lock(sch);
 		qfq_init_agg(q, new_agg, lmax, weight);
 	}
+	if (existing && new_agg == cl->agg)
+		goto unlock;
 	if (existing)
 		qfq_deact_rm_from_agg(q, cl);
 	else
 		qdisc_class_hash_insert(&q->clhash, &cl->common);
 	qfq_add_to_agg(q, new_agg, cl);
+unlock:
 	sch_tree_unlock(sch);
 	qdisc_class_hash_grow(sch, &q->clhash);
 
-- 
2.53.0
