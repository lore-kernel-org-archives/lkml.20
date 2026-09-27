Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4B73B894B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790504637; cv=none; b=qBkulNm6KvoT1vUWzY5FcSZPoFnueVcr+Nn4mdcDL1A44yjY2jap8GDeXfcxcZh7zb8X/R/EqN+vW01TyxB7OLYRRZ9ZcARaFjbdu6rw8uvSsYE512EGQhjpzxBTV8JXIbu2fHTTmImjnktvdFjSsDz6RApabw3t5MHWD7pVHg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790504637; c=relaxed/simple;
	bh=I7kaAu/4eA0cThMSG4dsamA2BFZWxgGAFc7EUQzYftM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tHxRcOQ6c6+488WxpLVJiG6EyvgjO8qcZ4VJvvWdgQkP7VFs8LvkiUYDI216w9JK8GgY1Wg9ZCmwRhetpbcw6mRZtJ4TpY2SZhr0iD95GlGtf6CmLDWsCSfWVhJEJGCf6Gxop0vt9nfoAcmssmt4sFoKf+bFwkkVAhSa4wy4DZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ej9DPg6V; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ej9DPg6V"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-144fa6e60bcso83577c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790504635; x=1791109435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+X90FvGp/WYOP/YNaRkMNyUQUW0Xnu+e4bt1heZW4K4=;
        b=Ej9DPg6VHqYRjvEuI7jEEX7enmqXobY3dz5AE8Pr7S5xCVujMDrEc8S1M40vRTdo+a
         OZf3dFytPLrpWDxTSQGjqbdR38VbfUlI+VYhGtjtzztm56cBRboNsKqu/3lUR26QuKUE
         FN+Ixg4qn43gzlPrSLkDtPj73zMo2klU1LeJkPPLZ4PwJQUzzCX1FDglHMK2xXlVUCci
         JmZyhn/z8XFjI+JMhOVBw2cEhmTYAONGK9yxJ834ClRTjx63VuAO6B3JmCTclZEXb8Ot
         udyU0VLrQF3CXCnkCeqD+4oHWzd9gdloBaRuvpUAxW3pBw/oukeoIGv1f4iF6lsRwXd8
         +Mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790504635; x=1791109435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+X90FvGp/WYOP/YNaRkMNyUQUW0Xnu+e4bt1heZW4K4=;
        b=mmLCnsP1awv0e87u29WvPFcPETXaRqOl7hxPNv0P+GmbMlESvW/5toCdy9TjI7wAAY
         E5pGBqKKQGEyZAGGOUpWTWeva+8EhIRCXNQlN2lar5gKb9Us5Ts5WSZfPP1BpcR1JRRw
         yGjkTLhv2FlAKAFBo1FC266I3LHZ5D9fMqhSJrdw27CabFpqVkIUif834zOO7rful4Ak
         GVV1Rdk2g3UtTou7stBJ04WXaxI7nthSxj2OfI8AQidF7zy5uYngnnQDQoXh97KxYPky
         Y5VV1cnEmMSuvHlslvbQcLnONHb/ZgIEE/l5uAQuv16PRPXAPHZgRnkS5kdCJS42oGbk
         fW+w==
X-Forwarded-Encrypted: i=1; AKwUvBwt038KqITLAGlzpRU/jdygBtalu0Pf22efb+04UqcrVoLMBhU/MVX6fzpgE9aDUUkohDmifbKiEhSfm4E=@vger.kernel.org
X-Gm-Message-State: AFuF++n4GXeKkvC3ZIP1G87LI3ZNI7xUuNmuJXH964fMWB9qq7TYXxGi
	0szJD5In7LWZUpwZauNlE6HeuUxSOAv3d6ELb7JrRvLY5zy+edCCyNGd
X-Gm-Gg: AYBFou1WSyyEbn+kds+Mpckq0gK/IlgBWExz7tQ/cRQSYhjNaxkUbDjUe6DUPbFXRwm
	bFN3T5YK9wHzd5XQBV2rPUp8AD9HJtHAkpOCPvITrUB06JqI6GcQERu6gAT6ZHXAx4JcBGrigs+
	DtaJSekABRY8T0AAgvheCodwrr/ZuoGreQby22pM6ZUTuVSE2rRmaGS0TbtgYnmI0cb+PfNArfd
	T6+AIplrY9eMn/2Kjwk8R9J5ufnaJ2mGO0vFeqkqY3XQgi10pS2/QOo9dXGYqlKHRTgWsSaW4lt
	oXZhBvzwab3GUa703QD6mt0mcGhV344qcBOvD6m7XRAEAyncZtpdy5f8odSxB0YXulpmMlPQ7jz
	cGFInQF+aTZ9VWOf5nerWtknlMDQiRFTZf6fFlEY3GR+YR09QzvQUng+Lqf3M54KedPlhtiSRqp
	08g7VVrQ3tVnqRNd1pN1qttlyz/b3H9AQ1VBCIYepvsMIwZpbnFkv7Hfos1HYLclwVB8iX4pCuh
	+E/QMaRFISl/2SxqUL/Gm3SyOM4BnL2ktbU2xendf5GFEoApO+VWi1WsFbW6WMmlBaumg==
