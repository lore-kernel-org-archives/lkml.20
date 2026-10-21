Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792557603;
	b=ca5L00D47pegcXYiYKIoXvSha5WC8Eq3HcBBDF5Tm8KWTZ9uRIC4eS7HpbGRCNlpR8+4
	 SHpFITXxnvFMio152r2bp7DxuHg+znkTJbzmqhPrjyfXJz6UYOEb3adys6sIFKmIL8lFH
	 7VxxLyuT4FAngSlJv8DDEEGuBhNJnWHAeNUPutzGPvv/C6eKoHkBZvBQVDL5u2IXvLce7
	 Ku65YFBG5t7S/49n0KAsaGsaOtrVQa/u6sc+zl4A1GrQ4cCsl/1avoJxLADowFOlYjrQ/
	 DVWts5WtHDU7vHu8mgCCQijCA1Xh3Mw2JjmB4C/br76Vly4kpSi2NGaJr03uRIFp3ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792557603;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ICN4qWOEmtPabgUyqMtpHLixpwuhgee+VseSm1muU2s=;
	b=4wLZeRZSjm/CZYjLzAvKiN0QmABXxetedHy1EqyQGLs29Fgsvbvr6lwmVJKoIsQQzgzi
	 aTEkV4F6AgJ6XRRYx4G8CKyosSIZzthV4AOP4Q9wNe1z4YgWg3TNCsONjz1KAumnB6rMq
	 eEzQTVxzd8Vlhn9L32K9CMAQt2hK/xktH2jd+nysMEFLLCxIdwr+kSeGuSCDQfYbi74Qd
	 lIO4U7D8P3hPmVk9ATeslcM1Ebi33cf1+gciCWFxtzEtDXZNywrjd775ntMamisiHIFzu
	 p+FhEOp55gxbIzOIvco804LRVR/NENW04NRua0nHZ+M54nmOiX88EZ7m+EeIar62Hqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=lcR264ll;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEEA606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDEEA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=lcR264ll
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID; bh=ICN4qWOEmtPabgU
	yqMtpHLixpwuhgee+VseSm1muU2s=; b=lcR264llTw7LFlWS9KVforp6EgeFyhW
	ZQ6XGBQhOoYqexwAwyEhm2lcaSITQWQA5UA72NxVKqL4N6tuSQQnr+59MqVRSfH5
	yy8x8xwjVPKOXKlvMi1PPCO9lnr/6p/0CS2ccYCOpDp4LHjsoIOMlbECtcJvqUpB
	XE5NEVl+rC8Y=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3F3zCQdhqvvmABQ--.7810S2;
	Wed, 21 Oct 2026 12:38:27 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/topology: Balance cluster static-key updates
Date: Wed, 21 Oct 2026 13:38:20 +0900
Message-ID: <20261021133820.1140331-1-sh_def@163.com>
In-Reply-To: <62a7530f-ffe7-490e-8d0a-3bed170e24d3@amd.com>
References: <20261021034314.864713-1-sh_def@163.com>
	<62a7530f-ffe7-490e-8d0a-3bed170e24d3@amd.com>
X-CM-TRANSID:_____wD3F3zCQdhqvvmABQ--.7810S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUjcTQUUUUU
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6gNRsGrYQcNwWwAA3T
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

> nit.
>
> This should be done only when sched_cluster_active is enabled to
> avoid the extra loop on systems that don't have any cluster domain.

Agreed. v2 guards the SD_CLUSTER scan with
static_branch_unlikely(&sched_cluster_active), so systems without cluster
domains skip the loop entirely.

Thanks for the review!

Hui

