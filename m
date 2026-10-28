Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153859;
	b=KBA3ZrLhyqbVYZtGsPQA3do1lE23VqHRPvcQ/ZvFvVkIDlW0IPtQo8mMnPoGpkgb6Rx4
	 uRdQp8w4ftgkJS52vsn3XdakiaokdwMxrW23+Wa6Zq7tZwA+MOJTe4ZEk7oPPuk3OFsX4
	 bfVtkRZpLo9SHvFvFpVDqob4ltsLEB+k4z4wRGb4DWHKDJUQ30N9Dhz+191nuokT+gbXS
	 UY4G9RoKMqKqleWMyNIq66I7bWz/j5XRgGnwXUO1lrcPKsomVsCnh4PvPxaQCtrXeowby
	 P4OPcdy6je6UXQc8oJwCLxWiSqP7soiFgggQuQj/WpJHOlmWQRYME2DFjAT+5jG+y9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cP51aETFJLolZBQiqlTw2VFExTNDGMiywN+ARlpv7nY=;
	b=C6MEi/Mpr0SOk5hZzQgspHrjtBRFe/r5AJE5IODAOrY/IWzEL56UhTx6GeKUBn+E7FZf
	 qU5apvzdqPH1AcZ+Ibz2+KHRQY48dn2zALhec0cJhb6tn7WbjTvXW1IhRUMY7M8fir1sO
	 OCW+UbfrGWnj1mVy/f3jHbD3Yqrdv2e1xzfjZOrObJsswUqq7JraHdW2HagsfMMto7ezc
	 aotu2lNiUM1ZlV9KfZHWJE8bl6k5mPqpEC29m8ZxBZpvK+XywKw5BSQyJ71FFt8T+U9u3
	 I+E+Fyrc/Digxn49FogN5Hs16E53DvW7ojFkiriG4HlLYHeMmir0PSUSAzTUPLswykg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PGHTmIxF;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27E7606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D27E7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PGHTmIxF
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53bb57f1310so6547791cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153857; x=1793758657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cP51aETFJLolZBQiqlTw2VFExTNDGMiywN+ARlpv7nY=;
        b=PGHTmIxFKjnU19jNBA/s6lGGoH53x5tWg295cIqrBg1JLB2BfKWGRyKvI49JUdO45l
         /5zvmC08NQxPxGOhccVKe+YPhGRyYiZDB8pUx/ljzJxsNeNdxQDyWGpJFkLNmhpNyoDZ
         x0j6FExJe8qXZ9OczSwI0CkdStzjlHA9mdoMeozMK0JplFkiQr/Z6H15RZLooRAf+r0c
         CIMvEctzkiukhmZq4n6gREgGIKhQ7u1EB5iVxjm9uZepYbYN+Z0pZpxVahJ8qooa50rH
         UFOVDUneWggA7C2otwlAEQU4mViPNCpXo9cqL8PmIelowmdAv606oKkYIFwuxmFNtGsN
         K8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153857; x=1793758657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cP51aETFJLolZBQiqlTw2VFExTNDGMiywN+ARlpv7nY=;
        b=KJsIn4kuFNqMiFfHLzl3qEGCFxFNAi50iziuFZCxGAn6X0/vh+CYqgIFLbfXdydNqc
         glQKpYyqdA1gl5R95L2UTBVB8bMY6kZiJG8G+9qnHlTU4ywyMJEcx628lnWQ+mHDYKCj
         XkxPoe0rqdN0cqYfXMWDw1XulPs31E88VTJDx3/pe4aCVi/yuHFDBgF5lgDFhcbSge6K
         KG3N50PSr1s//hlRpqRdmczv0HuSj4+5YhahxTWq7WeCyj/FgCXArhtvAEz0Y0k/PSh+
         +zrIiA0F75VGgw2PBCi7IYf9CgUPWNoq2K3lGY4gm7bZy7Tk2BKvUTa6yTnkSA+YdPOG
         /Psw==
X-Forwarded-Encrypted: i=1; AKwUvByh+KcbBooQdY8RM+PRfOQ7s/Z9LTKQVA38362LKIsNeMhbyHZLYFOsWCFo9Q1cSb5/mW+Gb3mP3TkP11w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIurSgkYkWEPS+/C2VGUGYry5wGASBJkU7isN2rkMGfPzDF3Rp9
	TcSvg+R5OtKnWk/IlPcKvm7mf3QdSxC18AgKVFixoZCOFtPwYWrPGAf4
