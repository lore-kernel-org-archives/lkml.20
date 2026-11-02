Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612355;
	b=uWUfTBCk8hMN14LZe2eQNpYu2X/lye6uxR90Mud2hM2ZBq5wZY1UZAlOvSn/sqPLHvSK
	 MYuhq1WEqmOFMtuDx2JFwNaIXKIR9uaenL9FD5HWhL/1IuyY7xz/P9j7V60VYw6oBGRCl
	 NPT6r59l95wKCNE6HvvG7ZK2a4kZaYRkcarXQehpeXbG8AhpmEe+fuRWP4+7ZfgQ4LjfA
	 T6bUtFUC/716uMViCCzct+q60LBBmeFgT6k9WagYBfu/OnZaTJO2PkJ/eRsgE+w0OqUsC
	 k+w0oFKegiItlkEFXSXAu2UU8qecMbAjfAEZEW5OErajNeqMmstS4dRPPocWgJbajdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612355;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k75SutGpyQ1wEbJYlWNPsWqPAnlWbSqGVZUV7dZvgNU=;
	b=X+1IvrynNfuatLMrF7TAqQNG0eI1pLl5hKNfiRI0zecjbXInC3vBoLF1j2+yThp3c5yv
	 f7xztbXniVynvdCC8MFDgaRyh/C0uA180KgR+q+sazmw664g6WGZodCaDbTokjrf4bv57
	 YdQ6Lf+N88P8EGR236TjyRXK2oGkBeIxw8y2616d2Ij97O5TpZzuMa/gNWMafDJPyn6od
	 SJJdyn/vHu+A0fbRUaZvjS0kehPq1gJLDBZ/345Q5jjc2MR3v85Mklocjg3ITNS2/kd8l
	 usdywIgl8ZPLU3+E3hPv1vjh1JrkNyfRijQbHvk0M5N0GFv1dOTfes+iXs2hxP1pdXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZMfuYuMX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dp8zXave;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1539606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1539606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZMfuYuMX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dp8zXave
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ABEI4039384
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k75SutGpyQ1wEbJYlWNPsWqPAnlWbSqGVZUV7dZvgNU=; b=ZMfuYuMXuVHTnI2i
	yRZUsfLxhNsB1lBdsevMx40wIH3StJl3jo2kKp+g4KMSehmTQ0yXehaYpdehoLnP
	H0d75uGi1E1sYZP4lWoxyiF72Ja9RFQIj0qeTbTBYVEn1X+okz9Jr04uhFi8c3zK
	usZ6B6TSHF9F3cDWhUpQBzTpzksq/nfJCBNVWPX6xmPNqLq6lHzHimUpAORJcQrF
	nZ+gaSH2ct0wJBT6sjg0dM82nbrlB3zzYqqmdB5YpcX3sjMxJ2DlNtURTWrwn5BL
	4E0uCdZ9MBN0tollRRR/cLIN/XAf6BKtdezCntS/NfolOg14lHd1K8AmkUl1oiBq
	28BRnQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18f8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:39:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ecdc701a2so306687085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612353; x=1794217153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k75SutGpyQ1wEbJYlWNPsWqPAnlWbSqGVZUV7dZvgNU=;
        b=Dp8zXaveyvnn2uN4rhpaAGSbOLrUxzYVjvDfxQONvCqDNXd22ulKRF2PLxnvcCpcZU
         e+Pj45a2WpAlKQ/SyEA6CATGw4erhIvgQI8RDZvDCAqWFUOADttpli35Ri5T1CnHBp6f
         HvZHtjRykURKehy9QDqmPw6u0JEc8+zqW7LWf18ASDjMaSOqcS02odIhMQLsAgzXq0OY
         GZ/uuCSFtuZ6pXCLWZ8BpFFV4zjH/O1z4DPbLh/K+xarrQklDQuTRZjHPbNO4zYbCyxX
         ubIp980NpkU5Gk4e0lpgOp1wu5R/ccwGbmmwRKcBHHCxapk4n9CJeRj88wOH1VA9zTOP
         QzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612353; x=1794217153;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k75SutGpyQ1wEbJYlWNPsWqPAnlWbSqGVZUV7dZvgNU=;
        b=fq+HmLrjp2naxmDZEGCH+5l5vCM+ybrE0MPXchzPJFwCagAIfSNyXeL8vmCRtOZBaI
         Ova7ZEiuD8qXnXSjYPcvvVjVW0AyC1Yc1ISOPaVuQJviAzR2lfWsFSH0bruxrIqmtRW1
         VnxbWwXZ0yPGT1C0obd3yfb2+HvoOoXLleioK10gpONxUf19GrP6Nw16Tel/7AOMOjyP
         SFejS1OLt4lgMPg/CFF042khj0N4AmXc58qxvigpHxGtUuSvG78Ju0VBY/OgYADTTy7h
         Zi4gFmFa4fq8C517n7cWXJR9PUo9kWHCQyPseRO7qhgR/GDfyH3cAhMzIpVOXkwuq31A
         LBcw==
