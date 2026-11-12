Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794512171;
	b=pOo1If50lFemewTCH/GuSphd1afzkDaAp/ZCFlJ9lho2jXFYU4TPqmrj3dNgd5JSKMG9
	 PLlLA2vToKh68Psx6QnipWWKIqfXlXkJaGhEWiXhDzWa1LrnmvPCFkzAYhNKAyZmdb/6l
	 Gdx/gMXXVbnS/PDL7KCbA/47stgZchV8VYxHJHh9bwyM7LBSXSrv9p4YvsA9wUOeuzZ1Y
	 NnL3t0F1Ir+65GZofuOrv/ibwe/QPuihpeV32NkpYL6To9XOnrQ29sgzD+JWC/WSbNpfT
	 gm6FKBZW1x2zoL9CbtUFm+12L3jUu2X2hogM2Uru8YyxONRd6V7DsOA0QfmWcSm/3yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794512171;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=Q3u7I1yY3nJmuq+49fNnSVZ6NxAiKftF5EDGZUfjWaE=;
	b=k3Qusr5kBne6Wn5o+KtqCwP3hoRFmirDupCF2N4fJnFQUT9D5YQDMbipjnZKaNwGxYM/
	 uVqCemWrRDWqPRkZpZBUHOnh333UaqzjHpulDpEHpQvOJ0cXmXc7Z99c0AM/h86UxxP6M
	 2YIYzezoLocsOVYW5m1xdk53nRh91kqnsLAcgXjjHqC44qNFFBCWgeVF85+o52qhGfBHL
	 48mvTkl3npwgXZjbB4i6Mo7qJrQwBthZxblgeFm5E6T9V0WyTTzdI/wkIRqHYeBNPaXTi
	 RkWvPBjoF1lIxcnOLr7fobDrFQDC8kHBvkDxMaiBxjUFkqhG6+5wuzPBdl8BpQClUFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=LU8nJzdq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D55B606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D55B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=LU8nJzdq
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ACGi5KB1330507
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:36:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=Q3u7I1yY3nJ
	muq+49fNnSVZ6NxAiKftF5EDGZUfjWaE=; b=LU8nJzdqTuFeXxiCts/Icr9sphO
	9JwQ6qneW0n34BTZV0JOHdPmVmq6v/o8AAukNp0VfJtyC1BxJESUVBZnUPO6bTJz
	heXDvu278xn0fp985Ow2X7KOpGQZ22QPNDE8ZkenXzSOzsL3mE+pV15Ld4NYN0ke
	Z4xYE3FlOFj/3hNCfLYkNWEOgkL+E1fKr1d8mgMFhG4bM25au11LSDbP1ZpUQNkL
	P4j6oE2OX8TxKs7kHuTuK5VSeUo2ZEx/0qtZHGl8RSf7BrtesxK08+eNxS3Ts9nr
	J4HURg6r5rm/vNvQFI8Dm0i35N/VUkWCnNGSvZbKTT+YhzyAn8Y9jOOTXJQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by m0001303.ppops.net (PPS) with ESMTPS id 4hwh7n9fef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:36:10 -0800 (PST)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso240754a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:36:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794512169; cv=none;
        d=google.com; s=arc-20260327;
        b=TYK7+Z4cgIiyaj4AL6/59R/GCtqKB5H6G9JEFV8SpbwDKobACPLfpZhhm/VFUxs4uA
         4r+4/zf3/lCUyJmunPE/Z3Rqn+KhGkQhF/CbxOqiT4mwjfTE2HzugHDS8cwjzGkB8JqG
         2MEdXZ3nxajF1wQSSix5l5KusEFqyuJ7AwAfBOTmHFBnAqS8FFpVFzFdp5+ak13DDKwW
         7EVH1I2dXLYwHibFxeT6qKzXwyX+mS6x7BAjq3aUITqpbJ5An0KBfcDSGua8D2TucBZ3
         vXHtuogRFYASoVcexFyDH//B56WYHaMOZlvCUuP6L2Uxxw74yl5eVhqHx4/eQRhMX+0l
         tn/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=Q3u7I1yY3nJmuq+49fNnSVZ6NxAiKftF5EDGZUfjWaE=;
        fh=5lTDXJvXmXCZJ3/pcsKG/rkUjgwM9eiAZTv1TqyxpK8=;
        b=pnlzDFHhObU5meBc1lfLnbLq8oW46OJWZF1LgtVdj6upQsNeWqdzOi3fgrvZMQaI5P
         sP45E7YBBUO7qWqwcn8VY/5LAo+gjiQTwABXyEm1s8PzKBCrmXK3rlLhXvC3yyvlGeCe
         XWpGZUaBytkfB1dgccHGklYqTwgIjv8YflUCLb/arf3HpS+okHyruAskSJ6CDXk+8L2I
         UcBMFn/ndSCSH2vyE+n8PWTc8wXqs0YJ6YYcLqO7grpB9QyYu+Q5EtI67sw32AP4oKNq
         OunpsTDiIgO5YL8nZ4fLxSGl1fkGSZqHHncuB5m+yibyc3nQ441/VqO7+lzI+OhpMpG8
         9mlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794512169; x=1795116969;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q3u7I1yY3nJmuq+49fNnSVZ6NxAiKftF5EDGZUfjWaE=;
        b=SDrJ6sJoxgSuf9Q+GwCfeapGRPq+iEC8BHroenHBVNpTZnJfeaYkx3kh7HNRzcs3gx
         Pk6jMHZOOM7CU0TNOt1vO6XAz6GePpjahDvEiRJCkued6oj4nWVqu8Tt15SM5o9xkos0
         ovsm5NrTaQrhwswDw1Z+G6ZYPm6F0LBDFAw6FQODleWKJsbhowpSkKd4eKPCMlhie7HD
         cSWPD8cXlYhOIMZTLR00zebN7SpWPOWnaY8GivQO3fC05tHg+03LJxRP7KDvDvdvu+Qg
         MMKYh1rWJKE5AP0uatLd/cO+V7BrsF6P/FOMcJOzj1qm/YtDa+JzOQUmoHTpZgZw3kn6
         YOQg==