X-Gm-Gg: AYBFou3sdXJIGBKCTlyK3IF6bzWaEypr2Wq1NMrZ2XZPqbM6doBLgcmYYbJBVS+r9Y9
	9APuYO+h8kXDSYVcbWZ7L5PeKVtcJdSSJg+1EieFtXOnhPMYBy9tfnfKIJdMGra/GiA0TQUEkix
	sqVBorIe9eLTiCI30CEIgXmluQjaUpVHmZgd44sjdp6cFBXMSo9qVjEgxIYZXz2uZSgJ2drokFA
	qkl0mEcsC1mCpcD2QRucqCoACrqxMt0SWpvcN8VOmUrjWsbw9sOQsizqP0eO1TEyHz+uSQWc7qd
	X4QVNCNdoZrMAKoNBw47dvYkixELijLP7uhctF3p9u7x2aOEwAwlhVtem5Hr0falQ7bq8GPGUpe
	LCld93tsLkkvRdk0Ybs0ZPVBwcmx/L8G46taljtody04ooBPU+98m9iFclOcR166nGQ6++6ildu
	S3he+iayc74sokX+M1KJFlLdhNuXx+C5HSN1xp+6T+6Ao+YBJp33/pDgglc+MadBbTC1VoAmJYu
	EBxHC5O+in/3LLUIwb0Qcp5ShPmKaZCCujIgtp+JjhY9x2QafjOnnBUI9RH1CeOdhQBja2iZSW+
	liwa2SSoElOKS+/ItM+sas4Bu97k52PQWSDaVKArRkg7LCp34vAQKqLGuH/zDf9tWauUup/3drC
	fGCIWfDy0fuJgxqbMQRUNebziXJii+1xhB9T9WflYT9tC3cXT49uL8233/IVbRoksUtlAf+2/Tj
	tAkL/O4q+47eAJ7KeAniiZ+929UJwA8K8lwWLVQn9VNLGhpD2A8ccMJPA=
X-Received: by 2002:ac8:5d8b:0:b0:536:64a3:aaca with SMTP id d75a77b69052e-53fcc6caf38mr19690551cf.62.1793153857267;
        Tue, 27 Oct 2026 19:17:37 -0700 (PDT)
Received: from localhost.localdomain (wnpgmb0311w-ds01-161-139-200.dynamic.bellmts.net. [142.161.139.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c96375sm119234946d6.33.2026.10.27.19.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:17:36 -0700 (PDT)
From: Riccardo Oliva <oliva.scorza@gmail.com>
To: lee@kernel.org
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Riccardo Oliva <oliva.scorza@gmail.com>
Subject: [PATCH v2] mfd: dln2: Clean up dln2_unregister_event_cb() loop logic
Date: Tue, 27 Oct 2026 21:15:56 -0500
Message-ID: <20261028021556.11988-1-oliva.scorza@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179198398105.839288.1873130512029656566@kernel.org>
References: <179198398105.839288.1873130512029656566@kernel.org>
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

Streamline dln2_unregister_event_cb() by using a dedicated 'entry'
pointer to store the matching event callback. This removes the need
for the 'found' boolean flag, restricts the iterator scope, and matches
the pattern used in dln2_register_event_cb().

Assisted-by: coccinelle sparse
Signed-off-by: Riccardo Oliva <oliva.scorza@gmail.com>
---
v2:
- Rephrase commit log: Clarified this is a cleanup rather than a bug fix
- Rename 'target' to 'entry' for consistency

 drivers/mfd/dln2.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/dln2.c b/drivers/mfd/dln2.c
index 0b1e7fd7f..2a9d83d32 100644
--- a/drivers/mfd/dln2.c
+++ b/drivers/mfd/dln2.c
@@ -157,25 +157,24 @@ EXPORT_SYMBOL(dln2_register_event_cb);
 void dln2_unregister_event_cb(struct platform_device *pdev, u16 id)
 {
 	struct dln2_dev *dln2 = dev_get_drvdata(pdev->dev.parent);
-	struct dln2_event_cb_entry *i;
+	struct dln2_event_cb_entry *i, *entry = NULL;
 	unsigned long flags;
-	bool found = false;
 
 	spin_lock_irqsave(&dln2->event_cb_lock, flags);
 
 	list_for_each_entry(i, &dln2->event_cb_list, list) {
 		if (i->id == id) {
 			list_del_rcu(&i->list);
-			found = true;
+			entry = i;
 			break;
 		}
 	}
 
 	spin_unlock_irqrestore(&dln2->event_cb_lock, flags);
 
-	if (found) {
+	if (entry) {
 		synchronize_rcu();
-		kfree(i);
+		kfree(entry);
 	}
 }
 EXPORT_SYMBOL(dln2_unregister_event_cb);
-- 
2.43.0

