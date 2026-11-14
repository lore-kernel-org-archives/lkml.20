Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794687951;
	b=pA/2/N+BSIRtbp0rQ6Q68uhohgD88+0c6v66bL/J9FZMKZmv9/Bf/bUs1xW+7kcktMRQ
	 nKvWH84AmQ8iQ8ExK9m+WXGnvQowyPqAOLHXpD2Dr7YBl80IMXxv5/FOSUDS6su2z79DL
	 JD+FXAwEhy4Hrb21Zgq3LBXyYhiHD9aJ/Ua+Fvy3P0jJFzHky0siD1oY8xMvoQQ3feAQy
	 3Uc6JpkajHIvORFT1yVO3UfUQY5zqWSERaRhf6a9PC8gx4LMQrzvqhUS3Y6/2WkaOf4ro
	 AqBcol4VLXUbXZlQXHHgxKmjDMNYD4LFg0YICPpaQEkL2C4K8ykyRbMezCSFbAlLI1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794687951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=uhFgL5mQ4FmBEnWXxDB8G4YBTGpdQKsK7XBv176IhtY=;
	b=oxGZFC+hF4jYvaLXi29R6OhLD8jn2T4LVU6j7zn9TA9Mjr+zWhwWXloL8Pi6Vjcwoljv
	 pgtSmrv76Tw8IQ0i6wjyiJMaSR/qTlzoE/05sAWTIF8UmDBF2mc2Jlefujd/D2N0/aPtt
	 9DVHFP0PoGkY36GCqMxo0hkBnuV6ZHBMXdQe1TbQkxj4Htir3EHbpp4OanaW7gXgEcPiO
	 EFM/TvaPHDmY1rhpECAg4SLFReiriWpnKAURfzfzBwpyfcUIZF5m/Jfwg9Lb2opDW2avi
	 e+JZDg8aQBEvTPDHcxCe3kWidUaawFCMKAKHD06popdJYlDw5p/0HlbQMnCvP82nIjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Umr5E+Um;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DC6606A880
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38DC6606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Umr5E+Um
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-55ade1de0b4so31809941cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794687950; x=1795292750; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uhFgL5mQ4FmBEnWXxDB8G4YBTGpdQKsK7XBv176IhtY=;
        b=Umr5E+UmqmQJUEtXniscPQJbti6YD2DHitWwub7Ht3Og9pJeig5ihXV2Z4T9u/CQar
         ELecvn5Etdz2Cp5NYxT0dDCgI+3y3/csLjrjwcVOzDvq9Ixd4fJ2N/GTi/XLkUaTDgX1
         i0ICXQzR7wbfXQB/GV7oZJuG3JWcxo605hw4EBuSlfDunXA0mUsNN1DLC3CPc8h6OrlV
         AdD7yEtHYuI6saCYQnVwVFhNbkOuTy8TawCgHFcx84SLpC0DPVu+Gc5lA2eMkrpUB4IY
         NWqX7nqtqf59Xs2h8IB2WJgW3S+bQjvcaGi34kiAmjO1HyPcFnDvoNJJQ6aA/sXkaY7i
         R+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794687950; x=1795292750;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhFgL5mQ4FmBEnWXxDB8G4YBTGpdQKsK7XBv176IhtY=;
        b=O0iBdkG0EU6/Wg7xyG7PyINMQQ9gUSdEpg53q6GJxKBqzBnwtwbBxcpSQoZgsLBPQw
         cLKdlcUVHx60QMsezAJTVEpcJMlaoxyi6V84kfRbr64H9TPUgVnONeqfWW48W8qyQ8w8
         xIeL/dqsNDsC0CIOtf/Y7vUhErawOUEeSPoZf6gvDAYosw5wM0Jw3kOQwxvOeSGrbTON
         Nq+1d9UAkAFm6ZTiwKwghofeyDl4vI1Zvu9JCgdVmrClu7q35c4mVUfgd8x4eOj+JmZK
         iO1DKGM2TtTZmmjUvtbRGx36bbHQNBxeaEUQTQ6VIWj2oOxR/sS/v0yA/uWvflaKFpo9
         U4EA==
