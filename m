Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019388;
	b=Ql09QTUZu7yIkqJo/HqRfLuBvuNRzEMf3WTbVJocA0CxS5b1osQVFTvKiOsOJgd4psFp
	 caVG/Bm6mPnYcRo6BbDLDDy30nY1dlei5bAcE4CsX1LD4O6qwyNZVaWdupcpLpNV3zmQf
	 YwOUORlDKfXzVE3LQPXyIsa376M5w7gBp2ZWc7OYTKgvgII4ePHbpbOcRJy9X8OCYj/Cx
	 atoSiyYbb3ueU5RswkcoSwCBkwf3MSflp/V/pRHKOjAcgAxBGOmIGtARPxH9xxDF9uJ7C
	 MRKbYY8fkmD7KqM3sSVbi51ppQJUvsXIGzU21kuJJiLNVeH0u/Z1ueSN01eKnIsJ+Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0cvF4uGnfYD5BmL52HxsvJHeronVQjYX+vlkZjUvMG4=;
	b=NgGz8la/95TY816ODnbIXmkuP/iRadg3h7/q5PrJ6UDLa09gTq7mq6whtY0/RglYV0GT
	 twDBSFyDKm8DSgk0gB2E7h0uowwHT1+5I1J+sDvrafcqkooG3d58up8H2dRiLj72pgxfM
	 Rjg+x8FQefELzJqX6KXP+rwiVI2mI+feVgHYf2MQ/H/6ydfXRXpljGrE+/4F2atRPZVmS
	 BBG9/DlSqAzxaCBye9vtfSqjtL5HaHeazqlwaZ5b7wb5AemFJXQtkPAx3VwENv3kvjsna
	 thsIuCAZ11RiVlxJUonI8SJNHvUji28K4upLGAAamGISAIiHwIMDHIfrjwzt7pghbvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U64+4M8I;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF10606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDF10606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U64+4M8I
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so1248467b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793019387; x=1793624187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0cvF4uGnfYD5BmL52HxsvJHeronVQjYX+vlkZjUvMG4=;
        b=U64+4M8IzJRq319unPs7PjufUZb9hmSDBsTDPpTcRvoMEHqdG0DtaOnYwzTOmgRxlN
         jjHZELSBz0AOSIE2obncS1AnFpamdtlXTZSvifC6GvjAG/uiaA/izUE70bgjuaUMFeBD
         8DK0XuB3PtEi2ckK8hAW0FAu0x8OWYiCbZrsiYyfus7YhZrJEd0lixrqougE3Lb3nC4c
         aKOhPPKjUIIoOQJOHfyjJMrgpxxyEocM8VySugbHAJ2pcjiggrl6c78Hepte+/f5VxFN
         is71wp7MB63Yx55uSDvtrisZ69/hymvfP90tFlDKCqBkxkb/u3131Sq0OxB7PJmKDY2n
         pgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019387; x=1793624187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cvF4uGnfYD5BmL52HxsvJHeronVQjYX+vlkZjUvMG4=;
        b=Ij7pVMIX+JUUg7H3BkOHPx97F5v0tE/kuZ+7j4Oq2LAU4G1Gktbg3KU3o7nHOrDGB5
         dRGeCmHY3XMqW2nr2DCnxdxm7cL+WrA/sdtbiw7zB9n+3dgVj+FT5dN/rUSazmykEe4S
         t6glYJ/Mu4DVK5Mx2hjvI9r8sW7eE5LWEm/tpLbZnKhfa4dQof1v8QtE2ovQyAgEi86C
         19CnehyxKt1O8djm8+vqctglvd1rPVZsWFJKctekc0SqL4l0XwRY7w0N0Qsvgsdp/afq
         hHMeX20DQO1NFXk3yAE/PU2/gRf+uYe8W+u0ZYnqzLlIo1OrFyKkp5BezjHwVV+zv9IF
         w0dQ==
X-Gm-Message-State: AFq9FYIr1jL2HcWe0TMWE0PfD9yKZjWkNvmAQCxhS2GGnZOepsDTcyD+
	WNJo7xSaMHo+JryPf0OAyY8En8Ptw7ZPgoIzQdi0BroJmG+nrN2Vf5JF
