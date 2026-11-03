Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732785;
	b=g2nUVsoB8XDIX2K7g1UijXhNBiSh5h6X7VIp3Z5Mm6O9d01FWFzEK9SRl7um9KYtf4hL
	 ps22frXe+fzU7S0laH6NrXLsZJLROu+kBipjZ56eV5rOJkgoCaLptbvwSE0+UNwH4jgNs
	 v83NYhRLyM8oYD2/zpG8aUuK8FSwGPtDsxzupz9Cc+hhwWGDBZDTsWfxH8fYK4eNfIOXB
	 l/MOygg18rc//c3ICk4CRpGJQNnDWuwjC+3U8gr6H2qeSHl4rNE4mVC3WpMoDIx5WjHas
	 lY70FBYVZ1GMAHg8L7MTE+PcQkYoSaY6n2YJ4l/xZl2PmcJuk+OSQuhJwsmrFc7635A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w23UU4RsTFLW6CdOUkTXg7K9HL/THmO2wvldeMpkC24=;
	b=Ekxh3GcbSy0sptn6Xn5RQCK+tmzZ//4SfFYqkMTXtjHoWfsuRdF17m9Yb7Q5zdcITruR
	 1xUa8y/FNwc3qULBU46DH+ThLgIVtjUBXXivV8Py1YhNEYGpF4jRjKN8BVGIVFD+SYE3N
	 bVzJGejq5qf+MBV5QQk3i5qLlyAyesnEwdr8zjLe9ylOBJpUmcvnjRsGTsI9rFui9l2kn
	 ZyF/PiuBViZoGCJS8NErWTWIWRVlp7NGvcfMAWdC1ItMbqXozUr+j6aaem345W/qhl7wt
	 QnpI9aPPB7IOqvdzTyTb4mA+ZATkk0vXA4aMK/rEPuJwyJTzQ/y/o/52j5c7jQ9PtxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nx18a8nQ;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CBB606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40CBB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nx18a8nQ
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b306bbff8eso3756517b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732784; x=1794337584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w23UU4RsTFLW6CdOUkTXg7K9HL/THmO2wvldeMpkC24=;
        b=Nx18a8nQiMwMs0whFB3XiqKQVoU+9b0kTL0ooG+7p5lJx4Pj+a1usmKz2vrx+wH741
         D5f00YXix3ceT/19Hd7xovBA4j75Ga4vcB2qadiJwbvLTbBLvggqeYbtVN0ZzTPtupXe
         oAZWMi1hVLzej+PcPorqhEImi1hzwiN9qbIUZiOAp4HO45C8j93QQ1cIqs0x6yTAzht/
         WbffkwFeZvcfSCO8b4mAYInoLRkMs5u6opymKhncErmZtN4Khjl4RbrbnL8EHbVtDksV
         FQfje1tgVJ8Tzr1c2Vz4zC8oGGoHwGsCjBXTg3OVEmSDCNCZXRX79cxbLpHNXxY1BrRt
         rUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732784; x=1794337584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w23UU4RsTFLW6CdOUkTXg7K9HL/THmO2wvldeMpkC24=;
        b=M5Vvf7seuWcT6OAkrbNEGAQh09M0IP55yAcAuJF70RQTAJXjvjl9RDaacRg7dQOpqq
         ckClyg0QKSYAjXy5D6BIoxM1npyHQRGdrQo/y45n6JxvvtDMB56od1hLCruCnXaunjzD
         anoI5C/A57Qkq0MLNjt8Edovh9+FSqOezNhO/EclACXq1PjC0rtIGy5Q40ZgZXGMeNa4
         6Vmk1VdKgD4MiGlfBu2tRy3R8L2+cCkKua7uIPgV9um3OgeOVWShHZh27jwUm3ugLg/2
         pq+ni2PIYlE6+fsz6QGDanMQuy5SSm8p0g9jbzuYl+27NhlVcHzEkz0vRYdcrWLi2Zhx
         utPA==
X-Forwarded-Encrypted: i=1; AKwUvBw2So9S80wyADZnPLRmpq7NTyHrLF5QYYrIEp/HiLpQ22ORCyr/LJMPxRENzsJU+zDOTqyY2W9spK2ddS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nsjO/jvtxLam3HPx/Dw7piNQnZFDT+tx/zx+f7sNzBssBOpb0
	brjBnVCIdUeEKr7zkO/DebjT32vqmjYHsthdfhuusp2MMgFBU7Mrlixv
