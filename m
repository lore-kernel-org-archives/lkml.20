Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415064;
	b=tBmwtuK+R7s1DOJRa/iBwCCJwKQNpunadoupDGomtXfD3VSxRboD0csyo+Z8UkFN7U3E
	 0OhdZKgjqgpEiLHegqmpKvKXjQ5S7bGP1wZ0RxiD4Y4/QLVsRcQIZ8v5fut8WRPcukhlk
	 yCRKSSkC8+RB7VF1df2EryMWejEVUkm2cwCCM1vyI8cveTGGf/TGXXDusqC5HJJ7st9X3
	 Z1TCrSQz/uRw/sh8h9AN7ZoAEWWMtmUcz9Ktx1LKcyuazOw99UIC+lPkEXjrp4S51KXeE
	 F0mXTzzM3wy+BfD0OvuXp4mlHdypaZtZUkAkr7Dfyk04313toek6sO/Ya/2dnUC+5Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O4LCoxfztIxiO4Ve6PdwkUlzn+vvBZo5he0KpnyIOes=;
	b=r21xxyaHD5Q9X0yn99jMOBsxOltirfQSuivYUdeZ+TGswvKXrhbCtrh7QdYqTAlZxOni
	 dA22LjvrCTpwHh1iGskmYi4JTsRRpCTr5DcBqZpstw8EBpjwqsYr0UwBLvhf6PglWfRj+
	 irp7XOJndMAWbTMLEu123Tv+UEqV2gNJmbEV7Nb9MCzdIl6IpZMvW6Jdbrs/SFt96fb+M
	 x/jZrppPYzWJhQGiJf3boW/h0DtOz07wupfjAjnSyey5G/mvU227sGfrKN3qipOvdpjEP
	 l3JgFThNalXWYdWMG5uux7d+8XSq/IhExuWG3K+vj8KhxlBmdKJHxVW3RQNKu9hU6tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0dae87Cy;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8533A606A8B2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8533A606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0dae87Cy
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492690dd5daso2668211f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415063; x=1795019863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4LCoxfztIxiO4Ve6PdwkUlzn+vvBZo5he0KpnyIOes=;
        b=0dae87Cy/B9YUhxZrRX3+f0D/Rj3UEQYH6g+Gqwe8026eNj4hsPNt149zkXFJyMyvk
         AruDO4TRtTFhYaSMu7KFHyzESFZeLSgahD4SBrUCsq9t6bYO0GpAIk3oc10M1B79b+QG
         /YvQEQd4o2dPzysD+NhFds/Nf9fOmZmcugnPa/fw9ydl7KC7QTmvMf7fKjDTct8MDs5f
         fZkuxH3qENaspZ6NvRbVllAdxh+Z3MyHEwqof4x+FPOMD7LMaqUI+N1KFbq7WWCCkA4e
         ZV6EpQDdQfyGWUDYkyD1aLRntBfa4prMpXWfDV8hR08IdqHicaqDzOXJIsprZSuW1h0l
         /nVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415063; x=1795019863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O4LCoxfztIxiO4Ve6PdwkUlzn+vvBZo5he0KpnyIOes=;
        b=eQCwoP+BBn3mQnfxZ+3MyUgrdL3R7AFOq/xkRw59H9xEzvdYaxQrHTTxsJLl0YvOGM
         ccu28JSGlV00AzBysP9zQv2vXUM9peAZA69POWibTd7mwtqd+rYQBMp/RZKbbfhbXY2+
         +sPcbc6lUNV9gj7myE4oiojrULzu9spBm5xrxDD5NByTp8Ly1n4/tp0hoqQoOLdYVRRo
         094Sb+MwSr4ots+sKXFjXIF8Reg9BQ2jUE7CMpHAcWT7dlEXF1qFP7rHG8/mQEDy2Y3d
         82RqXyl0wGE228+p+wRSeV+oM5alNFwpEx1AjJT+AokCvWsVYSPib7J04HTZiwZRhdcQ
         j3Lg==
X-Forwarded-Encrypted: i=1; AL+hErH6E8UT9TFB7eY35b/GaFKeLAoQH/g5R9PITQtU5H2FkGiQ8jGYq/D8wSk1FHI0qnDafCr8MHprK88lI18=@vger.kernel.org
X-Gm-Message-State: APuU4Z8A6NPp7z+2tgpq8HPSIS62fcFYXMx+k9rGRQybZKRBhugj97iX
	9Zsq/2Is7WNgDGHRQT5es6b86F/fL1Ye/KPPU8APkW8e5qxdp4vDr1Np
