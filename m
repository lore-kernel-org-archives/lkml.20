Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726767;
	b=z24sSGMDYrULtZWzYWHaST7qVvqmLTipB+5XTUVx+71gkidCnX6lKBWPrOFEUaC3y0sc
	 q2dZ51g19LylyhebOQfXxwGjxDArjqh5dqZ7Pmi1nJ64wCPAQAQTvGORUEa9dLVQUZLns
	 m0g9ngSLuui5x9YGciVakmjCOij1OYWiw8/t18bzNTTf/FoK5xTinJiAh/ccykcGD6sSL
	 mZa08Wo/qx4z1vbZ81jg7OGvWlJq/5w2Hwh0DkeCI66yzeLLm7Ao+et19RaEpUycHBayY
	 YwBDcS68k21UoEbNj/fJOzFdjGjsYaAnrx3/NwOyKXQLPnJHnOrX4uTfO7faqXajAEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qwa/XM4zZaFwBwMlrXOoTLw077/bwjKnjbAnCI5aKj8=;
	b=CWDftR88NkwILM9pniPalxajlFDlIZihuRUMECYs3yKyzEO+oQkwFwXbRnlbvrCT8Yb/
	 Rb8P5NkSiso9j7hEGhH+KEVaqizLyxhlteQoRlvuCbq2T64spGB30jZEdkMLsWfPwkW+n
	 qx1LYMRPDedsP99JsI+IPvfRkJTdKLIFuWF0Ne5DBJpEDYPhi6xPFgDn9jNdhJHJ9QS9+
	 upRoY/HNmq1cBxH4l6ieHM8p4TGyeCBhqZMFnDCfHdVCMxUUzdYnoO0roSP17q5GIUFmv
	 kONDeVNvJ/UFEmj0vUMTaHcGvNI4qc/CHiFNFLASeevIRCT5rcAzn6jc3/RVj9Tgbzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m0j9ktfG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IgTmw59o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE43606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CE43606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m0j9ktfG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IgTmw59o
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HPFES4091669
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 17:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qwa/XM4zZaFwBwMlrXOoTL
	w077/bwjKnjbAnCI5aKj8=; b=m0j9ktfGMfOtof9Tvwlao/5KfySXAHgqIqti7g
	VTg3YX3cbbBjmTbx4l3p1Mbef7LFOPaNyTQT1tYn++WU6F7l2RZGO0TWfY8rLF0M
	v8E3JvALZ+4+AJJL+zfqA6GR5LvS2aaINs/xnJQxF27kKiS8gHBnv6qmFlgZ8gal
	K1+F7WPi4ndocq9VZOxLkkrI7r7S1Fv/UFZvcDIwET7BhlMPVDphfaBHC7punqow
	NHY0BKWrTw5dLa8TWC6LqLRu3sqsFbfJFZkX0e9jnVc8QzK2C6RHswGU5SdZew4O
	faMJ3Vh4Nob36Q561ujujPSfVwgy+lrEktdxXLDUOjQYoNzw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgp85w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:26:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so8557979eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793726764; x=1794331564; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qwa/XM4zZaFwBwMlrXOoTLw077/bwjKnjbAnCI5aKj8=;
        b=IgTmw59oIwQs1mPltg8zflJPDaiqOqc++yNOlSWggxgedSzdxOYa83Jj9vG/BW7YfR
         LReAYen7KORwkftMOrJbhQiSdQs+boKDGM13TK/9UCwyu7ZvVxeXv/Zu864DDTr6n28r
         KIxoUU1TCWHNKcq75dSroU95Ht5vOS6WbriQKdts9oz3STmNf9IL9zhjk09pFuvN5jq1
         eKMEaXV8qko+LYh0XETQ/roxJQ+Ok8o29t53jyBeOm+EybRBAS8CzR2Vk1qKv95MshI4
         dqBbjE5Br9ORxf/+OcOwof6CwSoD/5SZRV0ijXCTwozElhg8oBUjg9EeCED3vam1LgKv
         LRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726764; x=1794331564;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qwa/XM4zZaFwBwMlrXOoTLw077/bwjKnjbAnCI5aKj8=;
        b=tKHnRMmVbMv61rJlw5HKtpTmPV6WHvEWIlL8u6wQ0D+wCIO1GxkOu6EWkkL4+WXu3B
         0yGbb6FCUgVgV6JLTrraIvIkRHgT/FjzqRC0iWCMW4YDGONWwfPbhigOZl7pIhR47rUb
         9+JJ05/gSpy/MaFJ74saf3tLqhuBVlUrLXofOn5EGUnEaTzdHzVtJDpLy4U7XSLMu5v8
         4SapuJ+ckXVtRO5GubGJDUb6Q0+YY2oB8WzmicU4qyvolB8DCybO+vBFMddoZGjeIYMI
         RseHgjnaDgpe5RawHx+NDL4ar44EQthZ4y1t27g9ZqbCsqeICEYl5SUjQJSq3Es4MwDP
         2vfg==
X-Forwarded-Encrypted: i=1; AKwUvBxTLk568ECXZseUaIS0USxgu7vgUsxOrbertgShotUKnjKJxBOvAekHdH+3Mo05YJAjUDx2seR5J0YhHr0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pRqennXZNXxZfjiOTcM1uoWolgTF1e+ikS0WV/iZOJz1eoBIP
	vY8paj7WCBvASUmPmPB6LyJUdRXpE379KsTOYGLvodW07MsadHNuBnqpEkuL5GmbKP/ofjjaCVS
	Ur7Mrc7/TD3ZlKnJO0PnJf5C8cBe7qvPB8pUmaQnZgXQyvDFCWwpccTTv4c3URovIGD6MhCxiMl
	I=
