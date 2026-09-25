Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EF82F28EA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790377278; cv=none; b=aacuaQxvcvXrAafxIrvQlOEdzpLKD5wll+z8dKRx8O/6MA5ZXMJtAsu8e8BoBtFLJP57OJVgJo4CL1Nhb5V+yAcGpxn90qNeyiCxR1f9O/1r7WdKQPYM86fVpFrtd4kuS09fBymklE1W9VIyx1AE0LjKI9tJYCsXYQlFJyGY7io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790377278; c=relaxed/simple;
	bh=RIy0KwrUMk7zzmVivVsxjnA+TSbk0UjyCIxON/nNzEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AwVA63wpXOZVGcNf2j2/wK+gRA0iXfsRg9MZrYy78fqxxxg/M+YbpUcKpQdMAppvsId4qZGaFK/NpH9KNnnXhndeDirfV+5shgdSj/YoI5sp4+j/JI9HwZhnhOw0NiLub/X5i6etvXeilakUpS2iP9pK1gBsIKVKYcjqTztOlLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDdiCCmm; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDdiCCmm"
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c82bb05ddaso864950e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790377276; x=1790982076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sFJAWMbuQDMPuL+kmFa3AtrXjztcOUowTHzkHn+U0Q=;
        b=RDdiCCmmP9368Ksm25aNT4BBNOW63kRQvbZP8B6Y9hX1wnQ/zQN1KbB0WIhHGOd0KS
         aAQk60zzXjKRqzFxTwyFsSwO1ykma6Lv/kXea++bKDLf31NVO56zSyBe5qYiUcvQlfDV
         U2dbuwy5YxcTxrMLWgLF5YaxPq41iZaeL09f1jaGsa70LUcexvGR61LGNTDuyo2UuNTm
         DxrQN0WLO0LOlsJ/hEOF+RFkNgamIasek1DSKZmp5mOENgGJR4/YGK54msmPNtHmqIlU
         OttAEKwnv15xSfKcpsQICBECimA7CTpT2OzDjoi4z8RWHWWA1TYn522z4QuokiJzhpdb
         dW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790377276; x=1790982076;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/sFJAWMbuQDMPuL+kmFa3AtrXjztcOUowTHzkHn+U0Q=;
        b=BjUAgf8bBF9DvXH7c8dxNmzUWId56JRdv7bEB49J7IMtRUc0r0Wjx1OYcUsIdWCKrF
         MjNnVUA8anrHLQKbm2Pm/LiBUrw9T8c1pVTGADeeMzNRCrvMijJq4/d5IYXCZe45CGUv
         euedVWhLXHAPYU5hLX1xEfyLPPJSH/qSVGEj7BVMlmpDG1HXK0VKzyewSXn9i31dsJcl
         Vso6UbBaagN1hGHoyrf1T7M9B4Kwdr3Asqips411ANit6/xniX56SeAPYl0dL3aAnPmU
         yahir0jIC+bES/cJb6Fg/XtkSiHUVykE/OuJOuRnxm7oxNhs4hs0s/zG9SP1n1DXVc/u
         NCQw==
X-Forwarded-Encrypted: i=1; AKwUvBy4EBfXuX+LbG7E6R7jMIU+yymq5UCTsMTOTyy9pgMOsuViAOlzCBXZUw7272KAD/+oTU6mGnoNCVrwyXo=@vger.kernel.org
X-Gm-Message-State: AFuF++l6n1Htjkv+kD7HJARsocQtWb6MDGQfu5wdQaEAZcUnwOgKlnyS
	lrK6e8sa4SoIA+1lEmpncQ7bW7pf9qKc/A2JnMB0ZoSobiomMtYVvD2O
