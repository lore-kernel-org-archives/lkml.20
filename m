Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792776059;
	b=fgsmLpkDEVR9owfa8zZHriKSr/ALY4O+SitXCYPrON4qjbGYguvGPOC3j5hy/36FZJQl
	 cFMbrpTA9zVzzqS+MDPmhdBo+E5jtDycRKF5cwd/n8rnAxVJRkpfP3Jk0SG/Oi27k7a9e
	 YkwccoUssUCOARcjD31cySRfugTP5BqwuvZbubTYuHaCx+QRs7aI2wWKJAkFAT6QfVcxw
	 rW900s61RTdoUX2qg6ChXRBCq52BHb9pqOml9JXmQ9joxezDIVCEcKePkgKclSrdcQpaR
	 yWUScRBf73aiXzPKqZ5UFJlm8ltBli3O4Td2jwzPRqEDC7FHclawk0ztZ3MrTIDMrbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version;
	bh=0nbb1+gmo3RWuWZWMTmbysNnHRUp8yuozX3bwCuD0eE=;
	b=ag2TlopSKreiIMl7T3/9d9btSI6jhn/HVk62MHfzA7TK5J3/RMbJlQ3DYesIC/rjCYXf
	 j1ZH5y/gSGxggrM5J6Pnzh3Hy6ft3MnL28IQeuEWP2Q1IO5YhK6ik4JBY+d8hCzvSHOZk
	 MQM5pKIh4XO/iNywjDizp30JlYOPJZGlJb45rXP1041qzynDIDwAH150snHZ2Rz3cP/v9
	 aa4YUspJZAKnwIPSQ413B9/bhp4N+/KfJDqSG97J4ifQ4GhtiridxP7nIpX0Hwo/wxxYl
	 jgO/R+oS3dVPRKUPmeS9Hexdn7fNh6G4lPlXxKfHsZcvz+ZtpgmpkF2HqU3DWgJjTxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=h3kNNRZv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14777606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14777606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=h3kNNRZv
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6iHe4008395
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:20:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=0nbb1+gmo3R
	WuWZWMTmbysNnHRUp8yuozX3bwCuD0eE=; b=h3kNNRZvutJwWAllbDFrnQwAZTw
	LG+gBqrvftpvkVL2Dj7rqcYubAM29ajILxm6v6nsanzUkBIpg/GCbDS1qVcDXwm+
	VGaWd2n0sEFU2xw78bl/HyX/fYYAcLSdJnkYRPo27n0TzdrJWVk3H2xhd2CuJo84
	aIK+kKO8TNgQKua3fQkgSyQb2AtLi46S7f955iyyr6qeRE6rR8qU3TP0vZyDWSfY
	53asbrSxz8jlpPYUtbPkGhrKeW/oGOrXR7PrtXj/IcHFFTMzNlwUth43qkugZ/U6
	syPiY8YaLwHhXU0xXQbf5DUS9WaF2jSp1USV9GmOL+cNuUBohsK9vhSnYBw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hf9ftvj4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:20:57 -0700 (PDT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e80f7acc67so11478075ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792776057; cv=none;
        d=google.com; s=arc-20260327;
        b=AK9V6zeXdqezCF0S9eKCf9SWZQiYRCHew6P8LaUVNzU1G2gEWm4CDo9wMJ6mh01fxx
         01KmZfVMnVQdaloOVEJBPtWVkVEX5F75eR4aRt7X6UVYcnys8WoLNiz8EH3R8VMwL2Vt
         xnd905sem7ClXMm/iRJNRW8VVvuiwn898Wx1qBs6ovQsWqKv9bRSHLQvZGW9/RCeGQLx
         BZQLcQLhUbjXnR4akqsiQ7TUhxx4yrIBBM5zbO0Lucs5tluM+rxsC6GrwKi2bHV/PSnX
         n3SDxXFCV/8CqhnyjmbGM9HX6Z7FAkoihjpGlatdR8TxwfU/1WugbMsRWjgJ1dTp0ukr
         v1Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=0nbb1+gmo3RWuWZWMTmbysNnHRUp8yuozX3bwCuD0eE=;
        fh=l0pZxkH/mc0orSz57TRSjiP0QvTSV25txOqXMjutSAM=;
        b=hA30b+SBjzSynGUrj/xB0hUdDBktzdtQZZTXyaoljpGsviMfzT818GAr41xSv2J66o
         iwEtjfCnLXnaOjW8ELhBp2bexL5JJWU52S6mA01DT9uv3VtJ258kc77QnNHm4SnDX/cV
         PEYdyOquh3gcn4oSjQ/6EPVKz/THGtOwLSWFjvHFtfGbbZDY62ksZrLdLeT90fffLyON
         UCy9n7Pwqx1WOaTjEy8quni4Nvg0tr8BXgCMwgSEMxybLccPIaXI/a3fYeHvE1Lva7Om
         +7mqSsriLQ+rmpG/zN0a89cdDfUAvEa3XECTb5sL2uGfFszHT3GSKpadPm4r/AZbCdqt
         tkmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776057; x=1793380857;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0nbb1+gmo3RWuWZWMTmbysNnHRUp8yuozX3bwCuD0eE=;
        b=qYb8k1q4UJzw2nxBMrhBcSon5RJuB5fIzrF/f9/ew5/YoiP/ByO1YjF+M4kEaRc0cB
         Vt9oa1zvMoP07UgaQlE7BnUPjy684x6jTVJAWtqFwdD2/+uzdCHVkIT4kIloWT+W5xL5
         UGJ22UpxbqrPUxH5IYyhiCqV89CpSehP8eteDWQ2wJv7zuDJIJY0ssWFkgXkUuHDoQgf
         ODGrFk46wK2OghS+KFSqSg9WADZ8RAdvVTLEIhwF3IbODBXgL7XIDXeNQ4jbG2aL78ZN
         4TA9WoRldprlelVCda5bqdIoRmRZdr/nWXkDNnne3Vws2rvmwY6npTIkL99qv/J8fVV8
         c5XA==
X-Forwarded-Encrypted: i=1; AKwUvBydTF1kg33p8zTBbx987eAaKwcv+PnYuiqoCPPSfJxILIjdBpLnz+Hix0FEhkHshSoK5OpHAuwokoscNto=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAYIDyvEJS5ERrqeW59OlOLYEldfaGKThbXtr9poeCGAX6fG8S
	a6dlNre5dJ5RUO8IOrDQXK2U0y0vCE2hrkb88jdRC0/DBV/eHhzGTGe5FfTQ1Ss3fMNKvREbMVQ
	H3EO2EDYnGwkGcQql2WQlGi9HqTPv2kVokazKtNMzDn7UITDvaNKp4PtFuJDU3mcMCTOmOP/S4i
	LsMvpji5c83/XJa+GGPWAGZRLtFHFQqFZF09Lh7cM=
X-Gm-Gg: AYBFou1p2H8UohlXBaZDkII/vPw8GHisTjT9kYeZU8Vy5lErG5r88ld2eVGaPGTUVuL
	nkFK/f7RrkYje20/UJrlNUVVJ2pmx3bP9POM2XTr1VQEmxkJqJaoQg8U1azB6zeBZkQ3vGzHV4v
	awTzbcfWRpPHEr6oaqc576vNnqXgwduUo+WRgk4Bw7TIHzZJo4bngQ7Z43PT7dRUCvO4s0wFkAq
	3ZLqo/NBts4+Ovaz9mNetwORC3N1NdM
X-Received: by 2002:a17:902:ffcf:b0:2e9:658f:c33e with SMTP id d9443c01a7336-2ea7ce435ebmr26441435ad.8.1792776056565;
        Fri, 23 Oct 2026 10:20:56 -0700 (PDT)
X-Received: by 2002:a17:902:ffcf:b0:2e9:658f:c33e with SMTP id
 d9443c01a7336-2ea7ce435ebmr26441315ad.8.1792776056075; Fri, 23 Oct 2026
 10:20:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022223014.556388-1-toddfreed@meta.com> <20261022223014.556388-2-toddfreed@meta.com>
 <DMC6H9OT57RA.30RKA7CO0856R@gmail.com>
In-Reply-To: <DMC6H9OT57RA.30RKA7CO0856R@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Fri, 23 Oct 2026 10:20:44 -0700
X-Gm-Features: AclHuK88YhWMifFuKF48zzEpiv1AW4dXYQLz0yCHzxNvKSvxsDASMAUa-8p8mZU
Message-ID: <CADh2yMyVZawNObS1WOjahqsO=XJjpwoxSFMXyc=kOzWhXMOc3Q@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] psp: fix transport mode encap with ipv6
 extension headers
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        Shuah Khan <shuah@kernel.org>, Raed Salem <raeds@nvidia.com>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>,
        Cosmin Ratiu <cratiu@nvidia.com>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: qkeOTKilwdqD1FEt4US1LvCwSp1_dzfA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX06or8KsEPYiQ
 wkiUyYbW7ryMIroLHyA6Z/cHtCg3HBpdcHs+jdiMNcSllZNXwaUr/V9aknl0vLbvsq1eRJb3RTr
 ea3KYNEOEMAVwXDrZ1EN6vQ6c1SlRLA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX8LBgDF0/+doT
 P5glo7zMA5uE3L1BZAKE0R2mSz2KbcimRamPrznygnxxAO91FlAMNqtE4IBgy8x3YrzJsjUcR5R
 eFPKBLit9/RLsYdHrz+hSu9eSKkuv9dMVU84fViSbQaS5CZGxKTwp8r8TTtywP2CiNx4z8YiDil
 Yu9jmjrlU8v0vU1XVlLN+AC40ncrNCPdYWT9flMjj2+vrM9xeR2BSYdzG8A2WkLfmbQeyksIx9c
 tLmzWAKm25KTAJA0HdtYiF0+yWnnUeMGHP57G2uwNAL1eK6X7ZvemG8dy9vSYmFStUv+XvkC/Fg
 3cY4cooZX3H/SD0EromGp6ed31bKlIHw2VvsSs2vpoQNKCdA8DDQBpTAjpV9BL7R7RSVRsUQf+j
 zmimBdkOmEUkUxbfwiShCqgHckJIg/keFDpWygHE6zHVs3n5NKnolgN9bSC/LmoI7HGLfqEr8AZ
 eb6V0k66bhnlQqDsU1w==
