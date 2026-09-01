Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551AA488748
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283577; cv=none; b=YUEaQWBnfBSPvvpliANCWnDtQWRCNFcnQE18m8ziH8kjaHpqnvnuOi66ygGYREa5NR1bDq9jd1pf5AM6ng7YZ34TgdIuz/zSBGasg9nMiBCSDyyGXxgSrjDxtQoCW8lqhUK5ebWLDVc64cNsSNYfmy9LAUXCmPQrr2ANgT7xXLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283577; c=relaxed/simple;
	bh=Wpb4O6T/xyA+5eJiRg7lEIMxsNKuDpjIIJqJ6MLZCK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hb/8PVF29XL52XGKdR/XK0FM0EZYMyHyqGlguzXsP+CbrtvRmJRTikZe8941HTPLvcMrK7neycoipBfbjx+NSDrL4rudy4AuNSXMeC1rpVjbRVPABR4vDJWymvkWnoCSVxm0iX7kraWr1rkSV7zyVSaiftHuR7cN0Od7OGNAO6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayImy4gS; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayImy4gS"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e58034d05so65628a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788283576; x=1788888376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wpb4O6T/xyA+5eJiRg7lEIMxsNKuDpjIIJqJ6MLZCK0=;
        b=ayImy4gS60tAKn5zDNGMxB+uyyQEGmwPuhuIAnQOGhfpEcUjaeo7HWUgxbfk4C9nwO
         o2KYNKwkNuaIJ8L+mlhY7QgIhBGbFGeM05x10FZk4zuENKjyNuzHBg9Ko2hnaMN8w2Lc
         7H/ny9b/CJ2SL4PLdlYTt+4UzxYrKovuO+FmqN0MovQR+slyE9GDUzdLxEYHlo6/cCVQ
         Vhr51RbMH9BBbrTIjNK8amAARvfvp0wpHldLP8nm8yJ7apEOmEvgUaV/hytNsTkqmHXl
         VzgelCIraNrKPpSwV4uPxv0nsvqS0AcP3PctfzCgyyGHxDGxyhWgxyNPmFKlmg/3N6Ch
         mBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788283576; x=1788888376;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wpb4O6T/xyA+5eJiRg7lEIMxsNKuDpjIIJqJ6MLZCK0=;
        b=a2kO0MpRfbmsixN5CMr8hvZ59dlZAufvUnutyJ93ZI70Nb4a83rvQH9THbmDO1cy8p
         N8lgyPOxugKV8t8yxG4UDxQ7EyVrIh5qqlWEXofPcl4B73jdPJhT888T39SZdxeJK+kT
         vpj+GxYiOvY8aEzxZBCm6hzW+tWNBXKJebWBUaKQFgNRVjxHu0rz+k5sMwMNuGeTm0qQ
         z5BT7qBPKAGIhTIaLm/0rSFN5x7nvjpEqjsZTthwPVxZtZTyMrQuH43jCk8UxU1rfBGe
         Vr0qNiSi8IaxsbDj2Aju4TZWgP8HrTMa8k/FszDDX/04f77ZG3gkc9QCILlBAaLvQotE
         s6ZQ==
X-Forwarded-Encrypted: i=1; AKwUvByGgUBBs4fbEyEajBnkz3IU1Qyad0ITMEU3tRjpu4OWyhE/mBAAzNU/5UbrOZLBvo4YNwXyefAR+re34gI=@vger.kernel.org
X-Gm-Message-State: AFuF++l13Nzoyvxks61A9+xeoHNdspYjdhoNAn/v+6F8OjYjcgriSZJ1
	MPns80lJevQOvsHytidd+H3jI35N5plgjbYywMTSpaZs/w8GdaT3IEN5
