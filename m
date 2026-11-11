Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794416441;
	b=XvfjHzNMfq1TXjEC7+5Cv6ybZh5omWn2DUrPhZnasSNVxa6bcMd91T2GjqKr/u0Uxb9o
	 3K/WQayWcu4l0ht7rMTpUsFbeWH+hTQ5uo+lFOYLSpmiGV0MPHwEJolbWS/9WKUL9UuqU
	 u955vqiLWhONvrYSyhhDwabNxQ8GxKpLjMW6GAgvL5sta2kucFXsTtleWrOZqPGg14En4
	 sRXn+x8WVSo9gMSiRpSwnft8FVe4yVTcPoffhmddodMtYXMKzyisR/WvffQ6wz1o5ZI+W
	 ynIlaCPDwhUbzsAk1xgUc9CuNLdU4sjH1lH7JzJr+wUKDq1F7e5z78GMwqCvYAUPUJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416441;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=74FoFchhuSQQ2jSNjsBXa6BV1QiK2Fm+lk28fFAbdUE=;
	b=BIKzk7v7CAtoON7RAZdp09PjleG3TtZPraBwyMraOfNJLa1DTD/ti3NBEUfc1vwir74P
	 b8iLMBLCaiebFbDfPFCKZVd8TJqMK3ZuUWoRQi3lz9vvRTbA072/k1JP2jEE5KcPqf3gE
	 eSd5jFPWQEk1vLjLRjbt56FQ4XbbKZznQDUc6MGU2czDKRkaFrbXtfN0MeBYDyohcMPc7
	 VDw2Kc7Tn0FFw0HRkJST+CWzcdGl87hZ7bbMbCGLleAZxfumTd7AYjbZ9WhmHP1At/E3W
	 2m0DO10f3hlgR+3j5aBno5kohBJUN3TkChiAJZbTJ5NX71sMwWyXeE3hCJvSFyHH/4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=KKDUZEPW;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544E8606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 544E8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=KKDUZEPW
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF2pll2655618
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:00:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=74FoFchhuSQ
	Q2jSNjsBXa6BV1QiK2Fm+lk28fFAbdUE=; b=KKDUZEPWjFxEuM39SyRtvJ/r0/c
	+hQ8uhEGP6gr2JUPPDpEGcq0NTiQEyQ9i8Y2g3dv39QgOtx59p8EVdbDUQLa6L+t
	94/0SvdQaKFzm4Cv+3qMAatvhm6L/NQDjRHUOOvxpSMqYTskbxEpPNPMbZb8J28Q
	VEnA6gATK7C0rGaA8Xc8mBs9uwKNehQFzrIi16cEvw7v7laleiJrStlzJ6yosvTH
	sB1t+/ZON2DzbCDWmVTFGDgroxRJzYUeSJWeXZaQlf4jqciqfQuDmTSiFxExpl88
	c+tWUz6RkiMrJFompExetsSO2R/KCDNAgyE+nnENK5DPuycgfbYUa5suUXQ==
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hv75e0wvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:00:40 -0800 (PST)
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4931c89d228so2276241f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:00:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794416439; cv=none;
        d=google.com; s=arc-20260327;
        b=E2VisTXNof2WKFaKvoqlbZfr24kCNP8W+lLp3+5XlZLKBSW9cQNA4B6NPkB3C/YUkE
         409k6c8EBsLy1f6V/iSln1KnvKXUFkdQeSrRmpiEkxrFbAYC2kxhSmEThCuunLGARy7B
         TMtQIUgzahUsrrHt+lRlzh6J1TFIatrfijI6uBCCzCqvO3nwEsYHXa93HkWuYtiM6dlQ
         yjURNIbYrf6DAsPqlKPQVwG4EFvQRPKIESe3hC5BsFh+WR4hH6o90UGN1xLt8FWQl8AX
         ydTz/LzFyw5NUBULlzu2aXzSDo6/4ggy56XT9ndXn3OBsvIfmM+dumbMK7eWq/YHW0Dq
         fn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=74FoFchhuSQQ2jSNjsBXa6BV1QiK2Fm+lk28fFAbdUE=;
        fh=fArU82va6ici20aiHEG9P+/MtaYqbQwr7z8IFItM308=;
        b=ZQm9eHxygmC7lg9DZWaXxX2OTjW6mwGw+cChnpdSWWexxO1ma6NoJb14Mq9lDHVP31
         8noTgvVZieV5a/Ewn/ENoT1R5rA/VcSxujWwpdHA5SJfC+fDtt6Cns2YjSguhPOgRRHg
         Pq3mISQbuJGJycwig8nRzjtTi2mW3QRgggz7niF6/RLDtJL034evDpB7XPEaM528Mm52
         95cOC0ZMxCKxaJNLtcZdTnVLazjpNIxRpXRb7WI9jo/P0oMwiol27y4tYrZmBYa2MoVU
         xKTOZSL2nL4oz8g5FwfHFL5GGWKaYpN5NXsbLDUJUogiWsSqzZyWgubqG+FZMpdplDlj
         bc8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416439; x=1795021239;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=74FoFchhuSQQ2jSNjsBXa6BV1QiK2Fm+lk28fFAbdUE=;
        b=J8+/fmyenxr6qSHMM0zPHObGqrHwS3Zwaca2KxRV+NnIEgJF0ujS4M5rM2r+55pbOw
         LUESlcwTpJkrnLq8YBXxghAObfy0sFIwImy0J/6T0BvoNmvJFuZazAwcRTPwFfwJBU+t
         Ib4AtuTuvhXqveBLihY/lo6kQwlV+SgairhSjsfc/+7rp1AOblGEWrHbURJbHhFXbgHc
         FrCUnJsL8g2uAJ2+HWT50pDOCk1YV+4T49lWE/Cnwn+WOZ4rck8zWJe1HIi9J+7SwnQb
         pjwnpAU9mtfJM4OMKFKcRXb7nF3KkraSiKUZX7xIzT+CRyEceI0QtdBNz/5UbvCODQUH
         3bsA==
