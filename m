Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010114;
	b=UXR4+G8KzVo+w3/xbcnl5GKTOTdSGNaJOmW6hypvX0RgJvEAsKJl/obIcDJtz0OqWcu+
	 U927euYpVuy7yM9r94H8AOG9Lp1ofDw8HHNNDJ8IwxkUapUn4KxQkyv+Wo0+pZlar5R/a
	 SKcrfpR/mPCbopU2OizSIjD+9NOLifOlxIOivVAJiwWqy5OryukTooPy8hflL1elTA+QF
	 ZPexEtQ107sUR3ioNDpecb1jiVIIn29FJq8dkm+ffA/0vwsVLOwE+F+deBwn66JJMk1A8
	 TvnpwK11TD7ooDGGdRC1oG1zSFnVQja7kETomyLyeHmh9aK4DZlvGTPYKdRyDHm2YIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010114;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZmGwnrdxNCjGaVUznght+WyNBs3X/bVAjcekB8cqWIc=;
	b=lXFnluo9zSDTwMz++0FUvJMJvjXZyN0jb/wFDEpDLtGGSPzK9VgTII0Y/6Yb0a8+GO2a
	 BbXdYsXpzxVQaZ9TGg7s1K2I09q4hfcUm2OVxsp/1JylPk8ezt7Ex/U8gHmzj2YKJs+I6
	 eG5rsxp+m+tWDENpPiAf0Deyo3Jwi7FwEPsYRi0UGcRhE2R5Ww6JGN7+Ci8ik9Yt6PvWM
	 /iBV88r3IiEH4XEoUmqiIhbfqjNg5vwm6XZzx2xm+oCDvfwgRRgONSA3J24J3RVRryNkU
	 WjyHkSlFOeFFBdNv8jfpR5DjY9gXbC1SxmmwPvCfOquoSnnUjg9vNVLSI0RxCtNGLfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BgsR7eXA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BEcnchRr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49301606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49301606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BgsR7eXA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BEcnchRr
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4arrG1181759
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZmGwnrdxNCjGaVUznght+WyNBs3X/bVAjcekB8cqWIc=; b=BgsR7eXAbqQXSPx/
	N6gDFRCOc379islQ+jlox+GxXIFV7+KYeU0dUMR1Fg+2vKAOscZDwx8fI5za6FVb
	tmOeyTwsF+nKgRKB+0wBhVJncGauRmdKXy8dRZ0w2svtnpoRDtthmsIAzeOMnnPX
	m4K+d934e4xoGzKEzTVU0xf4HMML8ip04I2vXaNqStC5J0cO1dEkCzcHW06j0tPP
	5QhTTUwEhr3i7nbSi2BFlYBKknLKTsL445cKA3IcygypPUxy9Mt3hNNeHn+w57Jl
	vfYE42hJpai+5RKzYyk3BZC5VHAXjTibxYzQUeDkVum2eFKdsIEQwh+AmlrxvhxE
	+grsow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27wwgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:21:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1e62510cso720979385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010112; x=1793614912; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZmGwnrdxNCjGaVUznght+WyNBs3X/bVAjcekB8cqWIc=;
        b=BEcnchRrdTw9rOa9jKwF/u9svRAUiw1Qj8JKqNidOn9oCrhKGd2wKpNJhbqBEIcuZO
         Nx4FRP06C8jna+fSdWjgDS0iPg+lRxyUAH5WDnZv3dU9DJlentsEyNBs03fGXVpXsvpv
         VY7qYgQ7CI/r6bIjLiybFmHNt14uzhradYtJ3s1rENSKGMGHdBQ7+YZ1ENRdqyMiUI1P
         ONGVAvGgqqsSc0bLIukhUj35lZW+ZQ+GVu/t7LceWdAe1sswqOruSX6o14vO86l8aQac
         06H/nhocX8HC+TbyXvr16ZX5mmfofyFszSG25jk6xSn3xxCZfh+BGEs/nVDBJW0bCxC+
         xs5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010112; x=1793614912;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZmGwnrdxNCjGaVUznght+WyNBs3X/bVAjcekB8cqWIc=;
        b=QH3uM9k8rwqrCwS3arU0AtmLkqp4K18xIIZXHNcmHMCX5QSE1yKme0uMd/kQcTottc
         wu1C4tb7yZLSzTRWI7zMJ6iTJQf5iBYZAKQHsfui+Qrhmw4f6maSSrIXihYCMOcJBB21
         kLHgOmY+bwoTDikHYApvg+1OEJD9KWiMRDQc1VEXGqK9xVa0n3NSeDtWTXvazYpQhnhB
         Yz4XhXnknytTfEI8qTV+YlkDfoX+JuXvDXQyy8sHseHnwUwuGJXPlnN8Dv8W011CMwYz
         86xejHPJBWYpqobFNdjD8WMz6tlaTRxeDai/Pm/Y6aZgSz5GciHUiH0MuxcKEfanrGoT
         4Tog==
