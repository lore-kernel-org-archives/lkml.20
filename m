Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0ED3DAAB3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383677; cv=none; b=mOkRz/kSb1lH7FB3lNYQkDwXq9pR5LaYP+h6m73yXbIvCHxOrju173MPMBpRt5qVSKU9xhEDvNdORsLQMO0QUxiItmIFrrHJbIZn4mrPbkkceDekADilgED8CDaNAR1gtYLrgXTT3ree2ZPpnuI0Z3fqq4Vuys647+91MzZzrzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383677; c=relaxed/simple;
	bh=NqPCmk4Z54CGp183Dy5ykZwaZOrEpc71vqW5Cm11q9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAD9Vof4g0J1q6kDY+U4auMyPA8tza9jQmzichGNDNw24f2ArIaqZreA/51Ylq0nlqQNUNOoCD4x2ziCjj9b1YtB4GVTPrNn1Sm/DrXUiUuF6NiTGsVvZW/1W+eSdJKIP8Qe6KX+bLOHfjOTqywJlaFCY/8TAgei9OxfGF4fy54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASrX1lgC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A7TgE2Ou; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASrX1lgC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A7TgE2Ou"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmhdU216149
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pInAVHMlf/Eve6upG1Qt9AIC7c+11ZMyUtGAROpIvvI=; b=ASrX1lgCvhQIVIvO
	1EG760KUa7qJodiqESefAiJoWTwkFlGbr74Q8ShN9j3PL446Ml5p97Gcs4ss1BwS
	QeVC/LI6fNBy1rKgSvNmNuwTt6eRDZBvKhHYsk2vuz/RbsKNMSn5Zc0WrflUfJ4p
	Zi2g57bvCtQM+Go/fyMSBFu06T8qUI2545mhi8Tp2EAWNP9u7vj9l7O5OE0/npve
	y9tqDbOxa4lsl8BIsJJKmQwyH/F1qGsCZ8iV7j0bpcSvOgOjwdCvcrDcQKJJCLhl
	B0dhUtHq1uMzb4MoJGoDQO6i4TQiYRDGdi1mzniqlgHr8blWOaFeVF8b2yzCq6S6
	KIxBIQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dea5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:01:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9349ba88188so52338885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383671; x=1789988471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pInAVHMlf/Eve6upG1Qt9AIC7c+11ZMyUtGAROpIvvI=;
        b=A7TgE2Ou9pMM0tWsp1qHJi0yhB/cBWP6n7xxAfZWeK9yAv0EEw8TlQAShBl6GWFeOl
         QM29guryivGrEhz+B7uJv+mKt4GHo/9KU1tbKDSUc855d5kPqu6RnmG6ctd3QNtzpman
         LSFpPhRyKfxdceW+kscbjMMVR58m8oTmsKKjduu49SiXVJHBqhcAlJe1ddg5D+K1SXRU
         rH6hbg274lwjSsrPWMDudhV2es6CogrM4a6+7cftQbrVPp2A0CRTHr3DJThFKQfMcfRa
         q1U25G/8tvBo2+vM4e17QKJgdTpNJi0T6i1e1WI7dAlfXnoPhEM3Pc8FQO6aTehZ9BWX
         Cz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383671; x=1789988471;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pInAVHMlf/Eve6upG1Qt9AIC7c+11ZMyUtGAROpIvvI=;
        b=OStLCkSO7kUvkgxIb0dhRKBgPJ1qDMAYdTLbqXcBkASFUHrp0R6RY1XZANE6H1ZkKF
         8S/sjCiXjCUrluE/4R5xQ9UtXbiShVLgX9vFzZpbbwf51Xmywe2ijFMNZnA6sJcSpaae
         j0ILhv1eSUlI2D6toSUN+K/y6+9cIdJvs2U8Bh/Mq3gLq1Z3sJJI1gcladTgxs/Dzzbm
         x9p1eYYQv4x4E483KOIxmnYJdQdtfYBdsKj8zgWOBbfKCs5MPo74/5Gf6h7vGk+IFj6v
         LoCrA2Q3zStaSq0O9vJnRteHiQQPQbLlNJBnWbgYljXVwmzEwY7BAB+MidL/gLuGlEc5
         /T+w==
