Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668703C870E
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790501958; cv=none; b=JPfyYAae0cr3D1+6prLl81/sgJYEEjBR6pSSn92+MPgfFd4Jk7VqOxO7zinwvyC6W2lWb6/frvvbp8AULCUupID0/IB16DQf3/q7OHdwcRKIqzwrxzTT8+DTmfPCgWbbpiGgVxL4A5/FpXimOOjNNwuRR+oA56A8ud4fbrT7vO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790501958; c=relaxed/simple;
	bh=uzg2Q5XVAoYbWmRcW+Dohoq2cjtZmGLJRTXMn8f31EE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGP9lraK8eSMfejFHDthr9hz2zkeMFdJb8/pdrCFun+fq566uGuVKPHj7IsCbX00KMhYaGwxdrM/znCYoPE4lmlonpMu2nOOgxwCw5r+EDWPq8GWBUY7o3W9jOQOjXPzhCiGOXPB6ndJroX4kjduoKVM1iiYV9gw/UkKolsDNuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLGKuvMN; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLGKuvMN"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e69so447551a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790501956; x=1791106756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0KvKvHHZG597veyD5me7EYri/H01vI260yWKP9hXBQ=;
        b=YLGKuvMNQRlBLeyBZcbjBitajsOvemQak9D2PELsHEZa+qK0Jht1mQISWN6w0po5tx
         6QRFIvlB0g+nPugmalseOHAOIsH95MeriCmFWMYDUv2iKkTx0srG2bp59m2xjOM0+BtG
         aae4hY77J5bpuOvnxxkx0f4wGwi7vBbsCDGeOJz13VckLmnkuEjzihCScPB2R8DwKaWL
         szt6zvfc8aD5w3k7Nh6obIK/ZVFpCsnx/Pm1KxmO3rNQf78SFQEeOvEoB5DMXvEUJcn1
         LZEgltYBqlmGzq0Eeb33pHBuZ8hbqhPFSQZ0FQuiQCw54eV6aFwnRGZbHe9ZhSN5qsP3
         FiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790501956; x=1791106756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p0KvKvHHZG597veyD5me7EYri/H01vI260yWKP9hXBQ=;
        b=YGe8iUjF/RV18DdnPMP4rzmgUV+I5KHp4R8IUAf01C25PRaOVKl94nwbyE/vBP1voM
         Yv6sHzTWz8A6cB4iB8nObSJ2VG078/qvgsb/qD3iuXHPieJtMGXuPLc5eIZhpJILqkHP
         QIGgnd6uOq9hguXdzoTkETOqvKoLevRnR1mI9j2T2BWw/VSbf/2E9tONHgGHIg/tHZRB
         10Ngcnv0HB+8V3NQKOjCuL8Sce4/n9cKsMNY8A6xFkCBxOCIGXzZJanMrGLHaiNhOSom
         JBHpQOYX0sagC3+AjbpYRy3mCEyvx+eQ0OOCwvpHACMg4JwuE59BFt7lNgsy8UzPCluS
         WRAw==
X-Forwarded-Encrypted: i=1; AKwUvBwaAChjfw3qNFl6VFJYYIx/boX1aYGK20m5VLTxTs8HJPR9flRukrLraWzLwExIJYhnw32A6+lNilE35sI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3KqgnlsKC1xOLfisUleTOQJ0CgC9M+IV67kvMuD/7Xp+zUgaU
	b4wfTbILqNIcWi7Fh5oSH5cPLScSG+7bmj+h+mrIlhMJLAoJJrey6C5H
X-Gm-Gg: AYBFou36q65AGKzF4atzNCoDSBJFPw62mDeJTasyOlxzYqa9CQjy1/3IkFfeFEZ5ytw
	CD0HTBwSRfJGe15kWagB9aaN8QoP2l2O1H+cGZz41Hll0tK4k9+npcEXB1YBHD/xU/sQA1E6Hcq
	J1NBcfuCQnd9WURX/whtliLQWxXvQa2S1N1NefIrphuDGKwm+rneVKvS6hOBA0x7PgwabrpXY+M
	9WG+0iF5s2ST+AqbnkVC8YGW+ErpV4k754POufseCPDoDWaCPDKHTEXYDzSs3HtivVpHP1+YVyI
	PNyTCrVFYKLTCAJ7b0/Ieh+lrxjFidx2+isGhjN3DuoXbgEO2oQX+zEWdBnLlszb1Ryi3L8UE5+
	Hn/xjLzxxkiRIkl/LpYwAqpnDql43ypyfxI4uGn1dMPJ04XdfEA4gdRTsGdWMuztK6cZkDYSh2D
	hDbIKs5ZgROhbZG6x/1zL7ejUDhNe7mPRANXThGUp/KQS0H/MFuKw0zUlvvn0OS06orbNLHhLve
	Vv3Xttr7+1S97tTZ1nVHgsR66nebdtDWaQ=
