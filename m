Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB5A361951
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608476; cv=none; b=MJ0+aqE/CmWbzN3OW2U/HxrxtcHrEfHbnhKIajUDRg/4d+texh/SFNiD1Uj+8XttSXxgAVCfk6pjJg429chSxCAadrG/okOOAWqohifXncyIAr/XWG0xBn7PoSXSpCLxSQ5/FBz6I/uWCBHGEIDL1QcOECWKjSHv4B0VHYunEN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608476; c=relaxed/simple;
	bh=yR0UWsmgRCqajJ+HXz0e5DLAKfcdZjncq/mq6J1gNnM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tvICBOB5umYW8hubkSp4Taba4KA3ZptK1dU4rwb2sXGHYpEUWQX35PI93zj5LWzdwqir/X46f8SU+UXnv92Qaib9Foe7gsw/OJWLShCs26f3YbgnDaQj4pTmmE1GrXBlIMAbO43JuE+rVT6Za1BPua4kVNEBi4DfYKXFUXSik/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6bc8f608979so247571eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608473; x=1790213273;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1TjDSVWG2tvvyrrjEiLdJ1gDUoV1XQ3y1I6fJf9AK6E=;
        b=FpqvZ3F81HInVM0YsfCh6q2z5W7dshREojLiTBIv4DLtv2a5FYYalkbcLrO8mQbs+6
         PsKmKmXu0GN8E8N9w6X5UJDf//oXyg0B0DFTYuP0P0WY6Bx8Hn2jX26k56SpSFmVPjVY
         yr+H7ntGXY8oQ7mfGcMOVMBYYKubBIhd2aLWiIJY2tJHZxgmwLz0LojLV9lAe8OO+Q0L
         YX1q3Q87RNFooJlwggA4VyKr3Jyb3vKmM+M+5FnMH7lN5f80SAaRlC5bCTtXRcTapu57
         5Htk+S9vjJOb0gioG/OcvRgX/HxFaL0jRigA5PT+mlmZZpEF/jcR0Q3B2eOMgGsgPkp7
         5bCg==
X-Gm-Message-State: AFuF++k+gEH/IqKGQNzaBKeGDiKDZYIlw5WLZU7mCo76Q9lehr0+PO/y
	SKFo6cV3tygzJh7lSYHZr1Gu6y4TH/xbM+ZBI1OFdOZUe/NokZrydqB7Ww4b0a8l2SX9iIn6Od8
	FOwvKatlwf53dMCjWT2AdHtzJoUUvCQkLiubRLsY5+QVYDjxGcn4pjvy2kF4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b94:b0:6b7:46fc:1d4 with SMTP id
 006d021491bc7-6c7d3fec459mr5165927eaf.51.1789608473546; Wed, 16 Sep 2026
 18:27:53 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:27:53 -0700
In-Reply-To: <6a8cf1e8.dbb3a75c.7844.001a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab4219.87c06881.1db2b3.0004.GAE@google.com>
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
index 2dae474dc..9914c8b58 100644
--- a/drivers/mmc/host/vub300.c
+++ b/drivers/mmc/host/vub300.c
@@ -744,7 +744,11 @@ static void vub300_inactivity_timer_expired(struct timer_list *t)
 	struct vub300_mmc_host *vub300 = timer_container_of(vub300, t,
 							    inactivity_timer);
 	if (!vub300->interface) {
-		kref_put(&vub300->kref, vub300_delete);
+		/*
+		 * The disconnect/error paths have already shut this timer
+		 * down, so it can no longer be rearmed or run.
+		 */
+		return;
 	} else if (vub300->cmd) {
 		mod_timer(&vub300->inactivity_timer, jiffies + HZ);
 	} else {
@@ -2327,7 +2331,6 @@ static int vub300_probe(struct usb_interface *interface,
 	INIT_WORK(&vub300->deadwork, vub300_deadwork_thread);
 	kref_init(&vub300->kref);
 	timer_setup(&vub300->sg_transfer_timer, vub300_sg_timed_out, 0);
-	kref_get(&vub300->kref);
 	timer_setup(&vub300->inactivity_timer,
 		    vub300_inactivity_timer_expired, 0);
 	vub300->inactivity_timer.expires = jiffies + HZ;
@@ -2349,6 +2352,13 @@ static int vub300_probe(struct usb_interface *interface,
 	return 0;
 
 err_stop_io:
+	/*
+	 * The inactivity timer was armed before mmc_add_host() failed.
+	 * Shut it down before dropping the host reference so that its
+	 * callback can neither run nor be rearmed after the memory
+	 * holding the timer has been freed.
+	 */
+	timer_shutdown_sync(&vub300->inactivity_timer);
 	vub300->interface = NULL;
 	kref_put(&vub300->kref, vub300_delete);
 
@@ -2382,6 +2392,13 @@ static void vub300_disconnect(struct usb_interface *interface)
 		} else {
 			int ifnum = interface_to_InterfaceNumber(interface);
 			usb_set_intfdata(interface, NULL);
+			/*
+			 * Shut the inactivity timer down before clearing interface.
+			 * Otherwise it can be rearmed (by its own callback or by a
+			 * concurrent path that already checked interface) and later
+			 * fire after the host, which embeds the timer, is freed.
+			 */
+			timer_shutdown_sync(&vub300->inactivity_timer);
 			/* prevent more I/O from starting */
 			vub300->interface = NULL;
 			mmc_remove_host(mmc);
