Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844367;
	b=yG22miDZu3g6qrPFu1/xv5kUkxAdokNqavFG8Lx0PmjxBaJj/5Hci9AKSOvbiFacJHBT
	 Jr8BjsirLH7tNBqUIRVKdKs2cIBzP6z9+OHgeH7uelqMgHH41uH9dti3Xzlm1YBeQcTDK
	 BT9i+5XqR166Nzc3bPqb9yRIufK2L76aueIxO6WQ97xN8mj79QEyJxW23WC9yOKVABnYP
	 /YPdztqiEH+BwMMxH5CsIS98YAXG6t3iQTr4prLPvnlI/n4WgJguKG30l8UfKjBWU9fN8
	 14GdfbxsEs9Jear2WTyvQlWffMkA9ly8K8jQOI8V7Dl4oLOmR4Xavxu+VWD9muL6Sag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f09LbFbzsrP+5JEKU6LsA1tqG6izYEkt3fstb0HirUw=;
	b=wV6YIqeKkfQk5xOJHjk19I0N5oIvmEp7vm/RdjMZy1w3Haxe6599KXyv+k+atugEpfAH
	 4gP/i3DwNRQt7fiukop9pA1aWqAqjb7Xg+jEpmwzLUsKwsyAE0+jC6BNH0wojnqqiwCw3
	 iawtLm2IHuKEFEMPlHzU5ZhDyzn2NuTuaPpgOpaZOeDO1OwsNv7NrtcLlhqslkLhtrmlE
	 d//gt5hiZeWcKNbJzMWjtoQp3//4kiz3UpMwFzTRSEJFiF+5hHrse1xsE60hLNeUhg8jF
	 YWDt2q/1qw/7elUnj4DVBeVTVdNzi+GnlGNc6hDcQgtGsgYDAOa+cpaZyor5PJIlaDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oNcsmVze;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571B9606A88E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 571B9606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oNcsmVze
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49412eb1474so1804947f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844366; x=1795449166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f09LbFbzsrP+5JEKU6LsA1tqG6izYEkt3fstb0HirUw=;
        b=oNcsmVzeYE7WPt+i300Bb/xG/YCYgIbXz1N9KfmiGgj6pexjhk9cxnRBOoYpA22Oxm
         ovQfoWyNHXpHWZ6OoTmOuYUxZBLtIE+PbC/KzOOqzQVWYuboRV1at0V8t27bj5isYtY5
         1A9F2SrbMZyPNrF0R34fmWWEYSUVF7IXBoRbiY6DArpHWd2z+M1+ddaeGxpF8Y4T0bXC
         TX2uXvAEx9PDlAmNxdSEZ1e9gnx82GGC0SMPeZOg26I8b8CW9J72fAkk2Qtl2mNPBfkB
         7zlSIUN8Rw1JOU/Xyk5O8mhHJkP8MhByxX4l7ObQH8VPs0B9WkLNHvHsmiHL1nyDnb4f
         cHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844366; x=1795449166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f09LbFbzsrP+5JEKU6LsA1tqG6izYEkt3fstb0HirUw=;
        b=JuYnqn5bFz5G2HmP0Tb9xv9hVcnbNQiRVjqmkJ6T8qfvxtkS1seIRoNv+b/sOVXV6s
         0FNKP1wos3JRJYCE40mDVZnwdG7tGBnRhp7/3bjRxk/hMnKTNKNTknJrLVLIGtze8A9P
         Jov5u8YiEOqDmMRVIw6pRUITZbe02RCZkZi8asb3I8wUFOdAzJ6QGs/Ark8moVduZ9HD
         N3+vh/rbr7GJuDW+zE0oaVGFgGWbajMTx+PIAk58WmemSbsUWn03UiMNu0pirumEmcN1
         Frg1K+soK8Lf9Z15lFYcjfCPCklY24KwP3E2cHk4LVawsxawVF4bvIWwk+dD64NH8eDM
         dC1g==
X-Forwarded-Encrypted: i=1; AL+hErEGFlecYwEYOCbyp3BPCHv8De3Zj+iTSDvWaFNdwoASAPs9y8SVUfXSylNbcw62NIzKpfVR2/up2eqS4Sw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Vteq07boa5oRoA7J+txNMonoYRtkJtp+fmiR5f2w04VOoxH7W
	TQfjwEYFmS2u0/El6sEJhG6kSISRYIZD+dh7TzyujbitbisAc8/p9k4O
