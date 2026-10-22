Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678318;
	b=zwtH3wQRAgYCDEpAnrNy0p6pmN9LT7EA/vHMP4YZ5mWi3a5TUg0aHxq0EScWdqBm7u4Q
	 v+LmPzVjUTSpojp5iy19lJDbA2bNRvTPfb9TEyizvMGfYsBtCGxkMAiqsOCyMJmRDGNxy
	 mMwcwXKEAUwWDv0RctjBtCt6mwewqCq8kp1jn1E61NnHVZX0C8wk3fEEeptIhP/bZvVRE
	 y1WjMCJu8CH90L7+BV7VUMWZCUTt7SkHrt+0qCgrwlz3QLHZ7GnHYITm5lNrheKHuXUbI
	 GtTIu3jRIzldfPaGTBhENPzNDBkxoezQxk3BPqlFDH/PKrWfIRjcBALL6xCJX7tu3xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J0ObRZqURp05kcBQ0Zv+pu1j99ivc4QOppayGe5sXtU=;
	b=tBRxAPa9t9bPmwE/Zu0iTJrZE6qmVgIw7RnzWn3MPcdocwtbA7TL9acI/sp6WaoMGXl1
	 9UoMMG27/Yub/bwzvGjUp5YmB2SQ390t8vtFuxHPQ378V1pjCUMiTF7fQw//L38hkBFB+
	 0lu+2/aAkFalwrO2UwmKrxbdVvPVshF8VB7WGRNUy9eCBJw0dnZmFBVvhIFRDr5pdmWih
	 ec0XUW3TMVxtg6jzx7ttdW4huHPlVOwo2QsvcJsrFsmrYS+jwfCwhr1ydA/rXgr8ItDXg
	 8UxE0/KaRA+vN7YvIYpSoftPvYYYUDyRIPyGUEpMRNaJnBcqyVxDnSjWjeXpYAnE1qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=hspHbGix;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E1C606A322
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0E1C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=hspHbGix
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-917a6dccc60so12303296d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792678312; x=1793283112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J0ObRZqURp05kcBQ0Zv+pu1j99ivc4QOppayGe5sXtU=;
        b=hspHbGixeltXLiUWFKLsGHAgMKVn7rvek1mOKEilJTb8bqmvEgcqQyqX4UGFtDg0pK
         QQUrekoQdgImuSvigHwv42IcxDuOq2ghijqvNxgvS0lHBE6gcsdD8/JToNc8NHgkPGM/
         arEC5Ve8URC/4X3t4fGtPrWhiZiZ80aBMkXCwBKodF6s9uE/XC13TdyLK4U9DIoROqsn
         CWPCMQBu0Yd6Q8tqnH5rbDQHxGF6r9+MCJsMFTcqG+vtzsOIHNLFTHEE+kug9BdMuLy7
         G1d33p5icriK711BGr98viLfaK0ljpYlV9bAAaDA4rQIvyxHY0shQj9W8sKEFT+eLi0J
         tzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678312; x=1793283112;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0ObRZqURp05kcBQ0Zv+pu1j99ivc4QOppayGe5sXtU=;
        b=gyaGVfiPnB8tX1nFbjCmh5LFQpK5FKVBaRWdpmcPCzOfD0rbbb3WaMZDjU/+2l4/63
         LSeTjNfk2tqh7PiJfeUIRmzSLcYYt6XMjWzGjT1dHXJBnbfXftBnRBy0pnfYEzlR+tq9
         PKufThbpKIxcLS3pNeCMyUPB4KoIIXdHlC+q/n+62xDfqfRRQkKmoFyNtz+YBXdP8+7I
         Y47VNCXZHnLbkaC6WOsfzc78PRM8y+ywZrP16HOwXzqFd/SDzg2OA6y8gBR3Dy7Wexts
         gHp+YKCcgoJW9dwFmvy8e5k6W9sm9+dB/QNUAksLp0kCDJiVErElUnep7ScZFpfFH6NC
         guyA==
