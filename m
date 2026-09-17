Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0E7484894
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658210; cv=none; b=jyfvhfIIsVlkioPllL9bNuCXOq4lCiPeP+vYpJweFqn3uO6S+1JKkvV/2nlNKXDP5oqIakuXPD2uCTK0FO71LprMcXrgOxW5is71LnUM4MQ+QCN4lAQIFNl5D1rHs5+9pIfcUV7p+w2iyXOBsPVDn8DKNl4WrOqKXYKyO7jIgg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658210; c=relaxed/simple;
	bh=56YorWiGBs8GPX5AuG+hYmp5JOZCucSee0bUTwtH2PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DB92NM0FMe/vlUtUlGxBYAVFWi+9Hp9AfxcHeeAgY8Riqht8v71MkCoGMbMLqXbQkt6lLXGxTQyj320AlpNwbqlh31kt6QHAszUqYqvScd1nc1kO8LZdRhYCAJR5Cd4PCBMRfD9mOJjaVPnAA0GiSRMKNLsZiHGASvxZ2+g0f3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6XU9agP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQ1Wd9Ns; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6XU9agP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQ1Wd9Ns"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HECl6L2496784
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EpSsv4tYPQPGZFy7t09RaRSZ
	W3uOSO6CNjaFKE1zqtw=; b=b6XU9agPGsJ4Me0qBNKXe7OnPT/s2DVpNnvEA5Vs
	0zHKr4EwzPryH8vOvaM3V5/PQxggTJZUh6n6vYIOAndSJsq/Bytw6V+ka/Dd8QMW
	173oP0kBhUob2H+H77Gibc5Wqw1PtmEiAe66K0vWlSDZSIPgwPWMVBkIdilXTfGX
	C8HthhHkk1bYFBW5KxE6CVuFt58tIdNtUwHaamioQDgE4dYJ43eGNvSDRTCJt4JS
	uZISYkyS0WVGSRd55+lAdIlHU6G0jH9c6iiKr4t/zlJXwML0i+7gEex9uH0qxre0
	x4VQMfHFyycuUZbyjLvLxbXGNJEDOjJIjbg0x49No2z64A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grhs6gaae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:16:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0050a554so236216185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658190; x=1790262990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EpSsv4tYPQPGZFy7t09RaRSZW3uOSO6CNjaFKE1zqtw=;
        b=GQ1Wd9NsmLQca5L0f+csS8WERHTkpgSFIdsf7WUsTROzRsMEgqagh3KxMeZsIewRCq
         FFupFJnKCgi+ZI+gAuziRwMFhXvpxsJn/XBGSMiEoemTMhttKybmsV+//q2KELowV/85
         jSRqsK6VfMDATY4trxud6ZEtCLTkfISoAR0mTYauLSMgpqcjH1wpujFaQYjM2NBF9ZdR
         +15Bz3UxwaTJi6SAAlnV1FP6ja9mVXbZz4sJR4Q6j0Pk9cN5BL0Nn05EVFT5dZf5JbVA
         0QuKqZjQhk6JILFukwqcFC5+OavPA2n3p07LZkdqpgcm9ZRCBwoByoxLE6WyoJHvOF1T
         0rrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658190; x=1790262990;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EpSsv4tYPQPGZFy7t09RaRSZW3uOSO6CNjaFKE1zqtw=;
        b=bezDcjQzbsg+chmZn9lcjHCpkr37eB2lC/FkEsYz/HPhMwbMQXKnEsjVqxKLfgwuuE
         PA5tyaydRiQiWTvApsFJJJhqUjIoLG/8F+BGQoURNYehZxbX7iQFemB06zjqheHRl34t
         nnlsUooGDyu1pYHhJCKCtRupOvxqeNhi6H8IIex1oB2R3ZsghhKfHq0zSosmwxlPaNd+
         aZzj+f0CCbIob4xfMZ7X66BbhpP1JwsoXmDyPNYDXfousnVyDrtiEqTmJ0h0D4Um4jk/
         kWC4csWZYSfZFDIY3F1emvdG1rBhPJxvmDhsBmrmkpy/YBiOuM+mU8nBxmFjtM3jEjDD
         Qt2A==
