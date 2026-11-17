Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903523;
	b=AeCYrLxk8/Kq8JF2EYyx6k/rDB5D+UGyCi7dGQ2t7S2lxsFdVMR8Bfinu8Hctfd6PzTA
	 lyusp5i8UU80+8csFQE1K6XihHNXw/jJuWm8+MPfA1W7flB5gBYBws0+Qzya9jW8/I7I8
	 E8F64LwaEzersU+HH2Wfboax9A7SY1GgVLqYWFvEyl4WtZ/+Gc9i6czgt3fT8MG6O3wZr
	 1AHQOvckxlmBElHS53UAK4jHtWIEb3rauPg6bqk66QUImG+N2Kf4b8CZnEvoiEaLdmisR
	 fasloutQGxrlUuBhvQ+DFhtdk+Ln+8ZQ7FSySS6kNyP5KyC57eSs8AJkq5jDuvcS9Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903523;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iqqBYT2o0voYJAEWiV2QpKz7FUCuNKLcKQcPAzyGKuU=;
	b=4+y7BggxJBTeAcb32Zh1w9bR8oqIuOrEAIXzy65bZAKbcIDxRcEEV/8M8VznEU5bUZeE
	 fyrbo3qD6k4vwJpTfoz6EYjeKfsI19p74iO2aAFBPK/1aGqvOYrOOL1e3NeYPVceWjblV
	 hecBAzKSymaLCduYwvOx6I6SOw2x7/gkdVeCRweSyL2A/MEeWBH2hBA733j43K7evJqev
	 QUcKelQCHSr4Ib1JOPlJ5UFT1Z2IJlczUm3gRXSWw9XhBP9fvLfiJrcSo6S94mZl49FBW
	 DeIVU9SpNRDMP8u15co8Jq8AS1Z7Kc5KPYhwfR3XOW7uolfjqAEXB1OGtpCzyDYzaaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UrZv0HG1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iKMz2X4V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FCE606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2FCE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UrZv0HG1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iKMz2X4V
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2akvr201038
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iqqBYT2o0voYJAEWiV2QpKz7FUCuNKLcKQcPAzyGKuU=; b=UrZv0HG1/5tiJl7o
	QYUgONRGH/Ftc1BNXgagMHZZt79S3RXOh1w/gGDO4dMcyhW3POOU9bxRm9FTkSCz
	lbYlivEUItvQuMtZs7XHpbeixpE7aT532Rp4FYiwT5kjhIr6vggPWTlJXZbYQQPn
	gvCSL6gzxWO8Zs1sLHVpoXnNxwvCKKF1CyU3pB/32JwhXY4df38PbDJYP8B4byNH
	LnudeoSo9oWspfsZzZJAke7rEzVeAPzr0qdnPncibo+aB/XSb6hhcomGLKAlADl5
	XoQbY6M7ejT619jnXoWfCwGPzeWEZ0f23WsHjEUYiKdXVVTUF3AlIpR9gFtdgOm9
	jrDWtA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038mbrjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:18:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so466651285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794903521; x=1795508321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iqqBYT2o0voYJAEWiV2QpKz7FUCuNKLcKQcPAzyGKuU=;
        b=iKMz2X4VFJRyYwloOVlwUiRSAG9le+Wu4h0v4sQSfW+YvZ3DcSWv3hg1rOYkV+OrbH
         WRfSdCeLDEgZgIkY+I8+roOW+5uzPbZkBnV+wDaL8gieCmh4bPgOvbaJS61ZqRdMTOvh
         EzLwpstrMGdrtF4Iyh8n56Sw44b8EHa4mYwW8erd0ohCeuP8xUg1sVCvaeSGKpm3VOsR
         F2Ik1dzdHeU/eHKtQobFgYQD3QU282SLVlgfEYMfzaP8OCFWCkl9sXx/1XzNt7Pt2/R+
         KWdyh0E1HRRJtS+FNhJgCwiWaLDxlCz98cJj3kgcznr9IAW3pdNfGljwrmR2JCJbTNze
         ltMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903521; x=1795508321;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqqBYT2o0voYJAEWiV2QpKz7FUCuNKLcKQcPAzyGKuU=;
        b=in2bmXNL7kXiFUVCd/rc7Wh8OFNC9irg6XC0yY++/2gUAJpP9YmndPtWvlaKN7kwat
         sWej+hIZQUF7tK7ESGtPEFOkdAb37A9+47nZe7hJC5mmZUOlfx9uY3IKx8AUu1xTUM9n
         TkVUiYvL7Buk2X/5mvY44xOWQ10L4p2pxUtzv7y+p5+O49du7a+snIXSfouW9Kn1I0oA
         NPX4br7TZvBowtdvQIXhV9g9DFvKkcTR6243qS5Yky1/qbG4EUAQkjP75Pm1+MIawXUg
         PMwSO8OdqqnYh9P2JIjCIvi6FSoOc+FkeA+rog/D8VEHut48eHP+59cVUXo0ecIVsr2n
         OeMw==
