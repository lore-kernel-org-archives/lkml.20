Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873712;
	b=u3mjewMZZfnlHsfa/MbK0+Gs+/9jljb2y4WMRg3Fu8+HDxJ6PXcd5NAkUV/smi3GiDOq
	 M2hWfOSbNIiGA61IXc5sb2hF8Qw5aRS5PEWFPfYaaxnVP1o44JmXFhbEcnC73Vsyzyxfi
	 cilpmlWeQ5GwgW0ACrqWVZ2kq3aMxmq95vBMUZihCLVka0wt4N+iGrTGn/kfrUoDQQ4u4
	 OWgBx8xF8Q7RA8Ya8N/bvZzo4aLFJyvCNjPhsQqDQ4NH+fyVgda8ZNAU5UKybYXaihSmX
	 51iOr9VuU3PvNwSfa1/jqgLVTSf3kN7rjaVG9m8qqm8KytvQLMyeRknLF55pSblpRqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kikhthoaQlWBu42au/eGBn/q99FtaNm9yiWtkx2cnsk=;
	b=NIsmgZ3HAGPnvBN396UyP/kvEcJppsJ+8AhT/l2Ocy8/qmB2uP4a6OSY4rM98mBJqu7I
	 f7MjZWLwbu7lcw9kR6DWWATz8/50d8cSo5L9h/Aj9C5l6vQF8Giaa2i1HCrklngbCSTYn
	 /sHoabrOws05Xl2cC6zXAFP5jVipqIljyUVCWA7jgz7kv8eyGk2047TeI4cAObUIr4QuL
	 jnTHNNiLoFyBkiOYVhMjkCeEKCYn8x3SnROVdtC1ugnhrNvxYYBGxrEVZO3d9s5LRgNhR
	 pZrRhYYdBVPY0UfjZl2LEB7uihVFtGj22C3dxkbapMb1OdJ631zMuWPIkF08G1Lz/Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Vnv/VXJ2";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE1B606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CE1B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vnv/VXJ2
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35f036b17easo4235334eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873711; x=1793478511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kikhthoaQlWBu42au/eGBn/q99FtaNm9yiWtkx2cnsk=;
        b=Vnv/VXJ2lB58VILA6ioygffnws5UkzzQ/PjShVmAzAxAEzxAgS02Js0YebOFQQfFc7
         E9dX9uMAgb/fXkhlqqlWPlKDWPHx61QdAutGcV+CRgLCKYLoxOOBIEiy1Oj1IdA7uK+K
         HbZ/uXHwvXnjRK5XfoJ2YYTA2o1mO+M5i/uMDfP6G6oJOmgvhINsLHWkj+ooCz0jWg2w
         8CpVurbi5C+fGW3IwIYEg79rJjMqXGaHu8sy4Pe1ch9u82+Tt9tdFWzfov5UcNMrCDii
         GjY0AcJ6oWirhZVLCZr1wzcZXqUfYxcJQbTaBDClEQcVsu5vGZ0JBAE2ElZHg4yZ3Zft
         dvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873711; x=1793478511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kikhthoaQlWBu42au/eGBn/q99FtaNm9yiWtkx2cnsk=;
        b=I1uW9d8GR8kR7rfWSRgfPvGj5PTGk6krDBoRMJE2h6F3NWTW0u7gLGrP/CaML0d3XA
         +k1IybxNBRvcs+NTAOk1az/OK/MQP2wSx17NtIE+nxTh01cMeY+dKnUEDF8gRMhR5bOg
         NUJKqWP+AxSTaGCBgKuajUPQptnWRu1tpKhMxwEg20n+ZHE7+ro3asNw65f9WSJVK35P
         6YtKsUZHd46O6pt2ZcaMqJcWDNxJfmUa0zXnlOYuP1xgqqobmvF8jysgv6j8yZ7JZiWJ
         uBcvbDJqzBXUBAWwX2LdaJRf69VBZ/bF5IeUmEcjzl7Y2xLxqAaTtOVTlpBv45Zws7gL
         +MUA==
X-Forwarded-Encrypted: i=1; AKwUvBx29MgvAXPEDt5drYYUJv8luWwfbUJ1umjcKVQxvoEdm4nmHjTeMIDFoBc8Rt+1lkY7nRk7/YX7qZ3EWkc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcRwozQEoT2TLDRNAgZOeJF3lBUW4NkozoDz5V5jaxRS+W0FPm
	WArrL3vJmtViWRBrZjdEERSSimTmIs6kSN1wr26baF2ixRjrk4jwchi7H47wrA==
X-Gm-Gg: AYBFou3e3EXPirAkGzy9qWjo9FzifO6mt8GVY2bg8Mw5Z0fq9X/+KHQScjG9DJE+GpC
	xbRsd0F8/UFDQzrorqC4tRIYTWn+GvDbmPHlR5d+Jjoc/9l7Q3hx1bDmVxGFRONbILodXPDyQ2C
	cOixjaM6Fx0QEB/rdjXzQ9QzHmYbcvaJpKTj7UuPMu3cj9yyOiDueUQv4e+Qz9UnjYBJPHhIXwz
	b1RgzO0YJB5vUFwI1CXFhQR+WFwrLtNlxJdyBA1/YBEwwSY3JoILMz2z7wsrRXO4Y1YL2FB9sUW
	seY3yj7zs3Lmu2gID1FvxM0rYpzA4f/rx6e2Ld+7co3ad1BIw1SaXMaAbv5/rEGlAvWZcFeS7W2
	Z02fXXaUyTj+0KX7fZudByCXfNhOIZmsHa1LLBXmxAj06ZHYrPwQ1mMRXirQ2lWRK8sbN9/CCtp
	8+CtaaKIDBBm9QBTf3syw5NFuCpxA+jrbDC/jYnTxvR0qYWfBbp0vV2sLeKUWtwO+yJVIwuBnF/
	LXj3egRRPVPcaYIR44ivGmqXBC6C3ixNTp+8HSKKpT1S/80nN/bAUeAgQ70GTlkMVYHyqPxag/i
	3lY=
