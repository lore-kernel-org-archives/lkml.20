Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508908;
	b=Wkr6cIt2YGjzMzU+WkC19zNxPFsXJkZA7bTL9Bj5ZgmxUTnF6jSwgNHHT7rQTCPpCwCy
	 1ke3Ise6nucRe/CSwqvOx7El55YsN7uRZFNKD6HR3uli6oTnwI9uOChCQXGf//+Nd93q4
	 +rnVEOA42Umje3GJan/HaoAgT7TMvbzYweYx3a44Ct8mfwc2BqVG32VPsRkgSC4juz8vl
	 KHTnZXJi4/DuLQZDAInTlZg+lpb24kINToidqtnXyt3HoxwPiHsBfkUvR0Et8WgdzRvyG
	 R5emA9bt4evriQS+fg9FqTV62x7haRqPmxlvpz3yJyObFMk39KRv/ynTrrWNX/49I5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508908;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1QzWFAE1IPwEz2dgVhhUMkCA7HWigmnlL5Fr0yTatxQ=;
	b=GxH87QHa4S8wuGvDPf7ibhWe0xX3kZD1ATIhJy4HfP2/8LrTrDYxp/AOG2WPDP0NnmWS
	 3tZgJT6x+VcmqLCz+VbZPDaqVSX5YtohH9TwdXkcXsIf6BGdvLqGcR1LteeSw1hIMXAtV
	 t3OuRKPfnaxFQ5HuQb3+vfpIK2QCStaZHwe0w5BxahfDsuyqXyBbh7TpXif4XgPqF3kKC
	 i/ZwavQc902g9IOevQJtqQBBRRuqWpTBTJuRM8p8gZK+x4gMEIwtFcWU5GGFiwmi/eelb
	 Gt57OYfajnNwhXjKz0NJOxyeiRF/TE8kSYhNUctO/CBMHmvinB4x9PCPzzY5wI9l5hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=X6Dp+wdA;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=JHNBp6zh;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5C3606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F5C3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=X6Dp+wdA;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=JHNBp6zh
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792508906; bh=1QzWFAE1IPwEz2dgVhhUMkC
	A7HWigmnlL5Fr0yTatxQ=; b=X6Dp+wdAvTuYT0FnBaVKXUbZRvBYTfCqW0D2akpJ6mZE9aghfT
	6haDJWxnSXQttwDoOdHWZDtua09PUEGQhRfRS3w2KbnttICtez9kFD51ClWkDWhNgkXE46bQeI2
	pa6qrL9yXtmkgJNU/FNmVEN68l/J3Mx9RTIC/5vmxqLoXQ4n4s6Hlg9zO2Tc/bQZHQx7Rp+S+Sp
	smkrYs0MjCAW/p9H3+cOaCJ7NEAoGtJ7JGsz5K8CCEO6YeJK1L29baVYcdslgdlDCFK3ldH2/Jk
	zrowkZCrCHkc7gy5za0jRTgUBxw82HJa/acOzphjH5N6SIP5QYxpMPQS/fECiqN4NpA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792508906; bh=1QzWFAE1IPwEz2dgVhhUMkC
	A7HWigmnlL5Fr0yTatxQ=; b=JHNBp6zhhyILyICZp9pAb1RIzeUi2YUzb9OgwxGUKkOFJ9mF1B
	a0criHuy8v60VY+/5zkxhYmjzH4Ngp2o+NBw==;
Date: Tue, 20 Oct 2026 16:08:26 +0100
From: Bradley Morgan <brads@mainlining.org>
To: thnkslprpt@gmail.com
CC: frederic@kernel.org, linux-kernel@vger.kernel.org, longman@redhat.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_kthread=3A_fall_back_when_n?=
 =?US-ASCII?Q?o_preferred_housekeeping_CPU_is_online?=
In-Reply-To: <20261020125518.1114230-1-thnkslprpt@gmail.com>
Message-ID: <66925C75-D453-4733-BF77-B0EF71FCBE11@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 20 October 2026 13:55:18 BST, Avi Weiss <thnkslprpt@gmail.com> wrote:
>kthread_fetch_affinity() falls back to the housekeeping mask
>only when the intersection with the preferred mask is empty.
>
>If the intersection contains only offline CPUs,
>set_cpus_allowed_ptr() returns -EINVAL and the kthread keeps
>its previous affinity, which may still include an isolated CPU.
>
>Check whether the intersection contains an online CPU instead.
>Fall back to the full housekeeping mask when none are online.
>
>Fixes: e894f6339808 ("kthread: Honour kthreads preferred affinity after cpuset changes")
>Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
>---
>
>Tested on x86_64 Linux 7.3.0 with vng/qemu and a kthread with 
>preferred CPUs 1-2.
>
>With CPU 2 offline and CPU 1 isolated, the unpatched kernel kept
>affinity 1-2 and set_cpus_allowed_ptr() returned -EINVAL. With the
>fix, affinity changed to 0,2. Bringing CPU 2 online restored 
>affinity to 2, and removing isolation restored 1-2.
>
> kernel/kthread.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/kernel/kthread.c b/kernel/kthread.c
>index cc8cb5d3eab7..fdb8fb07f40b 100644
>--- a/kernel/kthread.c
>+++ b/kernel/kthread.c
>@@ -343,7 +343,7 @@ static void kthread_fetch_affinity(struct kthread *kthread, struct cpumask *cpum
> 	}
> 
> 	cpumask_and(cpumask, pref, housekeeping_cpumask(HK_TYPE_DOMAIN));
>-	if (cpumask_empty(cpumask))
>+	if (!cpumask_intersects(cpumask, cpu_online_mask))

Nice catch! 

Reviewed-by: Bradley Morgan <brads@mainlining.org>


> 		cpumask_copy(cpumask, housekeeping_cpumask(HK_TYPE_DOMAIN));
> }
> 
>
>base-commit: f47d223627f80cb7a1eb14c585fe6cb35de5e984
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
