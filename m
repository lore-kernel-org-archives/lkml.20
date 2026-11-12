Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466233;
	b=krG1s07I1fmrE8DSoksI4I+oLFJ4NVR6d2h8dCX/U+mNmHCZ1ulBMN9x6Vci7bn2reFZ
	 GeJN/bNRhPI0tLHRP9yvJI3nOhJySV17qlLKZ4QfjBt1kG59O9Rd4tfpNb2LiEEJEuJqq
	 eWwFE0eVQTn7fjCXlTo6FljExSfU6VY+9aggMv5WFH1XnOm4P6H1DtHaPfOIlG16G1fH5
	 DBQvaZAkIDzNQqoGIs2fmBukBc7hFh+HvawjbGs4JroMVSOMfSPgeKzA68kWJ5rWlgS3Y
	 8fMBGUq51ibgyjxBp73YIieidME+AYIjrC1F4zLaxa8KGM0cLjqMNrE4EBkOL6reDtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
	b=CCQtLsdtBOrmKe11uJzTmvI3AvU2G92gLuIB87Q5HA+rieeCkVppWSktcvOeNWKkezHw
	 rcqGCPJGAjBbLLuMaW4AJCLIOmU1waixZWEZ6GJtwMPQRsTK1xpYh5TXkeMUSY0JGJmEB
	 IqabjfoTX9JWfHn9zYAyBUTYBZ3Q4I2V+naE89nrpRuN3Rtt3JhGCw1st7Kq3uN9WbAyz
	 ZqniMedowz/0aBcsvUKLK6/TGbHu3l3k6rDf/VlooPfcSbSFZvL8+wSMFacqB/hFHo7ZB
	 TRpO3Xzoi+S/kCOp3EV+okL3ma333bW9FxeIEeYpA8oQjwwqUm+OSlCTido9/DgzTFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mQTqTeo+;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04369606A89C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04369606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mQTqTeo+
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so1968671b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466232; x=1795071032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=mQTqTeo+OA8UOtvGEEgRIRP82v3t4AD/fi9nfPBAHKbDDD74JZlPFfT3e8rx+6RFXO
         Zipc83ZjfSvnpucakHXKd+Jjhe2cxuH8mqfcHch4T97udRu9IxarhY9ZWkNmUFMFX+ST
         rVvljvqISdYmrOGCROnJ5lpvb9s1GVU1okLNwkMsYRYfxha+VttBUhhwoE/njGl6uoiQ
         GW0UG5/gmyWzreKQYsI7H8nm7u5M14oy60pT+xCzYYRKqW8S9a0Q1X4b2cAywHqje/kv
         HJo0TcFN21Qv6wxezIyLW2ULguyu8bv5BSNf2cbqPDOtuFRQAU0VagSNqOVZKlfALk5n
         k4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466232; x=1795071032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=ydDd28hnN00Ol6KwEI8Vy4RMk5q8/YC+EPfhgNRcQjG1XNnNo12XQXu1S+e+AUKJ7q
         a8dGnE3RMrtATc1zhWO5kFFhpfGkeZDqfMMN4of46/YTzMGqdVkKWiXC6MDcKcM7Xv30
         Pj6nq9LncWcEzWeHPuze6nfz3u/dkFP73f9jI99ojHo7qApxU0Kqo7Xq3uGngUprK02u
         jOXVKK4CqvScYwBvAxCVE3lLHaPVM2dIpDyJmxiq2qyw4MhLR/C1WMTinguiMhFCfxEb
         lESd2cGQENqbLFy777qousDAvLFX9StrBJZiipRxDE3Vgz+Qz75mWQZgnnXfqQtY3q6z
         5qqg==
X-Forwarded-Encrypted: i=1; AL+hErHeievahqNZTzxleJsIBEkCeSl7j4xZUzgLznfjGKgEvwRtBmT/NNI7bW4wujxc+pSUFBZ3kf+EHpt3dvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z82HtZuV1eDnNr0TKvfGlCdibHgpjtTwOYh7tSMxwlZTIAf1xkD
	J6IRbbpSF/Qzaomv+USZYvtjh7CBGLKE+jFDXLLxZUJo5I4XA9k/+Lbg
X-Gm-Gg: AYBFou2TscqpzxzfNNvocd6L85DQSlYmoSQaYqk04+lG6WbbhHH6nDQPYWkF+g+iC2q
	vjH67ygBP2DT7hySaHjLP20J2k6NhlILSIqx+s8ABtRSqBU4ZGfYzCYu1kaMQEi2E20yplLrnls
	JLeEYyoIMi/wsOLZq4rHqGKFw5i2u3zDNRmLQVOe8R0hlGHZd1wIJQm1ZQoAJ4/ThmQMT6o5mH0
	7pZFquAA3GXVGtVc5otaApgUU/QQoOQPAgm86hNWUqPExu5gu0B0WJy2X6+beDV2jT9S7m3Tg7K
	eDYwRoVCAxiQKdYlwoq/rkX/4DmRlGF7GnaKoqX0Lqw0aMgYDxVimxnFUue1VgYWzDeK4fCHT75
	9XCe97LUSkz2cd9klQC6boBWtQ6oUIaBknDYl6lcYzWWE9CjTLVVyHoADzKXpJ2lH073DMRjF0D
	xxzEbnBiZgV+FAD3ypylga/7HOft3D4C3VBD/kQfJL6KTNwHRzFR5bkKnWQHbG7NND4OEwtPwLd
	UkLGoURAlFtH9ucjBqXpBGAB4tKTH5paWL4uhgAAGpdTbzpVrcD6Ghr2W8FA007vKozb4nz2d78
	uDVqANke2Et4ADg/KnfsgZawxnpOERk+Uj94wD9xW3BgwLAjh+B/sddUFb0J+BTFjA2TjeUXfof
	tw7uecEDFETmE0rIVlsi/KLwa2PVY+W0l0Dk4dO5Kcu7XNPs=
X-Received: by 2002:a05:6a21:4ccb:b0:3e2:3222:2559 with SMTP id adf61e73a8af0-3f2ff7cafa4mr5180122637.62.1794466232303;
        Wed, 11 Nov 2026 22:50:32 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.50.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:50:31 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v31 15/17] ALSA: virtio: reject invalid playback completions
Date: Thu, 12 Nov 2026 15:49:27 +0900
Message-ID: <20261112064929.11211-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
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

A TX completion currently advances the hardware position even when the
used length is malformed or the device reports an error. Validate the
fixed status response before publishing progress. Retire the request
once, latch XRUN and schedule error delivery while preparation is
active. Keep malformed or failed transfers out of successful playback
byte accounting.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm_msg.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -1011,6 +1011,17 @@
 
 	/* Playback requests point directly at the ALSA ring. */
 	guard(spinlock)(&vss->lock);
+	if (written_bytes != sizeof(*msg->status) ||
+	    le32_to_cpu(msg->status->status) != VIRTIO_SND_S_OK) {
+		vss->xfer_xrun = true;
+		msg->length = 0;
+		vss->msg_count--;
+		if (!vss->msg_count)
+			wake_up_all(&vss->msg_empty);
+		if (vss->prepared && !vss->preparing)
+			virtsnd_pcm_schedule_period_elapsed(vss);
+		return;
+	}
 	completed_bytes = msg->length;
 	latency_bytes = le32_to_cpu(msg->status->latency_bytes);
 	vss->hw_ptr += completed_bytes;