X-Forwarded-Encrypted: i=1; AL+hErEw9qaGwapou2afT6JtRwdMk7XVP0cqTd1oqyhIcZ6wvXZ1vBt7sgAzJdLJCyyeHIQ9wkYfVnDYuX7QwUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YJBSlaAuzhF2IfMftCfHNMYJw9cCJ4wu6nXyeoCJp3EmnZJFB
	tFfZRO7LPO0OGP7kmwPdnGzAYsXRFKV0j3Xf2OVnzV7GxXBIR/BqDclsu6QvmtEYQvtz4OwwdLs
	o8qjdhHmL6k30UgqrTfZkY8lUdOstD+1xFLVWWukUqL5uKaAow7JLnbffq7SSfHCArbpW2EpLG9
	fp8hL2Yl/YxxpJvvAQxoPPbfTbAVBF/BhrC6P4sck=
X-Gm-Gg: AYBFou0DEZVpGrpItxF5q+GX/p0F0+yO5wMd/fpI3bdS46gj/M/Mqh8ECHu2UJZnhNJ
	1nEhnGBlt6LPWGcPpKHd1yb7LSqiAe07Oc3Pm0uPsWfGHd3i6KwffUdaeYqUErXW6J8Cf7G37Qb
	r5tKinq7IzIRr2c3bHXIpU+Xfbq+hgEKvhpmL160RSKtLABFzxA4lCTVqa4jraCJg5zoN4pdK9L
	Wt72NPo3cvjRyIQweQTR7Z0LYFPgNei
X-Received: by 2002:a05:6000:401e:b0:495:5c83:51bc with SMTP id ffacd0b85a97d-499c3b9ff3emr5473693f8f.5.1794416439107;
        Wed, 11 Nov 2026 09:00:39 -0800 (PST)
X-Received: by 2002:a05:6000:401e:b0:495:5c83:51bc with SMTP id
 ffacd0b85a97d-499c3b9ff3emr5473639f8f.5.1794416438735; Wed, 11 Nov 2026
 09:00:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111003111.3826942-1-toddfreed@meta.com> <179435738198.2168702.12439855185550580348@kernel.org>
In-Reply-To: <179435738198.2168702.12439855185550580348@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Wed, 11 Nov 2026 09:00:26 -0800
X-Gm-Features: AclHuK8tjqwSs5WvfY5ngy_lWto0eQaig-gnzMnKLMUSIRvHhVTmNTSnDzSw4Ys
Message-ID: <CADh2yMyWd2JMajjp42yx-2JEa6NsMoX1JK+2qVaci9vths6WkA@mail.gmail.com>
Subject: Re: [PATCH nf-next 0/2] netfilter: don't send decrypted skbs in clear text
To: netdev-bot+sinfo@kernel.org
Cc: netfilter-devel@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>,
        Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
        Nikolay Aleksandrov <razor@blackwall.org>,
        Ido Schimmel <idosch@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Boris Pismenny <borisp@nvidia.com>,
        Sabrina Dubroca <sd@queasysnail.net>,
        John Fastabend <john.fastabend@gmail.com>,
        Daniel Zahka <daniel.zahka@gmail.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        coreteam@netfilter.org, bridge@lists.linux.dev, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=RthQvymK c=1 sm=1 tr=0 ts=6af49f38 cx=c_pps
 a=pX1sPZUoWPGeQgUnKQNIgA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22
 a=v81qpcjm-LW16Aac8AIA:9 a=QEXdDO2ut3YA:10 a=XGGHjNwGSpTZ5T66x7Ix:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfXyAaKtNxR89tW
 EDJhK03z3otSlodxwf3gB0t/cB+53nzMucmoPSAOgtR06OmqQ2khZSDNDPhIG1hBJRv87l5Ehz/
 Fy2oMUn+zkB4qzhZXGq7viAjgt+QDyD1ujzqRK/MyWRu9mYDsCNWEjzmMPioXu5hurL/jJnqSCO
 cfdqTHijACDVoUH0CqjlKPIoSJFRi1YU5GG+b1edO+pHL/WE8Dtw2aG80Z1KBzoaH4aDgTH9I7C
 7P5azJpezeJKZQ7qjmmGt7vRSmvUztz6J2GAMjK7/G48Y18IKqBvVODjCg6zhgncu18OKfF0cDt
 RYRM23H53QS9Vnt2a1r+GMulRZaryr1Oz/JPPMFENa4zlg7Vfye1xhr3UCShRqTiUBFaL3o4XW1
 6o71x8P+fQjRK95P1YEHcGJf/Z+bzCX89yUO3br+mwT2UnbgjJTFnWC9Nik+pPs7jrtCX+I/uBM
 gqCSiQWop2F16ohb8Dw==
X-Proofpoint-ORIG-GUID: gx8Ba4_Mk9z40STQbA3O4KXt10KWpv19
X-Proofpoint-GUID: gx8Ba4_Mk9z40STQbA3O4KXt10KWpv19
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX31uYyuM8iaAh
 B7QJUBMDaFoFNO/chxPGiPrE8Kr06T+MVkKncb7DofN8/GzwkVFjC8CwNTBAX86BGbtzbTTFW5/
 SivqmwtnJONSpMNo8v5/WRYL47XuMtw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01

>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

Hit during development on crypto offloads on the net series that I
linked to.

-Todd