X-Gm-Gg: AYBFou1Pzu7ODOtavdlUJUhjtsN3ZQSoUF7wdsxTQTF9MxJ7vnvjw8e7gPdHQvyKT0u
	KMwrBvMILuc7ppl7qJ3oOj2fqn6dVgbdEU1lFqUMD1WQJ6ZRlKAj5hw73+oB9sh1oueHZ9WD99o
	u3mHIPLyICQb/12e0EdO53q66BKYKO7xTU/DK+mxzWyL7k+Ed6ecGMgZCBByH3cnY6SCA8yBhO8
	mrguZdl6b8Xj6BOHGU4Ft0AntzkMMXvWdgkKqMfhUTNrXrFD5wp5GNYYupd5weMz5aE6psrcF/G
	+R8iFKMshlQg37eM2IiCNWpqbE27pqEl6mLEdZQANgL/9fMTBBguGGneJ4RAp0UF24fDDPdlAG1
	Yqhm0yfbIYMtq2/EIeIVvbmlzBPiHKL0bfTHtdLgrqjjN6lkNUa4Mw/oy8qv+Ox5pb0UN2Nvm36
	KyVRp84v7kCiTOYj0b4pbzIFFri4kVKNc41UydDWHpMjUl6huWGl5AhkznRACvt8zrcErnBfuf3
	Zsvy/CtjlTrzQOpDvkIcS16EEqJvnWfweG47KMSZDwwwa6pHzn1WMjI
X-Received: by 2002:a05:6122:310f:b0:5bf:8c77:e89a with SMTP id 71dfb90a1353d-5cb09217797mr4032734e0c.2.1790377276151;
        Fri, 25 Sep 2026 16:01:16 -0700 (PDT)
Received: from daniel-l440.tail54b8a9.ts.net (host179.190-30-68.telecom.net.ar. [190.30.68.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde02784b7sm562190e0c.0.2026.09.25.16.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 16:01:15 -0700 (PDT)
From: Daniel Salmun <salmundani@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rapha=C3=ABl=20Larocque?= <rlarocque@disroot.org>,
	Daniel Salmun <salmundani@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] Input: synaptics - limit the T440p InterTouch quirk to LEN0036
Date: Fri, 25 Sep 2026 20:00:31 -0300
Message-ID: <20260925230039.236786-1-salmundani@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 26eb3d92c7a4 ("Input: synaptics - disable InterTouch on ThinkPad
T440p (board id 2722)") disables InterTouch for every touchpad with
board id 2722. The ThinkPad L440 (LEN2004) uses the same board id:

  psmouse serio1: synaptics: Touchpad model: 1, fw: 8.1, id: 0x1e2b1, caps: 0xd001a3/0x940300/0x127c00/0x0, board id: 2722, fw id: 1484859

so it is switched to PS/2 as well, although it does not have the boot
problem that commit works around. On the L440 the SMBus adapter is
registered after psmouse probes, so the first attempt returns -EAGAIN
and the adapter notifier completes the switch about two seconds later.
It did so on all 7 boots in my logs:

  psmouse serio1: synaptics: SMbus companion is not ready yet
  psmouse serio1: synaptics: Trying to set up SMBus access
  rmi4_smbus 0-002c: registering SMbus-connected sensor

Match PNP ID LEN0036 as well, as the earlier versions of that patch
did, so that only the T440p is affected.

Disabling InterTouch on the L440 was proposed before and not merged
[1]. In PS/2 mode this touchpad reports two tracked contacts and no
contact size, orientation or palm tool type, which it does over SMBus.

[1] https://lore.kernel.org/linux-input/20230414092353.v2.1.Ieb687047a5b75c7b7ee5dd258207ef5ca9a3b728@changeid/

Fixes: 26eb3d92c7a4 ("Input: synaptics - disable InterTouch on ThinkPad T440p (board id 2722)")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daniel Salmun <salmundani@gmail.com>
---
Raphaël, your earlier versions matched LEN0036 as well. Was dropping
it in the V2 RESEND intentional, e.g. because some T440p units report
a different PNP ID?

26eb3d92c7a4 is queued for 6.18.54 and 7.2.8, so without this the L440
drops to PS/2 on those stable kernels too.

Build-tested on top of for-linus. The L440 logs above are from 6.18.48,
which does not have 26eb3d92c7a4.

 drivers/input/mouse/synaptics.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index a8ce89d41..6bc14c07a 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -1840,7 +1840,9 @@ static int synaptics_setup_intertouch(struct psmouse *psmouse,
 		}
 
 		/* Disable intertouch on known-broken board revisions */
-		if (info->board_id == 2722) {
+		if (psmouse_matches_pnp_id(psmouse,
+				(const char * const []){"LEN0036", NULL}) &&
+		    info->board_id == 2722) {
 			psmouse_info(psmouse,
 				     "Disabling intertouch for board id %u\n",
 				     info->board_id);

base-commit: 309731e95917125bbd13626a7a5600490a5bf44f
-- 
2.55.0

