Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C4035AC34
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350025; cv=none; b=ur4qIv+9w+UnWQanXssEw413DpzPyLCfFOwI4eBTS3NCG4uFZ0z/vnEIAwxqKg23NJGANVSNpQT35/qc1q3xodd9uxomN6MnGiP+evnksc8gOIXRlztV4jAI+PMjx8De81ydoqPwzNIFiYd83+JY5p5Qhd4sm3H42AZfCGVlVWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350025; c=relaxed/simple;
	bh=sy5W72lZeugxwFKME0XATWnLJL/K4J9HaXD84Xrx0jo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AQvBnGQ9Gjewcc5Jq2iLI4kyF2XjMZ8sVRf09DCThRWYBQ+H42ylFjZkURbSh2g/SE7pmExU98zX0zN6U23ZiqXE5LCSC1JhoBdLnwSKHHH3BBYAi4eoITK0MiAS47KA8i8gDDROnX2LEjwSBrS7YxdnZB31cId1pKZknUvowxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kH4u9bZY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dc57tIMh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kH4u9bZY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dc57tIMh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA4JH8609258
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ckoYhtpH2OqcDnSbmqcysMB3cQQAPrIhEI+eCtKkiZc=; b=kH4u9bZYdwxLpfZj
	QiaChiBaM8GhMYpYgLeZ9M/J0R+Naqwh3sCeEqBW4n+DsTEnboRWpdEL4Z6MbrF0
	hyDArFR6mgg6dbJ8N6toZvvWfcdfiTjm083PRdI5gumqBc86PLJ6j3MSS79T4BKx
	/T+UZSJSsNM6+G7poW6+9ncu1esUVlwaxl2+edB/uhyFzeTgkjTy3HzTN4C4ts1u
	5QdJtfuvCmro1M8grIAp8CG0O91Qky73mSdjuyKiUdLISO2Oe81xRzNeIu8OYZuW
	MhzQ/2LWhP1lYX2f3PiQvmBEhEzwrbnOxuQTKxdKKzf/dgTiZLZqE5ihPF9OsiBi
	KpqkLQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvns2ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:27:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so2083471a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790350021; x=1790954821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckoYhtpH2OqcDnSbmqcysMB3cQQAPrIhEI+eCtKkiZc=;
        b=dc57tIMhqTYDUUZhxs4gDzghDItT8nemQatL7eOyyALEHHS6lwjuMXPnUpoZG1CJks
         HJDhbARBZDmVpx2XkWM8mgPfkHvERBudElOtRmLm7JlE7bnmsDAOkFzAcJgMJ1yfJPAQ
         hHblkE3XNDp5x6j3ukBfx5eF78BTQGxirBbDStokHBbv724OXXAeOqLD6yWjaHxE1CPn
         35x2dtgxWpbV4x0YI4TWN3tB+CYEPwn4WXJJScdEeMViL/T5EljwjnWFLCQK12OA5XjF
         AQd2roXOpOzjTWqhZLGJxC4x7XlsPn8nak1yvTOlgvOJrElC5oUF8EKQ0RcuTsLRm7yf
         ELpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350021; x=1790954821;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckoYhtpH2OqcDnSbmqcysMB3cQQAPrIhEI+eCtKkiZc=;
        b=BSDiwMg5Ypz5sHF+ecFFqRjvKfaym8liiUF2NFli15nptnwy5Glm34HV4n9M/jm0yV
         St68sDmsiN9p+c9PnnahxKyuibuNPeaExCeCTMUf/+x2nnMV2phgvvxaZgKtxN1+1emn
         9AeVh5nsjJWj4FeuvArD66aJQJnblDV9q/a16BvBizxI248TeGSNJhYM+kfVZ1ZCUtuI
         TpLOjKFdaiSzlQWKhQiElHMLBPebVlTQqT23Y+iO2zS5QqoGYqdoifof1Y8WN1MvMGoo
         w3GaUkI0ABZf8XDJD9xiFx6Q9bL+QLIA0vEsCZmP8leTavpBpInmPCiu+FBaLdEYQ3b3
         vlVA==
X-Forwarded-Encrypted: i=1; AKwUvByFx4lES0r8FEay85nSAL52uSLW3v/4bj91MuWwsKVD8Z1w3vDh0kr1nOH5FTfxpFc+1MEg+7PhX0GEo1o=@vger.kernel.org
X-Gm-Message-State: AFuF++ntXSFkbi9qAhlNiQFt21Y8mZIiMcY7nSKDGIJohZ45vURb/JAj
	1HE/GQ5vuwtn+H4bRmNDqUvdQXa0Z3JELagUwRyGo0Fj/s5KUzwWN7SZeTUi/ypD8aJuBP3PxwY
	Egh1Kupjl7uDz3boBM5KYYiajG3budvo8pctgGbJCXIjiV22Z9I4tImJaaPNVqF1FkFc=
