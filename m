Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2665C392C2C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436330; cv=none; b=lakrTA882E2RRt1/3XpJ9Wk8Gj4pt/SlqlLnXSzS7l53+Znb0F9afods4FxvCFV2c10CvgVpSAj09SFsa/xBEYPE6Xa0VX5DN8pvFKoAQc8/dv8TTg2PuqhslRYwtVBsFXorVCx77Un9MkhJ4c2WsZsebq/TNllUew5Qh2gh1kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436330; c=relaxed/simple;
	bh=MPkdKKU/7GUG2aXSqsI6wgbkgwkvax2NhB9XOBGUO7Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=GvipgoUanhdalZv9yvIbkSF0AXXM2Y/XDkDtICe1PRLQQJLqVbGdbdgh6t5zutKs8lCZEFIUMpzyZHCj8CfP52Q3cCgQQWUef7jlnfByg6EvCbJJSYGOJW9cYmjKqHDhdrBf4KLdVT3/Iqpg4zHJUZCZBMd3q3VNhgYE0on7ywg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-48e5de5a23cso5578197b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436328; x=1790041128;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SK8Up1k6e9dMSamna4ssit4ZSwewHiMfuuR+D6fsW7o=;
        b=OiL+dV5KX1A4fb8ATxTMKYE+IRFoRGEgCuvFuiCUG+OSVt56dgJ3zVIIt3TrOHxHXJ
         /Emxz1LLdANduECtVwCNi84o5uO4Ari+0VT9/BW/ZVywj4DMKwVSCrJlWGzq9O/8QYcw
         ddQSTXAoKhpM/+ZH8cJaRYZudGibfCxqAMhO4PjhNZyp3+dX7XMDlFAlAEW0O+FM3mPu
         hfZjNQuepYXxy/u6zZck8P7b/es06GGQ1ElzZA7E8hNoND1tE4FhesAwCRpi6+rXZ1NA
         CZAa0ugG/lHL2nejnp37M6y7I55t4wCdmgFN1MEZ5PSVn+x4d541SK5qHGI0OZeA/9L1
         l88w==
X-Gm-Message-State: AFuF++nrk/+3KbHkhLy9+QS0bg8S2NaZsIotusXMvpubY07MLGIpwTZJ
	rBDSk0lwLLoC9TMbcMSiH8wou5x3TfUZ6gSnrhzoqcP5zeHWBqBlFgZIuAdqKmgCU8125rPaVO6
	sq4XKwqMVHW0xNKXHGn8SRisDzv9Vi1QP5cb/xg+YLE3nEZ7Gqj53Z0pakvQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:ec49:0:b0:6c1:f832:9b45 with SMTP id
 006d021491bc7-6c54214a0e7mr4977457eaf.25.1789436327830; Mon, 14 Sep 2026
 18:38:47 -0700 (PDT)
Date: Mon, 14 Sep 2026 18:38:47 -0700
In-Reply-To: <6aa60ec9.f81106d8.2ab401.0032.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8a1a7.4c28b7d0.c1bba.002a.GAE@google.com>
Subject: Forwarded: [PATCH] WARNING in batadv_iv_ogm_process_per_outif
From: syzbot <syzbot+a079f084653164a652d1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] WARNING in batadv_iv_ogm_process_per_outif
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Reported-by: syzbot+a079f084653164a652d1@syzkaller.appspotmail.com

diff --git a/net/batman-adv/bat_iv_ogm.c b/net/batman-adv/bat_iv_ogm.c
index 53fbdbbe8..24ea350cd 100644
--- a/net/batman-adv/bat_iv_ogm.c
+++ b/net/batman-adv/bat_iv_ogm.c
@@ -1410,9 +1410,13 @@ batadv_iv_ogm_update_seqnos(const struct ethhdr *ethhdr,
 		return BATADV_NO_DUP;
 
 	orig_ifinfo = batadv_orig_ifinfo_new(orig_node, if_outgoing);
-	if (WARN_ON(!orig_ifinfo)) {
+	if (!orig_ifinfo) {
+		/* The GFP_ATOMIC allocation inside batadv_orig_ifinfo_new()
+		 * may fail under memory pressure. That is not a kernel bug,
+		 * so don't WARN; just skip duplicate detection.
+		 */
 		batadv_orig_node_put(orig_node);
-		return 0;
+		return BATADV_NO_DUP;
 	}
 
 	spin_lock_bh(&orig_node->bat_iv.ogm_cnt_lock);
