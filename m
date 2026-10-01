Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB3E51C348
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871469; cv=none; b=iMd20+fCuaoQD255j1zU/ePMai0KxSfc3N01RMh50Mb9KRH/3D5p+sO8+sLxq89T3xEUOurFBf1NKvsTKyA6JJ0IqGPVEQ+sKj7wfGNYHQ341wojvUh84eZTJliduxWuY+cyp/7EVCt/60coMDNrxfRDdUXVfwxThRjzBrskVDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871469; c=relaxed/simple;
	bh=skBacWyG8sqPOZwfFEjjgU22nY5e9p9nHDoaPdYF12E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=guMo4cRDovMy+GcYvaQptVmeYO/ehyikNetbfdWEEnqoGQpDcFBTt5wOED6y44lgDb+ZNNm6uZ6IGOfM2mINhRv76QkdnOFuWecdwSwICeqwkkMLQQ+g9p4t4WqXJ++RCf9yja1c+fApPIMvVMp2MqapnIpaf2eecZvRdW8y1fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deA1ook6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VX2+E27M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deA1ook6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VX2+E27M"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Fsr6h2139542
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 16:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bn13l10L9mJreC53wVZPdJvvDx7swzvrFZFrk8UgCKc=; b=deA1ook6/L8/w387
	M3pK3+XxAY2HN6tqzn0Lv5KDZqi+auYn5Vl8I8/CasLUgaTwjJf2Z/1CBzkgaqMG
	7YX0rghohVb+7UJZ/8m4FkKm+xY8BfolhziytDKT17qSe9IwhdVt+jV8iCnx+exi
	+jDdoIebiwHkN83QKYAcK/85bF5lL4XDLDbYmPk1F6e2T8kjMLCU4pFHyGh+keLj
	XzxcjOH8PWzwANmE8NVC0hby4rHpyNQ96ioKgYh0p6gG1fK4AuhdDCHkbRkMfoI6
	zq8VBxDkVu0QXZtThTptW5clXjLpV495n3FMK1bJm1HrDlg/4ZbaToQYEn2DuSTr
	5G9XTA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wcw7v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:17:46 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c65b0280a2so170291e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790871466; x=1791476266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bn13l10L9mJreC53wVZPdJvvDx7swzvrFZFrk8UgCKc=;
        b=VX2+E27MveBHvf6IwanXQYQlP58vtFFShyLmnB7fE6zK70eVcGT+nbihv5/8Uc8lQg
         0zdxFELxMq1TuyBUaRw/eWr+k4dGGiHKfuTXyrOTDR1Qxyaczl0eAw2HASMivCsfQMvS
         vLU3JV40XWTmaWYjvNw8k04Lfry21dfnwTkCruNxuDhYs/YPnqIliwobW3bFqOD/vb7E
         iz40kdYNPGUR+1a33nmk79x9mVcbl0cD7EILK3UXdqkoSoOLaWUM7SkPKme5BVLYeWkI
         4GvO1WLr5HQiR8MO0qTDuaTRg62GOibrVOLOup8+vkEMWU05TCeIk2GqS/TBNZpix0vW
         MLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790871466; x=1791476266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bn13l10L9mJreC53wVZPdJvvDx7swzvrFZFrk8UgCKc=;
        b=cYBS3OOPJdoXeaNhNPSQ8FIWFr6rBKGgMvMenLoXYLYn/YOc8I0ZDoUonFD+IC/P3+
         JrNoW9QM3mHts0z2uqRSVniNXGqcvPVO9uh9C2IMuOKE1XJMQI2rZ0wqtd6c/FHhwHkl
         oGPMPGhG8KtIW6DmN9Hv4O9aO2GQHCwaQwH3uePoxfiBk4PLhGYhayFbiZJ2jZdTousq
         a+/qJJUz+pMtouEXZqLkHDl4v1lY5gzoRps87uJ87CkxTPpn9oWnBdUZ7xbTHNfuO/Z+
         xA21isipmFd0R5WaVUM62lKWsWvykQfK8mX1Yj8z6Me4M6DffpYvqC1tP/tdPzxLndCe
         5KAA==
X-Forwarded-Encrypted: i=1; AKwUvBxmYVTZdmR5iRedgCpu7JqsB9u+rxj3ucuoGmqTZCH0E2qoF5QhQwC7OXe45jP/w/b3/4h0DelP3AHe1KU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpGlebuhMS5OQHanxdgYKTWVDPFE7YOMGKr/JWGgtAXo6fBxl2
	3TeDvDajqHCyju/aP7Oqa4lurNcbuuaFyHkRiSD7vokPU7/0AafHg9+K0W1zqoWQWrvkqC7/sr0
	6l6SP0qgt8yGSDs347YwKxCGvP9X2FiVJkm9JeoyJ71p910248kWIoX+aclaOup6OPLo=
