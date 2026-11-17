Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794891038;
	b=nZLzkx0xYpx/okHM0RfW4iMqQApyog9hubRaHPHYq3LtxXS7OFNz+ZZkrtZ5MsyXd3BH
	 Lr79GK0LiSoUQkeK3WOY2iv64bxN/OR1BtMoGDFNdrn+Fqxlybw0Hi+y7TNiw/vr19Uu3
	 2QT1d1s7VLtGWlsljVeoRSLfxvgR1aPZTyb8whkrxauN3BKl121wIKf+mH2msr7w+jE/m
	 Lt7NhgULuzWAV8MOpFCK7jQiPn/Ew58KIf2Ak+CVzjsiRImwrqzbuXsFHfALoZt0yg2dz
	 HyVHRiwkwJIZH+tYi+v2QOgjnP8ONEKDz+97RkAN4mrqKPnggXEOV8D6ppf4oqmwP6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794891038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=9bqqmMB4+kyoRGHHPejEHuADL6UxgHY0xArC5J1XYUg=;
	b=NyckMfcvMbH4o0I+/a3xWCjYOXNHAiaBuV0FyQytBFLDDtf78FQ8+si2IFudeLgMYgH3
	 cwHARY0iXjbmI7/YOROwXOdhVbebPJr1oA+7fJ+wmHp3W8rtUJdb7XCQ77vz3yN4Lc0Dn
	 jYB4S1BF+FXH+bNbm1++sMHe2w6Cv3QOl5Hlqvz3zcnYSgW7CnOLLBOqka/IaTyKU9aSB
	 639reEmZMq+20HD9yegTe0Jx9yj+yNxAhphiXpmn7Wre6LmuKj//ZTzh385WUqzS02nWn
	 nGyKrviDHjgl5F5420/x5Xdhg3Wi+EJa9pIK82bXPiciX4T9L7ZuP2l+pW1t6zTAlEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=JVoEkBuR;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528AD606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 528AD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=JVoEkBuR
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3b4944a0eso2172104c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794891037; x=1795495837; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9bqqmMB4+kyoRGHHPejEHuADL6UxgHY0xArC5J1XYUg=;
        b=JVoEkBuRB7FQiKYHvBCxvAxh9Oaxf01xN5UIrTjfVi6OU10CeKbp241d27RcBRcSsk
         /Xi/x0gE95b4H/4imd4d7XC7TvMqKuqGtZq30FdKfitiezpDW1A26JSOriDXlFFBwZBZ
         HwMfdVtpba397eVPFTvqZp/IbohPL8IT2620Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794891037; x=1795495837;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9bqqmMB4+kyoRGHHPejEHuADL6UxgHY0xArC5J1XYUg=;
        b=1RSY3EEBxTXlHvzpcJ8ZfWdurwIA7SYQ7zhh4G6qbeq7Pa2FvxfYt9Q6DAc2zdzvOh
         dTs1dW3vFckm0Mtwip598IxTrGx5cN5LYK6Bmc4kTKZkfgGm86IZMEGhygY3YM4FWouA
         +fEC3yLbg3ftwUtkS67kFVKT1gf55C3ozQePuJH3cjYBNMvrqleazCpbR/PLvQuk9sjW
         on8H5ygXBtyZvFZC1jN8ojCXB503UfwK7TQYXUrR0yX4fXoRBB7QlkdBOrnyyWwFAUAW
         p+ZKC+7faFUvHKh+E9FN3+MxRpi1oUTSe4W5P9h18STypq+cRzsZJcMTrhkqBd8Boh3F
         1Lwg==
X-Forwarded-Encrypted: i=1; AL+hErFBXL7jB9So4COWLyQChmL+KsDvAAwJda3UYxbVafavuZ+vdQwXJ1x56eZPNG1+OF3KPOzosgpu0VZxYCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vxml5KE5pkBpsPLiPXy8/3QK6ZGxr1Wyd4Eqro1uGPPiUQ5Il
	LgRI+PYf8DNUEnhnT0iq00sIExUJCWbesD02mxdjq1DNTSBB1i0s+7xC/rPFH226yzc=
