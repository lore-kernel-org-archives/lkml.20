Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910642;
	b=EsTDNAzt+vtS8tJU0X8G9wNrDarn09pgblbPSYLvl96/QdIBnGZg9JeJcIF7OU/TAVLq
	 eZ3gxf5L5GPvZsiO0oHPZRBU2y5GMlEJmOKWmVFKQ/m9wjf6ivNtSdQgwgYUSO42EW/9r
	 pXpT2toDdetkmQ/eUL7PJAbFet9Gk0qUphFHENQq9vLe6OP1/pBzHe8xckVN44wqwYVOs
	 mROXZeNYvA3352H3hEKPW5cwiM/ao7APgDzED+hKAWPsWkNwaDbO5TgkstgGWQ9TR4TgZ
	 pTvBz4vQ4c8rH0eWwWbpdYJhJt5uqUteVkGQIM95tsHF9bAb+N3/ve0xLboqqfFSVUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910642;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wy0o00qQ9NmDrgxeDIl4krt4Qft031prUV52bY95lck=;
	b=0rgQlaUTW++axiLuZclSqaC6lGVhyjhOFbnpyov37yLlL7iUhzvzimhgAb+HtezmGDDk
	 prQQ+bcuhfPcQsphTGHKSrwzRE/FmkN+gGBrCkXOYA24NEr2CL4QC03boam5hlJatMKqQ
	 Ehm/hPdbUBzasV0jTOvQeIUbIg3xPGT74xmSmi0SX1Tvs4Z2H5SvjTe82skNhwPfb6Sos
	 eW7eqD2yMRzUkZ6Ej6PwyJD4heJ/HGOvXTeWSVI1RlRPgem32fwwaDa/WCMrHhZto/scx
	 lu3pUJ/fw2UHJdF2EB+WdSkgjjvABrVeLMp5fW6gvS6FjBmiv93k7J28C9wLhnoCTrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gmSd6pp2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eRlgvPkj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15A1606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E15A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gmSd6pp2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eRlgvPkj
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8lXYT3624134
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wy0o00qQ9NmDrgxeDIl4krt4Qft031prUV52bY95lck=; b=gmSd6pp2gxmgeKJn
	lo7uVTqxtdYWP4b0PrnTpukDzwAaIStTUl5WZn8arC2IZ2/tCCWM34OWOyl2GnLh
	MaFw38aK4rpe/r3w7BCQmZQ221KeHz6KSJy0+XgD2A3eg6GTSeHrmOCUNKpGYeEX
	DQU+UaxfABfe+/t5qiVJH2UPFFOvyKOOREw9rrisAUDTOG1OM7GISdvnjcndlGKo
	zVYT4vv6Sb+iCgX+qFE3M9dKntJcGSbypHpCZ95wdeOj7t468LbIO2Yfcoqjg5S8
	Y3VvHh8BAY0xEnTMHzcugjF+GT0dmNBy2IPuSiQurcGXz5q0ChbsT0tywKA4JuLw
	R0/LEg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rek2y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:17:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94975041698so179749585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794910640; x=1795515440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wy0o00qQ9NmDrgxeDIl4krt4Qft031prUV52bY95lck=;
        b=eRlgvPkjKtfuWOs7l9YMAeH8UFJnzxOUh8mhEhvkHFW3gcFGnzt8pOGJ11+dKQuC1W
         4dlbl/xXBoarfI3cLAg0H0B/VZphyvg6KLCvu+vL7fUMSP7EeMQbWly+VmoKQId4BmW1
         OHpHYieaI9kLwjTmxoMboeXHDrw5pWn3mJWtXPaKyIMXxlO5k/XiEN2X9J4xcHbnFKVB
         OdeHqrgWTZjnc+A+Sg+C8MkWmT3h8KzVxvgrv1laGMVYSiyHjqXgsUboiVnUHn630buW
         16PyC/Jio3ZnNNKIgzfgFL3SUsIs/ut9UQuemxavTg+55Um3wKJcZOeP1wkqIs3ChF+S
         W/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910640; x=1795515440;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wy0o00qQ9NmDrgxeDIl4krt4Qft031prUV52bY95lck=;
        b=HG+lGTrYFo4iJ6hBENYs7rZrTrjxEH/2DfSde5W28TVwyUcOS8OnSVQqGQlH18XEfV
         o9OOYVXZM+lizhRTVy1EcxJc7bEwf2P7OZcqdZx+CLWV6VJs4VIQC7feGjFI0S5fUo3E
         CxDK5D0+JEmyIPBwXHZ82RO+P7QeTYIy5+qKniHkD47Hir6vCwcGS6L7Q1DuuHcf1jeh
         iAiD6Zo7zwg56sgqshlqiMnlrKZaYG8Yuu9wPgFwyo8I0aUyuBuY3+YRlbMVLDKskOBz
         8XkrWuALhDyGWMxraj7DA3zfAyIoJXC8wR/BGM578k7pYadc5trGi1Z1drCC/XfZYtHC
         bkig==
