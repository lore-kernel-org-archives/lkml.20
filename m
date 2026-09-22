Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5057F4DAF90
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790117766; cv=none; b=NYp5Dqsseu54YnIWd97WjEXmnyM53E3+xq8FhaLlzURUTfeuCTMdATR3Yl2SM2u9udHpXj8uFtG4jNJ8ypB2a/S40JGUYu3362x0pJHnSFprMS/o6yAg6qV+wkUqzcIBxIJF8Fzlk/wL0cOg1+xkpUMSp7Qm5JcGN9KObaSlPJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790117766; c=relaxed/simple;
	bh=M2STsjQWdcy9qcjyv+/mey8qa2gmAaGXyqLkMn90RuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=htLZiplLwFgPaTQnN71xscd0AxmZMIeRZfkA6IqQ96pi4MdyibGd7+I82kbqAyA57nzJqbtkXjSEnwEXqSpgJUbnGFGxZ6zOFE9RMT03JQFl86G1cLhShpbHurARMiZwhchkjBPqpFT9aaVS3++oUsLWpnrfR/6/32xbpNl9rJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlIe2ysG; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlIe2ysG"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93a2a8c29c4so37435485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790117760; x=1790722560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zOb7x4ygb83hEYoABya/SQC3FYbUHL3RXKH7jN2xAeM=;
        b=DlIe2ysGdNNMIb2x6nYV6qtxipxQa+OXifjUdYYum0LCTjOSGl5kP2+U3avP+Gw02A
         xOd3CZ32S5A/tVqrWG8z+6KeFMN4su4OyEKHSZWTZBpHdRCq0m1p8bu+sRe5PKtyU70X
         nrbe1D791yC0d3W+FcRoMsFNui1TVxHWSt/umBM+IcwUHqhcaU2EApDmiGCExW8/Nu9b
         DS0u76PasMnZwse4eYXl5hzK/lyxHI32Kuef7EvMADKGux6B+CX6VZ2WiysfP1xwXsBg
         u50DImUY1JueM4wA2r7irpcdqDLcz5JT8W+esbCo0SwF+t2MZ/BBS0liHy5zHI+iFtTZ
         hw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790117760; x=1790722560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zOb7x4ygb83hEYoABya/SQC3FYbUHL3RXKH7jN2xAeM=;
        b=B2zIOJpXStmQGtEiNCcA5mvFQ1EeDv1hF0LoAwN0ROx3YZRDw34dqJWMhe3k/cwcGp
         yjcEN5hquJrgznO0RFbKkLfgeSRanSU8yPi+CDxqHFFacQN0jgsCVGzHn5NOgchr2vhJ
         Ac6lt0YjgZLFuyR4mbGFJBJ0Ifv6F1+KGNZgFKu33dcva1CWee8OxpXz0eR8Hg5p/1nE
         Z7rxBzahnFyxDo5GCdFyYv8NbaBFwhlqKD/NHjgE4rjuOgmnRAH2z/Iqi6A1Kp/5cxu2
         iHTD9mW3RQSe9yoAFTHiRpP31JpUcgvy4LsHB+fFfV/1Q4gTZ+DzHZqlYw9YMERjS7m/
         HyVA==
X-Forwarded-Encrypted: i=1; AKwUvBylcCCcgwuzjkFrRYMExtFGZwlcNYKJV1OOdczrzjp2yelYVt13Tu5n74bjWz9J/5c4StV+Efx5pcrCucc=@vger.kernel.org
X-Gm-Message-State: AFuF++lv019rJgd5Z3t2zYusjB3d+3A8vFMyoTTuLTg5yNJsQbF+sLMk
	rH5hnUE6Hm28vTy1dgnUSWJqOfroJCyqnV5mL67nBwqzmwOZ+/8SBwtw
X-Gm-Gg: AYBFou0hxQDKMhb4hCrgPvCSXLBRmI8KtRItShUrjVMnu9E2QTpTVFBJ3yL3nQKXqDN
	F7HCwEj+C1v855FB1V29LWOaX5Nh101R/mW4Zx88M2FFPZFfyngzABEEfkELDcP8rfSp+Z2J1WE
	QqTVT3vyfDfxCTT2/YkNEppxwPaSoLaBB6ErmrUjefHyDBI7DDB9zdqlA3BsHpU12inLJpdDC7q
	dUtCWbfsnp7duQ5WIqr8EN9Oqp0/sQdwyN5xrY6T5wtp6aESCbWyviuyYgy+Bax8OkJTjr5TSE4
	mfA+ZJz8Xn6dlDEQyeuTiM+vintlDbUfULx09Fo3d47h7/7aQ6ogLqxJbvx7xp9dw1/CoG1I0NL
	PMI+nUNlpJCNgj0qkgIAdkHMkxlpf+QpvHe7GrD65k6AirgN+6IO+Rffc7Spxi666zIB9lpyr0u
	mvJdhwwb/oCIe/nibRJMvLV2WFZuDvJ2sGcJrXbfkXrX9ys46l2qo8mmT8anCVWcVhgP8zHznhs
	vedyPaIOXIWWkDu3IGscvZnyBQ56lozHdD5ed2eyWZsUg==
