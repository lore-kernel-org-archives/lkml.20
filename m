Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332123A1A3F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791476184; cv=pass; b=PLuNiPlDT1Pzv1Li5alcaGmnws8HvmdlZbnkQdj6EygvpojAH6XIVMEYu6B0j4JSDB/gNTyIMwTVK7er0HtBis3xKnEqg89HltB9szM2OMkDpabn/S3EJe5w34MbjnPmVWmYQSH/QY67SvgC93L09ezXM9U+fENt+M6JDyRs0JM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791476184; c=relaxed/simple;
	bh=4UcVlB2cCLP3xE4Txh5cS77n0o3Nb1N17SI+OkKi1aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQkzYEfxRJyf3S/qDeP6Nl8iYbEfOQgFJZ9bWaPfwHQK+rkXtEKhtYZw7sNnOvULF0LPNWbxUx+EuUnKeBzyXarVywoKfXkGcEWc+/O4ISPWvdqfoBBw84ReexxdRJH9RsFQ7/zWn5STapR6HQQZP9o2nV9EsHqQdGE+erm4eqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X41dZKE7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TrbHCcPx; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X41dZKE7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TrbHCcPx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVsEW3517922
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 16:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CbU0lJYZtBCXZZwP4Xw5k9X5fdFy/cckD1fKYuY3e1w=; b=X41dZKE7G56DEpSa
	3NlRUDTa1qAo0JFVgCkp0lF7n/jpX+F7TnteOLeg7azrxb9MGQ7hesWNTQ1Npg/x
	QnbJ1GBJ9EoWvrMhY8ydZ1OIhjUXG2fYKLbJ79v5W6eqBivh8NBowdADfsJKQoQE
	F9oO9P5tXGqvHns7ItdXHWfuf9gfn7ZCoK3O+m2u8s2q3YQiiJ6ZA38EhUR55Ci6
	apkO10GZlfKsEuj7jpKetPV3ZfnBZWoWHo1g6oCfjvM3vCFsgk1FdyQHFHH5+n1x
	/iaFS9cHunk0ApyydqWxorRl4gvWoCIQ/skxKHxuOHwRXdnIlE4lIKd8BvjJbLc2
	uA9Kag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe83mw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 16:16:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc359d9easo910933885a.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791476177; cv=none;
        d=google.com; s=arc-20260327;
        b=FJumjAH9mCesyDzFMWFfORnLZ21t6e9xj+VHn36zTEPPW9WiT8W0RuD6Hz7m2UQsQL
         AutGKZgeSUYAaToeHJYoFeUgHD21DLALQogKiEMb5BqGUloTaRMYHkEBgSibFkUFDIV6
         r0XPv4skPNGGAt7dxlPDNUzttgBgOWZOQDyvOdUoeOP5l4OGvyyZV4YAsKpsV7hnngX2
         wU7N3NQkM2OMhORsbGwLEUv6Pj4LdbF9p7QIm54fU+WpO7r2Y7jvihL5yCRthJzH0YP9
         ADY/cDsxY5EzYsh+3Q7AtOOEAWRONKVSSDj4j2wJbo7aiQz7g5IP18ao6EmFUcT5SprW
         HTag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CbU0lJYZtBCXZZwP4Xw5k9X5fdFy/cckD1fKYuY3e1w=;
        fh=U9wrLpM/Ls5x7H1qupivQgTm2ZlUPdcjt2AAwFxZALk=;
        b=jq1tq8NpihPpDSvWHNeJ0yakKekkFgtrAf+v9guFw6QCSFpiNQEoY6ZkkWMs0Emtxa
         EJL6apjz9nhMEpgMdibVfeFkWdMetGvSkDIH1wIpvwUO9/iRyjSzUKu/fS9Cw4pntpTa
         05TLnqKqmVOK4+CMFZ4MjucM+4SlRJchErtiihKRkyP1Ame4lp3ZSpIjhQnnQpOlfy/H
         9q8FFG9wFWCidTO5ZheTd2g2p3RWk3njGnnB8Po+XVzJrmRAfVNtyg12ueabEEJV78g1
         4SC/h5IXVU8tD+qH1SIguujlST3G6bJlfd/MBE0emGGSontd33jqROe9mXGCkCJN5Yci
         VTjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791476177; x=1792080977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CbU0lJYZtBCXZZwP4Xw5k9X5fdFy/cckD1fKYuY3e1w=;
        b=TrbHCcPxphClJtJOGJqXmo3wSDnSAJofBSuoIhHiZSKnSEfSRTaJhuUhjzsIvLifxp
         kwbND/NMvZ3JZH01xEfCN/3KSAAdrW7KFYI2xJJ3JOif9NkIWw3ij7R19ckLYeElpbwa
         bT/Bz8QcoYGRFZCtrmRyJ6Y9ys9JB77E+1gbiDlqE0D9Er9BkR6FpNvhKElMmgPpm/e8
         3hy+ED681LmerGdsdgxojtskzmCZuTAIqxe7DUGWiEpDAUsDsn/pQbrfLrwKkZOkyExv
         rz0yy3TE1KFPQLcc/rEvh+erKsiqqaR9+IVr80SbFuZ5o8C4GxfG4r3olFZUUs9/p+Tu
         wD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791476177; x=1792080977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CbU0lJYZtBCXZZwP4Xw5k9X5fdFy/cckD1fKYuY3e1w=;
        b=EU/yPd2CE2LKZ2znxc7KEseHWh/xDuBqf4kURjKEDZ+qVJCewqJ5WWkfIcTTCjgADO
         /FBEzKtnSX1Vmv4sl9qTroecN+Fex83p98F+aziMFVojFvW5KN4/guh9Nd6akFz8Hbkr
         ui77NVxJ4ELpWlEzKlBLcFQbpDcg5n0ZcOU7VfKQKwPl54VnuD8+M+GXyFM0QvvZR5ZS
         +dqN6YPR7Yvaw1QR7sCOIfe0ox7+7lqylwqxQDDFQVb5f1VQhxoSLTwl/y3fUgnGf/6E
         QjJIdHIk8wV1BgAPQAukS7Luxir4shBOsNGTxRd4vEkVAz2HkEEOIaaBjQ/Y039ebPSz
         X3Sg==
