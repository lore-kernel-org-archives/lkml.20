Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD50349738E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539188; cv=none; b=DrO2v7ztEnCKJq55X8/aiLMtOH4UChumkwKQpdp4YieyxXvrPpFKAoMsIWgBerznUaWErwFUVDgTYYnGOnRYU63DcHKWdMWZ0Tfx6XfnOBKTGXtK4L7Nj3t7leKjhHkmvzWodpPvsW3GxsxSBIHHYcR0Zny552F9rd/OVgR+Kgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539188; c=relaxed/simple;
	bh=RAJQnKkDBXdd5vQ/P+np194z6Ot3PXYd2Bw3RnHlVSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W17365Iv1XuH/8Ld3Auyc7/NGis9vBueUPf0GF+fyKjLxj1v1LDW2yLN8kzc+JHOXCK2ovW3KH5JTbXwFik1elrOLYLHupLjNDzSMWCZUl0SBjqMN8fTbV6ATW3kh3rFgBsMmBhAqouHEM93XZ1ye0hxCLv5YxzljTFP9GKkJ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfpnW1d1; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfpnW1d1"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-487048857f6so3460841f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 02:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791539181; x=1792143981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdjcKesxfT3Y1JRnD0eSSSUTshq47A90dMPNUITOibc=;
        b=OfpnW1d1makdUJB4XeJQfm7B+XJknyWmFqynfa6dtaiH1xURMxMxWXENP8548ANVdm
         7kkdBhqHRqOTkmPtKTUbixXEQkMGZ6fjxaZO3exJiF9JHOPJPMeeHJIXxwRjcG06Erkh
         wYKibK54hN1kbJCqx1xTFDRf/o3BbstNERrJYUMs9dM9lfw3LzXrbjd2YkXeqR4AnMOf
         7XBMPx7XAONsTTnCWaZ/Bmz90yzKNRb4GBuLighXt+YdB3PW3fv0N6NzqlT/RMim00fD
         Kvqca1xtXhVHVpjlXAeP1Gbxp9TfrA0/5MCCBhCX4Bh3rqhPPXv8UsrauM7+WXeBQRCs
         6ijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539181; x=1792143981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdjcKesxfT3Y1JRnD0eSSSUTshq47A90dMPNUITOibc=;
        b=uabnip20MTyp3Eri2mVhnHFUz7BdbkTqjYueD204si6cfAzHzmuo7zjHwi/FaG8xHU
         OnDyLgT4z/jPMMQBqN+nNQhUz6QbTCzsVCojerLeZ6sDF3JmdNUS4bxgDa+bJu6l+K00
         Z4i0NPPn46BvexpEn/jA28mJDQJnIVh6QKzCwgDdRihm8+E7oGHjQay2lRs9CfQyko+v
         dDY5ZmWFuixbftAw2w6HgafypXrlgV3Ler611zKxEd2XQzxQMaOaWXQc+UhWNsaP1aW9
         UHEh8WyAZNCoPpJbgLeyQw5AeEp8jZSKR7BPYgr40qruZZ2k/IQohjSlZhQpJabpsPTw
         yxKw==
X-Forwarded-Encrypted: i=1; AKwUvBysIAJU239yQPw1Kc8QSJ2srPnWyh7Dgpe9B+KhV5y8KkbZstmhyDB6RY76AJiqfPzScLvtJrtedCh0e9w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYy4vMvGbaSVWV4e5xGRugcNLLorCpwA0FpQJQeyefDFj2fgC+
	vWTY9wCocYuEd8QmCZ7HdnbdMwnchz70uMXs21EspX9PBdr07D1nUfPBkt9pBHBN
X-Gm-Gg: AYBFou2h1ZM1tcBo7/EmF+ipOT3yXHGvRmauA3DYsSxuylCZJsSEO+OpoTf4ZG+MaVE
	+f6A97j+hMc6dmee7yjj3BbDZF79N93F5DggD1NSzF8GiT99BUujg0gmFxkGzz4RCd/7xNU9Rha
	fChDUfJoAfLMcvZOb+7YembY1/6SD891TU6j9lNHiCKCw4N6KLdsODAih9yQzteNcfwNfoz22M+
	Bbqu7qVUYNGVIzLsNX4EjgGqLAaADggwXu/4Ks4M1sqoahrKM8z21SxBLpMj6mIB9NOaOozztx5
	J7+SREvEXZuXoxpUjbc0DUgK0Jezz9nnNgBxPrqfFElyJ+xCU2eivLIp4dQjxZ8EuwaqRzDzvGH
	AYQPZ1zEC6fWjhAt3ECPpA/sSmZ9AGTyW2VnRNEDuBc3kJmg7l3w+B0EZXLbE6e3ziUcNMh613S
	MRcXtPWk95gT8PKQlnLdz0lRw1TvO30e5zgGQvsjDWFGtExufpp5w5o88srsj36CgK8V+ztUi+i
	ZfX0b/DNYuJEVdExQpviURm2b+iTIi4xDs25OoyD+1+xABqP0V+hQ==
X-Received: by 2002:a05:6000:1ace:b0:48c:571a:a1aa with SMTP id ffacd0b85a97d-48dba9dacf6mr2801939f8f.19.1791539180541;
        Fri, 09 Oct 2026 02:46:20 -0700 (PDT)
Received: from nixos-office (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9adeacdsm3051833f8f.55.2026.10.09.02.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:46:20 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: kconfig: cleanup stale comment about 'keys' array
Date: Fri,  9 Oct 2026 10:46:17 +0100
Message-ID: <20261009094617.17322-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'keys' was removed from 'dialog_textbox' in:
commit e14f1242a8be ("kconfig: menuconfig: simplify global jump key assignment")
but the comment referencing it was never removed.

Let's cleanup this stale comment.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/lxdialog/textbox.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kconfig/lxdialog/textbox.c b/scripts/kconfig/lxdialog/textbox.c
index 0abaf635978f..3fe7682fc8a8 100644
--- a/scripts/kconfig/lxdialog/textbox.c
+++ b/scripts/kconfig/lxdialog/textbox.c
@@ -145,8 +145,6 @@ static void refresh_text_box(WINDOW *dialog, WINDOW *box, int boxh, int boxw,
 
 /*
  * Display text from a file in a dialog box.
- *
- * keys is a null-terminated array
  */
 int dialog_textbox(const char *title, const char *tbuf, int initial_height,
 		   int initial_width, int *_vscroll, int *_hscroll,
-- 
2.55.0