X-Forwarded-Encrypted: i=1; AL+hErF4qz7kAtzfpbiQFx4GZ/3TPEjkT3AAVEsfw1ivRB2g9qTA1LSwPbAHyB6hlgxI28E6sRdyncNTK0U75kE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ezHdHd00Y/K0ipOjMx7xuPWiwS740PQdF4GbxGBjQiwh3sf4r
	BbC9qnqL7lP3RkB09ACosNP6SqhPWXw4sATGcMVzdCwiY0+/s2G6mFBkDHAc86Otk3x1YnyDtP8
	2RBsuc6JVQ0Lrq/Eob1iXg7VE1hsCVjHiPQRMibGbMII84by0+lzGQgMOFtrVDokSRZw=
X-Gm-Gg: AYBFou2ybqVFw6P0LT1D71WrokNDHsZjVu+RX6alfL7cfO/77hOOtcsOQYxSc6QyHyq
	IlzBerTRpvQfHQKcAVJwR4ZNjme1F6+Y+I/frKlFL6iqu7jFqTi0PFM4J5aue+UZsFPYor7+mQR
	d9nUYq9LiifZON1HpWsWL3u3d9KTDkijz+gyJKVVoxkP9Sc0Urnc5GtiTM8FKP4aEsvkSjp+z64
	uSmfBujQp2peOe9tKHd8+rt+oU+4luhAjwVLq8riacjWrwS95WBPbwtytBas63JGEOKCw6Wo9IN
	fti2cAcTIJWUes4Y3oZKY7jyRE+8tWO8oVBjl8uSplnXx1oMOvILwdhP1ZsAM42G+78oiWpY3st
	yRmAVi59mvc8QtqLLmw7wleVg8bJ8w/lhm7LuApYe6ywytbLGQW9D9g+nczjZ4cIdzCdF/gvprP
	Q=
X-Received: by 2002:a05:620a:4890:b0:93f:2571:c317 with SMTP id af79cd13be357-9498b922379mr349876385a.28.1794910639974;
        Tue, 17 Nov 2026 02:17:19 -0800 (PST)
X-Received: by 2002:a05:620a:4890:b0:93f:2571:c317 with SMTP id af79cd13be357-9498b922379mr349872885a.28.1794910639508;
        Tue, 17 Nov 2026 02:17:19 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm83827935e9.8.2026.11.17.02.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:17:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg+renesas@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: (subset) [PATCH v2 0/5] Add ADC power sequencing support for RZ/V2H(P) and RZ/V2N SoCs
Date: Tue, 17 Nov 2026 11:17:16 +0100
Message-ID: <179491063406.27909.15006722116661437367.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MCBTYWx0ZWRfX2daAR351CvQI
 /6D2oFM2/1CzlzV1kt4PQXGlVG41v3fumhG+9lpT3MS2VxAEgla+oRSt04WZnqq6qUOcG0dhaxT
 f+ThRkHDdXa9G1/ueyq+ejlfGDdH54o=
X-Proofpoint-ORIG-GUID: RJOTR3k-NeNd3rSNo9S86a127k6Rzz5I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MCBTYWx0ZWRfX7HdpT4Xn5ihO
 eyoo1wQkSNQzGXjtW2PAVIGNQktR2Ib45OrfjXwql/TGReQyc5oQhJFR3W2izTx111WPENscwJw
 GyYdRYaI5MtiRV1mpsCwptid2mIz+YfI9a1YWhU4DCheb4TtX06G01RMLUgieQIhvaKoQBTrYfi
 wZGHqxZH53WFd91QL7u2GLQSOEv9naScG5YGCUuPHIHxDPC/pp6eqil/bUrhAgeR6KrCrHRSBLn
 ux9smVBfvZb3NAlvXaoo1f4CcYRls6ipDMdAGfcEGigDa53vl6FZi/Yd38yQgEOY1FWpaVspKJy
 0HwkAMqoKMvgNxJveBYD9KI138X3ScpP6ZlNFbgRM5bRrJfld88idjTznwuyKB3j8Wj8YB90jdM
 nNlkn4yLT3EToidCq8i/igRdJknSVwXBSVyWUNl6MjbTapidG26wny7XewXnRUd1vrS/nnq21sD
 gagDVjwRzMLQDfrAjNg==
X-Proofpoint-GUID: RJOTR3k-NeNd3rSNo9S86a127k6Rzz5I
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc29b0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=yC-0_ovQAAAA:8 a=EUspDBNiAAAA:8 a=VkPfdC8VYmQ3GCa23YcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170040


On Fri, 09 Oct 2026 17:57:05 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi all,
> 
> This patch series adds support for ADC power sequencing on the RZ/V2H(P)
> and RZ/V2N SoCs. It introduces per-SoC probe functions for the
> renesas-pwrrdy power sequencer driver and ensures that the necessary
> Kconfig options are selected for these SoCs.
> 
> [...]

Applied, thanks!

[3/5] power: sequencing: renesas-pwrrdy: Support SoC-specific probe configuration
      https://git.kernel.org/brgl/c/a0e667a33418a0598c0a2281aec407134d66539a
[4/5] power: sequencing: renesas-pwrrdy: Add RZ/V2H(P) and RZ/V2N A/D converter support
      https://git.kernel.org/brgl/c/2b8b9c3cebe0f54a7bc5962b748d2c71ed2125b2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
