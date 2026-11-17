Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911111;
	b=y04p+FrO7lRpwxTNh+PCAPDIYCANAv3iJnWPCUluQJBpQm2gbb+yhrYF1x/EBXc/6HM5
	 Ph4cbKR3w6lPZttvSdfyZ4Xf++TVTBPldsoqmCmskeEXyzspUvpIqwZjARKPooTHwADfO
	 WstgBTVIzGgkenelcK1zEPTSrGCgtwV4siSqJyaX0Qc2DVEmEQsC1j/DcFGmCIFsCjnIy
	 JnGzVp5a/GocGEU2BruTpkbiGkzyMyF8hnisXJev/fewxGaY/NB7lbsBWGF4VdaRDOIfY
	 6R0CFRxnTLriSsOey4UJWjvMbYCJh3NvsAWwR9awnECMeI3ANSjWPZUyFFHkAZzm93w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911111;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:X-JNJ;
	bh=6HU+57MgwQIYqvbSD+KkyYtggnx7khmZi4J6g6F0SBM=;
	b=Whx/ODTxRRPNLF+2LimjD2EvM3xrYsibWSr/WBUHqu4BRTdHygDCefuVA1olEaRXnu7L
	 NL1Oa+Lu1ljWVuEp2ViygugEk4lcU08lPykYH/rHO+FTto9JvcNWjrFVybwZ7RSQiVHwc
	 pmjJu0TwQpUKgiTZfTiFpNwXZbB4d7hzHaW4CIPr9oDNKguBFSfmw/dYGDjNvYBb4vPWe
	 bX5D9as0jYllYJQMwadVoRLkN8hNkGcoNpzboPq43j/ro+04EC6kBA/ppie7I/M1PYi63
	 kZ3+P82vM0ICvMZAMRhP/1VEY5RbENozQZiOmGvkHI+wY19aWyz9OoJh6uC6u/dhcjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=AM8wiTwT;
	arc=none smtp.remote-ip=57.103.79.28
