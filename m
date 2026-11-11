Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411402;
	b=cJppHLznE2kqpDV9l8LrTUI44r5+d6tJjwHFPzScnsPN1g0tLDLH7DW2TsitvA53lNdw
	 pcRo/hWK/uyMJXeWonWZ3HmVGz6wRMhDqf3VRCnyNLMIuj2GEnwD/tBr+1vy2OT+1NYHi
	 eD/gcWWymoLtxTXJv45qIb7Mg5v3UyvxfVwzE7mvFmdaYR8EDQc96y494CF/c34TyUjSo
	 xrzDVFHWeuRK3EsA1I4XFaUprmEnPpH6V8zBtpI3DjWjUOYr0vWvMi/CAU3O/Dx2Xpapq
	 rH6LBsykeBwbT/DX5VZymsbuE1u1j2EkvoKlL3cvjYj19sNuSlK/Xlfw5ag9qENl3lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WLcBvS1wo6PalRepYxsgEvCEQRFCjKivXNWNUaVBAyU=;
	b=D+OYvZMpxiWPEv5Lxlhzr03iHykK+9BnnVM7XDzdb/0xDOjyjkVmlbFOlaeizEOE39RU
	 kXIKMHjjUWYMz7gY7vVF3zK3JKPPMVdm0sqyEy9AIyadklR0OFxGqT+JARPOl0kjwPO5W
	 y93p3W8Q2CdQK6r+zGuxXoREbDzp0d8uGN+Sb7dJY64RXHOnYHtwp7NbCgDf69Ykgk5G2
	 9VME4LDjcCJLh9za36lbLUsS+hNG6XzqDHaTZKFRX8iKmA0aM2gE2LvFhSYGMG8D1CQUk
	 A0yq3H95HiEC6rJFuAE1HxjYWwFVkrhdRkySIKadjWE/OrUZUUFqFzKHLXUR4bcJTKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=FwyL3hSU;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721B1606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 721B1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=FwyL3hSU
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214af2076so24531295e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794411400; x=1795016200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLcBvS1wo6PalRepYxsgEvCEQRFCjKivXNWNUaVBAyU=;
        b=FwyL3hSUGlNKpBaN3xRyuGkQ+pJi0VgUflF/WGw3DxF/+q9cxxBZ7lbhfpJEtzp3BA
         TUvQgTh9CTm8SbHSHz4yLrjjEUBPJqE1uiuKtgdJE258fpeX2Mw2zZCCZiO3F74KO7Yc
         s53kuaqhoKeZ4WAzIwJfarc+k9xnE810zCSo47bj9yVKImNlF9hlQ3HUb6dBJXe6xc8g
         TgTKJjx6ZsUoEuCrs8+7jACxCMv6+Of2pmqHbtjJF/OIci89SPJh7HEGrUmbqitlyKyo
         Xtx7Lx4O5UKsFZz+2HyO3Ku9s6bQep0PGcFZwPSV98BXAA1xviFl+sLoqo9qod9JCBAH
         N0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411400; x=1795016200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLcBvS1wo6PalRepYxsgEvCEQRFCjKivXNWNUaVBAyU=;
        b=JK3dtBeGE0XOv5iK35SWpPwcwBK8CwkNtyjxnX3/ho+Jdhkf79bzJV7y/Sf/YOqp5u
         0w/Lhcmc9tEqAhiAJre69CU2JC8yencDGKqwcqy/DoLk3PhHMWc8gxxij8/dj6KesVzk
         DHoawtzveyD1/UC/Fu+eJndSoBADwcjAA97kMH+xl1S7OYfX5VbmHP6q/BWi3q7dIc6i
         /0FhxHx+6Uj6I37RHm4817VRMKdFoouRKd6GpYcymnWaiALbIDqVm2CxsnNWG1KJ2L7+
         cyL75iq7Z5WQgjw5n/ZydREQH8ZtLOi/ow84mY87NIZk6kdhxZsCVcJ2R+rPhSKDs/hN
         sEUA==
