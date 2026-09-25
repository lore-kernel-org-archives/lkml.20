Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FD53AFB06
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790319346; cv=none; b=SsPgo2edGG6AbA9RxI8bX3uhXYFkSP+l1+8D7TshUFVhMVq0fwyTNmhD20CVlfeC77O3T9I5R112ZsQWtLsuYHI63eIxs1ejlpcF0CxTVw9/iXtp4+PIZZPbOY/l8KJfCJ++lOt5SP1k6nD31wkpyGPcF6ywA9MbBFVHp927MA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790319346; c=relaxed/simple;
	bh=tx5lnhA+lxgkmkf1DN+MC9Y5ctB2DhEwgjJwGzsdzag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LOM/fEH8TSfhzuREDgvqpbA6ejZNPvXPIN0TZ/nENiDuLjKFkK4lWvjqxzKNDgcmH9sfIxdaFrjArQtVxxhZlo/ON/vwcNMQ2GT45Oep5D9f/grpYG6aKZWbJq8KY3+c+qZzZHjQxTplg1/VkmMvbFy2bJtL1L6S+sXhCD8vEpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luAfLzH7; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luAfLzH7"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a0b0fa2055so362562a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790319345; x=1790924145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tx5lnhA+lxgkmkf1DN+MC9Y5ctB2DhEwgjJwGzsdzag=;
        b=luAfLzH7f6/6J1iDo8xZEbXyfItnFfrYBESMykfpD/YxsqOzMvxR04zQGQLE+QVvZj
         73pZsBDV5h7cCWWl0SyPYpkuOZVr4H6/jkxGfYqIJGl911pmyeooHVrMZithh5WV0YY/
         rWvY2wedCpvJaS9EeuS49JtvCtM7aJ0w6KmZ7VcicdH0WORx4IjGt8Mu2bLCT0z+JosI
         l4kRvprLXHIQ3a+wLSN2W2FvQlxAA/mkBT+fWcn0y4pbGH/8NpW00+n76ZS63/njaHzf
         oan2LyEY4mK4gSOtFIjiXcIlM/WdkJSGkckQtJUCKF7ynXLQkfBoIdNg1vbH+N1zA2sx
         I+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790319345; x=1790924145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tx5lnhA+lxgkmkf1DN+MC9Y5ctB2DhEwgjJwGzsdzag=;
        b=dPl/AyGwa4N1bvWJ4ZsKflYniJ/QTLETlmCDdiZfz4uHvB4DsVzYRETKRGlMH3fYYE
         iHQVqAQOes6mJpQ6uOLIO2JJElcy2c33Q3UvHZqJrhMmYCbuJG69fG4UL2V1fkZ8Mmqg
         74oHBWFp1BMpMDPG2ixR+gRr2XtgjVqWbjBNkZRDUWtOvpMYXL/WAbjKwSM6aUYhgKv2
         08GLwhFgabqrsnrA2j4i1OCEhQJrwEK4+RRQW6Rnc86aMp19JpZcpIIXFjwDCrVyPNQU
         8GIUCRwj3xVQsbWNutG0F0ZBAz2Dhitc1ikoFiLJ1qfn3rFt1WwgUzaLSIZHTCyNvBjT
         vcHw==
X-Forwarded-Encrypted: i=1; AKwUvBxku13QcJrGFl8wAei/k60I1Ri1uIa1UKtWd4ucuc9jvPmBNXaUCiIQ82TfwNp8CsktQjonPcXbDKpF/i4=@vger.kernel.org
X-Gm-Message-State: AFuF++lRAo5MrZzgySvMXMdXnbCvJCy0MSADr22BsEDN8p/1ioh+eDoz
	tgyrKBKU1NLjfH6TpbLoohMp5fbiBzHxJsnqbJJTR+yNLDPmLvv3S7Bl
