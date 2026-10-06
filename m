Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9867E36920C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791268059; cv=none; b=EwADpDW28Xx7m8RamK/A3fzRVlzfPL2DwvEmUnK1ANZHowgpZ7ptoZT6qFAJSQNgS6PwVsCYONSHok+2Til0R2wg9Y8DFQxj3Ib66IpuX6XUlz0NRmAbGXMv+tFr3Ja69Xqf8ivhXVwr8Xw3O2IWHtJMVxP/mnUSDL2dj+K9aXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791268059; c=relaxed/simple;
	bh=xSxuORG1HORqXwgd1D2Pao2qpG0YgIMnbGQKbAk7T80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p/ndlMD9nDKRVItgE+tQtLnMA/lzpF59k9Gq/al4zjWLN6pURQVlOTX2Ty+boC6SQAo3HucwLGwr1jkzQVd3M+840lYLW2BAXXYmpWcY0t2nWrBx6X8y2esowBfScuf0Lot60kkJAtEvf8BZ33XnQL93HK/YYQWn0os3y//z9AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KD4fTVmZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KD4fTVmZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso12888215e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791268056; x=1791872856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NN3uyFX5MgblzC6BFihyJF+3HDagHt+ljw1Qjp2+odc=;
        b=KD4fTVmZhMWIN6QD7EbNVAY8jwriCyCyTKoOMC4FiroHax3lFWiEHMVoA6U3zeH4IB
         1xsCzLY6CLaV5pgHxG5rp2HTzMP4r3MAeTu3NEyMl9/xV9/ryidXhwCI3VjFRiVLmEdb
         OluD1Y1H6NpDklfIEllnGWc6lgZJ0XpjwML+eYaQLQN3IusZTaGupJgyYCypd733pfqJ
         gX8tM3pBnUi1fearbeyTvhIqyMBOTTZOFqStBlQEJQg7b8nK2KuLKRr3QOhxwPtVAwS7
         1NCnXOswd3HHyRFBufb4PW3hHLwcvwkJvWZ/MIv2WEWDVq5bnjtYTdf+Zi61/iXLqF5l
         ft5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268056; x=1791872856;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NN3uyFX5MgblzC6BFihyJF+3HDagHt+ljw1Qjp2+odc=;
        b=PGRekxs78dP3K1UGyuS8g3Qt2bfkB0qEEdt1a1h1taUW3FjzDgLIFoftlts3I5y1ua
         65gCFl5myZ7UtbbsGnu91VfKErmSWS69XQPOvIMawc+N2g7DfRapTuMcpc+3TylPy6dH
         W5ziNSzMlm9TunMEZl04pznuJyG+IMMw/ek1y2luo65R8kReGx/anQ/yet0ovXmlyAdI
         TgEDk+gYJkkXlJppSLgyw1j24jDf+lf7h78xZrY6nbWyqzLV8g9wKbwSrZl8mk6/SdSo
         f6VO27KciXq/jeakSkWJhKBiF0RdjZ9sRjTVKAalm7XudKArDyUPliOF+MdzSTUppOLH
         aJNw==
X-Forwarded-Encrypted: i=1; AKwUvBzsscTDEXErlYTO/FLpthh2b82wOMdpUkjSFIyAb2bTLvwwTGy+fOJjzfYeCUvWmwORBt+0y1Dtb0AgNiU=@vger.kernel.org
X-Gm-Message-State: AFuF++kG0eXOUJ2A9VbWaJ1uxS53bT208dj933/kX7bGpkndxhtcPpDT
	jefDuAj3ka6ub6xtKSE4PONbizMIbpa19Lw9p/qTL9oxXM7jp3nLPWcicSHbVrcn2ZDa/Q==
X-Gm-Gg: AYBFou2BJtm851Pbdp7KtxKZH4tY+kP7cRMK2hsPsqWJw0D6NHxQuOV7ScJLcQXiEv0
	LOMY1274OICZY96yHuW/yYEr/FIB3BYVOQ8DuLmPZSGzaGxadlvZDTv3C7b7sLzL2LdjJEvofdR
	j4zElMTduIeJjosjD/TnXGzuRp0yd7ULzToEVBWXnkVfWeFjkUQLogm4Ez6cyTodHsgw0CAR4l5
	fnhWuLj+Z+4XyKmgEJUuJTMsNP8MOWH1bDoN/vyt7P5i7NOe63aF9OVn19OVASXph4vMvBETUWw
	6OWHcwip6OdcVE0es1/T0RNDP+lczAf3DJMf5BBghYSiQIvVDMNy/GXA6QF4H12xWyHxLSHfZ2G
	WI4ILliOvGqxDnXG3LtygKTXwIOKXVSbZa2d9p8mUZlz3DBoBdAOKQrMBeWEk7pfQtl48ct5WWh
	erf2Jdi3oALWHG6tc26DHxMw6G8WS9EYKxHH8+m96VaDejiicdaP3h+Rx0LknuGwSBhtvsD5iVT
	Luu/6gtJ4LvYvNPU92UJQ==
