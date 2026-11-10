Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794283986;
	b=JGoX+UyNYIHwEGm92SNUJHyoE6g+dS4h685iOcVTJytnfmRbPKk1dOb1apYStHim1Muk
	 fCGZH6yknLbvRs2mKcQZAX6b7cjPC13dI4dygsp0PITNmf6BE5HQctFK04w27GNXT+r/M
	 w0JDBx0bJaTCM8Fa61x5fyotecv26cvhkTavwOO/dNtR4ALoZ3AecaBKAMQfmCKd23AQv
	 BsAQDSGFXgz5NA4kPRhz0aruYInZiAiE+Vg5Oj62qwyTsXanHkb3M7wYIiCTftmGq5EHl
	 7e6ikcTM6kXVBYYGlOMu+cGCh/ZixjeNuxFqLApMm+8Yu/+WEw5i3qSkHfZu/ScmTaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283986;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cCPtgOUClLidfslbB2P+0rQ+331P45eB5fyHHdLHlh4=;
	b=DjKmoGiWvw/gvkAEpFPXGo008iAv/r52Fb22mAKeFGJ3XBvA5ITFtzTFdrGbnKu0R10M
	 lYl+JpghBdv1qCc/xVMIM2hdAhdS9NrFi0xDYKlGZ6wRB2UiMBNnqLYT2uEW+LplZ847W
	 D5jfe738FAs2iJDX141GRniDf5rVn7RSK2xx3wMR99kjM9iCMysYAHvhB3vB45o2bmXqQ
	 4RK61y8ZmuM/EFHdGKJk15R7dpP/kJdo7EGD+NGZfXseeqMa3EUA0iPbo/vYQaajMtsYl
	 k8iIxqfMiWNe8kIasYRkGiAzExqnm+6cD/SjADwUoYO0O7l8zMbgCxDP9JxT1R3wsFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EBfqtfHb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OskcvjNS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F10606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72F10606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EBfqtfHb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OskcvjNS
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ADBs2295639
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cCPtgOUClLidfslbB2P+0rQ+331P45eB5fyHHdLHlh4=; b=EBfqtfHbAgl7tAAY
	YgQqEoqqW4D2gW14J8UGOZ2ViRejdGVYjoDnKht5A3LKUHmrNOMfMIUpKVZxGr+q
	jJNSo0b7f7YPahJskLPcS7WrMP8nkSw07Utk1+szS1WQ5NUthbIofbWJbWfQ3fN1
	wyGRkzrQIf1SEeiYdnVINYb1XMntq2R7oidqbIf674BIoWo16C2IhLQ9gyDKD3Y7
	mYoaB2xSXLiqnjIfZVqcjTAB0NS/hcFDS+od475aU5oYRbWst3MqqkVs//doYG17
	WL6Cnip/rvHvReGtm89Y4IrQiwR6q2/qdk/TpVgcdXWBALu/g5g0PRlvLtTzpDTo
	kisDPw==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5uh8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:13:05 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67a6eb09b1eso2125499d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:13:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794283985; cv=none;
        d=google.com; s=arc-20260327;
        b=I2Qi6SrJnDFdZhM6cdkxfYLIra8SFL0UcrjmruNgUAXnaWWhTj7sIHeXdvl2NRk8MI
         zH9nL2RO4wU4GzCneWtvOWAlakAH1H7KPV459Pa7DKcx9BlB02EeWSIEXzcDf5NUk4sT
         vq5bAmsBJjYnD4VLh+1EOcRfVatAfqLduceoTKe2t1GMl/p4glk4hxxvbyDVOpIGGm0c
         4MEzSyGzki9vZn5kRHx0JeX9R/4pyUpSHOI/ApZY50ptIdEx5oEYCfsjBbFNnFneyf8u
         asdk0cMN95GS2b5vvWOD9hcbd0e6WUQBtcsKwp1Kpn5i3nxV+hUSLq1TiVbvZ5YNca+0
         VwuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cCPtgOUClLidfslbB2P+0rQ+331P45eB5fyHHdLHlh4=;
        fh=H3RxV2XmWKZHHfX6Ac6nxOm0tiZBfPzVUM3tVq0w8+g=;
        b=kNJueH+FJgC+r++UEIHWVbn70O5dRIg26sHQi51Z54weSSOnpTbWhYEw1NRu+qe8IM
         PO8mFqNOja21a7RUi/FLCyQ6Hp0s3UZxQ2JNNMepSQBFKtrzv1KuMcSi6+u+69bfCUlf
         hPqB6NWsD+iEX8xWFsNwJIOCH5zxjpe5F1o5PxalD/eAWQ+9Eqh3xrrW7H3kXcumRgHd
         n57Rq88ElZA4Ugna7VmD+xtPiKAKFblWNd8FdDf+saerxLHqQnP64eaTT//IUH9JLa9+
         /m6x0pS7apCUgZxhw0sW6UGATfT3pVZcmrBlKeTwmd1WeT+r9pM64uGa/ADGd4DGNvC9
         foCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794283985; x=1794888785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cCPtgOUClLidfslbB2P+0rQ+331P45eB5fyHHdLHlh4=;
        b=OskcvjNSHi+7oFJRQzXHcZ1HPLV5J+R2LDTQDULTfkzbgxiNIEwAhWA7WZvbNSW36n
         2HFqrF1uU+CQ8HG03GLwi5ke7nxg5rlyL/xn6MiyD03C9dCPI1cCmor+QRwKR9BFAgYv
         6T2n4eIWmBZkBoMicVonvFHnQlfvJ9G94lh5VoIPnPAhFezc3VYkYf4YfqMc7oRXpjlB
         EigcI25vfF9QYOQ6aufkMQbfxqArN0ayTXVcU28jzeESsqLbb2x8L8ZYrImepP7/HjMR
         qsGt5Aj3E5UFxQt9h0V9ojLNSmo4RDTv9QxLlodXqARW1rv21LQeAUhvYkAixybbhnsf
         GceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283985; x=1794888785;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cCPtgOUClLidfslbB2P+0rQ+331P45eB5fyHHdLHlh4=;
        b=sySkfWQNvFhnm0HRTW8YNuZn0oL905aUj2vXxDNbErhVJ/MawqAlBdqldq06+2nt1v
         B5m6o4z/dzmmqPXCkbLi1V1sdTBL8zsqpwdx6ZreRja7wakVvcQQgaQexCP2L1UTR8C5
         YUBs7Q9YpkwOqGYZOhvMP5Qz9UKTDeUGTktwo8UVcQsnh23XMCGGRrl2tqyqoZa5wm6B
         nCgS3ReirycQx9yTdf1ENWI8LClFUtk/V58+cUYeQp6l8L3z5cwZXlFOXQEMK1BuUK2n
         nETxhJ657KNmMjG5j/5viZ8vdqOsjWmgAfy6YY9BW48uMZdF9rQHIHiQuRV/rkuWFFal
         YrJw==
