Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407406;
	b=D/dDGn6q+wXQe2pont8VIl0tnenvkzerDxGdIcagMH/KCNd0i+md3V8fhOreBwclV24k
	 ey94dUgXZB4LBfmQ6LPWEERdjcS+Z+F5bRoA7CF2l1pzHfTi9vBL2Vt4XYFVtuI++snHP
	 h9n6F9QzlhAY1+bhoFYIAG+6WgDcRKVIn9hRrChhVJL2emFsNpEN8YW3VZEB/NNV9mIPS
	 pQ5th0TPBfN4zo1WE/0iVS0vPZmp9Di58EyaiMVJjZrZHdcBY+yBrEcMyjftiiAx1j3TR
	 MNMt5ZeH6qVkAhpysoHUew/QYSEzIf9m4OSZ0UMm9FblZfWeXJ9UY7Yj6ajYPhK3Bbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407406;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vGEIt+0d09kkbPmVgRK9KARCj2NgxxPeIMDPZW+376o=;
	b=Tblix01bEYZwbSDE3Y9eR03CFwU7FZzaavW2GbiXPjNgLHUoGDdfW/4V+ofTw9FyrTr9
	 JORVQrn6JuYbxd4s2qCMBhkLdU1/sjb01ZtXQ/f3aYFtZkpy+znwfizCrLsLrHEGtENYQ
	 1co8PIN+TTdxdDHrUKZ+dGFUqfKsgU2JRgND3JKQ4/jnt0CXgxyRAfxzprNGmgPOgGyYe
	 5SkJGZhWjT1L0+jTQY9JUXSCDSsAzHURBDaxdhCMxbaO67ck63SpM4PWgoePD+d5o8Jw9
	 lzue+aZjmlBJcxlNh4H/x6U7y2tk4gwfL67GvYL8Z4eGQqkx2Ab7aO9ffJNBUg8St4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nxEl6DAq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X4AscMPx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DD3606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82DD3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nxEl6DAq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X4AscMPx
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEKh6X3511390
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vGEIt+0d09kkbPmVgRK9KARC
	j2NgxxPeIMDPZW+376o=; b=nxEl6DAqnVqU3uwhbW4/zp6ad3IRaesYmmV+nVZ1
	3ja+Jh5Nbo36D09D/fHZ2XN1w66Un7liWFyq95iL+h7LcoDsolwfjsvhgQ7D4cfS
	aK6VqcvLEk7jkHcxLCfmRhU8LTHnot3vg1uXgeL3zpc0NivLqrXI8f73QLWG2sw8
	xT6PGbCJ4x4CgEjO0ikVzhy3FohBc73bl0NogIQTgJrpNy7nfVB7QFpsXtXIv3ZV
	9L+cUvjSMRzvR1RbmDvF4sD09aduZClRpci/pE84CF0KLuYzYj8GD3qYSiXcjeLn
	ySPyLhX72ralf5SsOIjVNdgkkEVneHZMBYwNW76JJI1Qxw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1u81cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:30:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94607500fb0so534352185a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794407405; x=1795012205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vGEIt+0d09kkbPmVgRK9KARCj2NgxxPeIMDPZW+376o=;
        b=X4AscMPxrdED3fsmj1XunppdOq1XIsB9mno9fLW0GY5i+Dr5HYodA5su1Yq7ETub2e
         S7ASDcQD8hwhZX9GsSu2yNAlzBU05RC7wBELly5GZ/NoH5LcSqxxmSU8VwEZMnKv2UIZ
         ZpIGQD+h+iNMof+vhgWq7pgIvo3Kmay1kKi47zUzhe4LCrTxGEoh73VFfVz3uXU22hxj
         QmoGr57dR0FrfldhNrY7xcHVvfVGZvdWGwj6HGGUvtKb1vCZDItEdCpe6K7A7QQdmpQ2
         8yKLVu8LyEIt5HNCRIGSazPFXaIj60JBGyYdrePNQIzyCv3hls97dl+JHcWYUH/Qb8UW
         K7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407405; x=1795012205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGEIt+0d09kkbPmVgRK9KARCj2NgxxPeIMDPZW+376o=;
        b=rAX7zILjrEEFYPPMvQhJAX/bYeVgdZNGbZQdVtEb54PaVcxbABisViEWPeuCXANIO3
         6VXTrtXbBsN2YXXvoGIzNfLd4ft8gocU/4s5TI0Dpgdmh2d/DpTDm1ZTrVjxxVpTC9Pk
         NCEIDwW40qvX2jXzj/Z5v/fiQraGH+S83qciIg/LeojJAiPy+dYbiZkXfHYqE8TAqvpU
         /mAvp6Tok0ATenHW4esEeKbDv2ZGMdXUffjdD96Zc8IpKWCNDl1DlYpA5cInpRwagmIx
         xttiGPkbqjQLXlKZn1PhW2hlDi7auNyE8AhNpX0cEW0pZ9Ip/d3HPnNZSbb5e6RQ6x6M
         2ZVA==
