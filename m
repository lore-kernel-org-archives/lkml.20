Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FDB48F009
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814534; cv=none; b=TdkWDdeyqGCBOJWjrtOqOE/RnPzToZMCZTjU0E01SNgHGxGQnLXKtfTeSJK9+v2PxiGy6XgQjFcz1alVaDJ2NlQrQldHyDN3jyI3pZ/NAIYt7oHTjuBGqW6q0VZoO3hEGkstfBdYaKbcFl9sMmBSvj9NzM58A+zaza4AXwLlm2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814534; c=relaxed/simple;
	bh=1kaXsKB1fh5+qDLa1LDlgXg2iHpGQnV77ZWJonixFSw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VIPitpMRMkjrMjEZR1On2g1aVxpttQgZgeELYHFdQl+vrIhCAEmypPXkRDWrs6+7uqRIAn0LXU2aG2jnJZ2PyrqSMfhhqWr6DP1c1p72YD9VS43i2Gdp0i5LSyQq9GW6gyAZLbeDfdUgyNgWxBAeca9TYSjXba3rhmEhp3rO5iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZDjckY2L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4sNn2lS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZDjckY2L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O4sNn2lS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0FKP1236269
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aFX29kFGAtu2xPnsttu6rTskuC0EwNUJ8aX+55jfLAA=; b=ZDjckY2L8vr+JJ35
	7MvKR6g4V1kRet4H0ExeEU3lMbaADfgQkJn4efZjxU5P1d34Xf2f5HP966oBLJJq
	TOnlRpDYB1xHSd3vYQ4XFQHQjQLqp3tlId/yt3fxc+fDEX0uekxnBwrJJ4HRmxIe
	wnmlIuZjXjG9q/wLzrDlAbvDPzyvBEqRP+YjyoNx8RDvbLWyajPVZmIF6vTyhAXb
	m+GNOtA/8BGzzsF58e2Nzd7XrV+YjApKVOaKNh/0oKzWdBub+5fEoXHk1IirNRQB
	8YAo9eSceaofn3iuGUUgq0Dlb4XqghzFDsFaFn7n9tjO6Ndgwum4SyVdr+I6Va8C
	7A7+qA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dkca1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:15:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4059155eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791814531; x=1792419331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFX29kFGAtu2xPnsttu6rTskuC0EwNUJ8aX+55jfLAA=;
        b=O4sNn2lSxUQBsX6St/4FsvjoZJxQmpluLCEab5FOARoxzWGeLjqgyxBo1shGwWYaa1
         4Ow7zYvcxD9y2NU7CLVJiLOpmC+xZfu3AWz2FIVtjcI2zydF9NmhXKJkzlVbMAsC+A5M
         /gbigNkOwFmVkhMauGcIwi/ottZyWIT+6IYcu9XVGhw3CQCxMyzzAm3Qd9OpabyihHhh
         EJKqi73Id1RtrkOir/HvhYuzmvSaCQRKpsAYCUo2NE8IdlM4BNOywc0jT5Cuyr5cLTcv
         MdrtEFS9Oi6f/ZbRwMH2HRIH0Dd+OLOxEIqDPuGkZ8sk5uUStvxq/NNgHBimHgRiu7G1
         X1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814531; x=1792419331;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFX29kFGAtu2xPnsttu6rTskuC0EwNUJ8aX+55jfLAA=;
        b=PKhiEpkel5I2PFZLvRPF+7ueuCQlFSkE8c4XJ8G5GuD1m9MRr4yHV4WDYMQKMFvfwx
         jvrZ9TNtjeWIv84tUdV6gMp/+UV2uvhi9s/WYrwNxcwKdubhnyF4OPaycDUfSn5PUyab
         b5DEgHd51W6/q4MM7fVJ5obqKjyfWpPcyBvNl7ZixIpgciAublSb+hgP60uBxHvulaaU
         Wb+ORh8UaTdRP0WxGPr0KONVK3BPxDa6G6CG47vp8eXaQUqQbe+Q1Y15745cvvsROhEc
         iHzhmnqhs3G0jqePeXHiGTzlDC3i3KG5clv7SDrwoPGXy4I5zXKheXptTjww+kjNMAvp
         2O7w==
X-Forwarded-Encrypted: i=1; AKwUvBwga7RYS0N1/LZ257b17MPWucTeTzJc7PBU4FFXsgGh9Shv8s4QpaKfPjdiulVbMhl6wiIYcbptuo8EFr8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOrWD/wU9f3XUyc6u+a6IyHf4KSPHZSnHnWqYE5AeZ1qC/m8Zn
	27ZGCgS04H/oe3UzNk9zsPj2N3w6/7CKC3SvH15Qa6lVWF1RgAfwzjCpKeS4V1XmFKCldRioC0b
	L4rPLCewE6al/BxK9jI/9CeG1KX6eitYgfL89xmeiC8X6il6tKlg5sTvwnpTMcVeO9YE=