X-Forwarded-Encrypted: i=1; AL+hErG5rjf3nKPVMS6pMIRv4sxfVB+W+0wNlVOiCf817oGs0/93WJ35TzbvBzeipF7MFxKlNs9JO6HqXoxdyPE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nGHHqzLQiQHT552eUGO31gQUexA/AkXyUu9lrk2jf6nuC3cxo
	xanrLeBb9ghHosMIV5S8HSJ3N7x8MS26UGCPpX6wQAAN9+r0/3K0RX8Nks2n90Y0RlZ1n3/rT2Q
	2vElsWzfjk9DzkALvpQYjYHUj6bizGalWmjb8AVdUyZ/4XSa/nkxyHiYwbh66qSPPjXSN4i+WYn
	0vdftdjKG9D4oWjTbTnjfaW44vaPaZVfG3fZRaryY=
X-Gm-Gg: AYBFou1lL+nvjG27jFmX65W2QI4InChwp1OOYmOu7bsHFz7DUOvj+u0CJePzdPzhqf/
	FzGWvAwxhuQH38Q4J8GZCQieim7u+Z0R/05MUkZw2/IdlEG2bFW4xnZs65W4kYHnnVIooiswXYt
	kziGgevTMQsvEMpodpcau6FFHe6E28GCmc/z2u3cf2bSpckQ2DLEwHVRi65poJ7Poj8NUvQflqi
	+RdVN57GBPTIaAQllyzb5BWWQtf2iOz
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id adf61e73a8af0-3f7a6e9f331mr164004637.26.1794512169110;
        Thu, 12 Nov 2026 11:36:09 -0800 (PST)
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id
 adf61e73a8af0-3f7a6e9f331mr163970637.26.1794512168673; Thu, 12 Nov 2026
 11:36:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com> <DMSJJY9PLHSR.39PSNUXEC82J4@gmail.com>
In-Reply-To: <DMSJJY9PLHSR.39PSNUXEC82J4@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Thu, 12 Nov 2026 11:35:57 -0800
X-Gm-Features: AclHuK-L78K4XX2ZOiQNpBmdIZKiLWCeJjgy0X9ZblQI3qzdXkkSafaXrEWKuy4
Message-ID: <CADh2yMzE1ipKD7N4YBjb0oP1Ko-Z5J6uN4k4_kK=gosHyfsKWQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 00/15] psp: introduce socket-less associations
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
        Donald Hunter <donald.hunter@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
        John Fastabend <john.fastabend@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
        Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3OCBTYWx0ZWRfXzteiCGTw8yB+
 ayXDk9bbiLvIxDSIOETTR/577p0tp9Ri7+OWKBZ+6jkOouTsKP8Ws0/M5CyHOziPYAa+/LpyMU+
 tO6soHEvUSSBhNbUJPZrQBo0+AfBVJg=
X-Proofpoint-GUID: 7ZRlQpbkRWvEcmDzBetB4Osn0azIcfZd
X-Proofpoint-ORIG-GUID: 7ZRlQpbkRWvEcmDzBetB4Osn0azIcfZd
X-Authority-Analysis: v=2.4 cv=R46WitRX c=1 sm=1 tr=0 ts=6af6152a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=_78whYxrdx1mplLwxq1U:22
 a=FSGtspZVazLKPRRdjFEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3OCBTYWx0ZWRfX3/Ok8QdMXTuF
 0LdMfbV2Lu21YLw5fwAJKNVGrj3ePV6I5LazSQJK7b+agbKnXbFxosUQevD0/2t+/gvPMr4pQ7z
 fDgUDeyzNar33WvZs8U9+5UWwvlLa0J6DS/GIZmlJ2cicZDcH7OqwEK3oulPflxfaziTCs1x0Px
 fGmyX+DEKR4OtlAp3lvABxr14CboAvUci5sZvFdQhqxPuoDr0POl2H2dDorRi7xzpCI/XutRZY/
 3FxCqZqLsmM6ElfOsoLZNidRFofL6xssyoukVmfilrCNbL+Ryona/450/is935KAT2IsBmsQKuG
 f/gCwnKhReOSDfUroywRJwmS+dVShd8UqDcwFaGWUPXy87+bgKwzf4Vo1Whcj8oJX6o8R1Ckukp
 NLIqebTFTJI90HLslIFzYtItEUrkIZjxH3aSL7yTouWV447ZRpSqRlXC2XVQg28IkxzhbQRYR9h
 ecSSKD+cdh+fbhwMsqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01

> Some of these can probably stand alone like the bpf decrypted, psp encap
> helper, and timewait validation, and be submitted first to shorten the
> series. That's just a suggestion though. If there are dependencies on
> the main series you can ignore.

Ok, I will re-post 6, 7, and 8 as Fixes to net.

-Todd
