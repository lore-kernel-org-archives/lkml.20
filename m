Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501704;
	b=Sy7xdS8iBr7wqQ/ZDLOH9hf6Bvp3gFug0/hdsQ2Lld1dim9kjQBN519bGwXR2SCwRi+r
	 vZBEf4NAwr8cyDlPFoUcc/GKY4+4k9yBsJKfhfZSQ1QarvRvFlyTlKLl2Nv2/q8XIIYD1
	 mr1fZMyjLkJNjzYFqBu3/I3W19CRQnSMc9IjQvyFie+telCgU6a5X2iMrOhNHhWVcWoPu
	 bJLA8bw346BXQDYlox+jDpDlCdEutHzZQ6SZhlC8imd3PPzt7ogUIzCUjnAwMa/ytRr58
	 SIoZFK5lfijenZLXd6WV5F7Ecp0E5ynQLCP5fjMu74qP1lrWiexR+s/Qz8/tF/uiCHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501704;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2EqJhnJ/Jsj/AwDrzxspTil346yYpeNL4pTvcJZq0tc=;
	b=zTW7mIo9hUgBaxSD/IhL1suCOhUZJsu6hjVEpPb9Qzx4A20lkzP8ilECVVvpHAfyGIlJ
	 F+UKMjFGMSK2eA8xHrMlh0wDZmpG/xb7tp4jtgPDJGIMFWF52XYHUl65mp/g1Gp6XyWts
	 b+Zdfu+9wX+mu/eSy9mMCSlHv4gsTquQOjcKe0wf6WG6qemiYeu23d0tvc6B3s6Texgcz
	 HikhK6JliUMtrJtYZpy/8zKLki3guV+tz0k1bCJzTf8v1Cq+UaHtbpKr4esSQ3KIzfEng
	 Z35py0HDIzqKgWlyN9XoRCuuYmb4DJn7kAnFeAuc+tUldj9R2Ey/IfOkJk5uvF4jetQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b1qd9rTv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Np5DYapP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F834606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F834606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b1qd9rTv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Np5DYapP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx3tP2562780
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2EqJhnJ/Jsj/AwDrzxspTil3
	46yYpeNL4pTvcJZq0tc=; b=b1qd9rTv7O/QfbRQuei/An0s4vhxKdwNBYPzRsD+
	PiI+j8KxVbW4rKO5fUxg/Mi6XIlSAzNCNERGqBiBpYFAo0RaVvKSQ10nca6JcEup
	9aBEVfMPGc0oTssp34qxoSC4UuY3fsAJjlvoQuPi1+/1PqyKtP6Ka11EEnOYGT/m
	OQzTpd8vumH+ckh1DqHnE0wkICetIcjyVjR9OdmpylTCqlROZTfVgv2gcOdM2Mov
	nhzK5J6CuHhmqFzt6Z3u61WDeEW/MkVY+6WFqmHZev69uzsPM7mH3bC3fwEcUWiA
	htJpv8WYm3HJS5ceMp2rcFHi6xzru2jH4GmpdbuwoUsDZg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5naj8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:08:23 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc0418036bso351481137.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501703; x=1793106503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2EqJhnJ/Jsj/AwDrzxspTil346yYpeNL4pTvcJZq0tc=;
        b=Np5DYapPqjfChlCB24jW6iR6tUrw7Y6GVI5CiLDc1bk7ed9kOZ91M3ODLLX4iz1Ib/
         EYnhRSIubkMxOZsvOhxyllCd8rYWqhzjaa+++Ibl/0WPgufrPwiBdMXbJH0zcjdQKDWv
         gAkF1npylZNYs6OD9RLYSB0GX3WsBC+ecWwjIaro7mRU7Lnc9Hg1ijDsx3gmd0+eahSq
         ck2bfUegVUEgjQShgXvr6Q2pQ82r7QPRl4TaRONO5izt5/avsYhEHIszIJ2R5oo/20RS
         jpHAfDM/pUsqmM8X+EqKgye1wGLHRtVxlkkR01khrAiIv7n349YcIYykgZ6lV1ZgmMhG
         gfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501703; x=1793106503;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EqJhnJ/Jsj/AwDrzxspTil346yYpeNL4pTvcJZq0tc=;
        b=NEsRyfifiEP02dc4A8Urg/OtvheLot7YNXae58F/5z0l95ADPLTzE1HbVjO8pWHqCC
         AvOM3AQ6Jf9qfGsR+qnNfest1GpaTe5MG7mjaBYRC4HO9AYSBlUuTVuxcefZY8jc/SKZ
         jn5jjMBu0V6x8+k8P1QrDfhwEXQk3xPzO7fmVVlboccna+3WANLP8FDYUISfGynjswIm
         4CMblWuPMqXjyMCLiQOYErzvx1ftOcWSgzWTUbr7zVaaqHjAVrMKNlRJoeVh39mV7gqR
         481W81QEnMGe4Z+aeZ3awBaZQ98uO/5bWD0mgJhMiIRoZFurDfB1/80XyXJCvjqtdXfJ
         XbNw==
