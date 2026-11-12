Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498579;
	b=BRTIsPkK7on5VKrXgd522lVFzp/A1UFGq0kvDbMTCf1aHB58eHySqaDBF+HTcSYjNWr7
	 8KG36znEeSuScJHaXmS7mpk233U6vc+IMuecNq+Mw8W7MqrgMzjhSt9PlQqbZbXf8jqoc
	 Z9ykXfg7BopO1aXb6txcqp0x3R9LDAPhhOVz1LGiwHjhd9RuwKJMaeaG9kGL3I0zrbeqF
	 j3pT/ABHiMxUS1b3ukEgI3+j8aKWrNrUKLnDwR9D6UHpx7KXhWk+oXTNSQOF2KFgzJMf7
	 CMf5I9pbTaLf5OGZdvXE2YLsuZNALNqn05WfPn5QFmvfn43DjOtQFqmZvguSbCxL/ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ve1FkPgDNt0jdst6TwlwSyNCOB8aJhkSUavfhKtflTs=;
	b=jNFY79D8pLqQpHQKfrJIWq8IUN22/LFCvUtm1D92NGfED2n4iPXF/FOAPcW5kwBprE0O
	 PcsHKL/F7tbdxulpUMCMc6pekB1AzS7FRPe5FM42FWcL9RACKzUVF0eAPz4I0HpnBHzgX
	 wpi8PG5FPpNpYQ6ZF7jCk5SeRLfuhyEcYPCiaae+bOfns0YFZj+XbSlDFYTfi9JPrtR0q
	 X+wKI28cK60BjDagvNj9eNOHQF+2uHpUdbTQU/2e5lNt954S9zaHr7g1ePRSVMibgzGL3
	 wff9sb9I+lY7E/Pv4nsT/AQHJ4zrVk9pOXABARf+hOhExksGQBfKMCgT0nVO5NJF08w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+1yPzPS;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12809606A891
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12809606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+1yPzPS
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so6435915e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794498577; x=1795103377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ve1FkPgDNt0jdst6TwlwSyNCOB8aJhkSUavfhKtflTs=;
        b=k+1yPzPSmnde0506t7WZ54MUMqLuvgWsL+VtyeRmw1OmzDr9tDzPYMbpPhBDKfCYfE
         kAboTZ8nO++NdeKzP++4oxNiQ3yKhcR3PvdgOE6j+3kiatcrthX2Vw40UX0GCtrCp1q1
         6mHr1khSGQJi2aCODY5f5GCbGPgT+lQ10YeHh0f9ovn9wTZQPOgVK422ymdOJnw6AjS6
         8Olf+KTa8jtYFGFVxCrGH+8Vu1poVqLv7PEF3dzSAI2NzA+bGw7MY8cWhnUDDGC1DBg5
         wreWr8A3WwFA1sGExh44od1EJvUCg8WdnEKaa+EI2ClqHuByGBM9UgQnpUG4Y2GPReG5
         9YAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498577; x=1795103377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ve1FkPgDNt0jdst6TwlwSyNCOB8aJhkSUavfhKtflTs=;
        b=AOd8RNNgVH857At2Mbz6XboRgfzkxw6FtpLIoctq6YHzAQkK8PQs1d9owmbPA9/mO7
         kD7JB6WL2Oc7B+UeKukrVHkR9tmhC591oFztwJO7UqQ546+aNYtJiPqvYU3yedXzH1yi
         oKYCA6zYqsMbnkmjQxNWupdGiS2wVr2Nao5M4hNJDhL/8Sh2M5Fa+bSOWoMFhSnjcjfO
         8S6sOodaIzC4ZyX4es8PCTkCOz2FOd2VYDTJsNjSAl4keySGZ5MkAFJ+Wt8Cqy8Slwhh
         ZEpKLOI3agp7tiac9bskgI/uThz8hyPdiWDxbBb0sfrYgNg/Qv1GQvwiJcBtFjmP9D/n
         vB7Q==
X-Forwarded-Encrypted: i=1; AL+hErHEPMQEW+M3VaLPNA/emQGBAjlNXUGhfwNHFoFE0PpY3pxJ1NcIgLwb1ehynICU+n0hQ0PhJrbjEnXBfEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KJlpAYiYnN3bnbIPtbY0RaZKhAGCM0EpB98/vv3WsF3Hqjeg1
	v0TOiyXwtC1MDiN+k/LunjJ5jLGULHjLvp1HWos2QiWPD6vsowIofhOQ
