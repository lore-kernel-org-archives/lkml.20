Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090DC4E36C6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613897; cv=pass; b=GksR8XVyrBNOF0NaTzKVlp0v3FkZH2t3S1Furlk8gT5nvLQHbkN3KP2NCfOG5PlSzG1oJ0W5pEvdCoK+Mo3sSXGWA6AF+4QDjroPxY1ULRKGKs/Ke/bYLNI9quI5mpJNk04DNAF5mz1bLUECjTceEPFufJ+g0wAldJo59xBTlNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613897; c=relaxed/simple;
	bh=EaxUPj0cOTIo54ThKVZmjz+JnuJs8bTET5cQacKmnzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlR31J64HEvHG7Kvf5T1XbSSFGsk2RDVMV//UchX43QF7vjG9xaJJtudNl9mxw2ceuC9IM9l06lfrG3unMxptXM1BaaCSqJD/3GUHVC0KpKq1VLPB5obrA+X2ehhfkMgzJxiXgapVrT86XZWILi9Gf6bhnS0M9dscLdD8CnlWF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XL7eUX0Q; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XL7eUX0Q"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a49573b8bdso156920a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790613892; cv=none;
        d=google.com; s=arc-20260327;
        b=Z69Cgsp6qq9DWrQ7HD+cGjQ1+OsUdOSOtWbDOion3NMuSTkzFyZBjaTyChGHlB3BBe
         ZFhSnu/u2fXD0ul5iVqfO0GobVK0ONhqlL31PhfT/xxaH8HEaxRYyn0Eh7QIHatLvRmi
         5z3/yvQUbbv5hSZH2UQy0Pt4tNwGNvdnMMRkfm1uU5aRqgwEU7GrjuIK7pArcbpsNUfY
         2F38sdgwz5JUwB0Iv0cEuRX7TeViuN1N9hLEh/PyIwHcJ7aq25Wv4Fm8ThP1wpcyn2ZU
         Dgv+433P80ByeLe5wIbKn5dT4vLwagNBStKSnyqAk7980QxhmZBGjCL4s2kLIlQ0DSOk
         LBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CsUgMhHpaaEpWizS6QJlvlLWYt/9ppvAI/iaUS4iPck=;
        fh=VBJUoU9xAlYIRyktlhiSJIflHbupMc1HZf8kzCC6Fvg=;
        b=BKQUc5JLApYNElgMqa8s0Xjar14ExWfNAjBEYWmpJEo3wOdlEfQOalCB0MMT1/xWmz
         FdplVuSCNeEzYqC8oz6OvCTWqBwM5T+H+8pc8Sf3zjbfO8hW7pX5rV/I3mJ4+qtjdYfS
         FVb4XwpKZTdQ/TovkJVVIvQ3HVHD2c7BksTCoMQ5/Cf1fGb0oIOlC200P+b7LtGMmz8J
         Z2h6ISedVgiu8Y34zCjFvEVKtnj7hX2EH/88KIlkdrmEh7MbDs7UbSfiPedJKk/xvv3+
         Xx6EPZ5ilUPAqZ6WZPzjjv/lwGfjBR2m8qa5qAQBJkY2rCsHVufgP/Jc8HACauRiJNIL
         GdHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790613892; x=1791218692; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CsUgMhHpaaEpWizS6QJlvlLWYt/9ppvAI/iaUS4iPck=;
        b=XL7eUX0QNJWAFBTlGY2E3janNW4JxrcDwWWxgomveVNHQlYI8pp66LJTGOGdnrMdI5
         t6miEe4JtoXTAz7rBhmRkVabIiHVt70lcoUj/fKP3cHTx5yJPBhIk/lP3fjRNVqSZYPg
         vYDdBL0/IO+kRqeNrzIR4C57EYJAToryXqdCWZjiBdhH6cQawgGfbaT3yVgyQWshyp0r
         4tj13y1Yfef47laqLWD9CoBfqdZuxR0tM1cdi+e0j0zH4tfhk46jRMtXRGdpiOHB2bOT
         JCLIC6uFhr/LfyllfX93rmtqeaQl4Qyyx3q5BY3g3H0qIkcj1ZwDRT32lAZSJU/N99wa
         yPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613892; x=1791218692;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CsUgMhHpaaEpWizS6QJlvlLWYt/9ppvAI/iaUS4iPck=;
        b=1enVX6zxlDwNvFwBQj51HQzTl/pb0946O57DibkbUJ2sApekMJZYtTd44RulErtlBA
         eLtsWj26vBf7UDXJH2L3nP/Eip5CmNRXPxrZWBEazO7Xbinm5lwIHjjka0sdjTCLLpXc
         YOVpW3VfWnnii4x7V0egngJHNbdaR/uDMhfcVHUnVJR9QabjgifWxXF2c4iWGQPs2URS
         sUvpnroJJ8Rar2QHpnoDtjmeceDWTBYwKmu0gIlbHZegpKtMnqbOUK5K4IXN01FWXoiY
         oDKI5OGRzJfVyrkvcv2Bv/qujKko6LBPq0u5MphlM2zciOSR8E4/8RadLlpySlDD7fO+
         R+dQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzHLXYLi+i3eyyJK+N9tq8Xj/8xnp6OyrzVRCU8At0ZkoBphK76FPJFQ3xBklrr7ZyMxYqhRvV1/lGrlU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrCIoNfpg46qgbeAbwWEnrsk7hVKKoHQveR1PtSKcbKr0sLqBC
	UBgLo7NfctBgj6ICqKxwBfTdbpwUFmYo4InxJv2r1yexeyL2m6eqwkrl756deYcpkw0cLAarrr9
	DBSppmkn03vmsgI7RQMZbS2wJPO+HXjkdlBsPoSXOBQ==
X-Gm-Gg: AYBFou3rV6BULGxRJB+gJ4umLnnw0RtlqLUuMhYTY2VMM6eWPCedpc7vnhSYEEx1AE4
	YROnc+aeZGdHvLrb73+eb2x5k7wvwm/ETxOd2Km7jpoGjK+l1tvYMr2MIEdcZUR8RFrj8bIBnNt
	GZGr3ZN7sgQYCy2YbNdFBF/mPjnvfz3kkXp3DLHc/MELaC5dLBa4pRVOAbuuRHyUUImhhv1AssI
	6BDYySTs78uRdPkQUV8fNHfWAbRF3KYXStJdlDk72BJljl3ezc2DLz85+nzyHlkXGhtAeoOkdeN
	9YyLb0KrXiEfY4Vjk0hfKD+5EYzFztm4WdJNyfCPZyZzvOiU2RoYH2dpD2o0/uI1qLYRgcGWiC6
	FhpV3qkDLvVGniQE60uzWJ6ZbpB8V493RKvwB16YnoeleBUNNz3FDNB9C9y9mw7yeBUxhrSRiXz
	CH8L9AKo2J6A+kyrBpY8NW0Qw+ZlNsBIlq
X-Received: by 2002:a17:90b:3bc3:b0:3a2:aec0:6bd5 with SMTP id
 98e67ed59e1d1-3a2aec070ccmr3384282a91.57.1790613891907; Mon, 28 Sep 2026
 09:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920184148.31541-1-mstoretv@cern.ch> <20260920184148.31541-4-mstoretv@cern.ch>
