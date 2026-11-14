Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794700215;
	b=FlwtNuy+V2za+LMSHn70skWzpWkUONaf+hxrB9unE1Roe+gvhkRXshKgyB88AAPbX7BF
	 3Mp+3vKHopLn0+Tjlgc5/pZMMwlZXMfMTGwu25vY9rOhc7mEQ2m9f8UOoERKgw9ekN0Hn
	 WhAw3cEVzr1dJh3Tv1tIghXab9gcKlhNxKuLTMzd4OKr1a1NkE3gLOorSvzogqPWu2W++
	 ooxAgZFKGicSaGlre88HCamjs5pJQgrQDo5qRfKR1HkQzjEq0z50yvei3lcqswc5pNEaa
	 K0o/71hMKlaWnooSzEbdF46Ik0kc+9ex1IBphCDNjk9NV05Im8U/lVkfqJEdn3yZ80Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794700215;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SHz7obOecCms5SYEVnrbzhdor6lxm5HlXrthgoBerCE=;
	b=YEJD8XhX+o39B0frVUC5vEI/XXIpHnLUhKVGj/0tiz+EZ3aPoma+ujQ5A0xBzZeotE5N
	 8YNfdJIR66Wh//G3jAMuAau/z/izuwJgFLKXQmIIYrrblHVH66rHtwokGOsg9kcDg02Hx
	 sABqbPegfKrhGf4GeFZ4HHI+g69MI3XxxNaTxMImLgvEADTVNgHMOiBptqniLTLBcRioc
	 3u809msjyHb+gzelldmGTntBGEm94hDoiwbOB34C7NhcdxrrieaqBwb1O+1IgJ6DBtu0F
	 WsNpf3NFnIXP1d8DdV2pK+iY/oHWfW8AWVJxPMm18JZ3u50hyS0OF/40kVPffiPPfig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ALMKIsIq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IGrtBH3h;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C15B606A88B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C15B606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ALMKIsIq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IGrtBH3h
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AELHIlo1564386
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SHz7obOecCm
	s5SYEVnrbzhdor6lxm5HlXrthgoBerCE=; b=ALMKIsIqCdJo0yIZO9Br3MlT8LE
	solRjI/+vbvXjtY7mGMDdfrVG86VTTfsHVBJpa8g4vbZj5UOzkFmg50VbNYDbfGM
	0GwsFjRDtPVOxLKCMjH+XkS/yClPC/B5b2uxaPofECLxrjsybjE5fbGOwfE41w2D
	mqewlec+MtzV9QutsK8HwpHFk0TG4+2JBBMFbIANj2lBT10GTGJLDVBqbh4dh8TL
	WHXQXvdrDS6+KzPX2E96TSte6PeWIocc/p+737k55lYvC+oInYTD8G961+sZRgkS
	gN0Y3CKTXz8m9kz+vVbIyjjBlYscM9JX2aMGfR+YbV0o28FHSueNecu8iOg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmahv5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:50:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so2776689eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794700213; x=1795305013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SHz7obOecCms5SYEVnrbzhdor6lxm5HlXrthgoBerCE=;
        b=IGrtBH3hIGdvgBpHQ/HMlkB9/QSjVWFenn4D0j9du4ySSS2qChAH8mX9L2tFmfJwbf
         suPAQkiTU+WIG8eKxUFsR9x4n+4p0bD2tBuN9//nxXYVy/e4kiL/CnuJvSfmFjYMsExr
         PwU3A7XA7SXo9hjYX/0cgv4hlzew4wlmdz/xfBQpXZG8tWuuwEMbNSf7xjZ+KhoqL576
         1jA8Aw37OE7cEfeNytI9i1YsjkIzfNZJSGAqDZDjON+7dafWT8Pek4Krwt4xDY4BDxvM
         m3THWVc9N+TTyZUrtokVCoJoz6XpkAk7a6YCy+M65cEO0i/o6mc4UewsINqNC1nyppwo
         d/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794700213; x=1795305013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SHz7obOecCms5SYEVnrbzhdor6lxm5HlXrthgoBerCE=;
        b=YWyQmwYBMvYihg6MJ/7P69mmxNcd2Jw8F8XKLKoX1KsOTZcHqYO/2AUNRYAh2v9q6l
         yP6aTkP3wzDAX2MEZoUd8rM/qpRy88yEuR2dvloHHumEp6JiiaqRJs3mLJMvC05chwvi
         WrztUAVaKVIDWFPkS2sqkSdbi6U7ZIcNVUfCgkf0l2J1GJuPHgOtzoobDQ8R5HOU/yIS
         u9VjpDwpvolxRihm/7TLqrxuYj4zS3cSm/Y4QxMJkJwewoRLNxCPV2RH3Nmb/6OCvJKE
         QnBTB8i1iWWXi7R7nhLCQrdxa4ECXCUjuOonGjf8go97Gh2wJnf+0xBrn7m0n25RPIS/
         5x0Q==
X-Gm-Message-State: APuU4Z86lF9+0Lii9DwrSjulAc0Q96rnkeKrWuOZHkOMvtCqFTD8q0Hw
	fglNeCyn2bLPDZwZ8BisoH6XF+V182Sri/lBxE9/BvAry8A/8a4qUWrwN0C39dJf2NEx/pn1xxt
	Co5tP7hh8NG/eCq0cpuCzMoj48i+YjtPWya5CMNRU/6Lagml0yYc4qHJITHnizcH73mw=
