Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793072075;
	b=hSl27dvK3WRTB2bB4foFgL/tEREAa7ijbjzMhNPTNSdAneZH89jxivMMKZMRu0m6kO6N
	 x4udS97moHUkbIMPxRjHGJ1w8FQ/9K/dVkI6CRcbzS8AvisRy17MogdKFk1V/6Mw61DuO
	 EMq1EZY9gyi7f/5u2ELzxl4/x3RniG7KSMNO10fG7H/JZyDZs6gQt8C6BdRn8YhspTxym
	 50PALQeMETwRDvnWCDOGpAmrlW1yjGewE4dtm5ICqkALpknsTX8n90irQL8aw3iNdq0zD
	 ZHfMMn4Zi8gto/RMmokEeW+80Z92VE8Lsqr2/4wrJmbI5WUMuJoFOrZxiwOj3u2ynkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=waUlW0e7gDgmzI+AA1aqVFppIW+pExWUzgSe1N9AwE0=;
	b=tp5gPUJFtwAypwPmElPy8BCO5blpBKoH33rJc6udAMtv21SSb/jmBss1Hj1FvaYPQuwL
	 +1DjDs/rm5ziukTBRRFhm18Pdo03820M48+8uEeFc7XlCk4pRt9yBsXLFPnpEwiVBJIe5
	 1Hg9q1hu+qx0bSlHMslmspgOW4FVP5hfhpY2KsIoz13oIIaCbbr0HrJnMufz622DKwCJT
	 xIv1wMRT71cgoyv8aaIl1hBe82fPwaCW6huprmt+VNvtMm6BvZ3XpM4eQN3G60dTQLoIL
	 +kdmYImV1COJ1oCk7geuYFsLJiG1cTknWTUjafvl+1wL+mZZ0/kIidRxpdckjC9N9AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=psEq8aAO;
	arc=none smtp.remote-ip=74.125.229.139
