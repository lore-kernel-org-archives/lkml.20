Received: from mta0.migadu.com (out-141.mta0.migadu.com [91.218.175.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A0341C6A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899330; cv=none; b=E6gFKMrZDODkzJqf7bH28DunazDiKRIGOZgrSytkDHf9sS5CiCOs884tBLHfO1HMfEIDny6M+nxS6dKA56rw+xTCXbTz7moV5NzqENegvmhwYiIiO9nI0N/AMSebYbnxPEgrdaJO2j5Rjidfkp2dQKhGur7UMvswsmgUP3tK+SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899330; c=relaxed/simple;
	bh=SXRmLWTxklsm1zcLkmzlYzJZu9xlAGNyhvOD0WxKqaI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=C2ypxf6TNVdcKBcsu/5xDl80jfFfG9uXENpAAU435gStO7K+8Cy85maf828QfcREjGTsYWq2JkF9Yzg0oufQDZQyDtGHH3MdRMwrMCebirHdWb0CWXnfLG79U8tJYywl3r9AaqCGg8mUmQ7GHHgM/3wBusjDB2f4ISyYAhWdVs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JLc7M1BJ; arc=none smtp.client-ip=91.218.175.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JLc7M1BJ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SXRmLWTxklsm1zcLkmzlYzJZu9xlAGNyhvOD0WxKqaI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787899325; v=1; x=1788504125;
 b=JLc7M1BJjBBxbWiRMu24+tnS6++XVj1JJVdzhO1VKPJyNQ8SNPfipZoKA6yAngPteCtdpRFo
 sQ9Ijf/MwunWIkFEK0yB7XvnSNDo8dOcnamoba8dFVHtEApWNMK1SbYwHAUFdAKunddx8Kq34EG
 2n4z6UgK5lfuL2dsfvkELqAE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id da3454e6c9281e75;
	Fri, 28 Aug 2026 06:42:05 +0000
X-Mizu-Trace-ID: da3454e6c9281e75
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v2 1/2] mm/hugetlb: do not dissolve gigantic pages without
 runtime support
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260823044118.1097121-2-xialonglong2025@163.com>
Date: Fri, 28 Aug 2026 14:41:51 +0800
Cc: osalvador@suse.de,
 akpm@linux-foundation.org,
 david@kernel.org,
 mike.kravetz@oracle.com,
 mhocko@suse.com,
 linmiaohe@huawei.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 xialonglong@kylinos.cn
Content-Transfer-Encoding: quoted-printable
Message-Id: <E654A716-5F59-4B7B-B402-17B1A776D541@linux.dev>
References: <20260823044118.1097121-1-xialonglong2025@163.com>
 <20260823044118.1097121-2-xialonglong2025@163.com>
To: Longlong Xia <xialonglong2025@163.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)



> On Aug 23, 2026, at 12:40, Longlong Xia <xialonglong2025@163.com> =
wrote:
>=20
> From: Longlong Xia <xialonglong@kylinos.cn>
>=20
> dissolve_free_hugetlb_folio() doesn't check
> hstate_is_gigantic_no_runtime(h) though remove_hugetlb_folio()/
> update_and_free_hugetlb_folio() silently bail for such folios, so it
> frees a still-listed folio and, on vmemmap restore failure, the
> add_hugetlb_folio() rollback corrupts the free list.
>=20
> Fixes: 6eb4e88a6d27 ("hugetlb: create remove_hugetlb_page() to =
separate functionality")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

Again.

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