X-Gm-Gg: AYBFou3MTg5VNP8zsE/wwjUq+xLSvBVhCURqbKa2cFetTpNX3nQTbBlkDM7rYBHtUk6
	KdgdrEQLL3OdJRCG4H+LaXbiaJ5kOBbbKfSusDMqxnPiMxJVjym1dy2segNiIVg3QzkUDspL1du
	on5F/QZOnr4mFlrNxPfwJQudK8rvaVu2C5Y+yWnd3DmCcAT9z9VFmnuuNlUBPT0HJ07w8Q12EBI
	Fz+0xQD9kyG4QImoBK3rxrADMYEmvGWTmTWhHmFA0QcSNU2sqeiJz5kT44ZTTYSOYDKK8ySvwI5
	bDLRGvD9FlLoH3QpeRP0TctdSkPi3j2wsopFD7+HKC9Vvf4WMqpVtQIckP//LW/gGgvo38Bkx6N
	UyFSIV2rlpban88dJObHyCwtoez5w8o+0/tRFFruhreOYKCBs3daUl6aLms0Ae8nR
X-Received: by 2002:a05:693c:4196:20b0:35b:af:a075 with SMTP id 5a478bee46e88-35b00afb749mr3312635eec.22.1791814530350;
        Mon, 12 Oct 2026 07:15:30 -0700 (PDT)
X-Received: by 2002:a05:693c:4196:20b0:35b:af:a075 with SMTP id 5a478bee46e88-35b00afb749mr3312594eec.22.1791814529564;
        Mon, 12 Oct 2026 07:15:29 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (las-colo1-bdr-fw-bdr.qualcomm.com. [129.46.96.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm21302992eec.31.2026.10.12.07.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:15:29 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Fran=C3=A7ois_Roux?= <franzelfranzel@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Dale Whinham <daleyo@gmail.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261006062728.45007-1-franzelfranzel@gmail.com>
References: <20261006062728.45007-1-franzelfranzel@gmail.com>
Subject: Re: [PATCH v2] wifi: ath12k: skip hardware rfkill setup on
 Microsoft Surface devices
Message-Id: <179181452875.1215069.2287645106143483581.b4-ty@b4>
Date: Mon, 12 Oct 2026 07:15:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfXzWiy6aNL3XpK
 q+eVuuVujL3WwW6oM+2Gedg9Tq7tPE3iZmD/SKfqwxrinV9DJTOIIcmWTZnUjviGCYiO1sROCMu
 ktLhi6IVEZglT9MLvIczDIJECST6CEqQ9Vki0juBXTZR7cCXhV60a7H5SXyt0stV2aRtwzLhL47
 4QYXMd2luQTXwGNxTf44Zr8pgkRFt2FnyFqn31gW7E1kfZSCgTSv4vtmgkLbf+FtxaYGvgBeqs7
 aV4/bFqarbPpKSIF7qoGJPBTwGg4VmLDOGDKwBYzBUU/PVWpg0Ux5TpdD+HuD5Sv091DgJKiq7S
 +obUnAH5SX364BmvEKWWZtX7ZFW++4ysPIy6/tVTGfizFdAQ4RNztdxjKRVpANW3pSqKMXU7bMF
 knzltEFH5YWUT/6RZk8t/QzyUdCvlhAKdqV1VbSDpibEJoi6cgb69/70xMr/07CxPctuvyzlDxr
 U2eVVlUCPDDvW/Tdyzw==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acceb83 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=zwy/ZOtzXhWWzLhDjT6TXA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5GOfUL4nasl92P49FscA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 5GvWEPc2nO68Uo7pEbujLCxkB_fNMHeO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfXxzYC3C/kbIbd
 cgp+UbnZ6cdYpVsB7W7V9Jo+4sJaA3xjesz5McJAZzgHSb5+E/njH8JoSGXtEAVoK1iEv6C1A73
 TzuEYhvZlVAqjr6zLsUvL3yTkhldsEQ=
X-Proofpoint-ORIG-GUID: 5GvWEPc2nO68Uo7pEbujLCxkB_fNMHeO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120056


On Tue, 06 Oct 2026 08:27:28 +0200, François Roux wrote:
> On the Microsoft Surface Pro 11 and Surface Laptop 7 (X1E80100), the
> WCN7850 hardware rfkill input reads as "radio off" and the OS has no
> way to control it. ath12k enables hardware rfkill handling, so Wi-Fi
> stays hard-blocked:
> 
>   iwd: Error bringing interface 4 up: Operation not possible due to RF-kill
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: skip hardware rfkill setup on Microsoft Surface devices
      commit: 5949d1910f13c20f6ebcd26eec9e0c02cb4951aa

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

