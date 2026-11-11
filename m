Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415067;
	b=UrTnIqLSUk0I4j+44icDdqDQrI2aTAMBl7ngzhSZIG4PH0T5EX4ec+8A/Cr8KgfWHwOa
	 X4IouxLC69NnOVM7bFptRO9GNJ3OaT9XKXsNWr8h3NsFaeEIlLFaqyAU6CMx4A3uplA4t
	 +m1NFpnDjaxeKY4T/lEk5etNhTaakNTpAMvp8UWOf4PV/+cvH19Vtc/osyc/ULnK0U2yt
	 xBN/+OYKcS9+E52GR9Tc8SxcrIcPsHe63r3xxVETtN6KbgEOjAZwUyO+mu1tLacw8GlqG
	 uyGw2T6b6PFkW+lutxXMZU3CM1VjJ476sO8cm4xjj1CwR2RjafLAUcTXuUkg3+t1Hcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ezDZnWkAys7yO2bhUCT3pd+sWH0EXaKqpmbbWyxZlHo=;
	b=u74VNRNBBPRusvX3rOK/rdR9dCB32rd7xt5uNRhrnglVpnxzftlM/WxUrSKOlmSYCBrc
	 Q3SBevnZE9TaQe9fDlQ50oY0YJxSOY6fTgptXZkOWDQj9+XyPxuvDf4O6IADlO74BXY85
	 kPYCcRmHIUVlJ+N21WBu5S4JJ6aybAtN13xU6ZVNgMLdkfp3Btdn2T/ie+ZhumJHGu39W
	 Xc5eiTG0XQa5IvTjVqJAfg4ImV6QnB7jHffd19yj4b4HluD2R71MMmaH1IPO4boOm4PCh
	 d7vzFVW0eSpfjm/kOvTWI/wi6bZjX4jqwcyPPSpaDpdMWDU9+RSVt9Q/5rkZbDf11kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IrWctNvj;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AE160A261C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5AE160A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IrWctNvj
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490585eddfcso2629951f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415065; x=1795019865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezDZnWkAys7yO2bhUCT3pd+sWH0EXaKqpmbbWyxZlHo=;
        b=IrWctNvjOvaL6ocQU1LbiGRbn9W6eJgptQD48aJkdMfZ2j/+pOjAd8WDSeXYeikNFM
         WDCGj0TLxpOh1BzdpgR+jUGN438NrwXG4JT9R1LFw4w04R43sRjU0Lbp7cfLf4LoG7az
         u8IiT9sshM2DnnF132icVOF6LCENjI6rk4Z3UE+fj55juduerCn+epa9xsRj5/EQEv+V
         ac787RQ6FzlvahVO3Isir9ZSKD8AG/iny1MJBK2mBw34iBbNyRMeehiOCWpTQkzbJ+iR
         vsgQmG+YiIRn27+O4xkRwWs3o2E3jCOUYO9iN1eMPV06bokzVDstkYMe0cVkOrnW2UN9
         ekqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415065; x=1795019865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ezDZnWkAys7yO2bhUCT3pd+sWH0EXaKqpmbbWyxZlHo=;
        b=gAcNuCQUk0F+b3Mm7JmlAJQ6WOPY/oTaYSujOOhuC2Kj0uqo9nGWnB4BSnH9vBJSOY
         6uwg1aXsNTDlgF4Ih6H/jA+1dJWEn905FQuZFxVHxarPhLjHgDCrCW4tSERk9WOUTymE
         KgJMo6Gzgks0IkGbrgVKedOKWt+3UuexhfJv7Myjw612L9yE47vFtbTbVqkbZPPVgdew
         WEUdyGJ9lOwEa/XGoO2h2IOmG9CENuPS/mjaigava4mckFGAKdhOUFtTZVKUUEWJmPaI
         ZcGHy9qyNteteHb0kcMHZQX2l5ATw7NM9LXGn3Gjprf+qcQdoSU22j976OLNzQHus9N6
         +dqw==
X-Forwarded-Encrypted: i=1; AL+hErEvTyIzo/fmHMXBntQQontOK6Rfupp34zzYbxYxRqCo47nK1zMzLdpxgYMTkMbmbHa1xY7T36avrHSlY24=@vger.kernel.org
X-Gm-Message-State: APuU4Z++FGb2msn0V2xbhGh1RdXwpwlOIDd3Sbp/9fFZdRa4mGzupxjB
	YWk5kbOyQ/Lip6KCub36DJ49cakBtnIuSs4RUDSY5kQFwhCwQ8pNULhM
X-Gm-Gg: AYBFou3b5mtoSyiU76wjNnToCQz8d1Pdgy5y/OcnsU2jlg+xKugS6txQ8ZB1iOvYjly
	06FOunM7lvikyf1H3OHZzfPV9Muz5IjlgjfC3jZX7nH/6kiHTcdeyssCFlr2x7XJBBgsulSLIv5
	+Mm3JxfXoAOA//jJKSvfzqh6cH3eubC2jgZ6h6FWAMbelic7/1JBIcYemxhi4KsnRWdrcKdOBAQ
	KMG2GssVRPcG6120DpgCeCSTljTY7e3C/i5aqtgxM8/OIzrJW9ZXPK7nZCGllnRXdvrkdB4DYCo
	cUqgmRBbnS7OmT/C3fbgG2I4JbRBfDrYr1g8qfFB/qxBM4U9uYF0C7e91GGdIPax4cDcgH7Ys/+
	5OzqocfLTrHSgIidRdjwYoAX+C3FBb910Q9K4iwy2uVR9K3ClIzsz1eugyeAm2aOEhmAuCi4qee
	X71EayH0qxZsFU3aJDW7FSYRsX9pX7fOw4tayH21pVcyzYcd5xczWAv9b6euhSpwwajWB5RUo69
	8VeKGi0ej/BogOo2h9H2Zqz4iRowohbwQ+o4Svy0wL5K8B+quCDUnW5S+wLb1AJAj2v1bvFK9RZ
	NEJXXx546AnLd1gsIxtiaQYJvKbRRNXzkfPoRNPjLckwxG8Kz0nO+oXGlx1YISNWTrMtTYo8LSC
	BY1ddLhfF2IMM