X-Forwarded-Encrypted: i=1; AL+hErFssuyBhu2L5Nhbkzo7wdos9YpXY7/1ly4jfbpvG9pRCg1sAA5o3MayANO21cOwyzfn6Ift0lUs7DuZ3ao=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zgu2SJgWwCqLnX1ELQKDK6La4RRrHP5DDelxwAbHbvUe09lRC
	c4XY/lc12+eF+DaA1WzIk09h63j2dag5uyXVexQbCThH/YKx6Kv9vSDnScDgcv1UA0QpzgqxchK
	3XQ2UvuvWUzmBI4A1qfoMgSEQNBsqpQyOPJTWM8si6nEvYEhd/NFk98bYiSGAe+2sEjk=
X-Gm-Gg: AYBFou2BHnu85GrwcS570ixQPwOq0j1IkJDpUf4gwiTXovI+2RbA/SfHlSTeFCsoXqn
	kGghfavL9rxWnm+pgFBkkTy6+L/uyS/CmnpOtkBYkbU1bELXEtkZmipeTSHGLQylNmMg/ddv1wy
	Sibtnh6+uVX3Zxiomo420yru36Zj5Qh1kVzUK3R3OPaaYkgy7TAeNI9TiLppO50wUG/S8bs6TKg
	9v6wieBCfbF5fn9Hkgc2O33WF6qUgggWFlwPM7b9WJLBF0BzRtqCrlu8enHBcCBVClLCCbsdL4X
	8RdmaMQxIhqEAAfaXooXL+oMP4NxJCjGkI5V8C7My+xjL6wfpiBRKbMZIx0L79BwNHyO7wCrx1g
	V20clRsAECOCujE4ch0HxOxVPazrlPi36/ZxFk5HGHeOMiiBLuOIC4ezcefeT8Wcw
X-Received: by 2002:a05:620a:199b:b0:93f:1823:308f with SMTP id af79cd13be357-947b00cd286mr387696385a.81.1794407404569;
        Wed, 11 Nov 2026 06:30:04 -0800 (PST)
X-Received: by 2002:a05:620a:199b:b0:93f:1823:308f with SMTP id af79cd13be357-947b00cd286mr387688385a.81.1794407403677;
        Wed, 11 Nov 2026 06:30:03 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3fd2sm12095367f8f.52.2026.11.11.06.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:30:02 -0800 (PST)
Date: Wed, 11 Nov 2026 16:30:00 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com
Subject: Re: [PATCH v2 2/3] clk: qcom: Add NSS clock controller driver for
 IPQ5210 SoC
Message-ID: <zx5rw567pockk65r2joresyzjvytukupcrshtovnnyovmrmhba@tbrrnvlrebn3>
References: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
 <20261111-qcom_ipq5210_nsscc-v2-2-7e2c1dda3ed2@oss.qualcomm.com>
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
In-Reply-To: <20261111-qcom_ipq5210_nsscc-v2-2-7e2c1dda3ed2@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NyBTYWx0ZWRfX7xcfMYcM1AOH
 IyLlz2igJRWppSp3qgrDuBzPK62a4ztTUKUPleN+4fOtYoGMCGTUesqsGk3UfrdEzVj+jO8Qk6e
 SouIGKZMNB+voBp1t++yBmTCxQU1SLA=
X-Proofpoint-GUID: kWutG3ddxfaJxI6tZAxL7d-VOt5Ij5ts
X-Proofpoint-ORIG-GUID: kWutG3ddxfaJxI6tZAxL7d-VOt5Ij5ts
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NyBTYWx0ZWRfXzK4wdaAljNw8
 ZU3SRc8IpBJsBOseDLTdOhWNPEaoItJMSmT/HsdWkdUXIhAzTnercO4nK0679q87dkhs/Hv6blp
 XkWt0Oww6MMqGah3P+qPYA0pH/2fI3ct8FFdIfqmu1LalNwXZ5rpBSQTWGx8T9AaOzcHMbXf1vj
 BrRcFTlhNrT/PJe0pgylsh6devGauAZ9WLJH7jr7kVehQF0NE8CuhJ30sTrq/IT6apRhti1V/QR
 sZU2hPK7qKjYwihskAilH1SJtfjluGpliUScZLvmT3JzGR1dJ36RllA3DxyFjSTw390ZBvQq6y5
 ZZEHj7ztw+BzeHwEi8Pwj7PAuBy34PXbduKfHKNghvPDtkuiXavNauaVCt9gkt/QGsKtqIiTdku
 oC78fm01QgMqlrVgnFkkAn+oddN/jgDlAYEYE5ZTVYeR+l7CRH4JKuTiHfg4AgR/E2M8AcRXTce
 1TeoE1ia8yJGrF2eo0w==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af47bed cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XlM99vnl-FaGDs3XFu8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110057

On 26-11-11 02:00:56, Luo Jie wrote:
> The NSS (Network SubSystem) clock controller provides the clocks and resets
> to the networking blocks such as PPE (Packet Process Engine), UNIPHY (PCS)
> and the integrated Ethernet PHY on IPQ5210 devices.
> 
> The icc-clk framework is used to enable NoC related clocks to create paths
> so that the networking blocks such as PPE can connect to these NoCs.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
