Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7892C4C33D2
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791212998; cv=none; b=YgyCOb7U/LNvew9Qacerw9SuQirqRkuVYdH8wbPrTXMw8tFihQJX1Y6uOq7UR94wwEYWaIqMfYn4NBgY32uzY+YUOMTc+gnuWfLToj9qo8i4nBeXjG2B4joPF3+QZN8UZn7liBY3A0NYjao5J5Phe6vk+xABKRruP3FBlqa/T9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791212998; c=relaxed/simple;
	bh=A4qzcg0t/3QLE2XJQsCOb4cgngfSC3a5v4LZKvG6UV0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h0y7R855TBtW8/b/I0YIS5fuBtJDYZXq1G8n/GKaxRULmE9756pHwiV13xXtHzK0eQerPu3WVD2z3q0KEW09baLk9TIHoigCw+Ozk9RpDq36m8oj98u0REIImi3+aUUUQ2sdAi8VLeJ3npnR26wuqm9eYvXmAlFCUJKv2V3Uidw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xx8mMNlF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BKtUm6T8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xx8mMNlF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BKtUm6T8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EP3692214835
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 15:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XTlne3T2FPsgfeIHj85O7fAaGN3E084SkCGxWBQPoZA=; b=Xx8mMNlFVdiwxobV
	owrLU8ThXEU+b/hPZs80NjCDdwU5VmZTxr8a6M2Byt6Tf4MU+Gjrnm6iry/tujSl
	L6sfgXIKP+nkoaeGIAHtnVh3EDlpzYKd8M/INYNkbbDHUOnKGGWSad2YratsMCxD
	eudkrpmOvlsupf44q62T/Lh1gDO36ByiZhdsaZz1UwfgXB6qQ0zLNPluwXp796gV
	SVo5/Nurg/VJ/ULgtw9FI7KgcUgjsHRvFQD67VWtfweWrLudPT7elYXkHuV8RuBS
	iRNOK5Xfc3aFxm+1b3+c2cUxGBIO98zWaFY4f/cBet+NoidI9wsdaGqWqBX4vWxK
	xtQQ9Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgyts8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:09:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dfb24dfedfso16256465ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791212993; x=1791817793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTlne3T2FPsgfeIHj85O7fAaGN3E084SkCGxWBQPoZA=;
        b=BKtUm6T8jNIROe0ClNyJUXsxMYM27pOz3a5csdBDgCl20HPt+WwxcG4Wq46GAtyQC1
         raZy8nu5mMkQECWxJRAvn4nN6o9KNJ3KMAMA+U35R/MWeDRqp/SD0paFqV2klOgpXtV2
         mKtoIrQgNQXQCJFN6B8wInmdHS5sVEgiCVDc8YBYJEYPlumiL4GmLyGCkpR3wtZTLI4q
         9JDsBt61W/X14UakD1oT0ehEzt3i4Fu1rS1wzvXduk1TrvJkzcgM0z26u8wny4jYRi38
         UuIZ2ZFi6N+31Hp6/VKs+D81GpTKcbvPLbTSK12NONq7aoG3+tr93802t1wxUAd8Qkzz
         CLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791212993; x=1791817793;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTlne3T2FPsgfeIHj85O7fAaGN3E084SkCGxWBQPoZA=;
        b=sw+SeUTcp5z8y43b7DQSddtfAUvN3kI0CxZs6V9FPfa7sbmpRJ8WcubLatBTLe8L/P
         jRsbexN2ieYnllZpEEJgDpATn8z6b9zZfieu0I134smQRafyqg/Vb6pAokjMe+LIGWHl
         8tQ0gDOMtIVHYV/6ebKuyx2ajG9JhFl82+H5VcjATgrIY1dnf0I19UApb0sbahIq+Ind
         5FV4bTH+CnnV5scDcv0geMZLMx2BaUPewGWDyAkYPEpBrSGlTcM2x6bk+xah7f4GbjBp
         MHqjdPtbuB2QJIjV2QVa1XRgkNBei9ynlvHSzd2gXNN/Eyqc8WT9kJpzWak2NVE57j1v
         iO0g==
X-Gm-Message-State: AFq9FYLDo4xHnfQpLSj33Vv+UcIwEndYNTNDchAtI9U+pXRWzcgT7ABh
	Z5fvyyqIB1rFnQYvTpCFw77ZU+A0Coa5UE6CkyOqQZ+H4QF7IgpUvy2SaZUOezJp32fmClJgsWn
	/9zs/fW7bsLYFWPusCjLH3mmT0cu3j6h5kIUgMIzqrAgGl+QcgTedI3TD4yWYCXHiOsY=
