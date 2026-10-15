Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE63524B14
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072306; cv=none; b=g3ltFGGyMWV5iPg7g/7okWGkxeNb1exTTvBPne+KkTonlw28FxJVCU8Jeo606AXkSvobQTMqBSsoaDl5A3lkKf6jFz26ig5LbaMWBYGOR9/NE4TKRiqyIfMdUwZSKn/8aoH0tD3JFSJQUHZOpXDapESwMpTN+in9ACR8QRsD+4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072306; c=relaxed/simple;
	bh=KjzcQY+K7aHtbS0NAuCYEVDNSyzs6TQuMVq8xZeEeMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e41GyfcjPWYl2ogj0SCYv3iKjcFtbo5j4BTo6lnRV0W7H8oVAudWKkaUE7UGu5yBh3vuagRprFX0TqUvzIaa2/KcPt42tLOkm8bbbjOTDr2UK7Q/0T0gI9ppZNszgCK7YDaoYbJ1CKFyMRI5boP2bzBcmK7czrnUOjwpJbDIao4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfGYu09J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iF6O3pB0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfGYu09J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iF6O3pB0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jIf84077467
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j4JDE7aRkhLuddWv4fnmh25SUfb4zOBGWraW4nSecoA=; b=TfGYu09JezmOIA0C
	prQXwkEgKH4dBbaqGUYzEwgct1+3y6YQK8/ituynNTUCmXhZLsBE7wOAxSpXriv5
	eJOLyzXZrYWoWbMZs4r39sV0nc1qKx24tY2jdTrORr9bngvcu74CU2va8nNQrFiK
	lppenhV1VYf1cU52sXCB97gyc/KZAmIuDTE202HU5/luAqnRdu7tNCP02ie/lGPC
	v0b4XRtAa6pxrwUgUVxpHaeKOCMwWJtSC7RO1vu9b3yHdfN+RGqiCDLqASzy36ep
	oCW7VWQR+EAUAj+jhYhgqZuC3oR5w0F3bTyPOvLz7BxLH/YCqIE7jfnaxORVVMT5
	dipZvw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc10tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:51:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso96472585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792072304; x=1792677104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4JDE7aRkhLuddWv4fnmh25SUfb4zOBGWraW4nSecoA=;
        b=iF6O3pB0xMaHCN6XfYquM+A/Ob/AkJwKTInp4HUwrulZrk0d99ekkKW1cNfu52qa3D
         pjpExPnxI4T3jtmZVnHJLZ9SCxcV/M3IOfuk2hRJDtcwc+VeClTWyA3g7ZrXEClqNfc2
         NSt/CBJeDAH25l0vaLGzhEzmVFMyREPVyo9gVGvJ01Hak83XgqY8jgNJ3l7GwuroZCkK
         rZS83ROXx+70350FUHJAnfCUOFcHdP0kK/AxO/rl4sGMtNOkUTHU1rUpFIlFsyoY2Cif
         djrJvfItZIfpkB+vJOIAJ03WLpMtaUizCiV+sB0Jw9na6MVToSjfxqjadyCVf4ozwSlX
         E7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072304; x=1792677104;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4JDE7aRkhLuddWv4fnmh25SUfb4zOBGWraW4nSecoA=;
        b=ZD26Ie326pkNFWf90QPkucpwctGeldyJQJekKxo7h14eA2esjnZ84LYVLcE22lhDow
         7yRWc21TXtQuT79h7m3XtCL8xKQybJALdFVKSOkkj++Ki4wGbM5+vVVPSZLPo53tQhue
         MhUvZZ0v0j/SD1pjH4A9hlfdy3Z/hf2F/zh1oP6V1dmjKpt9pmcPEfwRerfsMk2BsO61
         ug2Lc6wXqv7r6fuXh448V/tKfXJbYvT1LPfffMZ7dp0kywrwcCYVtWHICuxbN+gsSzNq
         LjlJS0myi+WJoa1RWFQedGsL8qcxccSswhu65KoTO4cN7y5zuSyKMUJpq0qJpsTRSjnO
         h1bg==
X-Forwarded-Encrypted: i=1; AKwUvBzUGxt9PcEEczUtwh1D08+VkXgMxKjzSBZIXl/frKAg7z5fL2a98mw6CnlgoA/hYRZzzZTfti9Xp5pNdGA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+TndpMrh3GLAPIYXON8bItOYLRCLmIhdKFgZbWH7oo+wCk04A
	Abzq9EZ1/IE+aLz24j9Q2qSJeiMCqYya/Cht3DmEXqCuvrU/vxBE9zsiIj8JIUybfkuQkcl8Xif
	z3eRgh22O7pMlfJPLoEfrnsgGkZCmrTNh4AzYqTWB8ln0ZLj+jRGj/0pwfpnIMwFKXsY=
