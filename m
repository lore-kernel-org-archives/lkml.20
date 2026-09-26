Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE71438026
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432553; cv=none; b=G/nl/GLRvlqqgYxr8rPHZJkgaZiS60Qb2K1/b8kNc9RraMX+xlVafz/ucZRJ8NOsl/4lgid5iTSE57Ol9Fhe+Guu9x8U64g2QQouqt9fgOa44G4RnEC93hPJJIyKbY4zeMdIfM92cBI5yQbpEe+c2s9jhZ18qzSnfHUvZ0eC3H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432553; c=relaxed/simple;
	bh=NHC2vDd7aGkqfXHxwBgoKCPLK/7Ya7qK3QhE946pC/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6OFFkmnh7wRdRoAJFNqeYxU43BQ/7KJ7tpNs07/Vnf4gASsNU2wtHrTbyPenKKeXhldJzp2Tz38cm+LrninbY5oOz10QR+yX3pk+je87WVuT2VJc25+4qGhtrlOagDgEqY8je5g7oVoZpkA3fE2941FuPWNBd9FRHzO8hS2my0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C54XrCdt; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C54XrCdt"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso1040255e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790432549; x=1791037349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7SDtCY6RigLDXxsZjzqohCZYD1pAsIMsqLNRumaHz0Y=;
        b=C54XrCdtVyqY1AfJLwhC4J6zXqCErLp6IMl/5lsnOZU1Vm7b1Qvdbuo0vye1KlYSZU
         IzV/+lwlbTl7qlyKjAxDKaaQ6Px6XqZCYlmlfRBeXtLmGeJXTHEZUvIXhm5nSdG0xNAc
         9L/7ADGLlkBRw9B0WtdOo1j/n2uwUhZKquxVD7fUU+qCgS5kYb5B2ZnYpGDkJMzXCKwL
         q6jmrDBq4+P5EvU72WEO3IuKn697+2JHEMplWhSggYiEmgW3PFde77wBeQ785aQiPVtB
         lKCMt5sg9PaqK1nt+bwlMgYbgLg/V65gTHQ0T9S8/CwUCvGHKZSQQrY/mftBloRxXBXC
         n1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790432549; x=1791037349;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7SDtCY6RigLDXxsZjzqohCZYD1pAsIMsqLNRumaHz0Y=;
        b=ZCZsy7OUJg6E+xgI4UgofoTHSzRtyQSCcomYGHwv1uLt7unaYzY7UZ8PKQnBIw90Af
         0lzYWYvu4TTH03YgJhZ5nHo4JKVw54AnreKN4viaGNCqzXjQ7FQFoRQubaXf5LmP+jbx
         q/DMyfZ2gTYu0Ul8ShjT0wOIOjg8IIXX+TYVTLNObpIcBV+O1G2I5gxX6G9L9MVXFJVe
         LdCxK685FL0aU1pQ52sgz1g9n5V/13SmpobciQIdy1ECMi+Nfey7h4Sea61ezGYolfcz
         ekU+93+bF5Vyo5E5Ot6EnIqnmhvzaZ0Ipgolg7g8KpeelfbwsPuBVXuA7OfLBajYaKyo
         0Jqg==
X-Forwarded-Encrypted: i=1; AKwUvBygUp2ZeFCnXf6USCyMLLWPMp4yyFS7xOR+UEVPiYCqBGqskpmUinE2Z/FUWute5N17r5RTHSMV41RYE9E=@vger.kernel.org
X-Gm-Message-State: AFuF++mxJSisNVbBbJcF3bOQtTxuUN0Bu7+YnUbtGAnxqjArQS14k630
	0iKs97NP2QFqctmIjX6u5mRFP1nBQfSnY3dHtylGiVhZEmWjDCGtSonNtgRgCoM6TJ4=
X-Gm-Gg: AYBFou3JYVH7ulhpsRBeOMyAY6b5Dw7T932Z6k3/h4WAYeRTf3Fm2NdmAVqKXu2H8a1
	4GqAbaT3PwxfmSknRcRwQT4MPyi2uh7Mw4XpfFMX8rKbcxhGcSSp+vQ7WCztKOWKYi4vGV12zox
	uiuJC8UMpZct5fxJ3m4OTWTdnh1OfBTTfgzgQ+3xqgBjp+niUakODqNXFC33JNH4WCXky8A57+h
	uaMBhmrgDhR7tQL12rUVVt6EplyKIECQ6p5sdCVz70UxMtZhu3Wjtd8+cSn3S2CC1RZqpNRR0ru
	LCIRSaw3ClZCpAzPoZkvexggRjtzLpKo4PJuPuyd53kKjCLhHrwuQ8TxzeKsA83AaPaNCdwtaWV
	y3zTI+mKOz1e0oLONECe0SY8y1yLFSsvgUUPte4+GsO1oz1cTrgpegspfNa/OaOvSI8yY66/Fih
	NTMdid219AFIbcDuG2k/XAGnjby4cKbKQ4PoBND9DahBo87kGmMp7JDEPvu8PLRzgjFnXgufL0q
	glOSMFxgFM=