X-Forwarded-Encrypted: i=1; AL+hErEx+9AHVKYyzyPRhdpmBM7kK4qWt58sf4VcmVj/ypgEwtFOr569Bso+4k+zU6YbSvo8TKrlgNcGy4yZowU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DteCUcK4ul54/yy/SIftza/JBIw22Xan9tvWf1/w+uhZH1x65
	ucxEsfi4yHWf/fsPBg5AvELTQnY4l8HZatG6UUcdX0I6MzLJRTmStvcPtFCfqCgf0yi4lyxTZBh
	KNwlxvBVnM3YhsOlzIp23CHpRLuRPmJ7EgIDSfw5SgMDxUJuGlG1dtsmjj3gcC+WnoQA=
X-Gm-Gg: AYBFou1Gh8GFz6599sd52uLGJUUdbUg+U0TD4rW0Gj6UD3HdLSIjRcI9krlBufAogXp
	9OjPOXDguywBGgKKxXxdc2oWdZWC7Q5G+PBzwPVE1gvQSny9WYHY+AhylC88ZHaJyHn5Z65JtkS
	AjRG+IUAuuDBDj7uAHF8ko5zGe+PxJPFHqAnYeKvU44a28psdK8OVQkQ5d+dkWH4wbrDs/fMoti
	1WzeFn8RwOzMrVO4tj1bqhj9eg/1MkwkIxHhKuFVxqKH5XsgpAQABkc0vM+a4TKbmTZV0iGOXCy
	KXtCd0iLal7z+Xl9If/MV99Tkqa4zaXMoeLFPHJf6W917vEv9QIEbEnzKpznNNXvZg7FcqeyYMF
	e1DKApuHGDkJABu3/LHdFeLAHeZlKa3Vmoc+lNtnPZoeeDmrWjns7jYZfbExBYPgQPs+kao4wcZ
	M=
X-Received: by 2002:a05:620a:a212:b0:949:60f3:1cdc with SMTP id af79cd13be357-94960f31e90mr1296401585a.10.1794903521104;
        Tue, 17 Nov 2026 00:18:41 -0800 (PST)
X-Received: by 2002:a05:620a:a212:b0:949:60f3:1cdc with SMTP id af79cd13be357-94960f31e90mr1296399085a.10.1794903520642;
        Tue, 17 Nov 2026 00:18:40 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78344ddbsm54700015e9.0.2026.11.17.00.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:18:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        linux-gpio@vger.kernel.org,
        Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>, Bert Vermeulen <bert@biot.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpio: realtek-otto: Add RTL9311B support
Date: Tue, 17 Nov 2026 09:18:37 +0100
Message-ID: <179490351545.13804.18132721202337342128.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109052808.3035449-1-joshua.scott@alliedtelesis.co.nz>
References: <20261109052808.3035449-1-joshua.scott@alliedtelesis.co.nz>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfXzPZMaRk/8YGS
 A6Q78o0K0cy/HvfEX0STDwzt/73LgGKg8FDy6kj96lIn5/FxXbe4tyDeZhbL8Ifnl6UbMrntQhv
 4yzo2dm0OG2peVuNr9fk+bJ6YYRY1GQncPWiOiqiADnaKvTZA6izMvl9DXQfSFfh9wbAU3XZ3WR
 1xDqa+Q9edIc7SVWwpFItxuy3XBWPtLDRz/g5z+35+DPAMv2R4e5fpygBs4DMqaAECYjM2J78Hn
 7dMX8XF1HdE2TSuEGFWcn+CuwHl45GIsl1elyrfPLh4n7TJc+1KzI4sOljWadcdDVwOvCBGqMX2
 o5/cBeJEo/Ola5NmpN8FuA7JOQ2PNjBEWgjlPizQcH1BN8Z4K+aWSZofx/DZkP7p5+BeFtiMYDO
 ai50/fiShUMO0repL+o7vGuf40hzBFMbRfoN2Z7Wn8SR46PluMbOeLVUBEuvDlyj9ycBOsUcIU2
 60TmTIkkEM+hOSQl59A==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afc0de2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PLZoExqmlYKt_qTplwoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: bQgHFKKKojqle9zCNHMbZf5BN-GjiCzG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX3puLF3wbOUO3
 L2mvnZDRYoCUsCVL/lCCtNTGN6eonIzCbjZy+beaf49aJKXhdNV9NAvlzKb9M/VTM2W3scfrgFc
 r5dIv9c4UM7Q3LPGiVBrQoVaFdDFumI=
X-Proofpoint-GUID: bQgHFKKKojqle9zCNHMbZf5BN-GjiCzG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170032


On Mon, 09 Nov 2026 18:28:06 +1300, Joshua Scott wrote:
> The Realtek RTL9311B is a network switch with integrated ARMv8 CPU. Its
> GPIO controller is the same as the RTL9310's. This series adds a
> compatible for it, with the RTL9310 compatible as a fallback, and lets
> the driver be built for ARCH_REALTEK.
> 
> The RTL9311B node lists "realtek,rtl9311b-gpio", "realtek,rtl9310-gpio",
> "realtek,otto-gpio". The driver binds through "realtek,rtl9310-gpio",
> which keeps the interrupt controller; "realtek,otto-gpio" alone would
> bind with interrupts disabled.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: realtek-otto: Add RTL9311B
      https://git.kernel.org/brgl/c/13c7bc6932c08d6c170b4a8108d3faacf7cfff71
[2/2] gpio: realtek-otto: Allow building for the RTL9311B
      https://git.kernel.org/brgl/c/6884633429d1581ecdf1329ff11f8e34a83264ab

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