Received: from outbound.st.icloud.com (st-2005g-snip4-5.eps.apple.com [57.103.79.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C32F606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C32F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=AM8wiTwT
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-1 (Postfix) with ESMTPS id 14D9B180018A;
	Tue, 17 Nov 2026 10:25:06 +0000 (UTC)
X-ICL-RepId: 01a1e909-f7b8-7aba-8bfe-4e3cb1e1c272
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1794911110; x=1826447110; bh=6HU+57MgwQIYqvbSD+KkyYtggnx7khmZi4J6g6F0SBM=; h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:x-icloud-hme; b=AM8wiTwT2kgzq0qGpg9lrsxjguZZtieuJZW7JvrFoooosWMv4SMUEhU5xjGghdWM4MozLnOh3NBSKO7eNTNMdkUB/86jiSRtNTXBKiPFUmCnOr75qw6W1GzYJH1BPGqS0ebRk2y5q+HTiJYyTwuUM+naZFcKe74d1jMAjFAwwl1tmPxOn4krPsZe6+OtVXT4aGdGngwlvvQAc24ILE9bkggUMGYL0OTq1TShVeq4Cq48MmY3zwjq5nS+slv3mAIIEYQJGchLvPFx27SLmV/QH9bBZvNAGiblohpO7VDZJVKHkKl95Nb1ktzuF0NpwB+I0rikbnV5NMqJ7ENeYpVinw==
Received: from [100.126.217.91] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-1 (Postfix) with ESMTPSA id E6CB41800185;
	Tue, 17 Nov 2026 10:24:59 +0000 (UTC)
From: Muhammad Haris Awan <m.harisawan@icloud.com>
To: David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Liam R. Howlett <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] fork: mark memcpy() in dup_mm() with data_race()
Date: Tue, 17 Nov 2026 15:24:51 +0500
Message-ID: <179491109101.4015489.11185824873441987133@icloud.com>
In-Reply-To: <0b565b9c-1462-4fed-8836-9a7d08e4b861@kernel.org>
References: <179489519663.1444496.15875846661591982934@icloud.com>
 <0b565b9c-1462-4fed-8836-9a7d08e4b861@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Proofpoint-GUID: dLUepeR5kMZHEWKIZIgDJCajbB36wGcv
X-Proofpoint-ORIG-GUID: dLUepeR5kMZHEWKIZIgDJCajbB36wGcv
X-Authority-Info-Out: v=2.4 cv=bISDs/+Z c=1 sm=1 tr=0 ts=6afc2b85
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=x7bEGLp0ZPQA:10 a=2kFROKt5_e8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EYaFdmsEC1CjpenOt5ir:22 a=5dLkQmbtQYkJk1E8iZFh:22 a=4JPYJV-aiw2Kicj_3zUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MSBTYWx0ZWRfX/OdPMQ5kwIgE
 TuhCSlT+3ixpEUjyETkQMRHdmLgESeXzX332IgJa5uXhSPjwbVYx4/bX2x2SxPTlZkugPkDIxAh
 hIhGvRHYOLGPCdQaAqeMYybHsPbgD45iwudm4vplbdNBlb1kPaWv6s2uSYTgeo/iT6UWBo5I9iC
 lpA4BjXL9eolAIqInQMZsqEs0KprTBlu3AI0/B5HvxG9UiWoKYsQ6mk6IdOK8zUEOLHNnX00w5p
 WXqSnBTxn9Tmim8LzaC/E8XjdwNslvb+5PotXqMDCg37xQVTMzs8Zbf1X4pQlvCZg86o7FUbThU
 wQ1DS984QvvkkDRl5JWNwb//BMAkoAqm3RPIJLXWz2jxNmSxBbgOa23nniH5L0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MSBTYWx0ZWRfXw6Md+FSiYDc3
 8ijTF810kZOWVKMShm9pjt+qHDCOJhFeyC1cAOA7djBjRi7lO3pRWVOwfHr1F7ZIE8KczXtu34c
 Xd02MetYgufJf/Je/tAPrExnQZxfi/I=
X-JNJ: AAAAAAABHYM+2uoVCH3FWr2d6COnBYmqzXEJ9EdGxFXkaqgX8h0Elg7IKTgfa9d7SkY+Eb
 Gs1vkcPuAsrxpNoTdivFvSLKa9KAsYjzkkP6XrNeworQKUBwXrI6d3frYKk5Oab197zGRb
 Y8AGDROudb5WqF6e6mzFIfvDAYy6JHvWgZVgw1itAPNh8oGmU2AxH+mnxNICT7e4Sb3hGW
 5aaojbQr5cNd2xrY5vRIwD0KKgZFQoV9ZOkhCAYQd1U5jG7txzW0Z2UrafE+HJ8Xoo47WI
 zh14Nz+gVqxTrNDddQ76x0hDN+4kbJrk+s/LIDjjTJA4PE09PgYo8DeRMBWtLy+sBNHIYM
 dalCl5nTxKlC/ctwlOqTiVTV8xGMyNmHXFB5AH4CR8TgJqoCY6mo/w0Cs9Z18JjZ+6k33K
 KL5Y7FF1umXQOc1NxNBE5MvaHHywx9OANDUK/D3+K/WjfP43/N0iW5uRJJEJqMsGrDR1su
 ge2BQuR51Ejcvhk71cFSzQ6j6MdhxKTX2WSKs6XX/orYdxHYuX2asYKlELnhtwOpiEVGn1
 17glkDiYRq3hvP63HhX3Ar1dlwqj8xQ3vZF8XowRX1Sg0Ag2clFepbYae20LugpmTpuh3l
 gYqn3l18rScJZMWxfnskJVUxYw3Cta585ZUzKz/q+Mtz1L/roQHAZebxtxJ5iEpnZlklkj
 BrmcCkGR9FOhZEpcdpxhpAPO0wS5/GcqjIkzj6JkXNraeahAeNIBko8Pze/f/OkiLepssW
 F9e5mCv+DQ9/aG0CC20917u6RgyXvuvQeTV4bSC6McEzndL8xVLGM5dFLwMKhzjn+baHwC
 dHDFah+vO9iO3uBsk3x14NJKi3qYSrhirXBYne2lXBYSHhQyeuBDI4XXTGJ6F8V5gC+55z
 WVNEOk/mwO1bSBKqQx4ymGApYDtlWdGBCircbCB2h2oJge4id27xUJ86p4ocO1dyoI3IcF
 oYX9v53iEmT+W5pJU4O0Zxb8OMwoo9ZK7ab+tBuzPhDS0Ahm+Mp/5lOmecKMTFm6hDp9P4
 kqO0ZKb4VkunioE5+RSd6+B2fchJxYKQJEczHtznJZp4ojcp7gBnd+bHE1yQPYy1RmsCfe
 VaWENMKuP+JhSa4Pu/6Df50yXqzsFuywHJE0vpPST+2YJiDak1REX8v0zdl+BjiVBjLmHa
 3l47K/zH2uRnPiUAzox2ipm5kNP7MhnwKpxMoHDBL8/KxPxwxjmxo9lVZw37xGS2ORv+wJ
 riuNvxv8KLOjYEsuNI3/NWfJ3JT/dQ3WKx1QO8D26pRgSW2Aznl2tUNye4OJFIOmesVPzH
 f8kgEw6QGet70wegw21nJUQ9/kQpU5YpVSr522RR/ED7FtesZIUypJv4tRHXBPfHUyJ+Rn
 Je6Nbl8ES1UTOPp1PfH5TLZ9PkJpLmDIMlRRv8Z9sOJdiAho3Qo34rLYbDqr6a5G920szW
 Kz5XKxDQv3xCEeIu1cedvHTImb+nTiQ2u3oAaP2jqqE6c3gZEgLp/qpHjL7j700DRdi14r
 /ZiMfRQY

Hi David,

Reclaim isn't touching the new mm being initialized (which isn't added to
mm_list->fifo until lru_gen_add_mm() at the end of copy_process()).

The KCSAN read is on oldmm inside dup_mm()'s memcpy(mm, oldmm, sizeof(*mm)):
oldmm is an already-live mm sitting on mm_list->fifo, so when an adjacent
exiting mm calls lru_gen_del_mm(), list_del_init() updates
oldmm->lru_gen.list.next/.prev under mm_list->lock.

Since oldmm is live, lru_gen_del_mm() has to update those list pointers.
The alternatives in dup_mm() would be taking mm_list->lock (plus
mmlist_lock) during fork, or avoiding copying oldmm->lru_gen / oldmm->mmlist
(awkward because struct mm_struct uses __randomize_layout). Wrapping the
memcpy() in data_race() avoids locking on fork and matches dup_vma() in
mm/vma_init.c.

Thanks,
Muhammad Haris Awan