X-Received: by 2002:a05:600c:3148:b0:49f:fc4f:9efb with SMTP id 5b1f17b1804b1-49ffc4fa10bmr28495415e9.7.1790432548901;
        Sat, 26 Sep 2026 07:22:28 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff0658747sm159431935e9.1.2026.09.26.07.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 07:22:27 -0700 (PDT)
Message-ID: <4f089c98-a479-45c9-9b11-0207c895367a@linaro.org>
Date: Sat, 26 Sep 2026 15:22:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/12] usb: typec: qcom: Add gen1 Type-C port support
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-6-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-6-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add a port backend for the first generation of the Qualcomm PMIC Type-C
> block, found on PM660 and PMI8998.
> 
> On gen1 the Type-C CC logic is part of the charger's USBIN peripheral
> (base 0x1300) instead of the standalone Type-C peripheral used by
> PM8150B and later PMICs. All Type-C events (CC state change,
> tCCDebounce done, VBUS change and error) are signalled through a single
> aggregate "type-c-change" interrupt, the handler re-reads TYPEC_STATUS_4
> to find out what changed. The PD PHY is register compatible with PM8150B
> and is reused as is.
> 
> Differences to the PM8150B backend:
>   - get_cc() returns -EBUSY until the hardware reports tCCDebounce done,
>     instead of using a software debounce.
>   - As a source, only the default and 1.5A Rp can be advertised, 3.0A
>     requests are advertised as 1.5A.
>   - The PBS workaround of the downstream SMB2 driver (TM_IO_DTEST4_SEL)
>     is applied on every power role change.
> 
> VBUS sourcing is optional and only used when the connector provides
> a vbus-supply, as the charger doesn't expose a VBUS regulator yet.
> 
> Assisted-by: LLM
> Co-developed-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/usb/typec/tcpm/qcom/Makefile               |   1 +
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |   9 +
>   .../typec/tcpm/qcom/qcom_pmic_typec_port_gen1.c    | 605 +++++++++++++++++++++
>   .../typec/tcpm/qcom/qcom_pmic_typec_port_gen1.h    |  15 +
>   4 files changed, 630 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/Makefile b/drivers/usb/typec/tcpm/qcom/Makefile
> index cc23042b94878..b8b9350184c19 100644
> --- a/drivers/usb/typec/tcpm/qcom/Makefile
> +++ b/drivers/usb/typec/tcpm/qcom/Makefile
> @@ -1,7 +1,8 @@
>   # SPDX-License-Identifier: GPL-2.0
>   #
>   obj-$(CONFIG_TYPEC_QCOM_PMIC)		+= qcom_pmic_tcpm.o
>   qcom_pmic_tcpm-y			+= qcom_pmic_typec.o \
>   					   qcom_pmic_typec_port.o \
> +					   qcom_pmic_typec_port_gen1.o \
>   					   qcom_pmic_typec_pdphy.o \
>   					   qcom_pmic_typec_pdphy_stub.o \
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index 41aaae6bb3724..ea1d5b0927436 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -12,16 +12,17 @@
>   #include <linux/slab.h>
>   #include <linux/usb/tcpm.h>
>   
>   #include <drm/bridge/aux-bridge.h>
>   
>   #include "qcom_pmic_typec.h"
>   #include "qcom_pmic_typec_pdphy.h"
>   #include "qcom_pmic_typec_port.h"
> +#include "qcom_pmic_typec_port_gen1.h"
>   
>   typedef int (*pmic_typec_port_probe_fn)(struct platform_device *pdev,
>   					struct pmic_typec *tcpm,
>   					const struct pmic_typec_port_resources *res,
>   					struct regmap *regmap, u32 base);
>   
>   struct pmic_typec_resources {
>   	const struct pmic_typec_pdphy_resources	*pdphy_res;
> @@ -134,31 +135,39 @@ static void qcom_pmic_typec_remove(struct platform_device *pdev)
>   	struct pmic_typec *tcpm = platform_get_drvdata(pdev);
>   
>   	tcpm->pdphy_stop(tcpm);
>   	tcpm->port_stop(tcpm);
>   	tcpm_unregister_port(tcpm->tcpm_port);
>   	fwnode_handle_put(tcpm->tcpc.fwnode);
>   }
>   
> +static const struct pmic_typec_resources gen1_typec_res = {
> +	.pdphy_res = &pm8150b_pdphy_res,
> +	.port_res = &gen1_port_res,
> +	.port_probe = qcom_pmic_typec_gen1_port_probe,
> +};
> +
>   static const struct pmic_typec_resources pm8150b_typec_res = {
>   	.pdphy_res = &pm8150b_pdphy_res,
>   	.port_res = &pm8150b_port_res,
>   	.port_probe = qcom_pmic_typec_port_probe,
>   };
>   
>   static const struct pmic_typec_resources pmi632_typec_res = {
>   	/* PD PHY not present */
>   	.port_res = &pm8150b_port_res,
>   	.port_probe = qcom_pmic_typec_port_probe,
>   };
>   
>   static const struct of_device_id qcom_pmic_typec_table[] = {
> +	{ .compatible = "qcom,pm660-typec", .data = &gen1_typec_res },
>   	{ .compatible = "qcom,pm8150b-typec", .data = &pm8150b_typec_res },
>   	{ .compatible = "qcom,pmi632-typec", .data = &pmi632_typec_res },
> +	{ .compatible = "qcom,pmi8998-typec", .data = &gen1_typec_res },

I think this should be

 > +	{ .compatible = "qcom,pm660-typec", .data = &pm660_typec_res },
 >   	{ .compatible = "qcom,pm8150b-typec", .data = &pm8150b_typec_res },
 >   	{ .compatible = "qcom,pmi632-typec", .data = &pmi632_typec_res },
 > +	{ .compatible = "qcom,pmi8998-typec", .data = &pmi8998_typec_res },

Since I'm not sure "gen1" is a real thing and besides, I see this 
gen1/gen2/gen3 stuff in CAMSS and it means almost nothing. The silicon 
version is the salient thing.

/rant

>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, qcom_pmic_typec_table);
>   
>   static struct platform_driver qcom_pmic_typec_driver = {
>   	.driver = {
>   		.name = "qcom,pmic-typec",
>   		.of_match_table = qcom_pmic_typec_table,
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port_gen1.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port_gen1.c

I'd rename the existing file to qcom_pmic_typec_port_pm8150b and the new 
file to qcom_pmic_typec_port_pm660.c or pmi8998.c at your preference, 
probably whichever version hit the market first would make sense.

> new file mode 100644
> index 0000000000000..b4e3e49664f9d
> --- /dev/null
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port_gen1.c
> @@ -0,0 +1,605 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm Type-C port backend (1st gen)
> + *
> + * GEN1 predates the standalone PM8150B-style Type-C register block.
> + * Its CC/role controls live in the USBIN peripheral, while the PD PHY
> + * is a separate PMIC peripheral.
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +#include <linux/usb/tcpm.h>
> +
> +#include "qcom_pmic_typec.h"
> +#include "qcom_pmic_typec_port.h"
> +#include "qcom_pmic_typec_port_gen1.h"
> +
> +/* USBIN Type-C status */
> +#define TYPEC_STATUS_1_REG				0x0b
> +#define  UFP_TYPEC_MASK					GENMASK(7, 5)
> +#define  UFP_TYPEC_RDSTD				BIT(7)
> +#define  UFP_TYPEC_RD1P5				BIT(6)
> +#define  UFP_TYPEC_RD3P0				BIT(5)
> +
> +#define TYPEC_STATUS_2_REG				0x0c
> +#define  DFP_TYPEC_MASK					GENMASK(3, 0)
> +#define  DFP_RD_OPEN					BIT(3)
> +#define  DFP_RD_RA_VCONN				BIT(2)
> +#define  DFP_RD_RD					BIT(1)
> +#define  DFP_RA_RA					BIT(0)
> +
> +#define TYPEC_STATUS_4_REG				0x0e
> +#define  UFP_DFP_MODE_STATUS				BIT(7)
> +#define  TYPEC_VBUS_STATUS				BIT(6)
> +#define  TYPEC_VBUS_ERROR				BIT(5)
> +#define  TYPEC_DEBOUNCE_DONE				BIT(4)
> +#define  CC_ORIENTATION					BIT(1)
> +#define  CC_ATTACHED					BIT(0)
> +
> +/* USBIN Type-C configuration */
> +#define TYPEC_CFG_REG					0x58
> +#define  TYPEC_OR_U_USB					BIT(0)
> +
> +#define TYPEC_CFG_2_REG					0x59
> +#define  EN_TRY_SOURCE_MODE				BIT(3)
> +#define  EN_80UA_180UA_CUR_SOURCE			BIT(0)
> +
> +#define TYPEC_CFG_3_REG					0x5a
> +#define  EN_TRYSINK_MODE				BIT(2)
> +
> +#define TYPEC_INTRPT_ENB_REG				0x67
> +#define  VBUS_ERROR_INT_EN				BIT(5)
> +#define  DEBOUNCE_DONE_INT_EN				BIT(3)
> +#define  CCSTATE_CHANGE_INT_EN				BIT(2)
> +#define  VBUS_DEASSERT_INT_EN				BIT(1)
> +#define  VBUS_ASSERT_INT_EN				BIT(0)
> +
> +#define TYPEC_SW_CTRL_REG				0x68
> +#define  VCONN_EN_ORIENTATION				BIT(6)
> +#define  VCONN_EN_SRC					BIT(4)
> +#define  VCONN_EN_VALUE					BIT(3)
> +#define  POWER_ROLE_CMD_MASK				GENMASK(2, 0)
> +#define  UFP_EN_CMD					BIT(2)
> +#define  DFP_EN_CMD					BIT(1)
> +#define  TYPEC_DISABLE_CMD				BIT(0)
> +
> +/* GEN1 TYPEC_PBS_WA_BIT workaround used by the downstream SMB2 driver. */
> +#define MISC_BASE_OFFSET				0x300
> +#define TM_IO_DTEST4_SEL				0xe9
> +#define PBS_CRUDE_SENSOR_ENABLE				0xa5
> +
> +/* Interrupt numbers */
> +#define PMIC_TYPEC_CHANGE_IRQ				0x0
> +
> +struct gen1_typec_port {
> +	struct device		*dev;
> +	struct tcpm_port	*tcpm_port;
> +	struct regmap		*regmap;
> +	u32			base;
> +	int			irq;
> +
> +	struct regulator	*vbus;
> +	bool			vbus_enabled;
> +	bool			vbus_present;
> +	bool			vbus_valid;
> +	struct mutex		lock; /* serializes register RMW and VBUS state */
> +};
> +

Existing data-structure is :

struct pmic_typec_port {
         struct device                   *dev;
         struct tcpm_port                *tcpm_port;
         struct regmap                   *regmap;
         u32                             base;
         unsigned int                    nr_irqs;
         struct pmic_typec_port_irq_data *irq_data;

         struct regulator                *vdd_vbus;
         bool                            vbus_enabled;
         struct mutex                    vbus_lock;              /* VBUS 
state serialization */

         int                             cc;
         bool                            debouncing_cc;
         struct delayed_work             cc_debounce_dwork;

         spinlock_t                      lock;   /* Register atomicity */
};

Just re-use that one - also that way we ahe a consistent aproach to locking.

At the worst case you guys need to add .vbus_present ?

It seems weird to me to have one version of the port use spinlock with 
another using mutex - which leads to other questions down below.

> +const struct pmic_typec_port_resources gen1_port_res = {
> +	.nr_irqs = 1,
> +	.irq_params = {
> +		{
> +			.irq_name = "type-c-change",
> +			.virq = PMIC_TYPEC_CHANGE_IRQ,
> +		},
> +	},
> +};
> +
> +/*
> + * Failure of this workaround write is non-fatal and
> + * we can continue with the role transition.
> + */
> +static void gen1_typec_pbs_wa(struct gen1_typec_port *port, bool sink)
> +{
> +	unsigned int val = sink ? 0 : PBS_CRUDE_SENSOR_ENABLE;
> +	int ret;
> +
> +	ret = regmap_write(port->regmap, port->base +
> +			   MISC_BASE_OFFSET + TM_IO_DTEST4_SEL, val);
> +	if (!ret)
> +		return;

Why would the write fail and why wouldn't that be a critical case if the 
write did fail ?

> +	dev_warn(port->dev,
> +		 "failed to update GEN1 Type-C PBS workaround: %d\n",
> +		 ret);
> +}
> +
> +static int gen1_typec_set_power_role(struct gen1_typec_port *port,
> +				     unsigned int role)
> +{
> +	int ret;
> +
> +	gen1_typec_pbs_wa(port, role == UFP_EN_CMD);
> +
> +	ret = regmap_update_bits(port->regmap,
> +				 port->base + TYPEC_SW_CTRL_REG,
> +				 POWER_ROLE_CMD_MASK, role);
> +	if (ret)
> +		dev_err(port->dev, "failed to set Type-C power role: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int gen1_typec_get_vbus(struct tcpc_dev *tcpc)
> +{
> +	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
> +	struct gen1_typec_port *port = tcpm->pmic_typec_port;
> +	unsigned int status;
> +	int ret;
> +
> +	mutex_lock(&port->lock);
> +	ret = regmap_read(port->regmap, port->base +
> +			  TYPEC_STATUS_4_REG, &status);
> +	if (ret)
> +		ret = port->vbus_enabled;
> +	else
> +		ret = port->vbus_enabled || !!(status & TYPEC_VBUS_STATUS);
> +	mutex_unlock(&port->lock);
> +
> +	return ret;
> +}
> +
> +static int gen1_typec_set_vbus(struct tcpc_dev *tcpc, bool on, bool sink)
> +{
> +	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
> +	struct gen1_typec_port *port = tcpm->pmic_typec_port;
> +	bool changed = false;
> +	int ret = 0;
> +
> +	if (!port->vbus)
> +		return 0;
> +
> +	mutex_lock(&port->lock);
> +
> +	if (port->vbus_enabled == on)
> +		goto out;
> +
> +	if (on)
> +		ret = regulator_enable(port->vbus);
> +	else
> +		ret = regulator_disable(port->vbus);
> +
> +	if (!ret) {
> +		port->vbus_enabled = on;
> +		changed = true;
> +	}
> +
> +out:
> +	mutex_unlock(&port->lock);
> +
> +	/*
> +	 * set_vbus() may run during tcpm_register_port() before port_start()
> +	 * provides tcpm_port. Once registered, notify TCPM whenever the
> +	 * source regulator actually changes state. get_vbus() also accounts
> +	 * for vbus_enabled when GEN1 does not reflect sourced VBUS in
> +	 * TYPEC_VBUS_STATUS.
> +	 */
> +	if (changed && port->tcpm_port)
> +		tcpm_vbus_change(port->tcpm_port);

This describes a race condition which is implied in the existing code no ?

> +
> +	return ret;
> +}

The get() I agree with the set() I'm not so sure.

Looking at the original:

static int qcom_pmic_typec_port_set_vbus(struct tcpc_dev *tcpc, bool on, 
bool sink)
{
         struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
         struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
         int ret = 0;

         mutex_lock(&pmic_typec_port->vbus_lock);
         if (pmic_typec_port->vbus_enabled == on)
                 goto done;

         ret = qcom_pmic_typec_port_vbus_toggle(pmic_typec_port, on);
         if (ret)
                 goto done;

         pmic_typec_port->vbus_enabled = on;
         tcpm_vbus_change(tcpm->tcpm_port);

done:
         dev_dbg(tcpm->dev, "set_vbus set: %d result %d\n", on, ret);
         mutex_unlock(&pmic_typec_port->vbus_lock);

         return ret;
}

Why would the logic be substantially different to that ?

If such a race exists why is the solution not to have vbus_lock own the 
assignement of tcpm_port - and why not hold that lock for the durection 
of set_vbus as is done with pm8150b ?

reads code...

vbus_lock is supposed to own the vbus state is why - the point remains 
how is tcpm_port racy and why is that raciness unique to this particular 
version of set_vbus () ?

> +static int gen1_typec_get_cc(struct tcpc_dev *tcpc,
> +			     enum typec_cc_status *cc1,
> +			     enum typec_cc_status *cc2)
> +{
> +	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
> +	struct gen1_typec_port *port = tcpm->pmic_typec_port;
> +	enum typec_cc_status active = TYPEC_CC_OPEN;
> +	unsigned int status1, status2, status4;
> +	bool orientation_cc2;
> +	int ret;
> +
> +	*cc1 = TYPEC_CC_OPEN;
> +	*cc2 = TYPEC_CC_OPEN;
> +
> +	mutex_lock(&port->lock);
> +
> +	ret = regmap_read(port->regmap, port->base +
> +			  TYPEC_STATUS_4_REG, &status4);
> +	if (ret)
> +		goto out;
> +
> +	if (!(status4 & CC_ATTACHED))
> +		goto out;
> +
> +	/*
> +	 * CC is not stable until tCCDebounce has elapsed. TCPM ignores
> +	 * -EBUSY and the DEBOUNCE_DONE interrupt triggers a new read.
> +	 */
> +	if (!(status4 & TYPEC_DEBOUNCE_DONE)) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +	ret = regmap_read(port->regmap, port->base +
> +			  TYPEC_STATUS_1_REG, &status1);
> +	if (ret)
> +		goto out;
> +
> +	ret = regmap_read(port->regmap, port->base +
> +			  TYPEC_STATUS_2_REG, &status2);
> +	if (ret)
> +		goto out;
> +
> +	orientation_cc2 = !!(status4 & CC_ORIENTATION);
> +
> +	if (status4 & UFP_DFP_MODE_STATUS) {
> +		/* Local port is DFP/source; decode the partner's Rd/Ra. */
> +		switch (status2 & DFP_TYPEC_MASK) {
> +		case DFP_RA_RA:
> +			*cc1 = TYPEC_CC_RA;
> +			*cc2 = TYPEC_CC_RA;
> +			goto out;
> +		case DFP_RD_RD:
> +			*cc1 = TYPEC_CC_RD;
> +			*cc2 = TYPEC_CC_RD;
> +			goto out;
> +		case DFP_RD_RA_VCONN:
> +			active = TYPEC_CC_RD;
> +			*cc1 = TYPEC_CC_RA;
> +			*cc2 = TYPEC_CC_RA;
> +			break;
> +		case DFP_RD_OPEN:
> +			active = TYPEC_CC_RD;
> +			break;
> +		default:
> +			dev_dbg(port->dev, "unhandled GEN1 DFP status %#x\n",
> +				status2);
> +			goto out;
> +		}
> +	} else {
> +		/* Local port is UFP/sink; decode the partner's advertised Rp. */
> +		switch (status1 & UFP_TYPEC_MASK) {
> +		case UFP_TYPEC_RDSTD:
> +			active = TYPEC_CC_RP_DEF;
> +			break;
> +		case UFP_TYPEC_RD1P5:
> +			active = TYPEC_CC_RP_1_5;
> +			break;
> +		case UFP_TYPEC_RD3P0:
> +			active = TYPEC_CC_RP_3_0;
> +			break;
> +		default:
> +			dev_dbg(port->dev, "unhandled GEN1 UFP status %#x\n",
> +				status1);
> +			goto out;
> +		}
> +	}
> +
> +	if (orientation_cc2)
> +		*cc2 = active;
> +	else
> +		*cc1 = active;
> +
> +out:
> +	mutex_unlock(&port->lock);
> +	return ret;
> +}
> +
> +static int gen1_typec_set_cc(struct tcpc_dev *tcpc,
> +			     enum typec_cc_status cc)
> +{
> +	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
> +	struct gen1_typec_port *port = tcpm->pmic_typec_port;
> +	unsigned int role;
> +	unsigned int rp_current = 0;
> +	int ret;
> +
> +	switch (cc) {
> +	case TYPEC_CC_OPEN:
> +		role = TYPEC_DISABLE_CMD;
> +		break;
> +	case TYPEC_CC_RD:
> +		role = UFP_EN_CMD;
> +		break;
> +	case TYPEC_CC_RP_DEF:
> +		role = DFP_EN_CMD;
> +		rp_current = 0;
> +		break;
> +	case TYPEC_CC_RP_1_5:
> +	case TYPEC_CC_RP_3_0:
> +		/*
> +		 * GEN1 can only source 80 uA (default) or 180 uA (1.5 A).
> +		 * Advertise 1.5 A for 3.0 A requests, TCPM ignores set_cc()
> +		 * errors and would otherwise keep a stale Rp.
> +		 */
> +		role = DFP_EN_CMD;
> +		rp_current = EN_80UA_180UA_CUR_SOURCE;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&port->lock);
> +
> +	if (role == DFP_EN_CMD) {
> +		ret = regmap_update_bits(port->regmap,
> +					 port->base + TYPEC_CFG_2_REG,
> +					 EN_80UA_180UA_CUR_SOURCE,
> +					 rp_current);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	ret = gen1_typec_set_power_role(port, role);
> +
> +out:
> +	mutex_unlock(&port->lock);
> +	return ret;
> +}
> +
> +static int gen1_typec_set_polarity(struct tcpc_dev *tcpc,
> +				   enum typec_cc_polarity polarity)
> +{
> +	/* USB PHY orientation is handled outside this PMIC Type-C block. */
> +	return 0;
> +}
> +
> +static int gen1_typec_set_vconn(struct tcpc_dev *tcpc, bool on)
> +{
> +	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
> +	struct gen1_typec_port *port = tcpm->pmic_typec_port;
> +	unsigned int status4, orientation, mask, val;
> +	int ret;
> +
> +	mutex_lock(&port->lock);
> +
> +	ret = regmap_read(port->regmap, port->base +
> +			  TYPEC_STATUS_4_REG, &status4);
> +	if (ret)
> +		goto out;
> +
> +	/* VCONN is driven on the inactive CC pin. */
> +	orientation = (status4 & CC_ORIENTATION) ?
> +		      0 : VCONN_EN_ORIENTATION;
> +
> +	if (on) {
> +		mask = VCONN_EN_ORIENTATION | VCONN_EN_VALUE;
> +		val = orientation | VCONN_EN_VALUE;
> +	} else {
> +		mask = VCONN_EN_VALUE;
> +		val = 0;
> +	}
> +
> +	ret = regmap_update_bits(port->regmap,
> +				 port->base + TYPEC_SW_CTRL_REG,
> +				 mask, val);
> +
> +out:
> +	mutex_unlock(&port->lock);
> +	return ret;
> +}
> +
> +static int gen1_typec_start_toggling(struct tcpc_dev *tcpc,
> +				     enum typec_port_type port_type,
> +				     enum typec_cc_status cc)
> +{
> +	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
> +	struct gen1_typec_port *port = tcpm->pmic_typec_port;
> +	unsigned int role;
> +	unsigned int try_src = 0;
> +	unsigned int try_snk = 0;
> +	int ret;
> +
> +	switch (port_type) {
> +	case TYPEC_PORT_SRC:
> +		role = DFP_EN_CMD;
> +		break;
> +	case TYPEC_PORT_SNK:
> +		role = UFP_EN_CMD;
> +		break;
> +	case TYPEC_PORT_DRP:
> +		role = 0;
> +		/*
> +		 * Like the PM8150B backend, keep hardware Try.SNK enabled
> +		 * while TCPM owns the policy state machine.
> +		 */
> +		try_snk = EN_TRYSINK_MODE;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&port->lock);
> +
> +	ret = regmap_update_bits(port->regmap,
> +				 port->base + TYPEC_CFG_2_REG,
> +				 EN_TRY_SOURCE_MODE, try_src);
> +	if (ret)
> +		goto out;
> +
> +	ret = regmap_update_bits(port->regmap,
> +				 port->base + TYPEC_CFG_3_REG,
> +				 EN_TRYSINK_MODE, try_snk);
> +	if (ret)
> +		goto out;
> +
> +	/* Disable first so the state machine restarts toggling. */
> +	ret = gen1_typec_set_power_role(port, TYPEC_DISABLE_CMD);
> +	if (ret)
> +		goto out;
> +
> +	ret = gen1_typec_set_power_role(port, role);
> +
> +out:
> +	mutex_unlock(&port->lock);
> +	return ret;
> +}
> +
> +static irqreturn_t gen1_typec_irq(int irq, void *data)
> +{
> +	struct gen1_typec_port *port = data;
> +	unsigned int status4;
> +	bool vbus;
> +	bool vbus_changed = false;
> +
> +	/*
> +	 * GEN1 exposes a single aggregate Type-C change interrupt. Always
> +	 * notify TCPM of CC changes. Only generate a VBUS event when the
> +	 * hardware VBUS state changes, or on the first observation so TCPM
> +	 * can establish the initial vSafe0V state.
> +	 */
> +	mutex_lock(&port->lock);
> +
> +	if (!regmap_read(port->regmap, port->base +
> +			 TYPEC_STATUS_4_REG, &status4)) {
> +		if (status4 & TYPEC_VBUS_ERROR)
> +			dev_warn_ratelimited(port->dev, "Type-C VBUS error\n");
> +
> +		vbus = !!(status4 & TYPEC_VBUS_STATUS);
> +
> +		if (!port->vbus_valid || vbus != port->vbus_present) {
> +			port->vbus_present = vbus;
> +			port->vbus_valid = true;
> +			vbus_changed = true;
> +		}
> +	}
> +
> +	mutex_unlock(&port->lock);
> +
> +	if (port->tcpm_port) {
> +		if (vbus_changed)
> +			tcpm_vbus_change(port->tcpm_port);
> +
> +		tcpm_cc_change(port->tcpm_port);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int gen1_typec_port_start(struct pmic_typec *tcpm,
> +				 struct tcpm_port *tcpm_port)
> +{
> +	struct gen1_typec_port *port = tcpm->pmic_typec_port;
> +	unsigned int irq_mask;
> +	int ret;
> +
> +	/*
> +	 * TYPE_C_OR_U_USB == 0 selects the Type-C state machine on GEN1.
> +	 */
> +	ret = regmap_update_bits(port->regmap,
> +				 port->base + TYPEC_CFG_REG,
> +				 TYPEC_OR_U_USB, 0);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * GEN1 exposes a single aggregate type-c-change interrupt, the
> +	 * handler re-reads TYPEC_STATUS_4 to find out what changed.
> +	 */
> +	irq_mask = CCSTATE_CHANGE_INT_EN | DEBOUNCE_DONE_INT_EN |
> +		   VBUS_ASSERT_INT_EN | VBUS_DEASSERT_INT_EN |
> +		   VBUS_ERROR_INT_EN;
> +
> +	ret = regmap_write(port->regmap,
> +			   port->base + TYPEC_INTRPT_ENB_REG,
> +			   irq_mask);
> +	if (ret)
> +		return ret;
> +
> +	/* Select software control for VCONN, initially disabled. */
> +	ret = regmap_update_bits(port->regmap,
> +				 port->base + TYPEC_SW_CTRL_REG,
> +				 VCONN_EN_SRC | VCONN_EN_VALUE,
> +				 VCONN_EN_SRC);
> +	if (ret)
> +		return ret;
> +
> +	port->tcpm_port = tcpm_port;
> +	enable_irq(port->irq);
> +
> +	return 0;
> +}
> +
> +static void gen1_typec_port_stop(struct pmic_typec *tcpm)
> +{
> +	struct gen1_typec_port *port = tcpm->pmic_typec_port;
> +
> +	disable_irq(port->irq);
> +	port->tcpm_port = NULL;
> +}
> +
> +int qcom_pmic_typec_gen1_port_probe(struct platform_device *pdev,
> +				    struct pmic_typec *tcpm,
> +				    const struct pmic_typec_port_resources *res,
> +				    struct regmap *regmap,
> +				    u32 base)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct gen1_typec_port *port;
> +	struct fwnode_handle *connector;
> +	int ret;
> +
> +	if (!res->nr_irqs || res->nr_irqs > PMIC_TYPEC_MAX_IRQS)
> +		return -EINVAL;
> +
> +	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	connector = device_get_named_child_node(dev, "connector");
> +	if (!connector)
> +		return -EINVAL;
> +
> +	port->vbus = devm_of_regulator_get_optional(dev,
> +						    to_of_node(connector),
> +						    "vbus");
> +	fwnode_handle_put(connector);
> +	if (IS_ERR(port->vbus)) {
> +		if (PTR_ERR(port->vbus) != -ENODEV)
> +			return PTR_ERR(port->vbus);
> +		port->vbus = NULL;
> +	}
> +
> +	port->irq = platform_get_irq_byname(pdev,
> +					    res->irq_params[0].irq_name);
> +	if (port->irq < 0)
> +		return port->irq;
> +
> +	port->dev = dev;
> +	port->regmap = regmap;
> +	port->base = base;
> +	mutex_init(&port->lock);
> +
> +	ret = devm_request_threaded_irq(dev, port->irq, NULL,
> +					gen1_typec_irq,
> +					IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +					res->irq_params[0].irq_name, port);
> +	if (ret)
> +		return ret;
> +
> +	tcpm->pmic_typec_port = port;
> +
> +	tcpm->tcpc.get_vbus = gen1_typec_get_vbus;
> +	tcpm->tcpc.set_vbus = gen1_typec_set_vbus;
> +	tcpm->tcpc.get_cc = gen1_typec_get_cc;
> +	tcpm->tcpc.set_cc = gen1_typec_set_cc;
> +	tcpm->tcpc.set_polarity = gen1_typec_set_polarity;
> +	tcpm->tcpc.set_vconn = gen1_typec_set_vconn;
> +	tcpm->tcpc.start_toggling = gen1_typec_start_toggling;
> +
> +	tcpm->port_start = gen1_typec_port_start;
> +	tcpm->port_stop = gen1_typec_port_stop;
> +
> +	return 0;
> +}

This probe function is 1:1 with the existing code for a number of lines 
=> functional decompositon and code reuse - breaking out if/where it is 
warranted.

So that's my overall comment here - code sharing except where it cannot 
be sustained which implies a shared data-structure, consistent type of 
locks and IMO consistent taking and releasing of those locks.

set_vbus could surely have a generic function where we represent the 
_logic_ of what we mean better/consistently instead of clone/own and 
potentially substantial differentation between the two schemes in the 
one driver.

> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port_gen1.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port_gen1.h
> new file mode 100644
> index 0000000000000..45e373d22edca
> --- /dev/null
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port_gen1.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __QCOM_PMIC_TYPEC_PORT_GEN1_H__
> +#define __QCOM_PMIC_TYPEC_PORT_GEN1_H__
> +
> +#include "qcom_pmic_typec_port.h"
> +
> +extern const struct pmic_typec_port_resources gen1_port_res;
> +
> +int qcom_pmic_typec_gen1_port_probe(struct platform_device *pdev,
> +				    struct pmic_typec *tcpm,
> +				    const struct pmic_typec_port_resources *res,
> +				    struct regmap *regmap,
> +				    u32 base);
> +
> +#endif /* __QCOM_PMIC_TYPEC_PORT_GEN1_H__ */
> 

