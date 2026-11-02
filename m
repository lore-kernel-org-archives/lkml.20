Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612649;
	b=C70Ers/HOxDfEMC+jsUdcrvc0D58gbxJutpk3+ksakyxTth3wSMl008SmVtcouJbBzYL
	 1SI+2iSuJ51sshkwT5atooBBhg9kJk+azY9hTrEIk5i8plaY2GsdZ73PXOi92XS2IRX5/
	 OCTsPmb1eOXSs5N6QJKa8+82JLUA9XVsKvCDrXryoyO+E62QBOgiDRIXFhSadJ6p+cdzS
	 KGCL6tT9bpQDft4IsjVmoSqz9G30oYKTBDMGHGqcgxqSo4VJ57u1PfjMadZn93UfyBMkS
	 LEUX3skja98OOd8U9A7lhRA7g+CVR0sed7QlGmkN4wSNh3N/0S3mwZo+HGXVfGpy3Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bU/DWQjerLOuRj6MdmvOejgh96QzgiWPR0F31pcrakw=;
	b=EC0dtn3nFMmyb6pUbC+2pAsXun5foMPPw4r57kw+rJui8fCRR17IyMDZl0X+pJmNmrnN
	 OlfEUGlP4ZhiWpV272WUm6+mMqPIbyaZEcHfjOu6L+61axB9uWRVj5U4JZo6Ta43LKT+N
	 hhnd+XvtSjOnL7nAIWg4uORkNepiveHUyJkELE/cllSkyMwg1rQEuMX97vHvq7TYq0hxc
	 4fdvZKIZHnKTrBvjws+dcfaDxJetgFd41ngenEE2o04zrY+9VutcL0tLZzGi1vDJIgqIj
	 8adV1muWLkilwKCYly4AtBO7lwpHQbZOLJeVpdOkocYoTCvsDBfslcb7gkAJLv7z6lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GrixEPlB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MG03/ugG";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DBD606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2DBD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GrixEPlB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MG03/ugG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ADZM4039441
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bU/DWQjerLOuRj6MdmvOejgh96QzgiWPR0F31pcrakw=; b=GrixEPlBQm1t6GaK
	LXHj/Zc2LYgw0pXEoPcH5XNfwF5fmWGE2STpSiy/yyGB9VX+55ZeUocjBayZr8WV
	Yv04fQOzpZvd360fKsauPBiU40cg/Hssc55ksZH3lAIArdUWbab/YxLxiMZNvLKB
	pJp6OuoxnsJkvBPwsDG3YYs0GNCTIm5OHuOm6T5bGD7a1k7m9OKeuEPAxcizb2Ax
	YBur8THyfU0JIRxrJogbljhPeqI2swftDUpzURnmjeH9cVQ3BN9OBx5Gx0oFvGc1
	9FELICUqdrR8xD1Brr0dGD6m9yEcLIGRCXhXppa3VxKC+/+bhKajjtX7QECQ/74s
	+i3VGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18fw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:44:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3969a2a7so435202185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612647; x=1794217447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bU/DWQjerLOuRj6MdmvOejgh96QzgiWPR0F31pcrakw=;
        b=MG03/ugGhGkytqsi5TyyL0zbQ8uLVgJh9lOBWp6Q+nXsmUZ2y4UXNqAV3CHkTjEcA9
         1DGPM4FUGF8K9AQVUR+gyR77MtHjYiWu/WOcuAGXEJriZ5OlcrJYD+qMYGerZGLaMZ43
         HjJofSTKte0X7Vuu6DxP5z2UHRNysxJwggw2RaVk19E0KP8ZmqX/tR0f79QH0qus9W3y
         BII14JjasZRiaqcN0JFxblZgiR8bvMxxv1Xygobi7/1DklO+ywVyhcztzIMhvw0pBwrs
         o4m5dk/3SHEx6OlUDYhoP6znSN9w5iDHtJ0/vNMgD55J7zTBrWbSFcQKqXbagbGjlgb1
         IPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612647; x=1794217447;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bU/DWQjerLOuRj6MdmvOejgh96QzgiWPR0F31pcrakw=;
        b=KzuIu+MYDOQ0bSZ93u9vAcZdVcHvnX6FZ7XMqSTcTqvK884mYR0hIsoEWc+sOCTnt5
         asWoqh/ylUcqYiSrDR68luPqny2Ekv3dtIfhTuWsTayy0ZFYTlGBqcyNm5gWTvZepX+L
         Qgkdl/eg0wa0XurgHPIqhUPJIzRTf1Son3f4mCSCko56HhZEt9+AAXp5C/J2xtvZVSWI
         x8yz+05tXCY537l/SD4aLLIkWfb/BynfUb/8kyzlyMRF6zXCWhyrrT6HbpEB/CalrN13
         qQoSG2UbLsZat+9ttB1kh7FJ8bzruj/t0HbWjihaFEijZod8/gVG5PsjQ2Wdj+qiiM9n
         dLrw==
