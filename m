Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602491;
	b=HNzQcq+sP0aVX3ZNlKbGT1FPGxMZNN+fss3bEH57xzFUyAE0pCncLYmvXm+dNbIwKLid
	 1bllmCGHPXcqBxNfRnTit1yJ9nx7O9T394Z93j7/J7/r1dgmv2TbocPJ4roOUdDX+rJ9o
	 YNy7Evh6iKVZUolWqrFEXph6QKVpOafBwhhgvIpqp3J5yIgmYsCw4SMykyr0gUTCY4PYG
	 h1pAAFVK/w7FfkSksucyOw2xllqhCLRqK1vaLCskw43GeSSG5qn2f0RVdGiAHuoIf2kdA
	 2LXHiu+7tYFWiBgowZdmk1nFGC1lNoFWbok6LS3bo3HWpHza6JPKxdjcehaRM+bDPow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602491;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fzaE2019/1jd2vdupDOK/Bc+lldi9kzFZLW3431ayms=;
	b=YJUAblOiTL/JIPFDk7XxFwBVSlRGnyKViKZfU8e9Kc/wCIN0J/ZQc4bw5k8ANMyAJf1s
	 SnesKxvDNimF86Fb3E9KLt9vxz4g7PAhZQuXqhGBJLoH1P5nOV87n7d1rja7iKLVpkhDh
	 oczCMyZjydnIODhPjgAT85FssWRyRYPX9EXGE8U73hpMIOv7/ua41/54dSpGkzHbfMlWv
	 XyaO2ee4IzadNNQzG8j8NjGgi5lEgF939nZp3b2I9WPucuzgADG1Cxnk+LaJvwb2bTb/C
	 RVRbt4Upuaf0WPGnp1gxD+P/p9sgqiEbBiWPQeWVCQuU/8z3Ajx4w/sLtKSBTiXcK0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q6e71RUs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eshi3YxI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F1D606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F1D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q6e71RUs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eshi3YxI
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vVkO2192533
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 06:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fzaE2019/1jd2vdupDOK/Bc+lldi9kzFZLW3431ayms=; b=Q6e71RUsA+cPp1qu
	5W+qAMMoZh1LZo+wuJH70y5+an+pbAguoY9PL99DpwF9FunJJyxL77jAFTdK0lFV
	xK7YMxYY8iAiQIEBa/n369Jijei9LlNPwMdTRkEP0A4IaTBGGuOTtSd+sNIHItni
	DwECJXTP9ZtNKh9nFhgCO/cfwTl2K1OJ0k8l0dnpyR2035D0PHSUPJkwkhL/YLgB
	egSMCKavRTNqxcz1uVXBBvIaRTbfLn2qPfdHHneMBnKpj+IN6Jgv7CobtiUxSh4r
	tuOUXKG3H21NfGBTiNiFAZ2X3JCjiWP8+6xP+zhzbYTIaUgjtYcdD5H1SLICFmBj
	62PRQg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93endpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:54:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so1629399a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793602489; x=1794207289; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fzaE2019/1jd2vdupDOK/Bc+lldi9kzFZLW3431ayms=;
        b=Eshi3YxIdKPLD0czPd2ij1XqaYXifnA76zKj+OzuZxn2Mx+H8XTszarH9lj4Oo25Ii
         kg5wHmwf8UtxHVdU5L0V9mg1twpUyjsg4kdctpmqAzce6iY2eRqHsuAtrgKIK09k1NCM
         36epSZjabPUu3FJSaSCvZ4l1fYHKY1c0lY9DKU6uBqbo9SdYy0L/EEr+AOGb5naH42ih
         P2NPNMb68NbXPZK05bBUZuw5TyFsFKU/uvVm30Pf49sAUWVSr3HRGYJ0rQbrTFjMnrH2
         J6kJIDTKxszt9Ar8YBZmo7ZKcXIviC6jwlicyPrfT18finkAMEi0bBUyyS0rJCU1Gfh8
         bQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793602489; x=1794207289;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzaE2019/1jd2vdupDOK/Bc+lldi9kzFZLW3431ayms=;
        b=lkoz09vc95gxR5LV1+33zT/gTFGaE1DmIryfqwEu/29yMzRCzuOWOt03BHX1qUyP88
         VSU9K7n6QlefOimDNJ7hmg5XeY9u31lAce87352B6xGJhRffp58HqZfnBij0ZbAF7vCW
         25gz2UFkSJmaCtNvI+u81DYoyHoGjBJFrtc618oHCp8hEmOBYs2w+kGcGjZb6knEwWV8
         p0G9By2JzyV9FIbCddgfJpUl3oyP3i+ACYGvdgA7zezHD2QS+qvy6uacCkI94bMkF2LT
         vTgDLsxHBR/Xxt0C+ramVeVMWu+F99cNRtzbccBuf0rJ/9mvJDjeSKnenvgusul8eVyx
         +Qag==
X-Forwarded-Encrypted: i=1; AKwUvByXXhqicG8RN2SmVgIqrhhxkCbu4yeu26s0cb++6AAqFRApjcPUZCfJOAh/jprEFlE77n60Ox4Egd5lUZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sTD+ogz2eTo0nTMvXMT5sJxn2KOkEs9vgPH4ctRXXwic2o5Xf
	VCxH3qwkCsfOJ3rSFmi50t5B5G31xR1SEgKEivZxoQC/JnPoUpUXpeOYf7jZXy9qCCqAOKlAp4d
	CO8PEjSe7DBpS7GHeq/3wnYFGrmyBHxGSa5gjOzoSfFKrYI7hLUxwzAQg2SNC4ol9dMQ=
