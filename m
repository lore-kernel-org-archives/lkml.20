Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437124;
	b=iPubPKJqGLkAJZBHn5oFMvLO53Uwi4oN9SzvCM38twmYCuJ+U3p9ctLpswWKgu4I119l
	 QavZIuzaZ0nIEJDt+I7Z9l8Gso9H40z+qMd5usbraiNnX0MBo8DS4GB7MDqUWTREOhl4b
	 FU/09nXkFN02rNt3YRXgKyvnyQKhuKA7LORzqxrZR40mbr4apggMt31+Oz6Bcn8tSc+8B
	 rXq5Ny9xWGcWeTZy5mG/4gQxLQLiDzVvEtNxEXAOWZ1s27BpMl6KBSZuTsLZ+6Aso41Sn
	 Wqnr0uJFB9sfJ7f5dJasvlvkRtQtX6LaihC2ln/nPfPGHEqCdrAIAGrJ6x5tf8hi+GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OnWUCT0nP14ewlYiMnjRm7mxk446HBoHRdssfYe4its=;
	b=WmLsy4tW3vQ/b6/dVqOuiRJxCfuEvCo9YRHgv2qP1bTQkSpTUN8wizKHJ1bYBofblJE1
	 abG74c1VYve3Zv79urQ93BFPzKgzSWL+7IHEMxkNoHR13yXRfZYEE9P32uYHbnO+A6A0q
	 cA+iiI7l6F/VnhEE7k1WB3AnWakRHmAGp7oCSD+ewmbC1Stq+I9k1uFr6rxLFJwIA0HK5
	 xSt3i0r1UpzAiK/UgUVuDBFHwoZ59SV6nXcmL9wGjx6tbuoTTNj8FOQ5d2QBpNoYZWy7j
	 NOCFsDxkSBrG4z1KtV7g8BD+qWULGdt3jRMtZBVGPDroYr9qS73J9DzUZ10q4H7LHfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A546CuQb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtOMQSPd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB75606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAB75606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A546CuQb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtOMQSPd
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4a7v12177092
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OnWUCT0nP14ewlYiMnjRm7mx
	k446HBoHRdssfYe4its=; b=A546CuQbdAMLXraN1TIUHIC3ExCyLGnsvQ0lgo2K
	nu1eXR4leaDysTFV8YtULKq/MsfXDpBVUgnXfwmf6csQSB8HwaBoJcWVA1954q9z
	Pb5UbN7tlZpl9tHJIdGx2WlAyeBswUD3CyrAgCdlR7Yzc4eGKVZYQPHSJuYFzvaq
	0UqGdjk9o5lTtiXeM79EA0EirU9dNQb2fRTVHEPdwu3nAvqN/Y+1Mhkm/CU1d4U1
	UaKILiwd7Kkr5VsUW6YCK30UfjiQeABRAUslqxXx76DKApGxgrl/C9vStx0fEw0a
	fQbbDZkyrJR5v8UpQLiqGT0iqzQlJGZah7a6Q1kjUEm6wg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rrvq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:58:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3698bd5392cso1278170eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793437122; x=1794041922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OnWUCT0nP14ewlYiMnjRm7mxk446HBoHRdssfYe4its=;
        b=NtOMQSPdjV09qjwqpUf1aOreafMFrYY70hp+E0jFoZVj9p/U66GjVxocQVBBYYtfW+
         s+WrciXUFDV90qoyzUL2u5WIpKR1nvyA9p113fer3AtcFWuJ5t3IwmI6SNk+fL5X2wdW
         ULVCR+y9GS3tyZMIoV6AKH6zxQnWe7y9CrhSpNJrgoZGe42DN7KKkHb6xV3FrD5k20Y2
         GmHC10wYf/VN07VZIcPwoP0/Uj+k3JnuhllAdyVKBf2PlXCtLWmgAjhXkbLPO+B3MER7
         CgPSWPvHikDUHtJIojGvaz8uhA3U4OmQZbL9rFRBZDATB2vXYno7ywgmJTXNRKi7pJxB
         c9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437122; x=1794041922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnWUCT0nP14ewlYiMnjRm7mxk446HBoHRdssfYe4its=;
        b=R78gpdoMxmrEYLDf2JV6Qpk8jwV2OLcl52E9DoJ23bVyw6Ebgsh0Nl8MdpZnbL/c7/
         OqKoLwNMLfad74cEiUXxvIYrq99WBmczw4sFk2kBqethOGp5CJrGDrKtqgA+lCDYmxDP
         6wc5YpXbnJ/90/HRk7TDinkWpvZTF5rdQnsZ3FaMn5Fk2MIePM++WRxW2aY3A3fX2RB/
         qMJ0fMZW1evOuCEkSF421slwxakb3UqRIdyStbxCdRl7QVrH2ZavCdkHZ0OjRwKZzYLN
         HHlnxyD/NdS5jM56FSRoBPk6GodeJGY2d6mpLC06kZ/HmAw/d43am2ukcETtuVpTh9z2
         mNgQ==
