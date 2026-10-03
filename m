Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D923A235BE2
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 15:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791042608; cv=none; b=BnzZrkrg0cgk1ZMYmbmfvERc+VTihm/RQdJM69NqIJE7yC5URoXw2XxvpFZbVzrlS7WwgvPH7qLJQnEINI272CJjs2y1ag85/gBxOebM0hcoQ70jOZT48YXcsusH8luVvMXnppQl1zHvPI/JSmFMkWT0VBsQpjATUL1PP6JtZPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791042608; c=relaxed/simple;
	bh=qJaUF/w0W94fLDp+eth2i/oD+mT1LZ00w7+E9whiJJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CKYJGjmYC9Bwc4zH3MTJrsmL7b2SzmSh4svnelEX9rnZAcyIjvzf64l6RmiyJOkZ6jkjXxyD+7zWjOuw3irooX65N02/M8hqV6mZ0u77u7nLQpYesJcUhWvyzWbRpT7TLXDCFtPdHX2KAexI4rfhnIffUUzMIXSwYf1sBzMA08I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BqcU+19X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BqcU+19X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791042605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pJNvDGX6YiI/koTtXDXCLWPYjykCeclt5Rn2DoTl0tg=;
	b=BqcU+19XJRIIDba2g8fLMsihzUGFan2t3avUrBgAusjOjODAblBegeidUFd39pZyYuPfvF
	r5w3xlduZezxy2D67Pduswj2PXQmdWarun03TgfSOiOO823eUN9pomtg+sqSgXAh0rvdIB
	D1qaLBKiKFr7/wY5UTpvuPKSvih5hkE=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-vbsObNjHMMey5sbZQAUSXQ-1; Sat, 03 Oct 2026 11:50:04 -0400
X-MC-Unique: vbsObNjHMMey5sbZQAUSXQ-1
X-Mimecast-MFC-AGG-ID: vbsObNjHMMey5sbZQAUSXQ_1791042604
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-869553205a7so4329467b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 08:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791042604; x=1791647404;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJNvDGX6YiI/koTtXDXCLWPYjykCeclt5Rn2DoTl0tg=;
        b=DBOGI2jsxaYlhffGMkUTGFmcjx1GHjGfR8Ee7plO+kYThJZwT+kFc7hwzkQ2Wc9mzt
         Mp4+YgVRBeWc+C6XHMjPDVX/oQOXb+YTF7LcPs3jTCYt/qoJePt5rsSRK4wz0xGyQLY/
         jb4PEWAme5KH1IrDjJSIWhm176v2p17BgAijX6OBS+1ujgFQ9m7CdDkarTBYZv+Nu3H7
         vnbv0GtvhnYAjZA2/fsgkfMu5Z7dJcXSGRSn0QN1wGpac9iSrVx6W3vXYB35a5qU0fQ+
         G02mJbBxstwOQYrrSrru7qNeGXe4O5AkFR8Iq1xK6IRz1S/C9Fet1TIIFXywuopAAN5l
         C7cg==
X-Gm-Message-State: AFq9FYIoBoz0M0yP1J+/3so2ynkfhe4F4CIiYGP0gfPHsnHzv9ljxD4G
	J02jOaFnFZL0URyb/9VwXaZHYEHVO7MdAwv1vXMKTFOhl0ayrEDOiHBksDP2HeRjlwcGAvH3Jfe
	sWohRuT/snvKhmh8GI1zN9//iN83lJugwSUvZfRzFrtgolznw7NlTRuJLwmm8ujObEQ==
X-Gm-Gg: AYBFou24CJ9srnhTCj1Lz2NRHi+jSmX7E2MpyHyaJTil/5Cdb3+EQL+hBfsuPk6hjhT
	2Ra1ul4XbELDaQ2Of/FDr4dljrOhG/fpyxuqjQLJnQu8M1coxMzCWeaGkkzJ02YSjnasg/y2Ix1
	MM37TdoWGEnD09121/3kkF+K7h/0wHcfGBgvnarP1Dqvd6tyuTTiZqjDWv4m63DlPCQVw4ieJcH
	76YoQtlq771WWA9iL+oaWGkwa0G4RXvjhvOffXnkZ+hlUudKsn1RyKzZZuW+Z4XuaxA12mtxNR5
	BEZV0Xjb840/BFCa+51X0rFYA4qWsSd900ELxwop/VaCs2lzfRflFGfoINi0KgqdqJiSWhIhQfU
	ltbc=
X-Received: by 2002:a05:690c:f15:b0:8a8:6a39:37e0 with SMTP id 00721157ae682-8ae39c0a963mr28210007b3.42.1791042603902;
        Sat, 03 Oct 2026 08:50:03 -0700 (PDT)
X-Received: by 2002:a05:690c:f15:b0:8a8:6a39:37e0 with SMTP id 00721157ae682-8ae39c0a963mr28209777b3.42.1791042603359;
        Sat, 03 Oct 2026 08:50:03 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8aeaac82e1bsm5662017b3.34.2026.10.03.08.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 08:50:02 -0700 (PDT)
Message-ID: <eea53e37-c000-41f9-adb7-6a95e61adfa9@redhat.com>
Date: Sat, 3 Oct 2026 11:50:01 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 14/14] mm: thp: always enable mTHP support
To: Lance Yang <lance.yang@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, david@kernel.org,
 baolin.wang@linux.alibaba.com, ziy@nvidia.com, corbet@lwn.net,
 tsbogend@alpha.franken.de, maddy@linux.ibm.com, mpe@ellerman.id.au,
 agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, x86@kernel.org, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hughd@google.com, dave.hansen@linux.intel.com,
 djbw@kernel.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
 akpm@linux-foundation.org, yintirui@huawei.com, dev.jain@arm.com,
 usama.arif@linux.dev
References: <752f528f0fed5cdc9de12b54260b0495d4e5a6cb.1789695931.git.luizcap@redhat.com>
 <20261003031301.48957-1-lance.yang@linux.dev>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20261003031301.48957-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/2/26 11:13 PM, Lance Yang wrote:
> 
> On Thu, Sep 17, 2026 at 09:45:35PM -0400, Luiz Capitulino wrote:
>> If PMD-sized pages are not supported on an architecture (ie. the
>> arch implements arch_has_pmd_leaves() and it returns false) then the
>> current code disables all THP, including mTHP.
>>
>> This commit fixes this by allowing mTHP to be always enabled for all
>> archs. When PMD-sized pages are not supported, its sysfs entry won't be
>> created and their mapping will be disallowed at page-fault time.
>>
>> Similarly, this commit implements the following changes for shmem in
>> shmem_allowable_huge_orders():
>>
>> - Drop the pgtable_has_pmd_leaves() check so that mTHP sizes are
>>    considered
>> - Filter out PMD and PUD orders from allowable orders when
>>    PMD-sized pages are not supported by the CPU
> 
> Nit: "and PUD" can go.
> 
> David mentioned
> 
> "
> There is no need to disable PUD-orders, as shmem does not support PUD-orders
> (unlike DAX). So you can keep it simpler here.
> "
> 
> in v4
> 
> https://lore.kernel.org/all/ff7bcd65-d444-4da1-890e-75504303ec3f@kernel.org/

Yes, I changed the code and didn't update the changelog. Fixed now,
thanks Lance.

> 
> Cheers, Lance