X-Gm-Gg: AYBFou2lyEt9x5SfDosn5vwJIGpkInxFGQ5yIh/u3234XLXPlIvnQ3taFmbvIq75I8j
	lMKg/hyNojBcxoPuHvXo4EjSAXk5WPDAl2ku1CZUuv5PD5Cj6iqcU3l739U2AHmPBgqRy16onZX
	H9YCmhDspjWDIun07A9MAzsWtnSlnZPn8FgcAtJg7IuPIHeGbxS4Q7FlqDjhDD1osk7vf1sd/5m
	kPAdbO3sV+Ny20WyWZNuDJ4wzZnhlhQOt3Ry4NNT5KJAc60IMXkapkZBycAW7etd5my41B8oZV6
	Jc8QKGITF4FAsA8gyt2i1i2gIZ84xupSD0g/vQktOpxUvQS2X8Vk0OX7Id7JtrinJgpX7vjHm/7
	RH4RgrRedEqkyuKZtVFalDI2vgk9e3s3ZUcUum5eKZKSot8dMEAUf9hTuNRMWDS/KqmJ1Z0zpfV
	hWuK6OrBBIxdEPvKInaQVPcJZOwPKAVG1Yt/AnUBRD5SzmKEiYeff/cieyaXG5Wnr6dd9P+z1r7
	mI=
X-Received: by 2002:a05:7022:4b:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1ac5c92de5dmr25556488c88.27.1793726764106;
        Tue, 03 Nov 2026 09:26:04 -0800 (PST)
X-Received: by 2002:a05:7022:4b:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1ac5c92de5dmr25556431c88.27.1793726763302;
        Tue, 03 Nov 2026 09:26:03 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm357310c88.8.2026.11.03.09.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:26:03 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: refactor m3/aux_uc firmware
 memory handling
Date: Tue, 03 Nov 2026 22:55:59 +0530
Message-Id: <20261103-m3_and_aux_ucode-v1-0-e14f13fdfa41@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIACcZ6moC/yWMWwqDMBAAryL73YBrsIZepZQQk62uYCx5lIB49
 8b6OQwzO0QKTBEezQ6Bvhx58xXw1oCdjZ9IsKsMXdvdEVspVqmNd9rkorPdHAkl5TAqhdj3Fmr
 2CfTm8l8+waRZeCoJXpeJeVzIpvMIx/EDdWPSH34AAAA=
X-Change-ID: 20261103-m3_and_aux_ucode-8337b881155c
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2OSBTYWx0ZWRfX8iXHVV0x8uX7
 dcRr2MWglvuNqMeGgBsr4Jo0O47w9qsoQsPxefVCoqub5DF3QnLNTadkPjqVEof/E4nNbSo3h3X
 1uM5wry9wuktnA11ZRZsGG9zsQgmUVBYG1ZwieWROEKL5+ew+a3fkhY2DA1nNr3q4xC49Zk1g+A
 S/Hi4Ihpi1DzrHc97/rLzQ5idWIabFGhS9i+EqboTHkGLx8YKwtxQOpTa25kSiKxEQAzajLf3mn
 zpXbALXwoycnHMHWas+Xt2OJY6e+KewoGDPdaOa0VP7VT2sfc1KxNtrXewcXkiRZ0ny0fJQFoST
 ysFtzQ2/eTw64rrmljxr8Ac6mTzzZrqXYMz9RF80rj6Kfr1MjEprSG/0zBw7bQ3s60jWs1LNnym
 WULOmw4mAIepT1RffeUy3OGMNiCuKFiKz0wWdVo22jnF58sjtzuQl20YPVkRvlFzRrcghqZYG9v
 ShdSgYb3a+YuQHhkXuw==
X-Proofpoint-GUID: Zq6HvZUcEc257sVEdvHQnKKMAoODwcY9
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aea192d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=xzHXWKMcZAd5FHHA1I4A:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2OSBTYWx0ZWRfX7JBYhCeoZSKY
 6vB8lnWpX/+wX+dwb0bDwPs7U95T1ZhsMXaeaplutSuvKyGNeDa+Vx9K9l2JeVATzHFJSUjWYfe
 8XYLEP3kmk0akZ4b7wO95X+mvIrb1Ac=
X-Proofpoint-ORIG-GUID: Zq6HvZUcEc257sVEdvHQnKKMAoODwcY9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1011 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030069

ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() carry near-identical
logic for freeing a DMA-coherent firmware memory region and loading
firmware into it. Factor the shared logic into common helpers.

Patch 1 is a preparatory, no-functional-change rename of
struct m3_mem_region to struct ath12k_fw_mem_region, since the type
is also used for the aux_uc region and the old name no longer
reflects its purpose.

Patch 2 refactors the shared free/load logic into
ath12k_qmi_free_mem_region() and ath12k_qmi_fw_mem_load(), and
rewires the m3 and aux_uc wrappers to use them.

---
Madhavan Ganesan (2):
      wifi: ath12k: rename m3_mem_region to ath12k_fw_mem_region
      wifi: ath12k: refactor m3 and aux_uc firmware memory handling
 
 drivers/net/wireless/ath/ath12k/qmi.c | 163 +++++++++++-----------------------
 drivers/net/wireless/ath/ath12k/qmi.h |   6 +-
 2 files changed, 57 insertions(+), 112 deletions(-)
---
base-commit: a2da7677eb9a12e7860814b70a1f6f5b0e347d7d
change-id: 20261103-m3_and_aux_ucode-8337b881155c

