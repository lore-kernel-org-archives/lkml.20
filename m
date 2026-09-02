Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F347469850
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346126; cv=none; b=WdqQLI3UR55QNR0O4zln1/sbWiCXjkdz9u9Nt/f7PDmRGbOr0/8ZznmXsaKTzqrcuKECyIcBsQLjR9wLxt7u8bB+0G3cCKgZR92xRb51hn/QFEGw3EqEjyej0z252PFRNP4YBEs/xFJm7uIz5Ay1WqeffMon6uyvWMWQqA9XDak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346126; c=relaxed/simple;
	bh=y0jCAG6BlkDtftWNp8Pykh0uKWwmdqdFoov+BYFffCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LmiOfiNCJVk6ijggZ97pBvTbRhhjNIUIvWHXopOUNu/hlUoXF7TE/ypap01IHTmISADknPApIzmG1nP/MkyEVR36+LZdH5NqlFJsUSnVgZI/Z356OVgxLG+yOS3KYbYxwpvfgkJ5BlfxUcYd/ziMVsgbZaLfvhsSxOQWRWHnrGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgIyHqRh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cxwclor5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgIyHqRh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cxwclor5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NPA21839253
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 10:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVZQyoqDvaTn7mOywuRGqmToqms6HdyP/g5jqzvv/sg=; b=mgIyHqRhNmaHhNaX
	vjjaTqhnEiFr9C9YUY2hiahD+hJlYNQ+eWcPifk53PL6eLFpPNzppGpIpV5phaeP
	hPaRX1D27TpzlhhkrsoeUTlmeS0trCuDazTYIWzjLlRGRmz/wCcravA3lOseLasP
	ejjhpRJVCCFLiPosUVr6Q5o/6mUK+6my9Nh5yf4zaStyZ3Lyrkretat51KYmqQVw
	N9epMWO6Ue6FzDecqLbSVz8rIpckWKn3A9AUQ9Smxqp+W26bBusMdg2UDy8Cmacp
	WmMLx8P5TMLbMiRKkIReL9uDPEiH7vSnMA7g30JP3j5vgPu85aZQIj5+BwBFYg89
	l6vQ/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gebsx1k40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:48:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93915f50a5cso451729685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788346119; x=1788950919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DVZQyoqDvaTn7mOywuRGqmToqms6HdyP/g5jqzvv/sg=;
        b=Cxwclor57ZXm0ppuHk9dyYGJmAKjVXgpBLp+t1P0pnvtr5Ogobx8r0gTybKWUSPhZS
         fQdVjy81arMagvTQJnWDkzggw3Kcw82P36ATSg9HEbtpd3h7w2O3JUXhILIvATqAjloA
         dcS7XKCUicCOEwyp6JjWbQd9OuVoJ934y0y6+9rkhyfWhIJ+n+F2DJt0coCg4Dx3IqmO
         BrVEIyI47Vg2+gQKfRaP4ii/TWi21eChtXqkhMIFJCr3gu2DiRIHrqtlKV9jKlyZ24aD
         dMgtEd37sLTCQ19L1XRXLNRSnBTi4kzpLdwCiO5/DT+ysR5xYgJTlW6rDMt1NNjkqQmr
         IjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346119; x=1788950919;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVZQyoqDvaTn7mOywuRGqmToqms6HdyP/g5jqzvv/sg=;
        b=Vb4pFrye6f1Ddgdstd+aduxiQDh1pnCfNt7Q221mjSHUv54TPXb8Fw7JpG343LaABS
         DiLFSMtpPsrrVZz5Lm/fDSOu/qk+CTO4d/WbqaHB2qg5wMhaBYWJ5+GeZmlgRXu0bnK6
         UL+OnhOpKRL8t2sWgtkK8y+j5iilr8IMUy134ILf7wyHIPy3zbTYU4vRPcTt5Yc3/PTT
         q4xury8UfiYHG4Bd7ahG3FyLFE03QpdzV0HEviDFmGWOm4s48fCTNK3deVClAN5MMJf9
         Eil0nRuF9fNqwhE65hxgDpaaRXA2+14ln0KB8Nj3eluvlpw/b53nYqGQDEcyxCxeGfxe
         172Q==
X-Forwarded-Encrypted: i=1; AHgh+RpRpyX432LssQijN/CPVRSQszIq5xc/X/Hzu2ig/ZIFzWwzCoacfzsG66ZB2ldCBEloic398HGlaveOHsI=@vger.kernel.org
X-Gm-Message-State: AFuF++nTwGxB8WLapLfS38CiLhQfuaArdl8bfR1DubL3aUbZ/oXZMReh
	dyaTH0y5uClRWA79mFxRrDhPln6/G6IlsS9AbvwdsTzCibhJImldvxp+RoZfe9f+atx/moYYx5W
	3cH7VXinFQlf5Qic/K/13hpNR0VgsttlgaHqNB6HLAK5D7GOKftoMcfpn5qnM5TNRh3s=
