Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793115285;
	b=x2oplR5E0jdBgF2Ayzm+fUqrUzLv/05MJnuEt8rfTq5DjCroe2nyV6SMr5t++rWuzxsn
	 N2rs2omBGmKCrJbRCRZk9TUaCXKvdm72etdGCPYl0o5/YouCkGz6FXpqmielERQ6kH8Xk
	 wETJA7iNdhPsmE8WEOCRSjEk0dlmy69zCcjdeb3PxOk9fMZv/5mgUHRWheQ3Hqgohz7Yx
	 dUUj5hu1JYdtx0ua68O0k8xj6ghJLfVdYzB5KFv91Pw5KFtxFto5WpKcIIG6oDVsOjWVf
	 9fdvf3JSWRtIR5t0NMOXIVjfY7nWewA1OmTie8TL3GjfeZzKqPPGPzEBaTAnxMTE5Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=syD++ytwmVWxJtGfHI8abOuUUYru2aIJFUXyJ4SbMjE=;
	b=OOiR1uuVqGk/yJHWXYnwywFKCTAYvuWEqnTqfaby0F9g8oQ4A9Gdc363331WBirgi5e5
	 7+RDbgL+/7Szx+HQEBtRjKiThSVOxVxNbNTeP3Q+T/jAiCeFZ42XMw9RHABUyffefrqXV
	 O6ypPtqeON+FcOjupsaGXAMGGLJTxzo+12vcfZ1GInboBBOxAy2gJBihnQYm8KhmaWEa0
	 NNXbOmg4DVZ1gcQFRqHx1sdQhqVaJEq+5yoEi/xa+Zpu9B2WIw5m6pXkNnXWdIxC4wbL8
	 jOSokb8SDqjrClbCfL57yE+eovQLvviAsa4Mcv2DVnKqtHvCkxXylQoA4HUj1zSJnZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VKzNRe3N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PS6lTxQQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45494606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45494606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VKzNRe3N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PS6lTxQQ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL7ft2549207
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=syD++ytwmVWxJtGfHI8abOuU
	UYru2aIJFUXyJ4SbMjE=; b=VKzNRe3Nojh20JcuWbwd2+fSIhUSQaVXcSvs9MSp
	fok1SmOmWKJA8bF/nqH2hioiQkkEyc56EOLGiTW4YRFCfWA2laCWLgCdJlUSp4Z0
	5OgJmmgZtWUAYo74EoOHrCm895/Cp0OvF3GYBcbU0U8SVCJt8jQv8c4b7Vl0LQqC
	UOqRLM+oHibom/s6856oR5engEkInoskYppyPYV/6QfYsqWYFlkMD8y38vQzeBG4
	PXLdtVp9o4B2I8LBnfkqrGS7oWQvd8fVHuodjEJDERrUK+/GANZCKNpRNoGm5ms7
	x9ayPuZgmXLdxoO3Qzf/sJrGWr/Ped0/YKFoTegq6/+D1A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq69ndu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:34:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso1017843485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793115283; x=1793720083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=syD++ytwmVWxJtGfHI8abOuUUYru2aIJFUXyJ4SbMjE=;
        b=PS6lTxQQjNKHMS7hK+1p7ai0Ju45GTgiU9e2FDiGw8FZdubn60KnHqdq1SgHuFJsVh
         /xQ7vN09qUSkZjp8FhaV1RAanzT36tW/PDFVxNMSyBXrLHe7KKDRPPjQ+Ygp3GhoPwBs
         VXucfT0pShdPNuxhro9wedkGjqXw8N88aohyuV4CEzLfscFShxyIgm9eJlyhJqBSdcXW
         uiq5BMl1y5YlEr9+15bDvrXI0luy+4pP49LIXWkhD1nY7cfvkXHne3K9NXnibl3Um0JM
         gOQk9CvlpVXjox9p/SlPkay7JU/s/0CX2uZwPPOQNDEAJQLrcVqTBpRGuGAS4n2cuelE
         mL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115283; x=1793720083;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=syD++ytwmVWxJtGfHI8abOuUUYru2aIJFUXyJ4SbMjE=;
        b=Vcw4dCsSj2asnHCBwVo5k1lkEmyVeh3G5Xvs0QSKmTLs32aUz/7c4B3z9mq5b95rq6
         7qJ/mv4LIgOl/j69d8HXjjy7PU4oLs4bEByqgSSC1YzsopvOTpt8dvzq9KTTuA2iry+c
         CScMjosWY2BgQ4Jy7CGxRgAXvYXefm4uVU6rGlqcB4ks3oKycJSHHCh8aq17J2uOHYZB
         3PNwaOBz+BMQyp+KFV7IlJ5joXpcxZF+LKfy87ajDSamP9OY6SNT26o3fcK5RW6lCLVz
         byjHnkYbNi6bJD2CRNfFH9a5qQvB/rTKKRGzzxZcXP3zNVh2ZWNVuDsauda6yWpn3h5N
         4mig==
