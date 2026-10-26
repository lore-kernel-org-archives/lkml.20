Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032391;
	b=WTJrFoNRln1SXquMLGN+vjkYuYDIl++0xdwKLwEWRncST1xjenx10pv8Lg/VSAB/ci0v
	 bp6I1Jo60EJ23Kf843kDl/aZdOnyw5NXEdJMQ65Z2RD/Qwa6sG5Hhh8UucWDF6PPsf1cz
	 ocQ/IkfvDODew/F50KjUedFF+i8oghRJJm8feHQJDIVrcWTCUGutx1MnQUg7zzgWTb2UD
	 OyKJjVXa9CZ07I9/XXSDxzCRl+iMdQOb7OtOqk1MKqgfby8NSI3C0ImnUNTymx3yfKx5x
	 Gs1lbxTdLOLolbn8bAuaq+YlxRDKJzRTQITjusaHgAZfElwYtusEsFOi+eMGB1aGE2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GaIPkzk+pG3/QsmiSTZYcHrcSj1XsXpOWVinLGBuws0=;
	b=Rx6n5L1FMFpyyyypL5bma1ZjGzlEbLgn1pZJjtVaHJscQAyjPVJokK5lYd/NVVBBKSQZ
	 Iz3ZwTEypaiz4m3SEU3gsWrZ20etdvrzSWm9RhKSF/Edi2/R1clpbe+5KJ4sGnQpaPT1W
	 /WSdxJzo0MM1WLgnbW17ALKjL1IM5rZNh2ahUcXu2BvGa3gG6b60YCBZD+Z9Fj184Ty9u
	 gfjkJWngRD5mZl04UN+hbvNpJFGHtH6D09IDwfoKdplZvYYtA/PESKfvTpsGdjlPMePxT
	 xTyacDMD0ocePqfwByWKEj8g4rNfvwYIDqH+yDbcV9+d9Q533fmHkQj6PlY91TxFVfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="UFF/m42T";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VSx3ptUf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A0C606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75A0C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UFF/m42T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VSx3ptUf
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvjph4098789
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GaIPkzk+pG3/QsmiSTZYcHrcSj1XsXpOWVi
	nLGBuws0=; b=UFF/m42Td1b4Ae5WWpmiXCgVE6qbgoZ5HTYEd5c1Rf3slkVrv7j
	sNif4o+bKe94pri6JMem/4HQiiFkSxdd9+EBhsy+mGrjBaA4DtT04w/ISqEoBZEn
	AKiNaZYaOQcTwSXIPZmYOwVjX0VlCnALZl0hWnFaKbCSLm6N1klFGSj+dd4EGc/B
	T0V+0FxC4t5pFbUQoHSI7SqHj6g1ajei7OSQiUYmPwwSV1+5ud12WahhlmlSd+S6
	90vsZXGaOrHHaT0c4RDEODsFDtW4qRzt9I4qhxU/Q9s4epTq9jyXDSBRYll554xy
	ke6jJjMEQwUuplQSW3YASnVF6juk35D5DmQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s91hum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:33:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so618481985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793032389; x=1793637189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GaIPkzk+pG3/QsmiSTZYcHrcSj1XsXpOWVinLGBuws0=;
        b=VSx3ptUfkBuVFkq/PKtr7pzkFNClGS8/yfZMmsmfuxKHFL3wteSMn75BnhpaJi7X7m
         GiINzB1+M5JxvmTRxG2EB1MZrOdlVtaF7NAZO4pbDLkCh6Lez1Z02lmiIEfp2+x1uWvM
         NcHBOGO8qmRLuNq8sj7terETqiYZDKtPYts1KJ2PBuDchxUCkK/RQ9REXRWeUcf/fsmh
         coXhTEUKjuGb7Ms99EB6zfGKKLusavx1VdJMkuxFAd4myKVcNQY57a93Zc83LUJ8RuHh
         8N8TboPLp8vNDqxFY32QbV8wBNeBz76yzpyv+knY+FNRHyqGAu6R+A9WL96UFBmEgZYx
         Gi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032389; x=1793637189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GaIPkzk+pG3/QsmiSTZYcHrcSj1XsXpOWVinLGBuws0=;
        b=E2ylX/KBs8LVM9zdKH5U8RyHhPBSjfn0wJwQMrC5GWPbTfVimlULeo1SVEDF1PLE7L
         GV9xXGICNwjfuhHCak0mCS91KnJZBHwiG88UtKnDuvSSRi6v9qidSwotzD32L3dkwIx9
         jZAAsN/Tw1nC+f/GNEShkx/sIrLict6fpbvCibbPhyHNiz19Hm1eqXMtKCVhElmItTnP
         rcDdXgKtobjAq2rDpc6aP3YD2IYxrQIzN3IcNFMWYMPfZ+0mV45JLlNHfXDBa8VBGJMn
         MGzzh9wSZJGrw5+igE/fAGrjByeJ/jpr1M/WUxrP72Xu6xU2vJCKDG16BbgGkJOaCFYQ
         aWWg==