X-Forwarded-Encrypted: i=1; AKwUvBzQnEX9SGtsx1RjTCAY+4ugUSZYGkZe2mWVKX8EdeMDtyWxvP8dEcaKlOsO9tzCMh5PY7+wipxqtkLpcQI=@vger.kernel.org
X-Gm-Message-State: AFuF++l0ERHfDClBKlaAvnFWpUZFBZw+WlZ/8ygbpX5CXbg75iVGrJB+
	ORzgndDKz8NIRW0wx4PEnmWpLNyXSxjyzy0bhMZrRNkzu+b7fmo7v1TEgTZkG9wvf1UfMf2WLhG
	E38kEHh3Tp84jwHWppFHb/Y11i0vFMkPBTHwd4iWZPfJ9BpxB3YPET55/aXiYXX/wcG/7qGX4lg
	+TEv1tvkqvIiC4hzocaAKnT5ud9N3OQz76ynyQPnSgolqTMtxGtID5/js=
X-Gm-Gg: AYBFou2RSDUOfkZILjnxQDJWeyTHRc4LOOeWVlFEGOUdZ6CQGZARFFbTjbRk4ml9h5/
	jiWLnNUKtSVgJ5XaCGyz23KEi+SYUF+reaUPQL4nlBt/Hgtshy1JzBeRXSkXmpKZqIupBWETLLP
	BajzwWQIIIrnq1uR0ULeHPncHofFyVTstQcm1BpyL1tF6bnqywdczocT+gN7QOprayPkQMNWUBu
	0TPVhsA8WdNhThEhMJkorlIZBjNGbqtGuL0ZWaOwQogdwmrctQ3gz4Yqj2hxpYYMhF3ugH4ig==