X-Received: by 2002:a17:90b:4a05:b0:3a0:bb4d:77ff with SMTP id 98e67ed59e1d1-3a0bb4d7a39mr6044564a91.0.1790501956341;
        Sun, 27 Sep 2026 02:39:16 -0700 (PDT)
Received: from archlinux ([157.48.21.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0cd1c4ec9sm10285191a91.16.2026.09.27.02.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 02:39:15 -0700 (PDT)
From: Suryansh Singh <technosfan14@gmail.com>
To: technosfan14@gmail.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/x86: hp-wmi: Define known Victus S driver data
Date: Sun, 27 Sep 2026 15:08:52 +0530
Message-ID: <20260927093852.161958-1-technosfan14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927085539.96791-1-technosfan14@gmail.com>
References: <20260927085539.96791-1-technosfan14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, Victus S thermal parameters use the Unknown Offset for TP
(Thermal Profile) from the EC offsets enum, even though there is a
Victus S EC Offset in the same enum.

This was done so because the EC layout is highly
variable across this lineup of laptops. The only place where the 0x59
offset is used is the driver data for Omen V1 models, despite it being
labelled as the Victus S TP offset. The name clearly doesn't relate
to the use case.

However, after some downstream searching, I have found that there is
a Victus S board which does have the expected EC layout corresponding to
the very Victus S offset itself.

Add known board parameters for the Victus S models to correctly map
the found board (8C99) and any others in the future, and add
required if-statements for platform profile options for the new
parameters.

Link: https://github.com/yunusemreyl/omen-space/commit/f32a76386592d1a604e574c693b323d15e978089
Signed-off-by: Suryansh Singh <technosfan14@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 7ab81ce5f8d4..7851cb607c74 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -121,6 +121,13 @@ static const struct thermal_profile_params victus_s_thermal_params = {
 	.ec_tp_offset	= HP_EC_OFFSET_UNKNOWN,
 };
 
+static const struct thermal_profile_params victus_s_known_thermal_params = {
+	.performance	= HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE,
+	.balanced	= HP_VICTUS_S_THERMAL_PROFILE_DEFAULT,
+	.low_power	= HP_VICTUS_S_THERMAL_PROFILE_DEFAULT,
+	.ec_tp_offset	= HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET,
+};
+
 static const struct thermal_profile_params omen_v1_thermal_params = {
 	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
 	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
@@ -164,6 +171,11 @@ static const struct hp_wmi_board_params victus_s_board_params = {
 	.fan_profile		= &victus_s_fan_profile_params,
 };
 
+static const struct hp_wmi_board_params victus_s_known_board_params = {
+	.thermal_profile	= &victus_s_known_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
 static const struct hp_wmi_board_params omen_v1_board_params = {
 	.thermal_profile	= &omen_v1_thermal_params,
 	.fan_profile		= &victus_s_fan_profile_params,
@@ -316,7 +328,7 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C99") },
-		.driver_data = (void *)&victus_s_board_params,
+		.driver_data = (void *)&victus_s_known_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C9C") },
@@ -2146,10 +2158,12 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 	 * of these values.
 	 */
 	if (tp == victus_s_thermal_params.performance ||
-	    tp == omen_v1_thermal_params.performance) {
+	    tp == omen_v1_thermal_params.performance ||
+		tp == victus_s_known_thermal_params.performance) {
 		*profile = PLATFORM_PROFILE_PERFORMANCE;
 	} else if (tp == victus_s_thermal_params.balanced ||
-		   tp == omen_v1_thermal_params.balanced) {
+			tp == omen_v1_thermal_params.balanced ||
+			tp == victus_s_known_thermal_params.balanced) {
 		/*
 		 * Since both PLATFORM_PROFILE_LOW_POWER and
 		 * PLATFORM_PROFILE_BALANCED share the same thermal profile
-- 
2.55.0

