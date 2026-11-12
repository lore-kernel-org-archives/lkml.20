Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502723;
	b=rqXP6jHgc9lM2b0zSHbSFGHlHrJy6OkehHczoMDrI+BI/e/c93eqdGlDwqM0MmBq5SNS
	 WB9BG8LCu7vnK8sl2XzeFYRb5ADz3LQGpKydNitgoDWrc/SJhMlQcF1r8CXdK6jxAM1aO
	 1anm5OYmCRkNh/AcWLz5Z2jcu1pYV3mm9FpeSUqLaoT2+Qo2TAx+zeQybG8CtYd950+T+
	 QIo6TxvsXA/FC5Kuexy7K+maLe2VT7wOypy5gEZaoPo//fBB1Ug6dEr3wPfsNH7on+tpP
	 kJpAWp2TyukPIu+ntKrFfHDc7OJWsusH8jizlXTz/jT/ek41RbcJKeughmKC4EXPNmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ku64OzmACMW70GnGPBtDLvhYjheHShhvEhRP7gtzIhs=;
	b=YIQ1bVwuB5mb7/xf3dKaXWioicOz8CNoARAhDG2jTZ0A8mKc1e2aQZXPfRTmLzApGEhw
	 p3xLFINo8SgBld8jSr90jLv0MO3EcqhU+4OCHXoCQs0iV1CENCzsCIpGn74/aWHdfBR2I
	 A0tZtr3pL+EgMGV7ghaX6D2TN93xhnHA1kDN4LDl9m51YGj0RWD9MvmjeHdKDKZejfdWT
	 A6E8FzvBmnQitsbyZGcsPEoMPVK1zFBpuU8SGiU3t40tZWOuhG9bTDRa3glr5+9U7iR6v
	 k3DJRvMpJXexdPXZBBi52wnJgtXYTJRmOWPy3LmKQ4voGq0TAVYd2QhyEu6cYBUL2Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PWL9e+/q";
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EECC606A331
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EECC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PWL9e+/q
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ede7cb02daso9103255ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794502722; x=1795107522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ku64OzmACMW70GnGPBtDLvhYjheHShhvEhRP7gtzIhs=;
        b=PWL9e+/qTxQeGLD60f5nw9247Os7SPFeWMcFJeN3OL3cbzD1F7GSu6CsvCln8hFd8C
         0mT4Ttcv8mkxKd7NdgusdNxxx1y+bvjJlv8uOhOzhG92Og+J5eLHJZ+VSlDMhH1yK2KQ
         ec6PXNGon2ZB3KxOAFlZUcQwrUG6RomwEd3oWbnJeKark+CFNURTupVFrMfo4YUASCpt
         zM2EYsvzRjy9qlMFUXThBeKM3TpfxXyyhNLv02rlHzHOKrenmF6mXI1vMaloj4IptHCS
         LTWzFuoXg42FZbD2S4s01zHclI0AGIiCSV4GHncAZqxvp/t9Fc+EpgzIWrsVk1W/+yuM
         gWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502722; x=1795107522;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ku64OzmACMW70GnGPBtDLvhYjheHShhvEhRP7gtzIhs=;
        b=QFi6i5dtBGNTRBNDAmUh5K+Hks4+lQNIsDt4TsltJjFS6r9DVFJKemaK3FkWza3bnT
         y31OJw0IeJdM6DS404CS4NNCZ89czWaXBKc5l32pf2GJAMhQ1brD1LuAq4x30sd6HlsC
         pQ1J8xFMLBKmEcZlXaGO4/6+HfdT4prmUOiTKUQAQGTso2UEWdwy1Ok0X5laDG/oKv8x
         IauauWfQeDQap3c8LqzYcx01a6YucGVAaPkSmbLh8ZXkX4n+kSleN1kDrpHf1li1EHJ2
         gweGne5xA3EqMnqjEXFklfSZjtcxbmS0aWPM2vaEs+ijvT1XiDZCUQV5cpGVdqOMbuB3
         DJQQ==