X-Forwarded-Encrypted: i=1; AL+hErHsOENTsx5juaSySxOZyIyYz+Cw/e+pVofK4Ytut7/EgRDqVneCeAQoGwqMwFiexzh89U/elC67/dkfS5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AWta09djf1ltH4QmRhQ8jbKOIm/1AFCJv2+WCljClip1DSxHY
	tcTjzH3+CmZ9hsysVGP7Niw++m78GSMcj244tKEfTwRGZb5EbVEs7+xj5YSovJdajGDjbGqTQu3
	wC12oKjc=
X-Gm-Gg: AYBFou0kYyPVvAoeYFA5OLJep31c6vOoOIjYmZw2TRChkcJbExQ2J3k+F2uZQZ9zZiK
	pDtsveI+ug+8Z4vUZnzFhVNohQ9eeD/oqaJ77384pzGwQRGai8LMXX1Rt7cLgp+hBd3w0njjuO5
	w/gSr2ilk2Nqet1az4Bf+VmKkpGyBwp+sSYGqpE7qmesRZ3QMF7b9WHRcFd0lPtkDheAfUa+r9I
	UM3hgAB0590Jt3aoJk56FNEFtEGR6VH77I9GwrwlOoZnky8QNeyhHlJWjt/tGVi2WS+FmjZ1Rvj
	r6qZZM3qb8/8rmAbO8eKQtcDxlxV+UnDXhH55Y7hudXQizg3vPsUT+4gloCo3LJAYCEatXd2kVl
	PMsEbYKVa55yKkHX+M/E5dUqznc/QA08PMe4OAX8eyoI9PO+msPnnpm8VMA3/ReaavtOr8ZMPUD
	J6aABBbTQmUg7BgkyZGjAO/3OZ9+4DbpCwal97IHLLPA1E6P/gWKbG7QaAVOJd7mSd4JOHk0BBx
	Hp5RAtcdPaTJuwvt8YPZIjBZfv9Y3F4a7HLoS03ttnKdPhFq/H3v5s8+8gFgKHgKrSTGTHX0PZk
	GQN6nkTkWxwqkrimgH91OSOVLfV/A0HTXHQF4KbQhLa+ugiv/tbySbHB8dOVnEyQsIw2u2Malis
	3XbM75iM86fZSZZwXnR8zjDIN/dvCTA==
X-Received: by 2002:a05:600c:1990:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4ba093771d7mr51927585e9.21.1794411399817;
        Wed, 11 Nov 2026 07:36:39 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3fd2sm12408663f8f.52.2026.11.11.07.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:36:38 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Cc: Max Kellermann <max.kellermann@ionos.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs: pack fields `i_state` and `i_fsnotify_mask`
Date: Wed, 11 Nov 2026 16:36:30 +0100
Message-ID: <20261111153631.1309838-1-max.kellermann@ionos.com>
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

Both were 32 bit fields followed by a 32 bit hole.  This reduces size
of `struct inode` by 8 bytes.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 include/linux/fs.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 5b3a100aba77..9ab028dabc1b 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -813,7 +813,11 @@ struct inode {
 
 	/* Misc */
 	struct inode_state_flags i_state;
-	/* 32-bit hole */
+
+#ifdef CONFIG_FSNOTIFY
+	__u32			i_fsnotify_mask; /* all events this inode cares about */
+#endif
+
 	struct rw_semaphore	i_rwsem;
 
 	/* Timestamp for writeback list ordering and age checks (jiffies). */
@@ -865,8 +869,6 @@ struct inode {
 
 
 #ifdef CONFIG_FSNOTIFY
-	__u32			i_fsnotify_mask; /* all events this inode cares about */
-	/* 32-bit hole reserved for expanding i_fsnotify_mask */
 	struct fsnotify_mark_connector __rcu	*i_fsnotify_marks;
 #endif
 
-- 
2.53.0

