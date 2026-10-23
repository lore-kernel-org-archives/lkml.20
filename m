Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792768606;
	b=Ja7hEzhfa5F3Xj+pwYpp8wryUCo0Ph8Q+svlN+yaykU8QkZbE/7ZBGEDdKGccH4JYJ5H
	 GSOrj5h8vr3/x9YGu+bwRLuvoDSECxE+NQNF0dAshK9xmM2UnUSDk3d+8N7BJb9/1FJxH
	 fwHNDPoXsZcDa9ed3MIrMHmLOqK8mrGYu9CKM181E76TFVNZVPsp3uAAuVhZEmzQQdGp+
	 qE6DkI3suCfmDD6n3ADhpDEAlLTNSsdBYV+lMpSjICaIO61HhpIe+VTeE+ZrGngmT7Av3
	 pM1LN0PcbV0sN/I/kunsNPhHkn9FHzsIO5m53KrOmp/Jye9wv5QrFT7dmkH589WYKmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768606;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=;
	b=Y938EsodT3IdlL4Qt8MwdNdCO6I0j+MIF5y+JNqV/w3XnuXPJLZvpcXsPKAkF+bzlIW2
	 dHXA6LmCBYwGv4RkOos+6zqiMYXmgDkjnKvaAjb2oQoG0ck1ih7DZs3vYpimUWOJv5cIS
	 z+8I17L6g0K35+IHi3U3Xxg+1sf6WZIEMTp600SLfCTYGul6oM/utv7wEdXs+y696Mu5G
	 TazeKSCLTKBzar8GdNNxlGZqWl1tVzgjp+X3W+QWd7+4FQCthKkRsaf/ZMjJKZxZGFrCA
	 BLNQlak0lRtQzyxWtnGmgD5xbZLlxqletjQ40gPbZJti/92xG0q7xCfJ0syJIqGfStw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RuZfbKXK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="L/3gk0HD";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA15606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABA15606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RuZfbKXK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L/3gk0HD
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6IAR3557697
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=; b=RuZfbKXKE7ctzwuv
	czGvcZJqzCy2XCLn0xdke+X9ts8FAcun4WTZQCudkdJKnb3xdFnvARNiR8w9By3I
	NwA5f19bmPM0F4/1N8NdyKMtmcsewJn8V8CTbPlcN5jFBP0GZaF5wiyzsdocXvUS
	xcjmTXDeIeiuipdkZxzWk07LUQizJOAFh6S/jElNl3n7/mp18BKLuVQ1wp+bgk9l
	+FcF1qB2p+MZRT0ltDw0JQzJxLrzFY3qx4BmkwskNY9DfkKwOgNAhobCbeqgzD3C
	K4wGWwxI6rnBtUmB7j1FsuYzVYhAGBUyEOeSjKp4k/YEspItviojK8felV6wchif
	2pd1KQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjc9xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:16:44 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab260600easo2712303b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792768604; cv=none;
        d=google.com; s=arc-20260327;
        b=YbOxE7IQ41BmCw/6WAfEIjEdAtfG/CYDFHekH+GcQRmfZajI0TM84bmtpfTXqMQ5kI
         f9azvc/F4zRDxte837aBTdHVmWXyG5MzJ5TARb9TLsZzTH77CcEXD0TCBQNm2sVA+08i
         91SRVVelxfPH/3phB6BYKt7irAuYqKVHVGBP2Sq+5Wvolu4Ie859kDbSWaakHxgXCHVn
         4LDIy+o4HXBDV0GM4KZOa9XxMBl6y3b3tfC7OFvLza4adOCwOsvf7jI9CAfiwMyr+hVs
         fBFohkiwX7jIungAFXWVnXdhWl6WxsxKYzJgAQz+ihx//scKjPjw5bGbjISDPfdO1Ehy
         mz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=;
        fh=qot+GHN9VQD6mN8pGU3+WlY5kBBUbeDi/RQVjKiimhw=;
        b=iv71jH0XQryAi6dIyimes32PgkKK1KSaYB4/TrmdccD755OT53mdkQ+it9I2ICa/tf
         3sP7IylYw4QkKbvpnG5AcXZcUjbn1WQPhWm2FVxNo3iJJ+BLcJMQMwAQ3Nc7J6My68Oo
         mX5LVIYMEUCbBnmnhVJO150u4mJwuH8uVbV+dMMLYqi52f1ejCs9Yq9nB2FqDZEzk7rd
         XhostpK2AmqFLxLFrMGce7EdgAth5rR4t0Lx3Ys3EZ/+wOitFdNbb7tCXOm8Gd7EIJHm
         zhPEkkL+b7NmUQM6mmKGcb5jHg5fT7N7zbDXSZW1E8d+j/sBxZtKyRXoSwzn+bO7vZbC
         wOTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768604; x=1793373404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=;
        b=L/3gk0HD6tLj0ZMPDOtdsa+nHmVehU9lqltl0YMtrsiCyjkNKDAUGtTK7TidLO0J13
         4Glq+DZlulePmP8lbSje8FLFth+Kflvb102fMF+2QL3K2UPB+heJ5IyelRUFwQ2oUnrW
         zczr4NRYMDe97XpWM3OG1uJLgQmKpeub3DBya9SLloYZ5t7oOYQomwu1QIsOHjiJh+xP
         L9sybaznrBAP7jvBIa0J80WfrHJ44b0U2l3t2lkDLCXFClMMbgKX3dNDXCytRG2+SVqG
         JwFEjOMn8DLU96XThSZW6bfSylys1yjMUXUNePQ8vSeFzbRPbF2gNDeiiMAEf3fn1EyU
         IQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768604; x=1793373404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=;
        b=WN3d9c0exSgvbspGioHbxm+6wGR4IirTGbbQ9uJ+QRACIGf18dwTCzC+LskR8lHaAX
         ISRR4xrgp2sTBQKFgVSllFnTYrmf2vH5Ick4/i6VtW8081mBKiHGEJvcPNwFaIfEiCGG
         AR4zTdfSVVw2bqJy7ZCKtRwos9UoidqauoqzkmTSZK/OkxxOa3bT+f4fn8zzZkZbm+Be
         cTUsZPIw61MAc6i/kgcnu2M+NK7ov/0RdGBm6eLmCTCmQZYz+HpphmskfEH6QpzdIziG
         wv3IIT2Ufa825N5fg99GSqoufhLrnOrv5i2mriY4Yssm5ekk14tANUcdq39JUT+0wsby
         tR4w==
