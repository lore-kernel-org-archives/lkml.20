Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E79427F8A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788551721; cv=pass; b=MIf5sOvxzWWLViPdNJdyWHx6QGbrkWpnv3HS86QQXMPbEFPai4MBLlT/eE8UwrijFavXCJIAIm/u148chdRDDJvnN5uM4K8ZxpyK7oeM7YJrdKyFng3zQ5rZzc3qdBM2beOb8A+ku6FNB/LTKF7bd+lfHztEHVlImfZWWc0/36o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788551721; c=relaxed/simple;
	bh=Cuy4oNKyaJF2ZdAr5zW3Dz+9GPWKnBVFeBK1jrQaFGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BKOCA2jIFAJHQwMjVnjZPYrToukvD9xfQAGsWsbdlqWZYUxE0ds40HUXpTwLSbZCQGOdR2ga+6ncHAFyh+yMDe3CYhBNuORs+pQGZb8/kYcpXBaMTVr/+byC7ZoluaLNx1xHNLfn5nWlSAWVhUXvfU+NlRMRe3QsWF6legGo9eM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+UwIbQE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZGMSVO2; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+UwIbQE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZGMSVO2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HI9Ex208810
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 19:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+S2fUNcs/9WkA3bU1bHtkI2dA6OSW0Car4DEk+gp/4=; b=l+UwIbQEhpKBzgLY
	uptB0RNGGwdGSX/uUdUjHSMXvRcp1Ny6If/J65idpGn5MtAwUovCWyZpYZQLkNQi
	Of1kwXhfQYcQv3+xfAcVpPlDnxXpuUVzAQ4GOv7MSEQ54bU+BwGDng4gN+QVsHhk
	zF0NLmeLK3go4dxt5klAgacaMsHs0VdBkqvV9I2JGJho8zYMhgVieMpq4iEw9/99
	3FDHiFTn3mehNx/Cr8Z8SP3CpgNYS9VCy83P0WXyerFYScO+33KZTh+8ucyfy+Ct
	FA8RLsBYSxxFjuXTWiROxGwFjF6uZdHlGaz33kAPBfD9HZ39u/gSeJ2fLXTP0elF
	fsR7GQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp784gyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 19:55:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494cce712so249333985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788551715; cv=none;
        d=google.com; s=arc-20260327;
        b=UBs22+KnjeU1SkddBFzTT+E61sMCI/7PmDPALkXHyOq0jVlAqmtj0CtieYk3HOfgEs
         7fxWFlFhPeMUTc5Mz6izTkqXdT8CNKKKFc/mWbTUZYGOv35an3BMnPMNkYtfrXwxpgam
         3A40VLNi4LjJTPRP1dlpCOKgw+h3g0n9QSBp1izNMNFNGOGbupk9/9iDELZwU7HsuefP
         m6hSAjjJ/T3n34YLcG7RHQlq4tf97a2aYntgwUYi96PwKQAK0vGwGxnmU6a4XiMLsUpD
         vuUUNkXtkoRSnJHIH9ppmqIcNb5piT5WprwX7wV21NjhrsbsJeVjxr2fuKJM53wcBBjC
         EMSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7+S2fUNcs/9WkA3bU1bHtkI2dA6OSW0Car4DEk+gp/4=;
        fh=MZPSc8u5/eTe1okdO821D5lKi0xJ3UGV2PTnbAGpg4s=;
        b=LAYyLhK/icIXVTbmAvCPdXQyn3ZWOSlxsmxrvo0InQJA3Q0JuNybv6XvOGqLwKCXDo
         ltBjdyTRP6CalshFX5QNEU0lv+MYJRdWcdwiB8QlIC8u9D8j9siYzUUpdC7oIlVn+o70
         5CMUAedzdM2GZQE2Ya5CZIh7i2utqMMsNDDuvUXjEEnSKuzBO+KUxZIViK/GjnwBUHS+
         D9zBlAoKSL64oDz9/YL+j1ijKIXyUARBeDdEcwdBjOGlEkgbmD79SUwnjuz/XvNrcC/2
         vYFmwGDFUig7Dhb136caCQVAcZU9JJZFzgakwNeM6cpUa4wlGc2MNpd7H6mI49xThu4B
         DKIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788551715; x=1789156515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+S2fUNcs/9WkA3bU1bHtkI2dA6OSW0Car4DEk+gp/4=;
        b=dZGMSVO2HK7zY7/S8dX+pARokyGm12TijPDnyXgoAhU3v17OELXYdLxbpG931mlShy
         HFyxVLc5UG0KZaBMHIaPJDzacEwPrW9w7ivFG9DN7V1Qct3FqlxW6LgkoVv9mUGW5DyB
         poUJLD8DPQcjef926VRMixtl/XXnFKeUtuhZRA3R69ENUrk6+KphIRfkPFyurAT/wPc8
         O4+FreIfrntOBzMPcUkMe7bZVGMC5LusgpOFN7Y1uLFaGNsKu09BIfyKnzrh5GOmHWKv
         O6VLqGHVSCF6s1VMw9wau+E5agst6eDw1N3jwVzkGhjVpKDzH1GADcCaOfagYzfwctyu
         YtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788551715; x=1789156515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+S2fUNcs/9WkA3bU1bHtkI2dA6OSW0Car4DEk+gp/4=;
        b=cnotzRmh3JD4ykK1p5Xa4TpnQGpEBShvjysGYf7TG5ku8Vy7zTFkI5nKv3mKz+iRAg
         ueYQdpvpJlPUR2TjRYCuZRSmzAiaa4rko0tBNPSCC8ZWstUCocte+3JlDLTrCr+0meAM
         VdKXlqxxzrVwkRwx1+k9WPgFtoZlEeYJp+e71S9T6uVZ2rnXLt0p1gA9oN+a7BAbgI0Q
         /Cckmoym9Kv4/KV4DFX6x+8BwiOPYH6JSky+cXvKqwclwahkArsdL9iAJYGGXV77g7dd
         k1goIWA9hBZJzEsKFeJZbZV7doRB2VpjNj83KtaGNTYJCoCRT59qufAM/g7FQsk5FJYZ
         l0tg==