X-Forwarded-Encrypted: i=1; AKwUvByRnrBoCH5notbx9VCYaZudVUXaierS00gNeL6RRSXcbWH09TsXT7odGtsj6Eu5oAnY6FfeCPotFeboZWE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDbcPx3FKgOfGVPms5QA7g7whnSvdPi9W7ytGecEmNUCGXlXKs
	Lrxm5A5A2fVCw89fLNFdgmOsNfTdnJhEvenFXVJpvf95/Ew+9n2PnFh4Nitqo3ixeWKxxyoCluC
	Qobb3Xi77FFLsCEObsAxzwe4uV0F1VZEJE2wi39O9kblbs1vUyxByukgQjHN9DBlhcBA=
X-Gm-Gg: AYBFou3fb3BRhKSA/CKotHrb9Kbp4jbC7sXXqJInE3d+SPf9LMLvjRMJy4w4k3nSixG
	hGIZxIWGSGDuKx1Jp0uq/MwADOp11CIvhFmzVHN86NW9UsQAaHVywB4+hcaY1M/ir9inRtxCFbb
	dVTbVw8o7sM2bY0X1YvqxiaJrg7PPuOKO8owP9MSDT9Dl1FLvQswxZMIHtbs7liOaH2JQX3YiYe
	3d9sZFJCwVljSLkaN8Ym5laTdQ+baH0yEcjGs4jRYl2RTJ8jAOFfhePiIG8WEfMROqCiVrEyhe9
	Z46lWR6VnplG/TGwK27nQbOtPZC0y0Le7S2FV1zNGZfhkIo2v8L7u0NO6S40kD54NAJaxC3maEn
	DelXIjjPeirB1ncIBASfH+dDVc9WfTeWk8naIPiD6NAAKCQKob1PEG5U//tFUvZ/WH1sX4/BSJi
	dI
X-Received: by 2002:a05:620a:801c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-944217a3ad0mr1519528985a.73.1793612352619;
        Mon, 02 Nov 2026 01:39:12 -0800 (PST)
X-Received: by 2002:a05:620a:801c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-944217a3ad0mr1519525985a.73.1793612352017;
        Mon, 02 Nov 2026 01:39:12 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bab1a8sm18880436f8f.57.2026.11.02.01.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:39:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v7 00/12] gpio: mxc: probe cleanup
