Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353242;
	b=Yk66qhZHID07s4PwnXyGW1SupTtYiO9adw9r5+54B2XOdJpPcS7tl5JKhMArUum5PyvH
	 XYIsc6j2HE0dMQANZFpHrTD/6vKvyVUjr8Hkd5nT/emqq3xiW6+3iy195M8qb6nd+e7Ec
	 BAEDic2l1wAP8GPenhByXS69Zx16Y9EQPDNg6V90TrUyeaYqUBhMv6YyVAVc2O212lnpC
	 ojU4hfb8aIodnowwxZN2gbboIbyTcjHcXY3bQ9S6XZtfhHWng+u+MUZhyE7bYVxZhrVbu
	 jG8WLsHzUVatpcw2CF67A2zIbFet5jacSR5cr8pB8WbikBJ1vz0FEl3Gz4v0hJlb+cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=;
	b=dhcwTXYc/h5ra8VAgla+e3o7b0CHIFr1DbEb1mcvF+W4PbxRwu11YjCFbSg1o9lCt7Bd
	 +Pw+cCNPMuczrw7r2IecAUEVeu1I9IVuYzVY4eelXFk3u3ONuv3DAssFOLhvKYctoAcZk
	 McVZirT5A7o+ykSz8Yk1HLyxCLV34yk7gMfxeZw2Zmrcvs0L3AWWsy67fPqyRpjKME8Do
	 YhJaBsx/I/WOD5dHG2YtdHXH0cjOzKHhz8j6MolZcSG2wFN5HSPDFTblxwnnGo9lGLyLI
	 kiE7AKjsliws4xvxJp5ZvX6cw3HN+SPYvWU0UAgwxYwGnVcChMAP55sjWqXL6SAPAUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WDUyCTsk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FN5uMiVu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C77606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06C77606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WDUyCTsk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FN5uMiVu
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F2Y92134481
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=; b=WDUyCTskAnFWcD6H
	yNvcJUWE4F/A/qbRutoL34bToGe02+HXlmv1F1CRPWAAQri30zm+jlTctGK7kGTv
	u6UEvMbQICt/EWnVZJhpuUaHwfuIxyvTe9DE5wywkRwG4F+uFn4tR2QusUenlij4
	rQjcLRRR9TsDXlTmBusCR9j67p4eDNcEaLbDt4mp6lSsLHTRdVIz97u3Y3/XK7y8
	AH4ok8+XLI+ZPOXlbyLCTXg57B93rOJaAdlRS3GPPZN4nqVasr8R1OpP8l7waXbu
	1nlf846OjVYCsdMMzttrjRfyL4wj1/3t8s2mWwf90IECJfKpT2fx5BNpmMJ+ssTc
	LN1YBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj8pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb71b1443so89899785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793353240; cv=none;
        d=google.com; s=arc-20260327;
        b=ggN9rp03w9TwbwqY8vlgmSltR79T1XZteXoVFtapiQFKvsVe9CpuS8r2b5N0lelU+P
         nKhK5Bb0F3bdQETTuvvvdE99/hD1trWnaYY0XYweherD/jLfrzLKEpbGes1adG+wTI/h
         Xohs5LgY4CmyZtLmCRk3epWFc8RUSWYHiI3ev3/6fsH9t0+Kp1WgCKw8thBI71x/AKv7
         nKrW6nfzRyJpBmbhRiHPNnJOX7m7zOwkYHsDpXRG3+E3tzjD1WsOnctJY/MfeQ55kYI6
         9fM0GU9bF5vKoR24VPzgq9N//+fpjiU2mlFWoDkSmUT/yNZzOLhuWEpRFkitx7VYCYl0
         /0UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=;
        fh=TNDbnvNEhvAh/kRCVAWFJNMcFo/RlUYgd8GozgIKQ44=;
        b=JFa/YI+RgKL3Ir/mkaqY8z1j5q6g41JYUX2nqIx0izVLCGXgjvFt7EnPMfRH8+3K0A
         bIHvQERNh7NhUIa5dYZ+Z/aIKpHg/nZ3608/T3N1+IZRT/lpL7//saychOfWIn3ldBXX
         Xm3TfKxtLIsnCky60dk2O1o+s0wU9bcX5gryH8SfovYfwEAEJTzEz7nLNrDKbCV5CCRo
         gSEN3ikmXcNtYXZuZ49kPKEEG7BJG7S3WmfgU0hrQFGEfku9KV4AQuLxpxzcviKSjLuq
         23WL0HeL77c9Xcy4uQT8FsevcZHrucOM4wTZ/7xRRoQfZAEI3agpK5qdPfk2D2/6CELf
         OTgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353240; x=1793958040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=;
        b=FN5uMiVu57T1CAppK/bMjDbtJUI2ISEL+MqXc40uaLLJ8uvqHOiz6sH5V+dEUoRkrE
         mvHzYusljoz8/9kU2QXAjDm7r3KmuOv4ZUyY+HhDWPxwOJSzWg+s0RazS1Ch4HUXazps
         HUv/Mu8dj/iM3/bHVb0k8KErqNIkQqY98HH3ObovURd3MO8DViUFJbDubbHkeQUxzbet
         tUfj6yhKqzPc+ch1b984Hq5mKQAV35akLWYNCNko4KGTp6bPcRVZw9qAYGrUYH7UOiyU
         pmK9oaRN2Dg/OYxT+45nOkb+/T54ZFKP9Fq6x24OfGTMNmLltG5W/8Pvlyt44x0eYlnC
         AipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353240; x=1793958040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=;
        b=FX96B6PiW72sgM7OLRZ5iQm5e/2jmh3J9+Rd9sFdYUYbNO9xouP1s5hZiVZSTN/KLz
         ryC/UKXpzaTkCl6YvzEN4RDLr28JODQ+Xv6hXjerMUg4IrwJvY7YgesSMDQAM6IDLWRR
         XMiD43UY6ePhECtHkx1qeRevg1hpsPKQWWJoEQKcI+yaB8TmuIHexW59L5r7XlGZDxgG
         4HJaiE7VSLVdFMMX0jTmVR2/UNbyihs492MzW9YfINjGZAGe4jKHsBVPKnrfa/dAMnvO
         glIad919WB9p9P+lBrosQ+WZwVkn0B87pS4u2Z8xdRnxIU+sZWyzZd1U5NoeaB47bPSW
         LURQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQpoPivmAnFl2088UHWc9xBNXS5Mt1DPjWwmz90U1xCzmHlo7ULoEt3e35Q+ZXmRz/yGNh10x7AvRezjk=@vger.kernel.org
