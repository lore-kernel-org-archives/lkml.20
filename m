Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AE64E80D7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790365865; cv=none; b=kMVldgRA4X4WHw4E6b2v3nO5l3Fb1erpyPJ/yaqwjG7qt5AkVFu6dzRzCgCfl07SBVayZfP7iyWmvYhsgyJwPNu9uhDQ+njxxeW8rZzYvdKQREb7UBwJjmObN0yHYobar8lw5nYj0F4TxFsgQEou84zvf8waj1qcgFPl67brGZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790365865; c=relaxed/simple;
	bh=2TQZFwirqOWes4En7HI9aoy8gROqVgMcdHaWnUUX8Kc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fbp3/ZWGerfv9ko1JT3nNu6jmBU3+iMmMJHDktX98/6lU4bY2zlNX8v7DzRCtom902N5e/aDetXKGuu0YMI20ySqKOwWKS87fLnvRwY7NYzJBkQkU7IAysC9nE8ZGH+Sme30rcK/vt8cHbODQiNQX17vcipo5+WV2BOS4hNB3tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tM1J7WUC; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tM1J7WUC"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33e619af891so845735eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790365863; x=1790970663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HyiruoU89fBmLALvorzSciHBi6mzhh5Mz13gcRYwmgo=;
        b=tM1J7WUCH4/D9J45ykBfF/Mk2GnVwPa1U2PN/gSHFK+jziuI27lIy3y3voI6A/wiai
         4vbr6P2TEu+MrWqmy+Xu/gGIvEdDY0NSOTmTCcoRE2EyqTMuhwUNOQMDPQ8RsUD8s8m1
         L9qq00/mmR67VHprGBeXS0EJAytCfyfkXVQhpqgN76lMSQonVvF/vGM7fRS4nj0gy7pV
         Z9ymNOkA2ElRU/Z9Za65OFU+mK4+FbRUFLH56XsAXa1H7Ym/bWFcD/HNYhVzJ3/vlQ8K
         bmuSaF0AEs1NCA2S5Z/mUrv/7WkoJM/UhaxvXV/1g4z0H8nzmAKe2mgrZLhkeAVBi027
         o1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790365863; x=1790970663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HyiruoU89fBmLALvorzSciHBi6mzhh5Mz13gcRYwmgo=;
        b=neokvMaThb2Bu9ZEf/TDga93FB6H64LxhArM03h9qc7BQ2tpI3t0lfIvg+J5kAyi4Z
         QJvw1OhLT5csjcJdt0uql3ew7n4w/Lzr/UqEwWPq7GE+w1PDOB/hpHUTcA+AQfs9h/C2
         iXcIMc6BOrPSoq99e5ChUvqGekmPvp9sPDu8WDRZR6QEgqzj43DoebnGOgd4Bvk9LKTS
         KL18itAh1Wjz7p6/uGAv7Go8Zy6Qb8ygLRxcP8Ta9ZO5kOzE86R5ECaYVlvYkCw6yg9w
         49Zse6FGiGzi8pfBARWoMMdLOqeoneYeEmFKhWldkP+Csa6MrmSB1zyuJKowOXFVqzDF
         2v5Q==
X-Forwarded-Encrypted: i=1; AKwUvBysnjIJV6t0iRS7jgrACsibN/lOayPUgEFiTeCgkEvLjzjfcLh8eqERWLrswPHeYsxLAZzF+kWS7/D0NAQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kOxTan8VI/ingmLbHkVdtuLGyeSp7mxw3pwxjww0l3/H4KKHRr
	vmCF62uMdmzdGc72tKhvr9WOWFNShJ8gxKUkLgwqkuc52tFavEURtVMI
