Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793368842;
	b=YtInvkWQANJdYhm6DEJWXvHOQTZ8I5PO3uz6eQoDJ6S19LAjLX5BqlkHfjqw9P5urz+Q
	 jrfRAHt3ZKKOv1skhw4yL8sDOqn9RXcwaU2p0b5Owv0twU2RaFpN73/w+T+THGdLsEyFi
	 SKdfbrganIGvpz9dRmIFEfRNJ8Gk9TQg+6c1GEAlajXLjhuteKMrOoNhvxKLwm4hPjpSB
	 rCCvkHMnL1jH24yRxhJimsf4a1UY6MoCaJSq0S8NY5A8THL05P8G0kwlfpr/l7ANuKt9w
	 +qciQ7tBwiWp1hfWXVsWgpzcwXSjRMCf6klJu4nhnskip5gIUSH+KEe/ibOgIQEV/Xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=;
	b=YMHsVgTFQV/77rRBe10YzPFoXtyMq/g18FguIKK0LNjIuVmDUADcIdwIxigtJ8gsTde5
	 jLm/5Z4PZiUapQiIA4eS4z676vLy6a1QsrQKwOQ3AVWoUqkDuBY7EYoHktAzRXwRD1QWV
	 jsHPiMncKaK1DxzFN+9HhuNTnO0pcl86Hcdgwkhyq0BzTVSfzhOhRUtIvUK5y7/Td0EbV
	 2xmw2+YDO73VuV8tAjUv7VO005+47nQtsAUYGxFNu9muQUPCUjAGxeBIYn5J7RDBGh61N
	 cSYlsrelDBdFcpYC6D/eB+Ceq8caKaHboQCVv7wFV5m3oolcm0PY1rW2cZUIJCtPWgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IHDI6toP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Pb9jc/uG";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF58E606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF58E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IHDI6toP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pb9jc/uG
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDn5Oc3479675
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=; b=IHDI6toPVOYrtJFP
	z1ZskiucSL9zaQF1sOyXvlzXXmXLcY6WxvfQOn8yxwZ/hYxEfwFWQ/xNVWoXwEAw
	pi2RJnDNfhF1UY3r1JVkL39V2aGWfVLebudH4SncyDQbgusv+q053AUMKyXiydcu
	Xuuds3tuDj36SZThVwg7WNX+iTMThoNIdbLdehPh7qg+SsNrAl41CZj8mGPab3aC
	IzSvs1s97jhg8gczI1Lc967TPUvwZW3AZO3Od2RD79WhwlAtEum8sDjTCmqLUOnB
	b2ChyMvzXr5LPhJDFH+YAD9wCpqfVYMRl17krS0QAmuFPTV0YMDCQfCTL3T781mK
	o4VBYw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkb30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:00:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a06da65d92so581191b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:00:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793368839; cv=none;
        d=google.com; s=arc-20260327;
        b=QZZCCR93bJIQZLA5lT+A9XIsBE6HfKf9wDzX0AC9CF1Mp564gFGusE3ZtLKA0Ap/DE
         P5kIsrRVfotc5ciAUyFO+0IcmaWKSTEVzLE9HYplpgdJgnuVF/Jn1hiMm1Dfg1tTVXr1
         cC14ZncSbNn4x2F7Od4vNYiH8ofD+Vwf3NjXDOFW9hboNOzySZj1ynbnzHTRs9N696l2
         /Mu2+AP2zPTt+YQT+SLCBPiMgTdICRtBA6kCdBizsfrFYeGMbkBUwR7xz5wUgRcsZe40
         0MOS+aV5w4Aa+0S1jL//MjmtVlkUKu1Qsvw3+LBYruUSczQ59zDilz/yW96NkpU33lo3
         IB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=;
        fh=FkXBpq3n4vevK5QOLzeSAqwBhNooakvcLqERLDdgI4I=;
        b=ffzIS3W6kfj60JgFRV8aAXCR/ahAVQL02aKZGctfjqo91UFhvXn4IVFy9k/4rARuT5
         dOVG/h4Tc5CJcLAarXD6EBDPQ6pkMLbC2NwLrdn5AMAUyNIt/psFL8dWlzHPSXZHcMgT
         /KZ0uIbg6jPV+88tvZGVIoPeM4HBOiNW5zFbbIW3Sh16MhcgIB75ITiRyQY1g1gzuQPF
         Sry6hOs7K/Sg3cLE7a6pAq/8xQ+hAFnkUBhZt8dNJFFdhDZkLfTXg7IlAMeuUVJlmlps
         PDM4d/jAMqUO5/4BOVkXw515QQr8VEcuxiMtw5inUIwwe4R2Nv8ukHZSsX8jja+50Omg
         TtKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368839; x=1793973639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=;
        b=Pb9jc/uG4/bChF1xogQmfBiWvQVm+hnFFXft5IQXyRj/WM5uzELK3FOvQqCQJCi5qk
         PTs12MXkkFxYgNWGvYR+CIjU8pzfOlzcP6zP901R4Et4ddmkn/ULtJZ2dCvRDZCK9z/3
         Mpek8csJ66i4cj9zO8MoxYRfaj1wM56YrGGoKH7qPeO1ks9lVop0s6FdpvLfeFzggj2W
         1M5pbyM8RoV5QUT++BTYUmBh3Q1ulf+1/4rFnEBfLaH0DGnneMBLS56ot+UL1cxCMly+
         cVbGey8WwnGRednmDWNDCiGXXLgvf8QMs5agpV4YfGk2Nhit14qggaW/On+M5APaYkuf
         GZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368839; x=1793973639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=;
        b=j18osH/eJf3WMyqeGcfgAmtDtiUhD+DH06cwRDNTjfya50JM4OToJvsyOTi4not6H6
         GgqVeQJ41C3hdnUmSL/VqeKVwCAKdb//eN8qczqjtpD+BKgPDPGswx40ivGZeB3ATsA4
         A0A6tQZ5euhEA9pKlejItu/dmOkaoVgKoJ0hW4Xm9lHYaUL+5dR1YQCHYW2D/+vD49fm
         0sKdZwZzSJXk1CdrqCgV+WY1XH3x4tyEOJ4L/GWTGNXfYgG+Po6haju6qtjUJpkfK/C3
         ZOpxaW0QZ7m2cutcfsOgKM3U87pazokf4RwvHrmClQ9BxeQcSUUYvjDJ+n7sAxF5ZlK4
         aDWw==