X-Forwarded-Encrypted: i=1; AKwUvBze57D9XZQEa/X33NY85RqKmObbJy+BQqsqcmAXHmd2SMbFHxHZD7hjzLW7jeQdbIFaQ7VMQA+VTcW5J1s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKopicCZkqDxPAJYmcI5CxoiQuyN+SEJImGCmDDQTDRF2OIBZ+W
	Ba6RWAAEp+AFR8SidKDfyUVesQyv9pEMwEC3vBSlbaCSj/0T65HThIPml0eesYbYCYU=
X-Gm-Gg: AYBFou3xYi+HlyAIqEUStwTkUWuHS/Lbx+Lw2HZgN1r1f3JbNvcS8KWJn62FCuhsnUe
	sPBDcMkYMRIl2HbaQH6RmkaV5faJfkBmf9Zi6woSRDslgZwtWCX+KbhRhxj9bEqmCTVIFJos1HA
	dUmoMh1ORRbsMzEa76lbj5kjyHAApm4GG79wtm8drUDGyfM/CBowKrb+cAAJLCszVNWciQ8eAX0
	QOAlOP6NS3f3+58iuqmWsd3Da6QLWHNZpNhrdJCmTpOjaxSa9HBdY7roPu2ORosb+4VSpHV3qvL
	yQMqs3jTNHhfSTi/N/5haAFIw1HNKDu4pg4ycEfSx8sbkoWwb28NkyxqEQQOVYrQ3x67PegPJ+e
	WqlcTsIKMK+dR7CRc5/058oIbZVWyMTeHorIKXpFozHCNO5WDGuMFkuoPsoHwqmtnBAhAgwGPRz
	lVqSYdvDvJME5vI6nNAcD7Caj7TqKiTbvFm4vXx89RwO5NeGf+/6v4bTOcsUVSSUhVLjnwHbrdm
	e3ivyXH5IiFQQdsaj2KZfZ6hvK2IHxGdSv8OaD3adKyfDsdyCUhr98UoQibJU/MDvnuXmEribUx
	2t7gsShDVoHXvjq77A7loSxeBnpttg6XCWgyVA==
X-Received: by 2002:a05:6214:29ed:b0:919:57a8:7537 with SMTP id 6a1803df08f44-91c232e5013mr44009236d6.18.1792678311640;
        Thu, 22 Oct 2026 07:11:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10c0bd4csm51371086d6.30.2026.10.22.07.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:11:51 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:11:49 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com,
	joshua.hahnjy@gmail.com, rakie.kim@sk.com,
	ying.huang@linux.alibaba.com, ljs@kernel.org, mhocko@suse.com,
	muchun.song@linux.dev, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, weixugc@google.com, cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC 0/2] mm: add source selectors to memory.reclaim
Message-ID: <atoZpXaCRc7etPW8@gourry-fedora-PF4VCD3F>
References: <20261019141401.11927-1-lizhe.67@bytedance.com>
 <atY-LD2AzCYATRii@gourry-fedora-PF4VCD3F>
 <30457046-a662-4ff7-a6a8-100398d7a806@bytedance.com>
 <179264138036.2549665.17429111144570830454.b4-reply@b4>
 <9b715272-3ed9-42da-a6ae-467e8ae00c0b@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b715272-3ed9-42da-a6ae-467e8ae00c0b@bytedance.com>

On Thu, Oct 22, 2026 at 05:43:49PM +0800, Li Zhe wrote:
> On 10/22/26 11:56 AM, Gregory Price (Meta) wrote:
> 
> So userspace cannot rely on one write to memory.reclaim to produce a
> final per-node distribution. The intended usage is a feedback loop: the
> controller observes the memcg's resident distribution, chooses the source
> nodes it wants to relieve, applies source-scoped reclaim pressure,
> observes the new distribution, and iterates.
>

I think the critical question is what CAN userspace rely on?

We can make a bunch of feedback loop interfaces, but there's no
guarantee they'll actually be useful.

> >
> > At the very least i think you need to add details in your cover that
> > demonstrates the process of doing something like per-node resident
> > ratios, and show that it works as you intend.
>
> Agreed. I will update the cover letter to make this model clearer. I
> will also make clear that source=nodes is not a final net per-node
> footprint guarantee and does not change memory.reclaim completion
> accounting.
> 

To be clear, I think not just making it clearer, but if you can show
some tests that demonstrate the reliable behavior of the interface
extension under different scenarios - that would be compelling.

~Gregory