X-Forwarded-Encrypted: i=1; AKwUvByqJB94sipOXcyqDIc1/O35lar23M+2wks8tZe+ZJ1r71QYTJuYZNIcpTBwVgmxhYzlNfy9zZakgLDMvgk=@vger.kernel.org
X-Gm-Message-State: AFuF++mzWC0CQZY9osZXdjZNFxkxlsclX5qZIS1jRVa97VOOt04ehxcs
	Gn1OoXUxZHVqkyknKK+36Vl33tznG6OqB0DzdduOYVR4SlBvioi//HWI6alVFsoXE8ESzvEzEyS
	Uz99N/kwGJh+MxvrvsYhPCRfqWoVnDa+CN3osD9YUT0/G5A1j2iKwwBCPViifuPG9d1/zDD/ZxL
	0=
X-Gm-Gg: AYBFou3kSVDjA/Z90Z0cPYnMQZS8MtWbJMUIvyIpadSaP6GMEg5bNGld14O913i8smg
	Ifdxl/FYKk1Saa1iz1aX2GCxM/WvcfRfpScM2BsEUCRSRBOdN8B6QDv9WHCmkkjl9SIeZD/mwf7
	WDC4EqV+YQlO0WCArhvWxLVO4y+DTIui2NznlVyo07P3/GwmVZgrFKMXxuohjyMKBDCkKwKJQaM
	Ls4vi3ID+xIpYvJ3tLqDx0WCC/kGBTGmjg2mq+tTO/HmVEcdnsytNLyL4EtbLXblkojY7r2Ml0S
	p2GV/1aE6+Ggvu1a3T6ddWutGm5PSMOdR4JUSUjk/4XyOCI5MBt7AWqR8TsplNy999yWwKLFnbu
	zXSPBRJIs8nVEROe6bsN7Qw==
X-Received: by 2002:a05:620a:3704:b0:939:9ef4:79eb with SMTP id af79cd13be357-93a29d48104mr216428485a.6.1789383654656;
        Mon, 14 Sep 2026 04:00:54 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:939:9ef4:79eb with SMTP id af79cd13be357-93a29d48104mr216340985a.6.1789383649101;
        Mon, 14 Sep 2026 04:00:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966063a2asm405283366b.27.2026.09.14.04.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:00:48 -0700 (PDT)
Message-ID: <72b187a4-fa20-4bcf-86c8-55475643db4d@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:00:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/34] arm64: dts: qcom: qcs8550-rb5gen2: Move PCIe phy
 and GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-10-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-10-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX42XjKirsWRsW
 msxBzSPOcgoW9ikbEc/LuGHHPpq2ocidedyoDRVgVyUYq8dM8E3eMjtOpqXV00xT+U57Hcib3wb
 5KFJ/o6j3vtnEtKzrpKCo4fp2Vhq2FY/S7T6bOBNhoVRaKMGILvI+jkzrLRaFRV0A85QQbJgpiH
 zCNiMcPNzdnaHg9HQiGLQc4pomWXCu/Z2DuAX6/jDxNnG6k3qDrUJZX+W3n6xWu0ZwZy0wxNYi6
 QIHKUUVbrOMMbQ1qD4QNTrdh67nmv0LCGaVIFwLW30XQS7JYZasrX0JzBBb9sgfxnO+UL4GaQ9U
 IJzxdhVetkrMHjmm9XmSxBuzyPH9ga8niXUfIX1yOM38jm6v2hQ4QwGNqyT7WxYhj3muZzLGzrq
 /rOG31sUdtkSZwY8nwk+pII8/22CGmymaWdEIq2HNq7gtubXMIK8sMWZ1DYKD8PUzEyKu6ow5Hw
 GjDdEuro1FUw0w6oyYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX7fXBQcLuDpye
 gPT8SikF3UcjvqFKyBu/osfo8KdBlITRxezXNkvC9JXecCCat5RbIvpaFQVr93UU4UW1ggtOJxz
 gQU75U/o/e2oU3yffTNIS2ZGgGqelaM=
X-Proofpoint-GUID: ax_Q_HZ-569N178QrO2Z-h5kfiwXN_sG
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7d3f7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pBeMIvr_L55ZrqE9P54A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ax_Q_HZ-569N178QrO2Z-h5kfiwXN_sG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140156

On 9/10/26 3:28 PM, Krishna Chaitanya Chundru wrote:
> The perst/wake GPIO properties are per root port and belong in the
> root port node, not in the RC controller node. Move perst-gpios/
> wake-gpios from the &pcie0/&pcie1 controller overrides to the
> respective &pcie0_port0/&pcie1_port0 nodes, renaming perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

splitting sm8550-renamed from sm8550 is a bit excessive, but anyway:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
