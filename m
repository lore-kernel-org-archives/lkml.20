Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793335221;
	b=YYP9DkuSmvbt9f9yI7Re94lWnvoUAjQ/LpS2pHXC+8PPFCzD852xfvMTEJQNDS8dQ4Xr
	 /ciOFYzjHA7UiKENnmL3MSudvnvmk/n2fUaDEGQkS5oaBTwztlo64gppvSI6iFSqDUzBJ
	 8ycEbFdRm8v17DCmBhaiK8No6e1zQKGv4Y3cUn4XmGW4TRiEvQJ6ZA2GflZN+gkoUfEwr
	 DmCiQD5+hemGpaSGiInkXVqbt61H5FYbAMJhv8+tI4b0AmwWdNCVPPsrWAnHYaSpK8Gqo
	 Kf+iuBWW1b1vVa3aO85X2DFbokVduPbgUMpUsUMkjbR45GU2HRv+924dYSkNH1kYAAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793335221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0pxIDWqNP9QlFHJneHeVIH00VqBfWsrjURorHdYn0cc=;
	b=h/6zdU7ixu3+tA+I8NPz0NcCueagWY4Ewc3o4/cFXkVoRga1TT2oK60OhPQ4Qy/BnqCa
	 zj1yiho5PGfvdgpKGpeGH/DUo4Vddzs77YcDJerG3xNXJmhdYjtS5Gl1rJApa13ibX/aZ
	 CHFozknpMfikTmeXSO4qV8u90O/yjAwed0HSg7Bpqu1IkgB777h8joLCuO/2Ue3zBQccI
	 fPu/7a5NxcKjnQwjTgEzDwoEmKulti6Zdmoo0t1GUP+PudphlBUaGSPiRRUXY6OJAf95K
	 ubAdxWtNVo/Lsd9tPGCFppTzlTHIDel6ZVz0zU5d0pw0a54fugsQyJKsUgS4xOwLX5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wsyE4d4u;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD25A606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD25A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wsyE4d4u
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3514b90bb89so664761eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793335220; x=1793940020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pxIDWqNP9QlFHJneHeVIH00VqBfWsrjURorHdYn0cc=;
        b=wsyE4d4u2kSup272juIJcOdXxrmp3tLhWNSx5Dxjau/usYM/LbvXq/R3mOrtj0JkF2
         uHyMzBA0bvVhH0sBF+4GeZM6iP/EMQA/H2jG4HxSHFlzUNKBXAYr3nyoT35OK1VEDTyT
         2ovsznb8q/PeZ66P1ry3PXuisJ3fq8uHzPkzwZDDYPBbGrszjQ3/AH2+4CiXMhfU6znf
         Gy3NI9EBrrLpq2ECd8B3XJOQl5Q8s+kVF+aEFVjU1rZCsTlaJGSQQ23kRpqX/7Mysl/N
         2NvpK2c9hmp29lOuAklEr63DDDwQrSJimmi2boLoXa080ycUfhg+HpPqfh59OJ9gmsnU
         NIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793335220; x=1793940020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0pxIDWqNP9QlFHJneHeVIH00VqBfWsrjURorHdYn0cc=;
        b=C1dHexAc3hjRCwI9Sq/qu8ebP0bac5m/EYix7Mhal3lp6FBlsiAl6VLptp8fNURPEo
         Jexw3X67foKTJ1jZGhZMHyDQX0k1c3Lsw/HUANmO+Mf64thW+wBbV7amqWNur05XnhO3
         CHwz78ebxifigSsl6op3fcIksWbeELiJqVVkmhQ/bD+1buyUz5OqNrlMcE/O9BtNlarJ
         HlvTkhyLLplzOT1bI/8/iWyqL3MLJ/9AEiG3HjDKCPiFxft1Dguu9tZ6GsaSxrfIuyTq
         s9yGssoEZfiueK8cJOBIKchjGM1XSvfle0p0fNRyV1nCiMGIrd8K/VT+LKO51GMogvqh
         ejLg==
X-Forwarded-Encrypted: i=1; AKwUvByia8l1z8G5j/ZBwymUyG8sHbJhzlw5kCc9Lx3mqmRTdoC6JQ16S+s+pNy9rUujcDvNOIj2Kqkyczm5dzE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+B0Cv3KKntY4WWMDsjZzqLV8fTyBzqja/bDToHOuxhJ+6cmUm
	GbP6gOW74dBvZ+2s85BBaVCg0hy8I3Q+mC1Z271J9hhNvWsTK9ZzzH2+
