Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5BD4A3F0E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789162894; cv=none; b=dVs7d1DG0IJHqACTGeoa4YDRL+tk9+klGG4namLRUXNS0USNkx2nYdixfPBUbQEO0uaMmJ1jDiOUf/2h+g8AdVhIzkTbpiMJBUHufIK+luyWRIBKouSPv2udkcwygM1bj873of3cSgvm2ziVkWfuxIfE8b7+y9FA0hY69ccNh7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789162894; c=relaxed/simple;
	bh=3Z89g39kjDduRikJ1fI1TOEGqknVzSRIJDlDv4qxubA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YLg9ddeP2Xspm4Nov7LNzZfm+cQ2B8j7M3tRdcBNc/ujPV11Y/OHCD0XHg41aFTXTv+o1n2xOLquCFFVUhZnMnExIEbUXyEzBCwEjVR+1sPjWTPoo98zBUQx1sySBc3kNDccY+B0365nYVC7p/j5BPPDbuYcieJxf8fe8Mc+dks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso340875e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789162891; x=1789767691;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTj+cMDcQ01Oufu4utlEzkUYJwmYL7SPG/H+InwEwP0=;
        b=bgtOizR2AVT/8lvCNsPpExIC7uKzb/5OOccRqIQfOpdr1k5nGSJFVsotC7tPS2iGxl
         uysYwrpcvrJpTe14BiYEhzdlfex6jD2YRhRJXok0LffhZYTPfqh1WShMSBhF+xj8Oydq
         A4V1yhX/laZYQnem7BP7hKUe/KPvoxeKEtKktCnLejifVK9amDMEBan0mMZQJ2Dplm+N
         yqlgmVFezxzZAE1LhpfObux8Yk0AHyLMmjsjGNdrSE4B+9Fli1u9QhKZKc84iwK5jUhz
         4l4mu1HoHgMw7B1RtrJAiGgfSK4BGbKWR8l7F/sjCH+PSYOYl3AlfXVfICJOHxuM/QRn
         t60Q==
X-Forwarded-Encrypted: i=1; AKwUvBwKC66emDtPOtEarIdGYfgLNknOVh4K3IOWZ3zLdSxSsoa4eEdm8MCgkhK9LX7JUVaN5iSzV2Y68myGzsw=@vger.kernel.org
X-Gm-Message-State: AFuF++lC/x0I3RcQM5w6MfQJG7anqhKBs4K/XGs2l/aGdMANzZ515R8T
	rAqGZ39uEVfZCZb6OnsnJKFOrZ4n3G5S6G+hAr9Fo9oM2KqKo9KN1wrw
X-Gm-Gg: AYBFou3GLA582YlaF5qEONb+p5KPkhQQFNmr7YZy4bW2iU9+zxHhUxbnPJkvJ6/KWBR
	1B5qYeCHxtDxaklXlzQiIV6sbv6p3B/YV5JXSwmBKUNhDcp7f9OaEfv45PTshY/XmCJayik98oU
	uTr+BIBGExaPCMw6WsfVPstP2VAsLJmh+1evqcK/ea4JftHkGxaqNUprmh8ANEGiEELDawwCc60
	EZ8RowusXFWRoo4CGU2YycHvepAsWp2mMN/C+voeZGbCXkq1JqvHvXvdD4pDVUyo8z5FgUR6LgS
	WOY46bsUL8z5HwJQJ5/VzBugbi5bohznmt6+yg5vlJUhNp9AVNJzLcGe2rhOELOE8JLF5K5kWx0
	bb4VkKKl+7JZ/2ofQWUb4/i+Z1sDcC+/rmK7VsRCZ9BEd+9vAIN+Bn+vInAusCcNrWH8/YT1S9O
	Ae3A9ARwyOUro7Htxwe6SEpHbfPqtXF68Zx+eVUqXivZ3q6ryjv3PV/eraabNjrcTa4OzAj8Fq4
	7FIhU4dTZiz54jB0xk6SN0gNg1eubN9
X-Received: by 2002:a05:600c:190c:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-49e6cacf772mr498775e9.14.1789162890859;
        Fri, 11 Sep 2026 14:41:30 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fc02sm8044319f8f.16.2026.09.11.14.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 14:41:30 -0700 (PDT)