X-Gm-Gg: AYBFou0+Ep2S91D2JHDDREL9JShiaYb8D0n/vEJEL0D6Gkf/JBr3rAIOm7l6etFrBPo
	nFDVIGVttFZNpDnBoBXpetdMKfg/Gle0wv4HlxJeTEeVZ8MxYJigM65fKKB16T4QxETOYR0CXi8
	lWu9hoV42PjdUiuMd9fCgS6YdNBeQ+b0TuV5+IwSA6S8IRDYYCIQJiKcPxHDTXVOPBynWl/txdM
	njTBIPRBs4gCv3Oayxeip7aZ+vZpcR3DTjezx7sX1TZvWcVLtVpr3bkKWh6zU3Gfphy1YxgqVFz
	msyVm9BiDLdO1dFqRV9xEPMx1gYpN5GFu6+1l8FDavqVwoWnMVVgWUBto/rRtWVXN1w5wonflb9
	NW8UREl+vHLsJacCVFwg2X2g08Yx/9iSYxaG/2X6HT1iJ/Gpp2wmOz1Q6Ux1uo7Y/w9zeibmaTm
	lDXmlk12VUsMZX1BaR/smX8NS1HqjlWd8UzOx/NHXYIeH6KhC9tGWKy3PlLMEfLYWK/n3ySE/ip
	w1A72S/tPkMw7JxiB8sVrfd/KDGgIKuYSp/ZvB/cAtQ5tGFgGYxq9dNAA8x8nOE3nGj5TaIzGp0
	cGcpzluqGdMkBjaKnXEA8WAj3nLjLfPsSQ6CwWuotWK2ZAEIyUTuqErJW8yyigyARNVwSuj7yoU
	1suix88BU+laJohhQwMMdr6IMT1HxJSiV3T0=
X-Received: by 2002:a05:6000:2213:b0:493:c7aa:7cef with SMTP id ffacd0b85a97d-499ca844595mr4406823f8f.52.1794415062584;
        Wed, 11 Nov 2026 08:37:42 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:6e81:13fe:ca06:8db8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc9asm11050119f8f.29.2026.11.11.08.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:37:42 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v1 5/7] zorro: warp mfd: expose the voltage and temperature sensors
Date: Wed, 11 Nov 2026 17:37:32 +0100
Message-ID: <20261111163735.227286-6-p.pisati@gmail.com>
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

The diagnostic frame carries the 5 V rail, the backup battery and three
temperatures - the 68060, its NTC and the ARM - as IEEE-754 binary32.

Decode the bit pattern with integer arithmetic into milli-units.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 .../ABI/testing/sysfs-driver-warp-mfd         | 19 +++++
 drivers/zorro/warp-mfd.c                      | 80 +++++++++++++++++++
 drivers/zorro/warp-mfd.h                      |  4 +
 3 files changed, 103 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-warp-mfd b/Documentation/ABI/testing/sysfs-driver-warp-mfd
index 8996d1961b96..fec712b8b9b0 100644
--- a/Documentation/ABI/testing/sysfs-driver-warp-mfd
+++ b/Documentation/ABI/testing/sysfs-driver-warp-mfd
@@ -14,3 +14,22 @@ Contact:	Paolo Pisati <p.pisati@gmail.com>
 Description:
 		(RO) Firmware and hardware version, as four hexadecimal digits:
 		an fmwver of 2027 is firmware release 20.27.
+
+What:		/sys/bus/zorro/devices/zorro<N>/t60int
+What:		/sys/bus/zorro/devices/zorro<N>/t60ext
+What:		/sys/bus/zorro/devices/zorro<N>/tarm
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Paolo Pisati <p.pisati@gmail.com>
+Description:
+		(RO) Temperatures in degrees Celsius, with one decimal: t60int
+		is the 68060, t60ext its NTC, tarm the ARM co-processor.
+
+What:		/sys/bus/zorro/devices/zorro<N>/vbatt
+What:		/sys/bus/zorro/devices/zorro<N>/vcc5v
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Paolo Pisati <p.pisati@gmail.com>
+Description:
+		(RO) Voltages in volts, with two decimals: vbatt is the backup
+		battery, vcc5v the 5 V rail.
diff --git a/drivers/zorro/warp-mfd.c b/drivers/zorro/warp-mfd.c
index 61866f678b61..d407c786d44b 100644
--- a/drivers/zorro/warp-mfd.c
+++ b/drivers/zorro/warp-mfd.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/bits.h>
 #include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/init.h>
@@ -22,6 +23,7 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/jiffies.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
@@ -190,6 +192,73 @@ static int warp_get_status(struct warp_mfd *warp, union warp_reply *rpl)
 	return 0;
 }
 
