Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006361;
	b=Ma5xTJrAtIYKh9HrlB2AWcdTckddp0OJvfIyQN0ZQrHP9nfIlAl/LuPvYSGf6bJriAXi
	 8ab8mIRz+WSBWjw9b4os8r0JDM2wAwBlQEawjL+Ps9KTdi/PNQxC9WFEkUAe522lml5dS
	 +0fUqzRq64eyl0ZsN9ZSrsiC1GGFV7WGfp8CJqm4YvdgiasYUJRO44H8oRS8kj+9wK/eD
	 ZgZ8N9iCx/1Q+OFQVRif5uYzZjzBRnrUMprHpx5MyWn/MI0DAFgYtRsMwVzHm2LoaxQFA
	 GaWqN3CaToTqH7WjsmeUfZoHg6edtOPM/AqKWxEgfb283aTXttjvoJvky3r8wLVGxTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006361;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4mPhZDRt9QlLUW4y6TN1ZMTZKVwC2eRdbQhQ0HjWnJg=;
	b=YgLk95kN6ogquFLQzJijrMYsKtBeNTFCjL0uxWPNj8YkHmIs5HOxCK2tj51/WNrZ+8xS
	 DhtZoi/skH+W76hQavxkjtdu14+GRN0gtvBxXmnTLEf3qaHZvzIwhxOjmkgKtOAdKGXSX
	 Hs9zOlDo+d9E8VdJT9aWfRwH6hWng1TuftGXS6zXOpfi7PU2uASky+QozvWsLWK2iUbXY
	 i94KVVRmptEhuMsHzY1eHJ1pMWHfh0CjMlhkRvJEWtU/bdCThGI2G2mzkWwyx9ePh+slK
	 xjAVrmtZVUDaswYnpXmc4bAZwrrVUSegFWfHKu3SMX4RVdONKAHjRBZjJCxi8nAj9QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIpHX3Da;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GQKWwKkf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57278606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57278606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIpHX3Da;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GQKWwKkf
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4au7b2255145
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mPhZDRt9QlLUW4y6TN1ZMTZKVwC2eRdbQhQ0HjWnJg=; b=cIpHX3Da9S+jSWxY
	RilXb0nVvMKz/goG/S3rI5SZ7QrT6mo0KtNff+tblgqr0tnSrN7wJcRjU1fwhdfY
	khWQ8UCJCLaK/cp2wUYk9Sa5sUhCwFKvQfed4h3U9GhdYuo5Qg296Coe+TxwCrxK
	wjIV9dwknhWvm5HJBZGz9GTS26Z9bJj+o0NlMP44p2hdoHj2WGQEj2iMzs1+b8na
	gQK0j01Gn2ZXEty65PaqqeiICLewMfsssm56Z4JgX2bvQflon+2vkKltJVSzt915
	eNZ3vPfgBi05dUMwDrRi1eBWnPRiQu7SqpMBKKv1bf4K4XfaSyHM/XmLq2BwYXPi
	0LWItA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3nmj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:19:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c008df17fso8479766d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006360; x=1793611160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mPhZDRt9QlLUW4y6TN1ZMTZKVwC2eRdbQhQ0HjWnJg=;
        b=GQKWwKkf3qzcTtpDr+13aEKkoLCHmlW1e7Ha9d8AqEbeyFVG6TT7ovtZ1JNaUyTs76
         pePuTA72XzG4yw43igi5vYeeJzJEmMngqG/CL4nYEnL4jcowgUbmy1binLmn9AVyKD0a
         MFWnf5kKayXsMxlohA48CMKIfs0kbRDTVrU4xM3Ig6TzvxolZVO3iAJ1t7/2MA4cU2aJ
         1U9PgXZ+RMwMTCwsj0oUPXoaiQ27jyGFYIKp7DfkWw9q43RHyCdlGhGWLXwzEvebtqVp
         IoOwHAJvqItAH+Q9/jtOp8polKQxowOAjKCJEfcp6m8hDsSoH8cCj6Pios0qHIxPUZ9L
         PLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006360; x=1793611160;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4mPhZDRt9QlLUW4y6TN1ZMTZKVwC2eRdbQhQ0HjWnJg=;
        b=F4SenjqiaBgxqViTWVRKNFxDmr+8FegXyuG/Xbc54o2G3uUCdjBM/1xaabQbqKaWMW
         hhvdGYcEHueXeYmE5oz5YFxhc8n8mS4VOtRg0hXQgEgKnLnAzwLL664FCMEDFOKP9hM1
         dOYqeQCNGzurE3x0uqfRG0Gj2BhDtD/YGwfuzZcIf1piXzESxODBvKff7DeY1ifSPfhl
         MtxqA5DyP7fThR5x2zNvkz04oTinaTfDM/mkJ5rAkfv/5fRDHf1C5nk1fc/Gq9GZNoPI
         8QI6e0hL95nHhMX2Bb9CMBrUQVCVvX+hLSam60dkXqRP1YMzXD1AqhcTJTrv2nwvCWn5
         tieQ==