X-Gm-Gg: AYBFou0qpHOLj7Bg/M3Fx/30zxhiIntmDCgrbEItnJvnNm5Dunjv4fSTkyRsPNwmD4E
	ghYDTGVR5vrmOJkK+Rc27smdLDw/lHmtJl9Wr4MEaoLZvGfvppq9RvtVgeFop5wOsusvdRHEBT8
	imtvwpFxW4ccA+k40JdrKbRttNocy6S8nyopD+iRToA5jL5ug+XkZ+HeX1qG35gLZnNCglQ1xKY
	R2IidNIX2axYqVAZqH4pmiOWjpe2bbGNY5ux4O3lvATTQKWQLLahzCn1KGd55pOi3FvjV4PKCK0
	4I7l5GECLXB4RdWbYhL5qgjZipbDdQkXPTYXFPXMusPis9t0zoHvTrvP8LByu2ljN9eOgO+Kr7p
	W3TreO4umAw+8/Uutynv5sHZY+hqm8DUR8AzHByleGBl5P8tbBn269+0GSHm8Hrc9FQCd/DMcIx
	jpB07zxuXtnv/5WKzPcqnQzoTaBmucmv2dp8eyKmUwJdM0uYPYZ1n8sbElfr1ScCE6V8o0t5+Jn
	/3er0s0KFYalp8WRfdt0ScQuPysOcy/iH2nEWrNrPmW+OjOVmnJqpQdCKd1hxnobmCJ0+0euPwB
	q7AxyxF/WRaPBKUXyC+dcw1HmGby03YE6Do7U++2mJPyacH5b7DiZJo/hFoVcGhzx3N8zZS9H1E
	Y14x3f0xe1QYlMO2w3f3N1ziJ06u7kuijS+ZEGHiB+7zNk/wsmDw2XKagY6InXg==
X-Received: by 2002:a05:600c:3f0d:b0:4bb:7757:fe58 with SMTP id 5b1f17b1804b1-4bb7757ff82mr18309875e9.19.1794844365564;
        Mon, 16 Nov 2026 07:52:45 -0800 (PST)
Received: from B87454BG30364.retailmedia.com (284035233.box.freepro.com. [82.96.134.200])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm321279415e9.10.2026.11.16.07.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:52:43 -0800 (PST)
From: Erwan Velu <erwanaliasr1@gmail.com>
To: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>,
	Suma Hegde <suma.hegde@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Erwan Velu <e.velu@criteo.com>
Subject: [PATCH v2 4/5] platform/x86/amd/hsmp: Add pwr_current_active_freq_limit_source_raw
Date: Mon, 16 Nov 2026 16:51:46 +0100
Message-ID: <20261116155147.769630-5-erwanaliasr1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116155147.769630-1-erwanaliasr1@gmail.com>
References: <20261116155147.769630-1-erwanaliasr1@gmail.com>
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

From: Erwan Velu <e.velu@criteo.com>

pwr_current_active_freq_limit_source reports the active frequency limit
sources as a list of names, one per line, which metrics exporters have
to parse and map back to a value.

Add pwr_current_active_freq_limit_source_raw, reporting the same source
bitmask as a single hexadecimal value. Exporters only need a plain
integer conversion, and its interpretation can be centralized in the
monitoring stack, e.g. with Grafana value mappings, instead of being
decoded on each server.

The bit assignment is defined by the HSMP specification and is stable:
new limit sources are only appended, existing bits never change meaning.
A given value therefore has a single interpretation, whatever the
platform or kernel version it comes from.

Assisted-by: claude-opus-5-5
Acked-by: Carlos Bilbao <carlos.bilbao@kernel.org>
Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  4 ++++
 drivers/platform/x86/amd/hsmp/sysfs.c | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index c4459a9dddc6..6156d50362cf 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -121,6 +121,10 @@ Following sysfs files are available at /sys/class/amd_hsmp/socket%d/.
   in MHz.
 * pwr_current_active_freq_limit_source: Source of current active frequency
   limit.
+* pwr_current_active_freq_limit_source_raw: Source of current active
+  frequency limit, as a hexadecimal bitmask. Bits 0 to 7 are, in order:
+  cHTC-Active, PROCHOT, TDC limit, PPT Limit, OPN Max, Reliability Limit,
+  APML Agent, HSMP Agent.
 
 ACPI device object format
 =========================
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index 94670c8e689b..5615b0385477 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -282,6 +282,21 @@ static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_att
 	return len;
 }
 
+static ssize_t hsmp_freq_limit_source_raw_show(struct device *dev,
+					       struct device_attribute *attr, char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "0x%04lx\n", FIELD_GET(FREQ_SRC_IND_MASK, data));
+}
+
 static const struct bin_attribute  hsmp_metric_tbl_attr = {
 	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
 	.read = hsmp_metric_tbl_acpi_read,
@@ -315,6 +330,8 @@ HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
 	      hsmp_freq_limit_show, 0444);
 HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
 	      hsmp_freq_limit_source_show, 0444);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit_source_raw, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_source_raw_show, 0444);
 
 static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_c0_residency_input.dattr.attr,
@@ -331,6 +348,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_clk_fmin.dattr.attr,
 	&hattr_pwr_current_active_freq_limit.dattr.attr,
 	&hattr_pwr_current_active_freq_limit_source.dattr.attr,
+	&hattr_pwr_current_active_freq_limit_source_raw.dattr.attr,
 	NULL
 };
 
-- 
2.53.0

