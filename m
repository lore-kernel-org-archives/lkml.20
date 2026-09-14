Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772FC374A0A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385946; cv=none; b=ioHg0A2nN5PfZyXYQS5OvloOptb38dZubh0L9+LnEkohCBHAslJK49tE4Ci/dkYmwGUNJK+RljBXoAoBX4DOt1PvFFwbiRsGFMP/l7iZEad5xKo5xs3TdyWqgh5XHjOLrt/9ZgN3MYU7fIez16pH8yZWSN2v49Mp2Ic74L0O0iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385946; c=relaxed/simple;
	bh=JVPZjlnKODJi3nhixnUVBnhD7OEQ2ep1GCtg6AHA990=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qwGixxsxjHpXFeTfgZ+d+SPqpxb41fQk6Za3Ttp17oeTphea2Or3aNSdDFubB/aFfvbuFrBaAYEUPZnYpYiLdkH5Ajr2PRYtDJuA2OIwXtItX6DYdkwWhoUuyYrDWXwtwQOVftMN27JXkudiWpeb9lbvC2Fc/NLScCaZKdNj/CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46524220c5aso3168969fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385944; x=1789990744;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8ShvkcUi2XdXGg3Kv7W4123bBr/e+6dayYQSTZLlVJI=;
        b=p4iqJbni7KrKAKsN6K5zCj76CScD1tuSUH5R3XsWNwe+ufpymxzryAvCDMxKeN3r5U
         SQ1e/Nzup/RyVfNJjoALRjsMIrOTCZBVIJJMf9mZIaVPrlTipt4JkuXi+R2x1L26FVMy
         oDxLhb1k+w13/TFwQrlg59AxQ6LFkoCj8dh+HQIfU+TXYgNMt6d2Lw5qotyUpOxpTl7G
         kmNf2zXnE3LhM7M6EXSHeZ/BiWsJcLeNGrLPkeGoveXajsiFBA/Q+81CFG58qwU+mf14
         BKTxKRouYh7eZvzWvOFanATmh2dHnjIUJ6BC463RzxGCZG5jg7mvAt1n0AJMQ5w61Kqc
         r6TA==
X-Gm-Message-State: AFuF++lMgS6+so3I1keTXCd6oxIVT3avEdENqi4VS+dsDpCPlDe7gSsA
	nWev2Az1VIbsLrAgmqB7ePwXnFbBI+zotFhqy28/48Pu7JCaTQ6VWy4HUmL60V32eddo6zJjwdT
	GXeZm0dvVNLVFkNxhDmpl7FuY15lrhCu4eMEwKBWtHqNrKeL34G31G9J5XjM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e841:0:b0:6be:19a6:fe63 with SMTP id
 006d021491bc7-6c542a34449mr1007208eaf.25.1789385944367; Mon, 14 Sep 2026
 04:39:04 -0700 (PDT)
Date: Mon, 14 Sep 2026 04:39:04 -0700
In-Reply-To: <6aa60ec9.f81106d8.2ab401.0032.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7dcd8.a211d2ce.1a5198.0290.GAE@google.com>
Subject: Forwarded: [PATCH] WARNING in batadv_iv_ogm_process_per_outif
From: syzbot <syzbot+a079f084653164a652d1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] WARNING in batadv_iv_ogm_process_per_outif
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 50d05c7c76c96b90462f24debacca971d2e86713

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
