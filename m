Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6669947ACD7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932504; cv=none; b=UrfMyATf6MgIRXn6RJqoL7ZSJmZr4Lfk/0Io6coZT44h46HXus7RUNnWs7O+8kOClCfivxYtIgxmkqH7Am6EnrVP9CqM9A1RwM6mHZj+zy3NFf0maofhZrVtleYlcL95OwRgVqg/hA0MEx1OOIVCwUHvzigzhZK5LzuRF5GMGUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932504; c=relaxed/simple;
	bh=3HocdeeRheQQO46Pz0tMPvTq4Z3DnJWQAQTkfu7sf3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/rtApOMFsrI4fCPMw9sMWA7EbcZ9hfzaJKqDHXzYeAY1deU/2/E6tnYJuDiPI5GB6KnU47REE+NJBBGP6/f8lHgVh8wrkAmfwHZz6pQxLT53wHWkkfDrAMuvXkS4Arv7HXlkUiAc0OPYJQJqhg3gWLDF3cPCmYGiiVyXaj2xk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bc37PbaA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YP/UAdXR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bc37PbaA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YP/UAdXR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925j8e41618650
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 09:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K/PRJxeffShrr/JXYd21vlmy
	YtuaDFVG3OVp3sghzLg=; b=bc37PbaATmiuMJYseuJsTvX7Sc08AUAMQm++Zpgz
	VHYkawS2fU+KjRdE69FeeXBoLXjZAEJ4S0cijkTRZFc9Jf+G+uw7tsINNo5VkhSJ
	N2BfeoPSeVQEwinMW8uHgNO68ky2zOmmpqqAhm3sHU2sTukaj/a66R6oLxYQMJdQ
	5+kmzZC5c28Gb3dHW/BNos0HM6kd02Iv2/1tX3gDDkUy3gseoArdx0Vs77wDimvr
	BErNgMXY56sufdfV6VLruoLQtDxuhGWSCDQfFERPQlcgoMD1jpW1hTB7J35onkPQ
	Aruh/8GkDs08H+7k9yDukAWftJ6T2Px0KLz4X+kAt+k+1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h26bp0pey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:15:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so1501816585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790932501; x=1791537301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K/PRJxeffShrr/JXYd21vlmyYtuaDFVG3OVp3sghzLg=;
        b=YP/UAdXRAS6CFlZIQS0lTK2onqM8a/6yNI2GIPhKzCrut6/8/Iih00kgqx0qSad0vm
         L/B84sKfUCpEjQ8gQ0PbORyhysQls7shL93kuDa9irdeMu0Ri/SQxrseCbH5nw4ObSuX
         OkR4nIifxuD1F8ASyTxjcVZg8Ahd3j0yoXR/VKJGW9fZZXOjV+wq6tOa1rZuudH9IyKN
         HxPf98o3CQF/lOIdPiu7lgFxVgNa7T7FBHcTiU7m10IV+JJI6WNwRhLVlZBGmmSgs8iH
         TAQjHXFXY3u3U2oEJuwJPRviZwikDqac30qua3apUVTzA/mXPWPxs+0BHiKqzy9/zSSK
         zNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932501; x=1791537301;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/PRJxeffShrr/JXYd21vlmyYtuaDFVG3OVp3sghzLg=;
        b=Ok7xqGWOoUGxGNXK2oVCgNlxgm+o/SjDqyBerj4qJ5x1PrDXP5kk0DNo6grt8uhLWk
         PCWhsBREgNyj6yQI+oMB3igJ5w+hO4IfPYjfcjDPZcRpDx0pUcdUdLbU13s/4KL3xvIO
         trLE2ttAyrqM3YAYKWSxDYqUElSQKPcWLgt0xnErRbKNajoOikhFvKD4maR0kM+HJxW3
         EeYzu4YrOLXfhqSNn5stvhvP/dPNVq4Uy6RrsujV/G72dqbt8gn/im+btV2uNVibmCGg
         MT60LysYTPl/nykDNoq59yTde1e6pEs7RTdEpvdQBVlKvteg5XLVirlCTnSBr+Oj1+yC
         knOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLUoeiLtQC/Cuwjv2yyu93WFklSoWckEF4tmV0vGwtHhC97EEpQe3nh0CsZdwH21axZG2+8N2M3xLuzsA=@vger.kernel.org