X-Gm-Gg: AYBFou1sAG9Ef1y2kykwl9vXk30OTmxnofvsUIW85GtymtBtHGadqzvmw4xRHoEJMRk
	pN7Xal0kIQaCLIGYB2R9yVFhGjGGd6ekHRuRVyI49h3Gmlb3/u9708cuX2HnXrcnrTZpGwNtxeL
	gQr/Fu6XpbN6MgH5eSlwGt2I9cmgbINAQUHqUc5jRjaLcWQBsYUYOqdFWeLm482trv7fk8wYDpU
	1Vsupy6FnxoQO4FjJcKZYxdggNKmvo7lLE3lyU15PyuGWDQgXGRK5u4XBgEJgXf+rnhKIGx91tp
	0qr7tM+h0FKV31zKDWFEKqcaGR/GJvoZTKnSh9AbA68mOc1qjFtVjVfbtFa6Pxq+swTkr1nDi3q
	SPDRTh+E7CtzWMEJMEkNIWDJa5ES1IuyiT+ODonWxuvVF1Qf9OZZWol001r9w8zpupTVW1pLfms
	3E+1UfmIicZ9p4PjOrPBuqmQ==
X-Received: by 2002:a05:7300:fd05:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-37968b848d9mr9239202eec.33.1794700212937;
        Sat, 14 Nov 2026 15:50:12 -0800 (PST)
X-Received: by 2002:a05:7300:fd05:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-37968b848d9mr9239171eec.33.1794700212458;
        Sat, 14 Nov 2026 15:50:12 -0800 (PST)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm39456313eec.20.2026.11.14.15.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:50:09 -0800 (PST)
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: "Linux ARM Kernel" <linux-arm-kernel@lists.infradead.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Vladimir Murzin" <vladimir.murzin@arm.com>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
        "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
        "Jinjie Ruan" <ruanjinjie@huawei.com>,
        "Liaochang" <liaochang1@huawei.com>, "Marc Zyngier" <maz@kernel.org>,
        "Radu Rendec" <radu@rendec.net>,
        "Jonathan Cameron" <jonathan.cameron@oss.qualcomm.com>,
        "Ashok Raj" <ashok.raj@oss.qualcomm.com>,
        "Sathvika Vasireddy" <sathvika.vasireddy@oss.qualcomm.com>
Subject: [RFC PATCH v1 2/2] genirq/proc: Show NMI interrupt counts in /proc/interrupts
Date: Sat, 14 Nov 2026 15:49:46 -0800
Message-ID: <20261114234946.818072-3-ashok.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
References: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: k9Ll0DrM9F1ziN0ziSinIVorT4gFTmNZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA5NCBTYWx0ZWRfXykKkqIOZqVmU
 lQaORyKhgLaXta3ebhbCns07wkZbHlKKD51sGwwdd31UDmafwOelgR0vLHTlR6xyfVdWFRQOqiZ
 Q4OtupVaHu7dWKgbHvgQ4HWR09gom9HmrdWFuraYk1BDhn+mcBNsnZ2JjWVbCJTwyhqF++lRTBT
 ebK7eBoktlMmchxEVsVmaBVR7eCdn2Uf0LC4Ve/zrVTHqmWkqEwy75vQsyrMBKiadfetLsSV3FY
 OC96RK4/DOJkFzrXGO6NPyhys6sGB88HwCp75jnX+caV1192I0GgLSTp2SUtkcAdxpoEzIaVDkH
 hJ2D8YTZanZ6V60ztHICsSjMfQ51B0SIOiOU1dVGWORk0TYYIAoe9bEU1bY55pPVEHabnisk9jx
 P2eLxuMtEXzpi9QfU/DsWnFUEO9uMLaM3WDqRxyo+iseXbHul9IX45iQDTAS8yCnXnfft8Obr9W
 vuS1S0OGEMwEtaWj9qw==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af8f3b5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=wU795yvDvLEqae5DVKgA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: k9Ll0DrM9F1ziN0ziSinIVorT4gFTmNZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA5NCBTYWx0ZWRfX+o9GEpkadfSy
 OSC8EnO11Nn+JOBNaaZ1R07+9ExXtV9iKsvMz2M/B21YaH5dLRl6u4FQ5y3/nDo5oKUWCaWOG0v
 a448PJAARINknEd7tJBqRBWMbVcnZv0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140094

NMI flow handlers update only the per-CPU counters because
irq_desc::tot_count is not safe to update in NMI context. As a result,
/proc/interrupts shows zero counts for a non-per-CPU NMI.

Display the per-CPU counters for NMI descriptors, matching
kstat_irqs_desc().

Signed-off-by: Ashok Raj <ashok.raj@oss.qualcomm.com>
---
 kernel/irq/proc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
index 0c0df16de581..490b2df9c105 100644
--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -559,11 +559,12 @@ static int irq_seq_show(struct seq_file *p, void *v)
 	seq_putc(p, ':');
 
 	/*
-	 * Always output per CPU interrupts. Output device interrupts only when
-	 * desc::tot_count is not zero.
+	 * Always output per CPU interrupts and NMIs, which only account in
+	 * per-CPU counters. Output device interrupts only when desc::tot_count
+	 * is not zero.
 	 */
 	if (irq_settings_is_per_cpu(desc) || irq_settings_is_per_cpu_devid(desc) ||
-	    data_race(desc->tot_count))
+	    irq_is_nmi(desc) || data_race(desc->tot_count))
 		irq_proc_emit_counts(p, &desc->kstat_irqs->cnt);
 	else
 		irq_proc_emit_zero_counts(p, num_online_cpus());
-- 
2.43.0