X-Forwarded-Encrypted: i=1; AKwUvBzSz0CJm8Dz/tFSmO0OIbAYnfz9WRNXUSvzxARmjVZSr8jGGOHPpOVJFNGvgjfua0ZpNjoVcV7AizKih+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpnZoOG6y3aXJoZlLo8FOQi0wOZckAN2ES4Qok9yDZHH0gLyMs
	e3+G/pvrObYHCNXYdllUn28u6yVLgQRiBhj0M0dGnHC03JxNk8wntAMngJf1y4dDXB+Yfazwo/i
	DDOa37Rd/XfttzXYLU8ns/vm8OKwSrERnTyq3Flo4YyFm0SGXaBryJK7YWD1iX6PujR4=
X-Gm-Gg: AYBFou1QHTrqnJc/DWoyAg21hKDvLFMyPynBLC8y3AHPiS8mEY7K5FcJxDx9BKspw8N
	U/u8gTI8d3DgXYdGs0+g2CL1eXIQ1XVDddPjuGDINay1qqGTtPdg22FvoFf6t2TADbvRK6Y/YmM
	jI2KA70vmlZgOXTQLJtm9XDLKdSjQkdw8ZvhVK+4MA3nG25CiB8AT3x0eA/SISQfBdJvDU242MU
	5bXhWBZ7w0E4uXSzqbeoIIXh9Id7D6qPq2IYf/YC1SAsB/OzrMZj2NB7HV8d+ZEdCJ3ImCxezWt
	MKEsIyjzd2WAkhQiLw8wkuvZxSKib0XTPcIWTfRyCFlQbFuewfvcb3/cyHT5mv9D1RN4s2MIKBR
	KCpYHsRnT5g==
X-Received: by 2002:a05:620a:31a1:b0:937:6de8:b40 with SMTP id af79cd13be357-940ef913c90mr835633985a.15.1793010112274;
        Mon, 26 Oct 2026 03:21:52 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:937:6de8:b40 with SMTP id af79cd13be357-940ef913c90mr835628685a.15.1793010111647;
        Mon, 26 Oct 2026 03:21:51 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm196226895e9.15.2026.10.26.03.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:21:50 -0700 (PDT)
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: sm8550-hdk: Enable I2S for
 HDMI
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261026-topic-sm8x50-next-hdk-i2s-v6-2-0bd654b8388d@linaro.org>
References: <20261026-topic-sm8x50-next-hdk-i2s-v6-0-0bd654b8388d@linaro.org>
 <20261026-topic-sm8x50-next-hdk-i2s-v6-2-0bd654b8388d@linaro.org>