X-Gm-Gg: AYBFou03y0iwvY5krpUs12OVy2yopqRWce1Cu1d2agN/Q0K37OinAUp/nPQd42/mKoT
	SGS4198Z+vvsVwiXiwtxT3mu5qFgS6FrVa3APQmZQxG7Rtl9yP6mTuhdb15gjPi/04zQuBXcpgU
	z29XfLnDIiCM4+9x2G3Bt0+jjYA1/JHzJGj9Fpo7ID1qZBbUe3UmFrKfeYGcZdFV0sktMpRK6cx
	Q8qBohcwSjznla03+hfAAyty1ONSUGHyIIGUJ94Azv2Gb1veRzKq9TsCpw7pNoCsM7KviOLVy1k
	gQgLdrlcqJPIcyQgtM1sZT5zSPIe2cQpZ6Yc4mlevJSEeh21mx2UYPKlu9jvRADec1pgZ95JWU1
	NVUZmoCILuRaEiFkrPJ6o7byc5fQbbGHE6i1cksB9A7vzpVwE5RpXn7I=
X-Received: by 2002:a17:90a:d40b:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-3a0bb573f4amr2263716a91.15.1790350019300;
        Fri, 25 Sep 2026 08:26:59 -0700 (PDT)
X-Received: by 2002:a17:90a:d40b:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-3a0bb573f4amr2263703a91.15.1790350018748;
        Fri, 25 Sep 2026 08:26:58 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b898cabesm5320405a91.0.2026.09.25.08.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:26:57 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260803010532.302038-1-miaoqing.pan@oss.qualcomm.com>
References: <20260803010532.302038-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: remove unused
 ath12k_dp_rx_h_find_link_peer()
Message-Id: <179035001747.3875741.12204021916380057963.b4-ty@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 08:26:57 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: gqvdzCCOl6f311SUGK24NSXANnAMq80g
X-Proofpoint-GUID: gqvdzCCOl6f311SUGK24NSXANnAMq80g
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfX0PmFDLOG1CbA
 3WnruJte1bhTjU7L7ff1qpj3XOkMfmse5renDrKD+1UkLydyj64pCys3tnhzpbPpRBdZNItDe6p
 7e6ibEbF6wK3GE63ZMvTt5Kkc6yJ/xs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfX4zW/1ziAU6sT
 NmO0q57+v26mAd/1BeisWbSw0qVWty80yvxN9qbN15R9KiEbsTwMr6O+HEqEuOLeCLaewnIt1zN
 I1pHDEZq3Dwh/RLKIuYl/jlH02u/4Q0GzyEW8hfOF9avG/NLQGYv09HOFBphXTWhQRIcoQj+3mh
 +Q6MKWHC+vwHS6/82ZxA+rP2jXQxnUDJ/WPlpynaK9efm9MYIy2tXJEY+UKJAKbWAkHAxduXLNr
 IQYohuc50ocrcvXZryfEFPZlrhVC/tDGcTC+EN+iQ/bl5BS3/7kzpbV7OQvu9+aoz3FPL1vOi2r
 4hNQZm520uHn/O6f6m97Dir6W435AudOeNFA/zT9WcoBhWlYTS/cxOjnyt59zq1G0fRAZ7ZRnus
 4F5f4C+efd0YuIMIPJyoLhizv2Yg0nykQ22IKPQkZufJdgdwx58YJhGfpI2NWVntlr4/iQ6gosQ
 Ntf6L5U0LN6stsRI6aA==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab692c5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=luzD6lnB6LjBjRZFz1sA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250061


On Mon, 03 Aug 2026 09:05:32 +0800, Miaoqing Pan wrote:
> ath12k_dp_rx_h_find_link_peer() is no longer referenced anywhere,
> remove the unused helper and its declaration to avoid dead code.
> 
> Tested-on: QCC2072 hw1.0 PCI CI_WLAN.COL.1.0.c2-00229.1-QCACOLSWPL_V1_TO_SILICON-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: remove unused ath12k_dp_rx_h_find_link_peer()
      commit: e1ef274a49873a9545b51e36f1f1d25707372872

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