X-Gm-Gg: AYBFou1IVO7hFqMXg6yW0VgI70yhhOyTRjWGmjlKEn/Mo6Cq/dDSiSQkgU46avR65CB
	kY0v98zuHlIgJspt2Wa0zAGQcA37B7OXmFtWeTqFKFPnZ5IK3qtjBxNLJ5Ir8Gj9Th2sVJj05L3
	3SbLbdX2lHtDkygM6mUvHZUhB0dPslkrAwqjLqo0kEqem6WF8wAW8eLkngiwRSwpBw6Vme20KoW
	yCZvi4+ibWPbOcHUkPHcYs7KQavbg4YeqNapVOWLr2zQNzSWT3j5dNksnr/OemDtG8YoV4sXQQd
	thnDTO72caXTO01VGmJ8nPUmnRkibq7h2Fofw7GB9LSA0k/To3Y81fv2rOPmDhqzxe6K3aaVxXt
	tQpl5LjMvIQDzlq6J+FL2YjvBbUsCd4FfiQWc92tFWaEpLHorZb3UKtNM4G71XLJNUx/FykSWw3
	ShgCkPXZCwIxYfeHPBpgwuiwpMyUDNaqnO2vNWtbLWZZVUZXobIVcimeBGSmHUvMRgDbvNxWY9R
	p20xfxxuHPQYphc6KwO1KS0/8ri7GpCe34l1XijhmApTe6d4NiSXnogCq9zlL2efRZncjy4CQi0
	BRFabzWLEoxrBcUqDy/s2KF2keO/3NGq3bJW4Mo7v/JiaVoyMNXPwUDZY2y6a3GchKSu+IxHJNz
	V
X-Received: by 2002:a05:600c:19cd:b0:4b5:d95c:2380 with SMTP id 5b1f17b1804b1-4bb4e28d076mr63675105e9.11.1794498577427;
        Thu, 12 Nov 2026 07:49:37 -0800 (PST)
Received: from stjepan-Aspire-F5-573G.tailc0f20e.ts.net ([2a00:1bb8:118:d39e:4868:f22e:b51d:7cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm139337155e9.1.2026.11.12.07.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:49:37 -0800 (PST)
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: Francesco Valla <francesco@valla.it>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andy Lutomirski <luto@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	virtualization@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] virtio_ring: reject a split ring size that is not a power of two again
Date: Thu, 12 Nov 2026 16:49:16 +0100
Message-ID: <20261112154927.4004184-2-stjepan.poljak@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112154927.4004184-1-stjepan.poljak@gmail.com>
References: <20261112154927.4004184-1-stjepan.poljak@gmail.com>
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

The split ring indexes its avail and used rings with num - 1 as a mask,
so its size must be a power of two. Commit 2a2d1382fe9d ("virtio: Add
improved queue allocation API") moved that check from
vring_new_virtqueue() into the new allocation path, which
vring_new_virtqueue() does not use.

remoteproc calls vring_new_virtqueue() with a ring size from the
firmware, checked only to be non-zero. With 100 entries, for example,
the driver would put buffers 4 and 8 in avail slot 0. The device would
look for them at slots 4 and 8, possibly reading the wrong data.

Put the check back for the split ring; the packed ring has no such
restriction.

Fixes: 2a2d1382fe9d ("virtio: Add improved queue allocation API")
Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>
---
remoteproc still reports this as -ENOMEM, although the "Bad virtqueue
length" error names the cause. Returning an error pointer from
vring_new_virtqueue() is left for later; the same change for
vring_create_virtqueue() is here:
https://lore.kernel.org/r/20261106055635.3019889-1-stjepan.poljak@gmail.com

v2:
- Log with dev_err() rather than dev_warn(), and say in the message why
  the length is bad (Francesco)
---
 drivers/virtio/virtio_ring.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index f683a2d6a200..f855b8d41575 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -3513,6 +3513,13 @@ struct virtqueue *vring_new_virtqueue(unsigned int index,
 						    name, map);
 	}
 
+	/* The split ring indexes its rings with num - 1 as a mask. */
+	if (!is_power_of_2(num)) {
+		dev_err(&vdev->dev,
+			"Bad virtqueue length %u (not a power of two)\n", num);
+		return NULL;
+	}
+
 	vring_init(&vring_split.vring, num, pages, vring_align);
 	return __vring_new_virtqueue_split(index, &vring_split, vdev, weak_barriers,
 				     context, notify, callback, name,
-- 
2.53.0

