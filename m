Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0973B14C9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788492476; cv=none; b=H0tr46Fb/b0Yf5r60ZladGcqjkRdmZzzQFmTyhHvOm0zd9OHvzvUPduYgyrr1u6b8gXVDcCWTkNmizh6ZDIH6G0X4MC/KNVxh4y1v4nYyNfD7dGPMRtax4i5PB8hazelUTpcW1bBX95v/mGOSO/fgHM2WTGPE4v9OftL5R1JRHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788492476; c=relaxed/simple;
	bh=Al5KAJP8giS62+UxiXi5MDDZS7SoEmI6X+dEZIGc0fg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P2PTkseUboxRWvFgwS8txbZ64lnPEnBBTb/XZ71HIwYDh+zXbQR25dQpxA7t1t20kZ2sZxIeQYIAWoMyD3UccwjUsWwlajrR+6vomkKp/pg62LJwqvBPAxb9MLkpjQpnPGRfuNNcULbH8by5z1tGRGLTSrQnhu7g7+CDp6FRrJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PdGiT0Cu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PdGiT0Cu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E5B1F00A3D;
	Fri,  4 Sep 2026 03:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788492474;
	bh=Al5KAJP8giS62+UxiXi5MDDZS7SoEmI6X+dEZIGc0fg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PdGiT0CuPwQbG7gpnwF2wu669kC1UAzW8GO4geRORQE0qSbP4ixBfL0PHSiQCsGRn
	 ZIVRqTqDeINniv6qDdu1ce5ZHYAbn53uHjcWWbqrsFieDgIyxyliRaSY9PM0F0t6+o
	 qCtD+9qN4iV+el0CYwQbFjuhTSMKeEZWzORDeQydnniS9d4oQfCnwl6mcBiERmb3W+
	 mhUr4sACuzrGSuAp9qJavKJuWoVhFuZJr/FhsdOlmUbhqnHAsTtnMJrWSP943NpM0L
	 JXRaHqQIVrgTCoxODhGEHuNbnXs1ZR8tlaqbKxYmiw/G5C4T4LH7uLwed+rz32prBu
	 azyrNI47fDITA==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org
Cc: axelrasmussen@google.com,
	baohua@kernel.org,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	xueyuan.chen21@gmail.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com
Subject: Re: [PATCH v3 6/7] mm/mglru: move folios from oldest gen to second-oldest gen from head to tail
Date: Fri,  4 Sep 2026 11:27:48 +0800
Message-Id: <20260904032748.210-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <129ecc53-f96e-4a5d-a79c-c05293d815d3@linux.alibaba.com>
References: <129ecc53-f96e-4a5d-a79c-c05293d815d3@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Sep 4, 2026 at 10:47 AM Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
[...]
>
> Could you add this info to the commit message? (IIUC, someone tried to
> remove the prefetch in MM, since they found that prefetch doesn't seem
> to help much on modern CPUs.)

Sure. I guess we could ask Andrew for his kind help in adding the
following to the Changelog of this patch.

Hi Andrew,

Could you please update the changelog and add the description below
at the end? Hopefully, this would be easier for you than handling a
new version. If you would prefer a new version instead, please let
me know.


The impact of the added prefetching might be arch-dependent. Some
architectures could benefit more from prefetching, while others
might see little to no impact. In my x86 test, it shows a very
slight improvement:


***** no-prefetch:

agetest:
...
gen 100:    2.421 ms
gen 101:    2.424 ms
gen 102:    2.420 ms
gen 103:    2.413 ms

Total:   248.418 ms
Average: 2.460 ms

agetest:
...
gen 100:    2.393 ms
gen 101:    2.396 ms
gen 102:    2.395 ms
gen 103:    2.392 ms

Total:   245.627 ms
Average: 2.432 ms

agetest:
...
gen 100:    2.433 ms
gen 101:    2.427 ms
gen 102:    2.432 ms
gen 103:    2.450 ms

Total:   249.186 ms
Average: 2.467 ms

**** has-prefetch:

agetest:
....
gen 100:    2.314 ms
gen 101:    2.310 ms
gen 102:    2.321 ms
gen 103:    2.303 ms

Total:   237.619 ms
Average: 2.353 ms

agetest:
gen 100:    2.342 ms
gen 101:    2.343 ms
gen 102:    2.339 ms
gen 103:    2.335 ms

Total:   239.929 ms
Average: 2.376 ms

agetest:

gen 100:    2.344 ms
gen 101:    2.347 ms
gen 102:    2.352 ms
gen 103:    2.348 ms

Total:   241.188 ms
Average: 2.388 ms

Basically, it’s 2.3xx vs. 2.4xx, lower is better.
