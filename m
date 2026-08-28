Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37166199920
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906289; cv=pass; b=JmnIIotM468aIG3u00rfHmBqtPOJiSJgSIJ7x/OcvxCp0rev6/jPDS0HLP0y7yxQfrmZLw3EWMqYHTlRIUn2/6w4/4GF0d+L5Y4irsQtnDg7dzC+ADsg964++LvrDi//j5TnfiuSijD4qNPMuJ/6EV0z3HPhFj5tI9PiM0a3Ch8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906289; c=relaxed/simple;
	bh=Ov7oNLMXlrDII+yjoRbu1WpWpBvD+/TAzTcydjCpFgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXEbfYdMJXjJ+FkMHbS/ibqlDcrqCU+i3PnuJZHNrcVelccLRZDRqpXCXWbMKHmFWFRV59ApL3F5NoRvo1cF9IQmaK3TpV0IZ+Sm3xYen2yND1amXozOVOXAQ8N9qZ58wO7t0x9VlXwxCzcbdqGilVoJDdghcrSn7lCvFiIb4v8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fL9UtJfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EiiWbcOP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fL9UtJfQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EiiWbcOP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S85M6k1894870
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QaKy5r5sUgNHinEqWyUrjHzH93zojyTrqfcdfZ0ImOs=; b=fL9UtJfQBopg+Dyf
	KjIYOkoCrV/CAztJwATKLOt8FKtaJ7OTm93FRB3aZlVth5qyY6FIXSIY8JmjQ/eG
	SVee5/Pawj6P5JoW4//IIEFaM8JMWoZnJiGH5KYqD+mhZBl21DGfpm7nykBSKuuT
	kGdDl5iAZ2UjnkzgVgURpSvsjBfsTEPDoQh7zgbcjVifKdwd6wcSt/KSJ43tkotY
	503Cc0f/AwnCNdLDIpjz3TqRDGZYaqyslyoZjMn5xPJpkhbLCiOndwzMQirsntZU
	l5ubctFuzWSr9Nkoggez7n6sLy3cyO7+J+2gexOWX9sHmswI0ad8C4kmMzOdn8vj
	Thhopw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb6h0048e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:38:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93903622880so205341185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:38:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787906286; cv=none;
        d=google.com; s=arc-20260327;
        b=XTyG0jPoce38dPFOMUFopvN7psHQ+DDtPV6smki/8xbc2vpzdl4xfkfTSKLnhL9a4J
         BqwYsD41eqz/4wlf6OOaHZolxVwE92T2eCMXJopJEv5sT7jkkO/kPUWM5uq9Qk4gObuV
         5UMA5SKMvItahYLBfqEt1H5saK0h0lQBnqeuLL9NRMjcmq+l+DIDpYGoDT8CgyHnEcd9
         dbVVc3KdKGS0QSHEcCE2HOZ24pamMWoqQo+q5GbAURATv8k6NdiTJgBBNT1LdmCS8+JU
         fffiDOo/9gnyDAKMWoRJQhdVhLXosUghOba8uHBwku2JwAfbVPk/PWMX56ixpy5RGkup
         c3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QaKy5r5sUgNHinEqWyUrjHzH93zojyTrqfcdfZ0ImOs=;
        fh=7A80qtM/N5uLT1eT8aj8kB8vvqMYYwzqpcO3YZjwcT8=;
        b=DEzV9RO9k8ybTzjckO7pc0xmQQqLRHXwvW1eUBrHKt1YgxO9w6MGlaMEOQDBPydSc0
         td38YHajxBwMQQLyCzyEUwdNbzouIsSnp+uq5tjT2kEZuI9sQ7TSrLAWJiUxbLSJqEv4
         hja5kt1VxR80Ldz6zBNRvV9eLEJ7CoOgozMyqbXypQuLMGFpdDslct7gFQB6HKk4KHAL
         Nb6JsXZoTU0AUYZI0EqKKMs70ywJPk2L4ZIEGm2AMR0gTFxfeAR1USDbWcgkGOGXRFXV
         rzWiV3PyNTpiGrwZN+BIewbeDGVHQ8SfZ//0pgiARaJkufyoh/7dALGDdDCpeuHFNiJ8
         6OMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787906286; x=1788511086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QaKy5r5sUgNHinEqWyUrjHzH93zojyTrqfcdfZ0ImOs=;
        b=EiiWbcOPXb+a2xQOewQEL0xw22PGH3OB8o9n2cVW1lmrJ7aLOQYeY32M0z8WxLXus5
         Je9IqCmhv7avaQt0ZW9BMPPavt7JYg7vtas7wgT4l0xJ921YPQkESHeioTXEREvBMqMR
         wvkCFRvCX41pMTTpjJVrDmmi4jKMh0wEiCD7KrHaD5c1dbJA++JmbktGQe5B9HtS9oiN
         PgLrxwI5X/fa4x77Cyc5Gyc7jYFtURrVxI+Or/3QoUYJ48TQxQSKSkX+x329tX+7FREn
         odiQ6gn0VL/2yaXEd5KjI7nA4jMLde5UcIM6A/fBcJ7CtO/11BTS5S+kEDSoxCgjlOQi
         7QmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906286; x=1788511086;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QaKy5r5sUgNHinEqWyUrjHzH93zojyTrqfcdfZ0ImOs=;
        b=LVOxnuPdvX3DU0OELqH9VcHAWoIcwWOKlbxIJSCjdl/1Yxx7xiZKMhuuIVWnUBx66O
         6v6s9G5m8KC+Qg+jXhLMy2jC7k0iYRfV6zNMyYtCvFq6sovFQMd9/Ji9ufv0HUPGhTKI
         HPl2womTyZqxoDJ/HKECdsROV7DAlcW+MQICPm0Kw8It8aaIYKJ1IDjG5TECGHISEA6g
         pa0+TIXlNZQz3l0gNnFe5jJJXRDUsgTX2cNOE15rexhOhERZZvo9lAEctGy/l5o7eFO9
         afE5dzJgxRwyEQUNr09fj+Dq5hpH7tU+T0JYgMgyokrfU77qwx+UKDRny3GxbxBR3hE2
         MVvA==