X-Gm-Gg: AYBFou16eVLVzUNGyL06cetuKv7OL1/A+bDgCQWrcdqtb5lbRJyTjXPG6p0+VMjNJN+
	HnEHULXsT+3zHRT1DBKU52nuLG5UJYIzReHvuD/ZpWMgeesMBK3H7ROMZnx/mOdb/Gy9Cx3usyI
	RAjmmaeYixN6cdRM7velR/iidjEYWWgyiEcKeYWPsG+V5jZ57TXZUTE803vNmidR97F51Q2mJrK
	VjxORgpOLidl+dK2VQI6GuJjLiRLVxtO2vicLwDVrte2ZOJWpAsc/eNWs7EPdX95CabJXl1n38j
	qw58oEnL9jARXsUMSXiN5YwM1NRTt9c9W8tDPJXq41QEJJarRPfJDqMOgFIIdXLrbvkpM17oaRD
	IMtF0twVNHbegiuybQhpDyUseFN86ItrvaimfPBYDEC0LXRtQcx6vbxM=
X-Received: by 2002:a17:902:9341:b0:2df:ab09:2656 with SMTP id d9443c01a7336-2e49b6ad7famr76692725ad.44.1791212993083;
        Mon, 05 Oct 2026 08:09:53 -0700 (PDT)
X-Received: by 2002:a17:902:9341:b0:2df:ab09:2656 with SMTP id d9443c01a7336-2e49b6ad7famr76692465ad.44.1791212992580;
        Mon, 05 Oct 2026 08:09:52 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5cae1bfsm9130075ad.28.2026.10.05.08.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:09:51 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        linux-wireless@vger.kernel.org,
        =?utf-8?q?Nerijus_Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20260908180308.788642-1-nerijus.bendziunas@gmail.com>
References: <20260908180308.788642-1-nerijus.bendziunas@gmail.com>
Subject: Re: [PATCH] wifi: ath9k: refuse spectral scan control while the
 hardware is disabled
Message-Id: <179121299145.2358654.5147778588803855831.b4-ty@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 08:09:51 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 66N9VnbiNWrCyJiwqB9pOURDP45Fajbp
X-Proofpoint-ORIG-GUID: 66N9VnbiNWrCyJiwqB9pOURDP45Fajbp
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac3bdc1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Kmx-Ht0RI6vGM5YZ5n4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1OSBTYWx0ZWRfXzi3LpaRtGS2k
 7t9IUcnAYRWQsar63I3RByxjXHsx/ycinPJIdGTVvIqPB6+SZoIp0+y6BD8kq8BfQxkA48Kgnqs
 fiTFNk0+4iSCxYep77mf0YBIl2tzXsoIRWiajhH3SIjfZKhy1txLU72DKSVTBirTxGKIjXqOrAK
 CAmz+NZtqyw+iUem5dLNEfo+8GqWFsjYZGcSM0C4waQeoxKpekd+GWtMhwslg6cwc3B0s9xyIcB
 /+8HcvsY5A56XFQCB1u/g4ly60QzFf294Pq94yti1M/ZA19cJme1YsdtXLK7hFTF5YvOM1ybwgQ
 57249/ppbh7wUy8OiTQmF7vngwAUd5pjPVHCOKguLFulAZTlZ+t+QGcj22RzF1Hl6zQ5250g/K7
 JhjpUfNhxj55BWhHwDYTlBt3bOlELRg7ptRm0X0D/aqP/5gW8raGZvYHWGtznH/sSFNN/ma+znl
 tK/OwQo8wKUZXan+U0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1OSBTYWx0ZWRfX7l4N4VfVNl00
 rfconvCReq11c46imhoO+vILBNN+TcMdYLW7kpXOVLqyi3E0bxjWbJTGiWnblCQ7Vy9iLYYzoyS
 2oHwUbJJKN7aJVVSsR801czt5kAwV+s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050059


On Tue, 08 Sep 2026 21:03:08 +0300, Nerijus Bendžiūnas wrote:
> The spectral_scan_ctl debugfs file drives PHY register writes, and
> nothing checks whether the hardware is up. While the interface is down
> the chip is asleep, and on the AR9271 those writes go over WMI to a
> sleeping target and hang the firmware until the device is re-enumerated.
> 
> Refuse the write with -EBUSY while ATH_OP_INVALID is set. The reset
> control already refuses on the same flag.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath9k: refuse spectral scan control while the hardware is disabled
      commit: 59411703660919197234fa0ec80ee1a5bcbe4276

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