X-Forwarded-Encrypted: i=1; AKwUvBzcg/0awdKjBhmubdl+zn2bbYe8+EHb2VlymJbnaJVwyhDmNs7FiJZYHsCgF9PB5MRaaAsYCX6eZmIg/7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8gghcDfI17pDwvYSVKQVQP86P4fwIqOCzk7gWPjrnwZbIwWX2
	WPBFJqytBPRtQQuiu3KJcVfdTApf+meSpJll0Z8qFfhXk7LWyQTgmbFYRZL95lHL4csebdtfyM/
	ZrOPapA8alsaji98waZxdjU9x9SCWMOXFnnsg4M+QuJKg+7pLIW50IQAdKl3zpXHpCN3+SNM/Bm
	uWuJa1s/tj/1od7qPcFx991ft4EgyDufL1EZIVZke4Mg==
X-Gm-Gg: AYBFou1BroCqcBqjpbyYiu9AFSuH0ckpc7Tt5PttzhhP+hxwtS+3MfztxjOsGiEyxEH
	xIhZeLLU+8K4Izwf9DV9Pml2o0rdXu/o2yTTqNeONAjWGROxQNobNHPk+tVeNUnxze2DLU1CsKY
	H44MusfF+3CbJ2v5PihqwDWDi8ZhXq1lyHFEa0o2Pn3KM+QbU7iuWkfekJXA==