X-Received: by 2002:a05:620a:1b95:b0:93e:6ff1:b67c with SMTP id af79cd13be357-93e9b6fe9b5mr1129816885a.20.1791476176921;
        Thu, 08 Oct 2026 09:16:16 -0700 (PDT)
X-Received: by 2002:a05:620a:1b95:b0:93e:6ff1:b67c with SMTP id
 af79cd13be357-93e9b6fe9b5mr1129807585a.20.1791476176220; Thu, 08 Oct 2026
 09:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com> <20261008-kaanapali-camss-v19-11-b2c583ef50e0@oss.qualcomm.com>
In-Reply-To: <20261008-kaanapali-camss-v19-11-b2c583ef50e0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 18:16:04 +0200
X-Gm-Features: AclHuK8xPX1fq2zZxMczsT41ze36xa1GC9o3axR6RZnV6IYgcR5yxVQaSUmjzvo
Message-ID: <CAFEp6-1Voqn3yFse5t82UOX7MVafkhL466BkEDSLVRH8OK132g@mail.gmail.com>
Subject: Re: [PATCH v19 11/12] arm64: dts: qcom: kaanapali: Add CCI controller nodes
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2NCBTYWx0ZWRfXwyUwHq1vv/cn
 p/8iaZlkFw2lS7kxCc7DtKayULRrHFtVN8MMliHdTbDeFkv1iraeXQCxcQLljYEOrpeKmLG2+M9
 6MjF9apUjhkTYUxy7mKuwp7H3SEYmDLIu1Yfn6j+thJNocGzlKtTcWULwm411c7LOvmWcz2h38U
 QfVos99/cUg+2K+ixTKp6qKVfiyPmZHpwP9Me4deL4c5Sj2uiNpqZYTxbe6BTiZUFF9GWRa+/OV
 +uoSpjK2S0dnMfW7JyxhGI5UPfSbM8z/H6dKZyLHpnzg40+HjLW7NtiHRQcXT1njC4X/QjK/wyQ
 vGvDQOkcgtpHq8bttmyo+7qAn1+9PRrBzQpCjXExJWzVEd74waJCr0BK65zOVLsGZydn/yTEs46
 g88x6goP+wOHNQVzQ7XrwOrZ+UyJjwnCErQRFrYVly5SHarqBiVPdZylGPD9dwmO1LBM86w6B4R
 wTcMJVBHx8Vc0tVbyHw==
X-Proofpoint-GUID: FQrVzS_r0m6TwZaCoGAliOv247L_kHEc
X-Proofpoint-ORIG-GUID: FQrVzS_r0m6TwZaCoGAliOv247L_kHEc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2NCBTYWx0ZWRfX0P8v0bop8XNh
 YeX6RZj7yoefZDHGNqldnhEvvcRWlTQYapEbjNF2HX2H4tFZFf/rVtMLjQtFr7bu2D/5hC2Dmag
 aKbPjtytQI5PJb33UBgqfNofKE78oX4=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac7c1d1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=fkeUGm9nBk2YKbx3A_4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080064