X-Gm-Gg: AR+sD10ERnrpERDjkHW3GwztcLQiPMAr+EK1d3CVOyK+DlV1QcRx/H0NddLPgCu8Tu0
	LgVCFsxS3/cmaL7HFcGtMoSxXXuSeIuxXrHq8RriAL6yFS6Fb/toNbiDmJV2XSunKv+SGqu/pks
	Blnsxyo0cv2xLMiPCCqXjuboMeN/PeLWEq421cGLIrIQK8dWfzB2p4GXFaLnf0f4OAd5ucbHk3D
	ajOGneohhsCPylArgX71NIu2zEy+wT1GR7GKYU1Ufo7gezrcQUU62DTdJ+y0wM19+/4omZygkEV
	d7RLJ6tWJrKPkKtqy7NLkWV0gzFpxMZNufPtkBHE11xBLHLLGiQMMG4M9BTz1R/17GHx9W3LdBG
	ALA24rT1xAWG6TK85Gk/cc7rDWQg=
X-Received: by 2002:a05:620a:6082:b0:934:a0b2:9bde with SMTP id af79cd13be357-93965cad113mr198113485a.23.1788346118767;
        Wed, 02 Sep 2026 03:48:38 -0700 (PDT)
X-Received: by 2002:a05:620a:6082:b0:934:a0b2:9bde with SMTP id af79cd13be357-93965cad113mr198105085a.23.1788346117728;
        Wed, 02 Sep 2026 03:48:37 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b759:bed7:f8b6:ccad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm56543255e9.12.2026.09.02.03.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:48:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>, Biju <biju.das.au@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: (subset) [PATCH v5 0/4] Add RZ/G3L PWRRDY power sequencing support
Date: Wed,  2 Sep 2026 12:48:34 +0200
Message-ID: <178834610100.25291.2104164353458457127.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
References: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NYfZvjdpXCh7091ZbjUNLAjlXkfUexl9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5NSBTYWx0ZWRfX4k9Ki7F4PdZm
 SNsKCt2uugOvE+/+1h/1RbisvPN71Y+il1qozNUcp0bg3RS1YSASpobIGzi1s0BACZxm4SRkVnQ
 bumrssbtQophOicXdNT9L7r9pk2NEpQhMnoZAKm84Pf8+isbhUh1OYsQ1WwEwlAVAZ6rFAJbev5
 9ywPCuA8IT8rB+mPuzI78WWN+nX6p56KfnCdud+PNygs3fG3h8MPoJjPiEeuWCXaTgbTSpWM0YX
 rRztwzaismdjiII9CRjXO0AQ7197Jw1hVXrf3GZdsWH1xVjY2jDwsvE6H9p35Ro0JrFNVWxtrpE
 wMYHdXJz6c4W9OtomVr/LpreGfS9TltZdQliLRFolvFhy771Ho6WO3mVwF8zAnJj9ZcfvXQ2qi/
 A0YpKrmfko5LUcMFB1EHmmjbcM+uyo5+gQLqpfuj73zeb6Pg3GfUJxPeM4c9RrDMSPuCL0K3GJC
 yK7wt7bDjzTGfdCh3LA==
X-Proofpoint-GUID: NYfZvjdpXCh7091ZbjUNLAjlXkfUexl9
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a97ff07 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2Ww_MoSDT8ibEw9cI9gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5NSBTYWx0ZWRfX9pYdmtKHOUpJ
 wbzxXDYv66v7+th7fJFSoE8p3lXZ9x6gG+yXUtyJKSfZyeXPLpuftIl1pk/z5lrGalD2t2rO0CR
 dOQwfK66JpHgPRepZZ4xFUEQI+GAoHU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020095


On Wed, 26 Aug 2026 13:27:22 +0100, Biju wrote:
> Some RZ SoCs (e.g. RZ/G3L) have a PWRRDY register that signals power
> readiness for various IPs (USB, DSI, CSI, etc.) to their respective
> controllers. This register is part of the SYSC IP. Add a dedicated
> power sequencing driver to handle these signals.
> 
> This series is based on proposal for power sequence driver [1]
> for USB PWRRDY signal and DSI PWRRDY signal[2].
> 
> [...]

Applied, thanks!

[3/4] power: sequencing: Add Renesas RZ/G3L Power Ready driver
      https://git.kernel.org/brgl/c/3b04e9b8056e868c3e9a04cc74168c7c9a18746a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
