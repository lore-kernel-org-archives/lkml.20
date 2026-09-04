Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7883456DEB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514918; cv=pass; b=ndcxAJDnT9PYoKEBfBocsNm4+jq4ac25PW38KYrkN/hvKs93p5vl3Fd/Q+TiAtW/z6kqiTEa9nEAUtc4D7VuZPwpP607fmFddVlrdqYG3fsr+NzBOowQFeorn0KT5VveXF4IsbFVC0FkiaFG5OG0oYmouz8rc9QR0WsMv4/EpDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514918; c=relaxed/simple;
	bh=qRGzzdaOPo3OS6XeDCZ3Be7zPlIFi7jn0EjMfIZ+rxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JoFLt8L3hX7dgR58fMnaSnOT6GI2rtzoxYd2Zd6FUL2udPSg43J2/+e4znDt+SzVNjguS3iEi9NIcrKE3qW+nqwlwnKWun/GFcNde8m/h4HuNfIzo+VliGQe/iV/uLl5blf5Q9c/FgKi2gcinHWggRyaPsHOnx9WHpdB9c5gFzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuzxoCzS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8NNo92Y; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BuzxoCzS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8NNo92Y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mqHf2430193
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 09:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tj5w9Ay0zp2EkGqnRPIaa5YhxwHFgmpY35Ucat+9+Y8=; b=BuzxoCzS6uD10tGP
	S8/k97MAZ6tZ4xbSJ8ip7+J6EK5FS0J8ZDtPEoqRSTaaqEw11Ym2B0A16de2cARK
	3qwh8/KmJ9oHXTPF6+gK1hezY2WJqW1ELNPbVtpzosFgJDiU/NzE79hCigLbxjXu
	dcU1UhP306/q4Uj5JqeJWcmivQl9ri1vRs9390ykHBoBcFsuz8wICFQl4mpgp+AU
	wcupHf46/e3HCadlTy8zT6Fv3zk5Fy1xZTG0lirKzwNty/8PIFjgYjONMaAXVWhd
	UZWV66rxUmYq33OZSS+m9kFB5lUdX+ym7T0QcdtI3ywuUX0Ru95RXDUHztk17VXw
	EWc70A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfk921m2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:41:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d932ef41c4so14181355ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:41:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788514915; cv=none;
        d=google.com; s=arc-20260327;
        b=HeuNUFMJO32RerXrdYOaGvsay7YjC+h/pg4J+JWnfeUCp6c5PHMsSIuq21EtzItao7
         yGVZl6ZvWXBObNesMip68TpxajE5wkpMPRHUs5YKDJaWf6OEkAr6JYa09JrYKEVX+7a/
         ZmiIDTFCXbVdfAhKDFG9Q2WMYRLG4hRShH4mt+TtC6IgIGafcs2p8M7pR0vHYHizcrTl
         V+CmFfc4NylnI90JPW6v28OL9jRPApovwOFy7ovl1o5XX9qHN0CpRnxcSRur7KZCBEDT
         0IpsJvPMo86UJ91byQAKDbSCSjSHo70Z2agmepsm00qkIcQP/fO9llMsBmGLiwmjwbCB
         AXpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tj5w9Ay0zp2EkGqnRPIaa5YhxwHFgmpY35Ucat+9+Y8=;
        fh=6fXQX5lO6tzO3aIsC1D9tujmjQqI+H4gUsCPCPMNoI4=;
        b=p4tUmpfbfEO3Nt6sPNx9WtVUo22aIurjdEdrfqnmrY/46H/2jPhUVFKoWMriQoID7R
         RYr37/vRakY9rDY4gLriDeLSrGw2eV1orFyWC8/DZvFmLOrfnhoJrYZOvZYIc4yU8wTf
         r4Qx70a7G6pW7wjZgnVf4Ew2kcglRv+8ljIj5NL9OrxB2X6ySTVnGcxNh6TUBN8Ahqzn
         JaiQq9n6oxx83N+ak55cmsCuDfCJjnVkzvdixbiZLZH1yT3FsdPZI5LWC2vorf91+2SV
         AagtX6TkUghVrp8NEbJA3uHK9+8qSdTcn5g7NKFNyhISmLTHb7QNb3RlQ7qDFQy6O/kv
         I2uA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788514915; x=1789119715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tj5w9Ay0zp2EkGqnRPIaa5YhxwHFgmpY35Ucat+9+Y8=;
        b=J8NNo92Y2zT9FO2JwSrjM75XtDkISaPbnv61Z1/oHKFd+mdAMxk4cdzkfZ4nd9Fn9z
         CWxNXZ14tDqUlKhDLMZiSBAbdGpCntzyVYaTS/CV+GpCmt4Zq/gUa3zikkrXDHsD4Lo6
         QZRWKWfxIRIZn2T6kTyz3EuLYVzRo07ajmPZgFGV6v1d+BhiPO6GSjqyV533wRznU3RC
         KuJMrz2Ipsr6F8m4ZaX3xBxpjysuUQgrZJc3gHGrjG8TtKlpmfLDugZxRmDz7hWzV/62
         fA5lC9PENMrdpupmgcnWYnO2WVc4ygJdH+jrLLLPF/K2njUkopO8XeZ14l0Ta5c461zB
         50Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788514915; x=1789119715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tj5w9Ay0zp2EkGqnRPIaa5YhxwHFgmpY35Ucat+9+Y8=;
        b=K8M1iXi7/YzGnc8y0ltu6+1OlZpAU8VNIIpTkSJ2Ebjs6FC39KDYNmFwOm9eae52Cx
         vMQr6gmQxAlCp8Vpv94M3fqmwAMM/wBOcQZe9uYMyYeEfZavkDS+sHa6I/8YxuLOlFRm
         EzaX16QI48nDtmgbtGRGbK3LEMqBEZGn842K93mt/yvVBLU2vaWSdUKAerJUYkoHWQh+
         7qAUHTwYh1QmZ6NuJl8Nyq1sJ5gndv7V0sLhbQY4hxOQNlK4v2B4s/3LHdP24JOS17Yf
         IXyiTfZyZBrhQjX2nG3Xi3dnyicQ5YAK6E4DBHnGasmYHRKFBxUqnendvz8LUO8cyOrR
         n6Zw==
