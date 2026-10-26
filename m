Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006463;
	b=C7W53DNQD9yAhFeCeh9cv1tqhkR2i8byxHe6utAnKZ033GnU4lh3JVW+F8TE3MdMf4dv
	 g901zcvhoAOFaDIymiUwD7Ya9LKXKRPKgWDcME1I5r/3rHzfHpj2xLqxqejC3LPQUxL8d
	 SyAbCw+8Au32BTuiL3CkZwuVlP9pBbHKdpnW1TMHPbQqW79YnNX0wbf+HHE6dFmbvZHrk
	 Ivdpe3bIgG6D4E0TIWd01AqNfpkweYjaeFudAyEV8QN9WmhTflcUSykSjw+4Z9Prl2t09
	 xMpr6f+YKHg7Gx6vuM3pwrx2QPmClI6YkON5D5lrxQj7gYtpCQa0IoZ0WN7lJewzV6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6iSIIg6+P2EzQoPUDKsVIp2JOndBTgeQtF66YjINF6E=;
	b=yKrPmnPa3uyP2DS0ePir0kP2GAiW0/Bt8FVS8ZNR6zxL3VkY7IHo54gTMxxXjaZ1sWKa
	 Od/kRV0TGML+Aqa72qor3pOzGrxr6AZzivwvXVWVDnQ7AIU8AiXDNkhLbHquaG74cT3ZD
	 EnL87yCWmEMNqcTYA85a9vD1uQIDkOAChFvDQh1ewa0P7vtRVzoFutaCE/Ee9cckPUwxH
	 Lu+HMCmpR7D6/Db+kNlOi+enGMt1PG8KiqYutRJWODfVkbESv9Rh6HMWeFJpou5B1nEbq
	 WtQLbBeKzw8847HU2bGSnWgxmcmp74nd0bQ170B1KukB9KmA7Wetkld2JzCYLMRUK0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WJtuW0+P;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE8F606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CE8F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WJtuW0+P
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e977109392so15586035ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793006463; x=1793611263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6iSIIg6+P2EzQoPUDKsVIp2JOndBTgeQtF66YjINF6E=;
        b=WJtuW0+P9oBFSy0iWI0B4zGLQ1rj8lafFkQeBrQtdVN8XcMXqOyCVwKRuCjkNZmgaN
         t1loMPGykOOdZmalrN2T0WjE/LyzlTnGbQF1jGzkpGXyLZxTwHKGr1Ml/dCgz07biWsb
         nJg5MTdvPqWxltUWGMPnR5WTk6OG0Abuc8KLSzbf/TCH6Ga07yVSp2rWIXaKZTHvoBKp
         5+haGFq5yHhn32yhknh1XIKHgVmTkdxonzIVWd3/kEaTmND84kE6cg8H2imPmh4M72W8
         8m28fg5oJabgWFzjLFsK3VRcGJ2F5G063gbteVa7G/alxXSfw6TIr47M6vaoDjVuzb35
         qghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006463; x=1793611263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6iSIIg6+P2EzQoPUDKsVIp2JOndBTgeQtF66YjINF6E=;
        b=UZvRna+91+MV3Ny5dCmDSeAe77TtEzg1AaoVFOl4rezBn0ccd6OzWeqFRXWxJx0qCF
         VOx/juyZOF3iy40h7tnBW7e2nSjjPWMFGGaSEfIihO30fQ5CKMZ0W21YMFrEZWfgJAuT
         fVVGXR3K3d0mm+/prctahcxedJmFAuysAlrwNkpzsfUsrw92D823fG8UaVnU1M3kVOd4
         qAt9S7xf8Vb6KonwKM79oL1Dt+cdbIwxmJGQtN17r8AMd0ZjVztA4VbOgznHC7u+UJ7C
         k4fNp6mIhbGEQY880QpgnJKIn9whJprsrhA5NGD+Nk7ERt5VlesGfz3WGTz60NrgFJx3
         sGbw==
X-Forwarded-Encrypted: i=1; AKwUvBzhbluaCzKhhHj5SQ/ayAkFGhGba/oHJatrSDI4PWpJkRFTXxgYO8jGwYVKdHzfIaLQ/H8bcmO4fxUxEZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIviiYg2Jcxrbz7+a4PWdowGTJb+wUEKNbibWtBUFJ6V4a9FAoX
	9pUq2daKAlr6N+q/XA7rpsHahtcvlteNRoIvCHjb9/WcmOuZLMeDd3eO