X-Received: by 2002:a05:6a00:1c91:b0:89e:584:bb77 with SMTP id d2e1a72fcca58-8a9c098ab29mr2174610b3a.58.1793368836887;
        Fri, 30 Oct 2026 07:00:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c91:b0:89e:584:bb77 with SMTP id
 d2e1a72fcca58-8a9c098ab29mr2174559b3a.58.1793368836406; Fri, 30 Oct 2026
 07:00:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027144002.10606-1-ansuelsmth@gmail.com>
In-Reply-To: <20261027144002.10606-1-ansuelsmth@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:00:21 +0100
X-Gm-Features: AclHuK-MTjfwt2OQzyBtwa_iraZJVoORJ1j_v3oQYZTa5jWvtZ6sOZH5C5h4Bak
Message-ID: <CAPx+jO-TT=UAhH5=5DEPuu1XtVvvE_QA_1V=9qw1moZJoPUU-Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Document support for
 Airoha AN7581 SoC
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: yvSsPewFWb4FHK4B6Ot-cMy4LRyVSYrQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX6LL5X+5rF1za
 A0V61oftX4S2b3X3DBHUKWJ5CMWdmKT2dmaNHz+Ui5KoV4wCBho6z60SIASKSl3vQo9E9J1/DAu
 2t8hsCNkOWDxWnJpHakXWzEYEYrDeRQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXxQuNbUmqx9FN
 5PqoD6r3kIL3ez/jrFDQnJHI5MIqPQ3HXabYKAQP5S3KQbBbVS86SzJL42NDRmjNHmc8j9+CDNY
 /P5+9+DUdNWSmwSgG1uRZ5hYgyMV0DeXCJEENYLcblIIuAIBSE0skZTFttqS/CD1s6RQcI46ypn
 SorgQe6fv4BW8YZpMJeNoXgaWNTLf6DjHVR3oXFppCFJ/dWHDROmqTRLD1feVvVI2tG0h7EU2Gz
 M31+Tzu76X6sPfctzE4ire7sTs9YzI1Za+AuPY4/DhJism0t8ggLrK/rGRTIKqDGDbnCjKS+bzR
 +VSl0/y4y0YAFBJC+MiNHSCehMLj3K6Ctx4/AAY9rNhIKMC+Fk/Xb/Vt1NPftwDqPuBCX3sRJZ/
 Y0Kw8alGl93MTum91hl268k2DgKS3cH34j3FtwACFL2qn2IM9l1RqPpzzElWMGYxhxW2lJUL3s3
 nzUf4OiX5H2ueKWi8hw==
X-Proofpoint-ORIG-GUID: yvSsPewFWb4FHK4B6Ot-cMy4LRyVSYrQ
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae4a307 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8 a=5vCY4yJ5Sko5zDJxFQEA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054

On Tue, Oct 27, 2026 at 3:40=E2=80=AFPM Christian Marangi <ansuelsmth@gmail=
.com> wrote:
>
> Add dedicated compatible for Airoha AN7581 SoC integrated MMC controller.
> The MMC controller is based on the MT7988 with the difference that it doe=
s
> have a single clock controlling it.
>
> Add the dedicated compatible to describe the 2 register requirement and
> permit to define only 2 clock (the main one and a fixed clock for HS)
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes v2:
> - Also add compatible to restrict clock-names for source and hclk
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Document=
ation/devicetree/bindings/mmc/mtk-sd.yaml
> index a4d032224dce..704d59360bcb 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -14,6 +14,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - airoha,an7581-mmc
>            - mediatek,mt2701-mmc
>            - mediatek,mt2712-mmc
>            - mediatek,mt6779-mmc
> @@ -182,6 +183,7 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - airoha,an7581-mmc
>              - mediatek,mt2701-mmc
>              - mediatek,mt6779-mmc
>              - mediatek,mt6795-mmc
> @@ -238,6 +240,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - airoha,an7581-mmc
>                - mediatek,mt7986-mmc
>                - mediatek,mt7988-mmc
>                - mediatek,mt8183-mmc
> --
> 2.55.0
>