X-Gm-Gg: AYBFou3IJfQFjMXEpDKFmzhupzN79/f/iVR0W8NkolV9d5bjFXiTpFFejGzyvcwnP4N
	SwyImKLYTayzPJ6/fR6aCV5iYhkbjd91XBF5u6Zy9biiUG72unSWF6TiiHdYgCJ3eN+nJNEw5S+
	/sLBLYv6QGpD8CNFYszaJgazG9mJafGI7U13lLUiKSdOC1q2Wb1Mrp8F5LN/DMHphwXUO2/s7Sq
	0Vtx5h7GxupawHRRGWbuyR/xXHJVu6w68g0AIqeJkMNtXzGYxr8q2JarrXx0YYHHaqwIhw+LoxO
	U05z6ZCJiufS/7b+Y9l7EdOSRhJ4eVWFWfygUlpDyBmD7Pq4d9FigNn+wSJtoXzlkoSxeBoLEbR
	0BBeMHouygpGrzKnEDv+gZsF4UuZtPL6x0wIHxlPald9swIFB/SIGdj2M6V3EU4Br+YFJLg+lDp
	oluSwfhF8xjVj/tt6kNuF4CNPg/Hhvn4UykbCednEmbW30ZZ6mCwZ6VMx3Wbvov/QGAZZMGlw=
X-Received: by 2002:a17:90b:5686:b0:3a0:e1f7:9b04 with SMTP id 98e67ed59e1d1-3ae8970f262mr7010504a91.12.1793602489060;
        Sun, 01 Nov 2026 22:54:49 -0800 (PST)
X-Received: by 2002:a17:90b:5686:b0:3a0:e1f7:9b04 with SMTP id 98e67ed59e1d1-3ae8970f262mr7010496a91.12.1793602488660;
        Sun, 01 Nov 2026 22:54:48 -0800 (PST)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9bc6f7sm16841542a91.16.2026.11.01.22.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:54:48 -0800 (PST)
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
Subject: Re: [PATCH v2 0/3] Commonize Glymur regulator settings for fixed
 rails
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
In-Reply-To: <20261030-topic-sip_cob-v2-0-159e29e97c82@oss.qualcomm.com>
References: <20261030-topic-sip_cob-v2-0-159e29e97c82@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 12:24:42 +0530
Message-Id: <179360248274.1904790.6967545590442532579.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793602483; l=98;
 i=sivansh.gupta@oss.qualcomm.com; s=20261009; h=from:subject:message-id;
 bh=fzaE2019/1jd2vdupDOK/Bc+lldi9kzFZLW3431ayms=;
 b=GVogEOzbzSqV6k6efdAiLgJXUZPD4HLzsIOtE+xD9rCKWwCF5FHLsim/19Mitz+mgNC1eYZsq
 Dk75Yk9ZonKC9zImHFfCj3+dU58iSbN875U5y+yXTt7TcK1tik6QOe2
X-Developer-Key: i=sivansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=FlECOaX69DTzzKU8Gkt1zsAy0qNbAjbWuX+HULfCv/Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNyBTYWx0ZWRfX9KmJztXKLsH6
 LpwqgEg4UTO/BCSK3b34sY+CqtTe1ZEvbK/0uhX2zRYvKlf8G4hKuAIPVdZpSpcAybcSAwVMJ5E
 7p6geJgI/22QTsfXiMDot3Dep5j9gVPIskrUIrvs1h6zpJlotHzazHUeuU20kO964PAY6HFRQUz
 DRwOwDiteOIiqlA1xCH5enFg+M5pGwt3ylSIomk90bSvIQap/4QF0YyfEfMHKjXFbVfHqD0Igl+
 /U1zGXxUlxG/pCZ3AKhuaJZlUlRUb547tYZA68MOJKH1GwZIRZHHTjl0nEOFa6lBEF0eMqiyMTb
 gr+1KGd27l2PfrMcmBcLWeybWdkZjMlQCT2Aly0rb7kqznNRIJVy6z1WSWUBfMiWLjiFpEVuh+O
 Y2rLNFayJhOx9HAxfAmqvSWaI2BBlK22Q59LXeDYxKnRlbFMdW5DL4SBZT/F2Kc7RMpJgiS8unU
 VDbwKBcUof+QTZZdAeg==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae833b9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JkjcV45McEFikerTOJAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: jECaYMRV1LF9W7gNn6YonFiJ9uyM5Gcu
X-Proofpoint-GUID: jECaYMRV1LF9W7gNn6YonFiJ9uyM5Gcu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNyBTYWx0ZWRfX2BQm5Yz+T8Mq
 B6+wRJq0XdPX684QZBXlVQuPrQ+Nv//mmNrYm66TDWsAMcmIn+bXOliy4hjKiWTlFZF1FVOzesh
 S3RI8a33kN64u2o0jza6r/0n+Ysl9dA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020027

Tested on Glymur QCB and Mahua QCB.

Tested-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>