X-Gm-Gg: AYBFou34mOpILtwmD7TANYyKLGVozbF5PmJXJm2gmS0fA4sc+IunC895bwfjrVn2ESL
	ZibIwT+etET/oNY3yUy1z4PgcP42Bjh84pSoc2yUuF0k1ccJzHjFeGnEORR6kq02grD2fbgH3cc
	Ti9t7Bodi588w8QM43FYfRB/1YNVUXz30YeahWy0PdW3BRT/kwgo1I5tVUccFah2phzI3LXZkkt
	FMeWbdoGOIJmemsxBYLitaTYhnJmKaKWRNQprUkTHcb+u/TgV2SX05xHS/0uoKiZ4/R0Ncv3vWU
	VkhzAnW7bUMKDpnNVRRw/X/8sOygqu9kHvlW7qIX7PcD6erEZckWxVUfun7CyrbBEJzYvBA94qh
	YAwCOFRkd3lfpxw5m1aqDoyN6inCks6ukqiz7Uaq1HKM7k1luA7N+AJE6T6KwK4v+NpKRrYvsWc
	KCjtSRhfPIB46AVnxEc5z8r3brMOjUoW/s23hS5f8kcsXOOX9cgqmQGsBzdQI2MDTkRG/gwt9yU
	HmCDLOThY8GQy8Kvny9ogdr3x9sE4D3IO26r4I5/VmPjc6xLTjaeCmJHwRpYeaT1t7hq1EUbIAn
	5Z2KDKjGHtjZGndagBiKqIYivwp5or3iPEMjiNV2FDjQQQBCHA==
X-Received: by 2002:a05:690c:dd4:b0:8b0:a37a:b1d with SMTP id 00721157ae682-8b2b66fb17amr86527197b3.24.1793732784124;
        Tue, 03 Nov 2026 11:06:24 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:17::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30997aa84sm3037217b3.29.2026.11.03.11.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:06:23 -0800 (PST)
From: Mohsin Bashir <mohsin.bashr@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	maxime.chevallier@bootlin.com
Subject: [PATCH net v2] selftests: drv-net: pause: Avoid cleanup failures for unsupported link settings
Date: Tue,  3 Nov 2026 11:06:22 -0800
Message-ID: <20261103190622.3981970-1-mohsin.bashr@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Mohsin Bashir <hmohsin@meta.com>

pause_setup() saves the initial link settings and queues a deferred
restore. For devices that report forced link settings but do not support
changing link settings, this can queue a restore even when setup never
changes the link. On fbnic, the deferred restore returns EOPNOTSUPP and
turns pause tests that use pause_setup() into cleanup failures.

Fix this by queuing the forced-link restore only after setup successfully
enables link autonegotiation. Keep pause_test_support coverage for devices
that cannot change link settings by falling back to forced MAC pause on the
current link. Run the extra link autoneg on/off checks only when those link
setting requests are accepted.

Results on fbnic:

  Before: # Totals: pass:0 fail:4 xfail:0 xpass:0 skip:24 error:0
  After:  # Totals: pass:4 fail:0 xfail:0 xpass:0 skip:24 error:0

Fixes: cbd8a536cd6d ("selftests: drv-net: Introduce a selftest for ethtool flow control")
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
---
v2:
- Drop the require_link_autoneg() approach from v1.
- Move the cleanup fix into pause_setup() so all pause tests avoid
  restoring unchanged forced-link settings.
- Keep pause_test_support() coverage on devices without link setting
  support by falling back to forced MAC pause on the current link.

v1: https://lore.kernel.org/netdev/20261030173516.1002250-1-mohsin.bashr@gmail.com
---
 .../testing/selftests/drivers/net/hw/pause.py | 40 +++++++++++--------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/pause.py b/tools/testing/selftests/drivers/net/hw/pause.py