X-Forwarded-Encrypted: i=1; AL+hErE2QL52jR+OVokmTBFulHuTyhVUUQMZhFQGIC+7AX6WpMx3DTQwTWqK5cDK29hPLSvW6fvz4av9JIAoFdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Lz4yo8+D2nIFNedOUvv1UzLQG+5FWerkMlDbVRwnwsX5rUhfN
	SbO7sS1yGO5/awNsp1K+/pgehnW5G6zQ+V/2m2cpvuCZSJK1spFYORU43qY/0APHS7c=
X-Gm-Gg: AYBFou04mR/Yp7th7DCWYZqY/RcHOQ0pSSZjYwzr8da+x/0l0hEgu1Mm/Dngrnr6Upu
	uEnrXZrytgI/llEPKlf5aQXIaP4OkOiNNzxfQ6/KAOLZJ1SaKIrybHtjO0rAOpLDT3OR4OdfP+h
	fN/Wgjji2uMbqKkbsTRt38SXqWEOERES3lthbpHnRTzTAdDrTMXkppZ67TfW0dnuiDKWykxJ0jh
	Pxm2jXqSoxgCk9ffjjhqM8yS1DY7oE5ELrVfaYCGpXTD9lchdoD/jx393nlLxMi+bXNblv9Jt3T
	QLYvjotZ5pDW06T4fH6ZyJYQGASW2KyAA06is4KIrI60j/WArQT27HTanlv7WltLH3JUyutuLa5
	e8VOVtJVrowWcLGvO63JnLApWugbEwJ3Hl5k54tiam1+OmxcQrwxLjvU81blReg3WI+d9O7mUbB
	+90fgHMUpOvcbc39VKIiF1RCNCy0rRa0wNGtfmkPHtYdTzBfZDGRKzYzHvlyOeLdYGrWvgl01o6
	4tYTLLTclu219ZLShiBY+66wINPACH2py+mPEuC8w+85+Sjnt40JH6jFfzoHHG8Q008ABh8F0a1
	68Y80gM96vV6Fx56ymNSLGUWRk8DATrh/t01U1voxHCb1Zst8pKybm2Z+dAolYXXaLwZlqwsMZn
	yxTL7Nsg=
X-Received: by 2002:a05:620a:4481:b0:93e:c12c:f11e with SMTP id af79cd13be357-9494bcd396cmr1068763285a.74.1794687950152;
        Sat, 14 Nov 2026 12:25:50 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d5f3e4sm50436436d6.16.2026.11.14.12.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:25:49 -0800 (PST)
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
Subject: Re: [PATCH 2/2] mm/mempolicy: limit shared policy ranges per inode
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <70740a32-92f5-4425-8676-68863f3e44c3@kernel.org>
References: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
 <20261113-mempolicy_limit-v1-2-16688b2644dc@kernel.org>
 <179467808112.482102.13365594235443107281.b4-reply@b4>
 <70740a32-92f5-4425-8676-68863f3e44c3@kernel.org>
Date: Sat, 14 Nov 2026 15:25:48 -0500
Message-Id: <179468794889.482102.14066028910704780583.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-14 21:16 +0100, David Hildenbrand (Arm) wrote:
> On 11/14/26 18:41, Gregory Price (Meta) wrote:
> > 
> > Multi-task mappers were previously unlimited, but that seems like more
> > of a nasty unintended corner case - not a real feature.
> > 
> > A single process is already limited on the number of vmas/policies based
> > on `max_map_count`, so it seems natural to just use max_map_count
> > directly, but I took a brief look at some distros and most seem to
> > ship a raised `max_map_count` (>1 million) by default).
> > 
> > I tested that and even 1 million can cause a soft lockup.
> > 
> > Not sure there's an easy solution here, we might have to rework the shm
> > policy locks.
> 
> Do you know a single valid use case that's not solved by patch #1 and would
> trigger that many policies?
> 
> Ai was not able to come up with anything for me.

Just want to make sure the bases are covered.

If others are ok with this change, it doesn't look unreasonable to me.

Although I'd wonder whether just using max_map_count's limit instead of
adding a new toggle would just be cleaner and avoid adding a new uapi.

-- 
~Gregory

