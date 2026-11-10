Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319252;
	b=BdWP6WWPheKSBMkMh5+wyl2YfnqkrS/KKBMLMPt+cxYhCHYefwno7VYsboU+W2Re+r16
	 yi6/peZ6X4n0TZGbf4KzJvu+vUaY3vtkBCICxsSpQmpwnq8rmyHbhf8Tmc7RAgWH9tpDo
	 UO/3m2/goZ4NhyNb/JLKweMi3mToYkEs0ofr9aNFurFzQiiFIa9MSP1I85WIDZ6t/vhC5
	 WuxZ+UQZ3vjZy1g1P+ZOB6gcXrikJusF5Gt4NERFVWsbRMnFOjN6sjKzxjXPdXFzHn3Ih
	 F95LzgErvsrYP/llK1CSaKKwU0FE9TCiv8sAJ3z8Bi2I+Fch1E0XiMrJbcpQcjQ6RoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+T9D/kB7BW8AzSh/iiHsnXz7kQX8FAMQaVA4PKYbVfM=;
	b=X+cOTMJgpqxQgruEZfJ2sPo/3FZj1Xs2mRyq7XmqgCwWcpufSoA+vzAqIvzpVBO5K5Vb
	 ICvu1DWTcwUNNp5RiNB6WOoaHRst9sQIcmeNAj5lSK80+nFZwU5PFuM7gEu/z/H+UJluJ
	 OgSDwd1xLcZiTwZBpB1d+d+7hS/jiTQgljRMJ+29oAviGMLgfd6T+i4CTuntFNjDUeatu
	 5pQqFABxq9lXPs2UTtC3qG5M8GyoS/GMQCmfQ2O/Mn74Bw0wbsZduqW9MWBlyiTGuYS3b
	 Rak3bEoNiUkZ3SBq4g6Mi9AleWwBThXhu6ATIXwnFLgcxMnOcHwRvJ/9G9Ge8S3q5/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RnMLGhBj;
	arc=none smtp.remote-ip=74.125.229.133
