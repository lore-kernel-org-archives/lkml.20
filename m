Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D4535893
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787968790; cv=none; b=ZLFXedDl4mR+Xe9NlZrD45flSrvb/gpVHVDDHbLwg7D6kIGQWmG7Le7xz71nKrsZDr92wBgBo6HxR5ORf+GZpXXbcafXUPOzEpNOAZGP+BoCgC76Q4IwRzXc8gXCjfkikkSg/k6040xR+2UOAMRiSGXmwc92g9F2Hc705qGWZjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787968790; c=relaxed/simple;
	bh=NArYYynNb9F0b0wdg9skXjDi5IwVj27xxf7mq4J8kAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eimSG1mIJT9l2T6wx8JQbFgS55/w5AHgQFQQ3lKOUZoloofQ23BNEG5HFzwRbhdMYAp5QpYwY5i206FigyOGuaOmvwBePh/hEyAOCALlGvqC07Ua70J/IMmHevr/KDynHKEb54DwWRshs9bxTmhdlTfTLRyRuNz67p+5411idAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=FKwW132P; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="FKwW132P"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e57a753f9so154480085a.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1787968788; x=1788573588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IC0TVf+dsTZWglnCyPO0E/mOtnxcSosUkHWaCKQvN3U=;
        b=FKwW132PFvrIAwsCFHc1S23bCcXsqw5f7UT5XyDfOu8Y4RKcsD8rmy5RRmZPTpAnTd
         cCGiF0/MAuTSmpQukS4S4mrYBfxy19Krm+1PmB9qAdmkXpfzq/Y30D4Xv5voLaB22Dpq
         uJMwo6Ld6tqckg90Q590hR6xF5/4/jctGTBUHwuV8o6i0yoiYG4dKWcap0PIyl6pg4WZ
         GJ7ZQZXS4EEx46EXGNVK0j/wjiAw30hFThedi80jLAe80T0p0vf1V44SRGfMC3NminLc
         I1yaRZkGNwG9a2Bn+yiKaB4BSCy+yesSErH5WFiZgGtXA5U3MChpxsCIwph/2o/dPtEz
         CwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787968788; x=1788573588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IC0TVf+dsTZWglnCyPO0E/mOtnxcSosUkHWaCKQvN3U=;
        b=Yx39MCKwc56gTFcl9hIGd2lMf5xwfZRykSIEi6UXQl5sX3mZ5ftHA4CP6cKGQ1okZi
         9SYPgCRe39zKaqo6AmPjjlt6sSfHQOPSrrzGSjlEfk5zB0pcDf0Kz1T/6ZSdhXP6KlIT
         5qe07B87n70q54RrqFxXUY5C4QUDQ3JJ7FBkgC1KmyDa0LVvxu2/QG27HBARjd+nYmCv
         M7I9DmBZs8WIXmSzYly4BKy8mBD+itbj8lim++xn2KWdK8D2e9WTi7yKCWZSBW5d/Kqm
         QmnDnNn4V6BTroVXUCZpcPvutSqntFkJ9g0BS3JY6kuaEaSyYmK8p3zOf8c+NLp5MgV2
         4oIg==
X-Gm-Message-State: AFuF++kSo1ojVz0JFSw25/FdQ5Fa8a1xnMoz4Yw95/iBQO3EV5oqjrOi
	roOoqmSNF+JmRDfjdFupXQuKrBMa6iEnk/XGD2U1jQALD//3Mnr54R+elx8+OklLrFU=
X-Gm-Gg: AR+sD12Q9HyYEkiO01Sd6vPTLWHUWb7ZHJ4khwhfuGQDMXflxC5uZK+d1vpFfvxFcPO
	Ehw0hDiSYeZgaa/ZcGIktK2GHyOsdbUJkPVAEHKBl9VNOSIVcMBjrPGGsIKvu1FtZKFSDj8PD00
	aw//B05J2mXDY5A67hVBVSgOTO9tBxNzsurRBngWG7+45YTOoDsXGtQx6dcoT4YmXgWhFMmZzBv
	R7Q005iLq66xlNz5jVGf0dLLeCQRD/lpn9wG6E2N1j7lbJyYw0YFkNXqBEsBigq/QYGWebVcsNN
	RIm+BuW/gKiB0N7ckEK8VwRLKew/V3ONo+Gq3wFj64zkL2PSr8sVu0dUhtAE7D+o7YzhGbNswBg
	x/Rtoixvbm5dj+GU+3VlxJG+OZLEC1nBh627EjTFEk5EUzvszGY8B5qYmItQ0IZfsjIhxfb5JFN
	gPTUEQb/82Uj0r1NjFHHpwBC6U2xif1JTu3631aIe/yBmIi4l3JRIHskKVtfJUVAeIYcge95rLf
	56FI53TEc8YIOYC0nR6qkzcaFwl+i1AmDpa7s/hrD3vVvDkjw==
X-Received: by 2002:a05:620a:2acd:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-939138ffddemr1080911685a.21.1787968787726;
        Fri, 28 Aug 2026 18:59:47 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391701305dsm272582285a.4.2026.08.28.18.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 18:59:47 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	urezki@gmail.com,
	chenwandun@huawei.com
Subject: [PATCH 0/2] mm/mempolicy: stop copying state in the interleave paths
Date: Fri, 28 Aug 2026 21:59:41 -0400
Message-ID: <20260829015943.1258774-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interleave node selectors and bulk allocators take copies of
nodemasks and node weights (for weighted interleave) in the fault path.
Both of these copies can be entirely eliminated.

For node weights, use SRCU to pin the weights in place.  This eliminates
a copy and a kmalloc from the bulk allocator path.

For nodemasks, we can operate directly on pol->nodes as long as we bounds
check the walk.  A concurrent rebind can shrink the mask, or tear the read
of it so the mask appears empty.

 - The interleave node selectors fall back to numa_node_id() when that
   happens, which is what they already did when a copy came back empty.

 - The bulk allocator simply returns what it managed to allocate.

The node count and weight totals are read separately from the nodemask
walk that consumes them - creating a time-of-check / time-of-use race.
Just clamp the walk to a single pass (number of nodes), and clamp each
bulk allocation chunk to the space left in the request.

The cost is distribution accuracy during a rebind.  The copies never
corrected for that either - they only kept the code from dividing by
zero and overrunning the allocation request.

Gregory Price (2):
  mm/mempolicy: use SRCU for the weighted interleave state
  mm/mempolicy: stop copying the nodemask in the interleave paths

 mm/mempolicy.c | 156 ++++++++++++++++++++++++++-----------------------
 1 file changed, 83 insertions(+), 73 deletions(-)

-- 
2.55.0