X-Forwarded-Encrypted: i=1; AKwUvByzzYYPpCsWbNkJcBfXYHQKAKp5xW+A1fsTZfCBQSl0yavDTn9Be4RQw4ZHhSEUPZGgpO7FT8zNlKjH2ms=@vger.kernel.org
X-Gm-Message-State: AFuF++luW6TBcAVxSSXbb29/rRKrHudzt6FEIO0ZC1ppQ2a4eCgopwJD
	wFdAQZkQK4wuyQAGGoGF9NUgGfuyRETTfD6Pzj/IJEv+tohVRla0vV67tlC10bT15+WGNtI3CTD
	VlpYQPyHLr0PZWDkDqdcfpIl+Sr6FfyFbcSpAu+0PJ3I4E0LWG/2nMITMH3OnZDc5XcfVl5e4Xq
	LQkJTxhYEk3lqki1Jx7e963NjGjcb6MycCXG01ZvpXzA==
X-Gm-Gg: AYBFou06QKp5b2EkddytXvrQoS8nCih/buS8cdi+FfioyPxCRvIfZl7bhEIfRlVtk6n
	XXsMUV9rJs/kpNdY2vxJGwx3Hd/WJTFYAQaCqpa3wAaT11BqVpfjaCvV0q+4Km10K08E5yxNZ7O
	CMwpzX0pgTfqd7Tl3hSRmIOYZ2qkh2/bIy0WcO0Px7iZa89Sv6J4XB5aOJNQ==
X-Received: by 2002:a17:902:d4cf:b0:2d8:d4cf:fe4a with SMTP id d9443c01a7336-2db15bd9addmr33760775ad.16.1788514915380;
        Fri, 04 Sep 2026 02:41:55 -0700 (PDT)
X-Received: by 2002:a17:902:d4cf:b0:2d8:d4cf:fe4a with SMTP id
 d9443c01a7336-2db15bd9addmr33760515ad.16.1788514914955; Fri, 04 Sep 2026
 02:41:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806162202.657512-1-jm@ti.com>