X-Forwarded-Encrypted: i=1; AL+hErFNl2imou/p39gEml4rHuugfbqstnuhcvMkOagFGQ5VffxdbzWiCZj2y6jXu3hALLBs/MbpZ90cPP/4594=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lRzX9NSCq/90hXWW7Is8xEUJ+w/4ufgToevzHkNSh8TncSj++
	QS/SuS/+4DSMDN60n1T39hX5zhQ+/NoLZwOcdRXvst1Ih1NjGt0S8CKZ
X-Gm-Gg: AYBFou1+zSX4nKmUbzW+mYL/iyV8Gz8KKBurrWHhw6NlUh3Bqda5Pmv7Ud5663X9t1f
	px+nfflmuPPOCaU4Gzeoo/zMNBExc+Y5psmg7D6Lk//mInEvp25ZLvoQhgs8YqyUyhotuu3KAHA
	eqYVbQBQcBSg02TSkUNu2xImSlp8g160Y7RbNafYUUHuoBxBoGbeSRO2xvCcLsHcNANKBvegiOI
	u1HaerOONNDD6F/BUpmLjJRpd9fAWypicZ9yvkM94o2nHEJ18ZwPxyLdNr2bYdpJvWgSBiLeW1v
	zoZYmCoxlGkMPUWwkg8mRv7BeGvqGZAMpIdeJ2uXiu/4HigvDUSKJdZDFaqE3R7+hedO6lg0qqJ
	ZVbHepl+2cMOgj6Ccg15PcjRrszFA1Dg6kgPok944J6GAuE8h8e4ZEtFMzUUenYfmY4TIRoTCI8
	ir6cgQHLjvdTiKYrHpIjMCuljbNX9Yft8ZwLxwyU6G7WBIgEDOirW/Os7R/PPA/67ri73017mKe
	rh3ih2Gq6PVUBtjb9ytPhB+Gwhdn3AO3a0X0Wc54yavWD9f19Zod9Kz58lkeUZu63H3GUZBAwfz
	KI+C9auLcogpvCpVbtdyHNFva96DN6p4FcEsTjk=
X-Received: by 2002:a17:90b:1c0c:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3b197caa743mr2304014a91.24.1794502722188;
        Thu, 12 Nov 2026 08:58:42 -0800 (PST)
Received: from [192.168.8.247] ([79.127.217.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm5368094a91.16.2026.11.12.08.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:58:41 -0800 (PST)
Message-ID: <d259e498-5cc6-4e23-a589-cdffce1764e9@gmail.com>
Date: Thu, 12 Nov 2026 08:58:40 -0800
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
Subject: Re: [PATCH 0/2] EDAC/i5000: Fix the slot loop and re-enable the
 driver
To: Borislav Petkov <bp@alien8.de>
Cc: Tony Luck <tony.luck@intel.com>, Aristeu Rozanski <aris@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261111232529.407154-1-andrew.luebke@gmail.com>
 <20261112001752.GCavUFsCwZIRkfLI7T@fat_crate.local>
Content-Language: en-US
From: Andrew Luebke <andrew.luebke@gmail.com>
In-Reply-To: <20261112001752.GCavUFsCwZIRkfLI7T@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 > was all the energy you've spent on fixing this
 > - especially the AI tokens - worth the effort?

For me, yes. I still test and repair old medical equipment built on the
xw8400 and xw6400 (as well as even older systems), and FB-DIMMs are the
part that fails. Having EDAC name the slot beats swapping sticks.

 > can I jot you down as the one who will be testing any future
 > patches for that driver?

Yes, please do. I have the hardware on the bench, with single- and
dual-ranked FB-DIMMs, and can test patches on request.

On 11/11/26 4:17 PM, Borislav Petkov wrote:
> On Wed, Nov 11, 2026 at 03:25:27PM -0800, Andrew Luebke wrote:
>> Analysis and test kernels were prepared with LLM help; the tests ran on my
>> hardware.
> Just out of curiosity, was all the energy you've spent on fixing this
> - especially the AI tokens - worth the effort?
>
> This chip is documented on something called the retro web:
> https://theretroweb.com/chips/317 and it says it is from 2006 and it sports
> DDR2 memory. So that is retro alright.
>
> The HP xw8400 has a whopping quad-core Xeon in it.
>
> But whatever...
>
> Now, if you really wanna do this, can I jot you down as the one who will be
> testing any future patches for that driver?
>
