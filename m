Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D8B1448E0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608338; cv=none; b=A9kbmHIIDDqciIvS9jzpG3W6b0IZwXB6y4fsEnhwSsgw9hfGdrpNaDDj5Rh8ykdCNq+wqn7Q9sqVqYrTSPjmZYKMnOGrsGO9B7J3WuW2XJ3+HRHC8q69zinIbwOcxMFrO6xybh0M/Hirf1dy8Di6whw5G6BN1xe+U4UYisOoztk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608338; c=relaxed/simple;
	bh=mm4+eemLchMwVS6uvq/AcYthnGrFWYoczEeRtjgJt0w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=phou4+3W75G+fN+vGsCfbB4Lrd0doaaJgJzDVOAONIGTaw+QdY/uByzXOXhm4tZZGZ4hgqyWFa4tKnnRglXvejTvujV8QSIEhBdTBMo5jhJ9fiblo+PJ6t37nX94tRrozZnljyJR5ILpDNAhrWFltLez569t0PoSkT1aeNOmPwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c153bab4c3so368850eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608335; x=1790213135;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WcIO/9fkMsI8qpUyeC4I8Q6Q8jYIr+yU3hCj0DqfTlU=;
        b=Wq0ZYD3xknmJ3PEYvSm3KD1aNM4PJMQ/LPQE4/srfyHL7Yf3c3kYC5GEpGZctqsBtI
         a5049yFtIfc7YQHkawC8RK2rQ2fxvDUfz/T7SfzqKsuwyNvsipRCHl39RmQTfM3Cpn30
         a2XoFUxGklgb4j3azEMny4Cilu0JFGRX1apbkXujK3tBaU3lWDQ8HU2Hmjb/3aK4P2mm
         2evdSjWLl/o7TySoCgIiY8A5kfIyUMVne2KQ6FJG53Mm15rhTphmDeJQMt98QWPlhdCt
         No0TdWmglw8/Eenb4DHAli8P2ODkrJWvhSeOwOZKXRDpjc3Mu2376EnrSj1VVu6y/8Mn
         dumw==
X-Gm-Message-State: AFuF++k2wS6umx0eIWT+1xtzg53JfPIjDicGPfD+BKgepKi949yUUrZd
	qAdZNJCBky37/m4FXZYMib1lNMF9r/kuA+9i47Z8RCdw2lLYItnyM4HGodZBnpzsp/WwWV03mty
	6bv93Fgkuuj+nOyqlLl1VMOOp9NGYClRR9N9Az/eh4LHx/UOEXYS9W7S2JNY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1622:b0:69d:9dfb:7928 with SMTP id
 006d021491bc7-6c7d12d21e5mr5072235eaf.3.1789608335700; Wed, 16 Sep 2026
 18:25:35 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:25:35 -0700
In-Reply-To: <6aa60ec9.f81106d8.2ab401.0032.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab418f.71f81b7d.278072.0006.GAE@google.com>
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
index 53fbdbbe8..1fc9dead9 100644
--- a/net/batman-adv/bat_iv_ogm.c
+++ b/net/batman-adv/bat_iv_ogm.c
@@ -1410,9 +1410,13 @@ batadv_iv_ogm_update_seqnos(const struct ethhdr *ethhdr,
 		return BATADV_NO_DUP;
 
 	orig_ifinfo = batadv_orig_ifinfo_new(orig_node, if_outgoing);
-	if (WARN_ON(!orig_ifinfo)) {
+	if (!orig_ifinfo) {
+		/* This allocation can legitimately fail (for example under
+		 * memory pressure or fault injection), in which case duplicate
+		 * detection must be skipped without emitting a kernel warning.
+		 */
 		batadv_orig_node_put(orig_node);
-		return 0;
+		return BATADV_NO_DUP;
 	}
 
 	spin_lock_bh(&orig_node->bat_iv.ogm_cnt_lock);
