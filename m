Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792726778;
	b=f0RaOiB3NC50NMVpp0t0bzFV2LorPl4bLFXCn/TO0xRP3o2ogoZE1c6kgC7+mNBY0sjD
	 9r0H8b4c/tPdYp5HaJDmY7W/BPCU6AAK9re6kCyIvbhGpyGMn1bKLhNzoxwm01hfowq94
	 rl0q+YaoYLTB2YguwS350ZJENqSda5itpvNm6liEBJAn+OioMa0q9NeAK0zk9KTiWED2J
	 M3MzlzccLETFlIVpYY4SX5CZj4Og1xujAx5XKgaL3JoliSN9ZLmbwECY29UEmGXrTKEDP
	 XBICQ4bnZlD4TFwPwKloBblStxycGw4ukJ3vMCIjrwxq+SnIJnrpoRIVQeD7DkTimgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792726778;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=h/PHKf5VXGtBGoIbL1o/q0Pk83/Oxg+wK+aNGJFCCa8=;
	b=QLPBxbfRO27AZCsP9OtgUiJp4j3YznWqECA9922/c7mPqTZXJAD5oHA5Ihx6CE3tzUhN
	 vNiNSBeIOqWLJC07oGM5f1A2RwB2RZ/E0MS3Z44IwH1lAWV5HIHY9Q/HV9B0F9kV/Ul2Z
	 pOMPEuAMjSu0savpIJx6kWa7ms9U6+9joSxoeoYhPf0ZLAH+RHpFIWiTYmkOSOMHFVNpc
	 PH5i0JRkJu+wrXkBIIHOdPZFCwpp17h82RB+hEfKmzhpJL1x/FS+VAvgUNr439k5yv+9g
	 9TqFqzCRRTR+cXQLsbj7T5QftB1svo8MAucGEDenZg6bteEF3eFYv8Pz+QSpeFFtqZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c1xS0Vgw;
	arc=none smtp.remote-ip=95.215.58.49
Received: from mta1.migadu.com (out-49.mta1.migadu.com [95.215.58.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80C4606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C80C4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c1xS0Vgw
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nyUYoSOqOuJuKO479lHIb4LIHOAdbHMHCwHUsDvcPhs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792726774; v=1; x=1793331574;
 b=c1xS0VgwSmIWJCeXR1Taxdhv1AQZQAN/vHNT33C7Hb1gPxcM7mlXtCRT5/+fwadj0MRzcwh0
 jG8WnZse0/fu9e5AgyUckxXFoE9aCPHwvyir+c16a6qpqSCQoVlJvw7UaKI+aQddTUUjB0INtrM
 Y3PS8yWDwld7/sVWFLzkc1Ss=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b7fc172a1acb4739;
	Fri, 23 Oct 2026 03:39:34 +0000
X-Mizu-Trace-ID: b7fc172a1acb4739
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: osalvador@suse.de,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	lance.yang@linux.dev,
	jthoughton@google.com,
	david@kernel.org,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/12] mm: hugetlb_vmemmap: make vmemmap optimization folio-oriented
Date: Fri, 23 Oct 2026 11:39:27 +0800
Message-ID: <20261023033927.35704-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261020115824.823278-8-songmuchun@bytedance.com>
References: <20261020115824.823278-8-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Oct 20, 2026 at 07:58:21PM +0800, Muchun Song wrote:
>Vmemmap optimization operates on one folio at a time, but the current
>interface exposes a raw address range and requires the HugeTLB caller to
>prepare part of the operation.  This splits the common mechanism across
>layers and obscures its natural unit of work.
>
>Make the folio the unit of vmemmap optimization and move the common
>mechanics behind a folio-oriented interface.  This keeps HugeTLB-specific
>eligibility and state in the caller while making the remapping code
>applicable to any eligible folio.
>
>No functional change intended.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

Cool, I like having the helper work out the range itself. One less thing
for callers to get wrong :)

Nothing jumped out at me, so:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