X-Forwarded-Encrypted: i=1; AKwUvBwyRjEJLOSTkm1Utl32jLTXzkoLFuUGxWBCEtT1Szr0zPiGj6fy53ej9OkGcjiQgAF1mM3J2q9tbPVesBk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgz8dSNm0LT6Pjday2OJhjcSkxDXiJtZnLrz+rbD31tftkT7DP
	3FMe3fJ/RZvkfs/WbYsiNnLFnA4SCS0IryX+fFVbLY+31Q9UsWCuQrzHWz6aFp7kx9nLZw/5/+2
	nG78PcBQaalz7H4RskyRnuus/0F8QGb1gg744Bl7INTWV3KlBiirql6ugnZs+ta3uoIIpYynKzV
	AiX/+gRdZ1omhe5+guJvCmgwXGGTcNxvTA7sZhH1/+yQ==
X-Gm-Gg: AYBFou07H0GXlIEZh2CeY3JUifHj1ICSGrzFdQqbq6HNLIjWuCE5ocRdU2WIuCd1YtG
	s0h4hopluKWlXon0wdVvQOWoo5BtdX+0ij5AQgiKfFoxt9Wv86uUE7xJZMZaN1g358bST9FZdog
	NJApYny0dhCvpxgyVB4LMrxULI+t1KjzuUfa4IHVsbM4kC1mfiGfHL3DsW046PbrRueobNWnK1U
	TXptlV+x3a5V50o5xeuL9JG3vQNN66WexOXXtjoyIxLEJO2jaQcsizu1PFQMMZe5FWv1lisC7I=
