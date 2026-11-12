Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486185;
	b=p9Foff6SiyhHpgc1+0T+Y2hJHYK6Ozyhi/jGcQ+MWWrVucxbev4WmoaM8ZKp1qVVU2Rq
	 kNW0Me97S/OXCUZWYd4B3Qv/oy0oEV0GiPkGmp7UeThh75eiL0d8/AWx5Asa5EpFdoypJ
	 OiUQzHjIQo+ZnRTu5+FvG6/KOKxO0RIRmzhEOkU6vwhcwAmYmgYCUpNlXhSgblPE1uz+H
	 in8iVxk6jv67u2N7oCyVJc0k0X1UlX/PK1m6sJfqt8NnbVW93acEaj/YdSNfVqfVHvp0N
	 RQRqdK0dTzVkAfdP8EgJVZkQ/PT4T2z0uVEFgdVHN4+0Ki6BW+n594RY8SEPgA4A0VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486185;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rWhSYBcxqes1xvTYu5NtXz1oF6AJO5nHGjtkI5rOYKc=;
	b=JrSt2rbE1SHcyZ1NwRAeqkC1WOPjHIatu11lqxLAHbRzbwdPG3h2iHsKuPc32yG1Teqv
	 xc60h8gYP3qwZpTgXY13jtiflTPOuTm5hUX0JazpA0e4dhTEw1+ppwnHHMiN/znN4zxYj
	 igtY4171R1xRe2DfQrGHVJhcmz6i2R/B58isy0Nf3TDcs5SVATPoc5olOXBoMLf5PWkgC
	 aXyHTKoa/S4AzLW0LO9DEDxgt8ePnBpWY8/+Jj7uVKupTxe8GuTeK6y3NMmzKUiLEQH3v
	 N0FlkpFsqn92Wj2cmUqKor6tnPldfb8Bvqni3So1E0uVQxqlFJlsU+TTYpcIhK+S8Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raidlab.org;
	spf=pass smtp.mailfrom=raidlab.org;
	dkim=pass header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=nBEtwvjJ;
	arc=none smtp.remote-ip=79.135.106.111
Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F57606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02F57606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raidlab.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raidlab.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=nBEtwvjJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raidlab.org;
	s=protonmail; t=1794486182; x=1794745382;
	bh=rWhSYBcxqes1xvTYu5NtXz1oF6AJO5nHGjtkI5rOYKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nBEtwvjJIt+E9GSVizSl+RBHBhvqwnnY/4sADWvEuG9WL4wSLoqn0Zrp6EUnvE4XM
	 vOsKiptvAsovjvJufblFBM0fIP3lCOlOlGEgnTLbb2HL/diCKHq8DgzX3eNTyaCRr8
	 xkuZ7vhbSX84vkpqohkypkN3A7VE7E5HaoZ9QSFLYCb2XGdn2l7J980dpMyqP/vilK
	 KqPt5eANgA+x9WmRTFFgJYgvnNNozUdzR9zf0Cg1UVq8y39yhiIwAyMJdeUWuev6NS
	 Qtiyi26eaG6zx4cxPeV6BPidnmDyfZawQl4y2q3fpfZvnhWsXmtyB+apcMP58bmv63
	 5R6Ob0bgfc2Sg==
X-Pm-Submission-Id: 4jQKKb4Ljvz1DDLZ
From: Miroslav Cimerman <mc@raidlab.org>
To: song@kernel.org,
	yukuai@fygo.io,
	akpm@linux-foundation.org
Cc: ardb@kernel.org,
	ebiggers@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org,
	magiclinan@didiglobal.com,
	xiao@kernel.org,
	antosha20xx@gmail.com
Subject: Re: [PATCH] raid6: use normal stores in the x86 x4 xor_syndrome functions
Date: Thu, 12 Nov 2026 13:21:27 +0100
Message-ID: <20261112122127.190285-2-mc@raidlab.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109030805.25709-1-mc@raidlab.org>
References: <20261109030805.25709-1-mc@raidlab.org>
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

Anton Gavriliuk tested the patch on Zen 5 (thread "xor_gen() md-raid6
performance improvement"):

HPE DL345 Gen11, AMD EPYC 9455, 6x PCIe 5.0 NVMe (CM7-V 3.2 TB),
Fedora 45 config, v7.4-rc2 with and without the patch, both kernels
select avx512x4. RAID-6 4+2, chunk 512K, no bitmap, rmw_level=2,
fio 4k randwrite, O_DIRECT, io_uring, 60 s, 3 runs per kernel:

  md defaults, 1 job x QD64:
    without  127k / 122k / 125k IOPS  (mean 124.7k)
    with     132k / 139k / 137k IOPS  (mean 136.0k)    +9.1%
    (a repeat run a day later: 127k without, 135k with)

  group_thread_cnt=8, stripe_cache_size=32768, 16 jobs x QD64:
    without  467k / 468k / 470k IOPS  (mean 468.3k)
    with     473k / 471k / 471k IOPS  (mean 471.7k)    +0.7%

With md's defaults one md thread does the stripe work for all writes
and is busy most of the time (about 80% in top), so a cheaper
xor_syndrome() shows up in IOPS. With 8 workers per node the limit is
lock contention in md instead (on my machine most of the time goes to
spinning on device_lock), so the saving hardly shows.

Miroslav
