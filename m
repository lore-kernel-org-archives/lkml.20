Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8861FDE31
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 02:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788057282; cv=none; b=CTKXc15CHFS3ze4ww5zXxGlAePLNFx4visMWK560H/hL7fmLR15ipwbW2vDwEmq4ZW8CAutNXIPp+EV97lVcPqAAiy+XBW0uDHsYrQY/2JFkqRjy1Pb3sU+2Rkf9NuPSVSCGHatWJmIj9J9yJepZeZw8N967O4WrNP80WrNDVzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788057282; c=relaxed/simple;
	bh=ovJUopzQwrJDmXOuk4g+6rnmknd9cwWU2S2O6WmOduU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=inYq9msTnPq+waqrkCogSB7uJayjF6yjxy6pEWRNulQH5+TwgP4eJVWxj5Tht4ho4y/ytX4n9mqEM7QT6lbb8nQAlHX6mxHtCJp/ysY8yn4TIV0TYTxsv27nj1+OjX2j8rPzIXzwtaMO7MlnAELOat96FXQppkdEAEcbfTe4z1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gf+B3daK; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gf+B3daK"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2714637a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788057281; x=1788662081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKjTjg7r4R5L8bCPlD9wnjai8zkrlb8yfJnv3kI4DEQ=;
        b=gf+B3daKXXEzxoF+865dR5BFZmZyOXk/h+yWhKV0m2spXa+XFP2+2NdzPz2BZzuP/n
         /EkW1YRLhFrT45wrIj0gGSWC6fpHmwDik27c4g/8QgSLgj6/8OGRzrdrtUjzSGyGeLsP
         c6iESMwNtAqYN8lyF+DT5UyADKOmEsU1MLrNW8/hWP7CjkF0UXjFuNmhHwAYqRKGzir0
         OlnzrcHELIMQPMKRc5sWNYRFi64BeZ+dJwP1wEHLAjM7jXoSfmKvyIxaU6IVxNrFthXJ
         jOcBOG4Jm7MhtJfleynXsdGBXhL7IvkcLEKEysfhJ7nOC35BLIKccGdiXqPuQ0HzJEmq
         ExiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788057281; x=1788662081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKjTjg7r4R5L8bCPlD9wnjai8zkrlb8yfJnv3kI4DEQ=;
        b=kjZJi58EyCXb3oA1Xeyb0Q45FeNgJm46LUq001bFW/3BnzyQgMQVhrDs6t2UzqHz2n
         cmRb9jYCQEQKGPRq5xace6e6LFzEshrH86YTmxcQofk50eu+xEdvObSlAVdpA85plwaw
         Bqe9Ubtwcp6MZM6k4vaZ9Xt6w6xv/vxsM2WMQLyMm54DqeCsAt+jZQ/5Bfo1nGC2zKsF
         a0be6Ra0egnGCtiV+CdncPaZOsTb2Rreqh+PiWDNB2EWC5eERGwndjS+Hzwhdn+dG/Mr
         1lqEAHB2Cg1lWVSCraANvLL2cJiJ/ShG0bmAS7Yzpti1YdV/MjZuz3f6tBVd54JPi0zf
         keEg==
X-Forwarded-Encrypted: i=1; AKwUvBxYf/iA7nDAVBUQBhemY0XsZ3I5Ag89l3DzuHXeOJsF6kvrj1T4K3aAzomDlf+dNRfqpq9VaS18PlKOmvU=@vger.kernel.org
X-Gm-Message-State: AFuF++la7AyT8IZ9IwHX4GCTbRZV2u9nUdyA6zXf/0fTW3hRoD3iTMp4
	lncmgGy+l14T2Vk/s0stogpp8tTb6mYUDdRLAv/tuqBA73RxPKivZjyB7X0YEQ==