X-Gm-Gg: AYBFou2bI3sVyZdDvbld+vO/u4+J/DYxp/x54oVopwhYkTzqVUTIAnIPzXkgnbLKwRL
	NUFLG5//fFNr76FpP39fmauxu8ehBaf65l1hldVVfCXSLa3ELsCD1EqmYEzvdnUAv7c0rerlD4K
	vLPMNfuzVLH7Ipf0pliAstQHaSndcxPY5qJRQHMvTfOeaBm7Gss3ozJAQY0fnYhwZRWquiQEuEa
	05y661juuNTu//CQ7BrFO9yB1P/06XqSfD7UtpJmTeqp1md/q1NthTN47YsHoX47OMu21gS6Kds
	mOTrmmFBsm3hRwq4D7I03UI78rUZxOp6mxwr/oYWIRIf7UYhZ4190kv3dXbGCEHN6eB7u3HetEo
	OaZaJIJ/dqNM2ciJnOlrkQTWij82WcFDvOhFSIWQ2ZYs60KtuIrBKt1azriQK5FL1N32WIlj9pJ
	5nBytdcoUdU2epC4b5eGHb+D9BrQWoNCS8PJ98Leg94zGdHZD8x9Ylqw7QVBXQLNAFkNXFRy4RD
	2Ww+/VEzfYcqXQBJcWI7iNV7IE525JLXimiYy1iVp89AnIOD2b5JbEIwN9vGaAQAKNsKahSrtdG
	Gm9C0laN+yCBOjfAONacj9wkPo46Ntmv7xxCaWfGkM6ReR+458jX5GYUPnxXiTylz8ACfiaeocT
	jtPeMKvMTV8TZmTJ5KZFSj/JX07+ISfRm6oSMeZDjP3XGwgT1PEX9XScxqjF8THB7OzsPAfOaP6
	lNGfpI4sngbB4uPxCKi13nr1UlcY0dywbdDejQJNbZY3MXuBlm8P1QSTcTOQ5MaVyk
X-Received: by 2002:a05:7022:96:b0:1a8:4997:65f6 with SMTP id a92af1059eb24-1b503105175mr11734678c88.20.1794891037361;
        Mon, 16 Nov 2026 20:50:37 -0800 (PST)
Received: from [172.20.0.3] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm53517692c88.9.2026.11.16.20.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:50:36 -0800 (PST)
Date: Mon, 16 Nov 2026 20:50:33 -0800
From: Chris Down <chris@chrisdown.name>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: linmiaohe@huawei.com, muchun.song@linux.dev, nao.horiguchi@gmail.com,
	william.roche@oracle.com, ljs@kernel.org, vbabka@kernel.org,
	tony.luck@intel.com, wangkefeng.wang@huawei.com, willy@infradead.org,
	akpm@linux-foundation.org, osalvador@suse.de, rientjes@google.com,
	duenwen@google.com, jthoughton@google.com, jgg@nvidia.com, ankita@nvidia.com,
	peterx@redhat.com, sidhartha.kumar@oracle.com, ziy@nvidia.com,
	skhan@linuxfoundation.org, corbet@lwn.net, david@kernel.org,
	dave.hansen@linux.intel.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] selftests/mm: test userspace MFR for HugeTLB
	hugepage
In-Reply-To: <20261115160105.2507650-3-jiaqiyan@google.com>
References: <20261115160105.2507650-1-jiaqiyan@google.com>
	<20261115160105.2507650-3-jiaqiyan@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <avvdGec7NCt5oAFr@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Jiaqi,

Jiaqi Yan writes:
>+	map = mmap(NULL, len, PROT_READ, MAP_PRIVATE, fd, 0);

This isn't right -- a private mapping reserves hugepages of its own, but the
4 hugepages that setup_hugetlb_pages() asked for are all in the page cache
by now, so the seal mode fails with ENOMEM when the test sets up the pool by
itself. I think we either need MAP_NORESERVE here, or to ask for twice
NR_HUGEPAGES in seal mode.

>+CATEGORY="memory-failure" run_test ./hugetlb-mfr

Probably worth adding a 2M line or two as well, since this only runs the 1G
case, which is skipped when 4 free 1G hugepages can't be allocated.

Thanks!

Chris
