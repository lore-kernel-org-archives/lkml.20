Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793248060;
	b=YOJnmduE715jHsIVFxNo2Pf6RADx/lNBnOlaCo11/Ba67zwKv//NnUiFW/fmfaBphnmm
	 ejFj278RUnm9cLGFacHYmmOgPQv8/vvoFzUKKia85v1S41azQRU0meJmRE4yWwpN7LF3z
	 fyvJu6AEPUytqFCNjPlVu/EwKAaMMFHwU0TOobjzsKARTtPhhuTRpvvKAvVNYqGiI4tVL
	 veAtVA6LLwHx/tibfPIzJgTARTUux5ROMhAuHEN3MUIkBWDrAoOPdKNc9xcuGe45I8I6A
	 JaX857fnOqbCPbonXCUQV8bcTAwVJrqbr2zYw8zFhH6mwXwC+PmzelcI6DDveXborlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793248060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=92Ry8Npagaq/z8a8VQiLsTt0Bsh/v/B89EOMNxNHR6w=;
	b=yDh5CIOdyvu52/9SEB+wj/toAKERHFAg6uLf2ptfHYw5k7BIzw5yRwV+Mxu/Pb/I/kAp
	 1AXoQUj6J9xhHwuE34okJ9flufZzmV8sfDdu9/klVJtidjl8LfwCL4dF2h2oU86hF6DMs
	 mnybUxst/d2Mm2RxecqJL1cXVcpBT6qBFhy5z7yZMizXRvLLl/4lHaWc80LHKrHc+VKYA
	 kr4TlpX3TRXUHJ8xdCg3WyETIMUb9veECfjRuwZQVnr9j5Ie19toIkZgUYA/5nskDG19s
	 /kmtlfNtLi3R4l1IjocVFtC001REBlcXNmNua7QOXtTTZiIJg1b3Zc2ORCjm3L/08lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PmrIkzsF;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE14E60A2603
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE14E60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PmrIkzsF
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso199971a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793248059; x=1793852859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92Ry8Npagaq/z8a8VQiLsTt0Bsh/v/B89EOMNxNHR6w=;
        b=PmrIkzsF3KWnP0i6mMndM6dmhR3o55JdfGB0tKABw5xOAMyEwvboHP936D2DTSd7yi
         HsM3FXRiVwQr/fKIEPvhektnia9sU2G4HOSXZlnRsDBW/zTlfaKjVO9omxl649aBln3Q
         Gf5CYIqV+U+q+aVU2MsQTjNkBgrUutudp8NJsImyalHlZujeME9ABU1C+PiDotVLpLrZ
         FySJryJUdt3JLLZAmdCX8VzgS1G09ewoclj+1OQkznyFJY7832qOBBCEPFSaavjYbuLo
         mqfDNEEQGBHNnhBDG4BIApB8j6ug75eez0IFzQ/GzKQrcepcY19gu91AKaSo3n6IxaQU
         0W0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793248059; x=1793852859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=92Ry8Npagaq/z8a8VQiLsTt0Bsh/v/B89EOMNxNHR6w=;
        b=mfVZ0idZ8kWcmnrG8S+HOpsBHI4/wpOwygIc9wzKAjZDd7V9nRebac8+PBSVCQWN8f
         Y+r8KB/c4hSbuELR/KHPVI5Rxf2aGjttfBYwVltGNhe48E5RKqHarycfSG9H1TKBhSr0
         Su35/7Fa9yVvjKaQ3ALOpNl3F7a7YTTOAnM2xmIlsGJDFKxw2lKKyiPAKZl1/gU0/5fO
         +5kjRcTXD5urZ5B7FZjbXXmXP34zxLr58FrmYlLmLO7gAFncLvGeU2w/hmtIc0E6adWM
         F9ruhuCMssBMi0Y696rKwUeoOl4lPjnOMQy1aEJZxjvcggk+M4qSg5zRpAOH5pyt7qQy
         Amcw==
X-Forwarded-Encrypted: i=1; AKwUvBwuUAKkuFNgEQbYEFueHA7t8RmbwJbN6ZxTaV8RY7mX0OWejVhyKYfWENg1q21/2s2ZP7415as/TsHnnko=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgqEpGDxylzeUNf/XY38vYxlxhs0Wx0YExki1z9rrdJcIoJnCu
	sQrIg3ghUBvEv4Mw6veqqUCNduBswxB9CtSyMpiC1CbmiFc7Q19vu/0J
