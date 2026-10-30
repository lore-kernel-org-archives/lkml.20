Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364641;
	b=5VUw3fauzNWUzDJRrP4HXAtq+0lsnqE7hdy9LBW0qZ7UfZkcymCInOHks4LB125tBZ8z
	 aDBqUHEYbL/GxikXSW3hZj0dq6auGScUSB7Kzl2CVzmDaEkKMJVKW0RkdxgTQVVd/Wneq
	 /qISjR4IF6dhmUCowSYE6JPx0Fmtw62hKseK45QNFkA8LGxIOmvAMLJ7L5e1C/Kc57s99
	 kBwzdQn1McRT2L6fe72f/JPYeH7TzVg1iz9fnMgA2W0O1JZ/IPzMz06frdh0bovbjvyoP
	 2yW2oWD2LWHsQBwdygwULwT/O9RNVDcsKw+dc2o4mq37FTJ9GH8RP+CF//UAHtLIhhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364641;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pMlRakpe9kmQt25rmOummOqw5ijOCNsP1F1VTowhD/E=;
	b=bvqhJELwgGq4y7+7nzWY/IW09dF+H4in4qA0mq36HCV8PGnVVMLg7Kc6zj1gSzTfyZi9
	 OsZ1VGnSei0zzaKFOcHqpjnUZOzXm2fXgiQ/AXzXI6cAbK5z7UoCfqXMwhB09OgxRG9v9
	 dmsIwl5YJYAYB0RLykhpD+LOjNxHmaXtZiNueaLBcfurcisofq1P0NTlG+dgsNLrHX7PU
	 DvXJaj6l+7iUL8m6VoiGvSqU4vCK8QLSd362V4m3lNzsl44WVMyX+LWu4hsFrRWkI0vtu
	 9rWrUHSfDVHB1qoPuR8x0NY58oZbFD0LmL24jaA3vfSv7lu1JCD0M2/r2EHnVgag+Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eLH+G/ka";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SvWuNaml;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E70760A3819
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E70760A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eLH+G/ka;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SvWuNaml
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBFwFb4143765
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pMlRakpe9kmQt25rmOummOqw5ijOCNsP1F1VTowhD/E=; b=eLH+G/kaDo+SOeNd
	hn9g3E3YnLyTcBrKc+V1QnaslwQCspq4tmkE07Ze65JVs8kJO5O/vrkHBULOwj5W
	S2GabPDHjQZjVTT5ENiqVi9Ub1F9czByGjjWhL0gfxdKoke7nyh5eFEoMtP7tuE0
	PEEJ5xKB/3ei6SMxd1aWXRmjl1zv4ix9W8KKQhul3fVWmbv9N++rQN2DlcNtiGT0
	JFtW+jAjXBa945fRvEaumaGi1ZBLUwaJGPYOjs/YH2aTuErzq4Jd7C6h2T1RW5Aj
	QIFw/69ckZYQgg3q1MK1671D1XZuQ82YpTpgs3nmRdF6lPgslF54bMpTWgQxwt+Z
	ZVOMog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme7532jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso14274085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364639; x=1793969439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMlRakpe9kmQt25rmOummOqw5ijOCNsP1F1VTowhD/E=;
        b=SvWuNamlfmolbeRTXoTaQ1EJc17sdw9nbR2uhdn4l4u0mu/sHL2gTW0F64BMHz0GXB
         C9yRP8RVMzwx5hY6wVbD0RHC1RybgFtXW3djXCmcpqpRir7JLSJ7Jwf3pqK+8i8ir1sE
         EiyZp/tP13U6NEO28duKibfpC8zZpAGroPUxEAB1H6O0AEltoxDsT5PioNCD7Lm3Sk7z
         Qe9RNQML7uadWf9K2uKJ8lq2QyWsI8dKW3aoxJZ/e2IVK6qVQ/+txcMHSYcZ0fRHjjSB
         CeLaDDQygtaCB5E3c9KVUQ61tZtOCIlueE/rBShoC0W3uXNULJdT5ehMfTiKVxaZVe2i
         jOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364639; x=1793969439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMlRakpe9kmQt25rmOummOqw5ijOCNsP1F1VTowhD/E=;
        b=K9wx2uQq0r89phpF+y+yiYjOYp66U+Mb3lA24RLwCuo6a8GZOgOhTnJ5zxA5dfTZ50
         Y9218Hq9CMIPggiJ91iPd7eV58ptmkGVxYbE/SqEzzrP206WN5IoAUZy30Qdi8xydYnt
         RK0M1TXMHXX2JGhFWyFZGRPykxaizjWOMWQv4UL9pC1SPtKRRQR3lCONEFg2G5dYAo7j
         eK/UHH6fsdi+vU5coTX+Hq/K+LoHaSLBH3ehiTXJ9hiiC2iFVl8Bc7QAtb33kN+SJXUD
         BxTsSdnW8i1hkL5jVcvFyYURS3DlaCqopJfEaYNzpe6Dwb5waJSzJun9q/gs8LNBhd7r
         zUxA==
