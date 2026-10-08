Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3BD22A4F1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791426476; cv=none; b=Y8mBVSSDmucrJNvf5MwD+s+dG2jrdvawZik7+DHE1WYThgmSSRS5H58mTRsHoJvp+BGnUcgd2uzPi+MFDBI56cNwN4zO9nULQ8NtOe0CpmTQhU85bGd4f1hTqXE+4BQB67xysbsRdHsg7yHblJaXTJThCUywGJe0fDg+F6tGi0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791426476; c=relaxed/simple;
	bh=MsGtLoYg/fHyK+zakXoLrA3ulP+FAQoPdel6fLVn2zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KeYF5sj9SjSlpTKp+UO0RZ8CrQUoiJd7IuGQXIC4JboORQDwuIsrtlBmb+tLNs+Lag1prg4mrqh3/KCxu+98pqc9InIZIk05BbcWYsFQGhx27Ssj+gThEa3VvKD8ItmDtXxhxU+8KpCbW/ubqOoVLYjBu++hk213YCSPQIlp+to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r16+URJJ; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r16+URJJ"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15354aa70e8so22245c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 19:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791426474; x=1792031274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XrXlWfL0sTc52Kvx+LtccQ+F2NsmCMYUwJ2EU4o8Vus=;
        b=r16+URJJuBiOka3pTeY1eh8A5oZCUfVQ8iG0oXDGBwfNbUvIJvquvtVSfRf9No6mF6
         Nm2krMOvubxezmPAyRfG+BNnIefksdimRSZ+i9nLVFszuUq+MJVPzIee//i4ih+17TP6
         HZ/GK7EQmBXGdosFbDq9MRKgHFjm2VuM2TZqkJJ/k13p7n/MhwvBw+3CbrpAoUrInegl
         BxzTiVni3Lm+BLGRsI9XkHNFjlKxG0bbrBhlmz0leE48qVohtHvpMJVlXV5sa7w/r4OJ
         aeFlB49vH87Cn90wUuQDBw4FntRWWtrQp5HqTO1fc94Sr1jxTx87dg/uNgNl79y5ZZNW
         GLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791426474; x=1792031274;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XrXlWfL0sTc52Kvx+LtccQ+F2NsmCMYUwJ2EU4o8Vus=;
        b=aWT03tfO11uItsYmt/7zpdu1wtVBGntYz5iHcXogbkoqTH4jkoMX4KYlScRxptJoWK
         fm23Mn5m8jyByAEaVdIyb2m6EIEOzOF1DshYW2NzLE9/wD3hYprlPfospUVLDTg6DLeg
         wfdFnGJ2PeGGe0xSUH5bD5D6yGHZjT69UseodyY8jb3oXfjGtQnlXWUEV0jNjA4V1sV6
         EoipBvJ2xOMhM2zNMxQSsR1YOk31c3e9n8CNZM01LpiGZmU9wgHc4D2Ak+VjiYLYmbp5
         39dO72EruiNsrFMFRontJcoBk8kfSysMjP2MNREbDl3bgC6P0hTarAo3+R69MF0qJIWD
         qiRg==
X-Forwarded-Encrypted: i=1; AKwUvBz8O+NbrHMgS5xzYyw6hYcUgdxmZfJEkPWl52hjt3upb23+dhG9KDU8ndJOFkfVOFTQGkMWDqsu3BdaR2c=@vger.kernel.org
X-Gm-Message-State: AFuF++kpmSmpJDKNp2U/fRuz27YsDWrlYxhhNEm4dw5Ryhwq+07KneeW
	mtnEMibmiy67FPKUSt8wiCBGo8SgCOfKZZLfNg1+HJ80dmpitJnZ8sd6
