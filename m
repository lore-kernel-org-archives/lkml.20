Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B8E35B63D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789269558; cv=none; b=H916w6alUOt1vyA9wLmUC+lsutMO13SQzG7/6KSdOGhNGXL4l9PzTYzJ43SeA4B9LGscHFVbiFuQhUwEOLv7BZtI0IRKlJkhbbaTcUSxdQHzt1Tjs51aZSHSWRNrCuyuzQEmJv2L7mPSbn6B9nRoo/rr3EnS+YFbel2XNnaIaDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789269558; c=relaxed/simple;
	bh=pmBucsFYGucCQa0JJyRGYMHl2qDpvzF7Co8RBiY9jBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QA2USMpnUUpUAQaB5ciBzx8tWwHtQbo6GJQ4zLzkkZmX6DNZ4k2y7qQYAPnaehkCuDb4bDUsmxYWDOyrpdkEQikF/MUWteVA0qnHz66gydzwascl5sB1/1lI0mhB0Eg/VxtcR8OMgk3eh6LZMZhrTvWgCZAuJqE8ca2WCOoCdZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ijh6SkKY; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ijh6SkKY"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so1479181b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789269556; x=1789874356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=31FzDkx84zLx4JWuY3RdG63Yzc3M+o6dxG34K7Ch39E=;
        b=Ijh6SkKYsEKh76Fa8wybLDE1NCjlSjuvmH8+67YJsr+RM3rP1FYj608UoYkVP/E+d/
         6PLh9zAQz/duE+k4mxIqc4ZOdxarT9YJlM+f0oISzQM7xrODhD2hnGLqKpP28wM/TROT
         AIrDKpxLAyJkNdH3Ohh0QWvzLSiVbBTa6jrT0sKd93z6/HeCjF9pf+K11x7UuYTmyyBS
         gqV3KJtiYbo3qLZ9spAS/b2x4FkFTvWKAAy8clL3kEjlq/f9/2ewxcG7Iu9USawzHn7Q
         qG5UjSKARE25D5Y3Ulvc2MLPz1bHv+cLtAMYOoP1YjnjluUdUiEahgKzqgU3ghipUyLM
         NUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789269556; x=1789874356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31FzDkx84zLx4JWuY3RdG63Yzc3M+o6dxG34K7Ch39E=;
        b=iVGpOL7lWE+93CcTBk1ZILL1tmDGz5ETq23dDgQDzAnRbx+AXbiPw3hBi5XLltS69J
         c5/e8Bx/sZ99YpYy13BKe8WJ4SuHKiL1JW4LNW9OJIXfCQV+vErZkJ8K2norkD1UwZpJ
         XO8SUcjOpc1Vh4XWRV4KEWQufCvCKHgO32NlCxRW2YLiFCwXo5lKBGFsZL0krKm9DCjs
         MGN4A91DHNpzkKiSf0QBE3u7srv8H0UkMQ4o+9d15++x6lL26Vha4B1J5wkxPPY+HMPN
         7aAR14CL5UaNVsVfEf9GOybKCIhVX1L6AZLi1Gom1C6yaZPmmPuxr6V/hkGZJSq5/Kae
         9XJg==
X-Forwarded-Encrypted: i=1; AKwUvBxMzz00xfYHlmo8gru8R3RC9OgWxavKICY1FXkpZqpOd2tyEg8GubXj1zSFEeb8cXbpTm5MRsG+m0mZP04=@vger.kernel.org
X-Gm-Message-State: AFuF++kwq8WG6/ZabpIYyfQdDfMaufQh977gdaO/xHKCQpkRefNMDGZn
	eC8+iZEaFFxlpfx7Uj+D/k4xIfUb2ST6melS4LaQty0Q/LgwW1ZpBI5v
X-Gm-Gg: AYBFou2V6puaPidbel7pNgbq57u+VmP271xBr3dksHIUxlpLdRLMJYT2usbCa4gppBu
	1jRbLr89CI4G31LCOrkroTd01E3dki4a8+RsP7BGnAHnVU6vmp43gxdNPaGuDObBBqqRrQ7WEwQ
	M2j3nKPTKwKPva4hVHEMmyIPjvP2EHLZHZtcouqDBy0WKx4vQQz2XhfPJI/ybZ12Q2YeTyuyRga
	6M0PVzwBUKdw6sZT8kZjV+jlAAnhNUcy7zFLhpkZBRtcozlonxqlpZb1DWB53wpdJoALCecc6A5
	qy6uVQ5eYF2Eip4ijZgcKXOHDkr3FimOitXhWl/RS3WU5M2vxvP+J/uHaTVgKMFCFSQaaP/MKgW
	KWEgSq4zTgAPfWUmJ8LPTxEt5FJLiNsbxuWEkSp/gCVFkkjCDVXxSKZGm8LkC393Ryt3hwzyDrs
	PhZOISfo9nvD67zju404HrZSHuscO67fRdE5TVqR6UiD5CptTENV6crJNtP7iDBQhRqCvhraoRj
	pBNZtQVlPuBKM1ghC41Th68erQKRNWCMIe6BLcbgQsJAvSUN2X0K7KIuxGyfhjU
X-Received: by 2002:a05:6a00:8016:b0:86c:79f5:281 with SMTP id d2e1a72fcca58-86c79f5090emr11028681b3a.13.1789269555532;
        Sat, 12 Sep 2026 20:19:15 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:c7cf:e002:582a:f076])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b286c49d2sm2884171b3a.10.2026.09.12.20.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 20:19:14 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: marek.lindner@mailbox.org,
	sw@simonwunderlich.de,
	antonio@mandelbit.com,
	sven@narfation.org
Cc: b.a.t.m.a.n@lists.open-mesh.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+a079f084653164a652d1@syzkaller.appspotmail.com
Subject: [PATCH] batman-adv: avoid WARN_ON for orig_ifinfo allocation failure
Date: Sun, 13 Sep 2026 08:49:06 +0530
Message-ID: <20260913031906.14809-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

batadv_orig_ifinfo_new() returns NULL only when its GFP_ATOMIC
allocation fails, which is a normal runtime condition and not a bug.
batadv_v_ogm_forward() already handles this the same way, simply
checking for NULL without a WARN_ON.

Do the same in batadv_iv_ogm_update_seqnos() to avoid a spurious
WARN_ON splat when the allocation fails (e.g. under fault injection).

Fixes: 7351a4822d42 ("batman-adv: split out router from orig_node")
Reported-by: syzbot+a079f084653164a652d1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a079f084653164a652d1
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 net/batman-adv/bat_iv_ogm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/batman-adv/bat_iv_ogm.c b/net/batman-adv/bat_iv_ogm.c
index 53fbdbbe8f4f..d8a6a0f64ce2 100644
--- a/net/batman-adv/bat_iv_ogm.c
+++ b/net/batman-adv/bat_iv_ogm.c
@@ -1410,7 +1410,7 @@ batadv_iv_ogm_update_seqnos(const struct ethhdr *ethhdr,
 		return BATADV_NO_DUP;
 
 	orig_ifinfo = batadv_orig_ifinfo_new(orig_node, if_outgoing);
-	if (WARN_ON(!orig_ifinfo)) {
+	if (!orig_ifinfo) {
 		batadv_orig_node_put(orig_node);
 		return 0;
 	}
-- 
2.43.0

