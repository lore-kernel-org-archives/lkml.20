Received: from mta0.migadu.com (out-143.mta0.migadu.com [91.218.175.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7F45476CB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874408; cv=none; b=krt0Qbw/N0vqmpzPzkzJH2w2EP16LoANeg3OYSUMHJSxDhhz7Hj5CwHllRzpOQp01gb92tCUzL6aXlCnjc92qCO2fnqZr7SI5XvpoTckmmIjsXwmYhV0c7Af8LP9RZIXL+z98c4ooe6LpkkwvRzP/opCY9vRKzho4095QXicm0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874408; c=relaxed/simple;
	bh=tE5eScR3IxoTuSxmbp9k/zEYAX1sgNIFgHtL4WOiC5E=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=Tj5EffAQ28Y5p4RYQRuCHd7aU8myA0IXsN9nMwrvuwiNUvIttJDw9mUra9oaXaG7kltnviwEkbhfXbUJpevIUN7lSnIEQOps1v9V24je5MOZpWnZHkK1Rd41eyTrzBbzeSs1LGQEEOSRAaYcfkp79+7/Sj3sGDH0G7Uw+eH6Wps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nVi3+4EQ; arc=none smtp.client-ip=91.218.175.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nVi3+4EQ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tE5eScR3IxoTuSxmbp9k/zEYAX1sgNIFgHtL4WOiC5E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788874393; v=1; x=1789479193;
 b=nVi3+4EQI5fpQPU/Ae6ayeuI/8Ca4hslOAAKMjvRjEvj5nY/6BsN/FziW1HV1kMVzaeiia9P
 3bjzs82e/Yuzvtvw+TLgZ8kjSAbdBootfntQcuwB92eHWN8+dBBgpbVRe9HpeAWdYwK6gS6g3cE
 k/5mU1Qfbe13kIE91CPPKYag=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6d91044e4cfde672;
	Tue, 08 Sep 2026 13:33:13 +0000
X-Mizu-Trace-ID: 6d91044e4cfde672
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 08 Sep 2026 13:33:12 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Ilya Gladyshev" <ilya.gladyshev@linux.dev>
Message-ID: <85b0e3c5f328e2c3779fda986fa19530ae9c77d5@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] mm/huge_memory: add folio_reset_partially_mapped()
To: "Kiryl Shutsemau" <kirill@shutemov.name>, "Lorenzo Stoakes (ARM)"
 <ljs@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com,
 hannes@cmpxchg.org, usama.arif@linux.dev, lance.yang@linux.dev,
 baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 kasong@tencent.com, hughd@google.com, balbirs@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
In-Reply-To: <aqAIFV4nOGPbWiDS@thinkstation>
References: <20260907183340.1446132-1-kirill@shutemov.name>
 <ap_Tjt5vxal-B8DP@gremlin> <aqAIFV4nOGPbWiDS@thinkstation>

On 9/8/26 16:09, Kiryl Shutsemau wrote:
>>> +static void folio_reset_partially_mapped(struct folio *folio)
>>> +{
>>> +	VM_WARN_ON_FOLIO(folio_ref_count(folio), folio);
>>
>> NIT: I wonder if we could have a folio_is_frozen() that'd make this
>> self-documenting? As trivial as it'd be :)
>>
>> If not, then a comment like:
>>
>> 	/* Folio must be frozen. */
>>
>> Would be helpful.
> > There is a series that changes how frozen is encoded and would be the
> natural home for such a helper:
> > https://lore.kernel.org/all/bb1cb750157733f897df2e261cad3d5c42acc172@=
linux.dev/
> > The patchset seems to be stuck. Not sure what the plan there. Ilya?

JFYI: I restarted my work on this patchset this week and plan to send
a new revision in the next couple of days. There were no problems with
it, except for minor issues with the debug WARN_ONs, so I hope I will
succeed with this plan.

---
Ilya Gladyshev // foxido.dev
