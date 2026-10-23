Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757792;
	b=e+jP51Ci0NvObaI2w+EHwegCsuz520n+KFhvYNM7cMDFJ1TYtyIYM9t/UKwJ4gDKQapf
	 tUr78u3FIJ6pGa2MS8rZM+rHgz7EpeSlnUzeT00k7EOPKkBMDGePLwrs4Nie97knBDUO9
	 hlvMvqx1Gr8+x5l0uo0XWczL9DB0KbTCOKCF7qn/GsRdK9Z4FeE7H5rkFkiMnF1qF0MQP
	 MCq/31bBHGOaEcWNma0V0IdZmF5om5E4jjQK0/XsnDNxiDEgsgcEbNc1oOGQEcihF6O3f
	 bG/R+oVb23t6lIIAccCfC05HWfTparfjIonsfY4SXJhhZBb6zp5HnG8VK6gL8btVvVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757792;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0xb8QBiYlV8bc6lTF32H9FrLD4GTaXT902tSotGd5HU=;
	b=F3+FVIF3hv84EAFWOMjbtDqgSnEioGyas3oHdOmh12NgCgTk0Tun0DrXkqRJDPGDgZM/
	 wQ7t2oXxH4XjUC/7kgMGWTQMtChCehpGEA20KmlhtWZQkeOQfTY2k/B/GuKgj4MdYfVRX
	 8m1g7fB5/UgVSQ20ti2DxIxz7QsWmuAYfJjYiqsZBnYHbulMdLgKH2NaTriIpT6WTq5Yp
	 mluA1quHnMKFgAZetQ8mIClZHgnJvtO89G+b/If9gJBf1O84hJZlw9qudJpFnJ3taQlC8
	 TUHqce7L85+m/MPXUUGbDd8S2P4vw5a1g+Ff3AO/dyhjCginKHwn+nFeSddCiuJNYyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WEJCeGrs;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EBF606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1EBF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WEJCeGrs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792757790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0xb8QBiYlV8bc6lTF32H9FrLD4GTaXT902tSotGd5HU=;
	b=WEJCeGrsDkR2fsm8lKaQawGfjk4kWXD0zQWb8Ossa9vzFo3h3aWcElSA/rK1pPG9p8Ik9v
	3DDpJSikc/i3GTr4+BE797Up6ecFi/zqOSrBA3NY0kKbIJdFTt0sSSYyazcAGPF5e0u3Dp
	fjXMXcIVRDk+TeNfMMTxAHrSLRbe9I4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-YRbYYKEVP5Kk-LZfdgdTXQ-1; Fri, 23 Oct 2026 08:16:29 -0400
X-MC-Unique: YRbYYKEVP5Kk-LZfdgdTXQ-1
X-Mimecast-MFC-AGG-ID: YRbYYKEVP5Kk-LZfdgdTXQ_1792757789
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b7e90fef1so38358726d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757789; x=1793362589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xb8QBiYlV8bc6lTF32H9FrLD4GTaXT902tSotGd5HU=;
        b=aqZYLZEqOvHcufw34N7tBvFLtZ1ih+8BcATUc4asK0MBHFhbcK2yUhafDkBbsWHRkD
         UKsrP62HZEW8+/wcv0zfVm0l0XvEgKXQPTN396jnRWZpem0l6g8A3haXt04bdanQGNsQ
         XCeRwqZLVwHFh9fLcdaU5jZvvxzyEQbIEZhsi8noEnp4Yh7Cdcw5RaCvp4Xxqechw3qz
         SSAAJI3fSXL+H0K3Dg7xZ/EypNOrIL5nwqHCN3gPSmQBvuEDIW+zLlwg5guZqS2zIxBy
         o2f7sSgo/SD8i5KuZQd4nq1yRNadzQhjlC9s1gMV282LVQ3bKFzLw4ysBjsQK4FTzF+y
         55iw==
