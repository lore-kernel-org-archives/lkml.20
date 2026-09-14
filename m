Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7EB44CACA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387988; cv=none; b=rGmK6JScbGc4RHnepIy8gElkMoKZgkyJRS9TrRDP9Wi6YANNe4sboSj9vFn1pswpoNosaiqPRpcJSDAy4gB634wgn+eIWcWCzOW3tKekOf+gnRGpVhI+azkElV4jCfizaW6ICv4JoA8Phq2NXzVF35KZjMV483uXwN3eq8wtI7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387988; c=relaxed/simple;
	bh=SFWE4vOvKdJNCgJd4OxgnkTrngouuBrJVVQYXNV58og=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sNzIb1uTgrSSIcb/jflfQZQWtScnkde0z0VYXAqS54At+JgFvcqjOzrGRJg9n5pcmlXDGf+FA22GYqM7Fe8GA52hPZNc5+hRcgmRRfFH/pGgD8Er2EqR3zzS/YfasBlAx3qNzpz5bZ/az/mems5+r4ilK6rTbyIiIqCsS43viRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1a3f01d2aso4592127eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387985; x=1789992785;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PJhjAO8wj5KM7bDkMwfc/LDj1e8gndB7el/Waglqz/Q=;
        b=hEDcno7nY3O1o/Czv4FEIA/4SB5upzby9O34e6G5pN0Np69AOBmuJHviqGlkxXdwxv
         fnh3egpi6lPajypw6Ra20g3qcX4+dzniVGuNU66sXClFL0NqCl87Lb34LVBRajYsURaz
         89iQGZUbV2EcpMpbPOaiHlz5DoHfunkbsX2PrSIzISMFDrMSZc5hOU2dbKnheUEYeVlb
         UnN+OSG8tok7XDgxjijytAbg/MQaGYzIid3D8F9XUvSpvk23K02Ha2JDQaP2a8mAAxu4
         iXwNh9OynHxW/0w32GcVp9CJj4QIMm2+V5+cHWmNMxOESz9+gj4TjFNQgNd8HEeD4/q3
         esww==
X-Gm-Message-State: AFuF++nBPfCY1jmZ11t4ccNznCba5cj1OYNqG573TPppJsVFzrAxPrio
	luLs6DLbgz9/Y31MTVfWifJ5Vxlg9jJzoxMnOeNDA/SQ2KnOVS3BMHolNp61dRE7wwaFBoeOD2o
	OBly9/nmOSaGvIWsVn0Wg8NcVHwT6WxSOjGGn5VhwHo+nm8EB3J9HmyjKdsg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:80a:b0:6aa:e573:9ce0 with SMTP id
 006d021491bc7-6c540285ffbmr1137257eaf.16.1789387985312; Mon, 14 Sep 2026
 05:13:05 -0700 (PDT)
Date: Mon, 14 Sep 2026 05:13:05 -0700
In-Reply-To: <6a8cf1e8.dbb3a75c.7844.001a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7e4d1.f670cee1.72fc4.001a.GAE@google.com>
Subject: Forwarded: [PATCH] WARNING: ODEBUG bug in vub300_disconnect
From: syzbot <syzbot+f4a0159ce6802a0a4774@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] WARNING: ODEBUG bug in vub300_disconnect
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 50d05c7c76c96b90462f24debacca971d2e86713

Reported-by: syzbot+f4a0159ce6802a0a4774@syzkaller.appspotmail.com

diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
index 2dae474dc..5b30303ad 100644
--- a/drivers/mmc/host/vub300.c
+++ b/drivers/mmc/host/vub300.c
@@ -2382,10 +2382,25 @@ static void vub300_disconnect(struct usb_interface *interface)
 		} else {
 			int ifnum = interface_to_InterfaceNumber(interface);
 			usb_set_intfdata(interface, NULL);
+			/*
+			 * The inactivity timer holds a reference to the host
+			 * and can be rearmed by work items.  Shut it down
+			 * before clearing interface, otherwise its callback
+			 * can drop the timer reference while a concurrent
+			 * work item is rearming the timer, leaving the host
+			 * to be freed while the timer is still active.
+			 */
+			timer_shutdown_sync(&vub300->inactivity_timer);
 			/* prevent more I/O from starting */
 			vub300->interface = NULL;
 			mmc_remove_host(mmc);
 			kref_put(&vub300->kref, vub300_delete);
+			/*
+			 * The timer is shut down, so it will no longer drop
+			 * the reference that was acquired for it in
+			 * vub300_probe().  Drop it here.
+			 */
+			kref_put(&vub300->kref, vub300_delete);
 			pr_info("USB vub300 remote SDIO host controller[%d]"
 				" now disconnected", ifnum);
 			return;