X-Gm-Message-State: AFq9FYJRRcw6cDDaWnPXDyiax2buTJ9xrZc2f3IP5LkjpdmQgPkoQL51
	/5rRctJzGzGnZydxvd6ccJJFDHMA6qYzG/R7tAN8PDqIQh8D1uhlN+iVxtqOnWi1m0Ey49KMi/P
	/FwqY8vk0PeNQAY6AQsHcgM1vVWjqIMuPSvQMTXRbKOIabPSTd9GkigRBQnwMlV158CQ=
X-Gm-Gg: AYBFou1ruWDhDIohu29bh2QtuJHmt7mr32EWrY93gEPbPJPawS9lY8azS9JvQSxK0ds
	3kODPm2l2XDv0j+kk1aRkz3vFxcbJNyv2sZrOfzKGsnkUNSoRb3ATipEnhmzode/G8DkVl+vkao
	AMaiWvTe2+tHCRYwhXzedvtAQQckuo1aPsBtH5v/wOznALiXxNkNS80nNRWBFkDOTZUfdkQUPnM
	+B/gqBydgibs3oA+krXofuU+DlX+t7RYz4a50/IsfhsUhqpHxbk6ZFN0f6hbzYOBtDDMjWp1o30
	BI8a0pTHF6WxsJOENzjScAYcQHxXREGu627Q4rj8VQZmYvBRFgmZgcZIxrZJuK1vokqB+uPoGrM
	QRn3+YIG1zdS32HtOseK9r+2Z9046/tskja4S+u9n8oOC
X-Received: by 2002:a05:620a:2a03:b0:93e:c12c:43ff with SMTP id af79cd13be357-940ef9c49femr1068507385a.76.1793032388505;
        Mon, 26 Oct 2026 09:33:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2a03:b0:93e:c12c:43ff with SMTP id af79cd13be357-940ef9c49femr1068454185a.76.1793032384035;
        Mon, 26 Oct 2026 09:33:04 -0700 (PDT)
