Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C37353A77
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789943312; cv=none; b=A/ZXBoR9m3JEdg1vBkBJzzcMsLPhiLceGFquY0U+xz6+8xJA7Xr2r6IpaRyZpJ3s0fpr/4LCmCzDPADHzhfCxqiycyM0WzHJKmAM75Fa1YfrEg/Re3Oupc/v1zk9VaCtWqPl5SkJxbQqIO1XB+VEMXudlkmzDcB5Z/TSztTbi28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789943312; c=relaxed/simple;
	bh=O22fW2VLc7mf4Oo67CDXZ2cHkoY5E8pi306rZrJBuU8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=pMKogr5UihYT1ffb+SFh/hjQ0fnCVPnIFqKVnM5nAjEgolCqFXZX9UgDN0aC++68JlehFZMLZsOfWET135UFVZYa6ifJXZLHFnP+5FxEjASOa1ZfaBqZueO/oSKd0tXHgvtoLF83moX9oFZssP317X8BX8oL9nn0ZoBpQKmQZlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSpBrDyS; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSpBrDyS"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so2102461a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789943306; x=1790548106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jf8Pu2xOA1sSuhrstqc5erM/AfPvoAnUDQ+r9hCuDfU=;
        b=PSpBrDySAUkC3AJo5iQ5iiQja1hdenFkJiPCkmDLK0juMyUnPepWXOEDVlTYKvmSEY
         bD+s/IaWPW4tDkunGPSvCHPqG0cGd7+oOe2aUPZOg9vO/dCy5iYfLvEKq0C8wUHkX7j3
         61agNFWEqV1DQZXBJLqGEOre7IkHl6/GikbdpPBz8JmUIbSs1NUkv0j6SMYmQ7x8F79A
         BgHPGEsCYKaZfDq9Ry7yUFTscl24mgY7mN++9a7VAhU7z34pBh+W4t5xyisoedhSvdtY
         +WgSm9N2ukvrc2uhrdVXjTkZGPT+XUatcotVF8bgrrFHVBx9dUNZWQWQ6MAgGDLeqL7M
         J9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789943306; x=1790548106;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jf8Pu2xOA1sSuhrstqc5erM/AfPvoAnUDQ+r9hCuDfU=;
        b=CPcELYtmo2wZ913rW8wAmLPr00buAAE9C72iPuSOSmop2Ox5iA3F7GLqP6qojnGZ58
         H9Yj9u3FJwilXsIMXyIF216zkE2fV42mGwXg8XpOetGo1+N5m5RbjiRQlUIcpJiYJXMI
         kr/W7p3ZaIvFdN+9YtATRPRSbOH83wubQBrJ8ypkTQVwrWCpQyHq4LPVTQJ745lQRm/i
         41Es5JAF5NCslZFZjt101iX3KAqRqSb8koGfB8Beg2bNZRf1m8m+9rIw7cpaO1ostTom
         fTrRH09wRiyadxaWs+kppb8yrRTb2SdUYyb1FHd5CJXU0dtKKT3KMVMTh7VoDsRhxInb
         xSzA==
X-Gm-Message-State: AFuF++k1mdgKN04BMovozien4PeDKmwmSVKwpA9OM6F6cwqYRacGtAHR
	hTaL0VKaK3EuzpJORBGWqcbCv6QGA12YHlWojrMrfGYOJhPaHnzVqnqI
X-Gm-Gg: AYBFou1ILTpFY0FaknNUQrrncau/wCeyk3HatZj0VwqwlSxSIFJpwGGPbUlv6uxokHe
	g878voTRt892AcganKPfChsB67h75vn7D+c/D55/oPvC3694FwZ73WMJrmg30ZN79/YvgmxkwGD
	BMPgDEGpigO/SWysj5FDT4RnCyGeRW3gs4Orqb+0UxHznZ1wdk/XLhaQVgBaOeBuPwl/RVb8ppM
	3aTjrPyxQ1nW9MEOkbjpoZ6CATljbnCpaUye85nDBJLkT0k7+i6AGPTu4j33wXxEIdV33HzKyFz
	PqLLf3jT1oL8qriC/G+ijk+Bb/VF/AL5xooypxzsmX3iwzb5TjExAFI3nfKUiwBDakuAboNS9hd
	YHtUJzq5cnXxkvp7pFW3DDYtHDBmOCFluwoEphvJUyGyCQD+i8KO1ZlofqHXVJFDHDRGLuTlh6+
	8+7aky36X8pG6H5HqrudxnnO1AYDeU8gf7v9dNpLsA7d1xzTEWmS/fkyFDKrZUUI4Zm5NACbUWE
	6zYce7VbWJwu3GuBBU9I67/4fV5Wb3ePendFb87S8mdIE/uZZlXw9jZoeluGwvPfokVm1DDhmln
	ZvA=