X-Gm-Gg: AYBFou0PiSoL0wCA6aZhByN9Ptj4Ac3F0iyL0BlVyF/aLEBnBX1VC5vtGAFeTbEpnMQ
	IANuR3FlNzkprJlVLJObg7axZRL+FQV0VjI5km65oEGPKKcRGlSNxUYAWByrn7hxmrC1VoUKNeV
	KWvDOp1Z+D557uzpYWOkFf16ydLCFbCuY3UnE73130NxGUVatTQ7dwisaDegQjOOEvNrsluFvGX
	eiuTFR6VdeiapH+bJf00NMVJOXlKQ0futNXUNqVn79HJVuGK8dd16lNu8sQvg2D8Vrp5/N0j18C
	kIAnUBI2B3fqPc/QiErH5/Lx97O7InxYJcN2TKCG2vnI0+lTQcHzrun/sAKQdYmz22yFQpvFclx
	tEwrIhur551NN+evnHdcwxbFyDaWu+rUIbIFRhGkCMaa7pJ+5hqrURiy2ywF6xV27RbHDhBj6fc
	A8Ts2SF/Y/NlSpAB05NkX6Xw3aR00v20AFbjEu5Gi/dgVJl7XdVx3D/0uoLT0Z4yzDjf+cKD3D2
	YVW8Vn3Tr397F5/cW76DFE6Q037fqtgmrb+Adlc
X-Received: by 2002:a17:90b:3985:b0:39e:6c69:f482 with SMTP id 98e67ed59e1d1-3a098d5e61fmr4310895a91.65.1790319344531;
        Thu, 24 Sep 2026 23:55:44 -0700 (PDT)
Received: from localhost.localdomain (vmi2317699.contaboserver.net. [85.239.239.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b998e2bdsm2718096a91.13.2026.09.24.23.55.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Sep 2026 23:55:43 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Youngjun Park <her0gyugyu@gmail.com>,
	Youngjun Park <youngjun.park@lge.com>,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	linux-mm@kvack.org,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kasong@tencent.com,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	shikemeng@huaweicloud.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	yosry@kernel.org,
	joshua.hahnjy@gmail.com,
	taejoon.song@lge.com,
	lianux.mm@gmail.com
Subject: Re: [RFC PATCH v11 0/4] mm/swap: priority-based swap tiers with per-cgroup selection
Date: Fri, 25 Sep 2026 14:54:57 +0800
Message-ID: <20260925065521.36340-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arQJIjzE0BlUg0CV@cmpxchg.org>
References: <20260916183437.2946306-1-youngjun.park@lge.com> <20260916200434.GA5784@cmpxchg.org> <arAHu_BD5oqpZJER@gmail.com> <arQJIjzE0BlUg0CV@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 01:15:14PM -0400, Johannes Weiner wrote:
> If you can think of a good usecase, memory.swap.prio.min would be
> certainly a natural extension. But we should get the usecase laid out.
>
> The requirement to punch holes is the one I can relate to least. Why
> would a cgroup need access to good tiers and bad tiers, but skip the
> middle ones?
>
> This would seem less like tiering/hierarchy and more like flat
> per-cgroup swap pools but with obstacles.

Hi Johannes and Youngjun,

Sorry that I am only joining this part of the discussion now.

I recently started helping carry Kairui's swap queue work forward. Our
current v2 is here [1]. Youngjun's tier work interacts directly with it:
v2 maintains a device queue and reader for each priority, while v11 makes
each priority a tier and moves device selection under that tier.

I did a functional integration test of v11 on an x86-64 host. The tier
mask, fallback, same-priority device allocation, concurrent allocation,
and swapoff smoke tests all worked without kernel warnings. This was a
zram integration test, not yet a real multi-SSD performance test.

One result seems relevant to this discussion: with a restricted parent
and an unconfigured child, the child could still use the faster tier. I
therefore agree that an inheritable memory.swap.prio.max looks like the
cleaner first cgroup interface. A hole in the mask worked mechanically,
but I do not yet have a convincing hierarchical use case for it; it felt
more like per-cgroup swap-pool membership.

For the queue integration, one possible boundary is for the tier to own
the queue/reader and for the swap queue to become the default per-tier
device allocation policy. I would like to align this with both of you
before changing v2. I will also continue the real multi-SSD tests.

If either of you has suggestions or specific test cases you would like
to see, please let me know. I have a few test setups available and should
be able to try some of them. I am still getting up to speed on this part
of MM, so please correct me if I missed some context or got any detail
wrong.

[1] https://lore.kernel.org/all/20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com/

Thanks,
Lian
