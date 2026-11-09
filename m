Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.96
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195872;
	b=vowHTQL61s1s7sVnDTObWP0snxoNYyi260M0XmeFt4gh37+nFKNtcRsTnp1qNgotrVOP
	 cJL0E61qU9BxjFJIelGqLviX4ifHnUqMtrGExA2v32VvPil/sUKPPlqDcF5lsEGUVZeaQ
	 CNNHfj6kbhLG7LsA39481NtpJKnLOf7Wl+R7TQsOEEYkZBiobVIqY0mfpGf8LofCd8RQu
	 GMgzkYMSnPaTahPkAAhAkxXQ3G5XXJoDZ4idNmmelYej3Av+wijMiv1e7Y8LU04wzj2ra
	 ZKLzgcEUK/feDAYrXoxFMYORXWO0FRpt7Th9PlW83eXyppEUNliFJl69f6VxjVBYLcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195872;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=JTiv2GRYKop7vCx/gXindWSFmU7+GmHnHjp+oJDyjUQ=;
	b=4nkpkfpN472fy5unV4I4Dm8SDDfgnah5s2c2QX6GJfsYEWHHIFUtJT0/kq8e+1UaFMZJ
	 QoqYmK7VEncNlQTFBui1hdqTQXcE26y7vpI1X50IQP1aOAy7Hr9PtfRuU0XQY5CnlQWJx
	 ST2t9iLOy3hr7Rizw412t3xQps7B0e9wV+G/TV0A1+AccPR+UEGWYrSN2x1l8CxujS2AF
	 FRBB+xPqaEBJ9tbMdRWs46nncBmm8gM6wlIeeaVsSPDukfdlxVts51TVfzX99Mpn3xLgb
	 RY+BavXsSfQ6uP34Xr1ACXtAs1/AsQX3mbQwqitodCoCMuhGBQ8Fx9bwhjta4/pvmeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UL182Ymp;
	arc=none smtp.remote-ip=91.218.175.96
Received: from mta0.migadu.com (out-96.mta0.migadu.com [91.218.175.96])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D84C606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D84C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UL182Ymp
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JTiv2GRYKop7vCx/gXindWSFmU7+GmHnHjp+oJDyjUQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794195869; v=1; x=1794800669;
 b=UL182YmpeSX6nFVbBsJ7y8S/IyQUXmitlzi+JbC5w2Ptgjh/cWL19fCg1j4IPVm2/p8G8A3e
 Zz3G2ydotNN5QvKRbPqEHUQIojBNTXxOPc1QrQFTI7OMGbxmf1kuKdNvyTzu1IW2fadxFyJ1+Lw
 bRnzGF/XbnueIjXLpDOd5JWI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id b7f753fb76ab6eb5;
	Mon, 09 Nov 2026 03:44:29 +0000
X-Mizu-Trace-ID: b7f753fb76ab6eb5
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH] x86/mm: Tear down the direct map when memory hot add
 fails
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <au_l5MRyDbYfsUVe@chrisdown.name>
Date: Mon, 9 Nov 2026 11:44:11 +0800
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lance Yang <lance.yang@linux.dev>,
 linux-mm@kvack.org,
 linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 kernel-team@meta.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <681A0C48-AA5C-4337-8CD0-57FCB21D8D63@linux.dev>
References: <au_l5MRyDbYfsUVe@chrisdown.name>
To: Chris Down <chris@chrisdown.name>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 8, 2026, at 11:00, Chris Down <chris@chrisdown.name> wrote:
>=20
> arch_add_memory() sets up the direct map before calling add_pages().
> If add_pages() fails, the range stays mapped and any page tables
> allocated for it are leaked. A later hot add can reuse the stale
> mapping.
>=20
> Remove the direct mapping on failure.
>=20
> Fixes: 45e0b78b0532 ("[PATCH] hot-add-mem x86_64: use =
CONFIG_MEMORY_HOTPLUG_RESERVE")
> Signed-off-by: Chris Down <chris@chrisdown.name>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