X-Forwarded-Encrypted: i=1; AKwUvBwNL1Bs5CT664bhnByD5XCWaulx5Wxu7xwu/4eHkLcle/rpPGBRK/QFc6JRcLqQSEDv6Pu+PrLwM6ODxKg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJps9bPy5DM6OI16o52EyIFizyzy/ZBdI4akERKorH4WUzBMqJA
	gSLwFvErDeoQxSHXsL2xxWcdW4Hd4Oeq8AJE6bCkmVux9oij2EODtnbljomFh2H+iRGQjO2ZnaR
	m0zBhL7IHJt1NUJM6/oQAAoqLxdnX6IAc1dDbml68mubBhG+J2toO5lliycOpyc5fNqs=
X-Gm-Gg: AYBFou0X25imwop4aCdA3ZsL5CJhAYvsHrSqWHL5Q1YFHQjTIOZ16MYZ7vlCSQj1qiH
	Ll9nBgnVXqAfA6+F4eiJuegSHmov/sGNzlNeMnN38uxaYZTikNwYeM5BaGpVajYk2QtkewDMfHl
	ilSRmeXD+3DhNyKDpp+fSpoeUGX0pv6v2nU55hkaRTSjHzipSDnI0pHGRO2YG9H8ZJDxDC9wnw2
	HCO9I9R3JQUdokF9NErKE+OWk5bTg5zYSWbQZJq+Y5LpCKx9TVoGKm+51NiG+AUq7n24ASgmNSY
	h1Csn+dN/ON9bwqRWIaIQTohEkFDaZ7w677s7NPYM80uJrH7OOh5psEYfT/S/cQbnU/VCi//Uob
	f55lK/WuMX6tg1gcqALTBp1IQHStLHwZ6eOTrYJ7+sqMkzNj7Xsm8qZ0T7ywVxEfGogKiqWA=
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr357018885a.2.1793364639416;
        Fri, 30 Oct 2026 05:50:39 -0700 (PDT)
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr357016285a.2.1793364638962;
        Fri, 30 Oct 2026 05:50:38 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf43b0esm62382166b.85.2026.10.30.05.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:50:38 -0700 (PDT)
Message-ID: <21e77fd0-7e84-4173-a43d-f177be98427b@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:50:36 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: milos-nothing-asteroids: Enable UFS
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
 <20261029-asteroids-dts-updates-v1-1-79351337d681@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-asteroids-dts-updates-v1-1-79351337d681@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rfXaiPLVWfIejtWfwF9UzyoNbij3AOQK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX5+E3KBk7QEOY
 Dzb5KHD5SClvUrFdK3a2nvzVFSH+/YpbPSs/jelOChG/Le7ohZSMEUSh+qJjEEU44Kgs/CcU+0q
 p2TmxPPZg/KMB9IcQDnOhIUueY/UAOUOvAb/3NK68QbJGsMJzcaU96lFr7Umgl/a3bN3q6hUXkS
 7OJfbzmLHAWdn19bIJKtYaHiVGx/TdWi6j/Q3xMypktfHJVdXoabHTvU+l5U0nyqbjEFaeOqdk5
 S5XUxE6JCAxMV3faTCAf6THkkWg11UXEzGEngloykuLvIFMNg0fztPy8z14qcn7hxtyGTswNmpD
 Z1zmCtANBchdIrHrc55+L1dt4yXWUWIqb+5ppZa0/U6+49hOjdnGBrgO2QHUJZw2wve2hjc5WnM
 ttjNtMx7ItY40/A8HJP3cBVg1HfjRcHr/J+Ta3qfASAMuQCHQfYzDVHLo5hoFm7OFaz9qrBKpsz
 2UYubU2rSSH4r8iqvoQ==
X-Proofpoint-ORIG-GUID: rfXaiPLVWfIejtWfwF9UzyoNbij3AOQK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfXxvo8u4BxzcOH
 W3RxfSJwQX9jOeq/IIf8ldjN17Qkdj76CuPkvNJohKbNTZA2M/pk5Qq/FlMuNR7sYdMX9Ddx/JO
 pW/kFrqGkiVpS7oP8BXYql/SlN3Tl2U=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae492a0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dMdhFRwUw7ASlwpx6HcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300051

On 10/29/26 11:33 PM, Alexander Koskovich wrote:
> Configure and enable the nodes for UFS, so that we can access the
> internal storage.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
