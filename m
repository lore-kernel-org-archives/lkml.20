Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B773A382F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548428; cv=none; b=pDLLEDszxm+PBe9eR0zLFeEPDN41VjuVzSQZVz5NtE+gWAblGyo0M9j2t4yhDXIwF7eZaAYug7AazLNYvBmWIM+j7lWPFZ1uCEDmft0X1gqzObXBhRCsm4LQxE0tVgdVUq9aSCyRF9fQy2apFV/E2l/XHnHYwvmBFNvRrgdEsVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548428; c=relaxed/simple;
	bh=shvjSCrq9giNK2fK8F8J7xAB7U5XdgQXkDqSI8h4qlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFYLsdcoggPmz2RJL/T4FnnqqOFjoHWHPviW7aOJA8KR+nSeOeLaSYQkhlq46WLdtE2PXMxV8bEKOS2FUgkqxFuW3M5Cnx6Wq7PoDHYJMlc68vt7V+X5KJ7qS+4TKxWMD4Ay4YZcPimFWfl6sZUewMz5SBysaEGFox7SL+03KiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=F/R0XFgM; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="F/R0XFgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=Iq/G8rFqqBdY0DiJTRHbPh9MIq9KdVN70oeDhYDSjGY=;
	b=F/R0XFgMWqW3NuSwSdzsgIoift6TFSo5JBE00G782Xpi5m1hKC9csmIhHWxe7Z
	MJveZhtJUKPzrYbkdDITOTKi3Se1AFvO4/0DsJ7tSu1g4dE5+nNZUuNSNyX+Z4VG
	aqwu/nwVvGg3g4qAbyKx0TcJ5NaqTYfyMrpuNDpPre45E=
Received: from [IPV6:2409:8d1e:e12:10f:f16d:ad0f:fbc2:4ab3] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBXGgJYV6pqVeX1Sw--.12121S2;
	Wed, 16 Sep 2026 16:46:19 +0800 (CST)
Message-ID: <1537faf6-5a31-4c7f-a3f0-8c88ea947779@163.com>
Date: Wed, 16 Sep 2026 16:46:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] mm/ksm: merge-path cleanups and folio conversion
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 Longlong Xia <xialonglong@kylinos.cn>, Xu Xin <xu.xin@linux.dev>,
 Chengming Zhou <chengming.zhou@linux.dev>, linux-kernel@vger.kernel.org
References: <20260915222545.5683-1-xialonglong2025@163.com>
 <d490e314-b92f-4120-93fc-ae36f487b135@kernel.org>
Content-Language: en-US
From: Longlong Xia <xialonglong2025@163.com>
In-Reply-To: <d490e314-b92f-4120-93fc-ae36f487b135@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgBXGgJYV6pqVeX1Sw--.12121S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrWxury8XF1DWr1xKrWxWFg_yoW8Gr48pF
	W5Ka4UCr4ktF1xGw1xZa4UZr1SkryfG398Cas3ArW7uFn5Ww1Sgw1jgw4jqayDCrZ3Ww4I
	9FWUX3WkXa1FyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Us2-5UUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC3BsxKmqqV1vOIgAA38


On 2026/9/16 14:37, David Hildenbrand (Arm) wrote:
> On 9/16/26 00:25, Longlong Xia wrote:
>> Thanks for the review. You are right that I did not justify the
>> page/folio boundary clearly enough.
>>
>> Patches 11-13 only avoid converting the target page back to a folio and
>> provide no functional or performance benefit by themselves.
>>
>> I will separate the independent cleanups and drop or rework 11-13 after
>> getting guidance from the KSM maintainers. I also found a NULL/bisectability
>> issue in v1 patch 12, which I will fix before any follow-up.
> In general: once we have a ksm folio (folio_test_ksm()), it can only be a small
> folio and we can operate on the folio only.
>
> Until that point, we really need the page, because we might be dealing with a
> page in a large folio. Sure, we can carry a folio+page pair to reduce repeated
> folio lookups, but be aware that we have to re-lookup the folio and take care of
> references whenever we call into something that could end up splitting the
> folio. So we have to be a bit careful around that.

Hi David,

Thanks for the clarification. I understand that the page must be 
retained until we confirm it is a KSM folio.

I will drop patches 11–13 from this series and send a new version 
without them. Any reworked folio conversion patches will be sent 
separately later.

Best regards,
Longlong


>