X-Gm-Gg: AYBFou3Ud+kwTiid1iyJKs+AGP6D5mKuXk1JPL39fwhrEWIKDXiTi2hC+E86F2zdoY7
	FjLDCSzdlNlJk8Q3bCH0IT/kfO+609kD1hTTAExvIn9ZkvKemil6KY+vDs8pp/XS1aPu63UGc7P
	JQne8grHaOVOSA7AChkqePYYdizYQ6LPKKsP7Qn8jMXCsx1kbT14/4w6bwZZS36faXMRCgAZEpY
	X6YKQ6+dAfbkPZZ71cQ3DAlm0Iirzaqu5E3rhK25kbcY5GjL7tw7AdR1nMeL5hyu3NCMciyCBZU
	kpaxAQfYzoGiqWUS4RLw+EJ0damU/eU+TDzWIKFanhDagJPc3v9zF1m88atWhokTb4RO0/n4NRj
	Vxl7b7BLOyWeBCcqikapENA==
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr3503010685a.4.1792072303540;
        Thu, 15 Oct 2026 06:51:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr3503002285a.4.1792072302803;
        Thu, 15 Oct 2026 06:51:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafded5544sm6741681fa.18.2026.10.15.06.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:51:40 -0700 (PDT)
Message-ID: <2e5bfe2f-f639-4c55-bb4e-e8893e9f098d@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:51:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm630: Drop the cluster idle
 states
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261011-sdm630-idle-states-v1-0-3181d488dc0f@gmail.com>
 <20261011-sdm630-idle-states-v1-1-3181d488dc0f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-sdm630-idle-states-v1-1-3181d488dc0f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0da70 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=RwhIZBXw_0bjbjxBZPMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NSBTYWx0ZWRfX8Yym6xANiT9b
 5FcCaQ1+nEIiZRixfZZZKjnZw3DBzVjP5t5rum2MGxfBjJ+L32snvdsRAhI4DHdkgYZt7gxJsk6
 7UhgxG+IF11/lCTPm6ZUGfXguYn2e9U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NSBTYWx0ZWRfXzAoibP7CxKML
 RlMzyDUX+tOZFKRSkqjPnWPw5VIQeaGxdWegVrEHMvI9UKYmLpIuFNjxjeqfFYoCsftPOPRp0dW
 gGjJDJS7WLTAMGXO0CBbr+qx5DlIy1lcu4yTRl5uExhIOvumIOPHzsmaujid+PT/SozoXCOKwRJ
 sbNLkJKGqSzDK91RtiVr39VrFtJGmS97Dl+czC16mqSLc+VSqP/UgnV6HqAAb5KnHssSZXGjvmW
 7psmlUQKv9J7Yq5Md1Ybci8ObWydgtLMsabDwIWy0Ir9vgbKuyN7V14CeLxnBVvTBygAEm9wdvo
 s45+Xt3J3VMAttbuo9gs1IgDlZamH+t72NhLvyR2THerNgUv8PQTGSuR/2CG07Xoz1F73OcyrUd
 brAbYNPDq5pWlNdeTwtIxCWEj3Rdmrf6lKoDLnM6O4e+ivQNAR2Fumxd3kzCtOXKBjtgEt1xY+m
 aHEDNWZIwwlvR+C8n1Q==
X-Proofpoint-ORIG-GUID: a-vUgoLaz8bv_3f4AjEThaBUU6j5ieW4
X-Proofpoint-GUID: a-vUgoLaz8bv_3f4AjEThaBUU6j5ieW4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150055

On 10/12/26 4:18 AM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> The cluster idle states use PSCI parameters 0x400000f2-0x400000f4. The
> vendor kernel encodes a cluster state differently: it puts the cluster
> mode in StateID bits 7:4 and sets an affinity-level field, bits 25:24,
> to 1, so cluster power collapse is 0x41000043, and only the last
> running CPU of a cluster requests one. A flat cpu-idle-states list
> cannot express that condition.
> 
> cpuidle records no successful entry into any of these states, and every
> request for one fails. Because they are the deepest, an idle CPU keeps
> choosing one, each attempt returns at once, and the CPU spends its idle
> time retrying instead of sleeping. On a Motorola Moto X4 (SDM630) with
> the screen off, the CPUs made about 133,000 failed idle entries per
> second and spent about 10% of the time in an idle state, and the
> battery supplied 277 mA. Without these states they spend nearly all of
> it in one, and the battery supplies 115 mA.
> 
> Fixes: b190fb010664 ("arm64: dts: qcom: sdm630: Add sdm630 dts file")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

I threw an LLM at the downstream tree and it decoded the states to:

C2D, no cluster state	2		0x00000002
C3, no cluster state	3		0x40000003
pwr/perf L2 D2D + C2D	L2 2		0x01000022
pwr/perf L2 D2D + C3	L2 2		0x41000023
pwr/perf L2 D2E + C3	L2 3		0x41000033
pwr/perf L2 D4 + C3	L2 4		0x41000043
System PC + L2 D4 + C3	sys3, L2 4	0x42000343

sorry for getting it wrong years ago!

Konrad