X-Received: by 2002:a05:6000:230f:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-499c69cae4emr5038162f8f.18.1794415064910;
        Wed, 11 Nov 2026 08:37:44 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:6e81:13fe:ca06:8db8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2bf91sm12200583f8f.23.2026.11.11.08.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:37:44 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v1 7/7] zorro: warp mfd: expose the Kickstart slot selection
Date: Wed, 11 Nov 2026 17:37:34 +0100
Message-ID: <20261111163735.227286-8-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111163735.227286-1-p.pisati@gmail.com>
References: <20261111163735.227286-1-p.pisati@gmail.com>
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

The board keeps several Kickstart images and the ARM boots the 68k from
the selected one.

Writing kickslot makes the ARM reset the machine on the spot. That is
how the board works, not a crash.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 .../ABI/testing/sysfs-driver-warp-mfd         | 11 +++++
 drivers/zorro/warp-mfd.c                      | 49 +++++++++++++++++++
 drivers/zorro/warp-mfd.h                      |  7 +++
 3 files changed, 67 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-warp-mfd b/Documentation/ABI/testing/sysfs-driver-warp-mfd
index a8213affb153..8cb7df076e15 100644
--- a/Documentation/ABI/testing/sysfs-driver-warp-mfd
+++ b/Documentation/ABI/testing/sysfs-driver-warp-mfd
@@ -40,3 +40,14 @@ KernelVersion:	7.5
 Contact:	Paolo Pisati <p.pisati@gmail.com>
 Description:
 		(RO) Fan drive, as a percentage.
+
+What:		/sys/bus/zorro/devices/zorro<N>/kickslot
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Paolo Pisati <p.pisati@gmail.com>
+Description:
+		(RW) Kickstart slot the ARM boots the 68k from. The board keeps
+		several Kickstart images.
+
+		Writing a slot number selects it and makes the ARM reset the
+		machine at once: that is how the board works, not a crash.
diff --git a/drivers/zorro/warp-mfd.c b/drivers/zorro/warp-mfd.c
index a438faeaa232..637ff4eccca3 100644
--- a/drivers/zorro/warp-mfd.c
+++ b/drivers/zorro/warp-mfd.c
@@ -23,6 +23,7 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/jiffies.h>
+#include <linux/kstrtox.h>
 #include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -302,6 +303,52 @@ out:									\
 }									\
 static DEVICE_ATTR_RO(name)
 
+static ssize_t kickslot_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	int ret;
+	struct warp_mfd *warp = dev_get_drvdata(dev);
+	union warp_reply *rpl;
+
+	rpl = kmalloc_obj(*rpl);
+	if (!rpl)
+		return -ENOMEM;
+	ret = warp_get_status(warp, rpl);
+	if (ret)
+		goto out;
+	ret = sysfs_emit(buf, "%u\n", rpl->diag.kickstart_nr);
+out:
+	kfree(rpl);
+	return ret;
+}
+
+/*
+ * WARNING:
+ * changing softkick slot will initiate a forced reboot - your Amiga is not
+ * crashing, it's the ARM MCU that is abruptly pulling the plug
+ */
+static ssize_t kickslot_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct warp_mfd *warp = dev_get_drvdata(dev);
+	union warp_cmd *cmd;
+	int ret;
+
+	cmd = kzalloc_obj(*cmd);
+	if (!cmd)
+		return -ENOMEM;
+	cmd->hdr.cmd = WARP_CMD_SELECT_KICK;
+	ret = kstrtou8(buf, 10, &cmd->select_kick.kick_nr);
+	if (ret)
+		goto done;
+	ret = warp_exec_cmd(warp, cmd, NULL);
+done:
+	kfree(cmd);
+	return ret ? ret : count;
+}
+static DEVICE_ATTR_RW(kickslot);
+
 warp_config_string_attr(boardname, board_name);
 warp_config_uint_attr(fanspeedpercent, fan_percent, "%u");
 warp_config_uint_attr(fmwver, fmw_ver, "%04X");
@@ -324,6 +371,8 @@ static struct attribute *warp_attrs[] = {
 	&dev_attr_tarm.attr,
 	&dev_attr_vbatt.attr,
 	&dev_attr_vcc5v.attr,
+	/* RW attr */
+	&dev_attr_kickslot.attr,
 	NULL
 };
 
diff --git a/drivers/zorro/warp-mfd.h b/drivers/zorro/warp-mfd.h
index 4fa09fa972d4..6bc7b38b5e4b 100644
--- a/drivers/zorro/warp-mfd.h
+++ b/drivers/zorro/warp-mfd.h
@@ -59,6 +59,7 @@
 
 /* Command opcodes. Only the ones this driver issues are listed. */
 enum warp_cmd_id {
+	WARP_CMD_SELECT_KICK	= 5,
 	WARP_CMD_GET_DIAG	= 6,
 };
 
@@ -72,8 +73,14 @@ struct warp_cmd_hdr {
 	u32	cmd;			/* enum warp_cmd_id */
 };
 
+struct warp_cmd_select_kick {
+	struct warp_cmd_hdr	hdr;
+	u8			kick_nr;
+};
+
 union warp_cmd {
 	struct warp_cmd_hdr		hdr;
+	struct warp_cmd_select_kick	select_kick;
 };
 
 struct warp_rpl_hdr {
-- 
2.43.0

