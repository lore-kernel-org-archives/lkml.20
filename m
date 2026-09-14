Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBBC468C3B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388920; cv=none; b=WdgVu94nCyfd5f4wrxas/s59J/kTa38/mMVmC1PNj1PK7ifoJMWa/PxikQTVL2X8k8Tu44zd+Nz/TDAJ0111YoK1h5wb53Fv3/PmAEZeO1xMqNPNJUEtl1WQvrg+4DqGNqvf727gZIE+8nGFF7HbaBFFfD/DWAVJ/xl/kW+lIz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388920; c=relaxed/simple;
	bh=9DL0kYRPp1aAw5C12Omv4zJnYSX+EN6BhsllZoa07R8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U45rS5vYH4LS0TfNWauUYt5yH6tVC6bZW0GUYmT+ZTk6gRmvPnnyViK+LJKK7oufqDXUspKOyStM6iV9riz/W3fWt8SIXMs1ojUZ9rrpBpqSNAe+czdiDP1O6Yu7tSA7x9qA4N9tvz3ZcIs/8rPcDZMMT/u/bwU8uJtO4LRGR4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gx00Yj/4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G83dsUP2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gx00Yj/4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G83dsUP2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8xa530991
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fVRiChZYr/F9P/d74sBkacRr5i+5ai6D7md1w2IZUxE=; b=gx00Yj/4lf1hk1vz
	h9pFIJ4+/ofDNTuy4hODEOHSAs/KJMJX33SPXRaP40ygaHLpNRsksyP27n+SC+T0
	tBt+HvPGd9CQwJMjZEAVn/uIGds749EM7cFFkYwhSJgcs6ptcEVKS1Ye2kyXOEds
	VXBMAnQHhVL/x02lu2NTgge5FFOxOl1PonEUv8S6JZOWdTqsCY6b8olmxzh6pcyY
	ijZQMgaeoNkpZGHDLrvbF8hgzbsYod7SD7VUhwAFsQrFGhc4LvzPNY9Ouj0qKDXm
	ayxWO0YBHNOa60QNaF/phesyH/ZJJd6viYqvRmIaYH0Sa+tIxT27jIE71aYgLnOm
	YvhVKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstdeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939fc317691so54213385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388918; x=1789993718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVRiChZYr/F9P/d74sBkacRr5i+5ai6D7md1w2IZUxE=;
        b=G83dsUP2LKYyw2Rf1h2hJni2cJ5VCfQP4XNgkSWM9EqTdePTuI5pjYs/3m1ph6V692
         tdIrm3Nhrm7gSpFBNW9yipJWZ6Po3+LoKnkixXzwUPpgbwlL3OQo6YYkwI+VmhaL6zqy
         f+MvJHH1Yxiszp5q3qQSXKB3hK32WbyeOcsnO0f27hhumIoJ55idtySurZVy3V9D6Mio
         t4fuAlKKJnwwqlaJVxATJUZYeGvxpbNTOV096yrk7wD+vsYTAiaBxpyDXDvnANxKK6kp
         D+Bqlc0mnghdn0zoMX1HVPUiRlpO6pF1BQQbymIQczQFyy8b45iU0abnhX1EgcC2Jv59
         lR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388918; x=1789993718;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVRiChZYr/F9P/d74sBkacRr5i+5ai6D7md1w2IZUxE=;
        b=ZlWx6YzIKv7TSDpR2YVCS2/WFzBS3Aj3ca4rdB9xV7aLrr/Q/mf9pRRl4mkoFet76R
         M++ROD6K/lg9T0+Vx+lVDjBCdc86e5sauvaE3VYo0GQq7Wl0NnxMrgh/POFPhcWPhc3d
         9aAI5bgyY380W8cUbWMlit3l8JzqB7nlcUeqaRbBpUF5QFEQ1Hgb8GxrcL93FzA8Mo5i
         YZmnIBLDi+M6fbTly5U2GiL+pjTr5n7TXhnWvX3onyCE6iY0hL7+0LR2q+3gqs7+4Qt2
         1TPuKzswani4nBwrMaXfKNixP3GJygvpyRD/W3EVHlTAQetuuS7xBx53scSAMYzZtT8/
         /5gw==
