Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791638;
	b=fmoGBBNZtqb5Bt3+ickYb8abDfGEg/cJfkRcyfq9x028a7l8IXFwn4U3deiZLZeU9vV8
	 ihXM9Phe1UN8aY/9mkLsofngUkqRoMhOjQNvlEHtHAtBNZZTEn/Tj+hIoQHJUbuRu86Cj
	 Y+GYPLx/m+auiYBUfNKfPz4Oeshfc2obz3eHE2s+FlHtKsA8vji9vZERgO4dlJW1TLXj9
	 qD2F7SqTkqCXSEzO2kS+AfS50RiuswujXD0D7DsSuvHushsmNDSlYf4EjtwUppFzY9PnI
	 mrWc7Zyoa5Arznq85xmpW8ryf4oVWXIbm/l99+3CRp730qS5zINv6zf3BDlUtdSZ4Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4q1WGi9vPIf9vHoF8r8SkjERKMefi2tjXdzTAcwJSz0=;
	b=I04X0rs6VA4VGfCsHxsdjRSxzbd2KtrLk2ip2A2YItBRfASnExdNObveBH8W05EFXKxp
	 Ospbm/CaMmj4dzlU1aH9QSsRoVfgFmataw4ds2pIoke9kqhDpC+fpe9I2kR2x/KCquqWh
	 1jfbIK570RwO76fgdNalnzGvXK4pH6VCec/A6Mz+FtSagNCXst+kU0DwTn1wElgLCh4Gi
	 5Q09h3A4eLtd1fKmqd051ef/0loQrHP8uZCa/7GQr6ThTEhAOJHpYqmPxSFbaMpgRBsvh
	 KUSTpMlt/qIoWX6MTWHf2qAs2NXErDUAsbjn8wvyXiLfFQatvqkGKbKbDZtiPaECzWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fXDU/XhV";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79034606D803
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79034606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fXDU/XhV
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35b2c599f43so1165836eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793791638; x=1794396438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4q1WGi9vPIf9vHoF8r8SkjERKMefi2tjXdzTAcwJSz0=;
        b=fXDU/XhVj47pukSIzfP3AeWhUd+/e2R266iAZttUesRoZqDYjqb0FjghuZ8i9ivii8
         T2IuCbLsJWIjZM2tDiC+330Ej3k08+Q8e5hDJHAcRWsCDDJaSb4pVb732uux83pe6UF7
         NUTznmJGT50qUFB/FEp0AF+t1hv9t0mFlX/nmyiKNY2yOy8zOdazMa4Acwh4WKu0MCl1
         b5iPs5JNJLODOTfyNc+hZmee41eY7q9c6h91xkmFy2K7+32pbLFNJYjg6TrsQp7lnG4p
         OmPhvn6X03kdMbF10iYxxuNq5WzPn3z19g5hgQ/stbaOOMqAiOUBQp4Rm+KtZj76MTGN
         Hevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793791638; x=1794396438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4q1WGi9vPIf9vHoF8r8SkjERKMefi2tjXdzTAcwJSz0=;
        b=0RezuBJKClgWkDmmNobcy73FhzYyGlyy147uzTTJQnLsh8L0qAtHNn3TC5a06Oo9bE
         Z3ODgGfYjfVQcshlrAkqPtRjXqZy1mAv3c1wjOXqsvJRIAyIVJZJ+wA+56EmJXJpQGRy
         BPIkkJyAglZa8pnW/YPjcj+5rjyeOcjSV5mnQ+EcG13paD4lycFCpY6TRONy3CADjjW2
         DYFFS3NtpSE7v75hlkeWDpRzo1quKrkuVI+L/A6zBsAiNWTs5MiObnNH49l3BSTZuXPr
         PEnGFon5nJ0cInKJo4I01ZeASogxPE5urccD5Rcq3Cre6l3ICF1mdbYwNS96KFmmagPu
         ZAZw==