X-Proofpoint-ORIG-GUID: qkeOTKilwdqD1FEt4US1LvCwSp1_dzfA
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6adb9779 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=JnKecZnUtZousrUlYMGU:22
 a=glYwtrVRrWtjULxB9TQA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01

> > - NEXTHDR_ROUTING. the tcp checksum covers the final destination, but
> >   drivers seed tso checksums from the daddr in the fixed hdr
> >   (mlx5e_psp_handle_tx_skb()), so this would produce bad checksums.
> >   could be supported with more work.
> >
>
> The stack should seed the tcp check correctly with the sk dst addr. If
> mlx5's lso implementation can't take that into account, I'm not sure a
> generic helper should be the one rejecting the skb.

Fair enough. In v3 I will fix the mlx5 bug, and accept routing headers, too.

Or if it's more suitable in a bugfix, to effect the narrower behavior change
e.g. drop, please let me know (ack that such a drop should be in the driver
though).

> > +             if (!ipv6_ext_hdr(type) || type == NEXTHDR_NONE ||
> > +                 type == NEXTHDR_FRAGMENT || type == NEXTHDR_ROUTING)
> > +                     return -1;
>
> return an error code instead of -1?

ack

> > +             rem = len - off;
> > +             if (rem < sizeof(*eh))
> > +                     return -1;
> > +
> > +             nh = off + offsetof(struct ipv6_opt_hdr, nexthdr);
> > +             if (type == NEXTHDR_AUTH)
> > +                     off += ipv6_authlen(eh);
>
> I was expecting auth header to be part of the reject list.

I will do more testing with auth header.

> > @@ -331,8 +375,23 @@ int psp_dev_rcv(struct sk_buff *skb, u16 dev_id, u8 generation, bool strip_icv)
> >                       return -EINVAL;
>
> If you send a v3, I think you should put the psp_dev_rcv() in a
> serparate patch.

Okay.

-Todd
