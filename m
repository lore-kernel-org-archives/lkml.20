Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3313FD946
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885113; cv=none; b=ISjjaAZYsWMwvTR3e9p9Q8XgJ3M0hD0dUHhR9vM8EleCoj5kOcKFGQb3hC73KUokFj+1asLmSWozWJwe4MxBTQ7XZoZV1h5ErB1NobKtQedIUeCjmRHkTjdkXN0pflNJH9g7EyVxdxmjFzul1lCsO1KYgIvfHBjU8d1nSfxZ8yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885113; c=relaxed/simple;
	bh=shlwzbGkW+Hm66Vq5i/aFfYYUX4ju/i1ZD7qI6EZrQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KsClmpgfV7DRGkKQrS1A/FF1+6jyJU7rxzMjUq7eQVc0wb74HnVxeqEiD7clWPMEyxr75Z3L2G93rTJedwfFs8uwWtFVOa9mEPukwscbloCDi4v5OFaqavOjYBVbv9Q0GGExl/ME/vvSaDYaXZLa+/WInBv+BWo2yIz05Jrz9Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=An17aIE+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="An17aIE+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07CCD1F00898;
	Tue, 13 Oct 2026 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791885110;
	bh=o+uB5A0mMNJgtCEnOV8qtQFIcoiWWh3SOtJC5g51koI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=An17aIE+BllOFbnNdZYay9W8d+r6b+mkEfcstsFpYtbgOuvZ/tRYMO27jpIh2rxMb
	 +fO020NVsM/LOa38puD71TOxTmHllX0K+r9WyNzed01Y4EThJ5sH6T/YAAr9epyoz9
	 zGva0Pjw6s+rMsssXTnnsw8pLm4QnKnGkGfac+0711d4k1L4cdXxjEwYg/ZVBGLJB9
	 e+2TlyU9ryQiUqAseFpUr0d52EIgPvab79ipx/8eKpep5clQTeswVK7eAtkCS05sWs
	 cF+HpFs0Jq9eVfNSFdCnHlpP6wEKPDDoCWFuwX7UwkttPCxGg0rNXe23fF1AER4mfv
	 wSUf5MVtz8uiQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] w1: Let bus masters set the search count
Date: Tue, 13 Oct 2026 11:50:45 +0200
Message-ID: <20261013095046.6006-2-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013095046.6006-1-kaloz@kernel.org>
References: <20261013095046.6006-1-kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A master whose slaves cannot change after probe gains nothing from
repeated searches. Let the master set the number of automatic searches
on its bus; zero keeps the search_count module parameter.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 drivers/w1/w1_int.c | 3 +++
 include/linux/w1.h  | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/w1/w1_int.c b/drivers/w1/w1_int.c
index 19a0ea28e9f3..54c87927eb60 100644
--- a/drivers/w1/w1_int.c
+++ b/drivers/w1/w1_int.c
@@ -130,6 +130,9 @@ int w1_add_master_device(struct w1_bus_master *master)
 
 	memcpy(dev->bus_master, master, sizeof(struct w1_bus_master));
 
+	if (master->search_count)
+		dev->search_count = master->search_count;
+
 	dev->initialized = 1;
 
 	dev->thread = kthread_run(&w1_process, dev, "%s", dev->name);
diff --git a/include/linux/w1.h b/include/linux/w1.h
index 064805bfae3f..88c5299476ed 100644
--- a/include/linux/w1.h
+++ b/include/linux/w1.h
@@ -122,6 +122,9 @@ typedef void (*w1_slave_found_callback)(struct w1_master *, u64);
  * @dev_id: Optional device id string, which w1 slaves could use for
  * creating names, which then give a connection to the w1 master
  *
+ * @search_count: Optional number of automatic searches to run on this
+ * bus, -1 for unlimited; 0 uses the search_count module parameter
+ *
  * Note: read_bit and write_bit are very low level functions and should only
  * be used with hardware that doesn't really support 1-wire operations,
  * like a parallel/serial port.
@@ -156,6 +159,8 @@ struct w1_bus_master {
 		u8, w1_slave_found_callback);
 
 	char		*dev_id;
+
+	int		search_count;
 };
 
 /**
-- 
2.47.3

