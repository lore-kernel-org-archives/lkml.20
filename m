Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501870;
	b=0CvNAca2HzuMva6XX8Kc6l1WtHRl74BIez8OjET5vo3XzMS1HBRIreYg1yQeDXuflUnF
	 W26QPaCiCMEW/Dysy72ffuwbYAYKjXjJ7Bz4nAlzZZ9tuB9WzXbyJ2TR9cSivh/MvA9NI
	 XRi6poE6nQeMJUGCCPjWDPctLfAQAXiRqnzzSPMsLrtIjCEIkema+7ONggirI/rQCFYxi
	 nsqUWBYFKAUpBaMIH5FJjbpmLaZj+nBc9TtJG7d76SF+Y3wy7fYY3irJ0dSQ6iUZqQACu
	 hpY64nBV9yaSJ2KEv1YiE41WMQSmr/9ZJ2TOy0t+sbUnrQnZ/qpjRWK0vJ35y4Z/Www==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501870;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=W0tJRUuqq9I/mLQynKz/Dyg/O4hVratqHBUQ/E2JNFQ=;
	b=pzAs4W+JdN4pD7c6UIixlZjWU3W3yefWsjBaLyNWHufUZDzPNqCxGlF0LYz4fPdfDw9K
	 3ABQjXNpK2Y1pTenyc8lyxDGtTiOb62WL3e1Jh1TFRSwt7nVHKOldT2V4YaY1kxIY0jvs
	 Dl94ppJbWET6wqOFXAjRltN0pYZ6dmsw7br4QvctUXfJAP1n2OujjANOA9ABHPrWHQA2Q
	 5b6Rr5OudckkKSf/GufMSEQ5+F8coL8u/UglRLcLuzm1iz/rLnrIbPPf/yOH6jTA8u9nj
	 fPmq4ty6Z5WioUkseuMoVO2t0C8Q7nfg4mJ0xoMIUZoT9aJSjDYuH/GB4zjxyPaRXvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PCY4MVVt;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Pg1++4Ht;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0031D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0031D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PCY4MVVt;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Pg1++4Ht
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794501868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W0tJRUuqq9I/mLQynKz/Dyg/O4hVratqHBUQ/E2JNFQ=;
	b=PCY4MVVtjmr/1IB5tnQNj2pWBfHhK9Rg0cR9AlYKaDk3v7BXroYP/qWa66+bZZdR9RyIuh
	X+pkjNGtwPcSwMYidLdUyWv58DjVzK4lMAEL1RUhiojUuxeX6unNPEilQdy3Z9ZgYh8OL7
	2UtNC3asFQgtiAiQPdXzT4iwHj40w9k=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-JJx1Zqz6OtGn-rYi3x0b2A-1; Thu, 12 Nov 2026 11:44:26 -0500
X-MC-Unique: JJx1Zqz6OtGn-rYi3x0b2A-1
X-Mimecast-MFC-AGG-ID: JJx1Zqz6OtGn-rYi3x0b2A_1794501865
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5bfd95238e3so8943e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794501865; x=1795106665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0tJRUuqq9I/mLQynKz/Dyg/O4hVratqHBUQ/E2JNFQ=;
        b=Pg1++4HtMYk/RIAn8jHFo+/DPee4AzQYNXS1vZzB9EIUwS2yZ8/+plCquojLwb+7vL
         6I/kJkoKRilBa9wLuOFu2557ATnDlyYmkxlKQOm+/z6huUSIEof4QpSFVKU5ZZRt+3uN
         0nrzVH/3cG+fWPf+Gi1sb2jdWtoZXrblVZYCc57ViPObu3ckIfk3qmE21u4CsVBBJW9X
         95d+YHIUxhlYLfBxWd7BCBZ0jgTVnFWNZlhb8sW1V6ehtxA2V/ECta3Xpv1thJYt+xYn
         g1MOzPYJWo+VE6FmEnOl0an4IjMU4iA4WKfz93c5PsO9aMJT0kNXEqAb/G9yca50Lom7
         EC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501865; x=1795106665;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0tJRUuqq9I/mLQynKz/Dyg/O4hVratqHBUQ/E2JNFQ=;
        b=0Aig1wLDcMz8kpl7FPMQycdDlD35UKLmvut2XhaM7uuIpXSTt8k3dvvI/Uot4XaHn5
         yoMgg0JNNXp2oqeL65ESTNwOD1L8g0gg1YxPZNZI9U3kPShAXc+l+orTHfSkfAOCZbGp
         ZW0VfHbbFwik4t7mMEDQFra3eGHUkHqmkyZk5NvV2nbhGOD8E2hL3W7AIZKjm4Ty8TcQ
         wNQ3KEqAwTSEt0lvoWHOeNyWdopoM2R8ycsK2B3mxdKZketykTp4KF+4tB+dWXLJ5RqZ
         peaYpAlr9vdoyOXnR6xx8tnkX5oSuNgmtS9Zuiz/+lDGoU4AZzF5h6ClOfX9tops4g0G
         lA+A==
