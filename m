Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291514;
	b=2gNd1GmuiX7DRzH3AgmdAtjHi7dnaeiTxQP/14QVXsFVw/K2XxQgE6HBZ8F4KAwsEIRY
	 Y38Sc/YmhKS42y/7VDD5y/knBZTp+VgEVrvIaGr+mn0djZwX7d2xeT9BGNu5Lyn87fTHV
	 a7dhJdVoAyiJi9/UAuMNAemJI/z92CY4DAsJJFS5KlXP9XZZGyoaf90BJ48LkjDF1fDw5
	 XAh+vHTJKIVYlGOC6YNpqCnx7eLA0DMmTM0JYIxvcVKho3SKY8dtDe5mxrisS9TFV6qac
	 kB8JDhXP6soGkN0FdIWLWc5W+TFPDFxf4y4YqoN12esm53hyv7JelPa+ryRjd3L5ODA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=alj3tH3ZvQk6KSugbPj+OZJPkIUe62frupKKgUNXdQQ=;
	b=LWcvdyA3ULAKr1b5+Sx1jPBGf7TRMliNaOVjbKoSCwFrpqiBg9XVUdZaF4Gy6MbuXoqW
	 Y8tapw/Qh7oKd0oz6E9eBFnCMJNiWIpSA5s33fls6uzD6jQPmj/cuef1b+A8xnnz7IQjJ
	 qTfY2C3rNFezibp1mE10/Krd3BiHzKT2xu56hBuw7+tSQJIWGUlopbDq1GZ3CNnrfOojl
	 5AYtydSKATR9l/NEGBBbCSwiz6HizirEyi9CsT+TcmkWpJJ/V3YOviB6qvY+4H14G/WjM
	 eubvd/1R5j5wioJaTNynKNTpDz28LcoDYr+93i0PKqO4WxfxNulRN1pqlrmV9IwrPXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="IlRv/HB4";
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69CC606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E69CC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=IlRv/HB4
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5366463571cso30391791cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793291513; x=1793896313; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=alj3tH3ZvQk6KSugbPj+OZJPkIUe62frupKKgUNXdQQ=;
        b=IlRv/HB4pmk2+NxDwLfzjqCWH3uxCqOqqAYfjoJrsB6PHzPrgpOVmjoBbbHu0kUXsb
         PmW035eG/8UmGcDM424KwPgIj46Uwvl7/rkF7JXc4/YhX4FR14YSKjJkOW6U7bjgF28V
         0+3bqPsqxEXdwAtmgf1gIKhfH6yGdmXha5H7QYRjbT5RpWx4pHkOSQrs/Kj3lM5DxV43
         IWn7oGS9HKBkwd7T3+x9jFb69pxrdDF0u5Tk9LLDRqSuhwCZ4toGXMb19InDBaA8ucy/
         R/f9hQKU69V6OkYk1V+Hcs5iyUuPdS7SACfis+Ldliq0DOqg8D5ttsu1WrxHB3mdMTqe
         q+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291513; x=1793896313;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alj3tH3ZvQk6KSugbPj+OZJPkIUe62frupKKgUNXdQQ=;
        b=O1H+ruXwXLvOOzNe0OluUJuMKEzD+4yv04+YV17S9W1SOUlbS+yPcG5A2PD1SXowS3
         xfWvDk0qzxoudieiuVYt5gY6M6CGZzGeULpHTGpGhaVUQqTeNq5aUbYzq/sQ1CjW6O7q
         G4IJx4ebqg8/CLr7KhuQdp+XJVkYTo8QluJlcBn5M6AfKOhwV7rufIWtl4vcOxSw9rFs
         NgYqh3kHh3xRqCxfPtbu4dKFucQ2mkVXPQKEmz86hDdt5shnnn3f0Nmrr3UwIgxRR1fx
         TXLatPZU+KwdWizddnWbvWaS3wBbIYNPjvcIKYeRhYnv/wfRF7+3yhbfk9TgG43SGqTE
         CCNA==
X-Forwarded-Encrypted: i=1; AKwUvByIoUARzAWLLm8gxjsIeleoqxk4ZG7PdiltgygjH1ybppETAQPI6LwNqElxYyHco3Et/GPVI5gmeHWGJLg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIz+6dOSg2i+Bsao+zgI1ZofbiIeX+g8VoK5aVOH9Jb5PBjiWlB
	4h+TsHvEm+VQDUg5bADcXkPVP53bZVHW2KzYa4RCUM3oijE1FnOn+w8R0NT6y2MOlY8=