X-Gm-Message-State: AFuF++lyyt4PLxeakLV8yH4BMy5kkN6B2nuwIhRDWkejOqC+ruAFWaij
	19pr/h188wjSrWfnu7nu0c1lD62GROiRhC1Y5tKm/m6itjqWHIqBCQglFPzw/3wQU9NB85ss+/Q
	gdBG1KH18uaN8+kqOy6vop8Bg/tvhOArFvH4s6+Vkf3dRy1fn98GBwY1ugntK1Qc9Hy8=
X-Gm-Gg: AYBFou1vd58UWZ3P2+cQeFOBUOnI4vQfgA2jf9r7oEdImeI5f5Ym/4xwXqWMIe0NHdg
	G26o1aKSeT3xW2aQAKrNzcouNmR5ZrkbarL0QWubXRTB76iVYrWoI+yR2fOWPks69a4a7SUfqzV
	BojEbgsZ/7FKUe5V/nv3K+QMaaOosRY8m2kbaVsXPE4m9aBVVANgiet2DXgWM5k9g/BO6I44WKH
	1fdBuCLpzN/jBTiP/AoqsIBlvtQ39F6xYYJ0XQWJ1FJGhP2aGwgoq1dfqebiqgHFTUehLw2UIyw
	rMfyWwxh9tFa/Ou1ZMKXznNWZ20eVF6wApLFvGJTuaplkaEdbvmOddZloRJyKrQpBmbeX/8Bw1T
	a1UyTcdb64KrK6HY=
X-Received: by 2002:a05:620a:630f:20b0:915:83f3:780d with SMTP id af79cd13be357-93cf16e840dmr235971185a.32.1790932500426;
        Fri, 02 Oct 2026 02:15:00 -0700 (PDT)
X-Received: by 2002:a05:620a:630f:20b0:915:83f3:780d with SMTP id af79cd13be357-93cf16e840dmr235969085a.32.1790932499863;
        Fri, 02 Oct 2026 02:14:59 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253e5bsm3726616f8f.1.2026.10.02.02.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:14:59 -0700 (PDT)
Date: Fri, 2 Oct 2026 12:14:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: shikra: Add Iris video codec
 node
Message-ID: <mu4zrndpmiov4ctre74rp5htbcmg34vcneruytx22nny7i73nl@h6u3jkevtdht>
References: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
 <20261001-shikra_vpu-v6-1-37143dc1bb9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-shikra_vpu-v6-1-37143dc1bb9d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OMqyTiaB c=1 sm=1 tr=0 ts=6abf7615 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HQjVKgPNjbXCzeIY3TQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: aZDmIcYSX6Iqe2NEv1NIRf6DZM79I0TF
X-Proofpoint-ORIG-GUID: aZDmIcYSX6Iqe2NEv1NIRf6DZM79I0TF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNiBTYWx0ZWRfX1LbmWYkZlKCE
 zi0Tyx69D7EWkeqqsV1keG5aMEeOR5zq3fh9znDxi+1S0Lk2CujSk9FdQcYxmY3DOiAf7iHs7D/
 kB9E3VzpFeG2FZHBJCdK/Qg/93ndhzY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNiBTYWx0ZWRfX7zFzQs//IRoX
 X57AJKk101SK1UrHdLLVgJnTJ0wkld9yz27N26hdnjK7cyYbj/KxjEu90YC/Owt4KRr/lF7H+dH
 +76XGhhI7ErCvz1W5ypE0Q7mzJeJwcKa0K/q+TYOjSiOMHIYiCZRBKPmR09kKyL3qlPQcXMyXb8
 bmoZojXQT0lWU8huNIZb3Ms1gsZJGL27pBnCxNSaldt/o94FpEeVrbWkA+lwyEwT3clKcCVeNyX
 QkZvEb4BuB+9c8o2nnegUUagMiU2xEMBPXiVDDn3tSRW6GZ+9xF0/KvhzikVMXEPjK01sr/ZObM
 2DWUdNpPLtpII0bHcTfXl+q6JkcKcTc80+f1q+FySH92cfjK87cc6nYa1y6DX/TL0mPXWqdRwCL
 7noVnpfy6g/ik0xKiee39c6RTsitJqAEm1HokC8z7vtqBLy8ZGjSdBWWkqswceZfGlavvwraF/p
 ZXKC94orKcJkPAoIB8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020036

On 26-10-01 19:11:56, Vikash Garodia wrote:
> Add the Iris video codec device tree node for the Shikra platform.
> 
> Shikra reuses the QCM2290-class video hardware and programming model.
> The video node is added to describe the Iris based video decoder
> encoder block, allowing the media driver to probe and initialize
> the hardware.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
