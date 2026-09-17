Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EEA30C171
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608184; cv=none; b=u2ekZ6MLB4N5PdNFPflvqShfmW2So2ptYBxnB0LyzBSmqkX3XOXvlSgntnkEBsVZf4MKlu6w+cJbiysQwmI/+WjE9hEQH0uxGnA/sVxj6giIGNhGft+5WXVV58fPDN6j84PG3ZhrIanVlfQxJ8YwEA5356hg78PPaknVKerevH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608184; c=relaxed/simple;
	bh=bRHwuDiM0H+AOik/+PatnIdFRV+zYS+su9vMQ5AlVUw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=K8SAeT86ockaARn7ghfe2W+V3m+Fc3v+fDdI0ovXU6WThfuCoLQcaWYEmJUbHcoszaVDUsodmWBni6Ag5hyTCgPdMreOHF0ufiE2rQgKjOxrVuQfzeJtx2PrcEiNHMNtqxezrKFVvMjIYKgXER850oI2sivSOoVLuGRv82CDlJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-80139a2495aso508768a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608182; x=1790212982;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JnJ2UeetHuiwEj+8+qNThZ9hkulVzsOJH759TQUDwVI=;
        b=mhqsYwPwE6C4l4gOr1eMmQbO/I1GRmPaSuAz60ys8j/c6OmWngSwm/zWoXuEHf+Rx5
         OUThOsTWfZE5imVzmBg+VuzWaZ9A11evY8Zk97T8xHnWuVwPjDCpe0L7xEBQEiJTZOFx
         2bhDB8rnTKOpR+5jaoBP/wXYCUbcq1IV+2YOmV3vAVpBioqjRlx1fyJcHs/3Xo9T39gE
         eG+p+USsnKNqCXkuU4t6TT2V41SGEouGV7ytEt1cIwBf9j/m/ruN+yVF/p07t3Czfy+E
         yYcVf8lDdveSzYljnzGNT5gFM4losJvQBGGmgfX59jiHiHW4DHny+2b+EGZzMnUErtj5
         2W6A==
X-Gm-Message-State: AFuF++m97VD/RqWaLuXGQ7TF3VlzwPN4cnZAfhGNPrGu8qMai6mIMfoT
	RPhoXpZtIgLZl/aewXtHVCPaPANZJVOl0JZelR8qoMxoHzPURcRy9Pfn35qBVyTODvKrU3YwYMy
	pGTQLRRlhn+TjjiOwNfQi54gwa/tcrROj3vuoCVTmYwwyR3mP9uPa/l7NLTk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b94:b0:6b7:8415:d792 with SMTP id
 006d021491bc7-6c7d3802690mr4308105eaf.61.1789608182035; Wed, 16 Sep 2026
 18:23:02 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:23:02 -0700
In-Reply-To: <6aa316b2.f81106d8.2ab401.0014.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab40f6.71f81b7d.278072.0005.GAE@google.com>
Subject: Forwarded: [PATCH] BUG: using smp_processor_id() in preemptible code
 in sk_skb_reason_drop
From: syzbot <syzbot+dc57fd6722deb17e92af@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] BUG: using smp_processor_id() in preemptible code in sk_skb_reason_drop
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Reported-by: syzbot+dc57fd6722deb17e92af@syzkaller.appspotmail.com

diff --git a/net/core/drop_monitor.c b/net/core/drop_monitor.c
index abaf108ac..80b56a47c 100644
--- a/net/core/drop_monitor.c
+++ b/net/core/drop_monitor.c
@@ -516,7 +516,14 @@ static void net_dm_packet_trace_kfree_skb_hit(void *ignore,
 	 */
 	nskb->tstamp = tstamp;
 
-	data = this_cpu_ptr(&dm_cpu_data);
+	/*
+	 * This function may be called from preemptible context (e.g. when
+	 * kfree_skb() is called from process context), so use raw_cpu_ptr()
+	 * to avoid the debug_smp_processor_id() warning emitted by
+	 * this_cpu_ptr(). CPU migration after the pointer is fetched is
+	 * harmless because the per-CPU data is serialized by the lock below.
+	 */
+	data = raw_cpu_ptr(&dm_cpu_data);
 
 	spin_lock_irqsave(&data->drop_queue.lock, flags);
 	if (skb_queue_len(&data->drop_queue) < net_dm_queue_len)
