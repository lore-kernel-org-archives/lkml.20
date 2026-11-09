Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242955;
	b=UJxdcxXTLFtNGUXOM28j1PykNHNi6Uap531YTfpN8dFuyFfmApwwACeYl3xTNHnrmYcA
	 CvlEwSh0a9SYgrg3YOcycprc/4N6+mtjXJLzYuGhyXIui1Jk3Eo8R/Au4rhRA8mkuVmjI
	 BkHqKES5ioISALh6UzVGwXWGtEXD4f5ov6slm0DEsU4NjA/Yd6sEpOz3QxPvztoSEuIF2
	 DR75/Ipy54tFkvcM3N/QxchDunlUbdWt4sKJCMSvIWz4bhZqJIkjami/LVWQ8Janjrlfq
	 BaENd6cFsUZ5IZjmIyzZrdz6xs6IdCJ1DjOgCqZCypYB7rkKVYCCDmCTWPmDRMOXRhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=c6AwzobJV0fUKMq6G3UDWz5i4sFBbBdzjNX7/+61mUM=;
	b=EZDCAchHEERiZ8AY7zecYLfHwRrO9J1ehgeL0GFuclMk26hSmVmwgYNY0soKtXTmQnzw
	 j3WFiRnVK+bQs29BUklZJ9VJlIX7s4jEPAfeE2XRSz9YYGfM61WITJnberZU2ZTwe6Xgx
	 jh5+C2v8g9ImD/1aRma5B7iJCwUueMtLGwa+uAZdVgcLoZzfoockCNaTblBjYo1wAmf2H
	 Q+V2puio5BEfBlLVKVk/9m/KW4sLqgoDHEtiftg4YfiD6evnGX8vbmR6p2BvfYlyoAQ+U
	 g1aRn4qyVGGtJ++GikSvep+PROk4Pn1AbhnYsg6MnTpvYyywF/2L38O4wc9UX3A/bRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PM1ywSq6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fMqn+YDH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D78D606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D78D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PM1ywSq6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fMqn+YDH
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEsmd336362
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 16:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c6AwzobJV0fUKMq6G3UDWz5i
	4sFBbBdzjNX7/+61mUM=; b=PM1ywSq64LIJCiN33Mkf6Gy+Se0GF2jAVzVOUGKV
	PssnunQe71GlRO6iDyxNIYQab5Z9HK1qtiLpwtjDnkEr5SIOSkRgqmJhVIKAN3Lp
	h0bJs2tCL/PjUdmr7C8gtJiCsk/UVUSXmPbz/0TfxKbsUsQQozGadM8u3wE1tmFf
	uWk9RbrINkF/qY5OpdxICArsIhmCIqYL3EWoFUDOgEB+hmwN9jvCFRROkOJTa+nP
	nI9tg7VG74C9AZVwxoidR9dH89CCmEA5EfZJm06CLYW7bMh+FUiA44ChNuZRl9Zm
	KVszE/9JxkwG3WEMKnbL9nj6dguLvx6XJBV7IFjaQju79Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5s7hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:49:13 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc3a482af7so942491137.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794242953; x=1794847753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c6AwzobJV0fUKMq6G3UDWz5i4sFBbBdzjNX7/+61mUM=;
        b=fMqn+YDHCfdcX154sY2wAqcVBcSToEyO7YoCJP2BJ1Z3oZ9s6qRmnrLL4HmKiRB2Wg
         GOmnOKnEdr0OTAKrIzRmMpjsVFj3AsRYiIy1AE1rp9fDaLeio3wglPMicG1eOBbCBB4f
         9lCZcofcac3GJeBpDWHbkILSbqXcBhDAdqOM07R2YIbzzToQxKF16s82Ys+268Nqv9jU
         IIGcDAvWBaRrW8koNvX5ez/92nRLO09g8cUBNn5FiGgs4DtMYZMCg85OOvxiOEtvzfa0
         sYID8nBMS5uBtc9BoHEgVVY5VtakLahl1BmNoB39lx9QK1O/QADkqXUxniU4JeyDkb6T
         i+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242953; x=1794847753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c6AwzobJV0fUKMq6G3UDWz5i4sFBbBdzjNX7/+61mUM=;
        b=Y3Ktoaz23On3fQyUGjRozMpMfmXGSs+kPynPRUO7LxcL7h/3yS7fAf/bEaMcRdAXte
         uRMYyKxhoecUi5XVQHUCNiES1bqyyfQBetVlUGpINhy2zLkA1fGVc6ieQ24oUSbTUHr7
         IbAypr7rNAcO4UmGl6CNO1OycRkl0aeV42rlxjirxA8uE1RWa/I+T1OGXUfEUpHpIkOU
         p08ejOxR59ddT5w6N/XSYpbE3SGTm5JeBfgAzjurS+f7N2fAhb9ExGgjBJXhpP903m9a
         k5F2Hocc8fHMFUoufjs/oC+CrYX8yeBkmdDgNeP/PGLjpO4njoKjSULKR/DSZ6temi69
         hYMw==
X-Forwarded-Encrypted: i=1; AL+hErHxw3k17EtWvuCeEsjyU2IUHQOO/bYWiXwacqvh+9laCY4QvUgtDVAQF3ksPu5vXtBpKDqm1X94ABT5iM0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WNWg2IC+Sde5aAHcAPPGrcP4QpWvaxUdDrIMK3jk0yFor1dak
	KabNt9yrsf7P5+bJzw5Bb+O33n3U/0zu6+n9uI6BcXPytyseASa4nWi+W5G58b9do3ZqaIR+ZYk
	4HGjKC5CF2n6aWkwfGi0j+0nsHjCXszlx8rYROdsD0hYeIue3tmS1BXSDIiDIdZp+H3c=