Date: Mon, 26 Oct 2026 12:21:31 +0200
Message-Id: <179301009154.3833661.9148622566622924374.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=297;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=JC2YD5MuIOA9sx0NpsUNWZGDDwPM/UnizCGrAm4vkVc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq3ym2Q2+qpQ4Qr5hCKm2L9s98yTk0C02co+ca/
 3PJgw19G1iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat8ptgAKCRAbX0TJAJUV
 VsqpEACS1GPIBiYVuahAsl+I795x3GE9AmTvLyACnXo23Zc0WrklpM04UH8049/N5jvw7lNI2/b
 GZ8XbTtmzIvrNdnle+YxircfycSNBx/dKGvw/q1SvYQI54pNWVDwqP11Tc8EKVrB2rW1zVnDZgE
 hjNZqjQ3DgKFmzxBooRpaZknRIgngGWhgo6ua8YppN2vY/wXwgv1snq3kEEC39fIbHVN2lF2urY
 S6+zEGHPvWzjyg4GdGuV/cdtBRhvMy2Tva8+N/usKy2itYcVULQ5J7nYS435BA9Lek1rIv01Xvc
 3f53DjMQHwupuxjQUBoImeSvgm/Gvj0xY+bW+o7/2ktWSeX4T9wFk/6WVs6C/bvRHMrou6iGMj8
 eohplPcGg55DfACV/rE0JUC5Eg4yVO8GiF0QtdjKCY6Ycx8L6j7ghwiy44S9CuNpyfOwTOzxlnp
 Pu+G+nPNiMgoWCzyU+P7K07sDl6Ulsk9WqprL5MsNzNz9gjv4HtCKD6I2vIsqzN8vK3PUPUOkHh
 YTbu5kS3iQ1zfI1p4FPVFvb1030y3rIDDMDd7epkAtJFlXcliL+oYtqNyxQTo4X2AHCCsnOwnB7
 Mvt8skrGjbjdYsrzSh9fqjeZf7JwgsnzJcFni9AO3HcwF0us9JKRafVeQZaxxEaWlvTdedYUEkt
 /nE5UmVLSOVXchA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf29c1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ji0esM3nnZrMOXJC16QA:9 a=QEXdDO2ut3YA:10
 a=3Q3lADbaBCgA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2phV6vX97TCEVH1OsbwqEQHPDDr--oVG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX2p+zoIKSxZer
 ntqgm7fERa/03SVXbQdAJjuG91dNdi+TQxzreb1u+D+hFS3SRXSBpBwBGVIg1/LMxPoHX8ikaFM
 NcuUrukYlJKG12X7G6NcSP18dc/NrC8=
X-Proofpoint-GUID: 2phV6vX97TCEVH1OsbwqEQHPDDr--oVG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX6S7FEwXwtQ39
 JmIcUOs39k8ZTStoJKr6563RjxYzACIiSy6CN8L5lZT9XDFW7zrkncb7xi4j4n6+s0cjRYPt+TQ
 0VaeL7kwWqcvBs7MamjD+vda5IsJR3EisP9LZHdtsbf4uRaZSt7sqQphhYF1C8MegRNrAyL0R2p
 ASQnGkOkkDGW5bulk6hNKM6jCD23xoOVYz/0QioWOEFKRfhA3XU+XQ/GxDAyxSmx4TmBbSA/ZAt
 XqS2R7PO9jnQJGWEyuMAHbqj+KbzxVRAj4W67NBHOnMgDxKtePtjVjjA6C4GLPyRwkKd1K2o7aO
 WubszA5Ff0OSvtY9w3Z2EADkViBvz+CpVMydubq3+55hRWAX2Eou21JTTWM55FLb05ZRPKT7thT
 Dp7sBLEAOC6eXtOvt4TVLD5qAfYnPi4K3DrfwTTf/n2wjEvpKnSJGk+HH6SGVAyilRmWnx8ii5N
 b7QlR8N/9zOfDNS0K2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260041

On Mon, 26 Oct 2026 10:50:37 +0100, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> Add the necessary nodes to configure the right I2S interface
> to output audio via the DSI HDMI bridge.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
