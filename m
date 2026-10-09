Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F89E3C9893
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556434; cv=pass; b=aQ1yclSOxtYygIe4tVS3Y5QIXez3geGNy7YIAc172ARmk02MUqSW/iLSKYmWMnG+BjxzvAKIxrDQA0gsrCwuZqNBOpeilXBn2VvsmRhmee7tZjzpth73BJRknkF68xgTlRqLUxRarTRGCDAtbgB+bJjQQ09C2IXjI0HyOMWbCw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556434; c=relaxed/simple;
	bh=NZeBJC9QSEBrvBodfj4dor8expShVcP7Yt9IwugqSeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSkofU5tuaEnX7rt/kFBkTBe+DrP+DWuRbAyYxGLolDB5xgWH7WTeGD1F5zdwXkLBLOA/CRKNqhn1UUZvavXA+Udu3pCljB8w3NoNhu5Drsu2Q+MtjisSePeixUL8DEA+2Uy1yDeCdpC1vL0wJimBPEAzlX3CMqP/V7tvKZsTIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahi9aH3/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DjIqEqr6; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahi9aH3/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DjIqEqr6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DK4WI1754490
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 14:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vp36po/cz04TMtA4qWYnSTEK6SQr6l93s1NVoQTANc4=; b=ahi9aH3/VFaXEAr5
	8I2va2ktkJ+UNgIhUkf332tEbBGJGMS3n3T9vHBLzRGvj47hq5PjQO8vWDr4n54u
	qbe711kjDwiLaPSdYyO2MYgQteioYq6WvMvHAvra/xOV+P7e1mua5dqaz9Hf1nNi
	oGx3Ej5UtMdt6+R9RbBcHGEjY+157e4ozXPU2lznlMFpRyVaeOTOKgYTxWmn8dvS
	dmqkK/Ds7+63M8r+JHAhUtMjWGvx1JH7lTj0SiPeV+e0Qx+S1abEE17qoBBnVUcx
	92vY68O56UVYbPAQHDSbiRirux34GWUoJ3SKQI+tCe2188ovFRyVEA20IzPA4G6g
	8sQK4w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6x6wgwr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:33:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e61a8eb087so39150125ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:33:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791556429; cv=none;
        d=google.com; s=arc-20260327;
        b=AneNnPPZEaU3EGz8XHajBm/7vqUskmK47XFjiOPttgb2dYdbDv+Lx80DCOp/TG3mTK
         Yp/GwuQql2c5HwEgD28wNi7HgJ6MnTZAKRUJh/+qLi9ZD18k5nYAf6CFCvuRpTLG+9j5
         5+RS6EHnaxFiRpDKbfnaZZH0XEf06jmiIQXlI4gHzhId+pJzG+BaETvJBaTP2/kyZ6xB
         /YCCT+De1mBD1n3XQe8fqXEaoSv9EYyKW7hJwQ2jHsXUcNVqaHraKqkvtOHOSX+MjcGd
         xauhZAmtqroIGwhPXjSx4kb/u2ETl8JB7+1UUA2JQGZADuPYc7Tnnut8H8V4YxbksJDC
         52qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vp36po/cz04TMtA4qWYnSTEK6SQr6l93s1NVoQTANc4=;
        fh=/1uJASjEvNNHcoJ/CMJpb0+o30YEQkum6VM5I0H8KPw=;
        b=EqflngD6lCTf9kTBorlr6DPrpIdldVy87df7S8v0ysO7LGXMNBmW5yMfxhFSh2pXI+
         fJJ1cJ9t4hH3EHNLPeLryPmZSHGq58jYYj22HLtu+wX5OTHJmzC9CtPWWZvim3eOMzZL
         h6l4FKxFf0aGGOAn9gT0NkX8EIQ6pAf1jW4E5KoxfZFYVmy3cPiwekEwef+l1Tkv8LCl
         H0sdNz5dWOE+uAxNnkCLtxO8UTi7it174I4+Sd9k3UB3TC2rHSsUn9f1GR4WX3ocftZe
         pPtYlqS0dyyvlDL5idiVSdPPzdds+pdYMvpYqSg139ekxHc5plPk01recWRu0uJPX+EK
         sNOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791556429; x=1792161229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vp36po/cz04TMtA4qWYnSTEK6SQr6l93s1NVoQTANc4=;
        b=DjIqEqr6nVS+ZY5+N3x6I2n/fZt6atAdPgyhhvG+QYpCu087f31GjDYnbpud/z7IBA
         Z1txkQYRLCRUkMJ8BjiMdrHvO0FCqwJvX7DATJth/xnFfznFArCHWAyjg6VkD2HVzLop
         1BB3cxPgzs9MqpOFi3gRFXX2Hpf3Qb/9VcaPe4cydj7pKewsUtGcDRWdGtCv87d+CICP
         sNojgypPBbjDTvdN2cUYiLuiBywxntUH/XzY6SPQnPqmm0zrBGbmSzSk7q6Y37eVEGr9
         jjCHasmVVUECxZdsf8brZb0uXS7VA1jDeg7u7LxwVPb/JeuMwae9htKRbxScStlgd+B4
         heKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556429; x=1792161229;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vp36po/cz04TMtA4qWYnSTEK6SQr6l93s1NVoQTANc4=;
        b=IaO+sma9e1zrEkUJms7z1iIguPFXPI/7c5UEkFnhh8xvoHfw40O0WkKvxdFNYP1vRt
         T8f7rgdmJIdpmxfYJgbNvJiQJGvM/dnQPFgsEFfLo7n61/c2zUQSkgOn8DrJEAWMCbDl
         Dcy3NNiWXhsZ3HhdfbYqVvZ296YWLfCGcftRhjIFMvZdq6MpntwK8vxSyM9W1USrHLl2
         BCNa87zcSaRaD08tpf9fjssw+TSXF7uVofv47RnBX8mqhZmd7+iW2Dmj7OWBQchgCGUj
         sT2E+PkWOFyPdM6PeG0JnSNZ5AVRamxSnALe7oH+GR/5l3W3jGvpGfIsEtRRy37bImf7
         avig==
