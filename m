Received: from mail-dl2-f21.google.com (mail-dl2-f21.google.com [74.125.229.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110992DA74C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790504197; cv=none; b=nQA0xXt7hsP/jpYiiu/LvT24wHNmxGSRpEU1jau0fIjYEfIZiLBShlhPJ8YKeoLVnaZApNrHZb7zWdNM4t2RuIxCsOfH6bU66aJmIyr9kbfZestG/PbzV3U87ZdF/pRgWkj+uJvWhII/sYT32L8xp4yUv89BSRe14hE52OBe/us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790504197; c=relaxed/simple;
	bh=I7kaAu/4eA0cThMSG4dsamA2BFZWxgGAFc7EUQzYftM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nUyNYnj2VPTB+TR5ICCyTaa5JiI1waimVZFRifRJAJDUKohpeqkZZJd42fjt4ns2Q4mtOq4+wKZRWWz+9ATSpts6zT/iHmBuM/9nxpZYq0jMZ9X61DI6nQORYCA5SIiTOC0ZVu2px6rFImGYFa5YPbFq53rpBhyYnjN/u9Ih+qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=la6rqVVs; arc=none smtp.client-ip=74.125.229.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="la6rqVVs"
Received: by mail-dl2-f21.google.com with SMTP id a92af1059eb24-1438421d1f8so67829c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790504195; x=1791108995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+X90FvGp/WYOP/YNaRkMNyUQUW0Xnu+e4bt1heZW4K4=;
        b=la6rqVVs98LBQuJQ93iawMTZbxEQQ1V5sQfRWmtsYXZbX2m68jPANcCKNmu8DvU4sl
         sKailX9xOtE3FiYlJvhhy7Cuj+6hxjE4Gw5PzBoqthAe4kiTV1+uEMTiWzGAxFoyd2Az
         fI+aMKEo8kPwpaeUExu5RbH4f0cEmwYbRcfR9cbIZ4j41RIQdyGVjDPrHrZ9tEw1Ib9O
         PFz4IVvg6TqTi4OHrvWxdR9DEYywX5feiHv/v0ZONFLkaVJOFLP8vJ1aOLUtGxn2BsAE
         MUzBhi9UtvlGHfnf8rKeK6iAe+V/m1enYgJsTPVqXg8EBRUpBRfFMKXNBpk0XAkydADb
         zu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790504195; x=1791108995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+X90FvGp/WYOP/YNaRkMNyUQUW0Xnu+e4bt1heZW4K4=;
        b=1ehcSbmZbYOqDfzhsPsNoNhP8XoDHJwcyWyMEwaSWj3h2b5VMGddyv/pumEXV97hZr
         3cfoX9979Vpwy1UQ1igAn+zYrtS0Ics5wfuzF90qPaSJvNh+H4daY84T08cGH4Cj3Rjt
         hV55vOlykqGP379YZwegf2+wFiRr9OOjqvJJ2T1KFjoyAY3xlvAPTEI5aXv0zuc4RJGI
         6BBLb7BIyjAOaxy/1mdPTHln/X8N8rmKB9gUWE1wEeKbrZxHWNTNAYbROJ0r1UANoVcY
         kf0ddjBNV7Nrl/pwT+fJKgdYc8SXLNJNFGq+QH+8xFy5wpkPwwo6bvMWATjTwJnYrpMv
         8FSg==
X-Forwarded-Encrypted: i=1; AKwUvBy+I80jFfMRuWyPCXKDKMwgX5rGUkE8JUsblzXrCtz5/rUEuORJ5L/oayDBDyFKefZHenNRAKGjWMwqQio=@vger.kernel.org
X-Gm-Message-State: AFuF++kW6HBgPyKsidCaYaBNKhvLpD5vsQiA4TfY44ZE9N1YqgOlKPeY
	ujfwmEJsN6bQIi0kgqtlDejK5vZlBJ1cC2YlB204wTbw2zQLfn8VedQ4
X-Gm-Gg: AYBFou32QO4o8daEhI6dVC45dxT8ughhX7BIC005aRPXQzd6OkU/gijuHL/A9rx8z26
	XhcLaU9jTHpdE8TgkR2iE1MAtWLrc5VB/n/w5y/L/D/cO7Nia4/bGFM35EWh4giUxjtDOmzf7pV
	9HBhGj/aGYqfTyTWRdxarSvmMU7eOoddNYT/JG8N0lOutbpig+CWYfQwRZG8mNSi1npsYCo+8rr
	GRuATU2QKLbPDaae8kJLjUoZUdiNOMDfEvVc0LbtvVzjYw/xNkQeyMpa3tnQ237zwQk5Y8C4Yqj
	AKZ4+S7t6JDmPaDRn6O9MYZhgTfjWl5qNXH8DJmft4MHghzf4sTgI+7Ja+pPa3tdHbPo5kM/NmI
	k+6O8x4U4Kl9dFIJbnpF70RnsLc9G7uMFLpwMGfw7Jd7fS55uCTe9dsJ0aIUdoXy3V6gvJ/hIkm
	/6+QTtJt+VkFScnslnsfakXAoLBOjuH4oxhpI4uKvT8cAHVG6LLxNOsMA5eRU8vjw/T6ygEnY4r
	NMxUsg0lHUvu8eqt602An4KWuTvOmGsIjFPKcDyrZPujkexMmHhaq3c3trCCO9BVGfeOg==
X-Received: by 2002:a05:701b:4508:20b0:144:ff51:2d73 with SMTP id a92af1059eb24-146cfbd49d8mr8759695c88.2.1790504190254;
        Sun, 27 Sep 2026 03:16:30 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acd3d8eesm16760188c88.8.2026.09.27.03.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:16:29 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: Marek Lindner <marek.lindner@mailbox.org>,
	Simon Wunderlich <sw@simonwunderlich.de>,
	Antonio Quartulli <antonio@mandelbit.com>,
	Sven Eckelmann <sven@narfation.org>
Cc: b.a.t.m.a.n@lists.open-mesh.org,
	=?UTF-8?q?Linus=20L=C3=BCssing?= <linus.luessing@c0d3.blue>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] batman-adv: Close OGM aggregation before transmission
Date: Sun, 27 Sep 2026 18:16:24 +0800
Message-ID: <20260927101624.3812927-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926172600.2394088-1-nicoyip.dev@gmail.com>
References: <20260926172600.2394088-1-nicoyip.dev@gmail.com>
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