X-Received: by 2002:a05:701b:4508:20b0:144:ff51:2d73 with SMTP id a92af1059eb24-146cfbd49d8mr8784075c88.2.1790504634664;
        Sun, 27 Sep 2026 03:23:54 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145a7318afcsm17093142c88.0.2026.09.27.03.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:23:54 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: Marek Lindner <marek.lindner@mailbox.org>,
	Simon Wunderlich <sw@simonwunderlich.de>,
	Antonio Quartulli <antonio@mandelbit.com>,
	Sven Eckelmann <sven@narfation.org>
Cc: b.a.t.m.a.n@lists.open-mesh.org,
	=?UTF-8?q?Linus=20L=C3=BCssing?= <linus.luessing@c0d3.blue>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] batman-adv: Close OGM aggregation before transmission
Date: Sun, 27 Sep 2026 18:23:42 +0800
Message-ID: <20260927102342.3813222-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OGM send worker leaves its forwarding packet on forw_bat_list until
after batadv_iv_ogm_emit() returns. Aggregation holds forw_bat_list_lock,
but emission reads and clones the packet without that lock.

CPU 0 can therefore start emitting a queued packet while CPU 1 takes the
list lock, finds the same packet and appends another OGM. The sender can
observe the new packet length before the corresponding direct-link flag
is set, or clone the skb while its length and payload are being updated.
This can transmit an OGM with incorrect flags or inconsistent data.

KCSAN reported:

  BUG: KCSAN: data-race in batadv_iv_ogm_queue_add / batadv_iv_send_outstanding_bat_ogm_packet
  write to 0xffff888100fedcf8 of 2 bytes by interrupt on cpu 1:
  read to 0xffff888100fedcf8 of 2 bytes by task 70 on cpu 2:
  value changed: 0x00c0 -> 0x00d8

Mark the aggregate as full under forw_bat_list_lock before emission. This
waits for any ongoing append and prevents further aggregation. Emission
uses packet_len to walk the OGMs, so all queued packets are still sent.
Keep the packet on the list so interface purging can find the worker,
wait for it to finish and free the packet.

Fixes: 9b4aec647a92 ("batman-adv: fix rare race conditions on interface removal")
Assisted-by: GPT-6-Astra
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
Changes in v2:
- Rebase on batadv/net and route the patch to the batman-adv maintainers
  and mailing list, including the introducing author.
- Add a comment marking the aggregate as full before emission.
- Drop the stable-backport request and defer backport consideration
  pending maintainer assessment of practical impact.
- Add Assisted-by: GPT-6-Astra.

This revision is based on batadv.git, branch batadv/net.

The reproducer archive, batman-ogm-aggregation-race-reproducer.tar.gz,
was sent in a separate reply to this discussion. It contains the PoC,
prebuilt kernels, build scripts, configs and QEMU launcher. Reproduction
uses KCSAN and a conditional kernel-side mdelay(), capped at 50 ms, before
appending the ninth OGM. On Linux master fd179f8a05be, the vulnerable run
reported the target race; the fixed control reported none. Both runs
completed 240 cycles. These are instrumented runs.

The v2 batman-adv subsystem build and git diff --check passed. The code
change relative to v1 is the comment above the existing locking fix.
 net/batman-adv/bat_iv_ogm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/batman-adv/bat_iv_ogm.c b/net/batman-adv/bat_iv_ogm.c
index d8a6a0f64ce2..084970404d3e 100644
--- a/net/batman-adv/bat_iv_ogm.c
+++ b/net/batman-adv/bat_iv_ogm.c
@@ -1909,6 +1909,11 @@ static void batadv_iv_send_outstanding_bat_ogm_packet(struct work_struct *work)
 		goto out;
 	}
 
+	/* Mark aggregate as full before forcing emit. */
+	spin_lock_bh(&bat_priv->forw_bat_list_lock);
+	forw_packet->num_packets = BATADV_MAX_AGGREGATION_PACKETS;
+	spin_unlock_bh(&bat_priv->forw_bat_list_lock);
+
 	batadv_iv_ogm_emit(forw_packet);
 
 	/* we have to have at least one packet in the queue to determine the

base-commit: abfe281aeab4d26b8e262ca9efc979a92c494aed
-- 
2.43.0