X-Forwarded-Encrypted: i=1; AL+hErEychSXQ4jxZWvS+l/0GKpEIino2UNSDVIuX6L+uAY9jbPqe9P98eJ6EKgCpUH23epYUpCFUp5DolmUNpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qVzfbahNFiCx6lTAsk1T/v7T4NUEh8B5upXD++97YEs7n1V/R
	Pw+nIHX7QJklerImt36SXmpv3dGKFRymXxun1FO8jqPoSgagFPmAAdwXgl9D1xsfMWeh4SgCbZQ
	0eFXhSKRa2zZIfbrfLJVscbOsPIuPp+OE3O0Tu0v/aFX0kJSh/urpwh4jEDmG/TOD
X-Gm-Gg: AYBFou2k7ThOwJfkGHkQ4DYSCM1DLjAAhW0bszlfQF60W07lXnVKpe93HLu4/oLVRxS
	xpIFVMd/4k4F1B8XjmHlAWNrVprZzn9r4RszlSpjDAPXa2DVpswgj8tJFPbZ1z+PXCeD8WKCkCQ
	R0jLeJDfV/1W3QA9jLvLbDjocygMICJ2bNl8NHXul56EEmkFoAlFk1WOXiNUwCIDWAHB7O5kryA
	9b+V33nTpmMBHHRo+V0IedXVQs9QlhmMro/bb6v4QObjZWjxNdT25T5aoLaA4lvFX6dqFZY5ivR
	U+JsU75JISZnCgMRBVYFwJiLpESmRoQ/ApB7+LuABR7fM0mgr2xHHFgJzl8wbU8nIcQnqG7vxN5
	9xYBqrEBx7YbdhkBNaikQIK2DDg5/6xft9SDW8u7KrjjkWgq2lEPM765tqSBm1+QwShPZ1yKgVB
	vy2c08
X-Received: by 2002:a05:6512:2303:b0:5bf:ca51:e2a6 with SMTP id 2adb3069b0e04-5c164ece630mr1090709e87.40.1794501864877;
        Thu, 12 Nov 2026 08:44:24 -0800 (PST)
X-Received: by 2002:a05:6512:2303:b0:5bf:ca51:e2a6 with SMTP id 2adb3069b0e04-5c164ece630mr1090706e87.40.1794501864387;
        Thu, 12 Nov 2026 08:44:24 -0800 (PST)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b780c49sm183231fa.19.2026.11.12.08.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:44:23 -0800 (PST)
Message-ID: <61e5e0ac-dfe2-4a5a-afee-873523df18e5@redhat.com>
Date: Thu, 12 Nov 2026 18:44:23 +0200
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
To: Zi Yan <ziy@nvidia.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <20261103061629.972669-1-mpenttil@redhat.com>
 <avWpWBl1nPcRVmpQ@raptor> <79f33ab0-2e43-4efb-94d0-addaf40745ec@redhat.com>
 <avXoJSGh5xjGFgod@raptor> <3A5BEC5A-BAFA-4541-8ACA-43E57C7DBCFD@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <3A5BEC5A-BAFA-4541-8ACA-43E57C7DBCFD@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/12/26 18:33, Zi Yan wrote:
> On 12 Nov 2026, at 11:24, Alexandru Elisei wrote:
>
>> Hi Mika,
>>
>> On Thu, Nov 12, 2026 at 04:00:09PM +0200, Mika Penttilä wrote:
>>> Hi Alexandru!
>>>
>>> On 11/12/26 13:56, Alexandru Elisei wrote:
>>>> Hi Mika,
>>>>
>>>> I want to help getting this series merged, and I've been familiarizing myself
>>>> with hmm and device migration, please bare with me if the questions I'm asking
>>>> are obvious or downright silly.
>>> Thanks for the interest and willing to help! I am preparing a v18 of the
>>> series and plan to post it early next week.
>> The series is big, and as far as I can tell the MM people are hard at work
>> reviewing bug fixes. It might be better to wait a while, to give people a
>> chance to have a look? I know that if I see a series being reposted often,
>> I am less inclined to review the patches since probably a new iteration
>> will be posted soon. But I can only speak for myself, you know best.
> Totally agree. It is better to wait until MM people finish the bug fixes.

I was going to send fix series to few regressions by earlier posting -
no new features or anything - with the mindset that it is better then to
review a fixed series than known buggy. 


>
> Thanks.
>
>
> Best Regards,

Thanks,

--Mika


> Yan, Zi
>