X-Gm-Gg: AYBFou2uzNpw6FZ2Kiru/dCAi6KG7i3laUn7k+0jyQuFAwkK6bA9KRo7IiGTEiP5WKm
	0kKjErN5+3RujHZacwuOFo1Ey3Kg/mH8ZUyum4EL+86Zjye/YnuonAeh/58fKT196pfTCUgT4JJ
	dxsWLDhl2CqG6FyUpQ+yN59VE5Y8DKxIcGsfXHwSFHBFiEaODslqIitau7YmWkeEAAwRbsVM6ha
	6T/jJD75YBSkRdtwsy5rD07KZeGrA/OStmOeyOdE28Gd6DMs6wA5u802CfQJTkWfUx91Gl1kO8o
	MHJR3dBqYVFVooO9vDWcTylS1MkM9ixEs4EhgfyZXvj9fRgP0A1uhqIfNMaV0h1Jvk6RwQdfadW
	PH5HS0EGyUH7ZCDZn6y7IUo3+nwrslKU7MU4b0NhaTtY/DWgMFTYQXtPbv/KE341tQQIFKtq3ku
	rqvI6MRcbsrKsoOaNcKlQSJYUyXB211OyT2ljwtKj1wZIcGyP0a/Sqb/3nt7Te
X-Received: by 2002:a17:90b:39ac:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-396d0ea5451mr21542619a91.5.1788057280462;
        Sat, 29 Aug 2026 19:34:40 -0700 (PDT)
Received: from gmail.com ([188.253.12.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396afff2650sm13879102a91.0.2026.08.29.19.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 19:34:40 -0700 (PDT)
From: Jia Jia <physicalmtea@gmail.com>
To: mst@redhat.com,
	jasowangio@gmail.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	xieyongji@bytedance.com
Cc: virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jia Jia <physicalmtea@gmail.com>
Subject: [PATCH] vduse: validate virtqueue alignment
Date: Sun, 30 Aug 2026 10:33:54 +0800
Message-Id: <20260830023354.115333-1-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vduse_validate_config() only checks the upper bound of vq_align. Invalid
values can therefore reach vring_create_virtqueue_map(). The split-ring
helpers use align - 1 as a bit mask, so the alignment must be a non-zero
power of two. A zero value makes vring_size() drop the descriptor and
available-ring part and vring_init() leave the used ring pointer NULL.

The VIRTIO spec requires the used ring to start at an address
aligned to at least 4 bytes. Reject values below VRING_USED_ALIGN_SIZE as
well as non-power-of-two values before they reach the virtio ring helpers.

Opening a virtio-net device created with vq_align=0 triggered:

BUG: KASAN: null-ptr-deref in virtqueue_kick_prepare_split+0xe3/0x100
Read of size 2 at addr 0000000000000000 by task systemd-network/1062

Call Trace (relevant frames):
 dump_stack_lvl
 print_report
 kasan_report
 __asan_load2
 virtqueue_kick_prepare_split+0xe3/0x100
 virtqueue_kick_prepare+0x40/0x60
 try_fill_recv+0x857/0x1250
 virtnet_open+0x189/0x460
 __dev_open+0x225/0x390
 __dev_change_flags+0x368/0x3b0
 netif_change_flags+0x56/0xc0
 do_setlink.isra.0+0x68c/0x1e30

Validate the value before it reaches the virtio ring helpers.

Fixes: c8a6153b6c59 ("vduse: Introduce VDUSE - vDPA Device in Userspace")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 drivers/vdpa/vdpa_user/vduse_dev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
--- a/drivers/vdpa/vdpa_user/vduse_dev.c
+++ b/drivers/vdpa/vdpa_user/vduse_dev.c
@@ -2190,7 +2190,9 @@ static bool vduse_validate_config(struct vduse_dev_config *config,
 			return false;
 	}
 
-	if (config->vq_align > PAGE_SIZE)
+	if (config->vq_align < VRING_USED_ALIGN_SIZE ||
+	    !is_power_of_2(config->vq_align) ||
+	    config->vq_align > PAGE_SIZE)
 		return false;
 
 	if (config->config_size > PAGE_SIZE)
