Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794444717;
	b=qfsrrp6LBirIAOA9D6bkVEGwBhVHgRW3sjFqbkldHmn9x7P3cKfFNMVina9DsXSHxBSF
	 d/qjpcZSB9n3QHjf+bH/U3QWQJvjm4FYNjfbRK0lXPGhMqGvZzgU5J0C/hA3aYTbWW0mW
	 5wnGsh6rCYObnjHWy4EG6PW0aaIrlxoZqM9uXKJ/L03orcNsDyVoBGniYEDGnCuBPnBg+
	 53nRicEneaHAPmxU8Cey80yKRP7LKtiguRV9jCYpGDpH9m8piy3wDTjyH9SaUUJgS4bhb
	 7wuFbibADI61F8Y5v0sZevaL1CAaS6LbXh8k8f9pqQ6quL8T/8vrmfRa5vNw66ardQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444717;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=COvz1LYfsfnPEz5Rqox0HEgHvMOUnAt/U2EOg+WNlZU=;
	b=vFISH3LTdKOo6cztSAgXDBrvdTOp99Yxo5VvR4oUNOo82GNjH8zsXR8yzS/nWbJznQZT
	 4NYWsbKWJYEr37/OHuPIYDfJCjz2tI1BVLw5BiobbMk6pHUZZeuHnmWTj+UWkPKGFAVxQ
	 nZ+BgT1V7dN3H+wvAhXIIbIKvPBGWarNJZ348ee2H6STYijaAmOnrJg2FDhhuXy4KUcAp
	 MWdkCkTE96lVDvth1UPw651LYP/j1rrBrugJ2uJ5zYRRrlaoL7zhL4fiEM9vRGCE0eUyQ
	 6YV6zoRQeiNJOeM9IaC6SK38VYUfslSqTTRn0Jx4u9cZGYZ5VF+Ia2WpEVB8KOFmH5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="M9reJI/S";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495BB606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 495BB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=M9reJI/S
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC02Unn706085
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:51:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=COvz1LYfsfn
	PEz5Rqox0HEgHvMOUnAt/U2EOg+WNlZU=; b=M9reJI/SbRv3KTUBSw1H39UYEB+
	5lytBhF7hV4YQaPVXjAXypBnalL48KDk1A1rPKkW4JS7QlVjoHRcEgxDsnA3DkFA
	V060Ck2jnCyXydM8YqDn8C+78ia42U3pbptfzsZlVy9Q4snVD20ijYvY83yoTAm8
	ocCd0aFLyIXSlQmjSjI4EMdJy/wmj2AUKlRJZxWjN0PrKyVpD34ID8GoMpx8amwx
	sUFDPaIZYs7/+VMoJ2ms1f1pJNJM2ePMvINLR5wuKhj4NwbcNnaqKiw3F04xD0Hl
	fQXX3j31JGidEqXUi2+1MYP8OtMbJoF6w9Rm0iCvm3rpqRXC98O03u3+rog==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hvagw1up1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:51:56 -0800 (PST)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so318983a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:51:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794444715; cv=none;
        d=google.com; s=arc-20260327;
        b=QYVtF4hDth/bXdft2+LIbTqKGk8zrbVk7rpMD1nEkLMzAyYS8KyRlsRlGQ85n280Ll
         3bKsnxOP9kZWFy2gnCVJnjcnP/DjjFBF/FFUGSUTtIGU4aCOqvfFEq6KHmILt843eBM5
         FJhxlxpHUAk23uub7jKWt/VORNe/s8Y2MKsmCtvrD4GYHkFvElpomhBB1zDeAvUcXWJb
         7r7bkIj08Lcj4OYcWG2wNm62aksS0e+jeswSSGkPg0++bz1USgnVY6uLd5TvqHvRaeST
         1ASY4KC3btVoKiJ1THIIyB+mOU4T9ueBZjrhKYVs+UqPdvxx3SD1F6VwzVC8LsiQt8S8
         TBDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=COvz1LYfsfnPEz5Rqox0HEgHvMOUnAt/U2EOg+WNlZU=;
        fh=zy71fYYHvriAaKmjozefvKuJSPE06NIvjfksMYQ/chE=;
        b=VIV/0OlHA2e/VuBmnH3EfS9rnkyNQKAeaVvpsg1omuqOXpfdimhycnGyXtEnLexHKf
         A80gf7AMUqnxuuHTOw+hWArT9/l0QSx7j7n48gyTvRwx63DO+nIqnmqBySnJ6qQgG0Yh
         TgFnwimJzq3E47fZA+YCIX6fajudLo+7LiqyGbTQrstxKg0iMHDbk85i53xcmLO5U31D
         kUyDmYBUfvPTIedP4f2nbAkvEtWU7d0595IVHHXReSq5YFyMsdtKgmY3vhf/tGgzowm9
         ds0WXzJnY8J6URPsmQAgJSmATLgdZVLlSU+UyQwt46k10qiMzNlvJptdGlaEIb2zCdN7
         Z5Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444715; x=1795049515;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=COvz1LYfsfnPEz5Rqox0HEgHvMOUnAt/U2EOg+WNlZU=;
        b=l63jHWNBbjyOLmCgHt6r7+tKI8mjjQ+TMyC66WIbDgAH8IbTT953bBFHkGaWSxCTz4
         Oa2cT5CKWbbFF0e09Rg8gsx4mzWX5hv5WMCb6COXrXDuRtE6nuko5f48pOAbbX6pblqd
         lbBENijCM7Kmr3pKLv4aUOERetXHYDVxwkM7BmYv+57Oln9pZ4LWrNhn7QuvFJVzZ9+p
         xER3YrfUws9HUJPj9+bBNIsyDC484VD0xcOnUEDN/B/PgtnQdE9j8qUSEwpJ2VNyH2CG
         gkf24ZJDgLSGCvmGxdvnQU6OHu4k95gOMwTWM9MTwgtXMTBQWnNG4fyHZXnEYAKlta6O
         xCPQ==