X-Forwarded-Encrypted: i=1; AKwUvBwdwbhP8TV2K3OWUExxKQpQppFhemEDDkj5+S9dzWsYbtITCh3WWU2uDgRH37lYQxXp5iV+P2uOxvXrhto=@vger.kernel.org
X-Gm-Message-State: AFuF++lyPubZJV5Fi+ku3s8CzmFwxbw8llcCDvJm7QFGEn4E8GqL018y
	yKWkPVr1oEUSjdubKKBk6XVJE6JgaYxsxEnyuBVM+cJTN+TMpC/Cf20z+VREBSMPiB8TTnH2BZ9
	HeJSVDhDqUlpue5Q/6eEF0ArKflUpUIUMJW0Ul5tUST455hlAO3XT3AkzVIO6P+2TZWq5+nZ/5L
	gdn1fwGM41NwcVRsAVQAv5SuSpaePphI2hRPmQocUSbw==
X-Gm-Gg: AYBFou2HCCn3evldgVldnHiOwb9kcSYYCbIByEp/vAL1cq7Evo0TCEuovEH1xk3nqxN
	+XXLbSRq33/OLaKIgAn39Q0kAGmJksUFla/d8jhDanpu9P9pIdmwkS/sRYZbxutsIZl6EOj3IPv
	tNPvcd9Htfwgl+bB00vsZ2GfU/k8ltHNEjQ4Z+Y4iJYHEMjPT2Y3q9i3MTPcXDRqvvPfiuT51aC
	m73v5Z3TLtsu8vWNyzTLhuPbucwT7JFIGha0/bmT+/grcC95/2h2lOf+jGvr5yKUUlk3PZMmjI=