X-Gm-Gg: AYBFou1nTzZuQwm1HwkOQberKsdx208G6jvPAU7J9ULm/7/JDIgyJbluo4LPXkF0L0a
	39eDhtXKBDTlvgLWlKu8MpDsU5h+aCaSd0N0uuj9/5BxJJHkr0OFPi6EBIr4RgOaf3A6jOc56cZ
	u9foCXAVqtXrJq/mMDy4v5bd4xt6f6ZNPHTNDPxf4KVBrOFXEJu8bHBlIX8Rzsi5yyGYKNgsXOi
	5LxgdbBB/LPApoiS6nvJ5q+nSxbPgPVS/FAX4SMu8g5NZvVlYokn7wP1T0bkqqOseDmj/K7E0EV
	pqyuSug+kacU7Rlal7q1T0Hc4p+1wBRQrj3RH472y+kJivc8yLw1yzqvtePMM7+6uEO24+15vfv
	H9TrVo6d/cuvW5eEdcj0qzgFuTjAFIfIcRK7FFR6vZOKd/3dEqeBqf2A7m1xkROM=
X-Received: by 2002:a05:6102:e0c:b0:7d2:c786:5a98 with SMTP id ada2fe7eead31-7d2db07fba3mr1589437137.8.1794242952593;
        Mon, 09 Nov 2026 08:49:12 -0800 (PST)
X-Received: by 2002:a05:6102:e0c:b0:7d2:c786:5a98 with SMTP id ada2fe7eead31-7d2db07fba3mr1589408137.8.1794242951891;
        Mon, 09 Nov 2026 08:49:11 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d8edf1sm2348025e9.5.2026.11.09.08.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:49:10 -0800 (PST)
Date: Mon, 9 Nov 2026 18:49:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Fix
 LDO voltages
Message-ID: <gfwbr3yicasc2yrmh3xrabiuxfhrrt22m7xpjckqpv33k3pjr6@sot7sdzzufe7>
References: <20261108-t14s-gen7-ldo-voltages-v1-1-e0ad0d528767@oss.qualcomm.com>
 <bcea16ba-019f-4fbe-bc70-9f9a29461a30@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcea16ba-019f-4fbe-bc70-9f9a29461a30@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfX6X4b5ejsdKY0
 RdNwVuqxdqA4OblIs3BwMRFdXzQ4tsuBEyC3w+H8qCNozX2AhlPW5NAhgl0QOEf8Wm2HWGRDRIy
 sJ3C+5jMYx6qBJ7ZQ/cH8Jw5G/nMbNM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfXxj+cMJexnp/a
 jQIOunr42PFzzt+7JIYIzPuHtmoXIl+MQIG6pvVz6OgmRVT76A07lZcRxCenBPxouXxV0TJzoZB
 Erj7eCRkOswYwRip2p6fO005EzrK2EsZaGrdWEK1R/dI36l0rrdQnP4PiSVFrMShR9fiFXFnt+E
 N2KDXBHMNERzKCnmZdlqAFjV2cqcFZt8hsc5DBzQ3mBInCGEQz4qO5VHNa+SG6NbNAszjRzTYXz
 +oXWfTp2lPlsPA20aWrpp67AEEkMkKG8PPtqTXE02ynDOQdA/IYytUvR2oCZGOUO5CPZJpsbat7
 7NGsG344CUhuqHNPFMWuy1azqkuUf2W+E2KDulxCCIazWHu83zXYMZMHvD2XmnEnmn5s6Yq4gSt
 icQKkmHmHIjsfNx4hHyY98fawntq1CoDBEewqJ6FZxp55JgU8wZVKtFzTbNIly0xv8Bm2EYcYni
 QLVhRT9DHWLRqAvDRbg==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1f989 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5gVVVXgHm4f7vdZG38cA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 8w-mAQphNXXv_sIdDr7WHGm-As554-6-
X-Proofpoint-GUID: 8w-mAQphNXXv_sIdDr7WHGm-As554-6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090066

On 26-11-09 14:38:10, Konrad Dybcio wrote:
> On 11/8/26 10:01 PM, Abel Vesa wrote:
> > Several LDO voltages do not match what the firmware votes for the
> > consumers of these rails (the PMICVREGVOTE entries in the ACPI tables)
> > nor the schematics:
> > 
> >   L1C E1: 0.832V -> 0.912V (PCIe4/PCIe6 PHYs)
> >   L2C E1: 1.144V -> 1.2V
> >   L4C E1: 0.72V  -> 0.912V (eUSB2 PHY of the third USB controller)
> >   L1F E1: 0.88V  -> 0.904V
> >   L2F E1: 0.904V -> 0.88V  (the L1F and L2F E1 values were swapped)
> >   L2H E0: 0.832V -> 0.88V  (HS and multiport USB PHYs)
> >   L7B E0: 2.79V  -> 3.072V (eUSB2 repeaters)
> > 
> > Fix them and rename the labels to match.
> > 
> > Fixes: 300f5c59beb2 ("arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> Merging the power grid consolidation will fix these too and I'm
> hoping Bjorn is eyeing that one, as I would really hate having to
> rebase it..

Sounds good to me.

Bjorn, please take the following patchset instead:

https://lore.kernel.org/all/20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com/
