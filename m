Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4DE4A5ECD
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858562; cv=none; b=nIjI3WuC1ZauUpPcSd0gEvw6qeqwi7vpRWlSQIm8CMUN/qpxXX8TV096xcRU6aK29eGCRzsAJu7WNViUd592x7FbeRB6+MbS62nPy2Z4T59k9UKeOF0x3LVWFWUyJH8Uglzyx4U0Nxls2pB5gFDyoYd7vxCd2bokKcp1lcYMQS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858562; c=relaxed/simple;
	bh=sJrCCX8tcWClNWsB9aBPl/sbOgEIN6wKM2tSio4UL+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OqWceoJeXcmkn/V7YPGFZyW2k1onKtSdtL1Wh2FL0k48DRVcBFcnpNk5rVMUAbKHmbJ1l1g14r3qh0+JieWolAFyNFnnAme1PKIzWcbjOnLAXsVBLIWIkfcya8SmcFKLGf5EAHYXN7/eN72Sx5VEvD+FBciCevU5+FjhCn3xdbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebqzBtb4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WpomLXNv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebqzBtb4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WpomLXNv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xfBt1511891
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 12:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H1C08/BFJu+sP1f8Bo+zqaA1pm5ZDOP10ddNZOYzauc=; b=ebqzBtb4eUNkMlVi
	NcTjfjQgGqQXTiPBjyQbvyVFY5R2ym4Z3HhPvALAPuuSNIGTm53/8E5dZqPIe2h/
	Hm6jUfFwX2u47tU/Vy57CoiuGMQsWmzApOz49ySvNV0GyfpGHvhFVrl/f5Z8PGr3
	aLIWB2vGucALMRNzdB3188oZrHJc3eTVmETDEQkIEmaqNyCmL1VP95576zHH/XBX
	WCMNu+GsMl/PAm63rezgfFZMRXq/U00o5p8wcTafn1p/2Pv8I9LtoZbvmynnIHuC
	CpxTMUpegYbI+s7Uf8UJlOW4/up9zklXDmt7KymQ7kCc/WECzy49zJ//LwqTBqay
	TUAOUA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188suqvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:42:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c9a1cec69so44905385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858558; x=1791463358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H1C08/BFJu+sP1f8Bo+zqaA1pm5ZDOP10ddNZOYzauc=;
        b=WpomLXNvJuqgD2zgxL661Ta8TalNDiMtY3sswLN5Sv+iOH+S4SzheNYIUM7Ee6HaCo
         OsGqCpPbrsiQY6Pzu6sxIxemsPvaKTZc4hkhk6QbS7ZbV3HHcggpPfQ2dljmpKCXeE+U
         2OyoqL3kP+kFeMrUCkX0ivNdS6S4+KVjQHiZxScHRF2SU+KxNetEZd/Rii0dRHiq3A3H
         6Yh26KhyzwbWox4RFy7lwy1VSXRBtBksTUVx6VjEO4wofVJFy5J28Ag99cgEBZZle5KB
         jb0mktz2T17As37xJfi8+hik7nG4ur9jN2bUW/1KE3nrNhL/Rw2YFtlRS7SBrxLcE9tC
         Jokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858558; x=1791463358;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1C08/BFJu+sP1f8Bo+zqaA1pm5ZDOP10ddNZOYzauc=;
        b=PQ7phR7yTgx23n94KsY9IOELyuWyMju77iq5RqTZMhxFHxVt1Scri+BVrHib3vFUMY
         Yda8LP6WIgYk2sp3YNhm3M3WoLvQg3VvPojBbRxnclvePKamyuoOpbXYk7igMakwEWvg
         F/evZmU2+yX1MdkOWFYzIHTQaBXm/6rsOI/CmsqCO1OoptzN3cIVySh44otDNTU93mBM
         wJbcbKKBQiYwx6viGxOOIJMowZXGDLec7JIbPsW+PmtasauHefiV2Vps+qqz90moVcZz
         7apZESzRrj3x+yDPFego+9ARM2Yp8Pyp1T37fH+h7HDY4v3Djt5dQrrzxXBSZFdZYasA
         MI8A==