X-Gm-Gg: AYBFou2g0r9ixQWl2YTyHfUTEm8MTJ8DDvlarjmIeD6YoPI+5+fqdxmYKVav/h6FXTU
	5p6j+k92a+Q1HzD7UAYHKV0QK5ANWf/UBHQopxg+lBiHKN7lnht4UAbiB56i5k6ejjX+sy/fY+e
	+yKZJHEVtzVNZOnmhZfCQk7hjQexMz0JfGmRM2YXDEcBwKm/zFIl2ikt7BKrrL/7HeGw9lzyzkl
	+3TKd6gGEqKqWA51RostlhYfUuRsfZjvxUfeOmg6RGhRw2n7u3eTPSBuXqqGQ3flnddXtFZt2ia
	eapyp/M8AmUJD3COkaMSs3MIYuyiSOsPLHfDqtv65lF2/yl8BfzkHMCaVo8rLEoFwcxqw3PDJYG
	f1F1er1ptA70ooluwPzkfiTVuWjPKVTIdFvptdAoiKJYvrrmmsNQVfcLBBAMX4jSuLA32q6EKmS
	tRTCQbeAdVltp8to4yD5eB66K78Zbgb6/satacDW4S+AccTMjGqtFfhB1sAQb39pD9bcVvfS0u5
	3uZ0nT48LvU+mtbQua+yTSl63uxoBtMFHNjvn/rk3CQy3gLDkIqBqYN2RhzNBFspvurVsokkbU=
X-Received: by 2002:a05:7301:dd96:b0:32e:3b62:6951 with SMTP id 5a478bee46e88-3426cde4ef0mr1005752eec.0.1790365862642;
        Fri, 25 Sep 2026 12:51:02 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:afc1:567c:4083:c0c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341447576b9sm9020399eec.15.2026.09.25.12.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:51:02 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	hemendranaik@gmail.com,
	horms@kernel.org,
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
Subject: Re: [PATCH net-next v8 2/3] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Sat, 26 Sep 2026 01:20:54 +0530
Message-Id: <20260925195054.9009-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179028364138.2160803.8521628163584007831@kernel.org>
References: <179028364138.2160803.8521628163584007831@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review. Replies are inline below. No code changes are
planned for this test; we'd like to keep it as posted.

> [Severity: Medium]
> Will this test fail with any iproute2 release available today?
>
> The kernel side, fq_pie_dump_class_stats(), only sends a binary struct
> tc_fq_pie_xstats with type TCA_FQ_PIE_XSTATS_CLASS:
>
>     xstats.type = TCA_FQ_PIE_XSTATS_CLASS;
>     ...
>     return gnet_stats_copy_app(d, &xstats, sizeof(xstats));
>
> The words "prob", "delay" and "deficit" only appear if tc formats that
> struct. According to the commit message, only the pending iproute2 patch
> does that.
>
> With a stock tc, re.findall() in run_one_test() in tdc.py finds 0
> matches against a matchCount of 1. tdc then marks the test as failed,
> even on a kernel where the fq_pie class stats work correctly.
>
> tdc already has a way to skip in this case: the dependsOn key handled in
> run_one_test(). Other tests use it to gate on newer iproute2 features.
> For example, in actions/mirred.json:
>
>     "dependsOn": "$TC actions add action mirred help 2>&1 | grep -q blockid",
>
> Could 83c0 get a similar dependsOn probe, so that it skips instead of
> failing when the tc in use can't print the per-flow stats?
>
> The commit message also describes the test more narrowly than it
> behaves:
>
>     verify that 'tc -s class show' reports an fq_pie class.
>
> The pattern needs the per-flow counters too, not just an fq_pie class.
> Could the description say that the test depends on the iproute2 change?

We'd like to keep the check as it is, without a dependsOn probe. There
are several cases already in this suite that were written against, and
still assume, newer tc wording with no dependsOn guard at all, e.g.:
  - tc-tests/qdiscs/fq.json (commit 3007d8712c9b, "adjust fq test to
    latest iproute2")
  - tc-tests/infra/qdiscs.json (commit 56acc7f51974, "Adapt test's
    output to HFSC's iproute2 printing changes")
  - tc-tests/actions/police.json (commit b7df2e7eaef7, "Adapt tc
    police action tests for Gb rounding changes")
  - tc-tests/actions/bpf.json (commit ac2944abe4d7, "Be compatible
    with newer tc output")

We're doing the same thing here: this test is paired with the
companion iproute2 patch, the same as those cases were paired with the
tc versions they were written for.

The commit message already says the per-flow counters are printed by
the companion iproute2 change; we don't think it needs to be repeated
in the test's own one-line description as well.