X-Received: by 2002:a05:620a:46a1:b0:915:9e84:85d1 with SMTP id af79cd13be357-939803a4a96mr811791585a.23.1788551715391;
        Fri, 04 Sep 2026 12:55:15 -0700 (PDT)
X-Received: by 2002:a05:620a:46a1:b0:915:9e84:85d1 with SMTP id
 af79cd13be357-939803a4a96mr811784085a.23.1788551714708; Fri, 04 Sep 2026
 12:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org> <20260904-x1e-camss-csi2-phy-dtsi-v5-2-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-2-dc81d85b599d@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 21:55:03 +0200
X-Gm-Features: AcwNN1W9wMgd18cVEyYOdj6YVkfohjR1CF5BB3XCNyAGw8QQbTcGw0lxRrgxPso
Message-ID: <CAFEp6-3EqEghkrsUMYtV=1z6n9Y+bPG9YHj6Wf2gOVboDE3hKg@mail.gmail.com>
Subject: Re: [PATCH v5 02/13] dt-bindings: media: qcom,x1e80100-camss: Make
 vdd-csiphy supplies optional
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE4MiBTYWx0ZWRfX28pAxiogFaHW
 quEeAbYfFzprjWGs5OUl9MIGY6I5UsbfL3I06KSAZ8f5oYVq/5+z0UdSVAuN2xtycJ0USRXT9OY
 5j/KN8vZdexZfmphsGf3e3ftDJ0+3wE=
X-Proofpoint-ORIG-GUID: tLwlEzhA0-fZNBCCpV1gT1lvjZBRZO_e
X-Authority-Analysis: v=2.4 cv=ab5RWxot c=1 sm=1 tr=0 ts=6a9b2223 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=dr_jwI5W_23fGTPCCGYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: tLwlEzhA0-fZNBCCpV1gT1lvjZBRZO_e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE4MiBTYWx0ZWRfX5OQ36cRLrwoA
 Qxhv5AwpUFbeuFntbmAUypHmYZtBgBRKoHSp6n+U3pBo46Gc+bMy8J8sXkTYIzMPnODFhZOgB81
 VOagKQ81djCm7DjIEe7q0i1G25K5/oMYf5GYWQLNrMQtIunVU3c3njKsgA49QJipA7N5o32TvaQ
 kz9/hf/LRVCVDm9rqRkqQtRbD4Z7UchlsrM/ytWZtr1zPuLj75HSM/bzer4P7qUen1NUX84zx5D
 48HxMWMdsqgWw6MDjkn1MDieXuIZZvDZhD/xbwR5NhgHXnqqqDcTAGAhLcrfOcWy3tR5WmWS4Mx
 UL2LlHxCpitsUHFbKYiFMj1xpcKlhDU9s9tMhUzY2sPJkxKsfSPxXDWeKK/pAHpnEHYAfx9sVNn
 bkVDtM17ihNkBdoRtGNqZQgmhOhOd+BstfvH9NoUWvrKvhuUDxbnQXNyoSKp2B3J9Uq6J+vONLc
 Cj2cfN2MTHVt0FN4G1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040182

On Fri, Sep 4, 2026 at 12:56=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> The vdd-csiphy supplies power the CSIPHY blocks. CSIPHYs may be
> described as standalone phy nodes carrying their own supplies, in which
> case the CAMSS node has none. Make the supplies optional; existing DTS
> remain valid.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.=
yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 126400772d028..57a838fe2d229 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -186,8 +186,6 @@ required:
>    - iommus
>    - power-domains
>    - power-domain-names
> -  - vdd-csiphy-0p8-supply
> -  - vdd-csiphy-1p2-supply
>    - ports
>
>  additionalProperties: false
>
> --
> 2.55.0
>
