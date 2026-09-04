Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD51D43A80B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514044; cv=none; b=j/+EH+m7mfNpI4UVv3ybvyx+jgN2LoUZP39SkJ45eV2OC8PtRRkCcvqzlYltqagiiZF0xlHWAwVfZClS4v6Zg26LVZ+f+3oRtpgWUXGwZI1nRzCMLQEHdTt9khw6XZ4wutrHSF+H6Tzr71KfC+cW809vaJCXHY0SGb3j3bTxuGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514044; c=relaxed/simple;
	bh=6Jh9YwKMSnQM3tAKjwVqWhn34D0cgvjhP0P8CvPoS7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hkENgEHSlrJyq+q4DQbmJlVnnsQAOxlv12nkjSYMewbxXOLgPHLavGvqBJjRj03Lr+Omq5nM0u3r/BlYIeLyA4KOhIEckXRTmocsWFIuXrk0JV7qYctSEWIH1OXjHMlAQ/3C6pgUFp/XIwLi2EKqmvVrYECfF34AYs1if5h9X4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKdey59Q; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKdey59Q"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso646168a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788514042; x=1789118842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Jh9YwKMSnQM3tAKjwVqWhn34D0cgvjhP0P8CvPoS7E=;
        b=fKdey59Qh4FEpmUGSdu5C+eaI1AzPYtvxFxEWVl1Rvc/CB57UD08YGoFmIatSdZWMG
         AB0dStvltuIs9DDHQnjZLPG+/SwhQgHaL82tZFrulKIudL+bxWGCLDlmH2c+kysy9wXm
         4QzbDnQCSUPnbCAtZfg1Eesp5mK6JDljwebqbe9a1ZiXje3tUP1EXAlNZu0EYi51C+59
         mRNUFmuTLXG/rxNcQK9OXD42Z0EOzJ84hzN1FDTezLF7IrM7e8MwKN5ahcBCn4b1rLmp
         Ez1ApjObu34rw2u8cplIpcggSjlcRuwi5sT1YPJp3kYucYwKUp/GPuqFnb6vqVQdGtcO
         1xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788514042; x=1789118842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Jh9YwKMSnQM3tAKjwVqWhn34D0cgvjhP0P8CvPoS7E=;
        b=qRxc3f86JcN1QtPLQmyz5vps6HAuYR0KwPOf+kr6wU3qB/32KgtlxsRR8bR9NiwMBP
         pSZ4bzrjBuE4xwvTG8TUt0qzO60JFr3g19feqTGrIOlIZIlWPodxDcUIaaw5DPeyDep7
         GHBwCWD5xJSkkWR99mheHb3tJPAN36Svq2Uflh5hTNZPN4Ans1ikvm8pJyAeRJxJdloh
         0xNnpHwQrDaK3vNPEeL6Sk98tyj3ieg4kdjKk+QsRkLdlJvsmvYzalrKxlN6Bblm6uL+
         u21mFwkpXLP3MAFkiM/bJXcxEaYnuZ3XUjnxgVFqWFTnrwQZb+8Jo5aEHJh3tQoiYn5G
         7DGA==
X-Forwarded-Encrypted: i=1; AKwUvBya4AdO+JXB5P68J93vLdxC0OreHXh/T0/in9OIK/hbU7obuUqdnimJLfgBbIyyOxqhWMsrj+PStQ7bvBY=@vger.kernel.org
X-Gm-Message-State: AFuF++lsstujirYgxJxI7llzmku4R56rfzRmepF9UQuDBFFI356ey2tA
	9mgBYDR6Yg9xEP1lA4jEzlAgfi0jyKK7g8HjiJ/7/sK1USDq9psF3qJSqunwvv1sJg==
X-Gm-Gg: AYBFou19O8swXsamgjh41xBa1gWuJfJtZdpJ+FdwSCu7Nmsvcd1j2Dwta4sbQxcudGD
	1PhyqN/MYp6Vk3kp+KZTddDZiKpETAiUJY5aMD2ksGfmsRpSDPRGY9qb7n/qzpoOyUvBMsB6QuG
	wyYAe/RdSPTBka2JH3OjnkM7l4MpnJ+G6m1noa1RSUP3bYkL4m8uaN6QFXN1QqxrR0WKXYkCYJY
	sMhcIVOwEgyJCcV7cR7lYODybTkhQZ95tg/RNT4eWoh6kFNJd/jkYqtQn/0IWQHVjtShZXwh3Bw
	pz8daMRZKd9U4S0lwLzxb8Lrxj/u6ZJi1vG34s7Zu0r9VY1En4eV6kiRIWxbDL6cd49tjcg7bOE
	ChNf9lPFrnyZ3keftRGBXGwa5mKOUDhvyXjfCARVay1RLD4blhiEvB6d9+Gy3uQH43tkLMWFLdt
	OGO1qFXLdRAiIszRlU7g5BHUAksP+pe5aWIIp88F3IeZSSWyqNYnYPuXj8VzoQAyow6dohKwRBU
	crB2zIkkAbbRa4=
X-Received: by 2002:a17:90a:10c9:b0:39b:34ef:3b2b with SMTP id 98e67ed59e1d1-39b34ef401dmr941098a91.14.1788514041803;
        Fri, 04 Sep 2026 02:27:21 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:646c:494:158f:c4ff:121b:b906])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm3518116a91.10.2026.09.04.02.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:27:21 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: bot+bpf-ci@kernel.org,
	ast@kernel.org,
	andrii@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	memxor@gmail.com,
	puranjay@kernel.org,
	xukuohai@huaweicloud.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	shuah@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	xukuohai@huawei.com,
	martin.lau@kernel.org,
	mason@kernel.org
Subject: Re: [PATCH bpf 2/2] selftests/bpf: cover the exception callback using its own BPF stack
Date: Fri,  4 Sep 2026 18:27:12 +0900
Message-ID: <20260904092712.10691-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6aec8f5c91db3edfd8becf6f41bcb33fda2cbea1bb894888cbcdab4579b0f086@mail.kernel.org>
References: <20260904070210.4163193-3-donggeunyoo.kernel@gmail.com> <6aec8f5c91db3edfd8becf6f41bcb33fda2cbea1bb894888cbcdab4579b0f086@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Sep 04, 2026 at 08:09:36AM +0000, bot+bpf-ci@kernel.org wrote:
> This isn't a bug, but would 'u64' fit the surrounding declarations in this
> file a little better than '__u64' for the three new locals/globals?

Right, the rest of exceptions.c uses u64. I'll switch the three new
declarations. Holding the respin for now in case more feedback comes in.
