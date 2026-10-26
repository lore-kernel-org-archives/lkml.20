Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023467;
	b=qMUfLcMJ4PU3jkJi6PzOvM1mqfHcDEryOG01iJhKHNSwTPz3spbWY+k8HmpXOlMWIiPr
	 OY+9kWu9PeoBGo/Wa/54JCawyTT1D7ILFXpjJAf8KjxkiCq2gxJiYVKfXuuJyeXnei/8d
	 2q8yzD40u0fYNaH/GmNV+TkMoNmvuumP2+DWDD6LxttaMezDWtcXWyCxkFOhARNg2SvmK
	 mx9wHIkPyXbwHwSO9CX5sP1pO97LlNA5YJrRhS76ynwi+C0zSdMxFJqAcI+8We1CXgYpR
	 eUY8LHBX7kcRtjhkuZRZZINSFKG38lUnUyLfCdeM0nFAFEEB9nevm6wA7bTD0t7mBuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=+j+27jHK6eH0bRZGv1MwMG7TaEjdMoEo1o6LdZHQ6Ew=;
	b=miOSngHgA6DmJSFbm0YR6o+wW+4n/OMJC/Y/rE3M0iFfANDhDbdxqJhbI90Jmw3Pfj6Q
	 Pac/oAXXl9ACmKbc99Nuwarv9znQtSsbZhVOqR5ZuRAgVCUM2Ztjc8Sl1JKIojriG+z98
	 BL1zlUOG0bABF1NTy4pVVPxmn1N0wAtanG3PmhTBGsK4qiUcQg4lQi12JLc3KneP7wPzP
	 FpQRiEtc3/ybIe4MTmilXBg0elpo5Bx1eapxU1KCBuaxk0BvUN70IF356P3YJxdFxTDRu
	 rP9S/XhbxVPkowXE5cDc94dO8Gxvv7jTx+Jjw2tYAcZ9po27pjfyF213f0cyaphlw/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Xdp8Bl+H;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0179606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0179606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Xdp8Bl+H
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9995ce866so28027315ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793023466; x=1793628266; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+j+27jHK6eH0bRZGv1MwMG7TaEjdMoEo1o6LdZHQ6Ew=;
        b=Xdp8Bl+HlIpTIPADNhAC0Bnw5OtQeb3yZTFJmf5cytDe9mHelUcX2mmU4icI+2ccD/
         WrnClsqvYtuTqsazujFmgW0Gcj46cDEuRSg9F1uojLb3QNxF/Nq5kg0Boui8wIYQXPtk
         OU604TtjzKm0ENnUPinDkMxv8DmH0XrQerPPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023466; x=1793628266;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+j+27jHK6eH0bRZGv1MwMG7TaEjdMoEo1o6LdZHQ6Ew=;
        b=PdRJ3AFgi9sw/dXbyWh1aSnAKh066cdcTqO5905Qw+yJ5WkjBJdFGDIsTx93n5648S
         Z8yoWHH13hWG5P2s2lJl74ztaZPMF6ojyYny8GXfiZK96pUXZmbRyzp9zFnLvgK8AtLp
         qLj+ikFz1PPBEAmJwsg7tRhZWmZu7FwGa5u1WgmGJvx9ijdcGAZXCb76Z8Sm9qGlPjV0
         dj2HxMLltLa5V2S4DlsmgYl+UeG42n2cI/x1PdXcwnUSjizkzUp1oGq7shERUCkwXLVG
         pEp4NmWQ9o7F1u8rHi4d33qtpij9KDjkglLcDRVQ3NtcFqv4CejAfipApewEr3HQmy4w
         qD8A==
X-Forwarded-Encrypted: i=1; AKwUvBzbPnoqBqPOp2sG6YDxxf2zMBKyGjp+ZjQq4Gy3UX5ArN4ugBwmxq4WsA+oor0WLYWXfDUbOscSDI+seqE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUA/bRcvm5bpp3dMQf1wl/BMfWL4NMqy2OLWS47jPUElGcxV6A
	GC0DzinQDhrS8KOVPXGkHslbERT18gLsgwRkA5iJfdRjQFNNJyCxa6ZBTNQH4r1qUZA=
X-Gm-Gg: AYBFou3diGwcNE0Xsn20cxqonYFuiA2QsEJcHu0K8erkjHe0r+ZOK3SsuSK3SeJxgx7
	SmFKAzzfxBssl4hXYSYFu35Dp4ZmLKxIi0K39LGQ+f14WWKenrNm/Mnqr+V9N0DlWv4zlUaOEaa
	1/I/tXdPgl6DEcVG6JCc0pTZFut90U1BMcLp0sxqdz43nMJ+0VDLp6nISTXhAiyQPhqe8q8jEt/
	MXJXhGTChKEsbmFbIBnOaIc4te8sMVJeRSbF49hjw/vykXL/ClhY+8u3dlrRxzh0YyjRRMVD+9J
	XUfi/pvLeVEODmBkkqdsczRvEpiq9D5WVT7Sj2t3G8V94qBDPIUwrr/3Cr7D1jXXFYG0P8yXUvg
	OMYRjvDNrl8IyDiHRpr8qEcqBQOHRFOFLu0JqQEAtdtpsT0FazUpme2XcjRNcYw/MxXgznqfCz4
	ADypreOC4A9jaMjBd6QxzS2PF7KA77jOuzFL3PSxuvu2EolQg9s2tNSUrqDr4QbgQxXZsOYY/4i
	NK0gyJjNUjlT2nv1gNJOIT87qkE3Y6HM1vSyBCMTzWoOH+T1VRFolu3TJGA2OGSguKUPs8tto3g
	S2Sz42IuO1yYsBMQJM5MhvxMM1/XWzxU4z4jfw+Eh9JPcT9SMTJpRCxBB1nRibxMUK5dPErpIVx
	o3fyDWLsFognn8RaIXs9Ly1Y=
X-Received: by 2002:a17:902:db0f:b0:2e8:4066:d247 with SMTP id d9443c01a7336-2ea9c697792mr62884475ad.33.1793023466139;
        Mon, 26 Oct 2026 07:04:26 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a748csm17270035ad.55.2026.10.26.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:04:25 -0700 (PDT)
Date: Mon, 26 Oct 2026 22:04:22 +0800
From: Chris Down <chris@chrisdown.name>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Ying Huang <huang.ying.caritas@gmail.com>,
	Kelley Nielsen <kelleynnn@gmail.com>,
	Vineeth Pillai <vineeth@bitbyteword.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] mm: Make swapoff interruptible when unusing mms/shmem
Message-ID: <at9d5rD-15wXXiK8@chrisdown.name>
References: <ar2YlFYjYUZ49ZA5@chrisdown.name>
 <b1aaff8f-c4b1-4c2c-939e-7051e7f9b6b8@linux.alibaba.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <b1aaff8f-c4b1-4c2c-939e-7051e7f9b6b8@linux.alibaba.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Hi Baolin, Andrew,

Sorry, I missed this.

Yes, I think -ERESTARTSYS is appropriate here. I used -EINTR to match the 
existing signal exit in try_to_unuse(), but that also means a freezer induced 
interruption becomes visible to userspace after thaw. Let me use ERESTARTSYS 
instead.

Re: Andrew's earlier questions: before b56a2d8af914, try_to_unuse() checked for 
signals between swap entries, rather than after walking an entire mm.  
Individual I/O waits can still delay it but certainly it's a lot better than 
this situation.

So yes, I think this probably warrants a stable backport given the suspend 
timeout is reproducible and it's a reasonable usability regression even though 
it has been present for a long time. I'll add Cc: stable for v2.

Thanks!
