Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628920;
	b=pgchbRNUlb2a0h+3XkOpefBsGgjtWy2gDdJftQKCEcMKVRWGda39i0I5cAQGZwDHpsbb
	 7eSehDEm+1TNd04Vo0mIO9E6chAVJltkUvmZ5oLih3pTQzm7K8fQzfBdRdyy8IZrmbQrx
	 ngGA3FE90IbdRdl+LuB0yy2yoQkyKU6lAd0mqhZL7lCLz+dje9TyHazZaSO9QIzfxuM84
	 wPE3h7J39xQX/Sd16xIkPmV45mnWyuY2KyfSfbNpU+egXmEY3UDbsh32Ahfz479QGZnxg
	 4UqIKvbyzdfbduW+XjD5oBHVmTYPRZmr/2EZ+pc5I4fl6Zn/3SFSbblX1sfTybVs1KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dJnJAQ1J2840u9KECjcYuFBU8CaqLFZXy5w57Y9rz80=;
	b=H7rK2c84Sek0EfEh2bcOqe3jl7HxXj8yj9fug6XCpVX5tgBpaFrhlfCkPXKgMUQZu+7a
	 EUHl8nKS0LZVrpkzieHChhMg+JUtIqho5eMhwr6RDVVrxR8TB/ZFydLpa1Du3uaDhA1W0
	 ADnlkhkwIwFZmsfMJYq58uhWj/T+9ECpUZP1jUFRreSJpkeEr2QQxB4YC1DYdQ05oNBcR
	 q/uMcfsJs2U5LwdVHcFrgEWebvEs4VrnyPUTKbI4zQo88AfcdJHiy6Vaawej1fxK7Ikr7
	 prUezj59r+rwCbH4nqPKP+VIQsrmTSQi/XI5HvGQQ9oYbiQoU0hjXFvNuBS2jcc0FzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GeW8WrUu;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B632B60A5BDF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B632B60A5BDF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GeW8WrUu
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-369f33df08eso6060445eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793628919; x=1794233719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJnJAQ1J2840u9KECjcYuFBU8CaqLFZXy5w57Y9rz80=;
        b=GeW8WrUujR59h00XP6jNTP+Wt0lM56WwyHsMC3BFEQTbNiclg6QXY+aB1ec6M/knRP
         UryPPYSl+I+hMAJBIlYiRfueEX9cMTn/3FZsM3TaZOVLiGlurR92qNXQ3iBQqjG8aHmd
         FEGWr2LW7n/vy/5TStf3UVecyBw/rpPLAIXmmwF42qQgRPozqOBPwA5C5s8adMHoHq8A
         v1p75IzDXdUn5W46wZmNe81GOCu6BRdFoUXb1llsAaP2ElDqunp31BhTaoDG/65Y20ww
         PPus7XtRfJda9yGBNpyRJroFWM7A7+afqgiBlXaqxzFCwTgDEFq8ZG0z87b2Tl+Qfef7
         ZpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628919; x=1794233719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dJnJAQ1J2840u9KECjcYuFBU8CaqLFZXy5w57Y9rz80=;
        b=stH4La8n2goDa9pZIzRM2Ys+58cgjjC823gdzy5N9/nuCzaWIRlwet/Xx+VSbdtxsP
         JdfmPPBagDSy83wwFkjtnRTJBwb64JiPJmpvo9bygw94q/5hFuhd1ee4kW482xioet1e
         jFS4FuWBpF0Ka4QHS5YNCFp6MvK3awXr7BiL8ZPp405W09pI92KPUOg94iUIF5Dfsz4n
         teGX5rptWzIUm9xxU/hZxhUgq6xuzNJcXrE+HnrRuFD6r0+jb+X/3EkcnVKb+9qxWUeQ
         esLqrCsgleefYTQeYojQ14qmpkNz8qvJAayBpEBTQ3fGBaJlxyaoe9CspvumgBLZWxzC
         712Q==
X-Forwarded-Encrypted: i=1; AKwUvBzBdsjpzW2/2nGjAWKFjEj20qMZqMjwhNSn28IaQIF/B9hzqaXYJzgRfbtM5/5zA2ALjNPulppnCQch+es=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8jrZTNehN2h9SrENUqkP6Qt70eINdbFIzOBu3h4u6KmgvaIPh
	RMhujNdLYt1LT8SczDtS+ZFgEJ0mDiiTHEgcwekkX22No9Ppz6C6sXib