X-Forwarded-Encrypted: i=1; AKwUvByKcMEhF0znJVcuTm0wRde8sO6IqZJlE7kERUyZQmlg+B9Jev//JEmJg3BvQUn5wJdkzGuZKlIuSPYrEqY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLi3t1Ns7DE9dgGf1vI0KJmNvaOnHmmFs2E/EQm+Qpej7zAAINm
	NTU6ExSaG8DpHFir76ovQUOR9PwyPOS0MqaXmZrJMH6CgeLtL4QZ1ojlIohrGLKvGlTrv2oov1J
	XoXO/qAdi1l/r2K4GX+foxfRcGaQ/SK/woXjfDmAS5Y57pfxRkPKjTv20/rB6Cw3rh1k=
X-Gm-Gg: AYBFou3kb8j8KtAm858YwTLfG3DBPGziI3fOc6nP8CZMykRe6bX75ilF3pjqdeXRknl
	Bv5xvXnRPVrhlUY0T9+0EeeWPpfvjlbBnm/Zx5a3m1U16sEtDDgFAjkKv62Odh37a2SKWw6E0nB
	62JNtHFXinF/bOB4HXnl4XLvMD7OQBmsZ/zEGQlMqcVX9ybLJpV+sr51uGiv+iTU4tn1QAG7AO2
	Pu7N1lOnxcJi/E9LH52QhpyAbW1JV/IiajB3XKjsJZV2jsrHKk5rAtA5Fv0vS5b6sHy7QrNetGN
	ynn4wcTqAjLMRXLLrVlGhHi96ywyxLXfyuNvw93OpYQAW9lV7JPqqt5Z95GdtyaGAa83lJiZsVv
	r/m/oQyFXxorXcf6W
X-Received: by 2002:a05:620a:6286:b0:93e:6f65:de63 with SMTP id af79cd13be357-940ef8f8310mr1655474685a.47.1793115283192;
        Tue, 27 Oct 2026 08:34:43 -0700 (PDT)
X-Received: by 2002:a05:620a:6286:b0:93e:6f65:de63 with SMTP id af79cd13be357-940ef8f8310mr1655467985a.47.1793115282534;
        Tue, 27 Oct 2026 08:34:42 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm23217567f8f.4.2026.10.27.08.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:34:39 -0700 (PDT)
Date: Tue, 27 Oct 2026 17:34:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] firmware: qcom: scm: Allow QSEECOM on the Mahua QCB
Message-ID: <527ui7l3vbr6bzfqvlyre4lhw45323eqmfuy2ehqdiqvzzpmar@oztr3ibem4od>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
 <20261027114955.1266499-3-sivansh.gupta@oss.qualcomm.com>
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
In-Reply-To: <20261027114955.1266499-3-sivansh.gupta@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0c494 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pfxcL939j8YmDoyFsLgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: pX7uFl0OzQV9Akv3WYxazIRKVv9o-zqz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX5S5jpTz0qDXV
 OWnelZnDFHjvHNvLyzl60QCnKwJ1aRie+pEcUxajefADtRbGqwPrvDtXBS9yVKhJo3Enw9MX7Tl
 wdCxwWdH3DqiAicNUYaWiBzxTNUnU3Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX4l6H6pjSlNoT
 OPOBib0Zx/hOCkigGlamfdH+qY8DGv2//7T1US0LcB/vOc3iED0BNxP43rN5keYUCkUIYv+yKaZ
 XTmntLVCd4Q2DRqlcEoXFhtZsOSNYVR7wnnobhEIU0yOdcU15XYNueq7xxwh5z6XDg1UHhlvkYJ
 B9MuTG3CW4XQhRbRXaNdAd3mHho6H/u54tx2EkU4ccKxbq4eAiQ4ce2WuziELDsefmw0jelfuVN
 6OaS8C9GWkyynfZlEAtblY1c0ngNNBtGPI0CpKkh7g/bUThinrIJI90r1xkUiMRYCHmsrRGmSxd
 K9txT4r5kBu6zdHLPlsVRvZIBE/gdajJWcTeHcZ+WERzpama316ZXyURroTSHIU0oqfiWhYMYJH
 3CcnomQRwjBeozd5PL6yhBc7llK5SHMAi2UgrGRURgtdgHwIuQKqye9XfyMvimjzy4tQBWXZdSx
 mf3Z1DRMNHmU0puYeeA==
X-Proofpoint-ORIG-GUID: pX7uFl0OzQV9Akv3WYxazIRKVv9o-zqz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270061

On 26-10-27 17:19:53, Sivansh Gupta wrote:
> From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> 
> Add the Mahua QCB to the QSEECOM allowlist for enabling access to
> efivars and the UEFI bootloader.
> 
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
