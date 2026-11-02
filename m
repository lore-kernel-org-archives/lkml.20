Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634309;
	b=BgtsxNg/YNvgnVhFQFTqXMq/sxZoADsclRuzv9eGIi61S2aelo3ruQxM9Wd6ee6T6/mp
	 uaKaMMzEOXuSyQWeEhq8y8enAa/iUWzwIeuWtY71c40BRyGuysDy1NpLzCQEhwRfC7wlQ
	 7V1oO370qHj/2/xuI0A9DjRMNs9JG6FXtFDU5SsAyweCnaYTGJJE3ZVKyzm75rajB5aiX
	 cFoZrM99TrdTdkrcn1pzofqwmEl8SXYk5IJuH98CUjvsZGadgzjXJ8UD1zkd4gQslXioj
	 dRZlRTyLp6Q7rr5fkAhM19SgERg7wMkKnuVOtnUFNLkmRMTdWEZIQmsccfwT0lLqICg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G+Ul4wYB7F7GOHeOHYfi0XFFmYlVfK1p/QtFcQWKlB8=;
	b=ItfcUhsQfCaO9vSloGprpyOc3B4lLJ0TPGtHCIgyzihTynStSZgpOgeVF31bJOzALHgm
	 e2AhySsQp3VEF1c+ilysDfBRQXT6j93JvXAeF6G4M+yorxCdNvgBRGCghGnswfFBt3shw
	 9PSBKbAKGvMDVSGZM9omtGLUkzHA9pCwjBfsp7lhiRHI95CVwNhlWoJW/zCYMPc2nrKZr
	 BkpJoI9jsqZMJee9fjNqmK2cfQaYkIlXghvwUD81T2/CroXgFVkFta8rm/wCrBBiq8H3u
	 HyU93/sXgA/W3iPDnaq11l2axCYCPU01agPVc8Dka4efgx3F509Vq2DgDNVxn4TfPMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jOO+oafD;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190E6606DE8C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 190E6606DE8C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jOO+oafD
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so27065935e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793634307; x=1794239107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+Ul4wYB7F7GOHeOHYfi0XFFmYlVfK1p/QtFcQWKlB8=;
        b=jOO+oafDQ2vni9CZUtj423urEKRJ69jfP7P1rtCT/lLRYDjvDPw7FUFoXbbgyPo8Cn
         yt1Oy8naqRqTtH3YENpB/KwgK30dNfiycT12ytLnYPpQA/NKOZ7+zH9XwYEkbtFZA8pu
         PzdFUh2YdT3h094VfP2ntYWTCzRKfIiB//63Arvj88EkMwFfT+eONgMw6ezvUPafMq4W
         /x+wSF+8Wt4Vrq7+dGVFU6mzMu7ZRjPOjH/4lXWmJVjTVU04IEkrGL33E6/Vh2NMWgzu
         cm7A711XcMoQEQf7wAxa+nuf3xplO/L2OK0TCcjTAm0u0in5AiXnE8ypOWmvIUKr888X
         GPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634307; x=1794239107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+Ul4wYB7F7GOHeOHYfi0XFFmYlVfK1p/QtFcQWKlB8=;
        b=rapQD3nYJMd7/1eJR+4s6q2wOUocWnrskENhrMWYbyacl3nWZkihkGsq60PKsKIZLa
         fTEHyJ0OfJAzYXgjx3rIBzot85oc8c8pzXcsQzMHxe4AxFXq5qRArhIqPoff4TSZySw1
         zfs7fzjtqd/4nUEiFFiNbxJ2SV3Hu2Se+lYQTwk8fKUVPZ8gJw54VjpouOQP4QQysTmX
         /72JuHiDimUgbgJXJrScFnYZCSRE9J6d8IvSgRdIRcL3ivPCg0eeB49fO4tFhwj4mQK/
         pBYRwrZzBo7VT6bLxxs2qLTNN3KcmIyrnSzawMN2MPUl6manpLc+VvAfGrIC40M0IpWW
         I8pQ==
X-Forwarded-Encrypted: i=1; AKwUvByrvUo/g0djRJjBC93+b7D0wOg9OqYfAJHRf0mNtb6B7kZWocZKwQiF/1jHbUrba35wdbSZylTVCdnhl2M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrCZq6V17dyO9qlVaLXHoBC0gMl89ECMO9CMAmsqCnvNiXy3S+
	/LLQRqJx98zf8ECd19/SyAS8l+Z1HNQc44k8s70NmVdHZV1F6PolxzA=
