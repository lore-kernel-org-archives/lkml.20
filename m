Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E704F7975
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790370817; cv=none; b=UJmb1yyb/Fqw+XrcGmLwty7D4nw0nW2VDN6XSvwVCq4eaA+0edJfx+T/SJ4BfwppW/YuLKr5o5q9hxmoQMCDGmfYiImks391gKJS2EHiH5NMMmZLwMEhjTEC81hIRiqtEmfjRwCHntoLuR+L7f/giyBT5tal/lcrPMdMEyDlxeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790370817; c=relaxed/simple;
	bh=l2U8nzCNNQ/nwq4FEs6iLspFROyaC5q68fQmREhjkjI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Hij1bmhyyTMOJl94bqSqZyI3gJd2QERMM4CjGXahfM469F9RgJwo/O0CkDMmUVDNBFjFtNuWORs/1UDJKz59u7OFIhhoXhzexetMTEJVkPbCtATHE+BHeOiQZbY/hYTbxHpy3yeaRCfYTn9pBFu3xNykRF/TjbYbH+dBQ0KTWug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cisRoBq6; arc=none smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cisRoBq6"
Received: by mail-yx2-f41.google.com with SMTP id 00721157ae682-8a7e4be64bfso9763427b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790370814; x=1790975614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kE6Ci4ey9edySdwisM07uhodEQlZii4EnlJAnWzc9lU=;
        b=cisRoBq6/2Mq0XJdC1G9mBuK3ldnHNb9jKiaWs+33Rc9Ql4AWqtx8FuaMW4DlLSGKn
         aNzRW3Xr4Nb8tqUVTXnM29fbRf8rJhalyTQFeKez/3pF7KcvrqDZZ81KO07NatMbCHkm
         EeFPv3cZhomWMAftMZKLlhqGRuFKwPJdCTFWycrSnHHoPbyb0y6ug1YqTFWpEDKaaxji
         OIV/gPPS62wKm5YMYAdAEifz54ulE0iXwi7cfD1OzGQ8GhC0NWZT7U5wyHWs3CFc3SVw
         xu+EClqcAwz4x2xM247cg35WNjGDaj+q9D1CnllGILL//ReivfxRRk1EZjoPzyDRyYU9
         tWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790370814; x=1790975614;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kE6Ci4ey9edySdwisM07uhodEQlZii4EnlJAnWzc9lU=;
        b=M299h/VMgpMxVGBYmNxJRKRSDwtv0mM5gl4GrKCzANvlkS0jq88LKNOZ7YB0sah9mn
         i/1v4CFSBYRHVLaS9CiwdqNBFsQvt0axecvhfc8By2tEzlnN+HoEzDPst/HfLjBAEYO3
         6guMsMDEKo+s5+PKFQqGXF5dKjU5sJk+YH4d9PV9GnZyeV+9a21epxyFa4Ixb+uglLEd
         8UgGyXvFOT/IRlHwk/DXFqNeWLMp8RbionkfFlqE/Em5ZtL5dgGMPLG/h9eXH+FpOn9T
         alJmfAYJxF1WoYjthMLO2XzEu6PSNZ+Uks34JHh+uPferGerCm8LyhM8hCpL01dyAU8t
         n3+Q==
X-Gm-Message-State: AFuF++nCrNdLAKcaE/KS6zKIyaQadHgjnOcW/PUMs9QHtSOYlJHsTZ0e
	MxnS/JwG+d+eYETadmzR7yo2Fs5R4ahQHMM4SSMSmC6zcR0QbdxCjEtd
X-Gm-Gg: AYBFou2PPhB0yr5mEA2wtNmgwGilk3ZMVdUbd/uageetmaoKlI9tqkmRtNzbTaJoKR9
	UvAtloKCJ1fI+bTz1wkxowau+SYNp1cWWI/1X1Y0rHdyE1XMuFXjv+Rx8B63i+Q44Zg+4qgWH0x
	8khTgNKCO8Fes/itsoqs1UGI93XVPmGVotmGLwz4iOuWpDO5e3fKmz2vpaRN5Ugo8EY2yIzZave
	C0j+LNBmikOAmB0+yiKsepgjDSx1V6JtTXwe+sGz74E+hu6nvuaTYqTBXPHzh9Ng3oGpL4SpqPB
	w26bTOyqAqf+1MBSKsFFIHLlwe5WbL3FEvdmOtAb8JhZvZcdqVoAAKdUtfTogLDTie1i/n8pHGd
	HgO2GQSL7z86BjdYolooE337EZihwbwe5yozX4Njg6L5AtMt8f41n6t2kcitEp6/hjVrGSBcCNN
	PCwMKLn/58fFPgHIKFOkIDELNZ8ObFjp94Csd2r9rHxdqfarva19iTP485bB7OwgTiSrhOpLnPr
	xUhpREdD0lR/PUbMCCvRNTKSugK64NOcXyTYzXq7R1U1tHZU0EKBOKNFZPbZxDh
X-Received: by 2002:a05:690c:19:b0:8a5:1570:a298 with SMTP id 00721157ae682-8a64ded27c7mr30052657b3.50.1790370814571;
        Fri, 25 Sep 2026 14:13:34 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860fe88d6sm13938657b3.31.2026.09.25.14.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:13:33 -0700 (PDT)
Date: Fri, 25 Sep 2026 17:13:33 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Zihan Xi <zihanx@nebusec.ai>, 
 netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, 
 davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 dsahern@kernel.org, 
 idosch@nvidia.com, 
 kuniyu@google.com, 
 willemb@google.com, 
 kees@kernel.org, 
 richardbgobert@gmail.com, 
 zihanx@nebusec.ai, 
 stable@vger.kernel.org, 
 Vega <vega@nebusec.ai>, 
 Luxing Yin <root@tr0jan.top>
Message-ID: <willemdebruijn.kernel.21eac4268187e@gmail.com>
In-Reply-To: <20260924051521.32568-2-zihanx@nebusec.ai>
References: <20260924051521.32568-1-zihanx@nebusec.ai>
 <20260924051521.32568-2-zihanx@nebusec.ai>
Subject: Re: [PATCH net v6 1/1] net: gso: limit recursive IP-in-IP
 segmentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Zihan Xi wrote:
> IP-in-IP GSO can re-enter inet_gso_segment() or ipv6_gso_segment()
> for each nested IP header. encap_level tracks header bytes, not callback
> depth, so a deep chain can exhaust the kernel stack. Making
> inet_gso_segment() stackable introduced unbounded IPv4 nesting; IPIP
> GSO/TSO later made the path reachable. The IPv6 stackable path was
> introduced separately and uses the same guard.
> 
> Count IPv4 and IPv6 GSO handler entries in skb_gso_cb, initialized once
> per top-level GSO operation and preserved across GRE/UDP context changes.
> Use the existing IP_TUNNEL_RECURSION_LIMIT for both handlers. The first
> five entries pass, and the sixth returns -EINVAL before dispatching
> another GSO callback.
> 
> Fixes: 3347c9602955 ("ipv4: gso: make inet_gso_segment() stackable")
> Cc: stable@vger.kernel.org
> Reported-by: Vega <vega@nebusec.ai>
> Closes: https://lore.kernel.org/all/cover.1790157745.git.zihanx@nebusec.ai/
> Assisted-by: LLM
> Co-developed-by: Luxing Yin <root@tr0jan.top>
> Signed-off-by: Luxing Yin <root@tr0jan.top>
> Signed-off-by: Zihan Xi <zihanx@nebusec.ai>

Reviewed-by: Willem de Bruijn <willemb@google.com>