X-Forwarded-Encrypted: i=1; AL+hErHaoZvBhpX4NSNNvvXV5TTwRti+wNZ+ZRrXQGw7bDsKynMGj1uoQGEslF5AFM6FCP44B8eFZPkIARkGs0I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fhCTfhzdNf8pt+iu2T6M3K8cmXfLRK+bT9Uh4Sl4weRfgCGG0
	qt93obci6OlYMes1uSXRxnSJrNcsnqYMbqBD2zxUqP8zfCiOb+/90S6MP+/52QNBNduU1Cv3qRg
	VQTezf1l42PmPNmUhEBBgcEgViIQ3A+GSP3fiajTi1FSOj3hDiTH/CPDpxaQw8ruKtNsRTf9Q9s
	EJ4GhCb+bvOdS8Wcl7dykf6T9BVjRzwImSBhtRpS2SPQ==
X-Gm-Gg: AYBFou0ak1D86Aw286+N/BU0cKUlYmr4+9/Rp9LahkPAKBBbQV51Tf2FyBgBfLlX0bw
	fl/Wvc8e14ZVHnFXmw6WmSBtZ49rT7j2rqjsZNJa4Brchn1jzJYn9nLYSsTkRNSH1bcE58idAid
	Zc/yTqCf6/yL9bwRaNLeG7dqj/OvkdIXlz0KCCAR35JgwuRBy09z3oPBTTvA==
