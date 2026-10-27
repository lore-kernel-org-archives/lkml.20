Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107024;
	b=SYeolS6MgPo2YcOtywp1rEtw48PWNAdPLi/xiFTmQHmkzzYY4cYwzMm8VrW65NzX3HrZ
	 yYBzAW6YKg8CjyVQ8OFreCNuyMgWtIO1mJ1+pgt+Txs3QrIeDc6IuWhieYnMoR6WWdLVv
	 VEOJx4tktGKU/GmR27zpU/OcZWmIZk9bLPEnq2G/xTAc0h530bO5gRszNjhZUrXJ3Mx+M
	 GGFcUp/7Z8h2WpCMBexIakg9Z6CrUVajbCJmOH8s8XeUwQavNmfcx4htYnrWqc8gsJIQP
	 M51v8GDBqyoxbFq1/w78t5RxGylxX7P0Cq7D1swvq/ZEUjDDjiTLFyfTmSeaxq5N0qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107024;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=EpBt8CQ3npaNOOqrYPrj/fast8Ozf2jDF5Bzncmp5BU=;
	b=f92GfZcENdGz6LN2onSUrRyK68O++/NOwMEjFPiQjDdtlOH1mBrD+5MNrDaUe9Hy9lq5
	 9PvXGRuegSeLm+CITuIctliK5mNphxGfeiMEhFeZW63XXPVZE8s6dJ51ikNaF38KBp6vu
	 voy49Z639BwHviW69+Ik3rIQ4kutv/b08ZK55KB3+Bodw02K5amoIVOBv+ZTEmj6IYsA1
	 Uj5K2ive3cvvTaPim9TtYvhqgwvUTyLGsWFxjTEFWAJUhTwaLD1+U+WOfEFTb42Z0WIKp
	 MqWER0oVU+lB8MdsHqIVqv2lthobsOcfit8hQf5pA0bFYy1ztbuREEbqPURxOd7nW6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kF3p+lyH;
	arc=none smtp.remote-ip=91.218.175.227
Received: from mta0.migadu.com (out-227.mta0.migadu.com [91.218.175.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B23D606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B23D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kF3p+lyH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EpBt8CQ3npaNOOqrYPrj/fast8Ozf2jDF5Bzncmp5BU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793107021; v=1; x=1793711821;
 b=kF3p+lyH7Xv8GL4EeSsKMr8iP9F8HUhvpSCBZoG7WRrYdAk/KCQpl/DSdeEG3tOOu5QNf2Dg
 5mlfjDRbPe3Khj3l3Nyce/jRhB8pcSTGaA2rimxWZBne4stDM8Wj6S8Um3cum9SU0CDpoUcn4+A
 Fs//ki1BzmnEScCTcWX3ZhnE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 7fa098b483a16b6b;
	Tue, 27 Oct 2026 13:17:01 +0000
X-Mizu-Trace-ID: 7fa098b483a16b6b
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 05/14] hugetlbfs: enforce F_SEAL_EXEC in setattr
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261027-fixes_shmem-v2-5-86a00952acb9@kernel.org>
Date: Tue, 27 Oct 2026 21:16:28 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Gregory Price <gourry@gourry.net>,
 Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Vladimir Davydov <vdavydov.dev@gmail.com>,
 Michal Hocko <mhocko@suse.com>,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Lukas Czerner <lczerner@redhat.com>,
 Carlos Maiolino <cmaiolino@redhat.com>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 Daniel Verkamp <dverkamp@chromium.org>,
 Jeff Xu <jeffxu@google.com>,
 Oscar Salvador <osalvador@suse.de>,
 David Stevens <stevensd@chromium.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 William Kucharski <william.kucharski@oracle.com>,
 Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>,
 Nhat Pham <nphamcs@gmail.com>,
 Miaohe Lin <linmiaohe@huawei.com>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
 stable@vger.kernel.org,
 Pedro Falcato <pfalcato@suse.de>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CD47E54C-571F-4D1C-9529-20A2D177E2A2@linux.dev>
References: <20261027-fixes_shmem-v2-0-86a00952acb9@kernel.org>
 <20261027-fixes_shmem-v2-5-86a00952acb9@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 27, 2026, at 21:03, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
>=20
> F_SEAL_EXEC is enforced by shmem_setattr(), but hugetlbfs_setattr() =
does
> not check it. As a result, fchmod() can change the execute bits of a
> sealed hugetlbfs memfd.
>=20
> Use memfd_check_seals_mode() in hugetlbfs_setattr() to reject changes
> to execute bits when F_SEAL_EXEC is set.
>=20
> This also fixes the memfd_test hugetlbfs SEAL-EXEC subtest, where
> fchmod() incorrectly succeeded after applying F_SEAL_EXEC.
>=20
> Fixes: 6fd7353829ca ("mm/memfd: add F_SEAL_EXEC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
> Link: =
https://patch.msgid.link/20260629180247.2343229-1-eva.kurchatova@virtuozzo=
.com
> Acked-by: Pedro Falcato <pfalcato@suse.de>
> Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Tested-by: Gregory Price (Meta) <gourry@gourry.net>
> [ david: use common helper; fixup Fixes:; check only regular files ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.