X-Gm-Gg: AYBFou2anhrIm2gG379RQiXny8S5p0q6ULCKgJgKoRK0mVNfeB0OE8LRMUkex3e5GQ0
	KF/82AiOMzZ6qt5GjFaJwHa5VXP0YtO7IgFE0diB8sjVY1mTP62GX3bXbKcr33zxV5z1/eYNOFh
	8EKcRrpfBg6EIPHnolBqbKFjd/YjjmtpIk9T6Wu/U4dlGWCIvjIKwXCgoSVPvCe6pmyNxwGDrNg
	w84j4z5/T1Phlvz00xJ2ijkS9BuaUshIMuVwhL2W+XfLTXpzkIljRVss8xQ1N9eQcrKkRVM1LjN
	ZDP8w3p9myDtVbHIQPaOugLMTqZ2S3Qu/1vj9feMHCGqA1T2yj1mLfb8SRncUYUfEjlKOUmBuf4
	DsOGHIfs7T1NFq+O5sWSzfvYM8FvtkNrIZGtWan9rvnMQI38TbfoRqBzdMHCHpfgb+OXEt45UsF
	rj04OPVtXhfFJEWuAHLOjNcQkuxcKluuLmHDlTiQ3bUIXkag9gQetHEvZrHbGrO0YLtyAVpUkVW
	AzttFP/5K9xA4JfugHbRLoGytS5QZfiSlYXJLGAQJfSxOqzwY7uWk8m4pBcsxjiJwI=
X-Received: by 2002:a17:90b:4a02:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39907ab0960mr12275784a91.2.1788283575571;
        Tue, 01 Sep 2026 10:26:15 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:246e:2cba:1e3e:e617])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430ea0b459sm158262c88.5.2026.09.01.10.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:26:15 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: horms@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	hemendranaik@gmail.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	tahiliani@nitk.edu.in,
	vishy0777@gmail.com
Subject: Re: [PATCH net-next v4 1/3] net/sched: sch_fq_pie: add per-flow statistics via class ops
Date: Tue,  1 Sep 2026 22:55:24 +0530
Message-Id: <20260901172524.39650-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731095635.GG51943@horms.kernel.org>
References: <20260727164056.106203-1-hemendranaik@gmail.com> <20260727164056.106203-2-hemendranaik@gmail.com> <20260731095635.GG51943@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Simon,

Thanks for the review and for the Sashiko pointer. We have been through
all six findings and are working on v5. For each item below, a short note
on what was raised, then what we plan to do:

(1) [High] Filter attachment and TC_ACT_CONSUMED — Sashiko noted that
adding cl_ops with .tcf_block would let users attach tc filters to fq_pie
for the first time, but fq_pie_classify() has no TC_ACT_CONSUMED case
(risk of double-free if an action like ct consumes the skb).

We will remove .tcf_block, .bind_tcf, and .unbind_tcf from cl_ops.
We only need walk/dump for tc -s class show; filter attach to fq_pie
should stay disabled as before v1.

(2) [Medium] tc_fq_pie_xstats layout — Sashiko asked whether appending
type/class fields after the nine qdisc counters breaks userspace, compared
to fq_codel's type-first union layout.

We plan no struct change. fq_pie already shipped a flat 36-byte struct;
we will keep appending after those counters so old tc binaries keep
working. Class stats still need the matching iproute2 update.

(3) [Low] Empty tc_fq_pie_xqd_stats placeholder — Sashiko flagged the
empty placeholder struct and unused union arm in pkt_sched.h.

We will remove the placeholder and the union; class_stats will be a
direct member.

(4) [Low] Class handle at flows 65536 — Sashiko noted that with
flows_cnt == 65536, fq_pie_dump_class() uses TC_H_MIN(cl) and the last
flow's handle wraps to minor 0 in userspace.

We will cap flows at 65535 in fq_pie_change() and update selftest 83be
to expect flows 65536 to fail.

(5) [Medium] Selftest case 83c0 — Sashiko noted v4 used matchCount 0
with no traffic, so the test passes even without class ops and never
checks per-flow stats output.

We will rewrite 83c0 with real traffic (TBF + fq_pie, ping on $DUMMY)
and matchCount 1 on tc -s class show (prob/delay/deficit).

(6) [Low] tools/ UAPI mirror — Sashiko noted patch 3/3 also touched
tools/include/uapi/linux/pkt_sched.h, but that copy is already stale in
layout; comment-only edits there do not help.

We will drop the tools/include hunk from patch 3/3 and touch only
include/uapi/linux/pkt_sched.h there.

We will post v5 with these changes once ready.

Thanks,
Hemendra