X-Forwarded-Encrypted: i=1; AKwUvByf8oQuyElGdS1jGAafA+v/xpRL4cPQn00gK3cQoqQRjZieKXqYn5qbpK1PXTJ8f5+YVaAbiexeX70nbM0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQCd8vU50i4Pa3E6BIhIqDCFhrpHiE9lWizM3xxAYIHFa1WeyP
	vyp4w7rhTWyRcY8O4LdCAVtnJHFOWRlUymkB/GjnHZqBpS+VvO9pdQWuh5LRL+C7VBGUMhMQFka
	I+78Mpj2Vlm8M7OpOI/5uHsr5s3Bep3lciHrBpAPn/IYjV3Z+xjnhdm6AD+DtcciMb7ZJ6xJu1C
	1olsxffPLavLZjnLgBK9IAjqHutA4/1w7nmD0Sd4AOrQ==
X-Gm-Gg: AYBFou2rp4eD5p+wT38wQurSSSDwniEDD5BVbdoFKaAr3AjJEWo2k+0zrjTqsgZnMM+
	YA2qBIw+eqzA5OHBXAimR8xxmcsZn0CcDbde8nChW1IGlgBHunu81vkeUGGv9XT0VLoEl23PC0F
	qF18jwTSDgnMWkHU+hkABLrh3nICkfYXwoAm0CNKUk8zpwTCt7Y5Coh1oFhA==
X-Received: by 2002:a17:903:2f92:b0:2e5:98d7:8202 with SMTP id d9443c01a7336-2e842cd44b8mr19508345ad.13.1791556424439;
        Fri, 09 Oct 2026 07:33:44 -0700 (PDT)