Received: from trex (50.red-81-37-172.dynamicip.rima-tde.net. [81.37.172.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3932sm18589629f8f.18.2026.10.26.09.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:33:03 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, peterhuewe@gmx.de, jarkko@kernel.org,
        jgg@ziepe.ca, sumit.garg@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: [PATCH 0/1] tpm: TEE driver for a discrete TPM owned by OP-TEE
Date: Mon, 26 Oct 2026 17:32:47 +0100
Message-ID: <20261026163259.1900439-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX0Quv/WnwK6mh
 0TLP3u6tAif+BaaD9DEHD1Oxo1vfATS2HHJLggR9zxBkUlSkQP6f6AoDG3NlUvocOxA08N25Api
 z+XD7HGiE5HbjPkcHPeEPnZq7wd588PmbM9wKh3lecvL4GlxGdlcBUI6p6fPQy4Exwvqc5IMrlE
 a3ZQ62pICEBL5f61QzbW4mvLaRa7ItmDbU4+GLLBUrm/fIyY4hgtURhdRBedqduYWnpyWy5hqaL
 l+h3C6YVwHiNUVKCN7s0egpSZkShmsu9TB5X/d4E48z7QCdkYtYZLnIIBHEbOXhvl+bhQ0IOkpf
 kvmAbqlZ/UBJtkBv+lDWDsbiWpPWelWiVZIdy9Uylk5pUh4yDeNCoMRFp49xZ0eaobYFlm3vRm6
 c099BTd9dwpZ9bplriXWphkX5PvSRwJbFsY8WckhhRNLj9E6NPS4IWDEXMJaIezOQW2UFQY4scy
 7cluSP7vGT1YIy6oSMQ==
X-Proofpoint-ORIG-GUID: cWXp6vKSBpk4bhhTBWVkByz4m_bbLpnp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX2PK9cWpZPiAI
 7oDtKkHGy4xplFuJRCfiqjKjkk5/Y26Sv1jNdaqhgc6Rhb1Bz3sOdHF2lVJiF94UDz4XAOwxcdj
 T85yQufBgL28RGucbWQVTTFyXAF5y0s=
X-Proofpoint-GUID: cWXp6vKSBpk4bhhTBWVkByz4m_bbLpnp
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf80c5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=VbO86HPdXvN82gCvB8O6pw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=1sRuEKMv-XdyHin6HR8A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260065

This adds a TEE-bus driver for a *discrete* TPM2 that is owned by OP-TEE and
exposed to the normal world through a passthrough pseudo TA. It binds the TA
by UUID and relays raw TPM2 commands, presenting a standard tpm_chip, so the
usual Linux TPM stack (IMA, trusted keys, tpm2-tools, the TSS) works through
/dev/tpm0 unchanged.

== Why this is needed ==
The chip sits on a bus that only the secure world can reach -- e.g. a SPI SE
whose controller is assigned to OP-TEE -- a deliberate hardening choice so the
normal world cannot observe or interpose on TPM traffic, and the engine cannot
be re-muxed to attack the chip. The normal world therefore has no path to the
controller at all: there is no tpm_tis_spi for Linux to bind. OP-TEE drives
the chip and this driver is the REE end of that channel.

== Relationship to tpm_ftpm_tee ==
The TEE transport shape mirrors the Microsoft fTPM driver's SUBMIT_COMMAND
(memref[0] = command in, memref[1] = response in/out), but this is a distinct
TA for a *real* chip, bound by its own UUID and opened with a REE-kernel login
(TEE_IOCTL_LOGIN_REE_KERNEL) so user space and other TAs cannot submit raw TPM
commands. Reusing the fTPM identity would conflate two different devices and
collide on a platform that has both. The common transport could later be
factored into a shared helper; that is left as a follow-up so it can be
reviewed with the fTPM maintainer rather than in this bring-up.

== Device-tree coexistence (important) ==
On a platform where OP-TEE owns the SPI SE, the *entire* non-secure SPI
controller node must be disabled in the kernel DT -- not just the tpm_tis_spi
child. If the normal-world controller stays enabled it drives the same engine
and corrupts OP-TEE's transfers. The Kconfig help spells this out.

== OP-TEE counterpart ==
The secure-world side (revert of the in-core TPM2 driver removal, a generic
TCG PTP SPI (TIS) transport backend, and the passthrough PTA this driver talks
to) is under review here:

  https://github.com/OP-TEE/optee_os/pull/8155

== Testing ==
Exercised on a Qualcomm Lemans EVK with an ST discrete TPM on a QUP SPI SE
owned by OP-TEE: the chip is detected and registered, and Linux drives it end
to end -- TPM2 identity and PCR reads over /dev/tpm0 round-trip correctly.
checkpatch --strict is clean and the module builds for arm64.

Jorge Ramirez-Ortiz (1):
  tpm: add TEE driver for a discrete TPM behind OP-TEE

 MAINTAINERS                     |   6 +
 drivers/char/tpm/Kconfig        |  18 ++
 drivers/char/tpm/Makefile       |   1 +
 drivers/char/tpm/tpm_dtpm_tee.c | 282 ++++++++++++++++++++++++++++++++
 4 files changed, 307 insertions(+)
 create mode 100644 drivers/char/tpm/tpm_dtpm_tee.c


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.55.0

