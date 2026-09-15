Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F9D3911A2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436320; cv=none; b=JyzTpmdZq6SlbHTcuNTZu1/5Tysz8bVty5nQ1bTtULBozintYezhfNqSrcj227FcKb6yqVbw722A4VdkreD7VOQ15E5bbHP8R2tD+52+l06/JRBmXUk6Cw4FtM3kFDBlDpJLnzjYtekEUPeynxZvk7YHyGGELYgsNoTwFC2QHFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436320; c=relaxed/simple;
	bh=CLfbBL05j3aAxLzUbyhrnx9Yz5JIezWJdHfvrfAo5Uo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UhjhUczpkC2sPAkTBX7UC2iEc8Yqy7sQWz7lfPw94cJgSK1jh0E4N8yAuIcpyZ7sY4aVE1eq5DMvUVuB35MEC5DTUasFQTztRzXJhIJKqtMBoBp/zC8WgfwmEGfCZZ1f01I4p22BzbNymnZzDGYIC+Qbk+5R/kCGdi4+qY140R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f8931a803cso3641116a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436317; x=1790041117;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xE0sVEC5zLeRxO/4f9z/b8UsRRSCNuuYvphFDGjk8m0=;
        b=KB3ncvyWfH3GuCjeGGKneBAftNPITcH3i0VZjxKSOTryDgjdXpzy/mR4o5Pcd56Rj+
         mhyKOIFbFeNJ2yN1lNz4vyqJAdrGui5ciAvDA+UgeIGvJ/YqiPCsE5qJqe0u1c9vqyNF
         hMJUmagwyuFKpkFEUN+Mq6lJ8l7aQQFh/Aw8PQHUFcO0xloPr+evq6ywRSd0Yh8RMgfs
         yAmQ+BsJswOl1mz0mehb3fpsPioxVXPxNSRx3wniqSTtLxS1BylLSuVm6l3YaAkPGYbC
         VjKbWo3dPTdBPwn4hkZMbDI5TpEK0Yu5TlgUkw/wcuiochj95CZpJNz/F77M1y/3BqSl
         6qjw==
X-Gm-Message-State: AFuF++mGbTIfH+xiTj/WSlbSPo9jRDINgCaiBbD6g9QkzOugvyLqbRXl
	+lej2t+rw54UYVib0k8vlKXxsQQSIv59CFUxSCzl7TGlAYKv8I3RogUj9IshR7qT60eaFrTlnaK
	6bdytsKyH7qFI1sq5V9Bcv5+UCalGCidAsBpumwbvUyIL58Z9QiHzRgQnx8U=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:60c:b0:6b7:46e9:96f4 with SMTP id
 006d021491bc7-6c540e65f16mr3078365eaf.36.1789436317437; Mon, 14 Sep 2026
 18:38:37 -0700 (PDT)
Date: Mon, 14 Sep 2026 18:38:37 -0700
In-Reply-To: <6aa316b2.f81106d8.2ab401.0014.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8a19d.f81106d8.2ab401.005a.GAE@google.com>
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
index abaf108ac..4c068d613 100644
--- a/net/core/drop_monitor.c
+++ b/net/core/drop_monitor.c
@@ -516,6 +516,15 @@ static void net_dm_packet_trace_kfree_skb_hit(void *ignore,
 	 */
 	nskb->tstamp = tstamp;
 
+	/*
+	 * The tracepoint can run in preemptible context (e.g. from
+	 * tcp_data_queue()).  Pin the task to the current CPU before
+	 * dereferencing the per-CPU pointer, otherwise this_cpu_ptr()
+	 * triggers a "using smp_processor_id() in preemptible code"
+	 * splat.  migrate_disable() is used instead of preempt_disable()
+	 * because the drop_queue spinlock can sleep on PREEMPT_RT.
+	 */
+	migrate_disable();
 	data = this_cpu_ptr(&dm_cpu_data);
 
 	spin_lock_irqsave(&data->drop_queue.lock, flags);
@@ -527,6 +536,7 @@ static void net_dm_packet_trace_kfree_skb_hit(void *ignore,
 
 	schedule_work(&data->dm_alert_work);
 
+	migrate_enable();
 	return;
 
 unlock_free:
@@ -534,6 +544,7 @@ static void net_dm_packet_trace_kfree_skb_hit(void *ignore,
 	u64_stats_inc(&data->stats.dropped);
 	u64_stats_update_end(&data->stats.syncp);
 	spin_unlock_irqrestore(&data->drop_queue.lock, flags);
+	migrate_enable();
 	consume_skb(nskb);
 }
 