In-Reply-To: <20260806162202.657512-1-jm@ti.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:41:43 +0200
X-Gm-Features: AcwNN1WuovdSU_2kEKvHD8EEYyXMloGWDohy5Yd4DT2AHl_0YEhIymeBDEfX6pI
Message-ID: <CAPx+jO9bWbwzZqgjW1pzYwD4OfsHLBuxEEsqkvzLgF0NLT4Rmg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] mmc: Add power_off_delay_us support
To: Judith Mendez <jm@ti.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX2xejiwztZObu
 UgKEGGUQsl1ZdnVuTatuwkLLYAKkHMhEH2aBYYCDSb+eoRcDfHwqr4v9RNeTSPFqOAWuCMuxaNB
 vxI+msQFx/2ko2g4ijv/MgASW6c9LPTSuCQpPA32SPnWtS8ujotZP9fKdOg7V67miT4R1CRECWC
 /OrZwGME9eEQHbN+3Qz1o2uKqstbMRgT5XSHmYNmNPeA8TKILi1eN3DsH7jNGbFP/kfUy96HKzj
 5CcxuQ6axId+DB9lNaheKq7sn4UA3t8AYfRPegUeqPL7cqg/AtDECu9sF156Fwc1ylWOEwMG2hy
 Mdy7BGT8XBVB9cpJr10Qp52uUGo+QMcpRxALWEhvVcjgEpY4yJdLFGw598MP9K2ZUpiMLqJcrCe
 gh1F6LsT7ItJMUFiJmBgObgEROi8vex6B1AfY9S9Nr6BIsUFG6FYDWMRkTuDP1rLRzVr7X7iL02
 LHDOtbGuRARxQDOLXVw==
X-Authority-Analysis: v=2.4 cv=Oc2oyBTY c=1 sm=1 tr=0 ts=6a9a9263 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=Z57f2_SGLxpEgxUGCI4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: zWc5BQnN_7SF4JiUwwES8QZzfg2k9oYW
X-Proofpoint-GUID: zWc5BQnN_7SF4JiUwwES8QZzfg2k9oYW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX21+oIPlnqlb/
 tUR3+9NOhq/xMDzmsyg7Xtzaf/Tq3qe/5ZfcYXAPjHXU5ahj7UcwJ94N9UA1xkwmGcsx1rgHkLa
 k7ciCr38/YgvCQ+tvuQE3wnGBpJO9E4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040088

On Thu, Aug 6, 2026 at 6:23=E2=80=AFPM Judith Mendez <jm@ti.com> wrote:
>
> This series adds power_off_delay_us support for MMC controllers,
> enabling boards to specify custom delays after MMC power off to work arou=
nd
> hardware issues such as slow RC circuites on MMC VDD rails.
>
> Rather than adding host driver-specific workarounds, we abstract the
> implementation into the MMC core and pickup the delay value with a device
> tree property (power-off-delay-us). This allows any board with slow
> power off requirements to configure the necessary delay without code
> changes.
>
> The solution is minimal and follows existing patterns as with
> power_delay_ms. The allowed minimum value =3D 0 ms (early return).
> The default value is 1000us to not deviate from the
> original 1ms delay set in mmc_power_off().
>
> Link to v1:
> https://lore.kernel.org/all/20260716232641.2659710-1-jm@ti.com/
> Link to v2:
> https://lore.kernel.org/all/20260722205701.372789-1-jm@ti.com/
>
> Changes since v2:
> - allow 0us as lowest possible value (early return)
> - Change custom logic in mmc_delay_us() to use fsleep()
> - drop dt parsing checkers
>
> Judith Mendez (2):
>   dt-bindings: mmc: Add power-off-delay-us property
>   mmc: core: Add power-off-delay-us support
>
>  .../devicetree/bindings/mmc/mmc-controller-common.yaml | 10 ++++++++++
>  drivers/mmc/core/core.c                                |  2 +-
>  drivers/mmc/core/core.h                                |  8 ++++++++
>  drivers/mmc/core/host.c                                |  4 ++++
>  include/linux/mmc/host.h                               |  1 +
>  5 files changed, 24 insertions(+), 1 deletion(-)
>
> --
> 2.54.0
>

The series applied for next, thanks!

Kind regards
Uffe