X-Gm-Message-State: AFq9FYISKX+r7wHbH8jHu3Kv94/+99OTY22t9Uzue3S9Y3lvPNnWBbor
	Ep93z+EEL61XFEIuDxe610ffhqVdlMxcWo6lgfn96diZ4uevfMtVvCJeqeOjnTYbaIMtXucrGbS
	Sq4qcJiWk0xnq9Y0HMDvmIqycUvAMTtcCWh5uTk40HQZWgf+US8bWKpOHBjSV+6oTIbpRrlJ40S
	q05GveGQX1Q0K07ZvhylUvjgNQxXOeYUQTgavLsft7Qg==
X-Gm-Gg: AYBFou26v2NJIr/MsQbq3XXSwaO4UamK9hpXGtnv1ryDTWsMpxyBzi70F3rFr1wsf17
	+sJTTGMVu/EX3a89YBuQc4xhE2W7dgV0+o8VN4YfOgsTNS4EM5PjQc1lPIQckVqupmYRdrasJFn
	BfdO1mszagIPTqPWMBlZm3Ffu1B5HpxAC0BT34XqIlnUib/ARZ1V0tzen7paluHsgcunUfxLzu1
	7p+qhI+y+yWUeBNyJBbIBR6dMNtr0T4oe+RztM9luQ4ABqYH2agGJ+0/K1uu20RNnTuT8WUm2fc
X-Received: by 2002:a05:620a:444f:b0:93f:5717:e7b9 with SMTP id af79cd13be357-9442177e372mr252813285a.30.1793353239929;
        Fri, 30 Oct 2026 02:40:39 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:93f:5717:e7b9 with SMTP id
 af79cd13be357-9442177e372mr252808785a.30.1793353239275; Fri, 30 Oct 2026
 02:40:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-camss-fix-v1-1-ecc170342d0d@oss.qualcomm.com>
