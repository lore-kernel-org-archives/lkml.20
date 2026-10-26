Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007569;
	b=Oz1CLR4cYtyz3TfHlEHXYXzVVpQbjgFoN7S4hfq+rq4OBP7y6t71uk5eTxKhEAPjnzKg
	 5XqoVNRdhqcW7VKl+IZfUBHfngUDSxvxPXFnK2MkH4aUpApVvgUdW7fVP4Autqr+zW8GV
	 2bofKvbH7c9T0u3lFY5IltpLcMxewQ6mcK4ula8RPaQg5GeuPitACDduuYJZrwPYyty0E
	 uNdsEkb9uy4B7pw6x2Y6KLhNXfAXEeAc/lwA0JbrTyiSLsHLRYnSr0jeMCv8s/0FBJCj1
	 hOvF2wWe0gS7NiRGSs1BmVFSBaQMCQMtHGsjFt2FHYnaD/GS0EeIvdSiGNORZpD6fMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w/iLWULZfyYJInPergzM8rUXSCK5Rmi/SGvYDtmq1OU=;
	b=RPfT6f2FXOSDxmFaqQ5pwK2czkrMalrc9Gl1/yc0grzkjk0ELQP0qZcN5MI2POnRMHVK
	 3Xdl6vX8S7LoTggNwJ3vsdGN9yb0BtzhY9L9qD/J3xH3/Ks7kwPHcXkCSqApQ6FnMvS49
	 DSAZ22tYYGBkoDD6dIOlGGQRqQHlUg4kV55K7NjZ2wclOxGP5dNj5IjL8QrAQP5kKaAx9
	 Z16MwDB2R7Y1kooalZw0IcTbfAPP/7DRCDvISA1PnE2F3SXAzsNqZ3ai8y/qFs71va1JY
	 BlB5m0AQ1dZC0thjDTDLiHz5wkZGrSJh/2Mi5QKEvKnLOBHiXB6pf51W5/yu8NTnVsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VqEqEuWs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YE0SoHYa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9F6606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D9F6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VqEqEuWs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YE0SoHYa
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aV1Z3300713
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w/iLWULZfyYJInPergzM8rUXSCK5Rmi/SGvYDtmq1OU=; b=VqEqEuWsgh56Xb9S
	cpHo/6LH6TuyV1z5cwX6i1uDLS4x1T//86MpXUTsu5MMWf6+TsnwGF05rtpnEZBy
	XjVFds75SQXXXJSs7Ly7Be+PQvWNie+qFOL4SWh55be1xsvqKSJ3xFFnCC47axBj
	j9IUjBhv0yob73caB09JK/n02LNy7dv8vqkFDasko08DTLjQRcm/IjAsOnOs98zl
	KduK/fnyxop99YY0zy+25gySF14ZjfKBN25wOimjCHVjZm3Engw1GNMNBct8O7DX
	uTjseWvxN1hCmQpd6h7dRp3o9unLBsWC1pWtUj33C0CmiWeH2qCxiBCRn8HPC4se
	kqS/gA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpsrw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:39:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea6b66e53so36072985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007567; x=1793612367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/iLWULZfyYJInPergzM8rUXSCK5Rmi/SGvYDtmq1OU=;
        b=YE0SoHYaUVjPTt/ba12elAL1JSZEet2P7UDF2qkn6KezMhqtjYoSjOEr5BMYc4NNAS
         xthyb4prM4OELFz7LB7A2E/qmXKOJ/DhNMeaW7GhxVh7Xqt2zlHC2MioxNmPmgOKDn10
         lzfXGVxcTdqlLIpG0FtmBEqX46HF1glZ8rLOlbRXorONd72HwONmATCweTvU3pUHIgXK
         F6+QuTnjBxefIhDwg3or1GM1qxIVlHeDdo9xLJfP45DCfbgjAjiiRBanhy8FXPc3Z/GV
         NMy9/oCbEV7/Gujyz5O6W4oGfegr5uQpWaF/9t8/OJRRi5OPCa4N6CgG0oYglN3X6pTE
         ey2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007567; x=1793612367;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/iLWULZfyYJInPergzM8rUXSCK5Rmi/SGvYDtmq1OU=;
        b=ZRgN3YP8mxV8ZPdV09oXoSqp0y5iJphB4rz7kjt4U9QnTPU21ObBC2pJ5e1XNgjO4W
         Si6xmTzIbt7ygAIhFOUnsaXLfUWw0vp71TJH6AgP7iT4SBQ3nwJyHUdVf6HBnTqYc3f0
         qnFxkVAXQOSWoH21USMaS3HNcVcgN3gNDMeXqCgRJqFBAp0g/sDyNKu0k8oCe0zH21OO
         mA16hPX1A+fCwpNI3++z9+G72LQHf8NDw8sJJPlz9lvOQ0P0IZBm7BSIkotu8eUtYg6A
         B6E8TntU1LmBGt5Jl1Ijr70xXd36EielM49HVJtSpTQxMxLXaxZQgexIKjtENuGL8i/5
         HZkw==