On Thu, Oct 8, 2026 at 9:14=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Add the three Camera Control Interface (CCI) controllers present on the
> Kaanapali SoC. Each controller provides two I2C hosts used for camera
> sensor control, so define the controller nodes and their pinctrl states.
>
> The first bus has two CCI bus master pinouts:
> cci_i2c_sda0 =3D gpio109
> cci_i2c_scl0 =3D gpio110
>
> cci_i2c_sda1 =3D gpio111
> cci_i2c_scl1 =3D gpio112
>
> The second bus has two CCI bus master pinouts:
> cci_i2c_sda3 =3D gpio113
> cci_i2c_scl3 =3D gpio114
>
> cci_i2c_sda4 =3D gpio107
> cci_i2c_scl4 =3D gpio160
>
> The third bus has two CCI bus master pinouts:
> cci_i2c_sda5 =3D gpio108
> cci_i2c_scl5 =3D gpio149
>
> cci_i2c_sda6 =3D gpio115
> cci_i2c_scl6 =3D gpio116
>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 303 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 7e5106865e7e..710af0597aaa 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -3749,6 +3749,117 @@ port@5 {
>                         };
>                 };
>
> +               cci0: cci@941b000 {
> +                       compatible =3D "qcom,kaanapali-cci", "qcom,msm899=
6-cci";
> +                       reg =3D <0x0 0x0941b000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_0_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci0_i2c0_default &cci0_i2c1_defa=
ult>;
> +                       pinctrl-1 =3D <&cci0_i2c0_sleep &cci0_i2c1_sleep>=
;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci0_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci0_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
> +               cci1: cci@941c000 {
> +                       compatible =3D "qcom,kaanapali-cci", "qcom,msm899=
6-cci";
> +                       reg =3D <0x0 0x0941c000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_1_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci1_i2c0_default &cci1_i2c1_defa=
ult>;
> +                       pinctrl-1 =3D <&cci1_i2c0_sleep &cci1_i2c1_sleep>=
;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci1_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci1_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
> +               cci2: cci@941d000 {
> +                       compatible =3D "qcom,kaanapali-cci", "qcom,msm899=
6-cci";
> +                       reg =3D <0x0 0x0941d000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_2_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci2_i2c0_default &cci2_i2c1_defa=
ult>;
> +                       pinctrl-1 =3D <&cci2_i2c0_sleep &cci2_i2c1_sleep>=
;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci2_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci2_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
>                 csiphy0: phy@9523000 {
>                         compatible =3D "qcom,kaanapali-csi2-phy";
>                         reg =3D <0x0 0x09523000 0x0 0x2000>;
> @@ -4459,6 +4570,198 @@ tlmm: pinctrl@f100000 {
>                         #interrupt-cells =3D <2>;
>                         wakeup-parent =3D <&pdc>;
>
> +                       cci0_i2c0_default: cci0-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio110";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;

A general comment on the CCI DTS patches: why are the pull-ups enabled
here (for SCL/SDA)? Do we expect boards to lack the external pull-ups
required by I=C2=B2C? If not, enabling the internal pull-ups seems
unnecessary. Also, what is their effective resistance on these
platforms? Aren't they typically too weak to meet the rise-time
requirements of most I=C2=B2C modes anyway?


> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio109";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       cci0_i2c0_sleep: cci0-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio110";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio109";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +                       };
> +
> +                       cci0_i2c1_default: cci0-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio112";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio111";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       cci0_i2c1_sleep: cci0-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio112";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio111";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +                       };
> +
> +                       cci1_i2c0_default: cci1-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio114";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio113";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       cci1_i2c0_sleep: cci1-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio114";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio113";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +                       };
> +
> +                       cci1_i2c1_default: cci1-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio160";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio107";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       cci1_i2c1_sleep: cci1-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio160";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio107";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +                       };
> +
> +                       cci2_i2c0_default: cci2-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio149";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio108";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       cci2_i2c0_sleep: cci2-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio149";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio108";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +                       };
> +
> +                       cci2_i2c1_default: cci2-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio116";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio115";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-up;
> +                               };
> +                       };
> +
> +                       cci2_i2c1_sleep: cci2-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio116";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio115";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-pull-down;
> +                               };
> +                       };
> +
>                         hub_i2c0_data_clk: hub-i2c0-data-clk-state {
>                                 /* SDA, SCL */
>                                 pins =3D "gpio66", "gpio67";
>
> --
> 2.34.1
>
