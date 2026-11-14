Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686233;
	b=bar7YTZHKbziixuRoIMhurD0B4+xe2kKcbZ1CeSHTAWqgTLRYxPHs2j+mj0ofLRaRnGa
	 0/uWD9XwAwsmJcxzLlJfaF+qq4R6ISxTd5koFCSoWPRZ+yK3kITrYNRxvUjywbTKy0Id5
	 OZFsX17qR1tGmtkeb4mDxVzuglxhbotXvqb1JnnIwmWNWIJkvsd4EozCW8SN8GRd1JLFe
	 XkRbihdxhSItE4YJ5e5Bm/Ida/wPNih1m3z0BXY1cORkVMy0txd91mWdWVcLLsTgX8wIv
	 j2tKN03Up5WIpBlSvT5ahsUqh8rp4+aNexbIBK/ASoDgHmVSAXyiQ4b9NnO/nFK8QZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=eIMvkqui4i3Kkmc9AR/ugP78XS7JwMik/CNI8EIhmFs=;
	b=tnoQWcWbY/NsB3wDIKc5u9X2zotV9TaIMSh1afAwZ+rX9F+pu7DmZKpsGvX6X3Y/HV7c
	 R9RNHiCLPa31RhkZmwIBCg5sN3Ni16gnmLQjhNyWNqgY3X3MjECjvISZU5PCc9IVhkjIF
	 Dm8YweS0/QVX2MtDln9tZyErI5w+xqHqr6jobfjyaaO3+U8i6SeGjm0SJ+0VHzZthQzWS
	 VfHeEJQMxCDjIQkMrpjY54rP43aF4KfhFPNz+wG3W68/vXMznorHTPCTiN+UYAXDC/B9x
	 YquB98g3aZedoBG9BFW57QdKzMBn5BdrdBX7lqJ/ygBEk7uwpn98x67ynU1eQTO/4kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=qCBhqqQs;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0B460A5BCD
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A0B460A5BCD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=qCBhqqQs
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so1058305a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686233; x=1795291033; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eIMvkqui4i3Kkmc9AR/ugP78XS7JwMik/CNI8EIhmFs=;
        b=qCBhqqQsoc1eZcrQ4pvXloZJILw00kOKKYiy7DXQTrPbVRXatSWw0iJpfE2wqTfcFp
         qYCsVR3NBkdWSIzdyS+oP0OrRYpLgbNzACk6Ebjx9tTjGDagXidbZTFhd1Qmxef1rSzA
         x5Dt07utPecY2HSjJx226RaMd3cqccjJBZCfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686233; x=1795291033;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eIMvkqui4i3Kkmc9AR/ugP78XS7JwMik/CNI8EIhmFs=;
        b=RP1IueOvTjbRxhQV5Ybmo/Bkpre865mkns3C1gGkBrvXIsg+aeVjhqF0wcUOW/vAuc
         YVzYbDGF46NPep9c2AqIMQdWwnSDWRiYZWJeRApxoT2OatJZYROelkXqXn19rrQqKydp
         UPdDRRAgpx3JC2WuRawbvI8NwYtYab0CrYRtbbX0+nVzZkRzh9uzimp5W604nCfZmgkd
         zQJTzC9iMONuIEdKofy+Sl1I32J8AHePkIqOoA6PBe+zY29l1P4051lqZeiwDDPWUCuj
         zKOXG0DfFly021HgT1Cfy3/8CPhymzI9vDGOL1xSnS+pUAzXcnWJcHHojUhdmpmB/Clc
         gXoQ==
X-Forwarded-Encrypted: i=1; AL+hErFM7J+c4Nm6THRYaz5qeyv32yKMhRDlNfCB6twWdwlXLr92WelAwwBgHnamnZylWHizICAuZQNIewUiMXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kYydAzKvtBZ+dr4IUNbJl2394LiAm/ke3T8bFN4YG3kv57dK3
	Dmxo+Et8Nal6Mg9eOkNQygRKhovchFFXzzXasMXeHBEx7SQrXZV3yHEwjZuiXGLNtuA=