X-Received: by 2002:a05:690e:80b:10b0:67b:edf1:7294 with SMTP id 956f58d0204a3-67c567840d5mr549812d50.79.1794283984516;
        Mon, 09 Nov 2026 20:13:04 -0800 (PST)
X-Received: by 2002:a05:690e:80b:10b0:67b:edf1:7294 with SMTP id
 956f58d0204a3-67c567840d5mr549804d50.79.1794283983988; Mon, 09 Nov 2026
 20:13:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-aquantia-poll-global-status-register-v1-1-808089824a3d@oss.qualcomm.com>
 <179326624025.3327.5471427454050749790@kernel.org>
In-Reply-To: <179326624025.3327.5471427454050749790@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:12:53 +0800
X-Gm-Features: AclHuK-34PzkdjjV2B8UNP3izxEprRgMKp68GqqvuOTJfXarQQYQmDgBJr59fVQ
Message-ID: <CAPTcHHQrL0HBVEmfqS=x+uOX6p2f7pbTe4j3-DqLs=jVm32dzQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: phy: aquantia: Poll global status register
 for provision ID
To: netdev-bot+sinfo@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNiBTYWx0ZWRfX14FC1zQD6DQ0
 1a4pkTYy9w2Nk0VDVNzYb/PuFFOguQpJ/i/drlXjKzBPFvoZ2XtF8wThvjMVvTJF6BJ3hz/MjtA
 EBupTqnSlYbRg78NR5WUk9sOJ7nPPS8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNiBTYWx0ZWRfX5zUJp/nHaN+s
 LkQSqCSzCJv6t9fGwnCPK5ridhugB4WMTKtB0yMplzy348QVCeFb3Js4bIjtUe0hr35JWcMlze0
 i/DgZSza+ZgXS3C/Uw9RYt+WbWvVhS5iQr/0fV3xlUhWI6armw1TK8ITjTFi4e8AABQRycM0PSX
 bfsx0aoE93g0C3Fl/DWQ70Tnt+lTNzVfaZ3nmixTfThvzNPhX19hCfmuN8qGjF7d3XYTyNYHFNw
 lQrVxdlwDhoACUbkRgaZz5rLaL6+UxpJHlpcgTT7YhTni+NXc6RaGgJa64D28oyBivyNEsNtO+/
 BU7cXqC0lv9roRJB+X/hM4Qek7Eu71EZ9m427Lf/TVzcmIoocKqhfvTY8WSOs1SS2nZErhsEgSF
 4Qv1cNzDQFRZ+OSwWCSkz4RyUB267hJkYZaglb/itg/MUzUkmoB9K+3rRsePWL1gl9cNyZU9tlU
 uG/HmdjMoU14CPSp6gg==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af299d1 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=khBgtfIvKfM5PKhOzWoA:9
 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-ORIG-GUID: IJAbZyd8Vr1YtyhkTY0CxWu1bAAHxnM0
X-Proofpoint-GUID: IJAbZyd8Vr1YtyhkTY0CxWu1bAAHxnM0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100016

On Thu, Oct 29, 2026 at 5:30=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
Yes, agree, will share the details in new version.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
Yes, agree, will share the details in new version.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

pw-bot: cr

Regards,
Hongmei Xu