X-Forwarded-Encrypted: i=1; AKwUvBy1cV0CsFCkM5cosQGEo9qVKuc597AU+jzoBWSWX/4EdZmwYzmIwArHxx7ynJ3qosU5QUSJzCPHOwJq0F0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwrefp5Py+ey9OK8CQMcRz8EdBr+xIylmTLdHb1R1QszY3onBs
	1HTcOYlCnorwEQSbZ26EWuvdcU6zJsd1VN4WvG6DYVqy9fE6s9iELcFWP+IrsnU/qmiMfJKocTe
	m/eQOb4BpZtiB4YpLW908Xfc4x63qM9OdULCh9ZDcnjhezkhL38C1s92n6mmgsyKgPI4=
X-Gm-Gg: AYBFou1grDCyj23gJ79cXVUa5xdh4wPMG8+8ltYSMvGuBD6INwjmEyDbNGQz3tDv6IG
	HbfSjvrIVJiqDVZNcfDsk4FqF19E9v9lly6iORgRGAsKKhh5slO7kwJUJedmRa65z8i2blfF1F3
	lqpN6qyTx7O6MJpE/T/FEPMfFYKwfjZhcb358WZ/isjL2Zbcj5tEaKZyKJCxQKZHSPneWSuzF1I
	YLVKyxBamxvkgszeWEUuegA6SpahRS1tmdRS+xclOSJXniG9Oc5gbUA2TqvJCjWOyQ7cHuxLUc+
	gi87RkNLr8pmAlwQGqFFAMd/yvfNgocbit/vwrj8UszO2dJZjKL8WhDJ2jYC/ZZ3DLsIm+NFLAr
	MQrQ6hFBcPltWDo+jNyQv1w==
X-Received: by 2002:a05:620a:899:b0:939:eb09:4458 with SMTP id af79cd13be357-940ef8dcadamr953766585a.3.1793007567336;
        Mon, 26 Oct 2026 02:39:27 -0700 (PDT)
X-Received: by 2002:a05:620a:899:b0:939:eb09:4458 with SMTP id af79cd13be357-940ef8dcadamr953764285a.3.1793007566871;
        Mon, 26 Oct 2026 02:39:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595e25fsm3393695a12.7.2026.10.26.02.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:39:26 -0700 (PDT)
Message-ID: <aaca9b2e-d318-494b-8313-46945dfb96a4@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:39:23 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] drm/msm/mdp5: unwind a failed mdp5_kms_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-7-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-7-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX4+1Ta7kSI1Op
 X6zDv4v7AfwCiSt3SLb+HStQXNRTd+Po9C1eABYvLsc5U1l1nOgXD+7LQSyqdD6uxS5xIjLRAdl
 K3Vd7TFOD8dfifF7c9DzsOtW9M8Y/F4=
X-Proofpoint-GUID: 0RGnaqMbuVRwBcjuAyhINLxQLDxYcGDo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfXxVHPqhXgtNgb
 TUnHeHcaB/Xwo1zx/O5+LtepPrFcSBV9I2uQLtbg6Qs8wJ2lQz1nRUBE9tl+vIfVTQji+8jkuKs
 RPun8LMu4gFpxo/n2Vg6weFqVpJO2tF60bZmlQaCXeKhMygcwYQwN9tNF93iB9fDikncN8B6hDB
 W53uIGR6pT/ZbUwUJxvWnoitzclG9QuBFCRF7Mvqev5vrqyLPOoQGasI71lf0iM0TrgOtL6Th3n
 KrLpGamTV5WXBIHh0GyZcY/o7XcuVsiKomFDsImzAnlSQkFCF33vjpOHVb7EfNEOF3fRhG5XF9I
 /bdJQNxve8DO0M2FJ/Y98lpmg4P0u/grW9DSa4GvJpefpV7JNwXJEIgTltL+pMTFSzz2dgPDwhe
 9TGUdXKLDXLZ2QGgdVGOBfEmF95MtIAB+NGOP+aBML0tp+esNIWr9kPnTQXZ8AW4UBF1tBURp+G
 cEQg4ufMg+CLM4jBRWw==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf1fd0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=b3vL7svAqNHW8n6rvRwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 0RGnaqMbuVRwBcjuAyhINLxQLDxYcGDo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260038

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> mdp5_kms_init() returns straight away when one of its later steps fails,
> leaving behind the kms, the runtime PM reference taken around the address
> space setup and the address space itself, and lets the ->destroy()
> callback, which the caller runs afterwards, clean up. When mdp5_init()
> fails, however, it has already run mdp5_destroy() itself, and ->destroy()
> runs it a second time: the global state object is finalised twice.
> 
> Undo the steps which have completed, in the reverse order, drop the
> runtime PM reference on the error path as well, and tell the caller not
> to run ->destroy() after a failed init. Fold the hardware setup, which
> can't fail, into mdp5_kms_init().
> 
> Fixes: 8d58ef346f30 ("drm/msm/mdp5: Add global state as a private atomic object")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