In-Reply-To: <20261030-camss-fix-v1-1-ecc170342d0d@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 10:40:28 +0100
X-Gm-Features: AclHuK_Nb7z64_X16sSt8eZ5KfEgiXwPK7nYj7Hkj0Nd7L6xMjrKtPUseHaWH2s
Message-ID: <CAFEp6-2b8M48sxvV-bux_cxBJ-jzpputHdJrBORJ4d1w51nzSw@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: vfe: Clear active buffer pointers
 after flushing
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXyDGncvaqlis/
 xVINdFyFQWa6mmyJUreBqCm6sflW8RbBoselkhoECVn6nzHTR/3VtjFpoLHu+KnzGV7O3a6oQ86
 +wo+eKI/bbKLnGNBLc5rAoX4faDQKlmpjrqEnF7woqLtV+pfnMfXZQ8O88H27di+sSZtb5voEjt
 Kf27W5FDySbwAP/Ml/aIVemfmrE61Ix20gR081JUby3qST+xcgh99bu9HvKKITE1e9NWe4eVcwH
 yHh7XogJVDwaWj+ulxE0+5ihqQ75+RubOVuEVMqwKLpzu4RQvFchR0a3xodZ/VYiNe0xekrDssc
 rtmReGTVnDfP2uzRICMaPSkhLl5d04GmiTQJqElSvQXiq3/J/otEJAZpYZ2gll5t/PVukTPX58q
 /m3Xm+8yFETMrxRIWX+wEgpu+hwvqxwIsi3bdxqVlB9OY9QOI+gqlYf8b7P5vKPUJCtXrEvaRX2
 GAOUjaOi5AX0OUD1r+g==
X-Proofpoint-GUID: BESaIwHhIyuIxSXA0zJDdK4VoA0Oexa9
X-Proofpoint-ORIG-GUID: BESaIwHhIyuIxSXA0zJDdK4VoA0Oexa9
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae46619 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=7MKz-gpKVdlp02d5jGsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX1+qreA2uqxlJ
 iBOpZSuTwUc2ah07Jb4RqPVT0aoTUobu1hn26uf9m9AOTOsBDRbsZbFkhOT70/zXqrGqDMhmQ0V
 /h9xtCkIRkdE5LthFZzn6pTvnh3EUMg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300038

On Fri, Oct 30, 2026 at 10:39=E2=80=AFAM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> vfe_flush_buffers() returns all active buffers to vb2 but it leaves
> output->buf[0] and output->buf[1] pointing to the completed buffers
> despite the lost of ownership.
>
> This can lead to subsequent flush or completion paths operating on
> stale state and potentially completing the same buffer more than once.
>
> Clear the buffer pointers explicitly.
>
> Note: vfe_enable_output_v2 is supposed to overwrite those pointers with
> pending buffers when streaming is restarted, but nothing guarantees that
> enough pending buffers will be available to overwrite all entries.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-e617a776-3d96-47cb-8d60-a769340c2=
5a7
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")

Please ignore this patch, wrong commit command....

> ---
>  arch/arm64/boot/dts/qcom/monaco-pmics.dtsi    | 2 ++
>  drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot=
/dts/qcom/monaco-pmics.dtsi
> index 361f5163b6d91eef794d3bf86b374d4dcbc6d60f..1ed4de00b1a3e23e1ef0f1c41=
2a2e29bf840c870 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> @@ -58,6 +58,7 @@ pmm8620au_0_adc: adc@8000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         #io-channel-cells =3D <1>;
> +                       #thermal-sensor-cells =3D <1>;
>
>                         channel@3 {
>                                 reg =3D <ADC5_GEN3_DIE_TEMP(0)>;
> @@ -112,6 +113,7 @@ pmm8650au_1_adc: adc@8000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         #io-channel-cells =3D <1>;
> +                       #thermal-sensor-cells =3D <1>;
>
>                         channel@203 {
>                                 reg =3D <ADC5_GEN3_DIE_TEMP(2)>;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765fa2c8f3c2b38a5f4f0e0bcf4d873..8e297e2bcafcbf30b09fc2ad6=
e57f484a4e41898 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1187,11 +1187,15 @@ int vfe_flush_buffers(struct camss_video *vid,
>
>         vfe_buf_flush_pending(output, state);
>
> -       if (output->buf[0])
> +       if (output->buf[0]) {
>                 vb2_buffer_done(&output->buf[0]->vb.vb2_buf, state);
> +               output->buf[0] =3D NULL;
> +       }
>
> -       if (output->buf[1])
> +       if (output->buf[1]) {
>                 vb2_buffer_done(&output->buf[1]->vb.vb2_buf, state);
> +               output->buf[1] =3D NULL;
> +       }
>
>         if (output->last_buffer) {
>                 vb2_buffer_done(&output->last_buffer->vb.vb2_buf, state);
>
> ---
> base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
> change-id: 20261030-camss-fix-4972697ef90e
>
> Best regards,
> --
> Loic Poulain <loic.poulain@oss.qualcomm.com>
>
