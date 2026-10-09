Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC11B4D0CEE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791549202; cv=none; b=jS7m4Eg+tIATbu5wixGlb/Sx1CYnB5FiCS/2/lb5ogCXgHydoJSxxsHiK9PDvo7NovEaxtQjerOpiSyzbX4GD9Et5T/ZRBz0jhMkPpgMb6nceQNrPa1UVS2+yvOtQwwQmNTZ3cno6iYHa6MTX54nsQ4DAiLWu5BlrtmhvmFyDsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791549202; c=relaxed/simple;
	bh=imN2tRDP72kfhavZsAwRqcjiIus6mD80BgKVeWkT58c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u/aNVxMcjX2NsNf/Hv312KHetLDO5b4AB7Q8q+gQgMiK6Go4LSwemCeyon0WEKE8sN1fHGQgD9/W8cAtCVzSD3az/lBBJb12ngx7hPDCs+Prk44IKWrUriDi4wc2iG7bG5bxgrzM8QDokqIzGFMFiFDpkXUuuUg2q15nV5zLDRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=be2540N9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="be2540N9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso28839175e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791549196; x=1792153996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oWh6pn0d6opteTbiTE7cwCfiA2l6VLifnQ39AyZyQfM=;
        b=be2540N9yq/tJFlvA2EgqG3Kvhil+s0RkJZkWhkPKQiPdhn4hAzjmLgO5IiY9iSYMU
         kQkDA/VWgW2P+d4OT+JPjQ0XMcrJ9eq5na7MEduNghcIX6sBkVRKeb74srIoHnn8Fart
         ShJeWWySO23ZkU9D6XiPaDuUyWrV40QKLz/71F26R1VmQNm11QfJJgfhiaWxBXMnM5aL
         QeuLDm8GA5JX1e0NEx/6YVGjOhM5Gnl56GMUsutY9PO9v5cU34r+Bae5/tA4lR2Nkcgz
         Y99H+mJ5hQ/bJPMkJb/TjAftHVKi/Fmjw57FrdJ4MbilpK0yTQ1HkkyExhNpAhi74tFi
         iAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791549196; x=1792153996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oWh6pn0d6opteTbiTE7cwCfiA2l6VLifnQ39AyZyQfM=;
        b=HyeZbC2ykSbGwvFXsSoXSBpqJXuGI4U9LzC/wqxU2jDlcb+dHyLYRSSNgEgITOEeZc
         9H1lDS/Pi4sTL2RDklwfa6Bdd7VGywxD4w7LlfOSnz3jm6uky045E0EPHCIAHQHKNaBb
         ZvoD7oBVjxxAuQunUX8mA5640U7cnyKsgsS35kS0jKIUxexJQ5n1gzbt/X3/jCv/Fi+s
         6+OFDEsnCwzgZp4NNosK4Exve/H2fVnUtwr5RejyTu30TxYW7mtcWwAzrvrPsLwICFn/
         1WJhbxgJpS4AINfiWtsU1lrdo5yXGT0Vt3MFABlphtrRGK+Or3zqWUDhZlStdKqM0LX/
         hwBg==
X-Forwarded-Encrypted: i=1; AKwUvBznOyAGfGUGEHJZfLyN3oqwZ6ZZqxvM1YomuNBv6E+jHEF6Fin14RG/p4it2kkP0qXMV3unYv5sk6ez4do=@vger.kernel.org
X-Gm-Message-State: AFuF++kcPwThY0zNkQ77T63I2w4GGyt8v6crMgSSPK4twacuXcK/7scj
	EJ086eh38p4xwErg49caPrAizvUrrDUE6OSDjauAL04PBMeKU5wTkg7C
X-Gm-Gg: AYBFou3051aLIDCWvRTyP0J7NaaRsUHtsS50R1qKvJLPw6kxxb4WLKknBnntFACR42S
	K5SBacQKXbMDG4YHUIU/uDTFpOVidZkbi85p7VNElzVXLN+dQG5Ja8G5cvRVwUm7O/UWE5oow+r
	kuwHUPC0pYxLOSXt50tSfYLlRCa6obXmeGzhl0/4bwlyWAFG81L/TlZsa+LSRldomQsAHd2fGuo
	GRTEVX1QwGMEqbpt7ej4inrlK93f3oYCj63xAUz+r3dtcFQ6VMxwlnbVQdkK+/I5OcgYzuAaQGt
	/AqjbLeXvC/zCLe2GThtcRsA5ayEzkg4tWwSCbg/fHagcm+BORYPqjwVzyPsDN3gsxbioafUECo
	slGOFzhgwnOyW/VvWWsVrL8ZpEtSoxuwbP+WiKfisCj0z5NNoWh+bks1I1HGleewWZEcKhUwmdH
	JJbXYnK1MMVRtZESUpbjq18XGc4/bADoCpdlgnh/zKSzNI1h5N88+4ZFJkkVcZXf6ojAOTudgQV
	pDcEtqn+MJ+WO9D3NEu/BIivxnQUiUNzR0wS+vTwbw4AxY7q31cpVi4bFnAz9oiuo9S4ohra9Cp
	M1F751LUD4youdWshwHVb4XVakCh0/c77MkmeLEhczaIA+Wo+vpQiksOp9z89fSDnGwDRt81bKf
	3//B7nkYXQvMAI0CvTV8=
