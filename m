Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AF83A2E39
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790747107; cv=none; b=n19o0X8GmPO5gZZXgGriC8y/mJoAWnUNfmJok69sxTqG3u+hgXFz2KeerOPVs91CV/cNuqrWBlqkzFuWzk/H72o4KK/xXRKsodT8M1rl8yhb6WtZAnFbp/7YUckP8dYttvaD4Y2lZTwh4wSGdNIx4OMShUH00Imw6JxG8gzcKM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790747107; c=relaxed/simple;
	bh=7CmEFIcJgLXs8nB5jUFO8biLTZyyRf8lOHbDOhyyaig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQ7nDxjhXIX35RWagPCif6JmAwcVRJkLxJW9kfFzWmMTBwEIkMiNmsIytcV2XNpo32dyOtghr5m1zTMzir5E0VVP/8Q+YBoB1VPYvnCbu3gIHvwWBj1YZcQcn1lUzih05hw3gLNFGoBT8O66+DYSj89M0BshRJ973xIP+Tmdvw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QY8SZY4G; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QY8SZY4G"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48435bcf9d9so585675f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790747103; x=1791351903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CmEFIcJgLXs8nB5jUFO8biLTZyyRf8lOHbDOhyyaig=;
        b=QY8SZY4GR2upaMtxLMkkRlZoEE2lI/T08xRlN5NSH8ApxehamNfn1FW3FTJIVhJ+90
         NETdG9HjtYu8j5nGHGV9DVlMiJD4xBQuj7qBnfXPEcSDwUoc+OihC8g7gxyx5muBzeMR
         am6YELQjhG1ZJmFQJRi5bZW4tLDS5Z//mCHn6PA09UjY/6UKE0DMWmXDCCxY+hUgIFSg
         6DqnDrwj/EhP0TxklIgpd7Pi7rPEXUZXHREzo/u3XswpCD7O7Iq4BCzq1l+m39R0k0L1
         iTczIstkbeBIiuxJCFftxTtb3f3l41SxKjcFM2g61ItGfNVEMNWohFM466QqlyPHiDt4
         ksSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790747103; x=1791351903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7CmEFIcJgLXs8nB5jUFO8biLTZyyRf8lOHbDOhyyaig=;
        b=eSXUyph0Sy7dUrafjWRxtieOkr9qjuoqZfY/9tZ1cmZIvwQvscfEPjAgFDkvUcscqp
         PyIsjFVO+7pcIAhEa2y5bxffReZpqDV1St6YBumSAZ0YA8mxEBoHdg6qD1LSilX5F4JJ
         DmuwP2LqElSahRbe4T0tM3byKnhveB08YbpVs4JhHQLJveFRDCj8GZLRwh0c5KuAhqqC
         T3od2V7EXA1moXNU09kKwmmSLQjwkvF1JZPZ1J+gKnG2MfhGzb+WZd3RISEX6sLVxJuG
         k6d7ayNPCprtVQYZoSgv1ZJrWJ7Qrbzuw6zP5xLmfT7mSaUBuZUBCIfJk8GBTmwNY1VO
         PsmQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+cMRhCWVh+ZSU840vBHMelORAoA4NKiUm2I1hGKLj8lb6Xmxs2GE9+P84gTuyIMMXwv9ncFcRGGiIjmc=@vger.kernel.org
X-Gm-Message-State: AFq9FYILzc/M0SSHNw/nD63q8/QnqRtShsMUKZkMWOe3JgkjBp4c1u6V
	OAskhaXHB9rAhTtGEYusk19lX5fXPmJPuAyF1LZK0LQPQ1U5aQShAYY0
X-Gm-Gg: AYBFou0d3oCiAjm3cfe+TIpug6oKMcz/bLw6R6zgtHbl/bj91Bgy4ziwkEsi1UL7JzU
	kWJe/JR4RuO+Ca7YTqOWll4dmJPkevC9yQ7fWzO3GE/g/t6pjsriG8b8j1ThTWT4hCkwqyEzfGq
	Lsq7FGwplWFWO7CdR5lPBH3pCMVbhuy7LYRVcJPhsv7GYmbu6a2lv8MZff1wkh5HugEp9Dv7TYq
	9KF8ijCC0V1B1inQN/GdvtnQUjWO5sTZcdH4Coqv3xPu+bDZd8NcmCaoB8XoVsy2JfrIRuv0Alm
	jh7XLMVo5tTCDPXGaHIezmzMPqHQVKOriP66sKIdqaX1CWczQ5w/QuMK7OE6hykpXekO9oI11xj
	weKCOfkqnKEXxI/M38xAQvH/J3fFrneuRA5FQTi2syVW0zdQwxzpYpa3FUTxONdCoJfhZQzV1If
	q/XsJKd0hi2zLMduz8+kf0I1mTkU0sjWo+YL2vvnPIvhrgxpctgq+ySTWaFBo92dpTdoHty6nuo
	A7ThNOPHyZ8DuwcS5xK
X-Received: by 2002:a05:6000:4b18:b0:48a:f3d0:5dbc with SMTP id ffacd0b85a97d-48b024d53bfmr543190f8f.4.1790747103500;
        Tue, 29 Sep 2026 22:45:03 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02949cf1sm770587f8f.5.2026.09.29.22.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:45:03 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: kprateek.nayak@amd.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@kernel.org,
	peterz@infradead.org,
	rostedt@goodmis.org,
	tj@kernel.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH v2 4/4] sched/fair: Rework/fix task_h_load()
Date: Wed, 30 Sep 2026 08:45:00 +0300
Message-ID: <20260930054500.206988-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <5a5015bd-ed61-4ef7-a4c9-e759603c4cea@amd.com>
References: <5a5015bd-ed61-4ef7-a4c9-e759603c4cea@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Prateek,

> I'm having a super hard time understanding this hierarchy.
I'm new to drawing these sorry. Yes, it's like the second one.

> Yes,d you'll still update h_load for only A and you can have stale
> h_load for C, D, and E, and for all the tasks queued below them.

> Since full propagation is expensive, we do those propagation lazily
> when the task is picked, enqueued, or dequeued

> Note: We cannot propagate this up further because we have not yet done an
> update_load_avg() for the cfa_rq(s) in rest of the hierarchy. Next reweight
> will see the correct h_load starting from A and propagate it further when
> needed.

> Was that the problem you were talking about or did I totally confuse this
> with something else?

Yes, I was talking about that. Because there are only one use case
with tg. I'm not sure the NULL is intentional for that case.

But I can't know for sure Peter can say that. Since..
He wrote the series. :>.

> > I don't think this is that of a problem tho, and
> > I could be missing something.

> I don't even see the problem. Maybe I need glasses :-)

Meh. If you need glasses I need an eye surgery or something.

Thanks,
Kayra
