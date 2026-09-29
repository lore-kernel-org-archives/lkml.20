Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA0E3A759C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653309; cv=none; b=PI+FrK8yVrTN/tqVfV3HXPgdNccthCrjdgFVHznavvySNvwCzwDVv3Kww9fxyKcwAS7SgGoQQw2WcHs7Md2DYWoGsiuF/wwHzaeVp2PtsoB6fQ2hLdhMUjMm+KmjklsbUHdqpoi/iaHqWxL/b/LxHvRX3EcrotpygPLYWd3M45Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653309; c=relaxed/simple;
	bh=gtsSE6m47z0ypcEcy45XylQifxzirP2si6vj/1T9Y4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MeBvw30eoGHPKxUMXWHmL3ONlEefU2Ty3wE5Avj1ZBiVC7PqULznsaBL+Ak+tOqI06Zq4BR27vsqKAKEGgMTy8u5B/IVcpAEqTSUkBPSJ43HhzcTCtplLExJwUUz6zUVJqSuEVeVIl/lEpFHSaU9gf9DZoN0AaARynQv39LXgM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ZRNq1oPR; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ZRNq1oPR"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790653299; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=T8A8WLBQwsgMXTvSGKLNLqfx2C8YkEg5dty3zK3RESs=;
	b=ZRNq1oPREzWHTPby5nHXAF6BvBSynzXTwFLExlq41bOF2M0Zmir0g2hbEdXBoZtysNNaEGN/ZmrLkDEwRaNsJop8yf3O59UqEadSwDUSMwFzroPleQQUo7KW0mQi/9Md/yhHzdYRYycaVCVPylAKCB/aw8FLlzTGjB2GjZAXQVo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XBrlRM3_1790653283;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XBrlRM3_1790653283 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 29 Sep 2026 11:41:37 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: david@kernel.org,
	akpm@linux-foundation.org
Cc: xiangzao@linux.alibaba.com,
	vbabka@kernel.org,
	linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	ziy@nvidia.com,
	ying.huang@linux.alibaba.com,
	wangkefeng.wang@huawei.com,
	tujinjiang@huawei.com,
	mgorman@techsingularity.net,
	kaitao.cheng@linux.dev,
	chengkaitao@kylinos.cn,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/compaction: skip folios containing hwpoisoned pages
Date: Tue, 29 Sep 2026 11:41:23 +0800
Message-ID: <20260929034123.2705745-1-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <99cbd960-439d-4672-aba9-6b49697db8b3@kernel.org>
References: <20260928105805.1215770-1-xiangzao@linux.alibaba.com> <20260928105805.1215770-2-xiangzao@linux.alibaba.com> <99cbd960-439d-4672-aba9-6b49697db8b3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/28/26 20:12, David Hildenbrand wrote:
> On 9/28/26 12:58, Yuanhe Shu wrote:
>> folio_mc_copy() does not close this hole: it only detects corruption
>> at copy time and only where ARCH_HAS_COPY_MC is implemented (x86_64
>> and PPC64; elsewhere copy_mc_highpage() degrades to a plain copy).
>
> Then they should implement it.

Agreed, and nothing here replaces copy_mc.  Two things the check adds
while that work is pending: on archs without copy_mc the plain copy
does not fail, it consumes the poison - the same poison consumption
commit 841a8bfcbad9 ("mm: prevent poison consumption when splitting
THP") refused to risk on the split path, at your suggestion; and the
refusal happens before the copy is attempted at all, while copy_mc
recovers only during the read.  The check and copy_mc compose.

>> Software-injected poison - what MADV_HWPOISON and the hwpoison-inject
>>  interface produce, and what tests and fuzzers exercise - never traps
>>  during the copy on any architecture.
>
> And these are debug interfaces, why do we care?

Because they are how this bug class gets found and reached in
practice: the reclaim-side check this series builds on (1b0449544c64)
exists because of a syzkaller report through these interfaces, and
carries Cc: stable - as does its large-folio follow-up (9f1e8cd0b7c4),
which you Acked.  You were also cc'd when Andrew raised the
urgency on the hugetlb sibling of this fix for the same reason -
"perhaps Bad Guys can find a way of triggering this, so the urgency
becomes higher".

The window itself is not debug-only either: a real UCE landing in it
behaves identically, and on a non-copy_mc arch that copy consumes real
poison instead of failing.

>> An isolation-time check avoids
>>  the migration entirely, on all architectures and for both real and
>>  simulated poison.
>
> It's racy. See the link below.

In isolation, yes - and dealing with that race is what patch 2 is
for, which is why this is a series.  The steady state (split failure
leaves the folio on the LRU with the flag already set) is not a race
at all, and that is what the isolation-time check catches
deterministically: 16/16 such folios migrated unpatched, 0/16 with
it.  For poison racing the batch, the load-bearing check is the one
patch 2 adds, immediately before the copy.  In patch 2's racing
workload, the entry check alone still propagated 693 of 9606 - that
datapoint is exactly why the second check is there.  A GUP-based
path takes its reference before the unmap, and memory_failure()
sets PG_hwpoison before releasing it, so a racing injection is
visible by copy time, unless the injecting thread is delayed
between taking the reference and setting the flag.  A real MCE can
likewise land in the final instructions before the copy; on x86_64
copy_mc catches that one at the read.

That thread is linked from patch 2's changelog precisely because the
concern you raised there is what the pre-copy check tries to answer.
The patch 1 sentence you quoted overstates the isolation check on
its own - I'll scope it to the already-flagged case in a v2.

> Was any of this written by an LLM?

The patches, the reproducer and the measurements are mine.  I used
an LLM mainly for the prose, to keep it accurate and unambiguous,
and also to look up related patches and past discussions on the
mailing lists.  I verified every technical claim against the code
and the test logs.  Fair point on the missing tag - v2 will carry
Assisted-by: LLM.

-- 
Yuanhe