X-Gm-Gg: AYBFou0/nHVAYk7QBtxrxahM2DIeM3CjcLn872CZQNhwiMn0spNKPms1S6/a+Javv4B
	gX9dGb96UQZRSNSL+9CGBv7hScNI63MVEIloZSWxaVF6zPPg2KUL4Dnb+d/9tjr57FLKR8HK835
	5oijb3FcjmDk2buBw96+fP3y3i4d0lY9pRlcqtFv3EFzqHXXWFE78Zi3f46vvHy4wgufMVaRCNx
	XWaGxjFz7eN2wduxsA75tOQttXqLQkOXHAf5YSJXGpDrIqNuWYi+n6es5HZcFB4HdmbG9rItsMY
	dzZ3v7/lQw77xme+3qc0P3XeYu6ObdiusZ92Xxu2f/EZKs7ZtydR/Mi1ZzRANDftgjUKlSJYQ9z
	F2I7MsODZvudIqTJB1FmZAIYBQQXBWVmMu1kx4ZA9P2Rclw1fle7RRkdNrlGFq4d6VQEUaZaKO+
	isV2OxI+8FWKnD9gMfW+/2qafYo76I2c0g89stY4uG5Wsf5NUzQCD2Hmt6MUqVtpnL6FrBeX8Op
	FbBR4OeXM4ObrTbQxWjCnjk2+OaP9IKUa/5m67q7PCWMQ0nGLtBOk9iLbfZLUs//wUOZDaPZTDp
	3a9NMWJ9JuAe8+FU0hCHLNgL+iLTkmnAgWudiq9Dk/l62nXS
X-Received: by 2002:a05:7301:640b:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-36a42363ef8mr1827511eec.7.1793335219596;
        Thu, 29 Oct 2026 21:40:19 -0700 (PDT)
Received: from spidy ([2401:4900:51d6:8e8c:242c:3f96:88a:43dc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm3710509eec.3.2026.10.29.21.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:40:19 -0700 (PDT)
From: Gowtham S Bhushan <gowtham398gs@gmail.com>
To: song@kernel.org,
	yukuai@fygo.io
Cc: magiclinan@didiglobal.com,
	xiao@kernel.org,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com,
	Gowtham S Bhushan <gowtham398gs@gmail.com>,
	syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com
Subject: [PATCH v2] md/raid1: reject out-of-range raid_disks in setup_conf()
Date: Fri, 30 Oct 2026 10:10:08 +0530
Message-ID: <20261030044008.34293-1-gowtham398gs@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028152755.383821-1-gowtham398gs@gmail.com>
References: <20261028152755.383821-1-gowtham398gs@gmail.com>
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

mddev->raid_disks can be set from user space with SET_ARRAY_INFO and
is not bounded before RUN_ARRAY reaches raid1_run(). With a very large
value, setup_conf() asks the allocator for more than KMALLOC_MAX_SIZE
when allocating conf->mirrors, and the allocator warns:

  WARNING: mm/slub.c:5459 at ___kmalloc_large_node
   setup_conf+0x15d/0x700
   raid1_run+0x109/0x250
   md_run+0x6c3/0xec0
   do_md_run+0x27/0x3b0
   md_ioctl+0x163f/0x1ca0

The array fails to start, but machines running with panic_on_warn
crash and syzbot keeps reporting it.

Fail early instead. Version 1.x metadata can describe at most 1920
devices, so use that as the upper bound, and test the sign before the
value is used. At that limit the allocations that scale with
raid_disks (conf->mirrors, the r1bio mempool element and the resync
buffers) stay well below KMALLOC_MAX_SIZE.

Reported-by: syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=75f49ec552cc74d9d69b
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

Signed-off-by: Gowtham S Bhushan <gowtham398gs@gmail.com>
---
 drivers/md/raid1.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index f0646fb24371..1cfe983167de 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -48,6 +48,13 @@ static void allow_barrier(struct r1conf *conf, sector_t sector_nr);
 static void lower_barrier(struct r1conf *conf, sector_t sector_nr);
 static void raid1_free(struct mddev *mddev, void *priv);
 
+/*
+ * Version 1.x md metadata keeps a 256-byte header and then 2 bytes per
+ * device in a 4096-byte block, so no array described by it can have more
+ * devices than this. Arrays created through the ioctl alone have no
+ * on-disk limit, so apply the same cap to them.
+ */
+#define RAID1_MAX_DISKS	((4096 - 256) / 2)
 #define RAID_1_10_NAME "raid1"
 #include "raid1-10.c"
 
@@ -3051,6 +3058,11 @@ static struct r1conf *setup_conf(struct mddev *mddev)
 	size_t r1bio_size;
 	int err = -ENOMEM;
 
+	/* raid_disks comes from user space and sizes the allocations below */
+
+	if (mddev->raid_disks <= 0 || mddev->raid_disks > RAID1_MAX_DISKS)
+		return ERR_PTR(-EINVAL);
+
 	conf = kzalloc_obj(struct r1conf);
 	if (!conf)
 		goto abort;
-- 
2.56.0