X-Gm-Gg: AYBFou00BcyGHEaO+qy7ceue7B24NwHy0EZwJZ/dBIG2nnMe4ucFcDviyeWiNU3na0D
	jPaa7MR3hkoWIl2E7rTDhe5jXan1m0MijXcKxOukgaTWqHfebxrtTUPA1yWJsQDenAtr7xpbvh+
	kI17w6Y3jmfU0+lrBVoP5Xw2K8xgpTyy9oQVkhxZZO2AOTUehZ3KhYqhfRYF7GcQdmyaTUWl4nN
	/Lhg749e9w1ktPgpeHIAfKBBjv+MKfwkyXDckBVKgoCEk236NywC9E8agmC7TCrqDfTgRo/vu/+
	TumVGPr94UcspmU62F407jZ/NF02cOhLVH5Lj2MhlYa8KeJdbiEn3ZwZVy0fQxTiT2ogmVGGTON
	FzgnycH1l67X2JJMnQD6UAQ==
X-Received: by 2002:a67:e716:0:b0:7bc:a347:2058 with SMTP id ada2fe7eead31-7be722c3746mr1130675137.2.1790871465825;
        Thu, 01 Oct 2026 09:17:45 -0700 (PDT)
X-Received: by 2002:a67:e716:0:b0:7bc:a347:2058 with SMTP id ada2fe7eead31-7be722c3746mr1130660137.2.1790871465289;
        Thu, 01 Oct 2026 09:17:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d36785sm191691866b.41.2026.10.01.09.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 09:17:44 -0700 (PDT)
Message-ID: <d5253189-70dc-4279-943f-accc2b3ac703@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 18:17:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Set
 FORCE_MEM_CORE_ON/FORCE_PERIPH_CORE_ON for PCIe pipe clocks
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714-mem_on-v1-1-f5bfb6def0a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-mem_on-v1-1-f5bfb6def0a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2NCBTYWx0ZWRfX8rTnHPNSpmkH
 wqcnVu7s1/YsN4IfkUxr2QsLqv5aVZIhpbyDg2xMcCGHrqJQgj3n3xM+Wcq2XBoevt1tBQXJaFg
 Lna1dyiJ6Yn2h4uYP2AbQwyxkEUpaqZE2BTSGeBk780+aBsjAGkLueJwwGmxLCJIdnOcZ05ld37
 QeTK2UXyg7nv/v+/DGKhjGffhX94XqgDlZ5YYg9o8x9RlnqOOBOmSlOkq/MTg79peE+eNiJOoon
 eefdIvGEMiUNAI/jyYzOkK4b4wxW+8hakFDKkZG2VLhQOYxQX/Z0hh9QjSWDs4AtBFd+GcBSprF
 x6qfxXHoPsRSmiRlQ49PZulN4gVD1DqiH/t3HRroVP5bDxjnZbrjS7fvrDlFVSdm/ChIe+T71vW
 g//FD8Ea4J7/+11aW8yztc5j2Lqq0wvp5U2akHToQh/2voz5u5R2WnAZBmX3JFIGTuZ6LEa591q
 HClCW5Fa4AquuHOF4kQ==
X-Proofpoint-GUID: ZG30-gWKCEYzVofb5hlcmiVR7exRc3bu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2NCBTYWx0ZWRfXy6t1DvQJWsxM
 VYK1SoC0nQgQW462/vtPsLjklZqUmFVN9v/VMJuDIJMJI3egBIGNbwRRAK98JnCRg7CBW+tCuVV
 Zx1QW3yptDEIc7hS7k/yn7qV/s8mRYM=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe87aa cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=m8Gnl63oPaFM7zqXGsIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: ZG30-gWKCEYzVofb5hlcmiVR7exRc3bu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010064

On 7/15/26 8:23 AM, Qiang Yu wrote:
> Setting FORCE_MEM_CORE_ON and FORCE_PERIPH_CORE_ON for the PCIe PIPE
> clocks so that the inbound data path works correctly.
> 
> Without this, the PCIe link can come up but the endpoint can not access
> host memory, with the host sometimes seeing a completion timeout
> reported by the EP, even though the host can still read the EP's config
> space.
> 
> This issue is seen on QDU1000, Kaanapali, Glymur and Nord. Hence, apply
> FORCE_MEM_CORE_ON/FORCE_PERIPH_CORE_ON to all PCIe pipe clocks on these
> platforms.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

In case you agree this is desired

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