X-Received: by 2002:a05:620a:450c:b0:939:1d67:2231 with SMTP id af79cd13be357-93c251fc75emr141927585a.34.1790117759919;
        Tue, 22 Sep 2026 15:55:59 -0700 (PDT)
Received: from holowork.lan (static-68-235-46-62.cust.tzulo.com. [68.235.46.62])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140c417be4sm8201596d6.22.2026.09.22.15.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:55:59 -0700 (PDT)
From: Fabio Piparo <holofermes@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Barzilai <amit.barzilai22@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Fabio Piparo <holofermes@gmail.com>
Subject: [PATCH v2] drm/ssd130x: Set the address window in ssd132x_clear_screen()
Date: Tue, 22 Sep 2026 18:54:45 -0400
Message-ID: <20260922225445.1525837-1-holofermes@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ssd132x_clear_screen() writes a full screen of data without setting
the column and row ranges first, unlike ssd130x_clear_screen(). The
clear is not reachable today: the plane disable returns before it,
and the encoder is powered down by then.

Factor the range commands into ssd132x_set_col_range() and
ssd132x_set_row_range() and use them from ssd132x_update_rect() and
ssd132x_clear_screen().

Assisted-by: LLM
Signed-off-by: Fabio Piparo <holofermes@gmail.com>
---
Changes since v1:
- Drop the Fixes tag and the stable Cc: the path is unreachable, so
  this is a cleanup (per Amit Barzilai, Javier Martinez Canillas).
- Factor the range commands into ssd132x_set_col_range() and
  ssd132x_set_row_range(), used by update_rect and clear_screen
  (per Amit Barzilai, naming per Javier Martinez Canillas).

The helpers do not keep the programmed range the way the ssd130x
ones do. That skip would change the commands sent on every update
on the SSD1325 and SSD1327, which I cannot test, so this v2 keeps
the wire traffic identical. Easy to add as a follow-up if wanted.

Compile-tested only; the clear path cannot run on hardware today.

v1: https://lore.kernel.org/dri-devel/20260817152500.703770-1-holofermes@gmail.com/

 drivers/gpu/drm/solomon/ssd130x.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 324467ae930..8cbf1875448 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -415,6 +415,20 @@ static int ssd130x_set_page_range(struct ssd130x_device *ssd130x,
 	return 0;
 }
 
+static int ssd132x_set_col_range(struct ssd130x_device *ssd130x,
+				 u8 col_start, u8 cols)
+{
+	return ssd130x_write_cmd(ssd130x, 3, SSD132X_SET_COL_RANGE,
+				 col_start, col_start + cols - 1);
+}
+
+static int ssd132x_set_row_range(struct ssd130x_device *ssd130x,
+				 u8 row_start, u8 rows)
+{
+	return ssd130x_write_cmd(ssd130x, 3, SSD132X_SET_ROW_RANGE,
+				 row_start, row_start + rows - 1);
+}
+
 /* Set page and column start address for page addressing mode */
 static int ssd130x_set_page_pos(struct ssd130x_device *ssd130x,
 				u8 page_start, u8 col_start)
@@ -896,13 +910,12 @@ static int ssd132x_update_rect(struct ssd130x_device *ssd130x,
 	 * the second byte are SEG2 (D1[3:0]) and SEG3 (D1[7:4]) and so on.
 	 */
 
-	/* Set column start and end */
-	ret = ssd130x_write_cmd(ssd130x, 3, SSD132X_SET_COL_RANGE, col, col + columns - 1);
+	/* Set address range for horizontal addressing mode */
+	ret = ssd132x_set_col_range(ssd130x, col, columns);
 	if (ret < 0)
 		return ret;
 
-	/* Set row start and end */
-	ret = ssd130x_write_cmd(ssd130x, 3, SSD132X_SET_ROW_RANGE, row, row + rows - 1);
+	ret = ssd132x_set_row_range(ssd130x, row, rows);
 	if (ret < 0)
 		return ret;
 
@@ -1052,9 +1065,18 @@ static void ssd132x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 {
 	unsigned int columns = DIV_ROUND_UP(ssd130x->width, SSD132X_SEGMENT_WIDTH);
 	unsigned int height = ssd130x->height;
+	int ret;
 
 	memset(data_array, 0, columns * height);
 
+	ret = ssd132x_set_col_range(ssd130x, 0, columns);
+	if (ret < 0)
+		return;
+
+	ret = ssd132x_set_row_range(ssd130x, 0, height);
+	if (ret < 0)
+		return;
+
 	/* Write out update in one go since horizontal addressing mode is used */
 	ssd130x_write_data(ssd130x, data_array, columns * height);
 }
-- 
2.43.0

