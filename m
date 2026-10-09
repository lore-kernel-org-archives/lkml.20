Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7160B432BD6
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545264; cv=none; b=DGndixiVzXGHdgiwKLy1hgW1M7jLiHVMTWo/0p2HQPBGefkoiUiR9ZAwlc9ITMaa1YkeEswqfm5HMUE0L4CPlnI0IQiJzQ+5lbHYRh90s9hPMa8y1nlNfclW8MkBVSHHFBwr6aXR1x3snorPp7e5Z+0dz4ZxlsIKPhDoR+vI36U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545264; c=relaxed/simple;
	bh=NeHpq2sH0N/tD/x3BuchI19QrNvAWROybqMth+/QPvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=s/nU1UIGSH0uXoLwds8dGehJAFnUDHjGY6zDW61CJRe+rpRQqBAp0iLtex8z6XEQjhqYzi5qs35NAmfI4Oo+eGP9DQUQqQQ1+Q/bLKr0JbR631PVyZTg0Qf9hDZTDwM82iqFpHETpEAJRXzMjzZJ5ZqOwfuab24sJwq5Sjdmj7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=eh8QHMkE; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="eh8QHMkE"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261009112731euoutp017a48f3ca1feea4999d108ed85ae1e6cf~c2On1tySI2499624996euoutp01G
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:27:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261009112731euoutp017a48f3ca1feea4999d108ed85ae1e6cf~c2On1tySI2499624996euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791545251;
	bh=sd29WIiqfdVWcWcizPFVJr9wsS2+jLlXGujHLrFRB5g=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=eh8QHMkEFgU8Sy6/PcFUtjJwUoiVOeRsuISS9DdNDMXzr4/dd5rCvbl1agE354YXu
	 IQa6IB8mokguVKD/BFtqyA2b4KX15ZWKZRXbd53ZoMxMuTrqWf0JOvFFiKPGt8hpG7
	 bl9LHhiPnQc0C1zED5y0d78Q/oZ6/V/T5JYWBn7Q=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261009112730eucas1p1f516da70272a6482ddd5a6e5c90ba395~c2Onj92gJ0217302173eucas1p1R;
	Fri,  9 Oct 2026 11:27:30 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009112729eusmtip2bd8329823fee0d3259af1274218235e5~c2OmuwG6m2544925449eusmtip2N;
	Fri,  9 Oct 2026 11:27:29 +0000 (GMT)
Message-ID: <81d6c6be-d03b-4fa8-be30-1425c4d1ad40@samsung.com>
Date: Fri, 9 Oct 2026 13:27:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 2/2] of: reserved_mem: allocate and map the
 reserved_mem array early
To: Wandun <chenwandun1@gmail.com>, linux-mm@kvack.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mike Rapoport <rppt@kernel.org>, Rob Herring <robh@kernel.org>, Saravana
	Kannan <saravanak@kernel.org>, Oreoluwa Babatunde
	<oreoluwa.babatunde@oss.qualcomm.com>, Andrew Morton
	<akpm@linux-foundation.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <a8ac6daa-e721-4cba-bef3-3333643db23d@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261009112730eucas1p1f516da70272a6482ddd5a6e5c90ba395
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261008152450eucas1p1d5517eadc2c1d684ff6d4ddc010f6331
X-EPHeader: CA
X-CMS-RootMailID: 20261008152450eucas1p1d5517eadc2c1d684ff6d4ddc010f6331
References: <20261008152403.766439-1-m.szyprowski@samsung.com>
	<CGME20261008152450eucas1p1d5517eadc2c1d684ff6d4ddc010f6331@eucas1p1.samsung.com>
	<20261008152403.766439-3-m.szyprowski@samsung.com>
	<a8ac6daa-e721-4cba-bef3-3333643db23d@gmail.com>

On 09.10.2026 04:16, Wandun wrote:
> On 10/8/26 23:24, Marek Szyprowski wrote:
>> Get rid of the static, limited-size reserved_mem array and replace it
>> with array allocated by memblock_alloc_raw() and accessed through a
>> temporary early_memremap() mapping. Such mapping is needed for some
>> architectures (like ARM64), where linear map is not yet available during
>> early boot scan. Having a single, writeable array with all reserved
>> regions removes the need to perform two step initialization introduced
>> by commit 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved
>> memory regions are processed"), so all regions can be processed
>> directly during the early scan again.
> One concern about the ordering here: the new memblock_alloc_raw() for the
> reserved_mem array runs *before* the static ("reg") regions are reserved,
> so the array can be allocated from inside one of them which makes the
> subsequent static region reservation fail.

Well, that's what Sashiko already reported. It will be trivial to process
'static' regions before doing the reserved_mem allocation, but this in turn
returns us to the point of not being able to handle their reservation
failures. I wonder what's worse...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

