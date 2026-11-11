Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395730;
	b=AL8y7ehvDdevFXRzmBZ9rksZl3IxlRK3sBqipXF6mj2974WCNVjRt7JMLEAc8W3CQKc4
	 WOy8nI34rH8A3B5VURAkYtQYKIhtOUvh3NDCHdw4VI8z/hyPMzzSGbgiIWQr2drts0xPP
	 nbnm8knpwgZ5zP0+XEi7g9XrWjNBJX2bVq73uMWP7LBSgkF1Z9YgKY1/7SfmpDxlQGwd9
	 ghn/eOvxw28ixjlQmVJr5QBoZAG4gD5DbK2cNstt1iLUaqxojxv1hDdWWj5yoJEHexRvI
	 rsnIC/qfMDOLZ+jywPzxNBTci816ENXMDZhit7w4fwO8FPQfliTmNtYh6+TgyjWHttw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Rk/Or+A2hVLusxWCw3wVAt7Tsp4Mo0Wjedz84BpaMmY=;
	b=tAfo5lAGnM81GHsNG06PDWrrgE653ApRkSHqbwLjedh8LQCs3BNJ9quhgdUbxriBr6xZ
	 QRKxWvngcQ8Zb+1/TfRA+oM7ZeL9eLZutEp7AK1xtAWtac2FPVAnrBok5dMPGI3QL2NIg
	 E094mwA8T3J0F9feB3m/NbKDLV7NIdisTbnbmI8kvWWKVWnct3Yf0Yt++AA7lNniM5AJd
	 0iCRcQIPVwvYvdf/qlxYHmbyvPWVi2JvIPelZQ59Odq4SBAuk80owo9ha1ZnDsz8whd9X
	 RC7XMH8iQJi73Ass6lp7UfMy2QFDAZHIVs57blYq6hJ6ribjH22kRT5zHmm1/rYBHSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qsx7KpX8;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90982606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90982606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qsx7KpX8
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37628596783so2080339eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395730; x=1795000530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rk/Or+A2hVLusxWCw3wVAt7Tsp4Mo0Wjedz84BpaMmY=;
        b=Qsx7KpX8tzcudncfssN3QfFwpo9MZ+ZW6qbAPgbzTgsnRKSj2cD0eFizh+I0ZEhGKi
         yqUqf69OMGRpxbUjCbA1ayMB8SC/U1SqZWId2fbCngjzj3oFe+QpDBfyXQXRaome2k1V
         b5AtX5tqiqzYSDYrvFdoKd4wM7YVYW4979hjMqYvP9ZjqLNtGsJuSP4aygk3cSvUkbbx
         7QKZYm2NmAhVkNzFudlx8XxYqDYZfs/9EM5c1rMCx7h4f+Zn22yw9qEd1drXMmih86Zw
         iyxwC5pcA2MpiJ5Q330BMW2OZZQvsnT2v/Nj4zK0UlsO9hY1pyIwTyZNTi7732wreux3
         KIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395730; x=1795000530;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rk/Or+A2hVLusxWCw3wVAt7Tsp4Mo0Wjedz84BpaMmY=;
        b=eIoyPVmn1uAhTR1QOVYK+GyYeMTndogfDxf47pvkKkLpOr/+7q0KDijIsWPErWsOhM
         9gRKX7j0FeQPODrWBWrUwiXHVWceryIMFKi/uIsuDsWtMsfSkUox6u9bVcieiyJ3BYv1
         U0ckb9IOP+aPx8Y5K7kZRMR2kAjfHq5n8Zz6ggBCCmA2C8IuHIrC+gVfyjK/fYTPqHzv
         +U8aWE2DbkQunBgYuRdS6HB7q0m2bahkYipd0nyZOb3Sx0wbAPIWYHL6RZIp6Leajhyl
         x2Yo1oLnJYRDP7b5/oXLGc1hgvWa7A8rzrOY8tDkWo5R84Zmwb0z/ShOJEcBcSlTTLoK
         zWvw==
X-Forwarded-Encrypted: i=1; AL+hErEtU/idd1V5/rX82o9go4mPWfKlDhk/UA/poaX0KA8vu8mE834pwf4cQ2Qbx4UQnd8HW1TXXwOJKZPU7MQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ANTL+L6LTzKMp4VLl73U7VT/3OIx1osPieuI97fkoJXqmnk8E
	Ix1bSf5HJDBUE8uMegxfN1ZiSNWPth5K0OKbefn92WWz8DqHfkx0cKdy
X-Gm-Gg: AYBFou3ucgbFfCbTI7S+j6pCzlTImHWa+jdtRUHpTGBnGdfIdWV7pyNYkhXCeQPzDOn
	8KP4FLFgzfCm3AS1kk5CukZttSQb5fJPKYea4dkVErfLCPjgYfTWCrnjh2zSU4qZlBAmSkPTn0/
	Vm3ua644xZJwvuHBrm8ptt2tqVLo39eIlI8fZaZR7boczLN9kBBnG5PAK4MDyMbHEThSC/hXnAV
	JC9TN0R46D4zLiEyrBs/RzRBth6C/pvzj8Hbhkp6+dFt0yl8g02xTFoVpipXje9NOtzbYeZ1iam
	wtMh6t0ExHAJpIY0Rpg8XKlJGaAXaEj8PwfRuU58xtmrRYqnE2JRFEhrBVhtPAG8GTltfywIkRD
	iIHDRuAyN7NL1jtiegOEMf30vlUrBm4u1cifuJoO4FakOBZN0x5wc6wPhc2FZeDAQUi/lecE0Ir
	LRUbq8ROOldt6t5DkHMU/BjVOxyLlg1EzfTXuOlqOhlhMfVtdKY37G9F08Xr6AhDdKyyM2ke+kf
	1PwbwBMqaBgafAOMM6kuUaaC1NyxBTPOGCRug9uyVHecrhk381m+c7WmIBw90Bytssfzmr16Rq+
	KvpoTE1JEECv8+bgWXokqZfhTo8G10i5K53xfC4z54aDKi7AlKRau62vd9QStslqRJHxaBra2tu
	TjR7dj+WnFJK+MCWZeOgne3M=
