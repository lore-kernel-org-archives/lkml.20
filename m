Received: from mta1.migadu.com (out-97.mta1.migadu.com [95.215.58.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0480C377ED7
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789830901; cv=none; b=Y7T0/VXZUKApZv2ajhYQLBSB6XYQvm9u2EQhkgESzX6/9NMJ7WZwxkWXBeW05Fh+1Z4BWr2MAkUKe9JzlKWxJVCjt8YC3XEUqqastkc+U9sjnCWJjXJyD7+WAS/I0qoJVEOFXjaxlkvDFNpQURf6J3I7PRMrfQvTBhUcZypFzm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789830901; c=relaxed/simple;
	bh=9b2LPJKwDAP26Jyo5JqSNmJl55dEEIMEug+87i/rHb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lTUOgSY8+tmZj+Dq77+3Fhm1cd+Q+wheae6K+m4zwKCSdFh0dvcXzBm+SZ7vGe7ECED1eLsBE/CWQCJEAO+8cw5X9nw6k4fTaWGyF5nHvbP21eAOzQgjjQSX+BWGvz4FWctumfUvdgX9PS1OSqCpHxGqmzLCBE1OeC/9LJ1DYZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Wx4ObIXb; arc=none smtp.client-ip=95.215.58.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Wx4ObIXb"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9b2LPJKwDAP26Jyo5JqSNmJl55dEEIMEug+87i/rHb0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789830895; v=1; x=1790435695;
 b=Wx4ObIXblzEO9Oh36mlY00JUaLE6SvPAavGE0WzQXoBjllMWXsbnQSOZTL6WDmCt9F7ry0Kq
 cWlCHS+O8/CKI6fD1Vtcga4tRDN52LhSm5J5CJ8RX3e1IItyqygobjmQXklgsHKaAmv5PCjWB40
 00mg6fUbxspm+Mtzmm6zTPew=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 605310dcde608050;
	Sat, 19 Sep 2026 15:14:55 +0000
X-Mizu-Trace-ID: 605310dcde608050
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: lance.yang@linux.dev,
	kas@kernel.org,
	akpm@linux-foundation.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	usama.arif@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] mm/huge_memory: disallow raw PMD mappings of the huge zero page
Date: Sat, 19 Sep 2026 23:14:46 +0800
Message-ID: <20260919151446.5741-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <c0979ad4-9fec-49f1-8442-d90061b79504@kernel.org>
References: <c0979ad4-9fec-49f1-8442-d90061b79504@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Fri, Sep 18, 2026 at 10:37:27PM +0200, David Hildenbrand (Arm) wrote:
>On 9/18/26 04:52, Lance Yang wrote:
>> 
>> On Thu, Sep 17, 2026 at 05:03:09PM +0100, Kiryl Shutsemau wrote:
>>> On Thu, Sep 17, 2026 at 05:29:48PM +0200, David Hildenbrand (Arm) wrote:
>>>>
>>>> Why would the zeropage be a problem in PFNMAP mapping?
>>>
>>> Nothing enforces that it is read-only.
>> 
>> No in-tree user inserts the zeropage through vmf_insert_pfn_prot(), so
>> rejecting it there should be fine.
>> 
>> Something like:
>> 
>> ---8<---
>> The huge zeropage is reclaimable, but a raw PFN mapping does not pin it.
>> A PMD mapping of huge_zero_pfn can therefore outlive the folio.
>
>Well, just with any other folio that we PFNMAP, the mapping would have to hold a
>reference. mm_get_huge_zero_folio() can be used for that, or just grabbing a
>folio reference (not so nice, but works; GUP uses that, for example, to keep the
>huge zero folio alive).
>
>> 
>> No in-tree user needs either mapping, so reject both with VM_FAULT_SIGBUS
>> rather than risk making either shared zero page writable.
>
>That is the better reason. You could also just say that handling shared
>zeropages correctly is more involved (see vm_mixed_ok()), and as there are no
>users, we can just disallow it instead of trying to fix it.

Ah I see, thanks! obviously, I hadn't fully understood that ...

How about this instead?

"
Handling the huge/shared zeropage correctly in vmf_insert_pfn_pmd()
and vmf_insert_pfn_prot() is more involved. We would need to check
whether the VMA allows it and keep the mapping read-only, similar
to the checks in vm_mixed_ok().

No in-tree user needs that support, so reject these mappings with
VM_FAULT_SIGBUS rather than complicate the code for now.
"

Thanks, Lance

>> 
>> Link: https://lore.kernel.org/linux-mm/f76beaf8-351a-4b22-b362-a945a5e1af6a@kernel.org/
>> Suggested-by: Kiryl Shutsemau <kas@kernel.org>
>> Suggested-by: David Hildenbrand <david@kernel.org>
>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
>> ---
>
>-- 
>Cheers,
>
>David
>