X-Received: by 2002:a05:600c:4e45:b0:49f:c199:e1e2 with SMTP id 5b1f17b1804b1-4a18e4d8c30mr35055235e9.28.1791549195686;
        Fri, 09 Oct 2026 05:33:15 -0700 (PDT)
Received: from Ubuntu (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acee65sm3650230f8f.49.2026.10.09.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:33:15 -0700 (PDT)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/2] net/sched: taprio: reject software schedules that overflow their timestamps
Date: Fri,  9 Oct 2026 14:33:08 +0200
Message-ID: <20261009123309.284193-2-krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009123309.284193-1-krystianmkaniewski@gmail.com>
References: <20261009123309.284193-1-krystianmkaniewski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

taprio takes base-time as an unbounded signed 64-bit value. A base time
in the future is used as the schedule start unchanged, and
setup_first_end_time() then adds the cycle time, the first interval and
the gate durations of the first entry to it. With a start close to
KTIME_MAX these sums overflow, and the software schedule starts with end
and gate close times that lie far in the past.

If this is the first schedule, the qdisc timer is armed for its future
start. With an operational schedule running, taprio_start_sched() keeps
the earlier operational expiry instead. A large cycle-time-extension
can then trigger an early handover to the pending admin schedule.
advance_sched() uses the invalid entry end as the next expiry and can
keep restarting inside the same timer interrupt.

Before a software schedule is initialized and published, check that the
computed start is not negative and leaves room for every timestamp
initialized from it, and reject the schedule with -ERANGE otherwise. Full
offload and txtime-assist do not use the software timer and are not
affected. Schedules with a reasonable base time behave as before.

Fixes: 5a781ccbd19e ("tc: Add support for configuring the taprio scheduler")
Assisted-by: Codex:gpt-6.1-sol
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
---
v2: no change
v1: https://lore.kernel.org/all/20261006113335.241564-2-krystianmkaniewski@gmail.com/

 net/sched/sch_taprio.c | 46 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
index 299234a5f0fe6..1f753911cdfec 100644
--- a/net/sched/sch_taprio.c
+++ b/net/sched/sch_taprio.c
@@ -1238,6 +1238,48 @@ static int taprio_get_start_time(struct Qdisc *sch,
 	return 0;
 }
 
+static int taprio_validate_start_time(struct taprio_sched *q,
+				      const struct sched_gate_list *sched,
+				      ktime_t start,
+				      struct netlink_ext_ack *extack)
+{
+	int num_tc = netdev_get_num_tc(qdisc_dev(q->root));
+	const struct sched_entry *first, *entry;
+	u64 offset = 0, span;
+	int tc;
+
+	if (TXTIME_ASSIST_IS_ENABLED(q->flags) ||
+	    FULL_OFFLOAD_IS_ENABLED(q->flags))
+		return 0;
+
+	first = list_first_entry(&sched->entries, struct sched_entry, list);
+
+	/* setup_first_end_time() adds the cycle time, the first interval and
+	 * the finite gate durations of the first entry to the start, and
+	 * setup_txtime() adds the offset of every entry. None of these sums
+	 * may overflow.
+	 */
+	span = max_t(u64, sched->cycle_time, first->interval);
+	list_for_each_entry(entry, &sched->entries, list) {
+		span = max(span, offset);
+		offset += entry->interval;
+	}
+
+	for (tc = 0; tc < num_tc; tc++) {
+		if (first->gate_duration[tc] == sched->cycle_time)
+			continue;
+		span = max(span, first->gate_duration[tc]);
+	}
+
+	if (start < 0 || span > KTIME_MAX ||
+	    (u64)start > KTIME_MAX - span) {
+		NL_SET_ERR_MSG(extack, "Schedule timing is out of range");
+		return -ERANGE;
+	}
+
+	return 0;
+}
+
 static void setup_first_end_time(struct taprio_sched *q,
 				 struct sched_gate_list *sched, ktime_t base)
 {
@@ -1958,6 +2000,10 @@ static int taprio_change(struct Qdisc *sch, struct nlattr *opt,
 		goto unlock;
 	}
 
+	err = taprio_validate_start_time(q, new_admin, start, extack);
+	if (err)
+		goto unlock;
+
 	setup_txtime(q, new_admin, start);
 
 	if (TXTIME_ASSIST_IS_ENABLED(q->flags)) {
-- 
2.53.0