X-Gm-Gg: AYBFou1WhoJe6OA1ASwXmc/BECfOF8cVVSd40pnpRGpYzRgmO3LV6x61uEiA65oFJzN
	z9rtqiNRHrlqMvdgQQzQQb4uR4C/8tZ636KYf9ixEFBESe0vdu6eTDtKtN+K71YHKXZRdEeCRAr
	2WOEUTjOPdvf9Sn+udtBvDnvINvzEpWKugFKpWtwUrwRjD0u8FWrIWKU6C7sGORGDnffalJ7kY+
	4XrjXwKEJNXQWSVndNfgrhyMWkj/y4P02OuX8zLuRzZ4QlK0/6+TB23P4HSOzODWd4zSHOv6940
	eaHdqLlTneMjg/JimXFPQQ8bODeAf6RUB+XfvXDiIlqUCdPhiz5skryc8QHgV709gmPC8Li8Zvc
	+4FnoPmh2ru/1HfTEX0XoQuhg8C0QGZZp9+IrDUjDvkLigv2oJidXVrLUwC5Rt+OymPnKraLH2G
	9RQhnvF3Z0cKum9SQMrZC4Hxwnw/9UD0zbQj19kPFnRwJkOHFIUxStEmcBoVb+De8iL25imvE78
	5x+r7naWotF3G46djd5okCSnz4dlbXo+84Ih83fTZkQFVnqQ7rqMxP6Z3Jyq4MtWRN0MsiFXHZL
	sQcvTzs=
X-Received: by 2002:a17:903:3805:b0:2e9:460e:ca57 with SMTP id d9443c01a7336-2ea9c66910dmr57327485ad.15.1793006462680;
        Mon, 26 Oct 2026 02:21:02 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6212:1232::1d0:de])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1215d2sm13517905ad.15.2026.10.26.02.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:21:02 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: linux-pm@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	Feng Kan <fkan@apm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] power: reset: syscon-reboot: Use devm_register_sys_off_handler(RESTART)
Date: Mon, 26 Oct 2026 17:20:47 +0800
Message-ID: <20261026092049.84858-1-mmyangfl@gmail.com>
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

The driver registers its restart handler but never unregisters it:
there is no remove callback and the notifier block lives in the
devm-allocated context. After unbind the freed notifier stays on the
handler list and the next reboot oopses on it, observed on a
Hi3798MV100 board (PC is at 0x0, LR is at notifier_call_chain).

Use the device-managed registration, which unregisters the handler on
driver unbind; the DT-configured priority is passed through. This
mirrors the conversion of the syscon-poweroff sibling.

Fixes: 09fb07bcaf52 ("power: reset: Add generic SYSCON register mapped reset")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/power/reset/syscon-reboot.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/power/reset/syscon-reboot.c b/drivers/power/reset/syscon-reboot.c
index 60e855cae68e..348a9550e9e3 100644
--- a/drivers/power/reset/syscon-reboot.c
+++ b/drivers/power/reset/syscon-reboot.c
@@ -31,16 +31,12 @@ struct syscon_reboot_context {
 
 	const struct reboot_data *rd; /* from of match data, if any */
 	struct reboot_mode_bits catchall; /* from DT */
-
-	struct notifier_block restart_handler;
 };
 
-static int syscon_restart_handle(struct notifier_block *this,
-					unsigned long mode, void *cmd)
+static int syscon_restart_handle(struct sys_off_data *data)
 {
-	struct syscon_reboot_context *ctx =
-			container_of(this, struct syscon_reboot_context,
-					restart_handler);
+	struct syscon_reboot_context *ctx = data->cb_data;
+	unsigned int mode = data->mode;
 	const struct reboot_mode_bits *mode_bits;
 
 	if (ctx->rd) {
@@ -113,11 +109,11 @@ static int syscon_reboot_probe(struct platform_device *pdev)
 		}
 	}
 
-	ctx->restart_handler.notifier_call = syscon_restart_handle;
-	ctx->restart_handler.priority = priority;
-	err = register_restart_handler(&ctx->restart_handler);
+	err = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART,
+					    priority, syscon_restart_handle,
+					    ctx);
 	if (err)
-		dev_err(dev, "can't register restart notifier (err=%d)\n", err);
+		dev_err(dev, "can't register restart handler (err=%d)\n", err);
 
 	return err;
 }
-- 
2.53.0

