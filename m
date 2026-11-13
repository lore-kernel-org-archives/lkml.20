Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569056;
	b=ml93OE0NSuR0IDywNW9xntAt0/rMqCeAiRVNIOtdV7K/nwfKPE+r8js0PjDPwlhqSIw8
	 qz4ClndadLUIjOC5DSQH7PATZ3vdZ/Mv35uh1RlsnBLjul56uAda8B+PpPEpOnI/R/qa3
	 Z3noJoc9C05gw09jQaTPxq16gGOQ7izsnW/GVievTNmcRGd0gts6br5bIPlY2uwKjRVnt
	 +kLw+Wd21U9Q2uQnYifkgkLRmdX+RumFa5kURQdeVFdX1sHqtvO6BnJb5lH7fJLqpM54x
	 cM+/tefFinloStXz4zJnL7CkH5SRXx8yrgf+m8/uvKixU/s+GPZLhnkwol6s5bypI9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A2z7Tw5DHCFD+mcx9gw6v8Y1X48/h954fhMI36CiU8A=;
	b=fjbeMa09VM9YY8LOWpTG+b1I7/Vvk6yU9XjwzhwDoNbQHbWSvPrDiMGAPm/jVPS+zRrM
	 BNYE1pIg01gA+MfoxMtWUHMPPjQcrlEzNRtFYijyZKm1ed9srb3o+McaEBXz/R8B4nSoS
	 Y9btl+YxcZtAQK3N5IbrSEayL+e04UxyDFBR0IaCbwTxzTC2MtyZBQTjFJO1O26KTbXnw
	 RHBK41v2XgDbir8f9LrEhMkqCK7/6CVg3/1urP8JbvqUPjKiA3Yx9sjCowLSFIyGSKAaI
	 tEFu5qifW1E+qiv9tsPZzbeHblLaekPDdonAHL2DCJaI4IHlarOpWrPV3CqP8WDXR+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0XKB7toi;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CC4606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13CC4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0XKB7toi
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdab938dc83so485955a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794569055; x=1795173855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A2z7Tw5DHCFD+mcx9gw6v8Y1X48/h954fhMI36CiU8A=;
        b=0XKB7toibmTif2MEATU8EZggVXApNKF5tJbXh7MpZRZKyI4pE7FaNOUowZOCzwzkVy
         S1NwmO7Y+wY60fXBsK5t/EkC1UBC6B0TnOgyqZDTBdhgJNn74YVQEC4qvH54McRUvSfR
         YGd99C+Wv57zzyMJnGyEJgUjGiRNCqR0/ic8VGHJD4R/ojC4IhQ+lhm7DqaCQ1MjJIEb
         AFrHb1RqjZ+0ikSTu5WI5sdS+7At98IO0TNPUr1dUBxQxdeQDmGM9fH/H+iKtkxdSdc/
         f/9tJKHqkV+Vruy7ktloYUz6MVlJH4aiHHGPUgQKf4IWWhIkNEg0qTuw3r5AqZQVW4Mm
         /Mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569055; x=1795173855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A2z7Tw5DHCFD+mcx9gw6v8Y1X48/h954fhMI36CiU8A=;
        b=khFF2dHI2FSiMhb21kggj/v+tnE6XE2AhJOnUeLX217tn98pADPhiEX96Uw3EQmrhh
         OO8S9ITU8wfSMYdNe5lNBMVqh8sxGGbtD5KH3U51OBToNHv0+d5nQNEKV0LlKYBYR1hi
         c5jX1uTc36LIZiPvcKiaYebXgtz9uxx0I/J0mA/qupep31Lmk94E/Tu+cMY3eeD9TiVA
         f0wHN3zhehqd9QE9Vfc2z9o/POTAN2BnCOHtdqtfH3fZXV5znPXy1kwpCwWGWPKPW3nn
         gt5AxZH5a1EUhajkAXEQcnaIOiMVMiQpY++1/EsnCG66epgieHVmvAH5p3sADm6PrB6C
         4INg==
X-Forwarded-Encrypted: i=1; AL+hErHnfRCaeGawXtHOT2NxGFWtlU4aBnfDVD0s8rH/u04CosZmSO3DdmHWLaTKYmWglG8naSHwb4oh/7SOKik=@vger.kernel.org
X-Gm-Message-State: APuU4Z+agbYDn53NK3Nse/KnY080x84RPSCrmHst43ZQMvicwKCD9Val
	IcjHZyrHYInV+xVX/htL6pR/6H6KkKXJKhXHQErCGB0J0V9wEVf0pNSV
X-Gm-Gg: AYBFou1DZeQkZiAp91BVY0zRUw9YbkPlMhRfeGCPLm0fGPm9BkRTJismfEGODGNZJ8Y
	DzobqN6GM7OzPrUois5xB0O5cLXEuRHsU0EC7yPX1BcgeJJcEneIQXgKOOLoZ/pKftoJZcqTUtP
	kzVER68WhVRtDtHfDKrvw+g2xKr9+NtWeH5zXBSd0XLnPoRfMglyBQvWb4VWxaoV0uaa7yk+0yH
	bXAtWiGelLXJHRtXQLp83AiyNmygFWX5mSYvvWUeR1hXlhdIlaX+4cOwnml9wEAM/7sdv/9CyyL
	upVcPMADbGvjyTOF3Vz9QsTXU9V40ePq3Cis+Gjp3cjZpJbdLdA+M7W+Jxw+yGwOHHCylaVfvR9
	v0Dk9jRfwDipR5QqA4W72a8RK4ZysUEfcdzV92cwlfIOfe1x5eJnq/lBghoXa9jWwONlopumkSv
	5QTOvmJoVpsb+0c6IXGXP0Im4YadScTRxklh//0w14fUzElWghCe9J4uvjcZFZOYzsVVZBnDtvg
	ud9BOPdtu4ldtJKv0N/87Lp4+DzAA7sy6lnP2mH8OIHlnOuQWSl51EoT9OrwPMtCQHG27bW53Iz
	yxDbxONg/zCHCCXxYXPXQrPI0kBaP+GMHt4cA3B7C7mTJg==
X-Received: by 2002:a05:7301:2024:b0:36a:18e2:64c with SMTP id 5a478bee46e88-379655d3d12mr2185384eec.11.1794569055067;
        Fri, 13 Nov 2026 03:24:15 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm6771786eec.6.2026.11.13.03.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:24:12 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: mhocko@suse.com
Cc: tj@kernel.org,
	akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	penguin-kernel@i-love.sakura.ne.jp,
	mkoutny@suse.com,
	chris@chrisdown.name,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH] mm: memcontrol: don't miss processes whose leader has exited in OOM scans
Date: Fri, 13 Nov 2026 19:24:05 +0800
Message-ID: <20261113112405.1583476-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <avbIL86R61Lu2YVF@tiehlicka>
References: <avbIL86R61Lu2YVF@tiehlicka>
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

Hi Michal,

On Fri, Nov 13, 2026 at 09:19:59AM +0100, Michal Hocko wrote:
> Do we have any conclusion on this?

No, Tejun has not commented.

The same case has come up for cgroup.kill since then.  da13e0e72a73
("cgroup: fix cgroup.kill for exited thread group leader") in the
cgroup tree handles it by walking all threads instead of the leaders,
and leaves migration as it is.  v2 does the same for the memcg scan,
so I would continue with it.  Chris's "mm: memcontrol: Don't lose track
of exiting OOM victims" changes the same css_task_iter_start() call,
so v3 will be on top of it.

Tejun, if the exited leader should rather be moved along with its
threads, this patch is not needed.

Thanks,
Zhan Xusheng
