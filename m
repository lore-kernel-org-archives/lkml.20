Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F5C3B47D5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025533; cv=none; b=DjTzSXrSa6Kpj96sZSkhAz1SY40axyrNowFIj+Nl0tdehwlx13NWzvlNAz+9tjY8k+a/V7AKlxeraXpG+7yvw6FlfejNBo05jdneoVtH6UQvq6JLwIA2b3G8yxBXlzwqlYtFlsAodtq/zk9AMJhoBm7V0Ha0zd0vZcCVpI/K56w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025533; c=relaxed/simple;
	bh=eM3CqgBL4woW3uvSNQaMJnpyezKNnY1o9BhD8Hdd+3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Goa2zXtT77WVLE7Sjc+pg1q8bY/p27vlxvbeDvh2x915pn7Vy9CNXTJo7WChia6rDJLLNISvgZ+o3SPcO/A3tWx1QDfwbIkxPgnDGwIQ3/WJbdvLndX1sFOWswRJuzMlfrpvZb9mlxoVa1PQVqJSF494f+NOpPXlg+GFv5D2G1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQddMCG2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ec4rr1Ut; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQddMCG2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ec4rr1Ut"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GSlv3487387
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ScjaRXisa630raTeVAXO2NA5
	6DeU2lojj5oSTcac+p4=; b=nQddMCG24aHiOxH14YsKQxQveYr2cCixpJ2/df8I
	eZi8z4qjC+Qtw58AC+E3EDilx9xjtIEp32jaZfNVmoQOWQw/RF2BqrCUVmlD7QRA
	MCQfhgqSGkGvc5jBciKAh3jLb+NhZ2fyIDQapwuSnCVUpsvb3EGXfcQJnZ65D13I
	dn/2eUVH+BP+wYY3OpzuqPqJV4D/7QiokrHGqjZ8kwYOESEO9kurZX9HoWdaczML
	7npESgPByKoDYe4qrkI943K897uow5nW2cpmWH29ms5tHLIFsrQZ4KxywLHRbdKa
	Bg3F7o9hCPVZxXJensMAO0x6n3uUA+ZXwrYE6SXT0Vif/Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyejmf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:32:10 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7ab4af214so1854269e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025529; x=1789630329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ScjaRXisa630raTeVAXO2NA56DeU2lojj5oSTcac+p4=;
        b=Ec4rr1UtVR8SJp5ghLfkDQZ+7v7bIWsRYvSvy90S800nwP3CroVZm4p144a/EFd/Xo
         7ypr1mGImUJdhM4XxTt6it5iY0YpHQ08+J0LZvmSs6T/B3I1QUGPLJEWbNRxt/4MkKTY
         YiDwTpaMegddKV3aa4j4sdG43qPAp1nsHz+3JC6afiPY23WgKFSydq7xgIvomyGx+EMF
         Y7Zd7iFwuO+efO96lUJoaufO70yxGucflT754TgpmuIIAaX37pjeKMRvg+yvmQq8cnNP
         UwQoQIDJXn2wQsWxgtUVxqIgqO4nkEuH83Ony8srJiZ/JUloKWNC4vlSaHjxgThU09rP
         HqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025529; x=1789630329;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ScjaRXisa630raTeVAXO2NA56DeU2lojj5oSTcac+p4=;
        b=cDNukEgAkNWfzFbDEIVMhamxKJnCvBBWMpTB83ldh6T0n04kuDjpnMMlolZKmqd2KM
         FbkxwOkal76qi0IYQmF3Pr65yb8bKHPm7AxglTjSOGzQcprxM550+2m3puf8xdyOt2Rt
         T1WsVUxgPrBHbnnRlerVM2wct8ZjQZdsnpWnc0pd8PuHuhOYzl8d3qKGmOz6MN872pU2
         7WhGTDck2pKfql8V5WdI+cbxHg55uNE809w/xdsaU73FKktd5Z96++05PiDVV+vMr6bW
         gQek73b13N41MyHeOx8N8LeL4vE7tWpnux+taCM7jy944PILUR7PpRoEd6IY3zCig3L1
         +NEA==
