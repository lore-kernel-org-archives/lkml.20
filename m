Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501333;
	b=FrxteryoSQ3GvRrUV0Ma5CKu0u1hKnoyWr81IB7B18o/RBZPO8Ls8RWVtQObTGevPIQ6
	 4UNGJuCp3qhMkZedmb4RQHZVKU20ch67I9BBCxzUwvZi7xDwTGX1dZ18mNAf7jbERQKCa
	 8+cjAGHoYXe7ctli+lPnhwXfCm2LBybY2+JryQoU+bLwVb1RniM+xzqK0We7oWbAwJ/YS
	 OJbv7JrMmwfYIdAPpG1jwRFH8NvAeEWFkPCOa1hdbsE1c/FQgLwPB1OpB/Q/6YXViyCj+
	 GTr25gIdxvx5JTUgQrvGCI3Wi2IRIiYxkjeMGOo2NlQwMJYT1W+8ecFL79Do/7wOgmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501333;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=zidr50P/tGTG0fyue72d2UJbI2Rv5djOGtCARdBGkgo=;
	b=rONtOXaR7aklNmrRGW8GvZalkrDje+elFJPju3Thk8ru4HO5eBPu/zwxDyHBHdOJOPvf
	 rldrJp7qo2XSCb3D0aNkrb1h9r6zAdQ4KukR1IhiM7JiRCbcLMKW4E8/Yvjz3q1UBB8jo
	 CVKUbS+mT4IIeN5V1QSOTW17thQXt+AzuYje0iYzNgjnetg+KP07HrQB+NtemVd+5c6AP
	 aG3T89M2iGUWDs7/JfIHMRLmk/WGtf2hFrYA15BZJwhAfRiExNAhTe8kTJALjDMr+VI9J
	 BXBWDfmZP1OqE3kZKBkgnM8SNsPOs76JDGyaAlTjxxdyKMK1iazgqsyETDojlNJL3KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F3cN48X0;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=E3BZnvM2;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B90606A331
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7B90606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F3cN48X0;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=E3BZnvM2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794501331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zidr50P/tGTG0fyue72d2UJbI2Rv5djOGtCARdBGkgo=;
	b=F3cN48X05VyBgQ/C3QKv5gmTB46k94wHxBniNvLFvvKe+7RCFrfK25gE5B20tVOY1gAPoz
	Zv3PH50NPW1IuZEux814cZGbA9JJwqDbjdwFFXldhmF99tsuDGTrAeH9T8tlSTiIVQtanL
	Yk8trTMGMj2wxZnRbawuu6k9Ml7Dmqw=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-nqUPWY9aN22W3LyH8kZRDg-1; Thu, 12 Nov 2026 11:35:29 -0500
X-MC-Unique: nqUPWY9aN22W3LyH8kZRDg-1
X-Mimecast-MFC-AGG-ID: nqUPWY9aN22W3LyH8kZRDg_1794501328
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5c157b6cb9fso3432e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794501328; x=1795106128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zidr50P/tGTG0fyue72d2UJbI2Rv5djOGtCARdBGkgo=;
        b=E3BZnvM2+7QdjjkJcZW8UCYcmCDfPxWWzkX1PyVN0/h9nq9L258cYknPsS9ZhfbLqZ
         LJIgD5y/m7eDdQwdM3Rm0tKkKm1PPKxfNkFSOJ/Jj2KWncrm9quwQh0JqYj+njpBX+Nn
         otgisRn4ZuA30ScAJCCXcwkTs9j0bs21RcgByII/2f6pADinxWMRNDEFreGXaZ3l32OC
         lw8xjk1BPWiMb1KMBoiXQSYugpqXg9PsXCozQBchrgqy/IikYkDyYGV+Y2zM0EDbm3Vx
         xhHEOC8XXI5KfZWTD7n7i3OaULLr9w4P+8lYVm/kWDzb84wGBfeFiJp17dXfNsr0CBQN
         2WOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501328; x=1795106128;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zidr50P/tGTG0fyue72d2UJbI2Rv5djOGtCARdBGkgo=;
        b=mPNxDX0Vthsw48ztqtQpCc7myOd/bFvkSJuQOSkQrhPt0jUQ+DcY0xVQFCcVhXv+qP
         X/6FCi9riNeLQUQu7P2pMTZ+RS+WNIXzSAoGK3cm3NPlMWnWReFQ0kReKmrlDb/tREG0
         2RVczwFe1reCEYVF/ZWNijr43tOgFoSvfgPHDzcyT72Q5RPhNRazufibC9WgzNlRTjzH
         XqAM1omhVj4tUcQuEj11CPmLzGQ1tdYTaMTnMsxGkqOzWK3lvB485ljWZZjIJSCX2yOq
         fAVWjdqiY5zmhY04vFDftxJjY7BI8bGIiYfW9JPUrPO3pOsGmK0o8b4ZW+4VHWGeAZol
         ThxA==
