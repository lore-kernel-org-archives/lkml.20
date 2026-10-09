Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400424DE702
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553939; cv=none; b=aufVXr3MCskHaqtSN/eEbwnkBRxE5l+lqBn7C4mQXTuemtQUqmpVOb3mR+uS3pEI17RkqBd24o7NdtBHaUzrDJPnnIinDK6VKWwyGRAfRMpo6s+CtM18fGujm1dq84UZpo/mDIsLODC0wCuytdxdWqGDNzETpFFjr/+AdCxBk8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553939; c=relaxed/simple;
	bh=dCf/iwjJ5omMIT0Rn02YW/fNvuj/3HL1YzqpUzlEl3g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IYUjMyExzFhDcQJznl3JtKVBeKDWMLeWVSITLfps/HsEHLKsyEkQCxlSXp/HPD4KsWak1ktG6RemN/hvNH8lCRXKv3yLNTvKts4J64K8x/YUQtcwAygSs5slxY3kjjyD79jkQckNnYYaI0Dt8Wa1GyPR1TKeKtSy3sBZuvEZ1D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gXGxwzV7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y51yZDvU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gXGxwzV7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y51yZDvU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKPHR2916790
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 13:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UvzXKJBfV+uayQ0cPiJ9wsBuI0kq999R98zNptLnsRU=; b=gXGxwzV7cSXK5WbM
	xe+y1GTYtZq4NdCKz6x4hCULf0W6Yv8slbNSaf+e4QXoW2/naryQ9eaY2Zl5ZqfQ
	B7TRypAS/SJGiqYoOKhCnXagIxvvnVqXBQzpoz1x4W0tGGC4xe9PIUd551IzmFVc
	fMFnNIeeu4nn01cw7K+TGjjqoDzR39KIAnNpH0cRAIPASv638GmUcuavVGHfHMbL
	Z8VoXndErs8BQ72uG8cWXNzF6ysU49hrqQ/b8Dshl4l3xvF74fxpqxN5odcA6F+V
	rEAgYrklltA1zyKeaOHmV8qILndMjNBlrX65oFhniO/6Y7K3CJ6KL/M57xhdh1fV
	o3NnaA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nuftm61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:52:16 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4fb73e868aaso6209538b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791553936; x=1792158736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvzXKJBfV+uayQ0cPiJ9wsBuI0kq999R98zNptLnsRU=;
        b=Y51yZDvUM+1A2wm8AUrtH3PDy3DVA3JX2cb6sO4qgkLRgP2IFmbAd9vsW2LEjJ2hjG
         g7kIYql1HB7Ig7O8vrYFoaNJNcttQkHb+IH7BA8OV6hIDjph0555NOfPywjdfzjZIQ3d
         LVJFEQomzeF9XjYiclloHrZ28ELTlRstS2fUlNYCphU9vNsu4UxpJ9OZb72ptI6nZQQW
         cdXpqrQjWXhwaoaM54/7vnR1d/JaGPiAGp2D5hkOw+gZC4698FUNv7UO0tFz9AH2W4bY
         3zfyCDbprAbTbltI/tXqADQJUzS80yUBx83SKjrs57n7BRxBPTa6neNmDiNol8fhf4/L
         BwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553936; x=1792158736;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvzXKJBfV+uayQ0cPiJ9wsBuI0kq999R98zNptLnsRU=;
        b=Q+sqzq1jK7pkKwMfFYEBPDBPykB7wW6UQpmBJLVBftGItrnn0yHXYS8QCRYo6al2MF
         wENWBec72x6bXlUxzfRSTXUEfrU26vQqpRpQ3WDaC0caSfc4AEIlfUaanEtlAtMgSGlT
         +n90v8Whng0qwXEmwLt+h5AmaNaxHjzynqehSRvbe5jND7KvoCawm2lj277vB4JML1T0
         2YfO2TSPvTS/DJM3a4bajX5pY8OOChhKSR8DXI2UmgJs2sQWuuWEj+c/89uMPCDSu9Cx
         UvcGO6GcAwofNh1RkRrS3cmTC0vd59sZnSSKvq5E5n07pQn74uhnPK1Jjxtp0TdM+kXf
         heNg==
X-Forwarded-Encrypted: i=1; AKwUvBzNs1lFRU/9aozEfz0ecYuGgXr1WV/y1cdWPm/faFkvsPHzgC+TRGJMSZ/pU6btEuh3Ro0ZyUOONejyhds=@vger.kernel.org
X-Gm-Message-State: AFuF++k9+UZjdoqXCr83cALPlnkexferBgvgFaYeQP6c+gZo78vcIaWX
	TTtY6nWJYkFDxKGNj6IdSM1/cLFwmgNgYiYqQqa2qh2thJ6xn9PAzoxIVI+uF+PBMI/ndzB6gie
	P0fgV4WduwWcm9JG10MOR28PesVD1i1MjIbxrnsBIf6X/LG4DTaS3TdcHUry+lFiDX4bv8G7shq
	A=
