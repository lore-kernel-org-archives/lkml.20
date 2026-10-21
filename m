Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590529;
	b=Tts3nbrFzQEJdXNJh+5wkbaDt5l6KCn9r0kOxQ52b2F1tz/G4IgEBK1qqlgGKq2U6sbF
	 MZqG210uu1QEupd0OV8qoV41oTOWp4j6mWmFkkzhixR8wkUNjXNWP8qNEHGXK7fVF+3re
	 4zHDI0r6oQrmzElTJQAU+QbYqOsXD4m9Z6/t5RgHK4ozD09G+4G1A6vxTZ9Q+HUn6LiIq
	 0niZEP6qJvFXBmee50uDI8gvtwpGFtPQ6EQG4s4giWulbtZUZV+zHC4tuujebD8ISr3Ok
	 pOH21xMkqDAcfsenYkkOiEngxgvy330pnOEbWoyoibEXdJjBfWHt4l3o8aCOExcLErQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590529;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8mNXDJzEPLAkTirj2phYmas51ZDGCneGM9OsyGulW/4=;
	b=UOtVqvX9eX+3HoOLFGdH1Umcmnu4MBtDVoSWLb9zd7Yd03SkHAODd5XZy9SPjAZW0jgj
	 TYqQgk8t9siiHVOGLKe3v4RZrCNekGhbCTuP2SA8DVJBzTjKnxM3V7nD/twehlTXDTJwh
	 rAfEy2vbLdPeZL3xbS4ojDWDSMxlJ1GzGfT0toIi5UA+e1Ok/wbHcFLLvY36rDNtoiKHW
	 5OfsiDeRVGySjyB7spmDPEtLwgmBYTRzHLiQIPai9KkkXpuDTIZzKEUjtGya1QIPTCot3
	 SrbNvcbSO7sRi5v8fDs9YltUbab29tMDB0Ng86lQ5m7dFThOApchCLEX/GayhZdjZJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eeHmZHwu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TyVawEib;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD24606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDD24606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eeHmZHwu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TyVawEib
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg84G1568316
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8mNXDJzEPLAkTirj2phYmas51ZDGCneGM9OsyGulW/4=; b=eeHmZHwuumefcCq+
	9Om0caRyw6TgR0Ueg2f0wP4Kw7z78dA7MDKTqPXxSJ8JeniikROzhDvSU8dphnsV
	BLBIUX2ZIA/DNy2XOaA5ZL3uZ7VtTZuEzKSbqG1RiVieqN1ZzZe6qo8E0YYQ81HQ
	CA7YqX9nz6OhWf8tGVi71IMxmxczDZqrApnf9uQR0ln+kR0rb+UDgV+A6rZ+/n0I
	bDs3l4KYF+3NtdunvfcNxhxaqZ8Kt5GJ1JjwYBZST14HQgqw4ULgtXmu6i+goyOQ
	DOf0N2VozTavvhu4e+0j0XKrbhIdgn1QhyOFiMXNbhBeQKqPbwwHem659865XvyA
	wSNbzA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4v6yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:48:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9178ba8eb30so1660376d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590527; x=1793195327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8mNXDJzEPLAkTirj2phYmas51ZDGCneGM9OsyGulW/4=;
        b=TyVawEibZ/vEiJ3s/jg2bHQr+/bUevZefvM5bi6ITSnuUJJfzqCEssQe9M4yoGYn0w
         GVg5phlm4egJhiV1O4PaXkWGdnArcvR5ithKWatLuVTUkIGv2PtyNjIEmsUZ8xsvVZUu
         ntak0XZlh3YXdpsrg0FueOnkxlFkHb1HyTcYmU6b+wStRgVUO5NkHgPdpdLP2liBbth3
         sSOcMp5VaneZrgrV4eLPwSkWxwFsj0yYz8mxYPjrY2HhFILOQydAjRts+UYi8/xzqtql
         1kjCezKuaaOZ2kiZ8wIBvzpjGH2r0Wfg/BqmkZ1xG8qSZHWloPuAACvoZPx/0d86PMxo
         qy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590527; x=1793195327;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8mNXDJzEPLAkTirj2phYmas51ZDGCneGM9OsyGulW/4=;
        b=BGy8EQyl5s7E3otinjf7c1P35uQi7cWQFbi4QpJz40iLOnySRPepsX9aud12vLgbVb
         NVJinu0INir3KD48PkAAUbj+4+UFSYovNWN3PFljtbPYh8jgjR4atEw6Unlg5IuUgoy5
         3PXbI6S6iRMm/u0mwlH570uVlT+MTDhfGRA/tdv+MOeuh8csrPronOFHeA0mXHuoEJuv
         dLTpoV5N3nb2O/yd6Sik+l/shh/An/QkXfrlZc5X04ro+XYKWgvIueIdVXwtMr8j5MWV
         EbO51N/gQVcumU2vshfyHwKUFLb9jVjhcAs7exSvyn9bMlbksnbKuIJoPLufmRyfwx0U
         3h6A==
X-Forwarded-Encrypted: i=1; AKwUvBwI4byYPEXa3jRb73E8Yn8nNGzPYDViCQ3ZJgla6GsECN0gw2niyGznIhxXgh3l7FsoFR6XMZNYtalbXqY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiN1hRrnohzrMz5jdPtH+I1KGmiVjbtG1vuQF/A4AW+qCAHiWV
	6Ck0yS/y8WOtSFNkxk+lmJZFV/j/HMgFhUGsAfm1pmiqKf6okRj+HfdgKlY9KXcmWK41/GCqFqa
	AT4r5FBEC/8Nssrj7Vg4d3l9eOY6sxGg+ca1KFggur9DdpUXZ9igoBcO0ALbB3pxHDTs=