X-Forwarded-Encrypted: i=1; AL+hErENNDBWDNiG+WpDDXkOdcrRYtLMJ0SbAmFzPPMCJvKsJHcu1yXtTEnBFtAH6XwViDousbiW5gwMessTYGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Gor6iE/BP6onXt3RjblCc+bjGcdtB0B64o3+9XGgZeqz1XHDz
	jA1Aaq4FPiChAHUzdZYm44iAtGkmXUeA2UG6kzfOsbMf5BLRGUxhJwLFmj6UZRW2vQuUSkBlKbH
	15jaYhrAMso5ufYtfHZN8fdQj+5mhUsQNdm2UJcv5ZZzhH23Z4s5Fsohz8uDg5F7s
X-Gm-Gg: AYBFou0l0sRwOP2Ni/d4E6ITT3gk1k764LH1YKZxS2iSff24DKdxIu8/azG6B4jgZLZ
	GoPmdab1S/BniXQZgQoxGM7z1KXCf3UCg8EjNEB/24Z0CaNeVLWOFPCgYGLlGIUjwiVQrKs70tv
	gUPdVFiD0JR+DvgFbtgevIT42LtGL7CD8+XpSHZE2RAQFW63x4CQI/hCT50Uwr8tc6tmNTDx3oQ
	UFZaDJdmurZEaoUCrKurUCoCiFJKimSPVpbOlErKvuqM95/xQ+YXI7ZrCFLScXD9J1I4K2oCoMQ
	YDOGMpxKGBMGuYmKYMHm7e8QIm8jMpr6MdXnZghQOMEueGRJvNYzQwSrQatVQb5LnQNoeA/bZwJ
	lZ+/Lyn80V14697+5PeRU9Haw3TYJqVIUxQVTNcCREFZivsqNOerxK/34NW1xkSEIEQxAIKFFYN
	gBZdpn
X-Received: by 2002:a05:6512:402a:b0:5c1:5be5:a543 with SMTP id 2adb3069b0e04-5c15d5a80b2mr2335299e87.9.1794501327773;
        Thu, 12 Nov 2026 08:35:27 -0800 (PST)
X-Received: by 2002:a05:6512:402a:b0:5c1:5be5:a543 with SMTP id 2adb3069b0e04-5c15d5a80b2mr2335272e87.9.1794501327252;
        Thu, 12 Nov 2026 08:35:27 -0800 (PST)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bab721sm1785202e87.40.2026.11.12.08.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:35:26 -0800 (PST)
Message-ID: <968f4667-ace0-49bf-a628-845c5fd577e4@redhat.com>
Date: Thu, 12 Nov 2026 18:35:25 +0200
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
Subject: Re: [PATCH v17 00/12] migrate on fault for device pages
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <20261103061629.972669-1-mpenttil@redhat.com>
 <avWpWBl1nPcRVmpQ@raptor> <79f33ab0-2e43-4efb-94d0-addaf40745ec@redhat.com>
 <avXoJSGh5xjGFgod@raptor>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <avXoJSGh5xjGFgod@raptor>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/12/26 18:24, Alexandru Elisei wrote:
> Hi Mika,
>
> On Thu, Nov 12, 2026 at 04:00:09PM +0200, Mika Penttilä wrote:
>> Hi Alexandru!
>>
>> On 11/12/26 13:56, Alexandru Elisei wrote:
>>> Hi Mika,
>>>
>>> I want to help getting this series merged, and I've been familiarizing myself
>>> with hmm and device migration, please bare with me if the questions I'm asking
>>> are obvious or downright silly.
>> Thanks for the interest and willing to help! I am preparing a v18 of the
>> series and plan to post it early next week.
> The series is big, and as far as I can tell the MM people are hard at work
> reviewing bug fixes. It might be better to wait a while, to give people a
> chance to have a look? I know that if I see a series being reposted often,
> I am less inclined to review the patches since probably a new iteration
> will be posted soon. But I can only speak for myself, you know best.
True, my motivation for quickish repost is to address sashiko concerns,
and after that give time to reviewers.
>
>> I try to answer your questions, there are quite a bunch of them!
> Thanks for your replies, it's going to take me a while to digest them.
> Despite the silence, I'm working on it!
Appreciate it!
>
> Thanks,


Thanks,
--Mika


> Alex
>