X-Forwarded-Encrypted: i=1; AKwUvBxS1pNjqq3sa3TlOTkp0uODzOLyObnj+VHJLE999fXDxYw0bcp3oWihQuDfSd7Uxz7rdxWbVwCAAIT7NRE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJq6Mu+7MXha4Um6R3Ea/drDj12SuvlkrpZZwggHLTS1mzm28QG
	V0okA5bBAjyQGuh43QKz4I7KMRkZxrmGYgFjimn4TAbZlWLzUW2wxErYFPA0srqMic3K1H6dA8D
	+/fEHMQFY+V71/4Ah8P4NS/JuIhbTN9d8EnW02USTFpwkrZZTgkZLh60PtF3eMJ77neQ=
X-Gm-Gg: AYBFou3NG5d5/bWYh4tjic1BXuLUVH9NNlPBgTc1CnvBLKNKWy2vxTYdALr15Awf0QJ
	Wv+C/EG3mNlaiP3GpMxJPGyB9WnVOY0MivtjqMAVkKQpfa2am0/IdJ5ez6q9F3t8+Veg+YTUm33
	Cy7BVMV4ZG5gfxp4QWmZ7KGqPZN7dK7vpZXx9CPlNZ6znQ9K4G4J5d13mLneCRrs7cpotLvJCAj
	gHzmQHNWbR6dnWCv8EnSjtndp0slFtFxk3UZfPUhBJUPnJDjrUnSUOVX+h6mhhFzF+2YkfYQ7Uy
	pjEYaLDMLNHJlywue2msD0xWzHW/LyA0VDNU12XELBrgwQ2Jw47srwPkPvifk/PD2V2wgF2AJLG
	p2HTCPTGSVa+uWSZsWy9ncebVQeiEG+KBS4cpRVSKRI4eh/jRPPsN2ANCKL47gpItgsS+gnRfBT
	5r
X-Received: by 2002:a05:620a:bd3:b0:93c:6ded:4665 with SMTP id af79cd13be357-944214cb617mr1433940785a.1.1793612647108;
        Mon, 02 Nov 2026 01:44:07 -0800 (PST)
X-Received: by 2002:a05:620a:bd3:b0:93c:6ded:4665 with SMTP id af79cd13be357-944214cb617mr1433937085a.1.1793612646497;
        Mon, 02 Nov 2026 01:44:06 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm334708655e9.4.2026.11.02.01.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:44:05 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: fairchild,74hc595: add support for nxp,74lv164
Date: Mon,  2 Nov 2026 10:44:03 +0100
Message-ID: <179361262502.50074.14545801533564831953.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023115652.700765-1-ansuelsmth@gmail.com>
References: <20261023115652.700765-1-ansuelsmth@gmail.com>
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
X-Proofpoint-GUID: cLe8x2-S4nDz_t-B9SQmWu0_TpP37ARo
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae85b67 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=cqVv7LrdKylAoqtr-78A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: cLe8x2-S4nDz_t-B9SQmWu0_TpP37ARo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX7F6bgy7/NCJm
 FPDub1e0p9RKmZ+ZJACz0SWPAo1N8t4UdPUjfmC06V/JO8tPzgTkqcj5a8Xhm1riFxLmatHCdyW
 COth0wVBUhXjKvuTiNiZ4XfDnmmM9y0fjDZ60SehppXAgyoeP+qQqtKWDrUey0bdWFLcQIbsDtV
 Yb7ncFofwpd4//7D/HKcCyByCRH8cpMHrL/UPBeQC4KmtV6729L5Zx4lY20lOz/jUKmnCFc2x8b
 hnJJfLxCgZ+sPfb/7mq5Nk8c9JQ3Pp8KjslZdWL0y4uGkmFJxWeU/oQzlrvwzA3guRnqy6tdHkc
 CidmNSBQyXAwI1Y6mR8px8EGDkaBd3baphQPPLPmMgKCY+/7nFXtbppa9+07m8mM3A404GQWnUR
 5wfgk/eBPUbLnPVy39DJJ3wvPzNGq6gkt7395G+egN0SHd0HSqvhR5hiL40jxE4nGwbXWJCcrNs
 BPqrQwhMfEKT4TGsDkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX4rML0wkL7FX9
 AIXqmKBkSGA3N5A2psU1/O/beAADnRSNFNQqDmWtNXNzgyZoyi+vov8VgONEuNo4lDKQ9qmzy3o
 NUZjIRtgrumOsNSE+CAty1Lot/4Oe3g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038


On Fri, 23 Oct 2026 13:56:48 +0200, Christian Marangi wrote:
> Document support for nxp,74lv164 as a variant of the currently supported
> 8-bit shift register with the only difference of not having an Output
> Enable pin and a simulated Chip Select pin.
> 
> These basic 8-bit shift register chips directly change the outputs as bits
> are shifted in. Particularly used to handle multiple LED for basic state
> feedback.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: fairchild,74hc595: add support for nxp,74lv164
      https://git.kernel.org/brgl/c/861f010bf9b9daad85536d838257cdb690d94a30
[2/2] gpio: 74x164: add support for 74lv164 shift register variant
      https://git.kernel.org/brgl/c/d66b6b86d5a6278ca930112c634d03725beb7d9a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