Date: Mon,  2 Nov 2026 10:39:07 +0100
Message-ID: <179361234152.49297.16476841533966255067.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
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
X-Proofpoint-GUID: YXRIvWUxQhZB2UJyCX4nbjLhQqgpQv3b
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae85a41 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dTNmjvSPNBXJgja9_wUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: YXRIvWUxQhZB2UJyCX4nbjLhQqgpQv3b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX9lbNyDsV4oLn
 fRSxv7D43Nmwg1gan1UEycfS/GzIW3tXJaqwdVLLREHbRBY7EcpeUcHZMdP/0GcEi/h5/LR+0IA
 kp37F07Gq2HJnVC5OlXlM6vnMg4Gs4j5t7i3HZAgVVTMw1/sCyDaqyusGD31Igm57zHrEOkn/2E
 Mlu4NVl6KL226tIgvzuagNziNGeUXcfx43wS7/bpExLa745YRWP5d8VUbsBchrYz09Fnhs7aaIq
 cwf3Xi6x/1lI34rURiZbu8yiWFQiXDPAfc4Z+99Fr4qK9w6nTRoTATGCOLWbEd/Qhnn7T5FIc1u
 R9LV95A3ugaHzAZV0LLyyorrpHur3N/T634T4S/0S4rUID3bfY/13sPcMArqhti+bUKPRgh5U+p
 kcBEnvxYnKrKsDZkIhCJZr08yJmAgYNr5hM1h3wtTXwTUvKqR5UY60ttN19LJVj2A6lTZ/RO82A
 2GKuC0eHUBKjb0JRsaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX7SYRjIXSRk5F
 GT+LlYBfpc/wiHfwKg4TEIEsQmobfEyFrTsr+NKlTYC60WqivZ+bIzMGsZ3sphUsNuwiU3/+epS
 P/urgFGArZd70XtMtvwLRr3oUAVvlhc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038


On Tue, 27 Oct 2026 20:09:27 +0800, Peng Fan (OSS) wrote:
> This is the cleanup portion of the gpio-mxc series, following the bug
> fixes merged in [1].
> 
> For Linus's comment in [2], I will use a follow up patch set to
> update pinctrl-imx and gpio-mxc.
> 
> Patches 1-2 are wakeup_pads cleanups: consolidate enable/disable_irq_wake
> into irq_set_irq_wake(), and use for_each_set_bit() for the pad wakeup
> iteration.
> 
> [...]

Applied, thanks!

[01/12] gpio: mxc: use irq_set_irq_wake() to simplify code
        https://git.kernel.org/brgl/c/f9922db7dd7ac1a0545e165b4ca52bca77394715
[02/12] gpio: mxc: use for_each_set_bit() to iterate wakeup pads
        https://git.kernel.org/brgl/c/8b56c9bc04d5febf1bcc6b3ab4020608f7b59bc9
[03/12] gpio: mxc: use 'unsigned int' instead of bare 'unsigned'
        https://git.kernel.org/brgl/c/fe290228900ba8a6351677a97feb5e7a8bc493ca
[04/12] gpio: mxc: replace of_device_is_compatible() with hwdata flags
        https://git.kernel.org/brgl/c/363f30458065046fc1ba1564a1932f5deddbbfbc
[05/12] gpio: mxc: convert pad wakeup compatible checks to hwdata flags
        https://git.kernel.org/brgl/c/eba30afc04687a53300011bfce94e95cb4050ff9
[06/12] gpio: mxc: use local dev variable
        https://git.kernel.org/brgl/c/569d0a6f57fc119c7f9471bfc7e0886070c6bf95
[07/12] gpio: mxc: use __free guard for runtime PM cleanup
        https://git.kernel.org/brgl/c/6d0d40d6d39dc0314a54d89ed1635da9df0c8159
[08/12] gpio: mxc: use devres functions to simplify probe code
        https://git.kernel.org/brgl/c/02f1ca1b7a56cb52813c476b9c881862d29ede33
[09/12] gpio: mxc: add dev_err_probe() for error paths to help diagnostics
        https://git.kernel.org/brgl/c/a0739c3cc3d414d981b124543d6b45eaaeaccc08
[10/12] gpio: mxc: introduce MXC_ICR macros and use field_prep/field_get
        https://git.kernel.org/brgl/c/5ae5ecd98ed2ecb81b8b27e184fb28a278193673
[11/12] gpio: mxc: use BIT() macro for single-bit operations
        https://git.kernel.org/brgl/c/116ca21f82df0eec13a1b949746aa17fa65c0a22
[12/12] MAINTAINERS: Add an entry for gpio-mxc
        https://git.kernel.org/brgl/c/2505bf94979f596f2b2146cc654bc28cc46bbb9e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