X-Forwarded-Encrypted: i=1; AL+hErHLGRtaWy+FjpV+dxr1X3z61a/fGfIYj+R55b9ZxLRr7sPSZxT248LGVV/PEt5J8Ey+z72IEDCb6MWzhQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BxYlyT8l+LR9syzu3Xl79on44jvz/aKv0AQeOKPdm/XSVDLM5
	IeY4YxNX/nvyCc4R7rCZohB4oUrU/Zh68TJS0d4MF28oU7o12XFrT+O+68ifuaKk78tMJnyOu6J
	n+3Lzaf8+nTdGCJpv3u4X/yIdiZ3gJT1PhTaHU8r6+fHMrVxI+H5Xxzoizj2ooOpyO3ACIi7Byn
	WrreYyNgVOZUDBkC3oHrlQgbi9+wJz2PlZPPeKJsY=
X-Gm-Gg: AYBFou3+20YO9T+LQ2PAbjWiFjD2YcNP2sIrQSS7nMCKGGkcCbf9EM869MI8yXmuSpd
	2Cij02X6jBQGfn1aiurC7Z4LZ72Qz51caUoozKbjdtzMlU5mAGEcLfBAzTVkNOwObyPeFjk82wI
	kcgaKJe4T47XaFRKWC/1Fk0ib+5fT2aaXClqAATxZ/Cyw4Ay7va8AOD/uRc3q6BiyDoLDrqmUfz
	yLAbNTbe60/K6Vi/bR+/mp5RjUaSshf
X-Received: by 2002:a17:90a:8c8e:b0:3ab:d26b:c2df with SMTP id 98e67ed59e1d1-3b197cadcdamr475950a91.27.1794444715019;
        Wed, 11 Nov 2026 16:51:55 -0800 (PST)
X-Received: by 2002:a17:90a:8c8e:b0:3ab:d26b:c2df with SMTP id
 98e67ed59e1d1-3b197cadcdamr475937a91.27.1794444714456; Wed, 11 Nov 2026
 16:51:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com> <20261111005533.6436-5-toddfreed@meta.com>
 <DMSJB8MZZCXK.MCEBRZQDAM5Q@gmail.com>
In-Reply-To: <DMSJB8MZZCXK.MCEBRZQDAM5Q@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Wed, 11 Nov 2026 16:51:43 -0800
X-Gm-Features: AclHuK_TCwMOAV1WvAw9HnkDUPDvVUUNIB0-FrcHVRqyh165RWlzsz9oCiRdiUI
Message-ID: <CADh2yMzdD3FSJSAY2+vJYADwRg704Ndqwz2DhAC3nhmyZe85jQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 04/15] psp: add support for socket-less psp associations
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
X-Authority-Analysis: v=2.4 cv=a5ClZkSF c=1 sm=1 tr=0 ts=6af50dac cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=kkcUborcUVj0H7zxAXTl:22
 a=EaETVqjJsHDKXBk3jaYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: xVLTh1X9SsJ-TM1RAW0ijOwdKd7N8QL6
X-Proofpoint-GUID: xVLTh1X9SsJ-TM1RAW0ijOwdKd7N8QL6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwMyBTYWx0ZWRfXymLTG7E4OAwh
 5Pg+Var0qe7kWcu8MK1JfOYuWEqWOTFF1SFHnTLBdHpExRbiTMs0viV1JvzkNBuYKljBP7SMSDC
 PLE/Oae35P9K7HwaqZF4TscCjlEi96NCgjWBYsftYegp5pC2Q7Em/HzDc2qZK1w89jlr78+3tNX
 KaQQUBu2s4pSWNpTTpApwI++OdipFbdR4gWkXrNwp8TKy3tKbNen/D5qGvvV7pUQGwF2n5hJSQi
 ahobzCMkiy020xewZEDkALGCp/naqgijLsh+Pxx7RC/S8NG3WTULXFvSyIq1Jzqd7b5n1TEgLuN
 lNE/oXTjT7tIylx6sHEiMcv5dpdqHVMznwfA7MQdEk23zaebSrj5JA+OmuAULHOXdogs6E+4gkn
 nKNi8MaKLsuUBXHQMK1kJR+IDWUTeWOps0BfXkgY+307/2wdXnMNlQOr0sY13d1Y+HeXITlfs17
 /PDV3EzHFk12yajlkRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwMyBTYWx0ZWRfXxceOUgKSld7Q
 UNu1p4Uff5mZy8kJpFKWdqA67yCM63wwLuy9Uusbn6btE8j4sDWrmKldvF9Q38RQHZTd4LXFDLa
 kQebWMzIPnrIJ2BULCLbFig+eX7Dufg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01

> I think the design could be improved by not reusing struct psp_assoc for
> the socketless rx spi accounting, and by not placing the socketless tx
> assoc on the active, prev, and stale lists next to the socket
> associations. I'll try to comment inline to give you a better idea of
> what I'm talking about.

Sounds good, I will do this.

> I would create a separate list for the socketless tx assocs, so that
> SADB handles can be flushed on psp_dev_unregister(). Then you can just
> leave this function untouched, because invalidating the generation is
> only for __psp_sk_rx_policy_check(), which isn't used by the socketless
> rx assocs.

This sounds good as well.

-Todd