X-Received: by 2002:a05:7301:2907:b0:369:fdae:c9fd with SMTP id 5a478bee46e88-376850ce224mr3701102eec.13.1794395729453;
        Wed, 11 Nov 2026 03:15:29 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm17598082eec.14.2026.11.11.03.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 03:15:28 -0800 (PST)
Date: Wed, 11 Nov 2026 03:15:30 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Aaron Ma <aaron.ma@canonical.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Rong Zhang <i@rong.moe>, Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_platform/x86=3A_lenovo-wmi-oth?=
 =?US-ASCII?Q?er=3A_Deconflict_battery_with_thinkpad=5Facpi?=
User-Agent: Thunderbird for Android
In-Reply-To: <20261111083529.727285-1-aaron.ma@canonical.com>
References: <20261111083529.727285-1-aaron.ma@canonical.com>
Message-ID: <36F5DA90-A839-4EC7-B916-517EBA565C1C@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 11, 2026 12:35:29 AM PST, Aaron Ma <aaron=2Ema@canonical=2Ecom>=
 wrote:
>ThinkPads expose battery charge thresholds and charge_behaviour through
>thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups=2E The
>Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
>charge_behaviour and charge_types on systems advertising those WMI
>capabilities=2E
>
>When lenovo-wmi-other registers first, thinkpad_acpi fails to create a
>duplicate charge_behaviour sysfs attribute and unregisters its battery
>extension=2E Conversely, registering or updating any power_supply_ext on
>the same battery runs sysfs_update_groups(), which removes standard
>power-supply attributes not owned by power_supply_core and wipes out
>thinkpad_acpi's charge_control_start_threshold,
>charge_control_end_threshold, and charge_behaviour files=2E
>
>Match the existing ideapad_laptop deconfliction and skip registering
>the WMI battery extension when CONFIG_THINKPAD_ACPI is enabled and a
>ThinkPad ACPI hotkey device (LEN0268, LEN0068, or IBM0068) is present,
>unless overridden by force_load_psy_ext=2E
>
>Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery ch=
arge limiting")
>Signed-off-by: Aaron Ma <aaron=2Ema@canonical=2Ecom>
>---
> drivers/platform/x86/lenovo/wmi-other=2Ec | 14 ++++++++++++--
> 1 file changed, 12 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/platform=
/x86/lenovo/wmi-other=2Ec
>index bd64e7b44669d=2E=2E6175f1e6c51a7 100644
>--- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>+++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>@@ -909,8 +909,9 @@ static acpi_status lwmi_acpi_match(acpi_handle handle=
, u32 lvl,
>  * lwmi_om_psy_ext_init() - Hooks power supply extension to device batte=
ry
>  * @priv: Pointer to the lwmi_om_priv drvdata=2E
>  *
>- * Checks if the ideapad_laptop driver is going to manage charge attribu=
tes first,
>- * then if not, hooks the battery to our WMI methods if they are support=
ed=2E
>+ * Checks if the thinkpad_acpi or ideapad_laptop driver is going to mana=
ge
>+ * charge attributes first, then if not, hooks the battery to our WMI me=
thods
>+ * if they are supported=2E
>  */
> static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
> {
>@@ -928,6 +929,15 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv=
 *priv)
> 	if (force_load_psy_ext)
> 		goto load_psy_ext;
>=20
>+	/* Deconflict thinkpad_acpi driver */
>+	if (IS_ENABLED(CONFIG_THINKPAD_ACPI) &&
>+	    (acpi_dev_present("LEN0268", NULL, -1) ||
>+	     acpi_dev_present("LEN0068", NULL, -1) ||
>+	     acpi_dev_present("IBM0068", NULL, -1))) {
>+		dev_dbg(&priv->wdev->dev, "thinkpad_acpi driver manages battery for de=
vice\n");
>+		return;
>+	}
>+

Hi Aaron,

This doesn't validate that the methods exist on the Thinkpad device=2E Tha=
t could have us deferring to a driver that doesn't fully expose the battery=
 on some devices=2E After looking at tpacpi_battery_probe(), I think we can=
 rewrite this function to validate both the ideapad and thinkpad dicovery=
=2E

- Add a for loop to find a matching handle, include the existing ideapad h=
andle and the 3 thinkpad handles=2E
- Use acpi_has_method() to find if the feature is supported=2E If it's an =
ideapad handle, check for "GBMD" and "SBMC"=2E If it is a thinkpad handle, =
check for "GET_DISHCHARGE" and "GET_INHIBIT"=2E

For this I think we can make two const, over for each method pair, then ma=
ke a const struct list of method pairs and handles=2E That will allow you t=
o loop over the list to quickly find a matching handle, then use that index=
 to access the method names without looping a second time=2E The struct dec=
laration for this would keep it tidy and expandable=2E

Additionally, the comment & description for force_load_psy_ext needs to be=
 updated to include the thinkpad case with this change=2E

I do like the fact that you check for the config to be set first=2E That i=
s something the current implementation lacks=2E Perhaps a driver_config fie=
ld on the same struct could hold that data=2E Then each check becomes: do y=
ou have the handle -> do you have its methods -> is it configured=2E

Thanks,
- Derek

> 	/* Deconflict ideapad_laptop driver */
> 	ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
> 	if (ret)