X-Received: by 2002:a05:7022:438e:b0:195:e4b9:d326 with SMTP id a92af1059eb24-19936a5e5e9mr6393651c88.12.1792873711407;
        Sat, 24 Oct 2026 13:28:31 -0700 (PDT)
Received: from localhost.localdomain ([49.42.181.238])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee69sm13495358c88.4.2026.10.24.13.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:28:30 -0700 (PDT)
From: Sourav Nayak <nonameblank007@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sourav Nayak <nonameblank007@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: fix platform profile values for Victus 15-fb0xxx (8A3D)
Date: Sun, 25 Oct 2026 01:56:58 +0530
Message-ID: <20261024202658.13149-1-nonameblank007@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently Victus 15-fb0xxx (8A3D) takes victus_s_thermal_params,
which causes it to register as incorrect EC layout while cold boot.

- On other hand windows Omen Gaming Hub registers EC offset as 0x95,
- which is set in driver as HP_OMEN_EC_THERMAL_PROFILE_OFFSET.
- So, address it by adding victus_s_ec_thermal_params.

- Also perfcontrol modes as performance (0x1), default (0x0), quiet
(0x3) registers. So, add support for quiet mode.

Also, hp_wmi_fan_speed_max_reset() caused fans to freeze during loads at
0RPM, introduce a 'if' statement to resolve it by calling hp_wmi_fan_speed_max_set(0),
and passing platform active again to reactive curves. Test data:

auto/max:
hp-isa-0000
Adapter: ISA adapter
fan1:        5400 RPM
fan2:        5200 RPM

mannual[255]:
hp-isa-0000
Adapter: ISA adapter
fan1:        5800 RPM
fan2:        5800 RPM

Tested-by: Sourav Nayak <nonameblank007@gmail.com>
Signed-off-by: Sourav Nayak <nonameblank007@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 615b4cf6fc45..c35bbe1427e3 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -121,6 +121,13 @@ static const struct thermal_profile_params victus_s_thermal_params = {
 	.ec_tp_offset	= HP_EC_OFFSET_UNKNOWN,
 };
 
+static const struct thermal_profile_params victus_s_ec_thermal_params = {
+	.performance	= HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE,
+	.balanced	= HP_VICTUS_S_THERMAL_PROFILE_DEFAULT,
+	.low_power	= HP_VICTUS_S_THERMAL_PROFILE_DEFAULT,
+	.ec_tp_offset	= HP_OMEN_EC_THERMAL_PROFILE_OFFSET,
+};
+
 static const struct thermal_profile_params omen_v1_thermal_params = {
 	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
 	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
@@ -164,6 +171,11 @@ static const struct hp_wmi_board_params victus_s_board_params = {
 	.fan_profile		= &victus_s_fan_profile_params,
 };
 
+static const struct hp_wmi_board_params victus_s_ec_board_params = {
+	.thermal_profile	= &victus_s_ec_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
 static const struct hp_wmi_board_params omen_v1_board_params = {
 	.thermal_profile	= &omen_v1_thermal_params,
 	.fan_profile		= &victus_s_fan_profile_params,
@@ -245,7 +257,7 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A3D") },
-		.driver_data = (void *)&victus_s_board_params,
+		.driver_data = (void *)&victus_s_ec_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
@@ -2121,10 +2133,14 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 	 * but logically it should have tp == 0x30 || tp == 0x31, as
 	 * corrected by the Omen Gaming Hub on windows. Hence accept both
 	 * of these values.
+	 * Since boards like 8A3D write 0x3 to EC offset 0x95 to
+	 * engage quiet mode. Map this to PLATFORM_PROFILE_LOW_POWER.
 	 */
 	if (tp == victus_s_thermal_params.performance ||
 	    tp == omen_v1_thermal_params.performance) {
 		*profile = PLATFORM_PROFILE_PERFORMANCE;
+	} else if (tp == HP_VICTUS_THERMAL_PROFILE_QUIET) {
+		*profile = PLATFORM_PROFILE_LOW_POWER;
 	} else if (tp == victus_s_thermal_params.balanced ||
 		   tp == omen_v1_thermal_params.balanced) {
 		/*
@@ -2657,7 +2673,17 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_AUTO:
-		if (hp_wmi_fan_control_supported()) {
+		/*
+		 * Victus models like 8A3D, calling hp_wmi_fan_speed_max_reset()
+		 * freezes fans at 0 RPM under load. Instead, disable max fans and re-apply
+		 * the active platform profile, so the EC firmware thermal curves regain control.
+		 */
+		if (hp_wmi_thermal_profile() == &victus_s_ec_thermal_params) {
+			ret = hp_wmi_fan_speed_max_set(0);
+			if (ret < 0)
+				return ret;
+			ret = platform_profile_victus_s_set_ec(active_platform_profile);
+		} else if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;

base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
-- 
2.55.0

