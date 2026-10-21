Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792581961;
	b=R639LOWGIsB+VNq76ss70HeNWM4+YH9myg8tjfKXXfbrzfZML8mJ0EHeRd9wqG9fx9RW
	 SrqYfNXWRmJYqZNf7dysVnHycC0XjgfEwvbmGsH4rLvJLw3xWbrxk6QOuVR9qF5ayKMZ7
	 fHdj4xWSJWXPrdkjW0YOsldstg3ZVmKXfDuqQbSORopt78ERFcvYZrNYZnaMH9R2HUjoy
	 IASeB+0SLDZ9ZNSqgw2j3keLlt/hLTAAMwBetOudKfZtqUNBLOc0wST9mOL9crcOZWDSW
	 sf8R2p5CyjAyKVLUQxWTh2ij05wCTS9+q4kWz59Cl3G9pleM7W5TARxenPhX/fyZERg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792581961;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=6jEATPpBfvXDLCBD5npW10TOYrdqKDs9kxdd1nyv/hM=;
	b=DGzWw0jbSx7GWbqMtnIey89ozxFY4HuvZNi2Nh2+b3JA/5o7JZAoIO1dduhwav0mZlHi
	 gypPqVH8npywBiENpXaxFFMz4Rb4AztFOimlh30V5l+BfaMF9UWthRhaYcBLkC8uBIe48
	 uRTgTgQi99Zdl3WVawQdX745bv0BHSm4sQklSZo9l/5bVjkeLKliWxCJJDzOYbCa4w3FB
	 It9236HO5+sXrL6tIgSmc47WJxGhFqZt9c7YKD+FSFz5J83r6GEg5QFt4Qi0EmEenI0M+
	 +x5ROW6AcY5gGl77FFMn87Pp1RLCwnz8A+76XOWo1HJ0vTPythJRc77CLpIZ7OCcA4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D482D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D482D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-83edc5c5ae9so469820a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792581960; x=1793186760;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6jEATPpBfvXDLCBD5npW10TOYrdqKDs9kxdd1nyv/hM=;
        b=uoMwwi0K5bHLsoTfmkKllisoiB63Lye4uPdZe1tMiDUJ/6rM9gKUiCEIG5c247Laqf
         SMz6PSMRgrF3715/8R1goYRle9yIY54YF0E4zTl2i80sVgm3TPWkrjbMUT7U+yP6tWBH
         WHElKCQrfJE7I+XiBUqTgKi4sbFVfPM0QDpIV/o5VjFnRpddlD262OVnvFF/w/xuG9Mq
         5wP/YDbxhx59w2Dca21C5336XExN0MRUHxNTG5WLd//OxUb9rbWmtv1Lg7f6G2kfkTQy
         GyH+z2BdA+oJU8R+TiKO9TWp4rdBA5TP5VHI3mg/fnVkr5jgzY7PUETCncZg2YEaNlXK
         M6Kg==
X-Gm-Message-State: AFq9FYKvXK/4A2QQizgvUqifPZBap98bBEuu55O5PjnX0AwsAFQNPaaY
	mD+J/23SbvJYCsznfRwI8r9VutRVkVTZwaQkk/c0MBZL9RIsYErChcAYfvApE/CMFKWn30AQ7Wa
	9aHweARJtPL3YMm9EtW1EP78BQgN4DmdWpQJzhwgS4ycHnAF+BVwVRFkhvBo=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bc6:b0:4d6:92b3:5c85 with SMTP id
 5614622812f47-5535dda6046mr878882b6e.66.1792581959880; Wed, 21 Oct 2026
 04:25:59 -0700 (PDT)
Date: Wed, 21 Oct 2026 04:25:59 -0700
In-Reply-To: <6abfe679.b50370da.302ea9.000d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad8a147.e74039fe.1cb511.0004.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [wireless?] KASAN: slab-use-after-free Read
 in tasklet_action_common
From: syzbot <syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [wireless?] KASAN: slab-use-after-free Read in tasklet_action_common
Author: toke@toke.dk

#syz test

diff --git a/drivers/net/wireless/ath/ath9k/wmi.c b/drivers/net/wireless/ath/ath9k/wmi.c
index 4a08babb6d9d..c60c8b63623d 100644
--- a/drivers/net/wireless/ath/ath9k/wmi.c
+++ b/drivers/net/wireless/ath/ath9k/wmi.c
@@ -118,6 +118,8 @@ void ath9k_stop_wmi(struct ath9k_htc_priv *priv)
 	mutex_lock(&wmi->op_mutex);
 	wmi->stopped = true;
 	mutex_unlock(&wmi->op_mutex);
+
+	ath9k_wmi_event_drain(priv);
 }
 
 void ath9k_destroy_wmi(struct ath9k_htc_priv *priv)
@@ -148,7 +150,8 @@ void ath9k_wmi_event_tasklet(struct tasklet_struct *t)
 
 	/* Check if ath9k_init_device() completed. */
 	if (!smp_load_acquire(&priv->initialized)) {
-		tasklet_schedule(t);
+		if (!READ_ONCE(wmi->stopped))
+			tasklet_schedule(t);
 		return;
 	}