X-Gm-Gg: AYBFou1wgSNQTwj9Ph447fNtGNS4tR5QnaKwkS2RTvH1iMttnA6W+OA2a24oJdmGMR1
	i/4uflYtHyPAjYSyaAPOZNPQPYHSybLCC5OeRWiu82d2tg96gR7WpDdrBpfn8mOQ0sg8fbmGVPB
	IMUtJGTndlVCt7XvXyHaFotZ03gFcEQ149F4xTiCu0XUlEVv9EXHJrXNvP2qAqn68i/Jso8s10b
	NSyTDzOWpc7NGDnjxDfQvCLJfOVj5xKNuz/1YS0fmgJgLlJ3lshhS04nrF3fN2NjEcadiTKfYza
	qK2XJW4wps+B2wZMVc7N1o1prvdBpXOeUmG/hrmrfmb/bcV/tDWGgdYy8VR+II1PCDU9ZULe0gs
	+tSUxrxiWtHjRx4T9dmlOd292eVnp0ePGWCSTxxGasyspx4AfovAcC4jqM0uwC7tVdcqkmsWB51
	w25O9tMdSJQv7V2XpIzmwyuGoRqzWgksLxK3xsydeoUtTv0CxU4woK35Y3jDZgxOJZOxLhIYwv
X-Received: by 2002:a05:701b:271b:b0:143:2984:6518 with SMTP id a92af1059eb24-16209760e7emr4246517c88.39.1791426473966;
        Wed, 07 Oct 2026 19:27:53 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166121f74sm9367598c88.5.2026.10.07.19.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 19:27:53 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm/migrate: walk runs of consecutive pages in do_pages_stat_array()
Date: Thu,  8 Oct 2026 10:27:48 +0800
Message-ID: <20261008022748.3349345-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87v77ggu14.fsf@DESKTOP-5N7EMDA>
References: <20261002-bug-mm-move-pages-stat-batch-v2-0-f73b5d20519f@gmail.com> <20261002-bug-mm-move-pages-stat-batch-v2-1-f73b5d20519f@gmail.com> <87v77ggu14.fsf@DESKTOP-5N7EMDA>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ying, David,

On Mon, 05 Oct 2026 21:24:07 +0800, Huang, Ying wrote:
> As pointed out by David, nanosecond-level optimization for a not-so-hot
> path isn't very attractive.  I understand the target of your
> optimization is not the performance of a single page but that of a large
> number of pages (such as 16 GiB).  So, please describe more clearly why
> your change is necessary, for example, by providing the performance
> improvement of querying 16 GiB memory.

Right, the target is large buffers, which also answers David's question
about the need. Mooncake, the KV-cache store used for Kimi serving,
calls move_pages() with a NULL node list on every 4K page of the
buffers it registers for RDMA, to find which NUMA node each one lives
on. Its issue tracker reports 216 ms for a 4 GiB buffer, and it
registers hundreds of GiB per instance, so this query alone takes
seconds of every startup.

Time to query every page of a populated buffer, with the two v2
patches applied, median of 5 runs:

                       before      after      change
  1 GiB,  4K pages     27.3 ms     3.2 ms     -88%
  4 GiB,  4K pages     109.5 ms    13.0 ms    -88%
  16 GiB, 4K pages     486.1 ms    52.3 ms    -89%
  1 GiB,  THP          23.5 ms     0.5 ms     -98%
  4 GiB,  THP          95.0 ms     2.1 ms     -98%
  16 GiB, THP          381.0 ms    9.1 ms     -98%

> Additionally, the raw performance number depends on the system under
> test.  Please provide a little more information about your testing
> system, for example, the CPU architecture, generation, physical core
> count, etc.  For comparison, the performance improvement percentage
> would also be helpful.

The host is a 2-socket AMD EPYC 9654 (Zen 4, 96 cores per socket). The
test runs in a KVM guest on 7.3-rc5 with 16 vCPUs pinned to one host
NUMA node and 32 GiB of memory, split into two guest NUMA nodes. The
test program is bound to CPU 0, and the before and after kernels were
measured back to back in the same guest.

Thanks,
Qiliang
