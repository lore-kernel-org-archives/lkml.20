Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EF94A7C9E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004174; cv=none; b=HhsS7CUIvuNdTqM1JQY7MmgmlitNV5rppEa/3dw+iwuE6aQ/syWO2xcgMyQhu1DYJr3aLK2gpZRVaCGwvAsJOLTJUCDD5NUoqi/sKVlldGt3jwVJiKgO2K5JdYMcDAEsOgGn/AwSK8C/6yRAQzGeXiNTVEteUUUC8DMHajigtQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004174; c=relaxed/simple;
	bh=3BAhotiCwMRSV4UvLtnMYjKDNdNpMkVFmgoR/DpHOXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ptyCOxe37YDqK3TUlE0MxWVoxgOxvdltafzuYBBa67MwYeTfXUKu9oxog7TH9GWQ44B7Om1eaLOmjqsBtPKMO0OFhKzhkIzA64Yrly2bJ3TTYR4BpYFkuzWMhejX21RmtJ6Mm39m+C8yxE1Dkp8YpVlxkPy1y8C//uNVYqBgVFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tUoV06oo; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tUoV06oo"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so16665165e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790004171; x=1790608971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzrjTGdBQf2LSry5gpHzNLdOxXZt5pOkV8UB4rqL8mY=;
        b=tUoV06ooqsvSURdprs0G33+vDsrNV534V+gT3lB079nqgi/A5QGzMvPmDJX8Oln3Iu
         CZ9rt7eH+60tcUiCvta4erseSF4SiXEPnPgtRvrADD/RF22luzJxnCQca5JDg3T5i9tX
         7OglAwT9u3nwBPeu7FOrXxXT5D04P+X3xQMY98UJAO64CEEoQ/8Od4EiSQcLg6lGXI+A
         lz3ak3X3zywlZeF7oqX17AtyLIxE67lk6rRKrqdU94XbEeNpyfvRjZmULEz5UP5fah8E
         dbW3J8lFdfAoMQ8zVCKFbFbfyCkAOQY+NXXRZCrGimO3G9gte0EwdAMxbd3OyU1KuQH2
         xOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004171; x=1790608971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QzrjTGdBQf2LSry5gpHzNLdOxXZt5pOkV8UB4rqL8mY=;
        b=nm9VJ6zxl7DjE9TaNlYsyDsmv0i73wh56lGGYjgizT+wcBn2d2nvCChfhzYAYn+L3+
         GgOhTRnQB45vDBakw2AEMLBN8cglmIroitnJIziv1R5OAVRDPxKp9qmYsdMY/P5aRpM+
         U+Y4PIN0V3Rwv3JIForWkFma3H9QZvD57EvUQcRr9HK1gwxLCDBCKnXdhYRYbMGUSnmK
         g8suBV3NJ0BIEaYAGBJv2nTjNQ1eiqJsWbEYEZgAx2ZFhb/v9cZ1QZSUPZiKXEbYXBIx
         n6av0+rxTary/rLDBxX8Nuu++mLIiYMD7hVJlm9fcZ02xmYu+WgBcA8Dbno8ocH5ficH
         lEEw==
X-Forwarded-Encrypted: i=1; AKwUvBwTM0PiqOrsswLQgJBdivwyhGoep7PMtik2Rh38o3+Nb3Tk4prxKM17r8HpjmOq0cEFswcmVGnlspYScK8=@vger.kernel.org
X-Gm-Message-State: AFuF++mKK+JPFP41TKxs798HGV8vmxbGkB5FnBlleo7jwEADp/qwdmHW
	k/aPujQnkhkBOEFD2L+xR74f4ypvRrOYuPhJVyejDDJgpz7C42r6PtRtReHFpv3YoRE=
X-Gm-Gg: AYBFou1vtw3tKeSB84SRKaQ2btPYnuNY3+iFYkaGqqI6O6cGBOU/aPrttnZ6Q6kReSs
	XGguP85SfB+uuD6hojT809xuKj6PPYGVp1rMcvdBA52Qkpb2eH6ZsEfaokKpbeTDwh8GjYcqTnD
	EBl4xE4j3hNYDewQV2KwZU27d1nVqrCamHR7aF0/jojYkUh4+CO9nyQF9M+yWT1dppKf4QcN05E
	GdESYYWf90UIGRd06zNN1sRvbLVshnQCfjwy1FOFJdQRdJHKsqdVQbT37ZFlLtrGeu7GAHwQ5Z6
	fYkxA0BeGBNVKJllhjvEPPJyekeVkuM6G/+aYqHkvGrbDzWw8Df3AVCdCkC3lINBUgcAuxZk/ct
	854cxRQxc9P4ZjDRtjYm1v4HGUWehLg4Zn7dW4EbryUuEMSFb+O+aqd8mYMp1lwOYKOHzcsmVP9
	MZ3B3wOenaH7ZpJdO17aknT0Xc1+RNwEqBTkmKf6zjC8/LDAwuyIIhlIbvgSDDlI6SAOTz71fhM
	2SvP5WnTxP2SR/J
X-Received: by 2002:a05:600c:6217:b0:49e:8418:389d with SMTP id 5b1f17b1804b1-49fc571423dmr142368645e9.9.1790004171230;
        Mon, 21 Sep 2026 08:22:51 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:df5:e9a4:98b5:65d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bf159sm223745675e9.10.2026.09.21.08.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:22:50 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Cc: qyousef@layalina.io,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 2/8] sched/eevdf: Align update_protect_slice to set_protect_slice
Date: Mon, 21 Sep 2026 17:22:32 +0200
Message-ID: <20260921152238.3804392-3-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921152238.3804392-1-vincent.guittot@linaro.org>
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apply the same logic as for set_protect_slice when updating it.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1c171cb7e4af..92382db1d297 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -820,12 +820,6 @@ static u64 ineligible_vruntime(struct cfs_rq *cfs_rq)
 	if (curr && !curr->on_rq)
 		curr = NULL;
 
-	/*
-	 * This is called from set_next_task_fair(.first=true) /
-	 * set_protect_slice() so curr had better be set and on_rq.
-	 */
-	WARN_ON_ONCE(!curr);
-
 	if (weight) {
 		s64 runtime = cfs_rq->sum_w_vruntime;
 
@@ -1137,10 +1131,19 @@ static inline void set_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity
 
 static inline void update_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
-	u64 slice = cfs_rq_min_slice(cfs_rq);
 	u64 vruntime = min_vruntime(se->vruntime, avg_vruntime(cfs_rq));
+	u64 slice = normalized_sysctl_sched_base_slice;
+	u64 vprot;
+
+	if (sched_feat(RUN_TO_PARITY))
+		slice = cfs_rq_min_slice(cfs_rq);
+
+	vprot = min_vruntime(se->vprot, vruntime + calc_delta_fair(slice, se));
 
-	se->vprot = min_vruntime(se->vprot, vruntime + calc_delta_fair(slice, se));
+	if (sched_feat(PREEMPT_SHORT) && slice != se->slice)
+		vprot = min_vruntime(vprot, ineligible_vruntime(cfs_rq));
+
+	se->vprot = vprot;
 }
 
 static inline bool protect_slice(struct sched_entity *se)
-- 
2.53.0