X-Gm-Gg: AYBFou0dvBZatp7g6yG0BWrBT56ytSfOl1LRveiNUyNBW7vYTSrVkCCetVDw7SH94Wl
	glCkQKEsNX177fnDHm2uCPul6UX9qDr7ave7hRtYuzDW1q+Phgt9aNNQKdgQa40jukGYby3ieQP
	l4Yu+xvg4joE+wAxDPXwrQ+avNNrWSwgsiKNvWI3N5ub7nh9xsx6LHGRMEXEz6T3GLLG1U1UNjv
	dUe2AxU1hgzDlpzysR2oxsg5sQxqn/dCnP3LtVMxDpGJH6JWpvtj3cRuCUqpGjv2U3fwaB4/3vI
	SH0l09HTN07jedr8iQ/4CVulHnUE4ZZk9pQBjY9WOaoa+TFZ8sSg6A0ckYX7s/Rb6LCCR0YnuJx
	mkZdpRU58dqEDNy7spAWWj3zzqyP1U78WxomtC7lobX7OzvmTXPpRmaU+ZyXd/ocsiH4M6ONK05
	CPA8iikL6xBz/pYRhpBupeFrSoHw79DzpLiqKrHH6GdcLjvigD+Wwzs2GX30LLzq9LAuw6QWo4F
	Vt8Mp4HvvH2HavFaBCwRhcnMZz97OMTnfKM+At7A5d1u1ffqdD98llfvd18j/auCPHCbZ2wUUYH
	WqFUZz+48jHpzd827RBSdgchFs2Cq1nY2hBhCf7G5gZRcVR8I9hmes2CcngJdn3Jg5MY3s34Hb9
	wIMAUBpgT2NyltYcKtFESU4yjTYB1KVTVYkEBzeBri9tVnjCv/7j31wDUfm4LZJh9UBjR8K3I4G
	Xn
X-Received: by 2002:a05:7301:1a01:b0:369:f85c:787c with SMTP id 5a478bee46e88-36a4236a1d9mr16692157eec.10.1793628918760;
        Mon, 02 Nov 2026 06:15:18 -0800 (PST)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:9626:1a7c:c4cf:3e3b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm33556442eec.10.2026.11.02.06.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:15:18 -0800 (PST)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] media: mc: fix race in media_device_unregister_entity()
Date: Mon,  2 Nov 2026 19:44:39 +0530
Message-ID: <20261102141439.13505-3-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102141439.13505-1-kartikey406@gmail.com>
References: <20261102141439.13505-1-kartikey406@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

media_device_unregister_entity() checks entity->graph_obj.mdev for NULL
before taking mdev->graph_mutex, but does not check again afterwards.
If media_device_unregister() runs concurrently (for example on USB
disconnect), it unregisters every entity and clears graph_obj.mdev while
this function waits for the mutex. The waiter then calls
__media_device_unregister_entity() with a NULL mdev and faults in
ida_free(&mdev->entity_internal_idx, ...):

  Oops: general protection fault, KASAN: null-ptr-deref in range
  [0x00000000000000c8-0x00000000000000cf]
   ida_free
   __media_device_unregister_entity
   media_device_unregister_entity
   v4l2_device_release
   v4l2_open

Re-check graph_obj.mdev under the lock and skip the unregister if the
entity is already gone.

Found while testing the fix for the syzbot report at
https://syzkaller.appspot.com/bug?extid=54648a6c1187a7ef46a6

Fixes: e2c91d4d78ee ("[media] media-device: get rid of the spinlock")
Cc: stable@vger.kernel.org
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/media/mc/mc-device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index f8ea7cfe10b2..039ef7d04ac7 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -674,7 +674,8 @@ void media_device_unregister_entity(struct media_entity *entity)
 		return;
 
 	mutex_lock(&mdev->graph_mutex);
-	__media_device_unregister_entity(entity);
+	if (entity->graph_obj.mdev)
+		__media_device_unregister_entity(entity);
 	mutex_unlock(&mdev->graph_mutex);
 }
 EXPORT_SYMBOL_GPL(media_device_unregister_entity);
-- 
2.43.0

