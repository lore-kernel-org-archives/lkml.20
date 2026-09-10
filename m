Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3CC49BD70
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049533; cv=none; b=erqnip2Ia9HHmqXKfmSZgxSK74ilQRLIm2Iq4ZJdt4YmPuDz+XrMxnYWobUAP4oSAv2Jo4OXEraCKHDbC3ysB7K3tRCMaZNIBUDvuMT7pDJYBCfg72Aw0Q0GAk6k1HEfCrW6L+h1riOuDe9UgsVQHLDLs++GAXwC6WSG7hyfZlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049533; c=relaxed/simple;
	bh=2xTALxkXFsoAEpknjHcykwDIz5J2v3j948fU3BS1SNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HSKDyhXapDrBXvXSSzug+yrpaiBvvLv+lfwiI/KDZ+oFRqeywcFcT6USxd+h4VtS1XNxUeuk4fVWgtL5l3vIGLNW0JwqY34EcQzMVaCZb8yzTLuxCXlevEiGS9Cf+k8RuUPxeUgOslJRNmf5Cb38wbJ0PQmtLxe+qtIyDKb+kNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzEJmgv8; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzEJmgv8"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d28035so1065978b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789049531; x=1789654331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rldSYYGBUVXSAo9blHhG9JLt+IvlXHrSxJ/9lnfS/gc=;
        b=gzEJmgv84tsRs9JPl9DEtpHScg5N10oIYlGMUIX2ovbpwv5qxkeaWE63uTr6oZ4upq
         7IIfTwWSxO7JrO3vDtWUdEmDsX+iRSY/NEf09EhlObFocZ/FURjJNdO6Be7ONEfsIzD7
         PphjtpNDdZuWXokYJvt2J7CKZXtNcGv3kCuG6uRMeISBdojk2vmht4Kw3Kj3X12Txkn0
         nbrG/I/SwCj9WKedfnSkelZ04bCwbQVRlGqFTUpn7AJ+PORvOHbw3RrTXrfQ5FjzaeIo
         27A1WEi5PFXUbJgAgDf2u4Hs0LtdyJh+qs5rI8wZh51y6Kdh5FZo6pKXGFAl5R9X/sxr
         rzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049531; x=1789654331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rldSYYGBUVXSAo9blHhG9JLt+IvlXHrSxJ/9lnfS/gc=;
        b=E7qevzP7dY2UAjk4/LJGAVzKvEAAtN9D6vWZGSpWduQMLrk5keWLB+1SdytCP1yL7I
         oP6ln+sWX9Aen/LNOC5TRZeF+B1rRpnUZ4q9gcznli9DpS8RUCQ6aDEr9sic2MTUZ2Ta
         GqAOYOSVe+b5clsRiW3rSlJDKS1roSVqnM2Yh8OyAns36FNmU/OcQSXUQEiFbx1v7fed
         9ak8/GdvYT12QiV9o+ILdjPHLe5C+uE1LuaP3mkoIbE7YmAFv0hWwfJ/rTvCIMhQpRB+
         Xj+guVx0Xz29fOheBGO8Zlq7zH9Q5uKaHxxApoZ6dtPqxmt5BbaNbJBGIoJiOwDMCVGM
         8IDw==
X-Forwarded-Encrypted: i=1; AKwUvByQHczNvjB+pDq/fth26KbVnojzPJiQDctOR0kUdC//2pUxTEaXpH+A3p5NI2STswtSSunPmOWhhAsa61g=@vger.kernel.org
X-Gm-Message-State: AFuF++k9QFmmCX/Y+NJfCn6UYwtPqxWftZ1sQUNnUoeKj7aWhYFKXIKe
	c7/PoFZioLjBP06leuUkYydIT4ZmfN0EWV1Ewo/manbGYminSwJ1WhLPkz9Njg==
