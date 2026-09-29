Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709D22EEE79
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647296; cv=none; b=SQDr7uVFpHc8D12mchs6DjjIPCRupDji5c5f5VUcOGs2svw0dboEnsbpIF4t3YePBgaScPV/4afLqnExMTxuXs3V7Lria5P5h2GUAUdFv6gWmL9R+sLiXI9gmIUCRA5V7+VbZGN9BzQh1gx4U5P8k41TogxsbfJCurYEPvlItSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647296; c=relaxed/simple;
	bh=0GxvZMjD/v3XCVlggilDUels1loLNShD+5LLUXiTvwk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=GIOYJ4PaXeJmIrVG94ZmMGfRQnszBANHb/yF/MBMVDpHc9nP7rp0g9fWMrKo4yqOPTk7uLOscAvgdmBx6lSVtfHNVQnbC6EPqLHzBlC/U0Uo/jwqI8rlPwZ7A/J/4s9Cb2/1m+HhPT1GFKqm8mZjueyVLQhNwlJ/SPsZQYQJtC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQT/oftm; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQT/oftm"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b223602d7so181616eec.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790647294; x=1791252094; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0g58I4h4nmwVw9ZB8EVoFTUYEfVp+7fY00zUlya+KGY=;
        b=aQT/oftm/gcadaHCpceSMeWABITOkz91ImB39O3/uepsaocE/hvANrO/9fWFsL1LH9
         bdEZAA5XexcMJSaFnQLz4vOvW38hLKWogrpE+lv4a3qm+kqBFQSsg2YVcmpvCYyY5Y0L
         KkCmcyxLb3iyt6Xg1V1N9mdNkcw9tVUx6wJeuce96WPY51DhUeKmdvc9wD/QWZpfBzMa
         6KaUttWvicWXrAW9qoKEFBwHc+1QdoCjOD8WkoHPA3x/WzFlnmL2XTfYkF6vkyTWuq0W
         hfPovdpRUyc5FsTwCqcDtzesix85CNBDMba/aVHFaUbSD/l2sJg9+Y/G4r4vZYT7zcD1
         Qikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790647294; x=1791252094;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0g58I4h4nmwVw9ZB8EVoFTUYEfVp+7fY00zUlya+KGY=;
        b=YWYp67WiZezX5T3v6uVXP7MDrYIkq672z8Pyy74AF+aU4pRGi2Qy+A5WQ1IEsq+Us9
         27nWv1LyXtcYP4k94jCnsqCdpSv0w4kQxwAI1QNMCXvTrloy/76WIcGGSqQTWGpMuiiA
         z12uwrmjQKN/6j1iAMWnXUTj4adN+eZ5SbMJI6CY69CCyebbdukxJ50lDHl2OErooAG3
         EBhu24InpeUWZav5s7+/j2s2E4A9L24/SLzYCItFDiIpFsgd5fk039SuEaKdL3ROBvP1
         ngfb6PbEpUDTltyyfcfLAGIOUBRJlkUzlzeN5DsEhA4JDmMT42uuwic8X2ORDoVWxQxO
         qG6w==
X-Forwarded-Encrypted: i=1; AKwUvBy0GvrIaYBxCZwmzFOOWkpFyVm9CXqxnh8OztDp23qjW7iTElg/JGXMJXEUddX1m27vt8LOR6QR7Do4ZQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpBigPgF6U/xPcDXyY1Z+BZFIgYWrG75oUsQdzoM9keUPG9wdZ
	UjbbcPswVExfc9yjTQaOajBT6xG8fXKr39P0GvsbfCFZMehT3FpRz+1M
X-Gm-Gg: AYBFou14f+0O6mb2l8I+6FHz3TwdAA9b4yg15dO3O7gHIL43I/rMJOfF8/cyQH8ATPe
	R74UCqbqv8+DdveU/cG2clzAGQEwDIHa69QqvK09BHDS8flxUHuLaokzwUPQTk4w1QfejCVRPcp
	likspPMEoBdsC8lDiTD0ehjRzsV3JxHNBqHKMfnG0gdM3EANN4OFCx3MGRb+a2zA/l8MqoEwvRA
	N43tC3YQhf4rS0O+MI+MSvPGTYbrM1FKHkHErUMHLdPCxCIi8eowcbo4icF2U+agG2T7oJhywkH
	cZ+N2Y/rqOUPSoyjjj0kOstc6pCnZqWVtnMLt3fhchDCr4BsZv6gCDgEPBUVPItz/UTW54KoL6w
	BnMKh0n38MdGyNWv4EHul37PBftChuU+BdQzYfEs0LExkB9eFjb49KBTOmtU4Y9pG2UBwMrwpL6
	YdUKWU5qlQTs6hdafQC7uKpKkjAo8adEP9KMf1u2d+fLxLdkD6u6ETXLkbMzmEYLDIi+//+AGGl
	OGQzpExhejGrJOPP+q8an40GlUzNkczfvUN+1UlVFQz36xvDkyd2ufjPs8SYmiU
X-Received: by 2002:a05:7300:16a8:b0:342:4a2f:49eb with SMTP id 5a478bee46e88-34272b4bc8cmr11854243eec.38.1790647294257;
        Mon, 28 Sep 2026 19:01:34 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-342c9c245a7sm22818699eec.11.2026.09.28.19.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:01:32 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Muchun Song <muchun.song@linux.dev>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Muchun Song <songmuchun@bytedance.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Qi Zheng <qi.zheng@linux.dev>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 0/6] mm: Unify device DAX and HugeTLB vmemmap population paths
In-Reply-To: <655A7615-5885-4733-9E4E-3BDA1FE39362@linux.dev>
Date: Tue, 29 Sep 2026 07:27:09 +0530
Message-ID: <o6dgkefe.ritesh.list@gmail.com>
References: <20260924075259.2013039-1-songmuchun@bytedance.com> <607759bf-59f2-4ad6-b95b-e780ed2acba3@kernel.org> <8385F749-0F72-494E-9CA2-2E433A066712@linux.dev> <se2tjmpk.ritesh.list@gmail.com> <655A7615-5885-4733-9E4E-3BDA1FE39362@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Muchun Song <muchun.song@linux.dev> writes:

>> On Sep 29, 2026, at 01:43, Ritesh Harjani (IBM) <ritesh.list@gmail.com> wrote:
>> 
>> Muchun Song <muchun.song@linux.dev> writes:
>> 
>>> 
>>> If you're planning to review this series, I'd suggest waiting for my rebased
>>> version.
>>> 
>> 
>> Hello Muchun,
>
> Hi,
>
>> 
>> Thanks for taking care of powerpc side of the changes. Is it possible to
>> share your git/github tree somewhere? Sorry, but it's hard to follow
>> which series is based on which and the overall multi-series is based on
>> which upstream tree. If you could share your updated tree somewhere -
>> that would make my life simpler.
>
> Thanks. For now I'll follow David's suggestion and explicitly note which
> MM branch each series is based on. That should make things clearer early on.
>
> I'll also try to set up a tree later and share it once it's ready. Until
> then, let me know if a written summary of the branch/dependency order would
> help.
>

Written summary should be good too! Earlier I tried applying on few
trees, but I wasn't able to - hence checked for it. If you can share
which tree and/or tag/commit-id should I apply and the order of your
multi-series - that would help.

> Thanks for bearing with me while I get that sorted out.
>

Thanks a lot!

-ritesh