X-Forwarded-Encrypted: i=1; AKwUvBw46vuVcB4kii15qzcb14upGQOrDcgdOvHY8TpPk2xVebCslPJCEdGlSqtWmV1PDxJy/aEfQYw7b4I1IyY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJOvoh7eL3t8kE8ypScsNvrcdccx4OWG1tf7cOvjAooQpSsHR8
	Dad3STBp4PdR9zt3ZateLoY1IRHi3vQRx1ipVctLx7XMUUzX9sfsR/PpPOcRdHo/IGxrHd89+MQ
	eK1oppT3P0pCJBM/KJJEsZrZ+3VTJ/JjMhJ6g2A/R8Rtmaf57mRyTMPsDDp1+K58Wd7E=
X-Gm-Gg: AYBFou1KqYuYuHxn8/+ndt/0h7vzSa+n8dS7u4/FVr6dd2btFBZzT/6MAKgdAl3OM25
	PMsrhhK3gHRnlH8XbK+WMiwiWIogW01p/m/koP2lCpXojVhBVOz1QQN7iQiL35jr+hOkYoy2Auq
	qAIkevwM0HCTelIRV2Rd249889QEf7Ud0YCsxlLVV/o77hS7lQ6rPk/mkr2Hg/XLl/onlUk4bqS
	CR2S7y0EdXpKO6PC5lqNxSSDsJ+lXj8o5rPBH4pmYWRciQt7nCAqAG1AhccZbMaTo1gJDWHKZVH
	nkcjWqHzuhkTTbYSBiJgLwYxMoklVRdPMBg3Lm2uCwrpALVqSdW8UL+ZbI4zg5hQ87a45znWmp4
	CLou75YHlJvWsBnyConZgmNMudnkUe6uBkpcZJwFbcUaS71or0xkm1OzYRbb8XtbQqUQffNmC9+
	+N37QcyRsfTnKkv+w=
X-Received: by 2002:a05:693c:8211:b0:369:f3a3:fad6 with SMTP id 5a478bee46e88-36a42340d04mr6795476eec.4.1793437122136;
        Sat, 31 Oct 2026 01:58:42 -0700 (PDT)
X-Received: by 2002:a05:693c:8211:b0:369:f3a3:fad6 with SMTP id 5a478bee46e88-36a42340d04mr6795451eec.4.1793437121608;
        Sat, 31 Oct 2026 01:58:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm14503095eec.19.2026.10.31.01.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:58:41 -0700 (PDT)
Date: Sat, 31 Oct 2026 16:58:36 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: lemans: Add label for firmware
 and reserved-memory
Message-ID: <auWtvHZyuJz-Cvjm@QCOM-aGQu4IUr3Y>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-5-shengchao.guo@oss.qualcomm.com>
 <rhh7s766m77am3yfktpeaikyswehfn5pa3l3hsbd2ugegmq4te@4rea24zv6an2>
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
In-Reply-To: <rhh7s766m77am3yfktpeaikyswehfn5pa3l3hsbd2ugegmq4te@4rea24zv6an2>
X-Proofpoint-ORIG-GUID: 7rU-Ck_XVCyj5NaHCl6B2HhcURYdKnix
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae5adc2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=h7ndaOTxZN1f3CytN_wA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAzNSBTYWx0ZWRfX0gH6xL1xBsi5
 zSl5RWj2WU68N8qyBkE7Mgd0XbuU+2qbGMeZX8sbB1GTyIBElp6YawTnoL+2E+41ajNCnVMcgRu
 0SvFh5oMo+dfcTtX1r6I0SR2U7OhYMs=
X-Proofpoint-GUID: 7rU-Ck_XVCyj5NaHCl6B2HhcURYdKnix
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAzNSBTYWx0ZWRfX+IDCbNTHFe7/
 mn3KEvyafB5NC4OD4fxe4f5QGc3DuCzpSNI4tc/137NiWvDLv/aRpu636IEE7H7ixNzSY0xFATU
 /43fXXWshXYOLSE2XoM+XKsb/g97agPZgZOZH1DOeSIL67zZeaAWL9M2Y2KNr/x8nYOdlgyMmH7
 E/6MY4tcxWv9MTJAbdEcNKo0vugoB0JBbsFC+zVM4Oj+wDHtbI8vz56eEnH3ZzKrSr6fK+fCAgh
 yfA7eaOT0emBv+3rYsIaFmJFrvI8krF8IeQ9yi2+HrO9SGiAsUHH/0kZqPTw1qG2c9eVvT2clmz
 FflB4Le0gCuImPuc7Sn6FuyEGhMcJ9wuGD0IfyDrL5w6QrLlnn7mub+bGSJ1KulCe7cnFJHN0o1
 OsE9+ZXWrsjuc9oaU/5ez7tjgIIoF6lCUX96wl8PWQ7CckZ/CCZ/tk0Fr5WSwjNpFq0ih13OVVV
 Dmn67tdc2Ta0X5QIv7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310035

On Tue, Oct 20, 2026 at 03:12:45PM +0300, Abel Vesa wrote:
> On 26-10-15 10:37:08, Shawn Guo wrote:
> > Add label for firmware and reserved-memory node to make it easier for user
> > to override the default configuration.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> This could've been part of patch 5. In any case:

Ok, I will squash it in v3.

> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Thanks!

Shawn