X-Gm-Gg: AYBFou2Z6EMXxjPYocFjaTKvZ8Xiu9KN8zNQ12wOXvi8tGy6+mDblE2xtuEEWlfcmPb
	X//SCeXHu4IAsSi80yXReHIgSXNa4kLY3qLiiZMqWkHGf9iwDjVC++bCuOU90G2gYzP5UuQAmPs
	8TlvqRqiFkaX+fmNZDy0eM6yHDRzKTwzFm0xpXI9zBAphUlT/VYuGeIqeYT546wwC32PwuKzlcb
	ygp7VM/FNVcAcX3d/TZUkj/IR3FPfVK8wS6JqQlGL3JxvshwI1xfIhFDlvauAUlfcjcvrmAyJ+3
	gyZjDkYdrngLRKnO95Q0iNNarTt6xiogtqd/PB5wyHgKJPynwgUdxt8wW1gVyFZfW3FXl365pTc
	PaokprrrDU+pdTmc5gFrubymtuqRsHO+4UyIfCbBj4YRKVC9J02lZTAAZGlLgDcDxw9G6q/BSCN
	6iJ01Phb+Tk6FOK6KDcbL0OqB1b5hcY3sELUPRPCWR/rcX3BbM10YRIIPnxGtudF6/tZj/moRBB
	+qaKDNk769F0hBxQduHR0jvCtMMaTxjc6jgSs9s+jBK3y/VJ+utYf2aAhIORGnpweWvb4GXq4tb
	/JWEDq4Kwr/6j4I15vwq6SMc/C/t4VOyGWRZqXanavyLtDyIQk7Mqww=
X-Received: by 2002:a17:90b:57e6:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3ae6ed88ed6mr887736a91.37.1793248059222;
        Wed, 28 Oct 2026 21:27:39 -0700 (PDT)
Received: from localhost.localdomain ([155.69.168.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e898317sm2010846a91.16.2026.10.28.21.27.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 21:27:38 -0700 (PDT)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: haris.iqbal@ionos.com,
	jinpu.wang@ionos.com
Cc: jgg@ziepe.ca,
	leon@kernel.org,
	guoqing.jiang@linux.dev,
	gi-oh.kim@ionos.com,
	aleksei.marov@ionos.com,
	lgs201920130244@gmail.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 3/3] RDMA/rtrs-srv: Reject an empty pathname
Date: Thu, 29 Oct 2026 12:27:19 +0800
Message-ID: <20261029042719.75868-4-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029042719.75868-1-izaiahsun@gmail.com>
References: <20261029042719.75868-1-izaiahsun@gmail.com>
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

process_info_req() uses the pathname sent by the client as the name of
the session device and rejects names containing '/' or '.', but it
accepts an empty one.  dev_set_name() succeeds for it, and device_add()
then fails in kobject_add_internal(), which warns about the empty name.

Reject an empty pathname together with the other invalid ones.

Build-tested with x86_64 and arm64 allmodconfig (W=1, sparse): no new
warnings.  Run-tested under KVM with KASAN, lockdep and kmemleak, using
a small user-space rtrs client that sends an empty pathname: the server
now rejects it at the check above, nothing is reported, and an ordinary
rnbd map, I/O and unmap afterwards still work.  Not tested on RDMA
hardware.

Fixes: dea7bb3ad3e0 ("RDMA/rtrs: Do not allow sessname to contain special symbols / and .")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5 kbound
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---
 drivers/infiniband/ulp/rtrs/rtrs-srv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/infiniband/ulp/rtrs/rtrs-srv.c b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
index 56f0ab5a7619..d34a177f7ba2 100644
--- a/drivers/infiniband/ulp/rtrs/rtrs-srv.c
+++ b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
@@ -823,6 +823,10 @@ static int process_info_req(struct rtrs_srv_con *con,
 		return err;
 	}
 
+	if (!msg->pathname[0]) {
+		rtrs_err(s, "pathname cannot be empty\n");
+		return -EINVAL;
+	}
 	if (strchr(msg->pathname, '/') || strchr(msg->pathname, '.')) {
 		rtrs_err(s, "pathname cannot contain / and .\n");
 		return -EINVAL;
-- 
2.53.0