X-Forwarded-Encrypted: i=1; AKwUvByi0BACP0LjZirVbO8B0tBfCnJoIprwRrF/yYCzReiYoszGljELYYAe1fAeFnBS3bPLfnzvlaWVMsg8ev0=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ5D4csRsCAPUEVw24rnUXaduhr6i/ID5b/Tf7kwYNIQO3VcdN
	5vLOaoJ8sp5oYHSxNxY6uYwuxvVxba86Yb4HofoBAqPrknqADyHk2vLFAljPjRDyN0sVWKuNH6I
	L1CmfjRjld/eNR94YW326uSAWso0WqhEIVIDHlAwurFiNXfPjRUqSOgPEgIRXzifcE2E=
X-Gm-Gg: AYBFou15RpADg84FAC30ZLicv5krP/qa5coGmuZoPyBxuGqzyCtTYTsZVv1BifkWuhc
	Seyh6riqIlm4vf9d2eXL3lz+uW+j650P/d5DmqRs/YE1lqpjkOu8B5l+fvXK8yeUqsyDWXBXHLE
	ZUlVbzNR1jvZInH2R4vPs7RlhrZeStsd/9dQtP31hHZsM/QaGCG8rVX01xvA+MZlBw1dUJn1/YH
	qheHIBYxKeMZYQk0JGosQi4v0UEMTGDGmDw+JHYj7syVXDKSinZFE2JTw2G2mMZd7clemkTSMV2
	2/8PDZGCJvo82n7haVMtqH1Rca9ljzNEowXoKOFUfd4LXpid+xtx88pqN9aRgMJS7BDI5Zxf++1
	CIv3jZvLFLp4HoQ==
X-Received: by 2002:a05:620a:17a3:b0:939:8905:ce9b with SMTP id af79cd13be357-93bb77461a9mr1193812785a.17.1789658189855;
        Thu, 17 Sep 2026 08:16:29 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:939:8905:ce9b with SMTP id af79cd13be357-93bb77461a9mr1193753785a.17.1789658184518;
        Thu, 17 Sep 2026 08:16:24 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd776e1dsm43210625e9.1.2026.09.17.08.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:16:23 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:16:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 15/15] arm64: dts: qcom: sm8550: Move PCIe phy and
 GPIOs to root port node
Message-ID: <2gxtil7qz2f7jcshm5qfznv5tb6fvguafumgsiua3k7lyrt4dl@qp24s745okz4>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-15-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-15-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfXzDsjhWsZ2VOx
 POXTC6VUMc5LMISLZhPH0m0kFM+hhxlkOky9pWIPMxHT7CvGwz4ExhTD1NjohAibs63fqpF4vXO
 NPo1ENtcu7n53wsYKM7G9YA0p0V25BvH1WAJ/IMxeIuDSr5cV5xhRW0exKadtUS4lynUcswnp6p
 MRCi+N3vNcNvbysUkvYJm4keTZQgvQ0gbxvFVdZM9IRftdzpquSHgqmB6QHMzzcxm8dTXw1Ct8M
 1Cjls2rqHi+sr/bmAFlyOsT1W32g999AXxPx8SaFZXWXOD5sH7GUhjkHjerEEDZ0ks8erUzdoEF
 B3VoBfYMUu0D7Yck36DtEg9N/58RwDBdsacfxKTSCM6EjHy7CvZJudmClJugCSx9qfPxm1ehd7+
 2G2tiNB/VQQeEYX4R8LtuO51Z+YWpSFE9ysRM7uK37oXj88KdDXDunia0GmeH0gxqWeJ/DwvI8h
 MSeaeHpFLxEM4zODGbQ==
X-Proofpoint-GUID: DRTA_NvICCJkcr8gXkREhLndvDmBg2Zg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX1eQ4FWrtYt/E
 lXEW9NWMKK7tKkmueeNM3WxZ79EWmLp1z1ZPXIlq8V/GHRx5/vPW6AMvNnPb4s98vd55eWCpnL8
 LaHdGhDOysUaS+CJaQtRPswi+dcOZNk=
X-Proofpoint-ORIG-GUID: DRTA_NvICCJkcr8gXkREhLndvDmBg2Zg
X-Authority-Analysis: v=2.4 cv=cvwOAF4i c=1 sm=1 tr=0 ts=6aac044e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170216

On 26-09-17 17:55:29, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and newly labeled pcie1_port0, allowing
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board files,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