X-Received: by 2002:a17:903:2f92:b0:2e5:98d7:8202 with SMTP id
 d9443c01a7336-2e842cd44b8mr19505565ad.13.1791556419166; Fri, 09 Oct 2026
 07:33:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-ux500-power-domains-v7-3-rc1-redux-v1-0-5eb1b90bc35e@kernel.org>
In-Reply-To: <20261009-ux500-power-domains-v7-3-rc1-redux-v1-0-5eb1b90bc35e@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:33:28 +0200
X-Gm-Features: AclHuK8BLLsnCLnhdwop9PNp8hP17bfQmxcAxbY57H8p7JbbxjDD7-48aE_iQho
Message-ID: <CAPx+jO9BiY=v=BQ20qjgmq6SJ99NK7krTHTMdGcTfR_dshodJA@mail.gmail.com>
Subject: Re: [PATCH 0/3] pmdomain: Basic DT defines for ux500 power domains
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NyBTYWx0ZWRfX9v+jKBlZHT9s
 lyVDZbxIQDZpNrnLlsjPgVolIxUMY3PgIuyiHirW3vuJWY267wxozSH5LIHL1BinJykAhvDSTrA
 2JmNh+VuRwkzdlHrhJpZwVAI661oh/4=
X-Proofpoint-ORIG-GUID: CMr9DNF6KAEq_Tu5XgrvnXlJ9IVkBL17
X-Proofpoint-GUID: CMr9DNF6KAEq_Tu5XgrvnXlJ9IVkBL17
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NyBTYWx0ZWRfX9K7HG2+qKBSR
 CEfQbq8Hk+zbahhtG+7qNmX87j72qBe7Q6NM50RPvC75BqtjjNwzfkW/yNAvVwil41Peo5NWB2H
 6Brh8Fhjm+kbDYbLeZAx5rH9wSfenJnWyW5q1ZiZuCtTa/TFRCrsa9ICfz/prXnVMaJI4kXKT6R
 FLz0brR3AKXn6N8ZmQUCWRfdafPsrEiHKAKw2vJhZNzW6rZAwrk0IU8CRjuaHLELTyclUREltJt
 bi7NhuPVeOus+Wf9oYfphImZra/OHCMyvFoeqc0dqfpSlnsbiWz8F4VtFbkEN73KsVyvEcJJXw8
 gft2PYRLE6ClV/urxcF5WbKRVxxtw1THg2efsV0qybEaEv3RP75iiVux8q8M5w7W2wZBpg29kqa
 s6N3ppCjzhneeHd82+plfOEieBsv3p/oQKai+s9dUsbQf+z5KhYSBJfURDeOGfO48HK9LWhugLK
 4quvfuJrDdIRYlFSmkA==
X-Authority-Analysis: v=2.4 cv=ad30Dhot c=1 sm=1 tr=0 ts=6ac8fb4e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=XH1a5p_xQohBom4lpSYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090057

On Fri, Oct 9, 2026 at 2:15=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> This is three preparatory patches for v7.4.
>
> These three are an excerpt from the earlier sent series,
> updated according to comments and collecting ACKs.
>
> It also fixes an urgent dependency (my bad).
>
> The main ux500 power domain rework is targeted for v7.5.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Linus Walleij (3):
>       dt-bindings: power: Convert Ux500 PM domains to schema
>       dt-bindings: arm: ux500: Drop NR_DOMAINS
>       dt-bindings: arm: Add the actual power domains on U8500
>
>  .../devicetree/bindings/arm/ux500/power_domain.txt | 35 ----------------=
--
>  .../power/stericsson,ux500-pm-domains.yaml         | 41 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  drivers/pmdomain/st/ste-ux500-pm-domain.c          |  2 ++
>  include/dt-bindings/arm/ux500_pm_domains.h         | 17 +++++++--
>  5 files changed, 59 insertions(+), 37 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20261009-ux500-power-domains-v7-3-rc1-redux-acdf755a5efc
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>

Applied for next, thanks!

Note that these changes are also available on the immutable "dt" branch.

Kind regards
Uffe