X-Gm-Gg: AYBFou1LwwZZmi5q7dgTT/FrqQJz9gcKIq9gXqibcbaQcltlUKEBtGDIEITnKw0FpIo
	q8J4yJaMLRPeaABz6CSOEwC5N8h3rySnSG/vYlqA7+ZGwyWfI+HaehSh0u/ViLs1ZF5S4+xFron
	VCkfkCstwSmJXQu1WwxAEWll95N406HRRLdu0SNA2QAqR9dVXseIEDhNbdzROHphE64EeKLKL1T
	1sVuNAIekvZi1DFvOXQfDdCmBS7midGF81tQtwIj1GuuoKAPJFDM1cpw9rHGFLxQHsfrpnP2CPi
	/AzZDINEAHvxViE3TY7zZUwdp6WrWfq55mnObiPcT2gI2EhTDVUm5sQlh1FcDu2T8cZVB54kvQl
	2mKCqEWHdtTBOBU4D3meeNyZ1114mDc6v8iDo2S+bsKHe89b+OyJtaIlPQrZi/eaMShv4deaxxm
	ToKHuIXsv7GkyNFCHUH70P/n19FVLIezCMpN0kEkjSUSd+uFJmy1YOJHBxNwVC0Lbqu11PEug2E
	9PMy7QQZ1ERs/Zk7NZn89gAW7XtsQoEH3d/oXSgH8EIVZi9cOL3XMe5fjmZ9SGpmFi4yvvsvmDG
	WsU46eJufFpA8ADGmXajNWkluLsaCfCBGkTOYq7hPGR6Ir1CB3XdAh96LsW7XaatTplE18EiUqS
	Y
X-Received: by 2002:a05:622a:888f:b0:535:a5fc:3b58 with SMTP id d75a77b69052e-53fcd191600mr104371091cf.68.1793291512757;
        Thu, 29 Oct 2026 09:31:52 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5428cccee9asm45321cf.13.2026.10.29.09.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:31:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 1/8] mm/page_alloc: reset can_retry_reserves when
 the slowpath restarts
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, muchun.song@linux.dev, 
 osalvador@suse.de, david@kernel.org, akpm@linux-foundation.org, 
 ziy@nvidia.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
 ying.huang@linux.alibaba.com, ljs@kernel.org, liam@infradead.org, 
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
 brendan.jackman@linux.dev, hannes@cmpxchg.org, mgorman@techsingularity.net, 
 anshuman.khandual@arm.com, stable@vger.kernel.org
In-Reply-To: <68fd8182-cdfb-4f11-95de-1472e6c92d33@kernel.org>
References: <20261028211930.3504634-1-gourry@gourry.net>
 <20261028211930.3504634-2-gourry@gourry.net>
 <68fd8182-cdfb-4f11-95de-1472e6c92d33@kernel.org>
Date: Thu, 29 Oct 2026 12:31:48 -0400
Message-Id: <179329150807.2127828.16376500334625424120.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-29 14:37 +0100, Vlastimil Babka (SUSE) wrote:
> On 10/28/26 22:19, Gregory Price (Meta) wrote:
> > Commit 2c4c3e29897d ("mm/page_alloc: simplify __alloc_pages_slowpath()
> > flow") retries an allocation once with reserve_flags when the caller
> > becomes eligible for reserves, guarded by can_retry_reserves.  The flag
> > is set at its declaration and never reset.
> > 
> > A restart after a cpuset update or a zonelist rebuild drops
> > reserve_flags
> 
> I don't follow, nothing "drops reserve_flags"? after the restart,
> there will still be a get_page_from_freelist() without them followed by
> get_page_from_freelist() with them, right?
> 

"Drops" is the wrong word, sorry.

After a restart the reserve bits are recomputed, but can_retry_reserves
is already false.  As a result no-reclaim/PF_MEMALLOC callers don't
get a reserve-retry attempt (we just exit w/ nopage).

Reclaim callers are fine.

This problem exists regardless of the rest of the series.

But you're right, I will rework the commit message.


> > Reset can_retry_reserves at restart.  Only a cpuset or zonelist change
> > restarts the slowpath, so the retry still runs at most once per change.
> > 
> > With kprobes failing every attempt without reserves and the first with
> > them, and a memory block onlined during the walk, the allocation
> > returned NULL in 3 of 3 runs, and a page in 3 of 3 with this change.
> 
> So IIUC the allocation was racing with a memory online in a way that it
> would fail if the online happened fully after the allocation. So this just
> turns part of the race window into the allocation's favor?
>
> I mean it's not wrong and if patch 5 depends on it (unless it also only
> fixes a racy window in the same way I think is happening here) then so be
> it. But the commit log would need correcting.
>

Not quite - without the online it would have succeeded.  The zonelist
rebuild rewrites the lists in-place, so a concurrent walk can miss valid
zones or pick the wrong zone.  The rest of the series detects more of
these restart scenarios.

Those restarts then exacerbate the issue this patch resolves.  For
example, patch 5 would free a reserve allocation that succeeded - and
then fail because can_retry_reserves is already false.

-- 
~Gregory