X-Forwarded-Encrypted: i=1; AKwUvBx9RBGjo3QzabpG7GOD+xpSFR2ZJx3P1u41EUQPjeprkteKYKlSruuRkXuKc/XDCtQGZG9ql3ni9uA2cqk=@vger.kernel.org
X-Gm-Message-State: AFuF++mZqZVTfDM9CMZ4P783X2nw0KO/IJSlug9dBQLxtrOSY/K0XrAf
	mV/AFcXQ4y+Wq5aOXLoAS+oyU9Q7qvzBwUTg4R7ZD/h77CY9kqDT/mTZFOWTP7W64oIi/sLzO27
	CiWYlpZnyH1tZczHja+HprDe+O7iNgqM0rW7mCTAjp+J6Ap6p1sqwg9JpvuMxfMf7Zoc=
X-Gm-Gg: AYBFou3sLgL+EkJqC9vkNkbM1T4+fBuReSsWgcLKAq3KiIibvne5bXaR2w4UsVzqGQL
	e+hyRf/3ks4ADXM4O2iDo8maph+BaqpIDeIaShuIjFBAG/81nO+vm/IzYMAQl1ljMj0PDgklf+f
	r57j+JFByoHQiRnWeKZhLFGbzPFIpCbI/a+bXlTb0jdR/ZcLp5BvucRpjkm0XOdPSg8qm2IA5O6
	WprCJ1m47KCqkib/M0m8jtFuOGz7eRhsfhOywPXJrOJ0+61wtXPp/EE8Ctt8EkRPe4VVUomAyY+
	gvVb+zwSt5vGB2MHWo/1hZg/KZ+PvbWfQIlX4EifGZ4Fb3KhzW3dZ6P+8hJyTaSfBmBNHGPNs/6
	3uCMu5CSfwJOMLIiqIJIdvg==
X-Received: by 2002:a05:620a:3195:b0:93c:5bda:9711 with SMTP id af79cd13be357-93ca980894fmr853052085a.6.1790858558465;
        Thu, 01 Oct 2026 05:42:38 -0700 (PDT)
X-Received: by 2002:a05:620a:3195:b0:93c:5bda:9711 with SMTP id af79cd13be357-93ca980894fmr853045285a.6.1790858557821;
        Thu, 01 Oct 2026 05:42:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31c93c31sm151473966b.11.2026.10.01.05.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:42:37 -0700 (PDT)
Message-ID: <e5fc5d23-d6fa-4b57-b6c6-a7ac64412d15@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:42:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695
 haptics
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261001-aw8695_haptic_fp4_driver-v2-0-1bd38b1943de@fairphone.com>
 <20261001-aw8695_haptic_fp4_driver-v2-3-1bd38b1943de@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-aw8695_haptic_fp4_driver-v2-3-1bd38b1943de@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX38PxrGHaybMS
 sUKtT0iGgYWQ2oewQo2iAp7sVDFU130lfYCFhsXZW0VI6b5Vc9uJ5mFjgdYpThUuk+tQVayr5Yi
 sriodNCB+ptq7YiA01E40KIvUVunqZY=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe553f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: VRvmxxCsdKLtdZ_03ySHkQxSfbuE1jly
X-Proofpoint-GUID: VRvmxxCsdKLtdZ_03ySHkQxSfbuE1jly
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX2TJPxQWy40vR
 t0q+XzDGpkksq0T6h3LVlVZDX3xfruBDazp4orH0OOiFsERK2IjjEz5QNsw79rlO5xQ6tpo5C8g
 LrDs0XLui+MLJa93QKFVjhCispe1SjpSFeSRDofExRrYcHW3DD7MEDgNiYzjMWaettQovFsMJyw
 87uXkgMu6sFdYLCM4bCfqdymC+6+aL7ZfRSP/BJDeoQLz+egw54TnF0V7jh+gKNnWdKxXWheWz3
 jCOKkU4Sx0AXrTO3FUaTb1ktwsw01pxe6/oCcH0j9/h3vgod5NtALg+v/rqsa11BrKGzUtCSM7I
 1uYKkio403ig4yKgwGY4owTl0/KrEDGCgE/yHveTyhEe+8APOUrsRumjtWXJA7GJd0PM877nLO6
 18GV4QCDzAsM+ksQDnBZId+pfNxXCbtIbA5y1C0MbCvvikhA8h+8V9MYmbie82mfwHKU0K4HIb7
 iUxjOPRFOh0TBpz93RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010050

On 10/1/26 2:38 PM, Griffin Kroah-Hartman wrote:
> From: Luca Weiss <luca.weiss@fairphone.com>
> 
> Add a node for the haptics driver found on the phone.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> Co-developed-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