Received: from mail-dl2-f5.google.com (mail-dl2-f5.google.com [74.125.229.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECA5606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ECA5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RnMLGhBj
Received: by mail-dl2-f5.google.com with SMTP id a92af1059eb24-1ac216daf7dso1164038c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794319252; x=1794924052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+T9D/kB7BW8AzSh/iiHsnXz7kQX8FAMQaVA4PKYbVfM=;
        b=RnMLGhBjuhZFM6YZcEhT7gshDGngPZEtr95ajejwaPDX8AwjmBLL0BQxg/VUCMPZ4t
         HYuaJBJjm8cAyVTajAP0vgUS3Z0Nbxi9GExlPgpVA2NAYaW8ol5pmoe8sCZojc+9mqaj
         yzVpyX+G6qXsTMNkEtZBFw8Mqjra0Tnv/pASFPka2STtRsz4gdh4s8izbdIw+zRHHppB
         L+tCKdToXQbjMhMDTGmSxGbnyoAABYPvUKfZy4CqYtvU5h224YG0IF2QOBGJMm84uuDz
         tOAzQ6DiKEQoBfrUg9aEjh9nklrYM1cWk03gpEmehHCjbhPyaTVqyEM7puyCxjTk2/7e
         T7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319252; x=1794924052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+T9D/kB7BW8AzSh/iiHsnXz7kQX8FAMQaVA4PKYbVfM=;
        b=e18vATR7mhFq1AbLuJ5mKkA6spNguwkLWxPwpmFlEJbZz6kOGRJDXa+UXZ2VhTqAza
         GFZVxiTq8PLCkRbcLeZaI6b5Mkenp5yicK0s+5kS+P63fobUxoD9qKuDgIu7ieEnokuq
         HxFSOu1y92OTFd/x83dncl0VjZ7F30cnCR0LfCOGc19e1qAKLbWIqzzLGCaZVWn0Vyb5
         8gXZAGlXXO3XMdeSPbk3KOG4Vlau7P1Gj2mI2HZrkkcPX/cAdA0P+39nT54f7c2L0aSK
         O7R0l8pSTmmJKTMh48ui1Uu+sPu3sj7lQrcYzGW+7rwRbwX4u0X87kf+j67eWzFVBFXo
         aCfA==
X-Forwarded-Encrypted: i=1; AL+hErHwvPwHr2YvGfERMkrAxIkJJcDRbOgIqfLhbCqjkF1tnkyyhkplme91XBAtpN77gCSJV8+3x/sLSj1Bw40=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wGfNo0rjDVpAepi9Fu2D7lRH+URddDzh0dadwmmJ+sfK+YkQY
	lfFQfnk1ZjqpSTv8xw8AJLBpOemC2yr+9R0QD5dULkKvT9Q9H6OCrdiW
X-Gm-Gg: AYBFou2qs3S7KrcZBplkeSW9ja3dnHKk89J9ooRHw9G0XNHZ6ESY5iwXn/J58NYBvO9
	Sd6D8xqKKyrULIcIOGagEDGSKbL5rrMGBeVy/k6NEp7CuXO30Ihy1TJTyuvunTRtzwem9Ak2qaq
	xfkbJONQnd0ED9feOLNOam0TGbk0f1IfpUefTA3AxifIaskbGJ+kZsJT4/KdcqiqGD8qW/Gi5z5
	80Ph+dzc1eKdOEgsQUA+WfbTodD3HC9lpG3wWZovijj0+hk1PnF5yDI1RDWixzRytMx9ilUbnt/
	j2YjJFxiXqpYcRIwZ9ih3eqohYJWbJFgWQNXz21pef+/v6aL1q3lczgWGozlR/LFhyveSglcYWK
	T73tZoOvvu62NNghEC6myiGdLl6TBaxZkuE8hFXNLGpZygDtg3uLD3daqKf8PuhOubQU/+EZz++
	3mpv+M6JMP8cc5k5uU0tmfikck+frO+ql2G3C9Sj0HlGaSCrO7h65h3Oc4yVGQ9PAGHHJQdk+QI
	QstVhDLhoCIcv//jto/2nGMWUffOGipKcd7DT64pK2r7yB6ebJMoZt7jnPINo1zk4e8L/nXqM0r
	9ymPKkCj0qLDOy4qb8mprPAKAXJlw5c/jtsOh2aaNQ==
X-Received: by 2002:a05:701b:455a:10b0:1a3:dfb6:e593 with SMTP id a92af1059eb24-1b3b6185203mr3440708c88.27.1794319251406;
        Tue, 10 Nov 2026 06:00:51 -0800 (PST)
Received: from blue (104.194.64.109.16clouds.com. [104.194.64.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b85d22sm7594328c88.19.2026.11.10.06.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:00:51 -0800 (PST)
From: Yao Yiqi <yyaqia@gmail.com>
To: deller@gmx.de,
	tzimmermann@suse.de,
	simona@ffwll.ch
Cc: javierm@redhat.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yao Yiqi <yaoyiqi3@huawei.com>,
	stable@vger.kernel.org
Subject: [PATCH V3 RESEND] fbcon: Avoid cancel_delayed_work_sync() in atomic context
Date: Tue, 10 Nov 2026 21:59:59 +0800
Message-ID: <20261110135959.232798-1-yyaqia@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Yao Yiqi <yaoyiqi3@huawei.com>

fbcon_cursor() can be reached from the console printing path, which runs
in atomic context. When the VT software cursor is enabled
(vc_cursor_type & CUR_SW), it calls fbcon_del_cursor_work(), which uses
cancel_delayed_work_sync() and therefore may sleep.

With CONFIG_DEBUG_ATOMIC_SLEEP enabled, the following is reported:

  BUG: sleeping function called from invalid context at kernel/workqueue.c:4722
  in_atomic(): 1, irqs_disabled(): 1, non_block: 0
  ...
  __cancel_work_sync
  fbcon_del_cursor_work
  fbcon_cursor
  hide_cursor
  vt_console_print
  console_unlock
  ...

Make the default helper safe: fbcon_del_cursor_work() only stops
blinking, using cancel_delayed_work(), which is allowed in any context.
Every "stop blinking" call site keeps using it, including fbcon_cursor().
Only fbcon_release(), which is about to free @par and must ensure that no
callback is still using it, calls the separate
fbcon_del_cursor_work_sync(). New call sites therefore get the safe
variant by default.

cancel_delayed_work() does not wait for a callback that is already
running. Since fb_flashcursor() re-arms itself, a callback that has
already been dequeued by process_one_work() can queue the work again
after fbcon_del_cursor_work() returns. Add a cursor_blink_on flag to
struct fbcon_par: fbcon_add_cursor_work() sets it, fbcon_del_cursor_work()
clears it, and fb_flashcursor() checks it after taking console_lock and
returns without drawing or re-arming once blinking has been stopped.
Keep the requeue inside the console_lock section so that the flag check
and the requeue are not split by a concurrent stop.

Fixes: 3b0fb6ab25dd ("fbcon: Use delayed work for cursor")
Cc: stable@vger.kernel.org
Assisted-by: Opencode:deepseek-v4.1-flash
Signed-off-by: Yao Yiqi <yaoyiqi3@huawei.com>
---
 drivers/video/fbdev/core/fbcon.c | 41 +++++++++++++++++++++++++++-----
 drivers/video/fbdev/core/fbcon.h |  1 +
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 94abbb5ac766..0847dcf18416 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -410,7 +410,8 @@ static void fb_flashcursor(struct work_struct *work)
 	if (par->currcon != -1)
 		vc = vc_cons[par->currcon].d;
 
-	if (!vc || !con_is_visible(vc) ||
+	if (!par->cursor_blink_on ||
+	    !vc || !con_is_visible(vc) ||
 	    fbcon_info_from_console(vc->vc_num) != info ||
 	    vc->vc_deccm != 1) {
 		console_unlock();
@@ -422,25 +423,53 @@ static void fb_flashcursor(struct work_struct *work)
 	par->bitops->cursor(vc, info, enable,
 			    get_fg_color(vc, info, c),
 			    get_bg_color(vc, info, c));
-	console_unlock();
 
+	/*
+	 * Re-arm under console_lock so that a concurrent
+	 * fbcon_del_cursor_work() cannot race with this requeue.
+	 */
 	queue_delayed_work(system_power_efficient_wq, &par->cursor_work,
 			   par->cur_blink_jiffies);
+	console_unlock();
 }
 
 static void fbcon_add_cursor_work(struct fb_info *info)
 {
 	struct fbcon_par *par = info->fbcon_par;
 
-	if (fbcon_cursor_blink)
-		queue_delayed_work(system_power_efficient_wq, &par->cursor_work,
-				   par->cur_blink_jiffies);
+	if (!fbcon_cursor_blink)
+		return;
+
+	par->cursor_blink_on = true;
+	queue_delayed_work(system_power_efficient_wq, &par->cursor_work,
+			   par->cur_blink_jiffies);
 }
 
+/*
+ * Stop the cursor blink.
+ *
+ * Does not wait for a callback that is already running, so it is safe to
+ * call from any context.
+ *
+ * console_lock serializes this with the requeue in fb_flashcursor();
+ * otherwise a running callback could re-arm the work.
+ */
 static void fbcon_del_cursor_work(struct fb_info *info)
 {
 	struct fbcon_par *par = info->fbcon_par;
 
+	par->cursor_blink_on = false;
+	cancel_delayed_work(&par->cursor_work);
+}
+
+/*
+ * Stop the cursor blink and wait for a running callback to finish before
+ * @par is freed.  May sleep, only for teardown paths.
+ */
+static void fbcon_del_cursor_work_sync(struct fb_info *info)
+{
+	struct fbcon_par *par = info->fbcon_par;
+
 	cancel_delayed_work_sync(&par->cursor_work);
 }
 
@@ -765,7 +794,7 @@ static void fbcon_release(struct fb_info *info)
 	if (info->fbcon_par) {
 		struct fbcon_par *par = info->fbcon_par;
 
-		fbcon_del_cursor_work(info);
+		fbcon_del_cursor_work_sync(info);
 		kfree(par->cursor_state.mask);
 		kfree(par->cursor_data);
 		kfree(par->cursor_src);
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index d93a89877d04..6a2f7f6e5a8c 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -97,6 +97,7 @@ struct fbcon_par {
 	int    blank_state;
 	int    graphics;
 	bool   initialized;
+	bool   cursor_blink_on;
 	int    rotate;
 	char  *cursor_data;
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION
-- 
2.56.0