X-Forwarded-Encrypted: i=1; AKwUvBw15f8fm6CE0LBZUuQK5ZJ4Unvb+JS/QAP3KkUvraAmI5MBAY4hM5q8BzublSvt+4V/d6IPx3kAqvC2AmY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwEjug3woZUqp9kPvZDibUAd+cK7uiWhd3wxymOwFiYRaLFo7O
	6FUjqNpvMoEm3fb88YhfEoYNTtmvTpM1t5nDyXrlRALzCJWhbj0UhKwhvZhFmtZP/QTbKRbSrk4
	5mkEXYbbjmmEmMBFCl2FYZzbtv1SKCcl+yPrxAUhW7IMIXwx+Q7xEVy70mmz8u0ydfX8=
X-Gm-Gg: AYBFou2PNxQ/NtDXP7NOQsjDr67M1X8hS2uk2dOh65zxctRqNMRlow2sWfrqEGHGzo3
	a8GuS0JdMnMXzSAGB87M3m2KT5txvYU4DJPTleW4P4rnqfyHDXJl6qhwhyjQkCOkaKabzxAGK1F
	JGOp5aPBWe3yWS+CeJuqYPTV4tznC7w6zVMke+heuXxWMK/5LUEmFw11hKOZIwsFNG2yK31VwGD
	ulKzPnPNBQiYefySj3avQM78Y9O2PuJQCVY3kbI5Ken4spsG54mFiD3rJKhWy5RddChHFy3C3sD
	+mjjizEnDl5eK+u1c5s0lDrHHB9AOF9fhgtFOleKkiBma8ZK5yq0Bkgokp8oXH14NTV6lS/2+3K
	GNP6sxYu1Df1ctQHJ936R3Q==
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr885091285a.3.1793006359726;
        Mon, 26 Oct 2026 02:19:19 -0700 (PDT)
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr885088485a.3.1793006359301;
        Mon, 26 Oct 2026 02:19:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f95csm299862866b.5.2026.10.26.02.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:19:18 -0700 (PDT)
Message-ID: <dcf8619a-29c6-4ec7-bb98-fc9dc705b064@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:19:15 +0100
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
Subject: Re: [PATCH v5 10/10] drm/ci: mark pixel-format tests as passing on
 SC7180
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
 <20261024-fd-kms-fix-smmu-v5-10-a5b0b284aead@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-10-a5b0b284aead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hy9P0GECUUIY8j1J9AxGsbAkljqqiSSm
X-Proofpoint-ORIG-GUID: hy9P0GECUUIY8j1J9AxGsbAkljqqiSSm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfXy7GpHCfP1WrN
 ZQ5HVuavqxRKeF/V+dYGKE/uDbgkaUF+3jcLOY7kzG/yajNtKc0DaQgRQR0c8BD+XoygAL3NeQh
 1H6H5V6fOvDgf+mLUXB8pJu1ycLhoDs=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf1b18 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FX_9VyN8hJSf147S1HYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfX8+J6hmxJpuTF
 jsBiCwO4jLj6QIMAR58sMJzop0csdDzd/PaGGqne3ILBCPQi0tvvZxTme1utyQi9ZfVPkLB6A72
 zYhpZ6S1S8H0wexfYogP9Yfqu5aIEJEF5jiKhBO9vn4ZcbwQVgNbEmlU1fZ0Ed7MBRwgUy93A6r
 vWGJ8ib0RKIQes7Y7K2qlV1kMy2/t+f03vaR7qtyDORAmuyHfvKiiEFyWJae1A9rToK2camBtMs
 0ZPaQhAh3fcGCXKH/qrR36v756qZoQORMV10hcE/VbPFOfLmU062zLBUOUGzv0eWiyCyiScCDQC
 8hxQHg1FgdGuO6xDbe4dNYS8Kvp07GaBcnKpHqJNvqnoQIQIc0+UK5cHiZZPkl0jr6U3niUMP5t
 Tel2GHxOJsKMa4qEw1Fygh1A9AAYZpzrh+dtzds7uez60C/X7607W/UBOqjzW12K6OQ3dJAlNlD
 T5Hz4z+eCN1AP7DbAow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260036

On 10/24/26 1:25 AM, Dmitry Baryshkov wrote:
> kms_plane@pixel-format and kms_plane@pixel-format-source-clamping timed out
> waiting for the first CRC once the test had set a legacy gamma LUT.  They
> pass since "drm/msm/dpu: only reassign resources when the encoder is
> reprogrammed", so drop them from the expected failures.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