X-Gm-Gg: AYBFou1UaEJHx6JNtcZMLLn0AeG2/YfKcjYhSHjPGFtQ7iXfG/Pk8OFp25MsDNSs/G+
	xnTbo1Ct6WeoDGiobU2lJImCmC7+dkxlRVPBk9tehHyUn0xgI3DBmKwTkaB3dfnz0biMmnMeuW4
	vkQ3WkFtjAvAoHie/HjDfnYl2GRYmtNj+nndrLiWEDw1qozVRsJt5OzA18YMpWMJjOJoI5eYt8f
	pBnYhb/ZzVn5/D7tz4tR7R6P2G50yP0+ICLHA3ujfMmUur0/QLot4POl9W8rru1HXIRQQYvncLr
	7vQJi/vK0ggS2pf5iZhLM5k68Jt9dCnit8Ql42YSuJyjcXbP761Gd62RjTDGOi0LHfG+ppgyttO
	yKTQ/9St/AsirlQRvxFKST9aJaoSzSDK0IvQxtQcn3MC7+X+tebpf1GKgihke6LjcqcO+CQDfbp
	AAHZj1OdnZGAeUbGpcBSVHtxeBD7ZQYH+ceOqHUqdw5ZlN9YFHFP4mGMtO6BcSqjMf9IKXqxvbc
	JVPGPJWYylZGg1bcS3g9bFk+F0p0aOX8wL1yhUSwshjGWqwthy/e5hFvnD06T92I+YWYvCQcXB9
	lHFQHPD2R5W47uH9efswQduWdFk++lDJoxTYB4+o+yOCnTA9k75ZXUiS5I8qMgUKHRxzCcnTYR/
	XvGi6GCV+sAy3CmOblsMd1NGcgsfDnvmuzQd+hkvVxL8W/0pRgfiPQL2xO+Qm3eRRCDHzTlUDx9
	wMzpJfdbmBqRyzuD1nYaWmMT7qiGtHKJqhdDdx8NFlFd0CkZM0Z+YCFg==
X-Received: by 2002:a17:90b:1dc3:b0:3b0:9782:8721 with SMTP id 98e67ed59e1d1-3b1b0a0e116mr5851632a91.36.1794686232711;
        Sat, 14 Nov 2026 11:57:12 -0800 (PST)
Received: from [172.22.0.2] ([4.16.0.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec3af2dsm9695465a91.9.2026.11.14.11.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:57:10 -0800 (PST)
Date: Sat, 14 Nov 2026 11:57:08 -0800
From: Chris Down <chris@chrisdown.name>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>, Usama Arif <usama.arif@linux.dev>,
	Kairui Song <kasong@tencent.com>, Balbir Singh <balbirs@nvidia.com>,
	=?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
	Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Peng Fan <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>,
	Chris Mason <mason@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	"Borislav Petkov (AMD)" <bp@alien8.de>, Mark Brown <broonie@kernel.org>,
	"Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v2 11/13] percpu: fix contig hints that are too low
In-Reply-To: <20261113-mason-migrate-et-al-fixes-v2-11-50a2ed382b61@kernel.org>
References: <20261113-mason-migrate-et-al-fixes-v2-0-50a2ed382b61@kernel.org>
	<20261113-mason-migrate-et-al-fixes-v2-11-50a2ed382b61@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114115708.18fff016c293a57b@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Lorenzo,

Lorenzo Stoakes (ARM) writes:
>Secondly, when a free stays within one block,
>pcpu_block_update_hint_free() passes the end of the free area to the
>chunk hints as a block offset rather than a chunk offset, so in any block
>but the first the chunk hints are not updated at all.

Joonwon Kang sent this part earlier this year as "percpu: Fix wrong chunk
hints update" [1]. It has Dennis' Reviewed-by, but as far as I can tell it
was never picked up. The rest of that series goes after the scan_hint
problems by fixing how pcpu_block_update() maintains scan_hint, rather
than by dropping the promotion, and Dennis was still reviewing that in
May [2]. It touches the same code as the first case here, so the two won't
apply on top of each other. It's probably worth adding Joonwon to Cc and
working out between you which one goes in first.

>Thirdly, that free area stops at the block boundary, even if the free
>bits continue into a neighbouring block.

Wasn't this one deliberate? The comment this patch removes says that
chunk_md->contig_hint may be off by up to a page, as a tradeoff to avoid
iterating over the block metadata on every free. I don't mind changing
that, but it'd be good for the changelog to say so, because any free
whose area reaches a block boundary now ends up in
pcpu_chunk_refresh_hint().

>Fix these by always rescanning when a contig_hint is broken, passing the
>correct offset, and refreshing the chunk hints whenever a free area
>reaches a block boundary.

Similarly, da3afdd5bb54 ("percpu: use block scan_hint to only scan
forward") and d33d9f3dd96b ("percpu: use chunk scan_hint to skip some
scanning") added the scan_hint promotion to avoid exactly these rescans,
so do you have any numbers for what always rescanning from first_free
costs on the allocation path?

The result does look right to me, though. From a quick check with the
hint code lifted into a userspace harness and random allocations and
frees thrown at it, contig_hint regularly ends up below the largest free
area before this patch (for both blocks and the chunk) but is fine after
this patch is applied.

[1] https://lore.kernel.org/r/20260513085117.1024175-1-joonwonkang@google.com
[2] https://lore.kernel.org/r/ahVWu38ymnSeLnv3@palisades.local

Thanks!

Chris