In-Reply-To: <20260920184148.31541-4-mstoretv@cern.ch>
From: Antheas Kapenekakis <kapenekakis@gmail.com>
Date: Mon, 28 Sep 2026 18:44:38 +0200
X-Gm-Features: AclHuK9lmhNriJR9K2qaJbLgngxX9svyQijiGMdYPIjcYpfXmXrxMrd5uzjo2AA
Message-ID: <CAGwozwGzw1CE03kbWJaV7iC=1o0QXg9PpreTunenm-vHPe515A@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] arm64: dts: qcom: Add hamoa Samsung Galaxy Book4
 Edge devicetrees
To: Maxim Storetvedt <mstoretv@cern.ch>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, marcus@nazgul.ch, marijn.suijten@somainline.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, abel.vesa@linaro.org, 
	abel.vesa@oss.qualcomm.com, johan@kernel.org, konradybcio@kernel.org, 
	kirill@korins.ky
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Sept 2026 at 20:41, Maxim Storetvedt <mstoretv@cern.ch> wrote:
>
> Adds devicetrees for the 14-inch and 16-inch hamoa SKUs of the Samsung Galaxy Book4 Edge.
>
> These use a common dtsi derived from nodes that were able to work on Linux
> from the initial Galaxy Book4 Edge DTS by Marcus:
>
> Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/
>
> combined with the patch series the Honor Magicbook Art 14, which shares device similarities:
>
> Link: https://lore.kernel.org/all/20260629154812.9066-1-mail@etehtsea.me/

Links go in the bottom, Based-on-a-patch is not a thing, you may add a
Coby as noted in a parallel thread.

> as well as a few more adjustments on top of that again to get additional features working.
> Special thanks to Jesse Ahn for helping expand on what would eventually become this dtsi.

Hi Maxim,
I tested this series on a kernel with various other backports on two
european (norwegian market) galaxy book4 edges.

Specifically, the 14in NP940XMA and the 15.6in (not 16) NP750XQB.
Specifically, the later is an X1Plus variant that came out a year
later with cheaper components. It does not work properly on either on
them. I was hoping that at least the 14in model would work as is but
no.

My test devices have proprietary Samsung battery controllers
(ENE-KB9058) and type C controllers (Samsung EmuEC). Also the speaker
amplifiers are different. So the battery reporting, audio, and USB C
ports do not work at all using your DTs. The TPM does not bind either
but you do not claim that it does. At least they got me to boot and
for that I am grateful.

Other stuff also does not work, but I am just listing the main ones.

I suggest you change the -14/-16 suffixes on both models with
something more specific.

The prior patches in the series look fine to my eyes. I did not A/B
test them, just pulled them in.

Best,
Antheas