X-Forwarded-Encrypted: i=1; AKwUvBynXYzEfh2zHxEcxFF7zg5CtgZnjY0qSsJ1e45mgTp6BqfnavQwgw8TRrBGIzQRYUDYRCNnRuydz50T85k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKa9rN6A56ls04L2JoihyYyArWfg1DfpBuf4IyGaP8caREoa0b
	+jeouue8XBfFEIwgHDBL/CEfsmAGLVw74NqfBSFF39fyoYmKlf/UsWmqWuce0wQ3OTwRrS4MzJ1
	B2/qCYwnd/EVKwBa669CpyYwUypGi4UP0IhgfuvLamYgv3SAHWnSJnRETkbhD1gUDI6/Uxgnewf
	4=
X-Gm-Gg: AYBFou21Y/5a1joc8GQtMc6BrJH+0LwFg7GgploJ/qYLfkNyUr2BLfjyK+30wNwodAI
	pJXkWTulfs6bExS/XG5IGyNZdhPVZ6MTheZWMjuLks4AezHvxq6N+wxrVuGCOqHuYAzxrRM9tgL
	ZbxbmZw3Cnfumccyhp33oSiV+pMbCgLBs1Z/XXiC45dBBj7fUW2Y5WJjj0lnPFSkoyX1nHBEh64
	tFTwF3Pg2CDLtD5fJaiikx8c60NldZn1mX5HalSU36B1Zu9icGAoI8trGLX2rEOnEMal4hpzOzT
	8ai18CAte4Uu86r227qjdL7/73jI0+5+CKEvui5xBuKYCfocls90HqAcxPBmYAPRYKZKQmgg1V3
	/U5viBhincTdAGehm
X-Received: by 2002:a05:6102:5488:b0:7cc:2086:34cc with SMTP id ada2fe7eead31-7cc369c0cd8mr2444380137.16.1792501702670;
        Tue, 20 Oct 2026 06:08:22 -0700 (PDT)
X-Received: by 2002:a05:6102:5488:b0:7cc:2086:34cc with SMTP id ada2fe7eead31-7cc369c0cd8mr2444369137.16.1792501701989;
        Tue, 20 Oct 2026 06:08:21 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6db78csm6193709f8f.2.2026.10.20.06.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:08:21 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:08:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8250: Set active-only tags for
 CPU interconnects
Message-ID: <gmiurdyvbr2zbkbzy2bi2telpxab6irchpfnzsv6gy2gxpb4gr@m4424rx2pbej>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-7-cae8d22649ac@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-topic-icc_defines_ao-v1-7-cae8d22649ac@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ti3h52J1mghI2_pRJkRBkG8vhMQHTlqT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfXyzsHHATZX0pO
 /3j7w/Wh3JnUIhDvATdXjx8gqKdhhaTMFA+8WDlE3IrzxyYko3GwGzRmoSv9hgs6Mwx5gjwQ809
 uaIDxvXFCZk9sBQczj6PBkJscX/E/3lwkMdeLSeaZtKo3140Wm3QLcv5XeYDl4iwhwqsq5LWp0v
 zMM3VHS1je/5BROn5JF0WhaW38ODrqr3y+y+iR5F/LAJx52u6TF1rBEawZA0cIAC2/+RsYkO1pk
 M+zzkmk5MTWErXvlZdGrXEr6S/IS+eJPqYe+/dPPYN1q1Z+ptLZdPX76R7Q/Vh/rCgvH70yY0Q6
 DvEaZ7zfbTuZWBw8fcTTG1N3D8SaACcXnxoBXh6vClOfMRKvGi8Lta48AWY3zyauezNpJ88Yank
 9CX8kLwsywtOHxIohoEhr5yZkkfIgivkOO19zMAdnE4i9hDKJmTg/XisAxrspBQwQLuzzLp9new
 NnG3l+z0LG57BQxuj1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX528e8fG5efUM
 i1wSoV63/56zSkLTS/xokF7+YgdqySw4JaPatmsnD9KbBLSj7Soj5xK+6h0PDQq2ZnM05WSxLCg
 mjySmZtPGZ8jPM2i/XUWwE8/pHeHFQ8=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad767c7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PhDoQi8S-v1mXI6LFy8A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: ti3h52J1mghI2_pRJkRBkG8vhMQHTlqT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-20 14:42:11, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> RPMH lets some votes only stay active so long as the CPU subsystem is.
> Take advantage of that and make the CPU frequency-bound votes behave as
> such.
> 
> Fixes: 8e0e8016cb79 ("arm64: dts: qcom: sm8250: Add CPU opp tables")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
