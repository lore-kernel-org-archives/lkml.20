Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407721;
	b=lW4ltHItjb5jnhRpRhmr6IRS561Y59mFFCHioyFo7z+WpbKYczcokBrtFsz9ZZOcLwwP
	 oHhFslUSwnMA5O+eBq855+EPwLx0uJfPMEUDkmZlbwGi8e9C/D0y0N9VtFWqBJ5wJcE3M
	 PeRlqusuk4u7cihbmudji1HAxGI/PPt3LAeTuCyUN2RJrXFZ44ma42JJWXfsKyPrtBjuj
	 qUgn13A96vYBUfN+Gm72KE5Xp07cz4Prxb/MdUb7o2j0r/WLIVAPvaS9EPzP/JSOTVXhT
	 9BbIBRqWtrQoJinNkr+OumnqfZ6sws/dX9oZTQ2QB7s3h2lHIr/MlB+l6RUsJVvENBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407721;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=HU/ADiEQ4yElXdERdWH8C62mg8dV+VZgpatRQy1+Ol0=;
	b=YfdHASm3X6u2IXC2cas1cDYRS2Z46M+6CKJEqk158kOZO04MJqbCflRETaenSmbfHNmL
	 tJXOtM0k5bQFeGlcWjCf4lHIg2nZ+bMvT+Q4/N7iTn5CSO14f2gLgwo+alWu61cQ9+g7f
	 NKlrtPP04M8OXzfHKviEm7NGgKmkxGl+RcRiMGwBzAMHxtyn8r9cDVOYC6dMZqgZ3i82G
	 nSwyEgxL64wyF/tLPS1wyuzOPvRaGrPAwKuWyMnhZLvIGj7dkrEcCOhsCRrE9ymiTfKuG
	 SnulymnO5faqtYaBKdySgosG9DCyuPaiZkhvCcW0E1gk8dfIaejtuR15dn2t80CAPdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cyqyhyGl;
	arc=none smtp.remote-ip=91.218.175.177
Received: from mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68168606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68168606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cyqyhyGl
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FL3rfgpnw9CP8lcTq4Q038BNConm9rfhH/vECDAX41Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793407718; v=1; x=1794012518;
 b=cyqyhyGlFMgmCD/YaWRr8xXEVNHxuVgYODv04hI98i88AwsTpkvxphUlhrBCbj53L71/NPsa
 wgwuTjOfT8zJW+6ozKaYGiI70xyjDpufl+HoJtKo1i6lsAfJUkx+Coh7I+E5odRCpNgivaahyyL
 /mO0xmm94u82XLPcNGSeUH5I=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 8d4b375cdaecd94c;
	Sat, 31 Oct 2026 00:48:38 +0000
X-Mizu-Trace-ID: 8d4b375cdaecd94c
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
Subject: Re: [PATCH v2 4/5] memcg: use high_work for remote charges
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261030205418.341214-5-shakeel.butt@linux.dev>
Date: Sat, 31 Oct 2026 08:48:21 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Tejun Heo <tj@kernel.org>,
 Harry Yoo <harry@kernel.org>,
 Meta kernel team <kernel-team@meta.com>,
 cgroups@vger.kernel.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>
Content-Transfer-Encoding: 7bit
Message-Id: <C6F1CC60-B4EC-4C83-BF03-61577CF4A0F4@linux.dev>
References: <20261030205418.341214-1-shakeel.butt@linux.dev>
 <20261030205418.341214-5-shakeel.butt@linux.dev>
To: Shakeel Butt <shakeel.butt@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 31, 2026, at 04:54, Shakeel Butt <shakeel.butt@linux.dev> wrote:
> 
> Some charges go to a cgroup outside the current mm's cgroup and its
> ancestors. The high handler uses current->mm, so it cannot handle these
> overages. Filesystem notifications and remote page faults can take
> this path.
> 
> Use mm_match_cgroup() before checking the high limits. If it does not
> match, use high_work instead of recording task overage or doing
> synchronous reclaim and throttling. Charges to the current mm's cgroup
> or one of its ancestors keep their current handling. Tasks without an
> mm also use the worker.
> 
> Like kernel threads, remote chargers skip memory.swap.high throttling
> and its high-event reporting, and a fast allocator can outrun the worker.
> The memory.max and memory.swap.max checks stay the same.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> Acked-by: Michal Hocko <mhocko@suse.com>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

