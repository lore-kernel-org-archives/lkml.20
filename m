Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501174F3927
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614902; cv=none; b=QH49Hk2J11og9mcJhBrXUhDvkzy2lmYql3U3/gMV2YQPsqMpzWxO7AKBK3bBPVRSkfiQf1+XuJk5MkdNwenx+t4OjwH0rFt52zaTXxDfgogWJ5WJ9DtqhRzKy/JjtSubpxSWL5E2HGiB0AIUWEOLkP2kSNBmwXMzSZSfG7fDg5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614902; c=relaxed/simple;
	bh=KAWoRJnQZFC+wNPZWuHpeFmk0SLt9PjBuOpYJLLP4iE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y3ibHjRMds5Whisa6RrUfnAg//m2GrPjSWHz4OI2jgWgZoLFHY+BNKXGaOC4hVxRcz9nJ+O2HXRBpyeXuD5kckkbQg1K+CJLcDHMZiy1gTLIzn/NX+U6gDRME44acV+/qVDWeZEERr9U27g0woRUkrc5YHednFGpXBT78h9uMs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COrSW8I5; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COrSW8I5"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so2736546f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790614896; x=1791219696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJgu7dBVVSEoL1PykSd4+CN+iWvbT1X4zLMDrQ1CYXk=;
        b=COrSW8I5oIlYJNFW4ZNHiR9J8DrzbJafA4LQndOwDgMnF8o4jxIhWIEe3lR4njGABO
         2apxZCDqgDOV1x1tCUVqosVTYaWVX4ie9fXDslNBa2lN2Esbmia0phvYC0f+HeS7vfcG
         KTaL71GaIl9WgTqSJJLgY6ipnn2LW1LOxz8ph84m9uTaw6XQ81q9FiAKBNdkTvWTp+PJ
         pibZ7QTtgJoLgTSaEM1NUy+rdVVLoSvgLBBAL2t1X/90v6SX8z17g/97c6usNON+WLaZ
         2kWPThlL2203LSk1UFCTH3Fl0mi8FY8xEPMLh/S+Ug+mqMwo1w8bE0IEh2wSMau8cmR9
         21fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614896; x=1791219696;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EJgu7dBVVSEoL1PykSd4+CN+iWvbT1X4zLMDrQ1CYXk=;
        b=GteCn5Qnc5pxvGvl6GLXjtNpXyL+GZ3VQdzid2OI5QyhjJkxvILeXcfMIiz8MFwuBY
         DIWHWN6/uzjVxXoiXesQoo3sv6zkValrxOB1Kk1fHcjirk8bRMscapHDdxoMd8b++CW6
         xnOd4zg9PAQGYIJ2QgSxIvbWfkagziWxLUzg2cu4XQiDMCkTFkeZh95h/wUssGN7n4vD
         aeVpA831vzQ6KrkqitoOYzrzF3/rby89xsgTAHHpqmuTvUB0H4WljgKBKDzStpA0LNH3
         V7Q3pFtqIxmPwgwKhRtnqItLjPslf9wLZjgQR/Orisqdx2mNB7xOrptnqZAkgf5mzfJx
         Z3kA==
X-Forwarded-Encrypted: i=1; AKwUvBxlvcVkl1JH3as6O09FmIdvHAXJPUHwHE4rMDnNQALFu3ZnHJOEBxxhfBZegFgjaFx1IMKzfkp8c085Gfw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/iYVFynkKxHXg8k4oShoxKnTdcLr+YLYj2s0XYoDqqAUTapPD
	idmd5i8yue+r0HOMPnoIoj04rA24FzoCTFQtHs8uBO++rEBuiwUoMgU=