Received: from mail-dl2-f11.google.com (mail-dl2-f11.google.com [74.125.229.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFF8606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEFF8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=psEq8aAO
Received: by mail-dl2-f11.google.com with SMTP id a92af1059eb24-149f2b3f25dso1068364c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793072074; x=1793676874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=waUlW0e7gDgmzI+AA1aqVFppIW+pExWUzgSe1N9AwE0=;
        b=psEq8aAOyXfGJ0hGmlqCLt55ggfY7SQsTu1QJ97BBrttIeuh7p1PR5bfeHqTeZTPMZ
         aserXw0meG33UyK7L2eAoWV/Okiw/W6S+qckn+RAG0vN6v7636xT/TjzcjOvBNDTFaJ3
         jb05W7VBzaqKzMeCMiGfRBfFAI1QZILSiQgc4xKZQHedeqnNH77qbnGuQPRuIGLkMC4G
         LX4/STPhgraMIGbaPrLoVOEEz3p16K93wtfqeY1Vb1TFQytDbmA7hlOX5IjFU+Dsos3/
         VWecE1TRrA4JyZfftdljCO0UGGdd1Sj5CQFiYEWazJfUyO3XW0NUhNC2ue++kXSn4civ
         nuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793072074; x=1793676874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=waUlW0e7gDgmzI+AA1aqVFppIW+pExWUzgSe1N9AwE0=;
        b=AW0Q+ZgcpQ10SRs6Pl0IHta0GickWh41OUGNx4IoGmpU3TShRvrLhn+1q5Yd1qk++4
         h19yC2fAhPRYL5XC4lk6Qlidz1u4yFm42bQVxxRj5xrub4Z8H85f4jXxnwnkZVjWE+zU
         mqLQ6YgYJBt6rXNPupxkwK3vAKEBVsoRNf8KL23ODupIn8TdbVBANFcwtZuYFK0eT+Nk
         LYaMJjbzPl1Rcj18xUXIkk3MGoGVCNOgg4n4nKyzze5uzj9gHs8aiu+b2e+8p2WzkChs
         2nm/21dL2RbNFJOHa8KKxAo8QwYj9GZfyws9nrwD/kkwm8FQQc6i3nEzaPgy03A8I87l
         ypsA==
X-Forwarded-Encrypted: i=1; AKwUvBxZA2mJatosuy5XVKV8QomyuTmzs6ljRbBO8A5LZhHxkgHuO7+5lDIsiut63c9EcbE2OV2kbcnkjztCW+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOqKiBOHbu8jFW0WLLGEpBKZjpJNBeBEIhJBDhOwHi7uiY7NsZ
	90ZKaIas+zYxg/yDzUzW3ngDwkSDdgy/pyFMuxlpCz/JgnGvYWBBcggh
X-Gm-Gg: AYBFou0xemwAaXSuzfj7hY0BwDgHMelEZN/RvRgePJ02ULVtE3oGTC/JmpWrN6tlWl1
	kaw7iNTAdvqDpOOnY/MWIfalks6J/hkNwa+dbEECXPK0Sx3UbftB1aS/POCRtkbbDIXzOxpaSUK
	jMesEQ6P8J94jL8Fwq+n9z+wCqJezSKoRBYxhW/2dlJcTS2PIhxrZWuAd4c9it/B1JMwl53y45M
	EFDMHHb2TSR0aNt8pHM4a8+4fM4uybV8o4NieM9BXxfuApkeki1uh/Cu93wvWlMXYcCvWtzqdv6
	QvSN/XxmfX6Ofq6Jls6vUu0pY//W9CWsvnNHG2kmb+b9gXdN8BiKwXW4bZx81koUgWupuRm6SNb
	MEy4i1iatcXVzHN8vTq6fEWrNlbg/y5EYgVHOtr3zAGFWcQBfyZI+M1QG+kvU/xmCOe062yvE8u
	P7r7GDh2ScJhVf1nFt8Yao4ynEm1JKZ/wfsCPTNlaZxUtLxIYMBYvLCF3/7TYvwy4RzPsPJXL4a
	SpzjOxYmsbBXLWgfc4AH9eO57orJDxbADVDw5q7N8rANgfCCYtrDTpLEnMfAz1MPyz04AXUTd8F
	c5zve/HvZ7uinGTTILEen9GBx8oxLmUGVprcrg==
X-Received: by 2002:a05:701b:428a:20b0:192:fd91:c567 with SMTP id a92af1059eb24-19935906f80mr13498312c88.11.1793072073779;
        Mon, 26 Oct 2026 20:34:33 -0700 (PDT)
Received: from blue.tailcc13ef.ts.net (104.194.64.109.16clouds.com. [104.194.64.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm54876624eec.23.2026.10.26.20.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:34:33 -0700 (PDT)
From: Yao Yiqi <yyaqia@gmail.com>
To: deller@gmx.de,
	tzimmermann@suse.de,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yaoyiqi3@huawei.com,
	stable@vger.kernel.org
Subject: [PATCH v2] fbcon: Avoid cancel_delayed_work_sync() in atomic context
Date: Tue, 27 Oct 2026 11:34:22 +0800
Message-ID: <20261027033422.585328-1-yyaqia@gmail.com>
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

cancel_delayed_work() does not wait for a running callback, and
fb_flashcursor() re-arms itself, so also move the requeue into the
console_lock section. fbcon_del_cursor_work() callers hold
console_lock, which serializes them with the requeue and keeps the
non-synchronizing cancel effective.

Fixes: 3b0fb6ab25dd ("fbcon: Use delayed work for cursor")
Cc: stable@vger.kernel.org
Assisted-by: Opencode:deepseek-v4.1-flash
Signed-off-by: Yao Yiqi <yaoyiqi3@huawei.com>
---
 drivers/video/fbdev/core/fbcon.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 94abbb5ac766..917ce9d641a1 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -422,10 +422,14 @@ static void fb_flashcursor(struct work_struct *work)
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
@@ -437,10 +441,30 @@ static void fbcon_add_cursor_work(struct fb_info *info)
 				   par->cur_blink_jiffies);
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
 
@@ -765,7 +789,7 @@ static void fbcon_release(struct fb_info *info)
 	if (info->fbcon_par) {
 		struct fbcon_par *par = info->fbcon_par;
 
-		fbcon_del_cursor_work(info);
+		fbcon_del_cursor_work_sync(info);
 		kfree(par->cursor_state.mask);
 		kfree(par->cursor_data);
 		kfree(par->cursor_src);
-- 
2.56.0