X-Forwarded-Encrypted: i=1; AHgh+Rrr4bKYQjC1pVa7uQopW/E3mwJfU1u8b29U5Cn04KybT+ZTPAVTk+GZ0q+Sj6vr3NfqCPjPZ7YyHzzaoLo=@vger.kernel.org
X-Gm-Message-State: AFuF++lZcXoUGRLIx1P6HXQFosUmEwhNx4vQ+2/nZ5cMRRn3313NvHzl
	hPzh2LcDGXSuvILL9aHUZmPMssKuFHLZcmUK3r9qQK5inr4WVRafwQKwYAiD6rgK+CWTN7hj+Tz
	aaAzG7LDt8vqQy79bkZYkQktsLGvV6o8LJCcgDgh+lbof5oEA8XaGFoau1pBhwLCR2ET9IYzXpw
	GOEeJnwe3o9KvgPHvdpkIFSoblusY1tiGOpO9c+CMrFQ==
X-Gm-Gg: AR+sD13Tt6JxAHFxdxSjmhXYixxHPC2NwdHRscZtpISRCuW40wrstrdGw6Jbuua/JFr
	9uHdDHUvfJhjQeLY8dI0JyRvUffV/nxfF7Df2tzU9nhQEUrk2Z/vzoQ70Saf7DDJqDRbCOE2yVj
	crvOIl02uSU9wWYMeGLNwoCn5hC0m09ujE7jiEquQZUS6rPSEadvjbLJVzF7sOm/X3K7ivPbvwy
	rOxfQhOsWT9ZcMa0g+MFT+ZfP/hbv/HgJ0uTKzu4qhkb5+K0zdS0+D4OXRB6WaGHax2dqUbEaCl
X-Received: by 2002:a05:620a:aa1a:b0:937:17f9:da2 with SMTP id af79cd13be357-9390016b299mr1349501685a.6.1787906286360;
        Fri, 28 Aug 2026 01:38:06 -0700 (PDT)
X-Received: by 2002:a05:620a:aa1a:b0:937:17f9:da2 with SMTP id
 af79cd13be357-9390016b299mr1349499285a.6.1787906285947; Fri, 28 Aug 2026
 01:38:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-agatti-audio-v3-1-47337097ee53@oss.qualcomm.com>