X-Forwarded-Encrypted: i=1; AKwUvBy4+2q0Kss2tVU+CXg9F+TTBpbQGhsIA83Fh8OxdYVwxzKSTJqJcOLBp3HQg55LhB3BwAe7x0SITfg1rjE=@vger.kernel.org
X-Gm-Message-State: AFuF++mASFlajvISf+3+KzURuQkjNRSpdpn6C/JqpipLcnBlRiqKQxKP
	M2KwbKDwwcnqC2ItWIJk1cROu8iwZRdNpsI4tNkNoGDpKaCTYN4y4ynCVZaQr5jbOj1F0Sd2AIs
	b1CCPjArECNA6dp1gwa78BtPfjHVzrZct5XviuauPmakcAgS2+VzeYZYumXui70plf8cEmGpWxY
	U=
X-Gm-Gg: AYBFou0117XQX9YlVYP2fnEXeuASTtOLyGxFg33JAUhKv7ib4cfgNC3qedFv82tNSYl
	4SNRy4EbGzlvAtWv0R7CxGCKQqHsy7/DqV94GyUBBkNFt1V73i+9VbXfJwmfFdjYtq5qXuU2MHe
	ANwY+/cApfFOwcy4uvbYh8EIh6STIPF/JrOtN/h9PRE/4OcXV2O/bqmt8s0nlEMZgb9gMYlZqSL
	v8EHNv5FPnH61h8q4LrqCaDqO4SzuN22lVUPXMewnoKCPQmDJ/JayW7EWFrVGPfcpSmFTi293iP
	uci/QZL4K3sZZ94lOMNcSb3xaXIdeaYZOKIp9dsXegueqO1LnXtx8YxqiotyXXMUdRkbzv1LGLz
	uH94EGwnPdJ4Cyu9PmPmwlQ==
X-Received: by 2002:a05:620a:288d:b0:939:e9a3:3105 with SMTP id af79cd13be357-93a29c7f55bmr259224285a.6.1789388917712;
        Mon, 14 Sep 2026 05:28:37 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:939:e9a3:3105 with SMTP id af79cd13be357-93a29c7f55bmr259221285a.6.1789388917344;
        Mon, 14 Sep 2026 05:28:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm425149666b.1.2026.09.14.05.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:28:36 -0700 (PDT)
Message-ID: <46ea46ab-5562-43df-a67e-876c5e1d2ec0@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:28:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/31] arm64: dts: qcom: sm4450: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-29-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-29-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX/ppx8HXybMBg
 WEfE7iwc2rUG0YmAqwSm243W8eJCtUgh7Nue0Riq9As+WiQzJLCkYlXSXcCHbi1It+JcPAS8AA4
 N+34zZjBCIuzwIGT/OwMt1n7GdHJwPV0C7NgEYUE8f65M5FUZz4uCZ/yXvkrSYMOlbg5LK0ok2O
 8MZel/njxrq8GwyJq01PznzNtlgkJVHb98NfZ+MAJiVxSkbr6YHE0tj6hUUXpYWBDbLVxo/43u9
 5AwePQE/Sg+yJ2NgSf/1FaeK8xzf21YZ+WhpqihXg/FsHCigmX8Imh0CPirJo/+vM7somXgJjq4
 PxeHyH7sKmkzi+SHcrgRpTDdf59VMG7+CTSHaY4/GYrk9VbhiEA8aPEbylAiU8pm2JMCmk8Yh6Q
 PPzmBbH5zv+5JHjeFtlqp2yCnJyyAl+jR2tOZayPkB7lTQvKXnt3ONqEzYRQFXc6sGvZ0nVzBu6
 eanbwxFybuK3EKV3Nmw==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7e876 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: NzMZ4o2ihfh7_hcSJljH_5U6nYmuPtgg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXwSc4AianzgzT
 XRvP5qtrHh4gTl10NkNzLR6x+1GoazTr9pZHDuCj+IxcV/tsDiAdIAOyQ728jsc9mp9AiRYBnl1
 JFhMOp6tTAiTwKySBoogaTwUvQ0JfHo=
X-Proofpoint-ORIG-GUID: NzMZ4o2ihfh7_hcSJljH_5U6nYmuPtgg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 9:00 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