X-Gm-Gg: AYBFou1HIyhGw89ALp0BIIqVoKPmoy0ocVuwXpQR9L82ZlUIL+ryNxKLyh+QqDBgVSl
	7oP1zWm+AXwOgiXuKqftgjroBCC7RiMvUvRt7YXqKuObqxgnYXE6Zy12Wte9Ldiy/xfEMCo/9XZ
	E6kFnRfWkddXGoGMIGiS9orgjyuJWcpx3e149nnYykKK/P4QHzLqDslj5dfmxzGZNYvxbO41PWG
	w5uMXi+UFYSS5dwOywZtiCWDyuONKX0kJT1JHZ/QkjvjQLRhaeLIrLkLJjdW8zO4D5/su8DMN8Z
	v54c9GABcn+hiRYk+GhqM2t854Wlx/68mf3XnPpAViX/KQPF3DaOZnpygIkZ7RMz7FG5QtyS51K
	SkwexAr50Lvf9aed3WnyulDgJrffJI0kG3lU9Pr1r+pSrNB21mWb3Mt56j99doxCfMsZY+aJ/cI
	xa9sDrqLjDF62GI8DWsvWJhcrbVD1LfGtMV9o3+qsF5RDLLZcW9hIzHE91NA6aGyn3l05tYzw5F
	b3iMbn7HaKmavvM4f2sQTKuLq/nBqngg3RlM60CXWqsftadcT8GRP83r+Y=
X-Received: by 2002:a5d:59c9:0:b0:488:8232:d16e with SMTP id ffacd0b85a97d-4888232d398mr16910718f8f.45.1790614895902;
        Mon, 28 Sep 2026 10:01:35 -0700 (PDT)
Received: from localhost.localdomain ([31.223.84.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm29240918f8f.12.2026.09.28.10.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:01:35 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH] Input: fix potential use-after-free in input_devices_seq_show
Date: Mon, 28 Sep 2026 19:56:48 +0300
Message-ID: <20260928170051.58695-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The input_devices_seq_show() function accesses the input_dev structure
while holding input_mutex. However, the device can still be freed
concurrently, leading to a use-after-free.

Fix this by taking a reference to the input device in
input_devices_seq_start() and dropping it in input_devices_seq_stop().

Tested-by: Habil Eren Türker <habilerenturker@hotmail.com>
Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 drivers/input/input.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index cf6fecea7..14a95e816 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -1051,6 +1051,7 @@ static __poll_t input_proc_devices_poll(struct file *file, poll_table *wait)
 static void *input_devices_seq_start(struct seq_file *seq, loff_t *pos)
 {
 	struct input_seq_state *state = seq->private;
+	void *v;
 	int error;
 
 	error = mutex_lock_interruptible(&input_mutex);
@@ -1061,7 +1062,11 @@ static void *input_devices_seq_start(struct seq_file *seq, loff_t *pos)
 
 	state->mutex_acquired = true;
 
-	return seq_list_start(&input_dev_list, *pos);
+	v = seq_list_start(&input_dev_list, *pos);
+	if (v)
+		input_get_device(container_of(v, struct input_dev, node));
+
+	return v;
 }
 
 static void *input_devices_seq_next(struct seq_file *seq, void *v, loff_t *pos)
@@ -1077,6 +1082,17 @@ static void input_seq_stop(struct seq_file *seq, void *v)
 		mutex_unlock(&input_mutex);
 }
 
+static void input_devices_seq_stop(struct seq_file *seq, void *v)
+{
+	struct input_seq_state *state = seq->private;
+
+	if (v)
+		input_put_device(container_of(v, struct input_dev, node));
+
+	if (state->mutex_acquired)
+		mutex_unlock(&input_mutex);
+}
+
 static void input_seq_print_bitmap(struct seq_file *seq, const char *name,
 				   unsigned long *bitmap, int max)
 {
@@ -1151,7 +1167,7 @@ static int input_devices_seq_show(struct seq_file *seq, void *v)
 static const struct seq_operations input_devices_seq_ops = {
 	.start	= input_devices_seq_start,
 	.next	= input_devices_seq_next,
-	.stop	= input_seq_stop,
+	.stop	= input_devices_seq_stop,
 	.show	= input_devices_seq_show,
 };
 
-- 
2.47.3