X-Received: by 2002:a17:90b:2ccf:b0:39e:6a7e:ee1d with SMTP id 98e67ed59e1d1-39e6a7eef8amr8766338a91.41.1789943305865;
        Sun, 20 Sep 2026 15:28:25 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55cef9bsm14872272c88.10.2026.09.20.15.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 15:28:25 -0700 (PDT)
Date: Sun, 20 Sep 2026 15:28:24 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Antheas Kapenekakis <lkml@antheas.dev>, platform-driver-x86@vger.kernel.org
CC: linux-kernel@vger.kernel.org,
 =?ISO-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Eileen <eileen@one-netbook.com>
Subject: Re: [PATCH v1 1/2] platform/x86: oxpec: Fix Apex charge limit control
User-Agent: Thunderbird for Android
In-Reply-To: <20260920190438.3444923-1-lkml@antheas.dev>
References: <20260920190438.3444923-1-lkml@antheas.dev>
Message-ID: <C599BA1D-DEE2-4DFB-BDBF-76799C52E68A@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 20, 2026 12:04:37 PM PDT, Antheas Kapenekakis <lkml@antheas=2E=
dev> wrote:
>The OneXPlayer Apex uses E5/E6 for battery bypass / charge limit, making
>it the first device to deviate=2E This was verified by a user on Windows
>with BIOS version 2=2E17 and later by running this kernel patch=2E
>
>Drop X1_ from the MASK variables as they are common in all devices,
>introduce a board enum for Apex, and make it use the new E5/E6 registers
>for charge limit / bypass=2E Apply the same quirks as oxp_fly, since APEX
>uses the same registers otherwise=2E
>
>Fixes: 3385ea97c14d ("platform/x86: oxpec: Add support for OneXPlayer APE=
X")
>Signed-off-by: Antheas Kapenekakis <lkml@antheas=2Edev>
>---
> drivers/platform/x86/oxpec=2Ec | 68 ++++++++++++++++++++++++++++--------
> 1 file changed, 53 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/platform/x86/oxpec=2Ec b/drivers/platform/x86/oxpec=
=2Ec
>index 34bb17fca148=2E=2E38c272995437 100644
>--- a/drivers/platform/x86/oxpec=2Ec
>+++ b/drivers/platform/x86/oxpec=2Ec
>@@ -50,6 +50,7 @@ enum oxp_board {
> 	oxp_x1,
> 	oxp_g1_i,
> 	oxp_g1_a,
>+	oxp_apex,
> };
>=20
> static enum oxp_board board;
>@@ -93,11 +94,14 @@ static struct device *oxp_dev;
> #define OXP_X1_CHARGE_LIMIT_REG		0xA3 /* X1 charge limit (%) */
> #define OXP_X1_CHARGE_INHIBIT_REG	0xA4 /* X1 bypass charging */
>=20
>-#define OXP_X1_CHARGE_INHIBIT_MASK_AWAKE	0x01
>+#define OXP_APEX_CHARGE_LIMIT_REG	0xE5 /* Apex charge limit (%) */
>+#define OXP_APEX_CHARGE_INHIBIT_REG	0xE6 /* Apex bypass charging */
>+
>+#define OXP_CHARGE_INHIBIT_MASK_AWAKE	0x01
> /* X1 Mask is 0x0A, F1Pro is 0x02 but the extra bit on the X1 does nothi=
ng=2E */
>-#define OXP_X1_CHARGE_INHIBIT_MASK_OFF		0x02
>-#define OXP_X1_CHARGE_INHIBIT_MASK_ALWAYS	(OXP_X1_CHARGE_INHIBIT_MASK_AW=
AKE | \
>-						 OXP_X1_CHARGE_INHIBIT_MASK_OFF)
>+#define OXP_CHARGE_INHIBIT_MASK_OFF		0x02
>+#define OXP_CHARGE_INHIBIT_MASK_ALWAYS	(OXP_CHARGE_INHIBIT_MASK_AWAKE | =
\
>+					 OXP_CHARGE_INHIBIT_MASK_OFF)
>=20
> static const struct dmi_system_id dmi_table[] =3D {
> 	{
>@@ -154,7 +158,7 @@ static const struct dmi_system_id dmi_table[] =3D {
> 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER APEX"),
> 		},
>-		=2Edriver_data =3D (void *)oxp_fly,
>+		=2Edriver_data =3D (void *)oxp_apex,
> 	},
> 	{
> 		=2Ematches =3D {
>@@ -352,6 +356,7 @@ static umode_t tt_toggle_is_visible(struct kobject *k=
obj,
> 	case oxp_x1:
> 	case oxp_g1_i:
> 	case oxp_g1_a:
>+	case oxp_apex:
> 		return attr->mode;
> 	default:
> 		break;
>@@ -381,6 +386,7 @@ static ssize_t tt_toggle_store(struct device *dev,
> 	case oxp_fly:
> 	case oxp_mini_amd_pro:
> 	case oxp_g1_a:
>+	case oxp_apex:
> 		reg =3D OXP_TURBO_SWITCH_REG;
> 		mask =3D OXP_TURBO_TAKE_VAL;
> 		break;
>@@ -427,6 +433,7 @@ static ssize_t tt_toggle_show(struct device *dev,
> 	case oxp_fly:
> 	case oxp_mini_amd_pro:
> 	case oxp_g1_a:
>+	case oxp_apex:
> 		reg =3D OXP_TURBO_SWITCH_REG;
> 		mask =3D OXP_TURBO_TAKE_VAL;
> 		break;
>@@ -524,6 +531,7 @@ static bool oxp_psy_ext_supported(void)
> 	case oxp_g1_i:
> 	case oxp_g1_a:
> 	case oxp_fly:
>+	case oxp_apex:
> 		return true;
> 	default:
> 		break;
>@@ -537,12 +545,24 @@ static int oxp_psy_ext_get_prop(struct power_supply=
 *psy,
> 				enum power_supply_property psp,
> 				union power_supply_propval *val)
> {
>+	u8 limit_reg, inhibit_reg;
> 	long raw_val;
> 	int ret;
>=20
>+	switch (board) {
>+	case oxp_apex:
>+		limit_reg =3D OXP_APEX_CHARGE_LIMIT_REG;
>+		inhibit_reg =3D OXP_APEX_CHARGE_INHIBIT_REG;
>+		break;
>+	default:
>+		limit_reg =3D OXP_X1_CHARGE_LIMIT_REG;
>+		inhibit_reg =3D OXP_X1_CHARGE_INHIBIT_REG;
>+		break;
>+	}
>+
> 	switch (psp) {
> 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
>-		ret =3D read_from_ec(OXP_X1_CHARGE_LIMIT_REG, 1, &raw_val);
>+		ret =3D read_from_ec(limit_reg, 1, &raw_val);
> 		if (ret)
> 			return ret;
> 		if (raw_val < 0 || raw_val > 100)
>@@ -550,14 +570,14 @@ static int oxp_psy_ext_get_prop(struct power_supply=
 *psy,
> 		val->intval =3D raw_val;
> 		return 0;
> 	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
>-		ret =3D read_from_ec(OXP_X1_CHARGE_INHIBIT_REG, 1, &raw_val);
>+		ret =3D read_from_ec(inhibit_reg, 1, &raw_val);
> 		if (ret)
> 			return ret;
>-		if ((raw_val & OXP_X1_CHARGE_INHIBIT_MASK_ALWAYS) =3D=3D
>-		    OXP_X1_CHARGE_INHIBIT_MASK_ALWAYS)
>+		if ((raw_val & OXP_CHARGE_INHIBIT_MASK_ALWAYS) =3D=3D
>+		    OXP_CHARGE_INHIBIT_MASK_ALWAYS)
> 			val->intval =3D POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE;
>-		else if ((raw_val & OXP_X1_CHARGE_INHIBIT_MASK_AWAKE) =3D=3D
>-			 OXP_X1_CHARGE_INHIBIT_MASK_AWAKE)
>+		else if ((raw_val & OXP_CHARGE_INHIBIT_MASK_AWAKE) =3D=3D
>+			 OXP_CHARGE_INHIBIT_MASK_AWAKE)
> 			val->intval =3D POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_AWAKE;
> 		else
> 			val->intval =3D POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
>@@ -573,29 +593,41 @@ static int oxp_psy_ext_set_prop(struct power_supply=
 *psy,
> 				enum power_supply_property psp,
> 				const union power_supply_propval *val)
> {
>+	u8 limit_reg, inhibit_reg;
> 	long raw_val;
>=20
>+	switch (board) {
>+	case oxp_apex:
>+		limit_reg =3D OXP_APEX_CHARGE_LIMIT_REG;
>+		inhibit_reg =3D OXP_APEX_CHARGE_INHIBIT_REG;
>+		break;
>+	default:
>+		limit_reg =3D OXP_X1_CHARGE_LIMIT_REG;
>+		inhibit_reg =3D OXP_X1_CHARGE_INHIBIT_REG;
>+		break;
>+	}
>+
> 	switch (psp) {
> 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> 		if (val->intval < 0 || val->intval > 100)
> 			return -EINVAL;
>-		return write_to_ec(OXP_X1_CHARGE_LIMIT_REG, val->intval);
>+		return write_to_ec(limit_reg, val->intval);
> 	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> 		switch (val->intval) {
> 		case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
> 			raw_val =3D 0;
> 			break;
> 		case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_AWAKE:
>-			raw_val =3D OXP_X1_CHARGE_INHIBIT_MASK_AWAKE;
>+			raw_val =3D OXP_CHARGE_INHIBIT_MASK_AWAKE;
> 			break;
> 		case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE:
>-			raw_val =3D OXP_X1_CHARGE_INHIBIT_MASK_ALWAYS;
>+			raw_val =3D OXP_CHARGE_INHIBIT_MASK_ALWAYS;
> 			break;
> 		default:
> 			return -EINVAL;
> 		}
>=20
>-		return write_to_ec(OXP_X1_CHARGE_INHIBIT_REG, raw_val);
>+		return write_to_ec(inhibit_reg, raw_val);
> 	default:
> 		return -EINVAL;
> 	}
>@@ -656,6 +688,7 @@ static int oxp_pwm_enable(void)
> 	case oxp_x1:
> 	case oxp_g1_i:
> 	case oxp_g1_a:
>+	case oxp_apex:
> 		return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_MANUAL);
> 	default:
> 		return -EINVAL;
>@@ -676,6 +709,7 @@ static int oxp_pwm_disable(void)
> 	case oxp_x1:
> 	case oxp_g1_i:
> 	case oxp_g1_a:
>+	case oxp_apex:
> 		return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_AUTO);
> 	default:
> 		return -EINVAL;
>@@ -696,6 +730,7 @@ static int oxp_pwm_read(long *val)
> 	case oxp_x1:
> 	case oxp_g1_i:
> 	case oxp_g1_a:
>+	case oxp_apex:
> 		return read_from_ec(OXP_SENSOR_PWM_ENABLE_REG, 1, val);
> 	default:
> 		return -EOPNOTSUPP;
>@@ -732,6 +767,7 @@ static int oxp_pwm_fan_speed(long *val)
> 	case oxp_mini_amd_a07:
> 	case oxp_mini_amd_pro:
> 	case oxp_g1_a:
>+	case oxp_apex:
> 		return read_from_ec(OXP_SENSOR_FAN_REG, 2, val);
> 	default:
> 		return -EOPNOTSUPP;
>@@ -764,6 +800,7 @@ static int oxp_pwm_input_write(long val)
> 	case oxp_fly:
> 	case oxp_mini_amd_pro:
> 	case oxp_g1_a:
>+	case oxp_apex:
> 		return write_to_ec(OXP_SENSOR_PWM_REG, val);
> 	default:
> 		return -EOPNOTSUPP;
>@@ -803,6 +840,7 @@ static int oxp_pwm_input_read(long *val)
> 	case oxp_fly:
> 	case oxp_mini_amd_pro:
> 	case oxp_g1_a:
>+	case oxp_apex:
> 	default:
> 		ret =3D read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
> 		if (ret)
>
>base-commit: fd73f4a6659897191fa0d40695fe370925dd3780

LGTM, maybe CC stable in the commit tags since this goes back to 6=2E19 I =
think=2E

Reviewed-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>

- Derek