X-Gm-Gg: AYBFou3ixGx0+7uj1T+BnSlGUnjpY4IC99EFydfQEiIoUDPYRRtbMe56u4YQZbXF5fp
	FXz/tmW21tXbbdYwEsbNS/Y+TAKy1sbJ68nIFEzgKRr/JllRVhsatAr8s1fqSrVQmyT7wPhQaQT
	Via1rI4EEX2lQlA04TQ12VytC4VFcX8t7HusAqR3hAVqwvtSR2XvriFBoAUtXRN5NudaEKGzHGh
	81Buj3xdinJJkn0JY+tuBwq+k98wXmYqnNwRLH5EAMbd0IWynGOh9iVblZ8LtO/3AK8EfOi6oxm
	6WgXwRWlfuYuT4diHLsVZfbBOwEpIM/9tGtUfO0rO6QFsR8ljQXg81OebfAAB5Er7e9eKVPVdgr
	VSXH3K4eYdxI4XH41w0ylPs/TO3Lvl9KyW1ZwcXLWoh/RNJaXLMLrb9qAy16qiNnYrArscobGje
	AwvB+QXGINdCD5zNGZGOlQE8+zpWyG1BlBu5lL4FB8OiKNPv5bGw59p3DWeCI5OJbIciukL6o+u
	DK0MjeAUSiSi5elMhiIH5CpYv6iokjySE57pzHUu0kbE9ByTqfxhnOUhN083UyGJRMXee0k56e7
	5QNek0n3h5SrKcvsxnWOOem1NSe+guLr
X-Received: by 2002:a05:600c:8b04:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4ac150b2044mr235626945e9.2.1793634307242;
        Mon, 02 Nov 2026 07:45:07 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm369026565e9.9.2026.11.02.07.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:45:06 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: mchehab@kernel.org
Cc: linma@zju.edu.cn,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] media: dvbdev: fix dangling minor pointer in dvb_register_device() error paths
Date: Mon,  2 Nov 2026 15:45:05 +0000
Message-ID: <20261102154505.1224791-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

dvb_register_device() stores the dvb_device in the global dvb_minors[]
array via dvb_device_get() and releases minor_rwsem before calling
dvb_register_media_device() and device_create(). If either of these
fails, the error paths call kfree() on dvbdev without clearing the
dvb_minors[minor] entry and without going through dvb_device_put().
This leaves a stale pointer in the array that dvb_device_open() can
dereference under minor_rwsem, and bypasses the reference count
established by dvb_device_get().

Fix both error paths by:

1. Clearing dvb_minors[minor] under minor_rwsem and calling
   dvb_device_put() to release the array reference.
2. Replacing the direct kfree() with dvb_device_put() to release
   the initial reference and allow the release callback to free
   the object when the count reaches zero.

This mirrors the cleanup sequence in dvb_unregister_device().

Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/media/dvb-core/dvbdev.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index d753d329502a6..c931c467d4c52 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -551,6 +551,10 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	if (ret) {
 		pr_err("%s: dvb_register_media_device failed to create the mediagraph\n",
 		       __func__);
+		down_write(&minor_rwsem);
+		dvb_minors[minor] = NULL;
+		dvb_device_put(dvbdev);
+		up_write(&minor_rwsem);
 		if (new_node) {
 			list_del(&new_node->list_head);
 			kfree(dvbdevfops);
@@ -558,7 +562,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		}
 		dvb_media_device_free(dvbdev);
 		list_del(&dvbdev->list_head);
-		kfree(dvbdev);
+		dvb_device_put(dvbdev);
 		*pdvbdev = NULL;
 		mutex_unlock(&dvbdev_register_lock);
 		return ret;
@@ -570,6 +574,10 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	if (IS_ERR(clsdev)) {
 		pr_err("%s: failed to create device dvb%d.%s%d (%pe)\n",
 		       __func__, adap->num, dnames[type], id, clsdev);
+		down_write(&minor_rwsem);
+		dvb_minors[minor] = NULL;
+		dvb_device_put(dvbdev);
+		up_write(&minor_rwsem);
 		if (new_node) {
 			list_del(&new_node->list_head);
 			kfree(dvbdevfops);
@@ -577,7 +585,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		}
 		dvb_media_device_free(dvbdev);
 		list_del(&dvbdev->list_head);
-		kfree(dvbdev);
+		dvb_device_put(dvbdev);
 		*pdvbdev = NULL;
 		mutex_unlock(&dvbdev_register_lock);
 		return PTR_ERR(clsdev);
-- 
2.47.3