X-Gm-Gg: AYBFou2wolHSO2YDxspLRlfhjWhrts+VBsj8TAP6GYdZ+GdCFGkRggrCYI33AoLrJmQ
	RrTXj522ewmNbOSKmVQK3IQL8VuCA5P28h4JUSVpATsTqyBLe7cBL2nvDv2DNzYXQYsBE3MU90g
	tueX6smXtyATfkrU9HpMxm6sbv1gqI6DjRgPpXBsGiTx1ECPDcjweZYpEyzsEGYRvroBCwd1pnz
	HlJWXf+RrSh5u5J5kPG1IZk3pKELplZCgfEfNoaAK2JU/GqMy8MPAEGl8H3Lbh18CYegRjBzBx0
	PGWmPy9zGamHFBsEbcG5ci9R91XDU3nlNSxQ1OeOfOmLrlad58Gaa0rWA70l1hP7cNsEfRDaeWE
	yZphDY8lREJ7zN5AoSpS5Zo/H212q/PP7s6F7qxNrX9MUSXIh/Zq3beWGl9neT4obRhDdO4yUsl
	qx6oh3sGd9AOdh5AkNskpITapa5xFZezQTGBUFb7TuvN8WFH2hmhbZI3Xp1Jqk4G4ipc1KzBoeY
	J9qywF4VCVkFPn9jHNM8A==
X-Received: by 2002:a05:6a00:6c89:b0:857:72f8:dca3 with SMTP id d2e1a72fcca58-869b1d94d54mr3164303b3a.9.1789049531329;
        Thu, 10 Sep 2026 07:12:11 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152d32addsm8145561b3a.34.2026.09.10.07.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:12:10 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] thunderbolt: Validate DP bandwidth notification port
Date: Thu, 10 Sep 2026 23:11:58 +0900
Message-ID: <20260910141158.2466812-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The port number in a DP bandwidth notification is six bits wide and
comes from the router. A router whose maximum port number is smaller can
therefore make tb_handle_dp_bandwidth_request() index beyond the
max_port_number + 1 entries allocated for sw->ports. The first
tb_port_is_dpin() check then reads the out-of-bounds object.

Add a common helper that warns and rejects out-of-range port numbers,
and use it before dereferencing the notification port.

Fixes: 6ce3563520be ("thunderbolt: Add support for DisplayPort bandwidth allocation mode")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
Changes in v2:
- Add tb_switch_port() and use it for both tb_port_at() and the DP
  bandwidth notification lookup, as requested by Mika.
- Submit the DP bandwidth fix alone; the path-discovery change is not
  included.

 drivers/thunderbolt/tb.c |  4 +++-
 drivers/thunderbolt/tb.h | 11 ++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 47753a5c0f2e..4854735514af 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2756,7 +2756,9 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 		goto unlock;
 	}
 
-	in = &sw->ports[ev->port];
+	in = tb_switch_port(sw, ev->port);
+	if (!in)
+		goto put_sw;
 	if (!tb_port_is_dpin(in)) {
 		tb_port_warn(in, "bandwidth request to non-DP IN adapter\n");
 		goto put_sw;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 4373336d9425..48dc57250e45 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -585,14 +585,19 @@ static inline u64 tb_route(const struct tb_switch *sw)
 	return ((u64) sw->config.route_hi) << 32 | sw->config.route_lo;
 }
 
+static inline struct tb_port *tb_switch_port(struct tb_switch *sw, u8 port)
+{
+	if (WARN_ON(port > sw->config.max_port_number))
+		return NULL;
+	return &sw->ports[port];
+}
+
 static inline struct tb_port *tb_port_at(u64 route, struct tb_switch *sw)
 {
 	u8 port;
 
 	port = route >> (sw->config.depth * 8);
-	if (WARN_ON(port > sw->config.max_port_number))
-		return NULL;
-	return &sw->ports[port];
+	return tb_switch_port(sw, port);
 }
 
 static inline const char *tb_width_name(enum tb_link_width width)

base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.55.0
