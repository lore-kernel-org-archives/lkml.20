Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934A5412C17
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109067; cv=none; b=aaGmAwGKxknfMR5CV9xOLGuBhHDQc/wSlcsghNwLC22ilWIsB28L3sBNuTgH+MioYxhD34NY6yHmSb4oJBkdFejrVL2V1BTz368qsx0jt8EFuITxO/+QcZPhWh5An8hJKSF+lxMDLQxF38t5E6+Ic53vTe2j6rO1Na5gMnPyGEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109067; c=relaxed/simple;
	bh=NXHr06+m8fKcBbVdqgzfwCvwksgvw1yhgxhdVlQe4EI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P4FBRqzFowqrP6LeILKj/SCFKueb/mMsW2x17RoekT1mCxGfo9Bxf3+milQHqGw2knoiMvoVGnQPHpKOtbrR2miRvszJqf63O2QAg4zV/xvZgKrfR6kKsJnP0L2sbsJRF8+4Ge/CsrJcgdQEPLAOky5vtTL7AmUksNCGQ0c7lkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkRISFFi; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkRISFFi"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so221740a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790109041; x=1790713841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXHr06+m8fKcBbVdqgzfwCvwksgvw1yhgxhdVlQe4EI=;
        b=ZkRISFFisvHM4Y8fMfyPRZdt+bu4x0Uy0DTV3VakD8p4It9qPmejlYBxBECvqNjmLg
         tZug0tqDLq/Q+hyjv9hCmEimnv0wV7UWah76YAIi/MzSpeWjJRUxgL/hIetNwFRrPl5S
         SfALGyc5XhZwwpK95rI+g0OEZ91UGAvuBYtBObF6kTicFJk0Jyq6pkuYwmQVte4917Rf
         9jfKZblDbUQ0Q1ZXkC4wVCHBA/v5K48Cah2Mn7MAVvaBJ7m8ud7/IvIQY0TTeoI/zmVx
         SmE2gOK+66uZqHpaYerp4yJ4SWbtKj1REuYUBaS9AoLWjQ+YM3U4yLDt3PNqP/S8YSz1
         Ni6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109041; x=1790713841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NXHr06+m8fKcBbVdqgzfwCvwksgvw1yhgxhdVlQe4EI=;
        b=EF2UKtV6/yqqC1UBu09+svUwxXLsC5tucHRH15tIjwtCV+kCx96rMFsDM1D4X5csc+
         fcnowQHSeUKJcSLq2WdTgz1xsOGdh0aiXNX/E1iQPkorVKacqJZbRnVwtlsyoG8utJdm
         +HTSEee6jWt9rTawm1DBtAbwQLHnZE9t9FzC6169KNvCv66fX22BMuwJJ+WZZEkIoyp5
         kaiCldlyKcKEqHBSmUcvzx0ssermrUB9ptCKe/a/sV2lY62PtKHyF7j2pJwxaNyY9DBN
         2aK/YP+7trLke11ngizsjpqDTpy2yepbfDuYYU1wkwhXpLUOKgHc5Q6FIUnaHfi0nytv
         oyAg==
X-Forwarded-Encrypted: i=1; AKwUvBxB//z2S8+qEkfxxO7TBAHRNOwt7F+CeJMoEWr22zLvg+NZcLgsbmTsUhpgl2cWC6tVpYvavCEPGX3wwjo=@vger.kernel.org
X-Gm-Message-State: AFuF++mtf+hJ049pUmD8Mryb4IAgAeZ3z+N74JUE8GFYbSJbsWJYzL0P
	hIIIQnLM90J/JUvebAam4jF1K8ZqXz1nazF2lmdyV8eu7jLa6yZz41F2
X-Gm-Gg: AYBFou0ZSPsvPXRj9JzeM443rZhQ8KHPKVQF0s3t6YxFhm/zvmx+iRKh3pgS+wm6C7n
	ev5nk7TAq+GQEL0qr7bNaHGhfOiMBhvCf5hx+3676kgXAxZh0+X848glLnTV+ULUPY8Odeoedr2
	5L09kHtd9vaRspG1/8vmAS/B8/7qAigsGHv+VD2rlnnfdn8mrP8oYeRn0QnRTfuB22xmPgSfkBe
	51u/i0si/rLW7CAVnDSb9hlder6drr6En/sW/z/szOt3+Xbzbl4YCqRDxPqbLsGuT9ETxBr6oYM
	baofD4RDtYt8BoqlkrioywYJWQV2J7t17KTItlTTh2LxXjgeFGuCrk+SeNW0jOIWr518zs67iYF
	HGk7KfhAk3TXCtp24rtaAqn8jnX+/hTOpg6q6jd1/8YTWoc4PrGhieTLiOXwYQWCTQKnzb2aUzX
	dlTc9jCd0YP0AZQSMVp/45ZEj32QnKnDg+3b+WZZnV1fTlviInIEUMPahjPIXCsm3NP2fPg19FY
	TEjtBh05HlDPrt5FFuf6gBa+qfsnKPzbevE1LJIE2G7ERr0Jmm4BUiVconC+CEBDEWxIIXne/Pi
X-Received: by 2002:a17:90b:164c:b0:39d:e9b6:cec9 with SMTP id 98e67ed59e1d1-3a07e4f35d7mr512229a91.7.1790109041020;
        Tue, 22 Sep 2026 13:30:41 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:f16e:2102:25ad:9cdb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc5f3d7sm1046121a91.16.2026.09.22.13.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:30:40 -0700 (PDT)
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
Subject: Re: [PATCH net-next v6 3/3] net/sched: pie: correct tc_pie_xstats field documentation
Date: Wed, 23 Sep 2026 02:00:32 +0530
Message-Id: <20260922203032.26774-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179002341024.2160803.17066887333412185241@kernel.org>
References: <179002341024.2160803.17066887333412185241@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review. Replies are inline below.

> Is the microsecond description accurate for all values the kernel can
> report here? pie_dump_stats() [...] truncates the nanosecond value to
> u32 before dividing [...] a qdelay above roughly 4.295 s wraps modulo
> 2^32 ns [...] Would it make sense to convert sch_pie.c to div_u64() in
> the same series so the two ABI producers agree with the comment being
> added here?

Agreed, this wrap is real, and microseconds is the correct unit
pie_dump_stats() is supposed to produce. But this patch is meant to be
comment-only. We'd rather fix pie_dump_stats() with div_u64() in its own
separate series right after this series, instead of mixing such a fix into
this series on fq_pie.

> Does the bytes/second wording hold on 32-bit kernels? pie_dump_stats()
> does the scaling without widening [...] On ILP32 both operands stay
> 32-bit, so the product wraps once avg_dq_rate exceeds [...] roughly
> 16.8 MB/s. [...] Could the same (u64) cast be added to
> pie_dump_stats()?

Same answer as above: this is a real bug too, and we'll fix it in a
separate follow-up series.

