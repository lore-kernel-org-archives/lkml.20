Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692885;
	b=0EY15iH2bjpxjcziyCtG+4BhfWltAMU/R+nJ+yQ4drzythm1NbSyr5pHpMhIULuavw7y
	 psWMgjVGWV/lZCeDv5Md2rg0P9TB2CpMytEygJjqsAzG6elRZyX33NuM6ledoCO5tffms
	 tUg5vsiTQw5C9Goqah6TBHzm29xuf+zjvMDwpZhpQQtQRRigKKBvYZRd5tmC6R/UgjHRH
	 NBu0FmUKzHFy6isS+CzxPR+zzOpQEvb8Mz4YYfOYZMc9iA0dF1TwjmNI5luhge6NfGYCN
	 gWVHmxTxzJM2aGTOM1jrgV5bxmXgakxkYgMGYvAYSoafbjFwKKSJ6SVqY/mtuTKM52g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692885;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Dq6oOFOAZU2isTmULY88ZuxmHS/TA88BLaSmBq2/KSc=;
	b=bD7cVd6j0sd+MU6/Uyf30liWIY3IkQwDsE+wnpaFfYl3dwQrS5BPpVHIusKwELuKNrkl
	 1ue/brmL4K9r3g0EXbe17I5iqP9F/7TyM1h3oxrqwvlWQpF6G6j3fs948bkEf1ZL5fW51
	 CrArGQ/CPv/a9HSY+bVI3ogUMr+mRybpozJKFcHQyaF+ARhACfEVgrCgQLy8sk/MW5KZy
	 pRNL+3ZaRc7/CIrDmK4yLN4A3t7gxap3Y7G7IQnYFlfSdTItNJUabr/QrdQTBpRkmpRTO
	 QAbbITWBWJ+Iq4dAy3MpMxJu6o/oeN/VGDC+7hS5MgQa+JSr3jGJnrVBLEGacdWYRGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KINhXhpQ;
	arc=none smtp.remote-ip=95.215.58.37
Received: from mta1.migadu.com (out-37.mta1.migadu.com [95.215.58.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF22E606A33A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF22E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KINhXhpQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kdenmgDIdcPw1gofp+pTbFrp5V8zDpPUvs8MrZtt0Lk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793692881; v=1; x=1794297681;
 b=KINhXhpQo6Z5xPdSXPPsx0nf/J0lHWKXck8ODR7OaMUSROoCZxv7QES/dD+P99XXs8F1xWpd
 qBDt/RNG9nbpEd9Mm+WW0Ow9iSpjRcIvUkI1NwfEC0vFbRkInd48LUAYvHI5JWCbRr77sJB+cZ4
 huwf/cFgJYDAPJDvfBzTbG7Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 656623d56c083c98;
	Tue, 03 Nov 2026 08:01:21 +0000
X-Mizu-Trace-ID: 656623d56c083c98
X-Migadu-Flow: FLOW_OUT
From: Qi Zheng <qi.zheng@linux.dev>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	azpijr@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 0/4] mm: hugetlb: fix some CMA-related issues
Date: Tue,  3 Nov 2026 16:01:03 +0800
Message-ID: <cover.1793692578.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
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

From: Qi Zheng <zhengqi.arch@bytedance.com>

Hi all,

This series fixes four CMA-related issues in HugeTLB reservation and
allocation:

 - Avoid ineffective CMA reservations on 32-bit x86 kernels running on
   CPUs that advertise 1 GiB page support.
 - Honor PF_MEMALLOC_PIN to avoid allocating CMA-backed folios during
   long-term pinning.
 - Skip CMA allocation when the caller disallows direct reclaim.
 - Enforce cpuset restrictions on surplus allocations, preserving memory
   policy semantics and handling concurrent cpuset changes without
   discarding folios that remain eligible.

Thanks,
Qi

Qi Zheng (4):
  x86: hugetlb: disable default CMA reservations on 32-bit kernel
  mm: hugetlb: skip CMA allocations under PF_MEMALLOC_PIN
  mm: hugetlb: skip CMA when direct reclaim is disallowed
  mm: hugetlb: respect cpuset restrictions for surplus allocations

 arch/x86/mm/hugetlbpage.c |  2 +-
 mm/hugetlb.c              | 38 +++++++++++++++++++++++++++++++-------
 mm/hugetlb_cma.c          |  5 ++++-
 3 files changed, 36 insertions(+), 9 deletions(-)


base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
-- 
2.54.0

