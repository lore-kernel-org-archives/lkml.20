Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966880;
	b=w/+IlBd8CxzVZxb4G6JmylCiX1PT8qBTmIu1ik+oTcdL5l0Uj1THC/p/39/SLCfX+8Dk
	 hhCKRTF8E1KodSKDcJZdjLSyosi1htZxHdkbtjvt6wVsHyUbvkZFtLHdZln/OKz7XNAdC
	 c51r4udO07WjK8ZTUJ2NDmIKWm0jUGgNVKiAg6vIYWfRcWYXatsVAMq8A30pvdagFTiYY
	 fD5bvXDuZTN/wazJZzMH1jiaKYhOw9wvOYDX1fgKVlxI3ROLaYbz66ZERcGZBzR/RHYp6
	 /Cu84BN7c/+xE0BKKIZKqEKII86Fl5Msjs5/BcgZ4wpZ74oXKa8vOqfvyDRNAylpJgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966880;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/46L68pR/Enc7fYZWiScuGH0LLWYaias1sdt7wy84ms=;
	b=s120iOnqVmoKGNM3yqgE/3M9azCXSVLu5lBq8azmk1OpLefVyii4K9DNsIVdHlHwuJ/b
	 HsiMJBjnBYUydUOfGcFekE1MbXhGp7GXH8bdwLHqVi9AGP0c3Xy0UNQjXyTANFE0KQzY8
	 K8PvGtIsqMzb5NhNdii38C2W3HEDri6k1jIRHTHw8g4TbUjeaB2HUPvXVQjShaE37IdKc
	 vQ3N8isNRjSMqIrHVLrehs/HKu/pd0cXO3OIDMjhYpyi16RUvrh1BgGz8nH6Gd1gXx0x0
	 9gzpDRL1pYFeSXKuecbU9Sg09hnLACDv0Qi3Tf1J7qldCct0haNlBuhik8u2Fqwcmkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlejMS7C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF357606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlejMS7C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745691F0089F;
	Fri,  6 Nov 2026 12:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793966879;
	bh=/46L68pR/Enc7fYZWiScuGH0LLWYaias1sdt7wy84ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mlejMS7CjxEq6jLLSwGu7+ysqSsfyEJ4AJdWyZJ9nSJU4SnRD6iThs3XrN2kJ7IPb
	 oDp25jS3hyilaFDlrWAVkjiV0qaFN0V+Umpx2iKYALD+k4OUd4b0GW9SgaiN1zuulK
	 lEq8ySrhvWAIHlzWeo7Ls9+4B8AZly6D2Zp7WsDxcNutGMRCypKoPPNdQTjtiaY8jE
	 Q4m6eXuOXyFETQwcsSAonYMybHSWF74xujXfx0fa07vNxuHTMIWYjeov1/igY2aOr1
	 azCsgQ8deblzykTCs5kLWGlo/r8FTSvvZ2xiYOx3cTjBZg+HkeRpdMJm+4BJHI3Ts+
	 HbXCANfb5C7Ag==
Date: Fri, 6 Nov 2026 12:07:53 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
Message-ID: <au3CUJO9zBMHLx-B@gremlin>
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>

On reflection, I think this would be better implemented as something like:

static void collapse_scan_mm_slot(unsigned int progress_max, ...)
{
	unsigned int long lock_start = jiffies;
	...
  	for_each_vma(vmi, vma) {
		...
                if (time_after(jiffies, lock_start) && mmap_lock_is_contended(mm)) {
                        mmap_read_unlock(mm);
                        cond_resched();
                        mmap_read_lock(mm);
                        lock_start = jiffies;
                        vma_iter_set(&vmi, mm_slot->address);
                        continue;
                }
	}
}

Which avoids magic numbers, and means if we hold the lock for 1-10ms (depending
on HZ), which is a long time in the kernel to hold a lock, AND the lock is
contended, we drop/reacquire.

--
Cheers, Lorenzo