> Based-on-a-patch-by: Marcus Glocker <marcus@nazgul.ch>
> Based-on-a-patch-by: Kirill A. Korinsky <kirill@korins.ky>
> Signed-off-by: Maxim Storetvedt <mstoretv@cern.ch>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    2 +
>  .../qcom/x1-samsung-galaxy-book4-edge.dtsi    | 1537 +++++++++++++++++
>  .../x1e80100-samsung-galaxy-book4-edge-14.dts |   28 +
>  .../x1e84100-samsung-galaxy-book4-edge-16.dts |   31 +
>  4 files changed, 1598 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge-14.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e84100-samsung-galaxy-book4-edge-16.dts
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 5c19f945c..d8273f86f 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -498,3 +498,5 @@ x1p64100-microsoft-denali-el2-dtbs  := x1p64100-microsoft-denali.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)        += x1p64100-microsoft-denali.dtb x1p64100-microsoft-denali-el2.dtb
>  x1p42100-microsoft-sp12in-el2-dtbs     := x1p42100-microsoft-sp12in.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)        += x1p42100-microsoft-sp12in.dtb x1p42100-microsoft-sp12in-el2.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += x1e80100-samsung-galaxy-book4-edge-14.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += x1e84100-samsung-galaxy-book4-edge-16.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi b/arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi
> new file mode 100644
> index 000000000..51ec68bba
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi
> @@ -0,0 +1,1537 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2025 Kirill A. Korinsky <kirill@korins.ky>
> + * Copyright (c) 2025 Valentin Manea <valentin.manea@mrs.ro>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "hamoa.dtsi"
> +#include "hamoa-pmics.dtsi"
> +
> +/ {
> +       model = "Samsung Galaxy Book4 Edge";
> +       compatible = "samsung,galaxy-book4-edge", "qcom,x1e80100";
> +       chassis-type = "laptop";
> +
> +       aliases {
> +               serial0 = &uart21;
> +               serial1 = &uart14;
> +       };
> +
> +       wcd938x: audio-codec {
> +               compatible = "qcom,wcd9385-codec";
> +
> +               pinctrl-0 = <&wcd_default>;
> +               pinctrl-names = "default";
> +
> +               qcom,micbias1-microvolt = <1800000>;
> +               qcom,micbias2-microvolt = <1800000>;
> +               qcom,micbias3-microvolt = <1800000>;
> +               qcom,micbias4-microvolt = <1800000>;
> +               qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
> +               qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> +               qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> +               qcom,rx-device = <&wcd_rx>;
> +               qcom,tx-device = <&wcd_tx>;
> +
> +               reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
> +
> +               vdd-buck-supply = <&vreg_l15b_1p8>;
> +               vdd-rxtx-supply = <&vreg_l15b_1p8>;
> +               vdd-io-supply = <&vreg_l15b_1p8>;
> +               vdd-mic-bias-supply = <&vreg_bob1>;
> +
> +               #sound-dai-cells = <1>;
> +       };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               pinctrl-0 = <&hall_int_n_default>;
> +               pinctrl-names = "default";
> +
> +               switch-lid {
> +                       gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
> +                       linux,input-type = <EV_SW>;
> +                       linux,code = <SW_LID>;
> +                       wakeup-source;
> +                       wakeup-event-action = <EV_ACT_DEASSERTED>;
> +               };
> +       };
> +
> +       hdmi-bridge {
> +               compatible = "realtek,rtd2171";
> +
> +               pinctrl-0 = <&hdmi_hpd_default>;
> +               pinctrl-names = "default";
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +
> +                               hdmi_bridge_dp_in: endpoint {
> +                                       remote-endpoint = <&usb_1_ss2_qmpphy_out_dp>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <1>;
> +
> +                               hdmi_bridge_tmds_out: endpoint {
> +                                       remote-endpoint = <&hdmi_con>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       hdmi-connector {
> +               compatible = "hdmi-connector";
> +               type = "a";
> +
> +               port {
> +                       hdmi_con: endpoint {
> +                               remote-endpoint = <&hdmi_bridge_tmds_out>;
> +                       };
> +               };
> +       };
> +
> +       pmic-glink {
> +               compatible = "qcom,x1e80100-pmic-glink",
> +                            "qcom,pmic-glink";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +                                   <&tlmm 123 GPIO_ACTIVE_HIGH>;
> +
> +               /* Left-side rear port */
> +               connector@0 {
> +                       compatible = "usb-c-connector";
> +                       reg = <0>;
> +                       power-role = "dual";
> +                       data-role = "dual";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +
> +                                       pmic_glink_ss0_hs_in: endpoint {
> +                                               remote-endpoint = <&usb_1_ss0_dwc3_hs>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +
> +                                       pmic_glink_ss0_ss_in: endpoint {
> +                                               remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg = <2>;
> +
> +                                       pmic_glink_ss0_sbu: endpoint {
> +                                               remote-endpoint = <&usb_1_ss0_sbu_mux>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               /* Left-side front port */
> +               connector@1 {
> +                       compatible = "usb-c-connector";
> +                       reg = <1>;
> +                       power-role = "dual";
> +                       data-role = "dual";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +
> +                                       pmic_glink_ss1_hs_in: endpoint {
> +                                               remote-endpoint = <&usb_1_ss1_dwc3_hs>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +
> +                                       pmic_glink_ss1_ss_in: endpoint {
> +                                               remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg = <2>;
> +
> +                                       pmic_glink_ss1_sbu: endpoint {
> +                                               remote-endpoint = <&usb_1_ss1_sbu_mux>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +
> +       reserved-memory {
> +               linux,cma {
> +                       compatible = "shared-dma-pool";
> +                       size = <0x0 0x8000000>;
> +                       reusable;
> +                       linux,cma-default;
> +               };
> +       };
> +
> +       sound {
> +               compatible = "qcom,x1e80100-sndcard";
> +               model = "X1E80100-GalaxyBook4Edge";
> +               audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
> +                               "TweeterLeft IN", "WSA WSA_SPK2 OUT",
> +                               "WooferRight IN", "WSA2 WSA_SPK2 OUT",
> +                               "TweeterRight IN", "WSA2 WSA_SPK2 OUT",
> +                               "IN1_HPHL", "HPHL_OUT",
> +                               "IN2_HPHR", "HPHR_OUT",
> +                               "AMIC2", "MIC BIAS2",
> +                               "VA DMIC0", "MIC BIAS3",
> +                               "VA DMIC1", "MIC BIAS3",
> +                               "VA DMIC2", "MIC BIAS1",
> +                               "VA DMIC3", "MIC BIAS1",
> +                               "TX SWR_INPUT1", "ADC2_OUTPUT";
> +
> +               wcd-playback-dai-link {
> +                       link-name = "WCD Playback";
> +
> +                       codec {
> +                               sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
> +                       };
> +
> +                       cpu {
> +                               sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai = <&q6apm>;
> +                       };
> +               };
> +
> +               wcd-capture-dai-link {
> +                       link-name = "WCD Capture";
> +
> +                       codec {
> +                               sound-dai = <&wcd938x 1>, <&swr2 1>, <&lpass_txmacro 0>;
> +                       };
> +
> +                       cpu {
> +                               sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
> +                       };
> +
> +                       platform {
> +                               sound-dai = <&q6apm>;
> +                       };
> +               };
> +
> +               wsa-dai-link {
> +                       link-name = "WSA Playback";
> +
> +                       codec {
> +                               sound-dai = <&left_woofer>, <&left_tweeter>,
> +                                           <&swr0 0>, <&lpass_wsamacro 0>,
> +                                           <&right_woofer>, <&right_tweeter>,
> +                                           <&swr3 0>, <&lpass_wsa2macro 0>;
> +                       };
> +
> +                       cpu {
> +                               sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai = <&q6apm>;
> +                       };
> +               };
> +
> +               va-dai-link {
> +                       link-name = "VA Capture";
> +
> +                       codec {
> +                               sound-dai = <&lpass_vamacro 0>;
> +                       };
> +
> +                       cpu {
> +                               sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai = <&q6apm>;
> +                       };
> +               };
> +       };
> +
> +       vreg_octa_vdd: regulator-octa-vdd {
> +               compatible = "regulator-fixed";
> +
> +               regulator-name = "VREG_OCTA_VDD";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +
> +               gpio = <&tlmm 111 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 = <&octa_vdd_en>;
> +               pinctrl-names = "default";
> +
> +               startup-delay-us = <1000>;
> +               regulator-enable-ramp-delay = <1000>;
> +
> +               regulator-always-on;
> +               regulator-boot-on;
> +       };
> +
> +       vreg_display_vdd: regulator-display-vdd {
> +               compatible = "regulator-fixed";
> +
> +               regulator-name = "VREG_DISPLAY_VDD";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&tlmm 120 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 = <&display_vdd_en>;
> +               pinctrl-names = "default";
> +
> +               startup-delay-us = <400000>;
> +               regulator-enable-ramp-delay = <400000>;
> +
> +               vin-supply = <&vreg_octa_vdd>;
> +
> +               regulator-always-on;
> +               regulator-boot-on;
> +       };
> +
> +       vreg_edp_3p3: regulator-edp-3p3 {
> +               compatible = "regulator-fixed";
> +
> +               regulator-name = "VREG_EDP_3P3";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&tlmm 70 GPIO_ACTIVE_LOW>;
> +               enable-active-low;
> +
> +               pinctrl-0 = <&edp_reg_en>;
> +               pinctrl-names = "default";
> +
> +               startup-delay-us = <1000>;
> +               regulator-enable-ramp-delay = <1000>;
> +
> +               vin-supply = <&vreg_display_vdd>;
> +
> +               regulator-always-on;
> +               regulator-boot-on;
> +       };
> +
> +
> +       vreg_misc_3p3: regulator-misc-3p3 {
> +               compatible = "regulator-fixed";
> +
> +               regulator-name = "VREG_MISC_3P3";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&pm8550ve_8_gpios 6 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 = <&misc_3p3_reg_en>;
> +               pinctrl-names = "default";
> +
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
> +
> +       vph_pwr: regulator-vph-pwr {
> +               compatible = "regulator-fixed";
> +
> +               regulator-name = "vph_pwr";
> +               regulator-min-microvolt = <3700000>;
> +               regulator-max-microvolt = <3700000>;
> +
> +               regulator-always-on;
> +               regulator-boot-on;
> +       };
> +
> +       vreg_wcn_3p3: regulator-wcn-3p3 {
> +               compatible = "regulator-fixed";
> +
> +               regulator-name = "VREG_WCN_3P3";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 = <&wcn_sw_en>;
> +               pinctrl-names = "default";
> +
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
> +
> +       usb-1-ss0-sbu-mux {
> +               compatible = "onnn,fsusb42", "gpio-sbu-mux";
> +
> +               enable-gpios = <&tlmm 168 GPIO_ACTIVE_LOW>;
> +               select-gpios = <&tlmm 167 GPIO_ACTIVE_HIGH>;
> +
> +               pinctrl-0 = <&usb_1_ss0_sbu_default>;
> +               pinctrl-names = "default";
> +
> +               mode-switch;
> +               orientation-switch;
> +
> +               port {
> +                       usb_1_ss0_sbu_mux: endpoint {
> +                               remote-endpoint = <&pmic_glink_ss0_sbu>;
> +                       };
> +               };
> +       };
> +
> +       usb-1-ss1-sbu-mux {
> +               compatible = "onnn,fsusb42", "gpio-sbu-mux";
> +
> +               enable-gpios = <&tlmm 179 GPIO_ACTIVE_LOW>;
> +               select-gpios = <&tlmm 178 GPIO_ACTIVE_HIGH>;
> +
> +               pinctrl-0 = <&usb_1_ss1_sbu_default>;
> +               pinctrl-names = "default";
> +
> +               mode-switch;
> +               orientation-switch;
> +
> +               port {
> +                       usb_1_ss1_sbu_mux: endpoint {
> +                               remote-endpoint = <&pmic_glink_ss1_sbu>;
> +                       };
> +               };
> +       };
> +
> +       wcn7850-pmu {
> +               compatible = "qcom,wcn7850-pmu";
> +
> +               wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
> +               bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> +
> +               pinctrl-0 = <&wcn_wlan_bt_en>;
> +               pinctrl-names = "default";
> +
> +               regulators {
> +                       vreg_pmu_rfa_cmn: ldo0 {
> +                               regulator-name = "vreg_pmu_rfa_cmn";
> +                       };
> +
> +                       vreg_pmu_aon_0p59: ldo1 {
> +                               regulator-name = "vreg_pmu_aon_0p59";
> +                       };
> +
> +                       vreg_pmu_wlcx_0p8: ldo2 {
> +                               regulator-name = "vreg_pmu_wlcx_0p8";
> +                       };
> +
> +                       vreg_pmu_wlmx_0p85: ldo3 {
> +                               regulator-name = "vreg_pmu_wlmx_0p85";
> +                       };
> +
> +                       vreg_pmu_btcmx_0p85: ldo4 {
> +                               regulator-name = "vreg_pmu_btcmx_0p85";
> +                       };
> +
> +                       vreg_pmu_rfa_0p8: ldo5 {
> +                               regulator-name = "vreg_pmu_rfa_0p8";
> +                       };
> +
> +                       vreg_pmu_rfa_1p2: ldo6 {
> +                               regulator-name = "vreg_pmu_rfa_1p2";
> +                       };
> +
> +                       vreg_pmu_rfa_1p8: ldo7 {
> +                               regulator-name = "vreg_pmu_rfa_1p8";
> +                       };
> +
> +                       vreg_pmu_pcie_0p9: ldo8 {
> +                               regulator-name = "vreg_pmu_pcie_0p9";
> +                       };
> +
> +                       vreg_pmu_pcie_1p8: ldo9 {
> +                               regulator-name = "vreg_pmu_pcie_1p8";
> +                       };
> +               };
> +       };
> +};
> +
> +&apps_rsc {
> +       regulators-0 {
> +               compatible = "qcom,pm8550-rpmh-regulators";
> +               qcom,pmic-id = "b";
> +
> +               vdd-bob1-supply = <&vph_pwr>;
> +               vdd-bob2-supply = <&vph_pwr>;
> +               vdd-l1-l4-l10-supply = <&vreg_s4c_1p8>;
> +               vdd-l2-l13-l14-supply = <&vreg_bob1>;
> +               vdd-l5-l16-supply = <&vreg_bob1>;
> +               vdd-l6-l7-supply = <&vreg_bob2>;
> +               vdd-l8-l9-supply = <&vreg_bob1>;
> +               vdd-l12-supply = <&vreg_s5j_1p2>;
> +               vdd-l15-supply = <&vreg_s4c_1p8>;
> +               vdd-l17-supply = <&vreg_bob2>;
> +
> +               vreg_bob1: bob1 {
> +                       regulator-name = "vreg_bob1";
> +                       regulator-min-microvolt = <3008000>;
> +                       regulator-max-microvolt = <3960000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_bob2: bob2 {
> +                       regulator-name = "vreg_bob2";
> +                       regulator-min-microvolt = <2504000>;
> +                       regulator-max-microvolt = <3008000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l1b_1p8: ldo1 {
> +                       regulator-name = "vreg_l1b_1p8";
> +                       regulator-min-microvolt = <1800000>;
> +                       regulator-max-microvolt = <1800000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l2b_3p0: ldo2 {
> +                       regulator-name = "vreg_l2b_3p0";
> +                       regulator-min-microvolt = <3072000>;
> +                       regulator-max-microvolt = <3100000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l4b_1p8: ldo4 {
> +                       regulator-name = "vreg_l4b_1p8";
> +                       regulator-min-microvolt = <1800000>;
> +                       regulator-max-microvolt = <1800000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l5b_3p0: ldo5 {
> +                       regulator-name = "vreg_l5b_3p0";
> +                       regulator-min-microvolt = <3000000>;
> +                       regulator-max-microvolt = <3000000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l6b_1p8: ldo6 {
> +                       regulator-name = "vreg_l6b_1p8";
> +                       regulator-min-microvolt = <1800000>;
> +                       regulator-max-microvolt = <2960000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l7b_2p8: ldo7 {
> +                       regulator-name = "vreg_l7b_2p8";
> +                       regulator-always-on;
> +                       regulator-min-microvolt = <2800000>;
> +                       regulator-max-microvolt = <2800000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l8b_3p0: ldo8 {
> +                       regulator-name = "vreg_l8b_3p0";
> +                       regulator-min-microvolt = <3072000>;
> +                       regulator-max-microvolt = <3072000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l9b_2p9: ldo9 {
> +                       regulator-name = "vreg_l9b_2p9";
> +                       regulator-min-microvolt = <2960000>;
> +                       regulator-max-microvolt = <2960000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l10b_1p8: ldo10 {
> +                       regulator-name = "vreg_l10b_1p8";
> +                       regulator-always-on;
> +                       regulator-min-microvolt = <1800000>;
> +                       regulator-max-microvolt = <1800000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l12b_1p2: ldo12 {
> +                       regulator-name = "vreg_l12b_1p2";
> +                       regulator-min-microvolt = <1200000>;
> +                       regulator-max-microvolt = <1200000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +                       regulator-always-on;
> +               };
> +
> +               vreg_l13b_3p0: ldo13 {
> +                       regulator-name = "vreg_l13b_3p0";
> +                       regulator-min-microvolt = <3072000>;
> +                       regulator-max-microvolt = <3100000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l14b_3p0: ldo14 {
> +                       regulator-name = "vreg_l14b_3p0";
> +                       regulator-min-microvolt = <3072000>;
> +                       regulator-max-microvolt = <3072000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l15b_1p8: ldo15 {
> +                       regulator-name = "vreg_l15b_1p8";
> +                       regulator-min-microvolt = <1800000>;
> +                       regulator-max-microvolt = <1800000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +                       regulator-always-on;
> +               };
> +
> +               vreg_l16b_2p9: ldo16 {
> +                       regulator-name = "vreg_l16b_2p9";
> +                       regulator-min-microvolt = <2912000>;
> +                       regulator-max-microvolt = <2912000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l17b_2p5: ldo17 {
> +                       regulator-name = "vreg_l17b_2p5";
> +                       regulator-min-microvolt = <2504000>;
> +                       regulator-max-microvolt = <2504000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +       };
> +
> +       regulators-1 {
> +               compatible = "qcom,pm8550ve-rpmh-regulators";
> +               qcom,pmic-id = "c";
> +
> +               vdd-l1-supply = <&vreg_s5j_1p2>;
> +               vdd-l2-supply = <&vreg_s1f_0p7>;
> +               vdd-l3-supply = <&vreg_s1f_0p7>;
> +               vdd-s4-supply = <&vph_pwr>;
> +
> +               vreg_s4c_1p8: smps4 {
> +                       regulator-name = "vreg_s4c_1p8";
> +                       regulator-min-microvolt = <1856000>;
> +                       regulator-max-microvolt = <2000000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l1c_1p2: ldo1 {
> +                       regulator-name = "vreg_l1c_1p2";
> +                       regulator-min-microvolt = <1200000>;
> +                       regulator-max-microvolt = <1200000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l2c_0p8: ldo2 {
> +                       regulator-name = "vreg_l2c_0p8";
> +                       regulator-min-microvolt = <880000>;
> +                       regulator-max-microvolt = <920000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l3c_0p8: ldo3 {
> +                       regulator-name = "vreg_l3c_0p8";
> +                       regulator-min-microvolt = <880000>;
> +                       regulator-max-microvolt = <920000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +       };
> +
> +       regulators-2 {
> +               compatible = "qcom,pmc8380-rpmh-regulators";
> +               qcom,pmic-id = "d";
> +
> +               vdd-l1-supply = <&vreg_s1f_0p7>;
> +               vdd-l2-supply = <&vreg_s1f_0p7>;
> +               vdd-l3-supply = <&vreg_s4c_1p8>;
> +               vdd-s1-supply = <&vph_pwr>;
> +
> +               vreg_l1d_0p8: ldo1 {
> +                       regulator-name = "vreg_l1d_0p8";
> +                       regulator-min-microvolt = <880000>;
> +                       regulator-max-microvolt = <920000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l2d_0p9: ldo2 {
> +                       regulator-name = "vreg_l2d_0p9";
> +                       regulator-min-microvolt = <912000>;
> +                       regulator-max-microvolt = <920000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l3d_1p8: ldo3 {
> +                       regulator-name = "vreg_l3d_1p8";
> +                       regulator-min-microvolt = <1800000>;
> +                       regulator-max-microvolt = <1800000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +       };
> +
> +       regulators-3 {
> +               compatible = "qcom,pmc8380-rpmh-regulators";
> +               qcom,pmic-id = "e";
> +
> +               vdd-l2-supply = <&vreg_s1f_0p7>;
> +               vdd-l3-supply = <&vreg_s5j_1p2>;
> +
> +               vreg_l2e_0p8: ldo2 {
> +                       regulator-name = "vreg_l2e_0p8";
> +                       regulator-min-microvolt = <880000>;
> +                       regulator-max-microvolt = <920000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l3e_1p2: ldo3 {
> +                       regulator-name = "vreg_l3e_1p2";
> +                       regulator-min-microvolt = <1200000>;
> +                       regulator-max-microvolt = <1200000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +       };
> +
> +       regulators-4 {
> +               compatible = "qcom,pmc8380-rpmh-regulators";
> +               qcom,pmic-id = "f";
> +
> +               vdd-l1-supply = <&vreg_s5j_1p2>;
> +               vdd-l2-supply = <&vreg_s5j_1p2>;
> +               vdd-l3-supply = <&vreg_s5j_1p2>;
> +               vdd-s1-supply = <&vph_pwr>;
> +
> +               vreg_s1f_0p7: smps1 {
> +                       regulator-name = "vreg_s1f_0p7";
> +                       regulator-min-microvolt = <700000>;
> +                       regulator-max-microvolt = <1100000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l1f_1p0: ldo1 {
> +                       regulator-name = "vreg_l1f_1p0";
> +                       regulator-min-microvolt = <1024000>;
> +                       regulator-max-microvolt = <1024000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l2f_1p0: ldo2 {
> +                       regulator-name = "vreg_l2f_1p0";
> +                       regulator-min-microvolt = <1024000>;
> +                       regulator-max-microvolt = <1024000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l3f_1p0: ldo3 {
> +                       regulator-name = "vreg_l3f_1p0";
> +                       regulator-min-microvolt = <1024000>;
> +                       regulator-max-microvolt = <1024000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +       };
> +
> +       regulators-6 {
> +               compatible = "qcom,pm8550ve-rpmh-regulators";
> +               qcom,pmic-id = "i";
> +
> +               vdd-l1-supply = <&vreg_s4c_1p8>;
> +               vdd-l2-supply = <&vreg_s5j_1p2>;
> +               vdd-l3-supply = <&vreg_s1f_0p7>;
> +               vdd-s1-supply = <&vph_pwr>;
> +               vdd-s2-supply = <&vph_pwr>;
> +
> +               vreg_s1i_0p9: smps1 {
> +                       regulator-name = "vreg_s1i_0p9";
> +                       regulator-min-microvolt = <900000>;
> +                       regulator-max-microvolt = <920000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_s2i_1p0: smps2 {
> +                       regulator-name = "vreg_s2i_1p0";
> +                       regulator-min-microvolt = <1000000>;
> +                       regulator-max-microvolt = <1100000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l1i_1p8: ldo1 {
> +                       regulator-name = "vreg_l1i_1p8";
> +                       regulator-min-microvolt = <1800000>;
> +                       regulator-max-microvolt = <1800000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l2i_1p2: ldo2 {
> +                       regulator-name = "vreg_l2i_1p2";
> +                       regulator-min-microvolt = <1200000>;
> +                       regulator-max-microvolt = <1200000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l3i_0p8: ldo3 {
> +                       regulator-name = "vreg_l3i_0p8";
> +                       regulator-min-microvolt = <880000>;
> +                       regulator-max-microvolt = <920000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +       };
> +
> +       regulators-7 {
> +               compatible = "qcom,pm8550ve-rpmh-regulators";
> +               qcom,pmic-id = "j";
> +
> +               vdd-l1-supply = <&vreg_s1f_0p7>;
> +               vdd-l2-supply = <&vreg_s5j_1p2>;
> +               vdd-l3-supply = <&vreg_s1f_0p7>;
> +               vdd-s5-supply = <&vph_pwr>;
> +
> +               vreg_s5j_1p2: smps5 {
> +                       regulator-name = "vreg_s5j_1p2";
> +                       regulator-min-microvolt = <1256000>;
> +                       regulator-max-microvolt = <1304000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l1j_0p8: ldo1 {
> +                       regulator-name = "vreg_l1j_0p8";
> +                       regulator-min-microvolt = <880000>;
> +                       regulator-max-microvolt = <920000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l2j_1p2: ldo2 {
> +                       regulator-name = "vreg_l2j_1p2";
> +                       regulator-min-microvolt = <1256000>;
> +                       regulator-max-microvolt = <1256000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l3j_0p8: ldo3 {
> +                       regulator-name = "vreg_l3j_0p8";
> +                       regulator-min-microvolt = <880000>;
> +                       regulator-max-microvolt = <920000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +       };
> +};
> +
> +&camcc {
> +       status = "okay";
> +};
> +
> +&gpu {
> +       status = "okay";
> +
> +       zap-shader {
> +               firmware-name = "qcom/x1e80100/SAMSUNG/galaxy-book4-edge/qcdxkmsuc8380.mbn";
> +       };
> +};
> +
> +&i2c0 {
> +       clock-frequency = <400000>;
> +
> +       status = "okay";
> +
> +       keyboard@5 {
> +               compatible = "hid-over-i2c";
> +               reg = <0x5>;
> +
> +               hid-descr-addr = <0x20>;
> +               interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> +
> +               pinctrl-0 = <&kybd_default>;
> +               pinctrl-names = "default";
> +
> +               wakeup-source;
> +       };
> +};
> +
> +&i2c5 {
> +       clock-frequency = <400000>;
> +
> +       status = "okay";
> +
> +       eusb5_repeater: redriver@43 {
> +               compatible = "nxp,ptn3222";
> +               reg = <0x43>;
> +               #phy-cells = <0>;
> +
> +               vdd3v3-supply = <&vreg_l13b_3p0>;
> +               vdd1v8-supply = <&vreg_l4b_1p8>;
> +
> +               reset-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
> +
> +               pinctrl-0 = <&eusb5_reset_n>;
> +               pinctrl-names = "default";
> +       };
> +
> +       eusb6_repeater: redriver@4f {
> +               compatible = "nxp,ptn3222";
> +               reg = <0x4f>;
> +               #phy-cells = <0>;
> +
> +               vdd3v3-supply = <&vreg_l13b_3p0>;
> +               vdd1v8-supply = <&vreg_l4b_1p8>;
> +
> +               reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
> +
> +               pinctrl-0 = <&eusb6_reset_n>;
> +               pinctrl-names = "default";
> +       };
> +};
> +
> +
> +&i2c8 {
> +       clock-frequency = <400000>;
> +
> +       status = "okay";
> +
> +       touchscreen@5d {
> +               compatible = "hid-over-i2c";
> +               reg = <0x5d>;
> +
> +               hid-descr-addr = <0x1>;
> +               //interrupts-extended = <&tlmm 34 IRQ_TYPE_LEVEL_LOW>;
> +
> +               vdd-supply = <&vreg_misc_3p3>;
> +
> +               //pinctrl-0 = <&ts0_default>;
> +               //pinctrl-names = "default";
> +       };
> +};
> +
> +&i2c13 {
> +       clock-frequency = <400000>;
> +
> +       status = "okay";
> +};
> +
> +&lpass_tlmm {
> +       spkr_01_sd_n_active: spkr-01-sd-n-active-state {
> +               pins = "gpio12";
> +               function = "gpio";
> +               drive-strength = <16>;
> +               bias-disable;
> +               output-low;
> +       };
> +
> +       spkr_23_sd_n_active: spkr-23-sd-n-active-state {
> +               pins = "gpio13";
> +               function = "gpio";
> +               drive-strength = <16>;
> +               bias-disable;
> +               output-low;
> +       };
> +};
> +
> +&lpass_vamacro {
> +       pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
> +       pinctrl-names = "default";
> +
> +       vdd-micb-supply = <&vreg_l1b_1p8>;
> +       qcom,dmic-sample-rate = <4800000>;
> +};
> +
> +&mdss {
> +       status = "okay";
> +};
> +
> +&mdss_dp0 {
> +       status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +       data-lanes = <0 1>;
> +       link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
> +&mdss_dp1 {
> +       status = "okay";
> +};
> +
> +&mdss_dp1_out {
> +       data-lanes = <0 1>;
> +       link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
> +&mdss_dp2 {
> +       status = "okay";
> +};
> +
> +&mdss_dp2_out {
> +       data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dp3 {
> +       /delete-property/ #sound-dai-cells;
> +
> +       pinctrl-0 = <&edp0_hpd_default>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +
> +       aux-bus {
> +               panel: panel {
> +                       enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> +                       power-supply = <&vreg_edp_3p3>;
> +                       no-hpd;
> +
> +                       pinctrl-0 = <&edp_bl_en>;
> +                       pinctrl-names = "default";
> +
> +                       port {
> +                               edp_panel_in: endpoint {
> +                                       remote-endpoint = <&mdss_dp3_out>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       ports {
> +               port@1 {
> +                       reg = <1>;
> +                       mdss_dp3_out: endpoint {
> +                               data-lanes = <0 1 2 3>;
> +                               link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
> +
> +                               remote-endpoint = <&edp_panel_in>;
> +                       };
> +               };
> +       };
> +};
> +
> +
> +&mdss_dp3_phy {
> +       vdda-phy-supply = <&vreg_l3j_0p8>;
> +       vdda-pll-supply = <&vreg_l2j_1p2>;
> +
> +       status = "okay";
> +};
> +
> +&pcie4 {
> +       perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> +       wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> +
> +       pinctrl-0 = <&pcie4_default>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +};
> +
> +&pcie4_phy {
> +       vdda-phy-supply = <&vreg_l3i_0p8>;
> +       vdda-pll-supply = <&vreg_l3e_1p2>;
> +
> +       status = "okay";
> +};
> +
> +&pcie4_port0 {
> +       wifi@0 {
> +               compatible = "pci17cb,1107";
> +               reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +               vddaon-supply = <&vreg_pmu_aon_0p59>;
> +               vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +               vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +               vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +               vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +               vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +               vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +               vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +               vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +       };
> +};
> +
> +&pm8550ve_8_gpios {
> +       misc_3p3_reg_en: misc-3p3-reg-en-state {
> +               pins = "gpio6";
> +               function = "normal";
> +               bias-disable;
> +               input-disable;
> +               output-enable;
> +               drive-push-pull;
> +               power-source = <1>; /* 1.8 V */
> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +       };
> +};
> +
> +&pmc8380_3_gpios {
> +       edp_bl_en: edp-bl-en-state {
> +               pins = "gpio4";
> +               function = "normal";
> +               power-source = <1>; /* 1.8V */
> +               input-disable;
> +               output-enable;
> +       };
> +};
> +
> +&qupv3_0 {
> +       status = "okay";
> +};
> +
> +&qupv3_1 {
> +       status = "okay";
> +};
> +
> +&qupv3_2 {
> +       status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +       firmware-name = "qcom/x1e80100/SAMSUNG/galaxy-book4-edge/qcadsp8380.mbn",
> +                       "qcom/x1e80100/SAMSUNG/galaxy-book4-edge/adsp_dtbs.elf";
> +
> +       status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +       firmware-name = "qcom/x1e80100/SAMSUNG/galaxy-book4-edge/qccdsp8380.mbn",
> +                       "qcom/x1e80100/SAMSUNG/galaxy-book4-edge/cdsp_dtbs.elf";
> +
> +       status = "okay";
> +};
> +
> +&swr0 {
> +       status = "okay";
> +
> +       pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
> +       pinctrl-names = "default";
> +
> +       /* WSA8845, Left Woofer */
> +       left_woofer: speaker@0,0 {
> +               compatible = "sdw20217020400";
> +               reg = <0 0>;
> +               reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
> +               #sound-dai-cells = <0>;
> +               sound-name-prefix = "WooferLeft";
> +               vdd-1p8-supply = <&vreg_l15b_1p8>;
> +               vdd-io-supply = <&vreg_l12b_1p2>;
> +               qcom,port-mapping = <1 2 3 7 10 13>;
> +       };
> +
> +       /* WSA8845, Left Tweeter */
> +       left_tweeter: speaker@0,1 {
> +               compatible = "sdw20217020400";
> +               reg = <0 1>;
> +               reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
> +               #sound-dai-cells = <0>;
> +               sound-name-prefix = "TweeterLeft";
> +               vdd-1p8-supply = <&vreg_l15b_1p8>;
> +               vdd-io-supply = <&vreg_l12b_1p2>;
> +               qcom,port-mapping = <4 5 6 7 11 13>;
> +       };
> +};
> +
> +&swr1 {
> +       status = "okay";
> +
> +       /* WCD9385 RX */
> +       wcd_rx: codec@0,4 {
> +               compatible = "sdw20217010d00";
> +               reg = <0 4>;
> +               qcom,rx-port-mapping = <1 2 3 4 5>;
> +       };
> +};
> +
> +&swr2 {
> +       status = "okay";
> +
> +       /* WCD9385 TX */
> +       wcd_tx: codec@0,3 {
> +               compatible = "sdw20217010d00";
> +               reg = <0 3>;
> +               qcom,tx-port-mapping = <2 2 3 4>;
> +       };
> +};
> +
> +&swr3 {
> +       status = "okay";
> +
> +       pinctrl-0 = <&wsa2_swr_active>, <&spkr_23_sd_n_active>;
> +       pinctrl-names = "default";
> +
> +       /* WSA8845, Right Woofer */
> +       right_woofer: speaker@0,0 {
> +               compatible = "sdw20217020400";
> +               reg = <0 0>;
> +               reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
> +               #sound-dai-cells = <0>;
> +               sound-name-prefix = "WooferRight";
> +               vdd-1p8-supply = <&vreg_l15b_1p8>;
> +               vdd-io-supply = <&vreg_l12b_1p2>;
> +               qcom,port-mapping = <1 2 3 7 10 13>;
> +       };
> +
> +       /* WSA8845, Right Tweeter */
> +       right_tweeter: speaker@0,1 {
> +               compatible = "sdw20217020400";
> +               reg = <0 1>;
> +               reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
> +               #sound-dai-cells = <0>;
> +               sound-name-prefix = "TweeterRight";
> +               vdd-1p8-supply = <&vreg_l15b_1p8>;
> +               vdd-io-supply = <&vreg_l12b_1p2>;
> +               qcom,port-mapping = <4 5 6 7 11 13>;
> +       };
> +};
> +
> +&tlmm {
> +       gpio-reserved-ranges = <34 2>, /* Unused */
> +                              <44 4>; /* SPI (TPM) */
> +
> +       edp_reg_en: edp-reg-en-state {
> +               pins = "gpio70";
> +               function = "gpio";
> +               drive-strength = <16>;
> +               bias-pull-up;
> +               output-low;
> +       };
> +
> +       octa_vdd_en: octa-vdd-en-state {
> +               pins = "gpio111";
> +               function = "gpio";
> +               drive-strength = <16>;
> +               bias-pull-up;
> +               output-high;
> +       };
> +
> +       display_vdd_en: display-vdd-en-state {
> +               pins = "gpio120";
> +               function = "gpio";
> +               drive-strength = <16>;
> +               bias-pull-up;
> +               output-high;
> +       };
> +
> +       edp0_hpd_default: edp0-hpd-default-state {
> +               pins = "gpio119";
> +               function = "edp0_hot";
> +               bias-pull-down;
> +               input-enable;
> +               drive-strength = <2>;
> +       };
> +
> +
> +       hall_int_n_default: hall-int-n-state {
> +               pins = "gpio92";
> +               function = "gpio";
> +               bias-disable;
> +       };
> +
> +       kybd_default: kybd-default-state {
> +               pins = "gpio67";
> +               function = "gpio";
> +               bias-disable;
> +       };
> +
> +       hdmi_hpd_default: hdmi-hpd-default-state {
> +               pins = "gpio126";
> +               function = "usb2_dp";
> +               bias-disable;
> +       };
> +
> +       eusb5_reset_n: eusb5-reset-n-state {
> +               pins = "gpio7";
> +               function = "gpio";
> +               drive-strength = <2>;
> +               bias-disable;
> +               output-low;
> +       };
> +
> +       eusb6_reset_n: eusb6-reset-n-state {
> +               pins = "gpio184";
> +               function = "gpio";
> +               drive-strength = <2>;
> +               bias-disable;
> +               output-low;
> +       };
> +
> +       pcie4_default: pcie4-default-state {
> +               clkreq-n-pins {
> +                       pins = "gpio147";
> +                       function = "pcie4_clk";
> +                       drive-strength = <2>;
> +                       bias-pull-up;
> +               };
> +
> +               perst-n-pins {
> +                       pins = "gpio146";
> +                       function = "gpio";
> +                       drive-strength = <2>;
> +                       bias-disable;
> +               };
> +
> +               wake-n-pins {
> +                       pins = "gpio148";
> +                       function = "gpio";
> +                       drive-strength = <2>;
> +                       bias-pull-up;
> +               };
> +       };
> +
> +       tpad_default: tpad-default-state {
> +               pins = "gpio3";
> +               function = "gpio";
> +               bias-disable;
> +       };
> +
> +       ts0_default: ts0-default-state {
> +               int-n-pins {
> +                       pins = "gpio51";
> +                       function = "gpio";
> +                       bias-disable;
> +               };
> +
> +               reset-n-pins {
> +                       pins = "gpio48";
> +                       function = "gpio";
> +                       output-high;
> +                       drive-strength = <16>;
> +               };
> +       };
> +
> +       usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
> +               mode-pins {
> +                       pins = "gpio166";
> +                       function = "gpio";
> +                       bias-disable;
> +                       drive-strength = <2>;
> +                       output-high;
> +               };
> +
> +               oe-n-pins {
> +                       pins = "gpio168";
> +                       function = "gpio";
> +                       bias-disable;
> +                       drive-strength = <2>;
> +               };
> +
> +               sel-pins {
> +                       pins = "gpio167";
> +                       function = "gpio";
> +                       bias-disable;
> +                       drive-strength = <2>;
> +               };
> +
> +       };
> +
> +       usb_1_ss1_sbu_default: usb-1-ss1-sbu-state {
> +               mode-pins {
> +                       pins = "gpio177";
> +                       function = "gpio";
> +                       bias-disable;
> +                       drive-strength = <2>;
> +                       output-high;
> +               };
> +
> +               oe-n-pins {
> +                       pins = "gpio179";
> +                       function = "gpio";
> +                       bias-disable;
> +                       drive-strength = <2>;
> +               };
> +
> +               sel-pins {
> +                       pins = "gpio178";
> +                       function = "gpio";
> +                       bias-disable;
> +                       drive-strength = <2>;
> +               };
> +       };
> +
> +       wcn_sw_en: wcn-sw-en-state {
> +               pins = "gpio214";
> +               function = "gpio";
> +               drive-strength = <2>;
> +               bias-disable;
> +       };
> +
> +       wcn_wlan_bt_en: wcn-wlan-bt-en-state {
> +               pins = "gpio116", "gpio117";
> +               function = "gpio";
> +               drive-strength = <2>;
> +               bias-disable;
> +       };
> +
> +       wcd_default: wcd-reset-n-active-state {
> +               pins = "gpio191";
> +               function = "gpio";
> +               drive-strength = <16>;
> +               bias-disable;
> +               output-low;
> +       };
> +};
> +
> +&ufs_mem_hc {
> +       status = "okay";
> +
> +       reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
> +       vcc-supply = <&vreg_l17b_2p5>;
> +       vcc-max-microamp = <600000>;
> +
> +       vccq-supply = <&vreg_l2i_1p2>;
> +       vccq-max-microamp = <600000>;
> +};
> +
> +&ufs_mem_phy {
> +       status = "okay";
> +
> +       vdda-phy-supply = <&vreg_l3i_0p8>;
> +       vdda-pll-supply = <&vreg_l3e_1p2>;
> +};
> +
> +&uart14 {
> +       status = "okay";
> +
> +       bluetooth {
> +               compatible = "qcom,wcn7850-bt";
> +               max-speed = <3200000>;
> +
> +               vddaon-supply = <&vreg_pmu_aon_0p59>;
> +               vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +               vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +               vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +               vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +               vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +               vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +       };
> +};
> +
> +&uart21 {
> +       compatible = "qcom,geni-debug-uart";
> +       status = "okay";
> +};
> +
> +&usb_1_ss0 {
> +       status = "okay";
> +};
> +
> +&usb_1_ss0_hsphy {
> +       vdd-supply = <&vreg_l3j_0p8>;
> +       vdda12-supply = <&vreg_l2j_1p2>;
> +
> +       status = "okay";
> +};
> +
> +&usb_1_ss0_qmpphy {
> +       vdda-phy-supply = <&vreg_l2j_1p2>;
> +       vdda-pll-supply = <&vreg_l1j_0p8>;
> +
> +       status = "okay";
> +};
> +
> +&usb_1_ss0 {
> +       dr_mode = "host";
> +};
> +
> +&usb_1_ss0_dwc3_hs {
> +       remote-endpoint = <&pmic_glink_ss0_hs_in>;
> +};
> +
> +&usb_1_ss0_qmpphy_out {
> +       remote-endpoint = <&pmic_glink_ss0_ss_in>;
> +};
> +
> +&usb_1_ss1 {
> +       status = "okay";
> +};
> +
> +&usb_1_ss1_hsphy {
> +       vdd-supply = <&vreg_l3j_0p8>;
> +       vdda12-supply = <&vreg_l2j_1p2>;
> +
> +       status = "okay";
> +};
> +
> +&usb_1_ss1_qmpphy {
> +       vdda-phy-supply = <&vreg_l2j_1p2>;
> +       vdda-pll-supply = <&vreg_l2d_0p9>;
> +
> +       status = "okay";
> +};
> +
> +&usb_1_ss1 {
> +       dr_mode = "host";
> +};
> +
> +&usb_1_ss1_dwc3_hs {
> +       remote-endpoint = <&pmic_glink_ss1_hs_in>;
> +};
> +
> +&usb_1_ss1_qmpphy_out {
> +       remote-endpoint = <&pmic_glink_ss1_ss_in>;
> +};
> +
> +&usb_1_ss2_qmpphy {
> +       vdda-phy-supply = <&vreg_l2j_1p2>;
> +       vdda-pll-supply = <&vreg_l2d_0p9>;
> +
> +       /delete-property/ mode-switch;
> +       /delete-property/ orientation-switch;
> +
> +       status = "okay";
> +
> +       ports {
> +               port@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       /delete-node/ endpoint;
> +
> +                       usb_1_ss2_qmpphy_out_dp: endpoint@0 {
> +                               reg = <0>;
> +
> +                               data-lanes = <3 2 1 0>;
> +                               remote-endpoint = <&hdmi_bridge_dp_in>;
> +                       };
> +               };
> +       };
> +};
> +
> +
> +/* MP0 goes to the USB-A port(USB3) and FPC */
> +&usb_mp {
> +       status = "okay";
> +
> +       /* Limit to single port */
> +       phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>;
> +       phy-names = "usb2-0", "usb3-0";
> +};
> +
> +&usb_mp_hsphy0 {
> +       vdd-supply = <&vreg_l2e_0p8>;
> +       vdda12-supply = <&vreg_l3e_1p2>;
> +
> +       phys = <&eusb6_repeater>;
> +
> +       status = "okay";
> +};
> +
> +&usb_mp_qmpphy0 {
> +       vdda-phy-supply = <&vreg_l3e_1p2>;
> +       vdda-pll-supply = <&vreg_l3c_0p8>;
> +
> +       status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge-14.dts b/arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge-14.dts
> new file mode 100644
> index 000000000..333a69a8a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge-14.dts
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +
> +/dts-v1/;
> +
> +#include "x1-samsung-galaxy-book4-edge.dtsi"
> +
> +/ {
> +       model = "Samsung Galaxy Book4 Edge (14 inch)";
> +       compatible = "samsung,galaxy-book4-edge-14", "samsung,galaxy-book4-edge",
> +                    "qcom,x1e80100";
> +};
> +
> +&i2c13 {
> +       touchpad@40 {
> +               compatible = "hid-over-i2c";
> +               reg = <0x40>;
> +
> +               hid-descr-addr = <0xe>;
> +               interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> +
> +               pinctrl-0 = <&tpad_default>;
> +               pinctrl-names = "default";
> +       };
> +};
> +
> +&panel {
> +       compatible = "samsung,atna40cu07", "samsung,atna33xc20";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/x1e84100-samsung-galaxy-book4-edge-16.dts b/arch/arm64/boot/dts/qcom/x1e84100-samsung-galaxy-book4-edge-16.dts
> new file mode 100644
> index 000000000..947eea411
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e84100-samsung-galaxy-book4-edge-16.dts
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +
> +/dts-v1/;
> +
> +#include "x1-samsung-galaxy-book4-edge.dtsi"
> +
> +/ {
> +       model = "Samsung Galaxy Book4 Edge (16 inch)";
> +       compatible = "samsung,galaxy-book4-edge-16", "samsung,galaxy-book4-edge",
> +                    "qcom,x1e80100";
> +};
> +
> +&i2c13 {
> +       touchpad@50 {
> +               compatible = "hid-over-i2c";
> +               reg = <0x50>;
> +
> +               hid-descr-addr = <0xd1>;
> +               interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> +
> +               vdd-supply = <&vreg_misc_3p3>;
> +               vddl-supply = <&vreg_l15b_1p8>;
> +
> +               pinctrl-0 = <&tpad_default>;
> +               pinctrl-names = "default";
> +       };
> +};
> +
> +&panel {
> +       compatible = "samsung,atna60cl07", "samsung,atna33xc20";
> +};
> --
> 2.43.0
>