index ca4a55e59c30..99ce6a59dfcd 100755
--- a/tools/testing/selftests/drivers/net/hw/pause.py
+++ b/tools/testing/selftests/drivers/net/hw/pause.py
@@ -404,14 +404,14 @@ def pause_setup(cfg):
 
     if link["auto-negotiation"]:
         defer(cmd, f"ethtool -s {cfg.ifname} autoneg on")
-    elif "speed" in link and "duplex" in link:
-        defer(cmd, f"ethtool -s {cfg.ifname} autoneg off speed {link['speed']} "
-                   f"duplex {link['duplex'].lower()}")
 
     # Local interface admin up, link aneg on
     ip(f"link set {cfg.ifname} up")
     if link["supports-auto-negotiation"] and not link["auto-negotiation"]:
         ethtool(f"-s {cfg.ifname} autoneg on")
+        if "speed" in link and "duplex" in link:
+            defer(cmd, f"ethtool -s {cfg.ifname} autoneg off speed {link['speed']} "
+                       f"duplex {link['duplex'].lower()}")
 
     # Get remote pause params
     ret, params = ethtool_ret(f"-a {cfg.remote_ifname}", host=cfg.remote)
@@ -429,15 +429,15 @@ def pause_setup(cfg):
     if link["auto-negotiation"]:
         defer(cmd, f"ethtool -s {cfg.remote_ifname} autoneg on",
               host=cfg.remote)
-    elif "speed" in link and "duplex" in link:
-        defer(cmd, f"ethtool -s {cfg.remote_ifname} autoneg off "
-                   f"speed {link['speed']} duplex {link['duplex'].lower()}",
-                   host=cfg.remote)
 
     # Remote interface admin up, link aneg on
     ip(f"link set {cfg.remote_ifname} up", host=cfg.remote)
     if link["supports-auto-negotiation"] and not link["auto-negotiation"]:
         ethtool(f"-s {cfg.remote_ifname} autoneg on", host=cfg.remote)
+        if "speed" in link and "duplex" in link:
+            defer(cmd, f"ethtool -s {cfg.remote_ifname} autoneg off "
+                       f"speed {link['speed']} duplex {link['duplex'].lower()}",
+                       host=cfg.remote)
 
     wait_for_link(cfg)
 
@@ -470,9 +470,12 @@ def pause_test_support(cfg, pauseparams):
 
     forced = forced_link_settings(cfg)
     _, supported = get_local_pause_supported(cfg)
+    tested = False
 
     # We check that what we can configure in the pause params matches what we
-    # support under various contditions : Link aneg on/off, pause aneg on/off
+    # support under various conditions: link aneg on/off, and pause aneg
+    # on/off. If no link configuration change is supported, fall back to
+    # checking forced MAC pause on the current link.
     ret, _ = ethtool_ret(f"-s {cfg.ifname} autoneg on", is_get = False)
     if ret != 0:
         ksft_pr("link autoneg on refused, not tested")
@@ -481,18 +484,21 @@ def pause_test_support(cfg, pauseparams):
                                "link autoneg on")
         expect_pauseparams_set(cfg, pauseparams, True, supported,
                                "link autoneg on")
+        tested = True
 
     if not forced:
         ksft_pr("link speed unknown, the forced link is not tested")
-        return
-
-    ret, _ = ethtool_ret(f"-s {cfg.ifname} autoneg off {forced}", is_get = False)
-    if ret != 0:
-        ksft_pr(f"link autoneg off {forced} refused, not tested")
-        return
-
-    expect_pauseparams_set(cfg, pauseparams, False, supported, "link autoneg off")
-    expect_pauseparams_set(cfg, pauseparams, True, supported, "link autoneg off")
+    else:
+        ret, _ = ethtool_ret(f"-s {cfg.ifname} autoneg off {forced}", is_get = False)
+        if ret != 0:
+            ksft_pr(f"link autoneg off {forced} refused, not tested")
+        else:
+            expect_pauseparams_set(cfg, pauseparams, False, supported, "link autoneg off")
+            expect_pauseparams_set(cfg, pauseparams, True, supported, "link autoneg off")
+            tested = True
+
+    if not tested:
+        expect_pauseparams_set(cfg, pauseparams, False, supported, "current link")
 
 @ksft_variants(pauseparams_variants)
 @ksft_disruptive
-- 
2.53.0-Meta