X-Received: by 2002:a05:600c:a116:b0:4a0:1a7f:2abb with SMTP id 5b1f17b1804b1-4a1680e94e3mr115543345e9.11.1791268055657;
        Mon, 05 Oct 2026 23:27:35 -0700 (PDT)
Received: from FranzSP11.tail2d6612.ts.net ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394e6c5asm311830615e9.2.2026.10.05.23.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:27:34 -0700 (PDT)
From: =?UTF-8?q?Fran=C3=A7ois=20Roux?= <franzelfranzel@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: ath12k: skip hardware rfkill setup on Microsoft Surface devices
Date: Tue,  6 Oct 2026 08:27:28 +0200
Message-ID: <20261006062728.45007-1-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the Microsoft Surface Pro 11 and Surface Laptop 7 (X1E80100), the
WCN7850 hardware rfkill input reads as "radio off" and the OS has no
way to control it. ath12k enables hardware rfkill handling, so Wi-Fi
stays hard-blocked:

  iwd: Error bringing interface 4 up: Operation not possible due to RF-kill

ACPI platforms can opt out through ath12k_acpi_get_disable_rfkill(),
but DT platforms cannot. A DT property was proposed for this and
rejected, because it describes what the OS should do rather than the
hardware. The suggested alternative was to handle these machines in
the driver until a connector binding can describe a broken rfkill line.

Add a table of board compatibles and hardware revisions on which
hardware rfkill is known to be unusable, and skip the rfkill setup
there. Other affected machines then only need a new table entry.

Tested on a Surface Pro 11 (microsoft,denali) with next-20260929,
booted with the unmodified mainline DTB: the interface is no longer
blocked and connects. The Surface Laptop 7 entries (microsoft,romulus13
and microsoft,romulus15) are based on reports from Jérôme de Bretagne
and Dale Whinham. I have not tested them.

Link: https://lore.kernel.org/all/2ixwny6hzumlqmok5cjwutvtk7nzmx4t3dhxc44ao4l2u755pj@n6m7jyxf2o62/
Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Assisted-by: LLM
Signed-off-by: François Roux <franzelfranzel@gmail.com>
---
Changes in v2:
- Use a table of board compatibles and hardware revisions, as suggested
  by Jeff, so that other affected machines only need a new entry.
- Add the Surface Laptop 7 (microsoft,romulus13/15), which Dale and
  Jérôme report as affected too. These entries are untested by me;
  a Tested-by from someone with that machine would be welcome.
- Retested on the Surface Pro 11.

v1: https://lore.kernel.org/all/20261004165132.4313-1-franzelfranzel@gmail.com/

 drivers/net/wireless/ath/ath12k/core.c | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0c72948f3..67d4c98fb 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -72,6 +72,35 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 	},
 };
 
+/*
+ * On these machines the OS cannot control the WCN7850 hardware rfkill
+ * input, which reads as "radio off", so hardware rfkill must stay
+ * disabled. Ideally this would come from the connector node of the board
+ * DT, but that binding does not exist yet.
+ */
+static const struct ath12k_core_broken_rfkill_table {
+	enum ath12k_hw_rev hw_rev;
+	const char *compatible;
+} ath12k_core_broken_rfkill_table[] = {
+	{ ATH12K_HW_WCN7850_HW20, "microsoft,denali" },
+	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus13" },
+	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus15" },
+	{ /* Sentinel */ }
+};
+
+static bool ath12k_core_rfkill_is_broken(struct ath12k_base *ab)
+{
+	const struct ath12k_core_broken_rfkill_table *entry;
+
+	for (entry = ath12k_core_broken_rfkill_table; entry->compatible; entry++) {
+		if (ab->hw_rev == entry->hw_rev &&
+		    of_machine_is_compatible(entry->compatible))
+			return true;
+	}
+
+	return false;
+}
+
 static int ath12k_core_rfkill_config(struct ath12k_base *ab)
 {
 	struct ath12k *ar;
@@ -83,6 +112,9 @@ static int ath12k_core_rfkill_config(struct ath12k_base *ab)
 	if (ath12k_acpi_get_disable_rfkill(ab))
 		return 0;
 
+	if (ath12k_core_rfkill_is_broken(ab))
+		return 0;
+
 	for (i = 0; i < ab->num_radios; i++) {
 		ar = ab->pdevs[i].ar;
 

base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
prerequisite-patch-id: aafe3fac38f4020441979665509928f8cc832095
-- 
2.56.0