+/*
+ * The board reports its sensors as IEEE-754 binary32: decode the
+ * bit pattern by hand and carry the result as milli-units.
+ */
+static int warp_f32_to_milli(u32 bits)
+{
+	int exp = (bits >> 23) & 0xff;
+	u32 frac = bits & GENMASK(22, 0);
+	int shift = exp - 127 - 23;
+	s64 v;
+
+	/*
+	 * inf, NaN, zero and subnormals all round to nothing useful here, and
+	 * so does anything of 2^23 or more: that is already past what an int
+	 * holds in milli-units, let alone what a sensor reports.
+	 */
+	if (exp == 0xff || exp == 0 || shift >= 0)
+		return 0;
+	if (shift <= -63)		/* smaller than a milli-unit */
+		return 0;
+
+	v = ((s64)(frac | BIT(23)) * 1000) >> -shift;
+	if (v > INT_MAX)		/* a shift of -1 or -2 can still overflow */
+		return 0;
+
+	return (bits & BIT(31)) ? -(int)v : (int)v;
+}
+
+/* Render milli-units with @dec decimal places, rounded, as WarpDiag shows them. */
+static int warp_print_milli(char *buf, int milli, unsigned int dec)
+{
+	unsigned int scale = (dec == 1) ? 100 : 10;
+	unsigned int units = (dec == 1) ? 10 : 100;
+	const char *sign = "";
+	unsigned int v;
+
+	if (milli < 0) {
+		sign = "-";
+		milli = -milli;
+	}
+	v = ((unsigned int)milli + scale / 2) / scale;
+
+	return sysfs_emit(buf, "%s%u.%0*u\n", sign, v / units, dec, v % units);
+}
+
+#define warp_config_sensor_attr(name, field, dec)			\
+static ssize_t name##_show(struct device *dev,				\
+			   struct device_attribute *attr, char *buf)	\
+{									\
+	int ret;							\
+	struct warp_mfd *warp = dev_get_drvdata(dev);			\
+	union warp_reply *rpl;						\
+									\
+	rpl = kmalloc_obj(*rpl);					\
+	if (!rpl)							\
+		return -ENOMEM;						\
+	ret = warp_get_status(warp, rpl);				\
+	if (ret)							\
+		goto out;						\
+	ret = warp_print_milli(buf,					\
+			       warp_f32_to_milli(rpl->diag.field), dec);\
+out:									\
+	kfree(rpl);							\
+	return ret;							\
+}									\
+static DEVICE_ATTR_RO(name)
+
 #define warp_config_uint_attr(name, field, format_string)		\
 static ssize_t name##_show(struct device *dev,				\
 			   struct device_attribute *attr, char *buf)	\
@@ -236,12 +305,23 @@ static DEVICE_ATTR_RO(name)
 warp_config_string_attr(boardname, board_name);
 warp_config_uint_attr(fmwver, fmw_ver, "%04X");
 warp_config_uint_attr(hwver, hw_ver, "%04X");
+/* board sensors: volts to 2 decimals, temperatures to 1, as WarpDiag shows them */
+warp_config_sensor_attr(t60int, t60_internal, 1);
+warp_config_sensor_attr(t60ext, t60_ntc, 1);
+warp_config_sensor_attr(tarm, t_arm, 1);
+warp_config_sensor_attr(vbatt, vbatt, 2);
+warp_config_sensor_attr(vcc5v, vcc5v, 2);
 
 static struct attribute *warp_attrs[] = {
 	/* RO attr */
 	&dev_attr_boardname.attr,
 	&dev_attr_fmwver.attr,
 	&dev_attr_hwver.attr,
+	&dev_attr_t60int.attr,
+	&dev_attr_t60ext.attr,
+	&dev_attr_tarm.attr,
+	&dev_attr_vbatt.attr,
+	&dev_attr_vcc5v.attr,
 	NULL
 };
 
diff --git a/drivers/zorro/warp-mfd.h b/drivers/zorro/warp-mfd.h
index 366848545ea4..4fa09fa972d4 100644
--- a/drivers/zorro/warp-mfd.h
+++ b/drivers/zorro/warp-mfd.h
@@ -84,6 +84,10 @@ struct warp_rpl_hdr {
  * Reply to WARP_CMD_GET_DIAG. Fields this driver does not expose are kept
  * so the ones after them land at the right offset.
  *
+ * The board reports its sensors as IEEE-754 binary32. They are kept as raw
+ * bit patterns because the kernel cannot use the FPU; warp_f32_to_milli()
+ * decodes them with integer arithmetic.
+ *
  * turbo_level and tz_corr_secs are reported by the firmware but no longer
  * maintained by it; treat their contents as stale.
  */
-- 
2.43.0

