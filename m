Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D578D443AA3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385420; cv=none; b=sNCztVbSGNpdh1Y4FidrQCxQjbdC9rOv5s88mU5QGqS9uqWDXwMlpfulNThPw0oyNxvbK3SY6+AJstiDK1BdoXyZX8jbbJmGA3xGHFoJA/0cmVyxNuaLowMg+qGy4KXBPlyyKwbvWRLDeHPPjVI5Did/BrZd8xh+r+W3kRfFM7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385420; c=relaxed/simple;
	bh=n20Ba5LUQL7bUD+JlHlCQioYJNI0zR4FOqKw7owM7Yw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XB8qqyVpZns8DNDaJaayf2VN+zm+NKiuyULqgiTiiaQgSxkHmeaWdeOn2sOW9/WlmocfLRrgEBn1a4DlWQskHNzBgTAp3xSeIxmj75jgEsBBQoxW87JZKZeG/b96tRbjMMBiWZ5vnmTNZSnkxPypggz9C+VKMZGha2NOFfPR8S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c324a0c0faso1708386eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385417; x=1789990217;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rCSx+1bt0iswccXLvZttietBc0iGWkJz4IAHt5J1XTU=;
        b=bTtSSf4iEk0UpEgWITx/ooEb2dl4sVHtRs1UAYqRGQ+3MXRvTG5GfZSrb2XlUpaQ/8
         zgTTkLGFW/JROY4Ma5Z3RpqCTr18wiHjyKKoehhyFTDOAAne/79J1qOOAe1aiZLej9Sf
         D2Wj2BRq0XjhOhn4YrpX4iQM501gaJEMxI7qeNfQHHiKF+d7QKfDlFcNDYnqFcQ0mMGc
         y5JYHZNOkUR3B+vgdK33JXHVj+ZMoZb9A71e0JC1ee69rOy1BukMPVQDYu1aWlFYzYSk
         wDb5f/tX+PbiK0wqJSd367qnvScg3AOXQpq02SL8plKEvx44FUqu7HivjVY5npAmDnlk
         gK+A==
X-Gm-Message-State: AFuF++kWjzLCJP7JLmJlgPdkJrVpIZCXTrVXgvRcu7OiPU3h+0DRrrLb
	/wQTZov8UNCJDePr81Nek7oYA8yws2tGzxEQLi6Jdj+MGKflm+MhosB3gXnLO1u+VtDbrWYA3Hc
	UKqGfDIH0QcvD7APA0+ytpoEgDIEuhoyclGtS7vWWj7sdDw3vrlG6L/NaNuY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81c5:b0:6b7:8415:d77e with SMTP id
 006d021491bc7-6c541f45b3bmr824865eaf.41.1789385417248; Mon, 14 Sep 2026
 04:30:17 -0700 (PDT)
Date: Mon, 14 Sep 2026 04:30:17 -0700
In-Reply-To: <6aa316b2.f81106d8.2ab401.0014.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7dac9.3aa11909.1a03b8.0083.GAE@google.com>
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

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 50d05c7c76c96b90462f24debacca971d2e86713

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
 
