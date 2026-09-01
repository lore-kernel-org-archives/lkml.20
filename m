Received: from cu-gy11p00im-quki08153201.gy.silu.net (cu-gy11p00im-quki08153201.gy.silu.net [157.255.1.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE87433BB0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.255.1.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231200; cv=none; b=NzrjVKhrlp3wqHji73sdcPjSfOqkja6OSsT2Bd4EF2Lkgj5UMNG40B6CrZ3yQtxnfoSXlC/FV56HC8LO7mB0009TypHhnHbvCCxMu23+0FbYBdFT66gWnssjJQqj0jeXD6g6MU7vwEOoh/rHYaBFyb22fD6fAHiePaiVNFzRQnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231200; c=relaxed/simple;
	bh=4GE6JVhqY9Mi9EVJrXbBLNN2Ft4XwxcHDUb3me5JYkU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=UaYp/zrMrkOE6GUTH9m5mP2vHHuUhx0SoqJ3dAbvc5X5eWWRdMpiv14jWuoe+MFzXb+Pr5a10F7HtkhG5+esvcv199vIQUI1Z3nw4ijuEEccosFXjrYp8caQOZJtKcNLHWeJ3Wdk3wCkEI+24NAa2Y3xqj9jUrR243JH/zPVRVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=doRGPeHy; arc=none smtp.client-ip=157.255.1.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="doRGPeHy"
Received: from smtpclient.apple (gy11p00im-asmtpcmvip.gy.silu.net [112.19.199.76])
	by gy11p00im-quki08153201.gy.silu.net (Postfix) with ESMTPSA id 12D6224600BA;
	Tue,  1 Sep 2026 02:53:04 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1788231194; x=1790823194; bh=XFwxo/zpRCxcKDRAJKdqav95yzRNXnhbhRJMR4pdLRs=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=doRGPeHyHd5Mavyus4jCNI4CteNrE4ZITQ3azdCrfNm+a6KNO4hp8hzxLxtfUyMy+z1EnfUq7sf8NFWJOz0iM/tO6al3V0FuTAsTXW7gpRhwTfwhDM4kzFz+QL/m4BAKG/7kVtjy3RnwYKeQNDEWI2TXeop0KbM3DKczLytzGHJxOTlg7tTWM6vWfqro36i8eNL/wtx9ApMbnANVO+Qj1CZkuwkX/Apgu2QzDrdbt76nj6gZPQjtw/fsLoncYzQLAgRwGV8WrXEzzycpBlyqJOZzldirYPS3qnb3dgMXF9HUl3ZydEbjSBYHheKlmm2vWsbaS5dXf9Wl7KY2CVEqyw==
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] mm/memcg: clear folio memcg after changing per memcg
 stats
From: Bingfang Guo <bfguo@icloud.com>
In-Reply-To: <20260831191126.6ced4642c6cc92ca96cf0803@linux-foundation.org>
Date: Tue, 1 Sep 2026 10:52:53 +0800
Cc: BINGFANG GUO <bingfangguo@tencent.com>,
 Bingfang Guo via B4 Relay <devnull+bingfangguo.tencent.com@kernel.org>,
 Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>,
 Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <baoquan.he@linux.dev>,
 Barry Song <baohua@kernel.org>,
 Youngjun Park <youngjun.park@lge.com>,
 Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E5090506-F629-4DC7-8FC7-B8C3740101A7@icloud.com>
References: <20260831-memcg-swapcache-stats-fix-v1-1-1c0819ebdb86@tencent.com>
 <20260831191126.6ced4642c6cc92ca96cf0803@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAxOSBTYWx0ZWRfXwvpMRXlq0hub
 JIy06fNU+BfbGYYy/cKxg0ODgxlz5fRk1Uifx5Mn7coscvjIcH2dS1PZXDTqi5yIEeMDi0Cc3bU
 TKgW4Kjn4EomIwCCwSfqeuAf9AvYMYpQA7O4abRuKV4rHzQJUf6UuvtimQXw3MRhc2hugs7yqJ+
 iJtf/YY6BNP0D8AhRswvsWtEqS1c3kWGcMrtrFtlSfd6ABWGNliBP5H7xqtTLXF3d/Yda9Ws9IO
 jsx2216iw1g+ilu046ZzF09GcvYN2vxEoQCFqv1PTWn/XurIY3YO/tg1qwc1oe8x7+3eaI6z9K2
 b7Lk+DLAK8yZXfuceuy+zaLHs9gnygmuGiAru7Urw==
X-Proofpoint-GUID: GXCh5jh2wpVKJlXbedFkIuR4sOiF6NYG
X-Proofpoint-ORIG-GUID: GXCh5jh2wpVKJlXbedFkIuR4sOiF6NYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=-2147483648 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2609010019

Hi, Andrew.

> On Sep 1, 2026, at 10:11, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> On Mon, 31 Aug 2026 11:32:43 +0800 Bingfang Guo via B4 Relay =
<devnull+bingfangguo.tencent.com@kernel.org> wrote:
>=20
>> From: Bingfang Guo <bingfangguo@tencent.com>
>>=20
>> __memcg1_swapout() transfers the memsw charge of a folio to its swap
>> entry and clears folio->memcg_data as part of that.  In the vmscan
>> swapout path it runs before __swap_cache_del_folio(), which then
>> decrements the swapcache stats through lruvec_stat_mod_folio().  =
Since
>> folio->memcg_data has already been cleared, folio_memcg() returns =
NULL
>> and the NR_SWAPCACHE decrement only updates the node-level counter
>> instead of the memcg's lruvec, leaking the per-memcg swapcache count.
>>=20
>> Move the __memcg1_swapout() call into __swap_cache_del_folio(), after
>> the NR_FILE_PAGES and NR_SWAPCACHE updates but before
>> __swap_cache_do_del_folio() removes the folio from the swap cache.  =
This
>> keeps the stats attributed to the folio's memcg while still recording
>> the swap cgroup with a valid folio->swap.  Add a swapout parameter so
>> the plain swap_cache_del_folio() path is left unchanged.
>=20
> As always, the most important thing to tell us when fixing a bug is
> "what are the userspace-visible runtime effects of this bug".  Please
> update your prompts to always tell us this, in the first paragraph.

Yes, of course. I will note that in the future.

> Clearly the immediate effect is messed up is messed up stats
> (memory.stat?).  But what are the subsequent runtime effects of this?

Although I don=E2=80=99t really know any user space program relying on =
this
value, I noticed this when testing another patch set by swapping pages
in and out and saw extremely high swapcached count in the per memcg
level memory.stat. It seems that the counter never gets decreased so the
value is rather useless and confusing to users trying to analyze =
problems
and read this. So I think fixing this can be helpful.

I will include this message in the patch later to make it clear.

>=20
>> Fixes: b197d41462c20 ("mm/memcg, swap: store cgroup id in cluster =
table directly")
>=20
> Quite recent.
>=20
>> The problem is reproducible using the following script and program:
>=20
> OK, thanks.  I agree with putting this info below the "---".  It's
> probably too detailed for the changelog - curious people can find it =
by
> following the Link:
>=20
> Anyway.  Sashiko points out that a CONFIG_SWAP=3Dn stub wasn't updated
> (this happens often):
>=20
> =
https://sashiko.dev/#/patchset/20260831-memcg-swapcache-stats-fix-v1-1-1c0=
819ebdb86@tencent.com

Sure. I will fix this in the next version.

>=20
> so I'll take no action at this time.  Please do update the changelog =
to
> include the runtime impact and I'd like reviewers to suggest whether =
we
> should backport.

Thanks for your reviewing and suggestions!


Regards,
Bingfang