X-Forwarded-Encrypted: i=1; AKwUvBzoYiipmNQ2Xj/aQlUXlm+blDcQJwoK7hllQupGCq1XqgZabaa+Hb+nKqesJsyFCSIBVwWKH9wDH4rzYsc=@vger.kernel.org
X-Gm-Message-State: AFuF++nx+6/JlZiiLte7mC6Q4Z6iDo6+mnTuWLmqh0bQXE0C9/JR74mt
	W10+Q+YgQyozo3YRCWFAQJuDaomqCHlXFcgz11oDldfHnLXZjdwYsHPDNtQUkcAziuwHxbPnVGB
	+02C+zQoZI2ZVuKdkfBGLzPYzfd2YffqXtI6pMBpS+FY59LeLtYAgiPjjrIr9n7HgLgo=
X-Gm-Gg: AYBFou1BlOY9g+ziXTF3lqbi+OsgR4jd5x4D7OOpNbTecNXLvPAraCnUWhT9hsh8C0q
	AwgMOwumdTZ8rrQfYi3pWU2+UVb8loJjyWVFleYS+vFbSstdGcrLnaYLIXZVH5hV2g7I8fsRTxL
	roO6h8DmGxRMhRcnjTk5z262sPjBY19nIJQeaFeS5kkstpkvVfWjPGRG1UwfRglY3S+K55IYFvR
	tv27kpKO/2E8SzgGebr0AYMs+uZJO7DRkR6hOotiED65VDsJHq+ujBIpkAAfChNukSCNCYh8pmo
	0JO8UV4+YdQL85O5VtFswTzYWC0UGrixZyb2IklbR62l5XZOIHOdYeq11ijr+fVm2qV64yQErv/
	14S6RseWFcyGi
X-Received: by 2002:a05:6122:551:b0:5bf:a179:b2be with SMTP id 71dfb90a1353d-5c7ed4087bemr17567168e0c.7.1789025525432;
        Thu, 10 Sep 2026 00:32:05 -0700 (PDT)
X-Received: by 2002:a05:6122:551:b0:5bf:a179:b2be with SMTP id 71dfb90a1353d-5c7ed4087bemr17567156e0c.7.1789025524876;
        Thu, 10 Sep 2026 00:32:04 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bc5fsm52719385e9.3.2026.09.10.00.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:32:03 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:32:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] interconnect: qcom: msm8996: Configure auxiliary
 Venus QoS port
Message-ID: <swtgayqrm4lbjg6ayd6qovtweqyutjbtjx2ymvar4rcflq5hrq@k576b7geg7q4>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-5-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-5-6dc5b5e97626@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfXw5FipyASUNSF
 +6wdRGb2bwMSZcG+6aN5xQcshPmwGLS7ewlGnj6abLwk39PIXkd+blb8D+OmcorvDSqt8/XJkH9
 d2JrWRtxlilWzDob8k2MyRoEPXeAoLM=
X-Proofpoint-GUID: 2eqC5fN3SqGHOtDdIuRb6jukJVP7iy6K
X-Proofpoint-ORIG-GUID: 2eqC5fN3SqGHOtDdIuRb6jukJVP7iy6K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX2HLVntrjxNcV
 y/wdbKhjFVZd2f4v/Czq0WLXiTBt6ubh5+s0YohWR2FMc053nCQXg9yW/oSGjSgSa+VmO5fHemX
 42h/ThfXYq4J7ejxMDwLUb5a+HDog9XcOkjEgEnu1awW7p4pverzYW0juzZpRIzXId4AwXneWmM
 ckQkqd/IChIyo8dLPo3Y1pUdA4GlCCw5eKtoaQwUgUFcja9rzVIatAbDIjfztpx69Cha1NyawdE
 QHZ0FUq+K7H0vVSBL6lhR+aTh+r0ZZ3buTGUw50VhA3Vt1+Wp39sHu0B5gR9ERrLOjr6MHjudjE
 6HCx+G/gcyyfw23+goHLh3UR41RWg3ovNupfc3vgkMlRFXGdx/q+9GqeeW4NXtO1AGatxvIwToI
 S3oZ64d3gQX397NMXe/LYwvSei6s/Rg/0q2wmx5H/kiXipPuVidUskEuQU9fER9A8YAf9XUuwaQ
 TbNkvfBrcWsHyxUKm+g==
X-Authority-Analysis: v=2.4 cv=Go/XaU1C c=1 sm=1 tr=0 ts=6aa25cfa cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YMW5T1WhuyZJOF4bxVQA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100080

On 26-09-09 18:41:58, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Enable the secondary QoS port used by the MSM8996 Venus node.
> 
> Assisted-by: LLM
> Fixes: 7add937f5222 ("interconnect: qcom: Add MSM8996 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