X-Forwarded-Encrypted: i=1; AKwUvBwcuKXzrzujw6VPl9qdvZ08mHbndnBYIAYQscjQQg7e3h5WLvDBh/84NQUYfJdoaF0OHpuXaeG1XXNd/hw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIS37Abcs+K+B9Jcee5sYUR/RQgoHYPSeSi1sEpFLZgYoKMQ3Sq
	OpqvcL1RZgBEK0t5PnncW6RKAX3emYZ02n+LW9YKt0Pn5RXFkm6duibgvEgx1IS8BmeoNhBGWI3
	691p4kSyVV+iCk4+LWkzGksbNjW+GGgKdr68OhGNoyukkWZLtMr6ij35zj02QeMl1Ccc4LIgeIA
	==
X-Gm-Gg: AYBFou2JUDrEP6laX/bIxgHMKqARyBU2UBX/o37wuQeDHLpOX/q+PiTXWqV3h+NsPe3
	1EVdH4P1PpCnh8UMj3RxOTWLuE5hKakvtIaqnyiTcT+VTNsLA87gOKm87ZHBLpT9UorUH0np9Cz
	2sDK8N34Y4N/T6B8eqJDHl6BDy0eDu5ti3qFAcYwjYoGrGQ6v1SYGpEZDcuSST7v5M3+hBSlkDR
	4Qo4NMUbdJ4vuXWtSG+0QdiFShitS25FNBuAgaOmAyHHMJd3El4Z0OON9l9mjbvXLLI46SrZY/H
	UlHMQHCuQ6p8cjKfE7wA57FPZ7kUclhHxEAVwm15v1F07c1+k3xHHuH4ox30Yt4/Vp9G6y5FM+A
	Yojo=
X-Received: by 2002:a05:622a:a884:b0:535:52c:a2e2 with SMTP id d75a77b69052e-536c28b8afbmr21946121cf.20.1792757788583;
        Fri, 23 Oct 2026 05:16:28 -0700 (PDT)
X-Received: by 2002:a05:622a:a884:b0:535:52c:a2e2 with SMTP id d75a77b69052e-536c28b8afbmr21945551cf.20.1792757787980;
        Fri, 23 Oct 2026 05:16:27 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536c18b0e2asm14855791cf.28.2026.10.23.05.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:16:27 -0700 (PDT)
Message-ID: <50545ab3-bf06-456d-8d14-2536f90f6f65@redhat.com>
Date: Fri, 23 Oct 2026 08:16:26 -0400
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mremap() fails VMA expansion when VM_MIXEDMAP is set
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>,
 Jakub Matena <matenajakub@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261023023106.515365-1-luizcap@redhat.com>
 <8c53e58c-f7d2-4e98-8d03-7ff1163c1159@kernel.org> <atsYe34Qvw5oUDMZ@gremlin>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <atsYe34Qvw5oUDMZ@gremlin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/23/26 4:19 AM, Lorenzo Stoakes (ARM) wrote:
> On Fri, Oct 23, 2026 at 09:16:12AM +0200, Vlastimil Babka (SUSE) wrote:
>> On 10/23/26 04:31, Luiz Capitulino wrote:
> 
>>> This regression was introduced in v6.1 by commit ca3d76b0aa80 ("mm: add merging
>>> after mremap resize"). This commit changed mremap() to use vma_merge() instead
>>> of vma_adjust() for the expansion case. However, vma_merge() returns NULL for
>>> a VMA that has any of the VM_SPECIAL flags set.
>>
>> Hi,
>>
>> 6.1 was a rather long time ago. How was it discovered just now? I.e. what
>> use case broke by the change and prompted creating the reproducer?
>>
>> Vlastimil
>> Thanks,
> 
> Thanks, I have the same questions :)
> 
> Do always include that kind of information and whether it was an LLM-discovered
> thing or whether you had an actual workload that was impacted, etc.

Will do the next time, I claried the use-case in my response to
Vlastimil.

> 
> --
> Cheers, Lorenzo