X-Gm-Gg: AYBFou2selVwSZTLwaa8gSkGFWE78PjOPgOGnEm2wjdjrH4J7zEwgFZu2cn5h9zj5Il
	xWZN00aKSt5lxn0jgk4qnjYdsNLCPiylEhHXAE7WeHdiglBRwrqOAw1CKewvqqFCE8g0fyk7rPz
	HkdAksHG23rhBFurOnBy1b0YsTZfg0GwTfRP0khafGvN6AN0+MbbZ3izCyJQj48RbBklNaBp5jY
	6+AphYAGuS7cPinIaxvKew5KsTAOE3+R8VTQ2yVXg9pW2nxFcv/Z7X/1U+bI7nu2PchWkZlkycn
	XQOgt/tAiGu/V/cvOkqJrak2Ify9xuDyHYfqquSOvOgtQCN21TnhU7iuc6lJgC/vwadqyWZmMyq
	EYbbwvL/97TnSC+yZc6ZVJduIkXE6Q+VwUqqNHgJ45qd4VsBOOHwLnB4SE4PAa41wlhhEZu9n9U
	XWBOZVumDae/K4817hh96BcteidYd7yt9OtMdWjn3I7JPWNtyx7iupEICl+goAqhzQiQsYo1wIB
	ZCAEfWxQ568z2iE6QpQq6p7x2uBS21IVGHtOsbbwabFpNIH6qglA4K/EAsar+bctwIINecEBoBL
	6Ts/+x9t0j5hb7OxAbbwbSGzSZyw2pp73E/nTGM/TAqNR182pNkPTFPi0sPH0v2wzpyhohSV04A
	owvl7FCjgqfeP8zh5/l63YIkdVhfD
X-Received: by 2002:a05:6a00:ab87:b0:8a0:1bc5:b172 with SMTP id d2e1a72fcca58-8a36da51da4mr3723560b3a.20.1793019386869;
        Mon, 26 Oct 2026 05:56:26 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d87afasm1336811b3a.7.2026.10.26.05.56.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 05:56:26 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>
Cc: linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [PATCH 1/2] most: configfs: serialize mdev_link_list with a mutex
Date: Mon, 26 Oct 2026 22:56:06 +1000
Message-ID: <20261026125607.73453-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
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

mdev_link_list is a single global list, but it is accessed with no
serialization. mdev_link_create_link_store() adds to it,
mdev_link_destroy_link_store() and mdev_link_release() remove from it
(the latter then frees the entry), and most_interface_register_notify()
walks it.

These run under different locks, or none. The create/destroy stores and
the item release belong to independent configfs subsystems (most_cdev,
most_net, most_video, most_sound), each with its own su_mutex, and
most_interface_register_notify() - called from interface registration -
holds none of them. So a create_link on one subsystem's item can run
concurrently with a rmdir/destroy_link freeing another subsystem's item
on the same global list, corrupting it, and the register-notify walk can
dereference an entry being freed, giving list corruption / a
use-after-free.

Add a dedicated mutex taken around every mdev_link_list access.

Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/most/configfs.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/most/configfs.c b/drivers/most/configfs.c
index 8f5158d..307a62c 100644
--- a/drivers/most/configfs.c
+++ b/drivers/most/configfs.c
@@ -34,6 +34,7 @@ struct mdev_link {
 };
 
 static struct list_head mdev_link_list;
+static DEFINE_MUTEX(mdev_link_mutex); /* protects mdev_link_list */
 
 static int set_cfg_buffer_size(struct mdev_link *link)
 {
@@ -125,7 +126,9 @@ static ssize_t mdev_link_create_link_store(struct config_item *item,
 	ret = set_config_and_add_link(mdev_link);
 	if (ret && ret != -ENODEV)
 		return ret;
+	mutex_lock(&mdev_link_mutex);
 	list_add_tail(&mdev_link->list, &mdev_link_list);
+	mutex_unlock(&mdev_link_mutex);
 	mdev_link->create_link = tmp;
 	mdev_link->destroy_link = false;
 
@@ -149,8 +152,10 @@ static ssize_t mdev_link_destroy_link_store(struct config_item *item,
 			       mdev_link->comp);
 	if (ret)
 		return ret;
+	mutex_lock(&mdev_link_mutex);
 	if (!list_empty(&mdev_link_list))
 		list_del(&mdev_link->list);
+	mutex_unlock(&mdev_link_mutex);
 
 	mdev_link->destroy_link = tmp;
 
@@ -392,8 +397,10 @@ static void mdev_link_release(struct config_item *item)
 		goto free_item;
 	}
 
+	mutex_lock(&mdev_link_mutex);
 	if (!list_empty(&mdev_link_list))
 		list_del(&mdev_link->list);
+	mutex_unlock(&mdev_link_mutex);
 
 free_item:
 	kfree(to_mdev_link(item));
@@ -679,6 +686,7 @@ void most_interface_register_notify(const char *mdev)
 	bool register_snd_card = false;
 	struct mdev_link *mdev_link;
 
+	mutex_lock(&mdev_link_mutex);
 	list_for_each_entry(mdev_link, &mdev_link_list, list) {
 		if (!strcmp(mdev_link->device, mdev)) {
 			set_config_and_add_link(mdev_link);
@@ -686,6 +694,7 @@ void most_interface_register_notify(const char *mdev)
 				register_snd_card = true;
 		}
 	}
+	mutex_unlock(&mdev_link_mutex);
 	if (register_snd_card)
 		most_cfg_complete("sound");
 }
-- 
2.43.0