X-Gm-Gg: AYBFou3J8cR/nc7ZVeirifDPr4q2dyf2woVBpJt96aelNk8Gwks8+0JiCqs0R2VcvsJ
	m1qubvkxLWIYGQ0VDuoikv5JQhebo8V/VuRUyvlHTPuZ6TzzZB+UZRaI7ykBuTr9hQvWCPVA2yw
	RrbnU9kuEWDTTrpfGGp/JLC3PHUCHlZFuo1sE6OLpvUAUghOddhxyY/QMD7rGcHEnp2vrgK6k4B
	CZYjjWi71IfjC0PO5Fq0RZd/e7e6TrQNqMjdRpX1ahzo2SFGk0yV9CEqnPM/uGVEt4vAbljXC2x
	FxJHzOTyJsevc+t0zpdOhe9thvDgkEqqPm/uai8BeK69uQojM9Eqd3CNOHM4XoHi26SDs1yyw00
	NcvOcoecNcx+IAATHWUxn++tkoWULuTXuGpTWCXl7Qroy+5+vds4Bn/I=
X-Received: by 2002:a05:6808:6eca:b0:4f3:2f34:fc51 with SMTP id 5614622812f47-50c438a3ea0mr1454067b6e.8.1791553935614;
        Fri, 09 Oct 2026 06:52:15 -0700 (PDT)
X-Received: by 2002:a05:6808:6eca:b0:4f3:2f34:fc51 with SMTP id 5614622812f47-50c438a3ea0mr1454049b6e.8.1791553935058;
        Fri, 09 Oct 2026 06:52:15 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c16755587sm1949024b6e.5.2026.10.09.06.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:52:14 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jiale Yao <yaojiale02@163.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20261003101944.596546-1-yaojiale02@163.com>
References: <20261003101944.596546-1-yaojiale02@163.com>
Subject: Re: [PATCH v2] wifi: ath12k: validate MAC/PHY capability count
 before saving
Message-Id: <179155393366.875832.2344232704269907910.b4-ty@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 06:52:13 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac8f190 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=E-bL4xMuqhypF7ioYwcA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX/fc2DYOxgMee
 abU2CfzguMe2GeGoTz9dJlux/qMNm9rWRFh5P4wlHPi84yyJiN9sVRAn68YVN7TqCLvdyN+kTz/
 0wglY/iK3feUu6s1BHjiWzJOnPhLOWw=
X-Proofpoint-GUID: dIgoE_S44ztwqabPvNyUm64LpqcZa2zD
X-Proofpoint-ORIG-GUID: dIgoE_S44ztwqabPvNyUm64LpqcZa2zD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX6eCl+Jqmho0q
 juF4NCVm9Syr2Gij+d+1IQOTNrQ2ujfJdqDL1M1H2PPdvq/LffJHJ5IRsjk4duT/tun4NaS+/df
 iW4ZskaLLVyV8OUbdzneMWCBkjQu8v1XDKhcKv5VUlZHRRk6s3PGZC6qbGIRWeGVoFaUHzoJwB6
 bKVGnOvm6pjpCCRRZLBZBcpV+04B063N4WGBXhilHj1sEh6uDS9HTgkEQMd2JAb0MBul1AGOv22
 RWdVew6pQvM2P0kytAyJnycxTpl2A/M853PjfyCM8UF/7CF5bDi/E7MgR6JZSGmAv2SjqgBo7+Q
 90Te0g3g/rgfCEvxv+SDhonuzRL11W53eSw4dMS1oH7d2hQ5sQgVZHMJfkRzjpqMnIOXIzrF21s
 3/jTBEKvRvdOHyjmXq5nGAbC0KEcKY+jf8wZxKTOQAK6Y9FBgz37oQ1OaxpSn4Ko6VlJ/yjPUWp
 3fuKIOBXIyXrFggmjlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090055


On Sat, 03 Oct 2026 18:19:43 +0800, Jiale Yao wrote:
> Firmware supplies the hardware mode count and the PHY bitmap for each
> mode in the service-ready-ext event. ath12k_wmi_save_all_mac_phy_info()
> uses those bitmaps to populate svc_ext_info->mac_phy_info, but the
> destination is a fixed array of ATH12K_MAX_MAC_PHY_CAP elements.
> 
> If the total number of advertised PHY entries exceeds that limit, the
> loop writes beyond mac_phy_info and corrupts adjacent memory.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: validate MAC/PHY capability count before saving
      commit: 86f2537877d6029487811bc3e0cd9e086a196000

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