X-Gm-Gg: AYBFou16AkqSw4rnuxrZzbPodmKD371VFcq/JpRq5YF+FYq3c9n16wTqNva5VOTSwgN
	JjGdIg8jey4lTfRffbKzrW1PXcZ+7N5rHwQrPlIMXgv3Osv1ozlyQPAtG1sXMJqzo1eMSRVYCOa
	RIObvoPDWOvxos7uArjAfAg06FTSv5CP3AqvlzoTTaM+cyDY1vdEVA/1jjdD2Uwmch7dOLgp38P
	NkCn2hB2r1i4ZYW+bsK26kNZNeBIBLxJqSvLwimCrh0u9CV8c0bQTZPJVMc2Yz1wf9ck4A7plrD
	I6S4vMW+yjoEM3/Qweun0VVJq9zZ9HInoDqPzwUSF39YO2EzL7OqXPAbgBFwWXLnfjXYhCJlov0
	8qpTToNIYOo+HoqAb6zj62g==
X-Received: by 2002:a05:620a:2913:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f57e5e2cdmr501591985a.1.1792590526857;
        Wed, 21 Oct 2026 06:48:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f57e5e2cdmr501585485a.1.1792590526242;
        Wed, 21 Oct 2026 06:48:46 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1f0526sm7553266b.1.2026.10.21.06.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:48:45 -0700 (PDT)
Message-ID: <c2b5f9de-d1f0-4131-82f4-396579520515@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:48:43 +0200
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
Subject: Re: [PATCH v3 1/7] i2c: qcom-cci: Factor out write command queue
 programming
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
 <20261016-cci-imp-v3-1-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-1-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nSuKJKjRz0YNzj9aoIKiqG1ORL0LVT_H
X-Proofpoint-GUID: nSuKJKjRz0YNzj9aoIKiqG1ORL0LVT_H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NCBTYWx0ZWRfX8bg9d67xTHKr
 x1HS0zLAMX3vpeB0dziGIxDd2vSnLOGYttxZFzd1KZ2w9824ulP/KGBu8zHIMW/S3RWN7HKxs02
 AdlqPXsYIi4OftwSbTtFeAaUTpUm/rk=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad8c2c0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=J2fI_2kDf8iagJYHrR0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NCBTYWx0ZWRfX15a9ROXzlmQi
 1+oEaaqTh5XvVNcrZ36RR2Ul/Kl8n6N0OwCEOPfs4vh+IlL6+fiI4Fjo4M+fhCGSrdJcpVdl+Jd
 qRwQ3SVUIGf5M3/qiuNXBktHZ0bMSWnd0GN5FIoFEn4j9Lw0mSFBg0HXwZdqFVIovSFwH7n27HO
 DDhQBJmULY82nW/TLK8Kqv9Fiqf87FtrLei5l49nN845nW+EaAR7HleCZHRk5CBYpq2qobY5ufH
 jKlbcMIVaS5zv5ZkrCI/3nwHHTXvXBVKEcn9z/apy6PvLWn11LlhqRW+U6L24Jqs8OgmOxLrQ6h
 xLBKujCkVqMDxMwrQtkY09CEvASzXt0jXbKAySBh9/MnAX4YYLWXLqPWnARAdgl5YR4TMGw77bG
 JYDqt8TQfyHlfyJ6dynh62BC5W1BGtEpuLWA+PVt26yo09Gcwm0MDWrNV686/C/FO2wKiMUzyV/
 0miyrfbGEDG4inQTZmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210054

On 10/16/26 10:00 AM, Loic Poulain wrote:
> Factor out write-command queueing into a dedicated helper and replace
> the manual byte-to-word packing code with iowrite32_rep().
> 
> The resulting code is easier to follow and will be reused by
> upcoming burst-write support.
> 
> A command can only carry as many data bytes as fit in its words, so
> validate the length before building one, and do so where an error can
> still be returned. The I2C core already rejects a transfer longer than
> the limit advertised through the adapter quirks, so this is only a
> guard against building a command that would corrupt the queue.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---


> +static void cci_i2c_load_write(u8 *buf, u16 len, void __iomem *loadq)
> +{
> +	u32 cmd[CCI_I2C_WRITE_WC] = { };
> +
> +	cmd[0] = CCI_I2C_WRITE | len << 4;
> +	memcpy((u8 *)cmd + 1, buf, len);

LLM says this is no longer big-endian friendly, but BE arm64
is going away anyway so I woouldn't really change it

> +	iowrite32_rep(loadq, cmd, CCI_I2C_WRITE_NWORDS(len));
> +}
> +
>  static int cci_i2c_write(struct cci *cci, u16 master,
>  			 u16 addr, u8 *buf, u16 len)
>  {
> -	u8 queue = QUEUE_0;
> -	u8 load[12] = { 0 };
> -	int i = 0, j, ret;
> +	void __iomem *loadq = cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, QUEUE_0);
> +	int ret;
>  	u32 val;
>  
> +	dev_dbg(cci->dev, "master %d write: len=%u\n", master, len);
> +
> +	/* This condition should be guaranteed by the caller (i2c core) */
> +	if (WARN_ON(len > cci->data->quirks.max_write_len))
> +		return -EOPNOTSUPP;

Likewise LLM suggests this is an odd error to return and I agree EINVAL
could be better

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