In-Reply-To: <20260820-agatti-audio-v3-1-47337097ee53@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 10:37:54 +0200
X-Gm-Features: AcwNN1Xrc4yuLFTSexVNFwDPpWatuABG_1Mx8-1NlWVrfGRZ6KtGSzjHOyIqCdY
Message-ID: <CAFEp6-3O_L0dSqGWxg0TKOBTWMeAm8epikTzRBWa0DyJcQ3MLw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: agatti: Add memory-region for audio PD
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ky2c8vFSwjmwYcGFBwyShuTANeoaXS2G
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3MyBTYWx0ZWRfX3Ot8X4hYaK4I
 HOE/EA569c3AjnVLhH2ldRPWOdQKENp9YsDgdhmaWNw3GcY9Q1GF4E/9rZPr72SQvuOB9r/Nhma
 FSOPL++qnZjd89hIg5d3LbqDirLRWf0=
X-Authority-Analysis: v=2.4 cv=KPpqylFo c=1 sm=1 tr=0 ts=6a9148ef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6amzoLWt3lXFUk3ngxoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ky2c8vFSwjmwYcGFBwyShuTANeoaXS2G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3MyBTYWx0ZWRfX+9eBC1Ko/GLP
 OcwBp38M6wcy/lwJCOMjQUd29HG1aIbGzqh+JPk8c7X/MR2lnZqBtpQQHqMgsyaI6hf092lEBe/
 1/pVrrB0a8ZDB37D/MTRKCUaZTH3eWnnuOM61Av9/OdjC0ZRrxyvvlhJhfqv6YXnC/UiZzLntWq
 0T5UFF378lR8GXNzWV5gy3YGExs6xjZ6MJRLJ1qvGKD0lEQDVoEtGwOclH+6S+zvcjWTYa/I7X1
 iNh1htpjTK3Zv499JyhNtRq2GWTMIvjoW0xX7MTBoRubbSoolXpkkntqiVeeWjMMBiGdUe1G0Dw
 94qOvfpJWC1IdEmAIIbsEwj80rvIwoIGm3qqHG8Ky4IZQ5aFMERKfvA0HcAwfGhQNAo0ukZlY4g
 FZtiUPjUgem62QM/oEkNhCKX5ojhdbpWeTXUjowEs1SXGSemOBPIMix6dgxBoGa8kuC4Sx3vTOz
 ozw0OwKMm6kDGI3el2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280073

Hi Vinayak,

On Thu, Aug 20, 2026 at 7:52=E2=80=AFAM Vinayak Katoch
<vinayak.katoch@oss.qualcomm.com> wrote:
>
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.

My understanding is that this patch fixes an unexpected reboot during
the launch of the audiodp service? If so, should we add a Fixes: tag
to make it eligible for stable?

>
> Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
> Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
> Changes in v3:
> - Changed alloc-ranges to <0x0 0x0 0x1 0x0> to cover the full 32-bit addr=
ess space.
> - Collected Reviewed-by/Tested-by tags.
> - Link to v2: https://lore.kernel.org/r/20260807-agatti-audio-v2-1-3959b1=
ab8059@oss.qualcomm.com
>
> Changes in v2:
> - Fixed VMID list alignment.
> - Link to v1: https://lore.kernel.org/r/20260806-agatti-audio-v1-1-cd6766=
cc9ccb@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/q=
com/agatti.dtsi
> index 590bd2432d85..d010ef7fdf8c 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -381,6 +381,14 @@ rmtfs_mem: memory@89b01000 {
>                         qcom,client-id =3D <1>;
>                         qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMI=
D_NAV>;
>                 };
> +
> +               adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +                       compatible =3D "shared-dma-pool";
> +                       alloc-ranges =3D <0x0 0x0 0x1 0x0>;
> +                       reusable;
> +                       alignment =3D <0x0 0x400000>;
> +                       size =3D <0x0 0x800000>;
> +               };
>         };
>
>         smp2p-adsp {
> @@ -2348,6 +2356,9 @@ fastrpc {
>                                         compatible =3D "qcom,fastrpc";
>                                         qcom,glink-channels =3D "fastrpcg=
link-apps-dsp";
>                                         label =3D "adsp";
> +                                       memory-region =3D <&adsp_rpc_remo=
te_heap_mem>;
> +                                       qcom,vmids =3D <QCOM_SCM_VMID_LPA=
SS
> +                                                     QCOM_SCM_VMID_ADSP_=
HEAP>;
>
>                                         qcom,non-secure-domain;
>
>
> ---
> base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
> change-id: 20260806-agatti-audio-357bcd74ae9c
>
> Best regards,
> --
> Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
>
>
