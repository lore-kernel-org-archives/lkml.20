Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE24B522F19
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064101; cv=none; b=H61j8v7Nm4O7ZACmL4DixRAwH3jsCMhQsI2+fokpj7X3ip0WqJEohe+QTeHIkX68oFKeU4hlfDlJbaLU/25D+uybetxGxZnphyYxqsNxGZsfLJadrD4ow+8YcicdJVY4o1gl3VgXiSS1bqqeHL6IrnMZlcFHCj2zIMM1e4FgKTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064101; c=relaxed/simple;
	bh=0N9CYZPDiuUu44aUShjKzfgWHYRWpHfe6zVi7EjY5IU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOYJ4c575iKg6SRl5JpjNhXVa4hE685fFpi6wgXnBsuMY+aDAFanRyB7n/bTXs7H9XQkcFbuQlljcOhH65E+VCe6ImGS2n1AM75qeUnFQERunoT8P3/uisAWyqr8nyN+w1DMl8ZEs7d3lmkZ8obcbWjdd25WQUcbunKA898yFXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LW/Q5g1/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LW/Q5g1/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fbdc010d7so1073815e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064088; x=1790668888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmb5ZYsqks7WEIdeRWH6smgklDya3V2PeA5rJDQKGQU=;
        b=LW/Q5g1/musUc+wsQK4IusW0asOj6tj7c7eh51Rgj6l2IhYI8sQ3lqURkVbwZvykYh
         /AHx6mokkub/41wLr2HzABA5xH4IebKukxUyKBazaGLstabmgYqFj7H+vOxNEW/eX3tz
         x4koAMlgDU3rujnkWNkrCuHVqIJLB3zWsrcYyfNQwq0mLKHx1hfrDfq1tft6I6vfvS5c
         YUJZib79BdukfylpzuT2niwpsVmPcn3FJSz+OvQxy8xrFZr7eevJZvYqW81pDPXvUMA0
         T0mCazA9tRBTtXPQ0Qi/f9gxRWZdslN952mm9xyiyIz/+opRhw6bNj4/kcK3Dm82hi/I
         0jZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064088; x=1790668888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qmb5ZYsqks7WEIdeRWH6smgklDya3V2PeA5rJDQKGQU=;
        b=wkq/hUSKQ7zQ6zXd+2kZuv5Ha+4GTs987M0x5HVOjlAj2ooAQnCFmYCi72dlCjnDAR
         rrK9eXdPvv2il5fghB9gUL/w0LScluk26OVX6ITiPxsHeBvnw9MCpDOtcLfGpO+x13C+
         +T3xwAQ1nB1GJgwAFbWz17Gpwri8KxZ/S7hkOLS4FdU/FYvNCPGBY/9qKYvzAmYkZ8W1
         nnGYzxBPFTpf439T0dEzB5rjvjHVw19c+qYP38iT/9zzIG9r6gxRqKvGl17iGuOj5Vne
         ywmlPcozyUwZ7ygozqPN5VmghIstkZlXW19had6WMerrrcA6UxqkRgjT6o93VUmQmnTm
         +Y8Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/pQP0VdGICOu0ozg3AdBwUzWLoI9sFn5WwMoBSIqLuCM4HmbDDVhYtlrSg/qlhimTbnYrI8dVQa11NfE=@vger.kernel.org
X-Gm-Message-State: AFuF++niPvB3qXcj7UlQf6EHrA0CoWzXX8sbQzBl6AapwfYcBWQB9YTn
	b39peLN6GXEe3UUASsflLJOo+/94tscSSbpG2sH/8Q3cE3I5d1ctD8f5
X-Gm-Gg: AYBFou0gh3fcInpIqxrBfuWdygr7as5J9hwS1E0rx23dW0hCxpNoZ6dbl3rE/b1iMfq
	zgwDjr6L1gzJueYjUM8w8ghJxqYCEDR7QxH53m5h6apwBmFE/vQpnmiC/nWK+7vgIhAXGO8qSLM
	rD7K57z2Lpfyup6U8a8Z3NLE0qPjsxWcZ/iegxF5hcA5E4n+D7yOXSmTCi4ekWs+eLjUrBXjV/O
	FeVMZ/Gq4coWldmEVavGzmQ7t8D7Y3NuJmDJG3rruAEo5jUk+xGz0BKxJmoDna7vRDKhoXb8fma
	sT3dQ8dIBnD3KQr2t7vEvwKuCHCyXByL1NdK5z/Vg9advnhPizLPjZSsnzHTF34fbxZyi/fpGWO
	iwo6/3iYIYTLoLIzXZJbJZYBC7irA0irWimForTM1WJyy1ebOnGzTLY+UUfCQpaFZM480QX/Dpr
	EeGQSIkV1xdMXyeeR4hjnOteybPnq8pdG7xv6yWtbe+ExOxuP4MlyWUzDrUv3ii4HkdnaPIM+FH
	lOr19fazaR1I8HG5CVIsgPjYqY9JaQMUPHmej/3f/XIZ2xp/IrWj2czcNlOp7xyq7r/tkrZnCOV
	uN8=