X-Received: by 2002:a05:6808:6f86:b0:4b8:4703:db91 with SMTP id 5614622812f47-557eb47d075mr3061848b6e.26.1792768603806;
        Fri, 23 Oct 2026 08:16:43 -0700 (PDT)
X-Received: by 2002:a05:6808:6f86:b0:4b8:4703:db91 with SMTP id
 5614622812f47-557eb47d075mr3061832b6e.26.1792768603405; Fri, 23 Oct 2026
 08:16:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com> <20261023-camss-isp-ope-v11-3-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-3-0c2937195298@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:16:29 +0200
X-Gm-Features: AclHuK_gI7FsS6nJkI8EHAiWfGIfmG-kFFxZK8IqQe2rUZA0KJsBBIIrHA95LyY
Message-ID: <CAFEp6-04RVyYG1M18Dh6Z3J7MycTb-WdMkHxyyVPfyiHVK0z3Q@mail.gmail.com>
Subject: Re: [PATCH v11 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: GGismeubKhfl7S9RFcnS2YKFOjgr0sWk
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb7a5c cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=43rrA-HyjK99Vs58VTYA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfXxSxJnnArpFeY
 BdiWm/dHVIW052NERCAyjrbO+WSiBHS6dK9b+Mc8YENOpviq1He4jOdDT8pj00jtg5hUE4MiuLt
 /g+CD7ckH1rmO5Af6xaiA4LjO4zPS+w=
X-Proofpoint-ORIG-GUID: GGismeubKhfl7S9RFcnS2YKFOjgr0sWk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX9adHlI8NhnXn
 rvLvee5e6td14d9AfxCj5+KtjRAV2cIrEve5hv+gQ0GuHy+L4wT4qblvMbnqp4rR2AWd8KMUbGh
 rvddtWM77q9AfyRy9WdA3ovPgCCkhSh3irN9s175o9a9+mOy7LtvBFBivlzuOOYPU6pmsT1RZ27
 XgMeqwgQev9LjLqFO2R0Eu6oVuRK17vNDhbvTVK90NGu2L6TvkhI+e2UVvGLrbf6xWGmyitZ/oA
 wJxf3jhaeOhho1JK7DIathb1YDZsJZm7xwEMu1UBark67zINuu1QlJ8StilclWX1pBi0tLUcISM
 vvTvlvnYo1BbeICCkI9WpqGp/jwZIJFJFl3KS8JpXTsECr4Ye12IZWeUC8LykDV614YY56XXqqB
 5CRSVIhx2S49MyA6XxWtVwwuNCaPHeyHWcQUJsjIXu2CeUuMEmKe/ZjU6z6lVcSs/wNtKuvVzqZ
 I8BeLOCYFQC1sQPKC3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

On Fri, Oct 23, 2026 at 5:09=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>
> Shikra uses the same Offline Processing Engine hardware as QCM2290,
> add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
> as the fallback.
>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Note that I missed the trailer update step and therefore did not carry
over Krzysztof's previous tag.
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

> ---
>  Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 =
+++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-o=
pe.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.ya=
ml
> index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc=
41749e60d772ef4 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
> @@ -19,7 +19,11 @@ description:
>
>  properties:
>    compatible:
> -    const: qcom,qcm2290-camss-ope
> +    oneOf:
> +      - items:
> +          - const: qcom,shikra-camss-ope
> +          - const: qcom,qcm2290-camss-ope
> +      - const: qcom,qcm2290-camss-ope
>
>    reg:
>      maxItems: 6
>
> --
> 2.34.1
>
