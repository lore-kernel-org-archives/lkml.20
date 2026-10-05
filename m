Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B64C4C2251
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222628; cv=none; b=q9bo0J+3b87Drpesf7LcwmfOP4T2rHCq80ErPlzdUk5REm5uwv11xPal6j321h2QiSfotbBYjHzuFaDtE9AWDNg1gIM02V8Fvey6jeh5LY+5GQNHPHCTgX/YkGbUZfrPVqG3iENX2010JCzfpsfyKEKfdRbnLA1dEAViIZeoWdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222628; c=relaxed/simple;
	bh=uC4N6kDGNZ60H4Z6vYY8qHWcXEtUdvHlfqRDVS4CX/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KNka/JONL0Ni2PMEWSd8MmLzKfoovQlXehost/XUocxFh3uH6DTFeT/1asBDwT1JAHaLdSgvu3tiUWc+C8Kxv99SnZHgn0OlUYh17awUjZswrFO7SfF4kWHztUFtBx6nL3ygxO/Crv2PB/rDIk/Ri3TLVzGmBvBq9LamPIxGCYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cit0tw1o; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cit0tw1o"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a174a3dc9dso7378675e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 10:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791222626; x=1791827426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DqwXYeDMzOLK6QDykmnpHzDSXaAWN0zurPaKYTPdxsM=;
        b=Cit0tw1ohsJQqY19oa0wcy5XxR3yldZjHvgl0Dk9zpWCPMPTuJbo4oejfu+52INTvO
         XMZFVvX+nacRoxN0RjhaVVdxr3sNxlbp4tPvrkBhih7yjfiXNbjULSkaywopRwXPTPQW
         v9RVuVUkGFA+T7Koqrt8XciilHcoWIyfmROy1lJQqyJ03cGWnAuR3KHbzix82vSGBf2x
         m1UYg3u7tNL34HxRBIQf5HueoiCzWL+0530/HaXLQIkRpznlqgoAGscezN++J9CDkuoo
         QWu0AuuiwBhzkQEuVZLfg65kgIEmDCcYL22S5LaevpNDYO9393ZuwIrrDp3q1kGU3SW2
         dM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791222626; x=1791827426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DqwXYeDMzOLK6QDykmnpHzDSXaAWN0zurPaKYTPdxsM=;
        b=WNGSFF7+90ozwbF5Ae9nbNQ11mTb+sFrIPF9xcHAPlD5j8xR6VO029HGXQbid4IZtW
         ZPvJZWVG8/T4lwfAXSeyIs3zyWz6JlJSkuQiBcv71ADZgPbfIyOJgWBzTS4AR5FVkAEh
         QrvJxk4VIBJDjBDrgpH2Aro3Achh6GVA+n+0ZK175wasqy6sxumvPy2QnSvsPV+UJZbh
         g2sdbpOzZmLU325gzOLPwcryys9jjuWphKgnfEMrzvt1BuJAK6u8ymNhrYan4Yb9CRDV
         Bfig55kVg3Ii0xinwps/fUywmP/Yq7Lqzb3KGnuxG4VtxJCIAq6V49ZxnqSXl19Ey8yV
         SMOg==
X-Forwarded-Encrypted: i=1; AKwUvBwRrA6+earkEgkMXVBWacP0pfkOaL716HeOX5wXQZvCKOhvaH71AsuWwbH5wy6lv01XJzveZyO9+Xjjihc=@vger.kernel.org
X-Gm-Message-State: AFuF++kRi7NLIWLfGkySEpkM/E4aQSTyuUJjuF8lXOYiPtTCfh4EMXnu
	YNVw44FsXWm5eUgxY9B6wrhNdXeCkoCyOoxXB/ZfGNyVkPoFgaWu3jf9
X-Gm-Gg: AYBFou3nXuQ7uJtT7FkpYJFUlwAqVbzhFekLX/N9qj4XSfagQxe/76vQ2L0kewI8PSd
	sYj1A83Ph92bspWHWBdutnKOcbG/jAUFYC5I4AmVlYzoDsF3FWyL872tDrJXxFwWagXh7KA0ojf
	6j+r1A52S4cUfNkzS5jxwl4D8b1SFI+YHd1VYBEed3rhsKxrUAnEDFaJNyqurYrQfmtwuGCORE9
	sqkh/uS1PBneS1+xamiKugkhwtn+YVz8edMqPqAPjD02LtyTNrtclw1C08v2MkN6ivLrl1I2st6
	QtocRCylGC0txBgvxljpxy5RSrq+0RvsYicMBtAGd6oxMuWxvyRLgialAENsiD5niDZ8JELFgYP
	Ody5so9n7sY3GwQwQq5d82H9ylkurEbrTcQWBslrXrmuZAMffiezsFEBmm+pcY6BMzuCl9DvZ8y
	7W8iSFeCcejJFO3mjhVpagqkAKRXOiA5N+HGkR3FFTkWLBG1gGFjk2L5lLGL239EAo
X-Received: by 2002:a05:600c:1546:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-4a027572e12mr206653365e9.8.1791222625570;
        Mon, 05 Oct 2026 10:50:25 -0700 (PDT)
Received: from kali ([159.146.69.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178daa062sm5570555e9.8.2026.10.05.10.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:50:25 -0700 (PDT)
From: Hakan Abay <hakan.abay84@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hakan Abay <hakan.abay84@gmail.com>
Subject: [PATCH] ACPI: PM: Add unused power resource quirk for Casper Excalibur G900
Date: Mon,  5 Oct 2026 20:49:39 +0300
Message-ID: <20261005174939.53873-1-hakan.abay84@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Casper Excalibur G900, the NVIDIA discrete GPU and the second
NVMe device become inaccessible when unused ACPI power resources are
turned off during initialization.

The failure is similar to the THUNDEROBOT ZERO case addressed by
commit cd7ef20ba8c6 ("ACPI: PM: Add unused power resource quirk for THUNDEROBOT ZERO").

Without the quirk, the NVIDIA GPU and the second NVMe device are left
inaccessible in D3cold and attempts to transition them back to D0 fail.

Add a DMI quirk for the affected Casper Excalibur G900 with NLCC 001
mainboard to leave unused ACPI power resources on.

With the quirk applied, the second NVMe device remains accessible. The
NVIDIA GPU can enter D3cold while idle and subsequently return to D0
for accelerated rendering.

Link: https://bugs.kali.org/view.php?id=9891
Assisted-by: LLM
Signed-off-by: Hakan Abay <hakan.abay84@gmail.com>
---
 drivers/acpi/power.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/acpi/power.c b/drivers/acpi/power.c
index 23a4e207a01e..2e79defca42b 100644
--- a/drivers/acpi/power.c
+++ b/drivers/acpi/power.c
@@ -1121,6 +1121,18 @@ static const struct dmi_system_id dmi_leave_unused_power_resources_on[] = {
 		}
 
 	},
+	{
+		/*
+		 * CASPER EXCALIBUR G900 laptop: Keep unused ACPI power
+		 * resources on to prevent the NVIDIA dGPU and NVMe #2
+		 * from becoming inaccessible.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "CASPER BILGISAYAR SISTEMLERI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "EXCALIBUR G900"),
+			DMI_MATCH(DMI_BOARD_NAME, "NLCC 001"),
+		},
+	},
 	{}
 };
 
-- 
2.53.0