X-Received: by 2002:a05:600c:354e:b0:49e:479b:c13b with SMTP id 5b1f17b1804b1-49fc7dff668mr165624765e9.1.1790064085766;
        Tue, 22 Sep 2026 01:01:25 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:25 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 01/11] accel/rocket: search every core slot when a core is removed
Date: Tue, 22 Sep 2026 10:01:04 +0200
Message-ID: <20260922080114.44662-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922080114.44662-1-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rocket_remove() decrements rdev->num_cores for each core it removes,
while find_core_for_dev() searches slots 0 to num_cores - 1. Unbinding
the cores in the order they were bound therefore loses the last one: by
the time it is removed the search range has already shrunk past its
slot, so find_core_for_dev() returns -1 and rocket_remove() gives up
without doing anything.

num_cores never reaches zero, rocket_device_fini() never runs, and the
file-scoped rdev keeps pointing at a device that is going away. Binding
the cores again starts from that stale count, because rocket_probe()
takes rdev->num_cores as the slot to fill. On an RK3588, which describes
three cores, the second round lands on slots 1, 2 and 3 while rdev->cores
was allocated with room for three:

  rocket fdab0000.npu: Rockchip NPU core 1 version: 1179210309
  rocket fdac0000.npu: Rockchip NPU core 2 version: 1179210309
  rocket fdad0000.npu: Rockchip NPU core 3 version: 1179210309

The write to rdev->cores[3] is past the end of the array.

Nothing in tree reads the core array often enough to notice, so the
overrun is silent today. It turned up while testing a devfreq series on
top of this, where a worker walks every core a few times a second, and
UBSAN caught the first bool it read out of the overrun entry:

  UBSAN: invalid-load in drivers/accel/rocket/rocket_devfreq.c:47:10
  load of value 5 is not a valid value for type '_Bool'
  Workqueue: devfreq_wq devfreq_monitor

Record how many slots were allocated and search all of them. Every core
is then found on removal, num_cores reaches zero, the device is torn down
and a later bind starts from a clean rdev.

This does not make unbinding a single core out of several work: probe
still takes num_cores as the slot to fill, and rocket_open() still
reaches for cores[0] whether or not anything is there. The fourth patch
takes care of both.

Found by unbinding and rebinding all three cores on an Orange Pi 5 Plus.
With this applied the cores land in slots 0, 1 and 2 every time, whichever
order they are bound in, and the shared supply goes back to a single user
after each round.

Fixes: ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Tested-by: Jiaxing Hu <gahing@gahingwoo.com> # RK3576, two cores
Tested-by: Sidong Yang <sidong.yang@furiosa.ai> # RK3588, 3 cores
---
Two paragraphs changed from the standalone posting, which this series
supersedes: the one on unbinding a single core now points at patch 4
instead of saying what is left, and the round counts are dropped from
the last one. Posting:
https://lore.kernel.org/r/20260904125936.26234-1-royalnet026@gmail.com
The two Tested-by tags are from that thread. The round counts were
taken on a kernel that carried the use-after-free fixed in 8/11; they
were re-measured with the whole series applied, see the notes on patch
4 and the cover letter. The single-core unbind and rocket_open() cases
in that paragraph are 2/2 of the lifecycle series, now rebased into
this one as patch 4:
https://lore.kernel.org/r/20260731064933.12548-3-royalnet026@gmail.com

 drivers/accel/rocket/rocket_device.c | 2 ++
 drivers/accel/rocket/rocket_device.h | 1 +
 drivers/accel/rocket/rocket_drv.c    | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
index 46e6ee1e72c5f..efd004194c1af 100644
--- a/drivers/accel/rocket/rocket_device.c
+++ b/drivers/accel/rocket/rocket_device.c
@@ -31,6 +31,8 @@ struct rocket_device *rocket_device_init(struct platform_device *pdev,
 		if (of_device_is_available(core_node))
 			num_cores++;
 
+	rdev->max_cores = num_cores;
+
 	rdev->cores = devm_kcalloc(dev, num_cores, sizeof(*rdev->cores), GFP_KERNEL);
 	if (!rdev->cores)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
index ce662abc01d3d..c62d567010696 100644
--- a/drivers/accel/rocket/rocket_device.h
+++ b/drivers/accel/rocket/rocket_device.h
@@ -19,6 +19,7 @@ struct rocket_device {
 
 	struct rocket_core *cores;
 	unsigned int num_cores;
+	unsigned int max_cores;
 };
 
 struct rocket_device *rocket_device_init(struct platform_device *pdev,
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 8bbbce594883e..2bcfe4ab3c68f 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -223,7 +223,7 @@ static int find_core_for_dev(struct device *dev)
 {
 	struct rocket_device *rdev = dev_get_drvdata(dev);
 
-	for (unsigned int core = 0; core < rdev->num_cores; core++) {
+	for (unsigned int core = 0; core < rdev->max_cores; core++) {
 		if (dev == rdev->cores[core].dev)
 			return core;
 	}
-- 
2.43.0