X-Forwarded-Encrypted: i=1; AKwUvBxbJTL35OYtHDJKIF1e7uy4H9qY1Qnrm+T9LFnxktBHZZ0ixUmE7KCRcektRjKRwDheRgJb/8r6KrHfm9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mMaypuTigdk3w0ow3PsVQlPDyBrnAnjqEnK1+wLlhpCP6Hi64
	G9KScycY6M7hXaqKXdxYk89qIKjirZoHjVImMw0kjshfFvFopXtIhpaN
X-Gm-Gg: AYBFou0dJAkDL5i0RNyb7CvcwcPWmys9QayPDa1LdTr/PsAgl7IjNmg+rya47Wklp3k
	pm0UiJo49Rc0flss3N2jFoOwMYTiI/aHrmslk79c0WdqDRlewgf0LmUv9FcFyDklmtrQN5TToCe
	x+16q4UOF1oJUvcBXluM2/ZJDkLZR3/zeYy7c9dNRON/tAzf5yP0OVmbYZzpgno13ZwwvaOWbtK
	v3/cuacHX9jK4fx80M8TcZij5BpsOvWKTpoOLl9TdO5j+C+Uf/ycmwPfTZotdfc6W4yaycJ6Fi+
	fKWH5gVtTdBBd+l6xV3wUH9H9aKJzBU3OvbrrPpfIzN9FnNpn7dSPNf+czN6Qbaj4LxnCn5jUyK
	AuMlccJlDN8A6xGOkA6f6AcPGefsM/9qP/Tq/vJnP7WzBqr1sH3r2mI8QpNDdlHAllAywZyppfw
	qZNmElWP2FvAqS8DozbryQxYWHsR54O66EJZSeNbvfvV+Kts3fSTpsYBv4gYOryEbj2LxDBHFvG
	dBzOSitGP95P6Hyi5/QYmgWps9gyoJOinoFdDjVH7ohoC0nfEdWpK3sStKQKTYHfL5k2YDvK3z4
	ORSbqdrOXrvIOyj9+8OontfFR1Q9FOC5Gnkpdto89XB29mv7Z1M=
X-Received: by 2002:a05:693c:41dc:10b0:351:2958:1740 with SMTP id 5a478bee46e88-36a42445a8amr24062847eec.37.1793791637656;
        Wed, 04 Nov 2026 03:27:17 -0800 (PST)
Received: from Anonymous.localdomain ([223.181.62.51])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36besm11119601eec.11.2026.11.04.03.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:27:17 -0800 (PST)
From: Hussain Sitamouwala <husainsitamuwala21@gmail.com>
To: outreachy@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hussain Sitamouwala <husainsitamuwala21@gmail.com>
Subject: [PATCH] staging: sm750fb: fix spelling mistakes in readme
Date: Wed,  4 Nov 2026 11:26:29 +0000
Message-ID: <20261104112629.180890-1-husainsitamuwala21@gmail.com>
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

Fix two spelling mistakes found with codespell:

"defaulty use" -> "default to using"
"althernative" -> "alternative"

Signed-off-by: Hussain Sitamouwala <husainsitamuwala21@gmail.com>
---
 drivers/staging/sm750fb/readme | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/readme b/drivers/staging/sm750fb/readme
index cfa45958b9d2..a000f833d8ce 100644
--- a/drivers/staging/sm750fb/readme
+++ b/drivers/staging/sm750fb/readme
@@ -30,9 +30,9 @@ About the kernel module parameter of driver:
 		insmod ./sm750fb.ko g_option="noaccel:1280x1024@60:otherparm:etc..."
 
 	2) if you put 800x600 into the parameter without bpp and
-		refresh rate, kernel driver will defaulty use 16bpp and 60hz
+		refresh rate, kernel driver will default to using 16bpp and 60hz
 
 Important:
 	if you have vesafb enabled in your config then /dev/fb0 will be created by vesafb
 	and this driver will use fb1, fb2. In that case, you need to configure your X-server
-	to use fb1. Another simple althernative is to disable vesafb from your config.
+	to use fb1. Another simple alternative is to disable vesafb from your config.
-- 
2.53.0