Message-ID: <9cb2f10e-bea0-44b2-a7dc-e2eaeb5ca96e@grimberg.me>
Date: Sat, 12 Sep 2026 00:41:29 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmet: accept ANA group ID NVMET_MAX_ANAGRPS in configfs
From: Sagi Grimberg <sagi@grimberg.me>
To: Andrew Stellman <astellman@stellman-greene.com>,
 Christoph Hellwig <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260910154849.66095-1-astellman@stellman-greene.com>
 <3a06fc29-4364-4573-b12c-39b42d95a4b3@grimberg.me>
Content-Language: en-US
In-Reply-To: <3a06fc29-4364-4573-b12c-39b42d95a4b3@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/09/2026 0:40, Sagi Grimberg wrote:
>
>
> On 10/09/2026 18:48, Andrew Stellman wrote:
>> nvmet_ns_ana_grpid_store() and nvmet_ana_groups_make_group() accept an
>> ANA group ID in the closed range 1..NVMET_MAX_ANAGRPS, but then pass it
>> through array_index_nospec() with NVMET_MAX_ANAGRPS as the size.  That
>> helper treats the size as a half-open bound, so the maximum valid ID,
>> 128, is rewritten to 0.
>>
>> nvmet_ana_group_enabled[] is NVMET_MAX_ANAGRPS + 1 entries wide, so
>> index 128 is a valid slot, and the controller advertises ANAGRPMAX =
>> NVMET_MAX_ANAGRPS.  NVMe Base Specification 2.4, section 8.1.1
>> (Asymmetric Namespace Access Reporting), "ANA Groups", defines a valid
>> ANA Group Identifier as "a non-zero value that is less than or equal to
>> ANAGRPMAX".
>>
>> Two visible effects.  Writing 128 to a namespace's ana_grpid succeeds
>> but the namespace lands in the reserved group 0, which Identify
>> Namespace then reports.  Creating and removing ports/N/ana_groups/128
>> increments slot 0 on create but decrements slot 128 on release, leaving
>> nvmet_ana_group_enabled[128] at 0xffffffff, so every subsequent ANA log
>> page reports a group 128 with no namespaces in the Inaccessible state.
>>
>> Use NVMET_MAX_ANAGRPS + 1 as the array_index_nospec() bound at both
>> sites, matching the array's actual size.  A namespace assigned to group
>> 128 now follows the same path as any other group: its ANA state is
>> Inaccessible until ports/N/ana_groups/128 is created and configured,
>> where before it sat in group 0 with an uninitialized state and I/O was
>> allowed.
>>
>> Tested on 7.3.0-rc1-qpb-cc-base+ (unpatched) and 
>> 7.3.0-rc1-qpb-cc-anagrpid+
>> (patched) in an arm64 QEMU guest with nvmet over NVMe/TCP to
>> 127.0.0.1.  Before: ana_grpid written as 128 reads back 0, and the ANA
>> log after mkdir+rmdir of ana_groups/128 lists group 128 with nnsids 0,
>> state inaccessible.  After: ana_grpid reads back 128 and the ANA log
>> lists only group 1.
>>
>> The issue was found by Claude Opus 5 running Quality Playbook, an
>> LLM-driven code review tool:
>> https://github.com/andrewstellman/quality-playbook
>>
>> Fixes: 20dc66f2d76b ("nvme: prevent potential spectre v1 gadget")
>> Assisted-by: Claude:claude-opus-5 [Quality Playbook]
>> Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
>> ---
>>   drivers/nvme/target/configfs.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/nvme/target/configfs.c 
>> b/drivers/nvme/target/configfs.c
>> index 413ee2d16d29..0d4c69c4697a 100644
>> --- a/drivers/nvme/target/configfs.c
>> +++ b/drivers/nvme/target/configfs.c
>> @@ -698,7 +698,7 @@ static ssize_t nvmet_ns_ana_grpid_store(struct 
>> config_item *item,
>>         down_write(&nvmet_ana_sem);
>>       oldgrpid = ns->anagrpid;
>> -    newgrpid = array_index_nospec(newgrpid, NVMET_MAX_ANAGRPS);
>> +    newgrpid = array_index_nospec(newgrpid, NVMET_MAX_ANAGRPS + 1);
>
> There is a condition above:

--
         if (grpid <= 1 || grpid > NVMET_MAX_ANAGRPS)
                 goto out;
--

I assume that this patch was not tested?
