Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433444;
	b=CV+xSi72VHrS64uNdkm6lXUZYWWRFhjx2/887/dCF6piFH6IbnI9rWNu2oLXBfL+Zsrk
	 Bu5Zborhjn7HpnfwHBmx53G8kC2/HE8AdS69QiKdqluXN3uwgXjaROf/+HJ3zw+41B6X2
	 +3QMij1hHVymYHgoX/2JWxUB/e7bgr15LNvuwFCWKyGw56en1IoY89pcKqVlL0HKxC7eJ
	 dlX8r9QDqM108j/6JhACzooAaSU2moPPjOxgmN9Bgy/Bd0I0J4FR70I+3widzxCSzPWUF
	 vcV2ug0WXMiAuqPQuDRYhPYmiKMU0ouyWS9dWA5TpLWvvKNJAsXAJnh9ppXRShpnOTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433444;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4cadRYnVR2CaA6YfqZFXvNa6BAced/MGw04qOE2Ft4I=;
	b=4Lm9avcV3BpqCNEwnuOKKuHTV4KWc2WTvOGv3UPDyX8zrfVrSo2m0AJGYSnQjewuhlLT
	 kyMHsZlLfZDe8KMnMWaXoxor/VxZNgh5eJV8MYhA7HoLbpifZDU0DzBOUrt/OpjMfYiFf
	 uf3NiW+CZwPfnDSwtyx66YW4/mgHhNEL/23DPgJlCPkXL2Het7nFC/Lk4AeUnsEK8nYUy
	 rhi+PnPpzzsTgql5Y5VZkAwj6KB+Mb0FCcOO1Zzkr1LUshjfMGU2+dwTWOFdxPr9jJcfe
	 8cF4w0TmIwY7ozaSSEhqcGApXcYzDb/yBanfIzYLjuDradwyY5DSsumqDxybGrV627A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=empyreal.works;
	spf=pass smtp.mailfrom=empyreal.works;
	dkim=pass header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b="qVi/ACUc";
	arc=none smtp.remote-ip=185.70.43.99
Received: from mail-4399.protonmail.ch (mail-4399.protonmail.ch [185.70.43.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FCA606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96FCA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=qVi/ACUc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1794433441; x=1794692641;
	bh=4cadRYnVR2CaA6YfqZFXvNa6BAced/MGw04qOE2Ft4I=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=qVi/ACUcvFYQc0spraH58LezaQdnDJ07edknMiOnOX6VZAsq3YHHW9HmNl6jXr22Z
	 RlZCxYKHhslsEzEMr3qraEHuZKai3FdMDALsyLj/gCAt+3Ef6T6X72ai1LC9iDiEYe
	 w7flxSrdlKHK5Ye0Wcue216s0o5ypqlayIPAfcBhkSFRv2Q+o92n+Jo9qhc34NC+R6
	 sv6wpf/AH6eBhT1YM1nKy6y9RL2zOTTPJGtZGdS/wfMF9U+4nfjz/ItxJU55RZKCoI
	 mCSI6MjJBMNe9ntOOUSeW3/5OppAsk/qDgJY6zipjC9hEVWLJvePNat01Z/HMXG/kK
	 Md0i1eUn/xasA==
Date: Wed, 11 Nov 2026 21:43:57 +0000
To: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: asus-wmi: write the thermal policy only when it changes
Message-ID: <20261111-asus-wmi-tpolicy-5fbc4e09@empyreal.works>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: 08349a7033f54b4b039352a97110f135167fe312
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On the ROG Flow Z13 (GZ302EA), writing the throttle thermal policy makes
the firmware re-apply its own package power limits for that mode, also
when the written mode is the one already set. Userspace re-asserts the
current platform profile on events such as AC plug and unplug, so power
limits tuned after a profile change are silently replaced by the
firmware's table for the unchanged mode.

Remember whether the firmware is known to be in the cached mode and skip
the WMI call in the platform_profile handler when the requested profile
matches it. A failed write clears that state, and so does restore from
hibernation, where the firmware starts afresh, so the next profile write
reaches it again. The throttle_thermal_policy attribute and the fan
curve reset still write the mode every time.

On a GZ302EA running 7.4-rc2 with this change, re-asserting the current
profile, as happens on AC unplug, leaves package power limits set from
userspace in place.

An LLM assisted with finding the cause, writing this change and its
description, and running the test above on my GZ302EA.

Signed-off-by: Andrei Rusu de Castro <arc@empyreal.works>
---
 drivers/platform/x86/asus-wmi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wm=
i.c
index b33ebdb21..4f37a83c2 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -315,6 +315,8 @@ struct asus_wmi {
=20
 =09u8 throttle_thermal_policy_mode;
 =09u32 throttle_thermal_policy_dev;
+=09/* the firmware is known to be in throttle_thermal_policy_mode */
+=09bool throttle_thermal_policy_synced;
=20
 =09bool cpu_fan_curve_available;
 =09bool gpu_fan_curve_available;
@@ -4183,9 +4185,11 @@ static int throttle_thermal_policy_write(struct asus=
_wmi *asus)
 =09=09=09"throttle_thermal_policy");
=20
 =09if (err) {
+=09=09asus->throttle_thermal_policy_synced =3D false;
 =09=09pr_warn("Failed to set throttle thermal policy: %d\n", err);
 =09=09return err;
 =09}
+=09asus->throttle_thermal_policy_synced =3D true;
=20
 =09/* Must set to disabled if mode is toggled */
 =09if (asus->cpu_fan_curve_available)
@@ -4302,6 +4306,16 @@ static int asus_wmi_platform_profile_set(struct devi=
ce *dev,
 =09=09return -EOPNOTSUPP;
 =09}
=20
+=09/*
+=09 * Write the mode only when it changes. The firmware applies its whole
+=09 * power table for a mode each time the mode is written, replacing
+=09 * package power limits tuned since then (ROG Flow Z13 GZ302EA), and
+=09 * userspace re-asserts the current profile on power-supply events.
+=09 */
+=09if (asus->throttle_thermal_policy_synced &&
+=09    asus->throttle_thermal_policy_mode =3D=3D tp)
+=09=09return 0;
+
 =09asus->throttle_thermal_policy_mode =3D tp;
 =09return throttle_thermal_policy_write(asus);
 }
@@ -5404,6 +5418,9 @@ static int asus_hotk_restore(struct device *device)
 =09struct asus_wmi *asus =3D dev_get_drvdata(device);
 =09int bl;
=20
+=09/* The firmware booted afresh; the next profile write must reach it. */
+=09asus->throttle_thermal_policy_synced =3D false;
+
 =09/* Refresh both wlan rfkill state and pci hotplug */
 =09if (asus->wlan.rfkill)
 =09=09asus_rfkill_hotplug(asus);
--=20
2.56.0


