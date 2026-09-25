Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EDA1990A7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340493; cv=none; b=kiA2yZi70XKwKSXzfW3TE2566keXqfTQ+HYuneM6UwKcv+kTfP4P+ygUdarhvmTUzegzKQPU3fZ69y235LIOYh3N2niEEZVyA3j8bAin+y4gjg10FLAH/Zq9pyuwsxrm3h9lmIsj8XwXBQzz96NIpWGL16AQWy9lVA1MU59iok0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340493; c=relaxed/simple;
	bh=YZB/Dc5gBCNXHwDQZ5iKEsO+P64SlYZ8B/RwKtbkhPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbGyhktNS70Ed+PdF3aA4LQIYRxmYoFlgT8Sb1FKLxMkH6BHiPh1jGstlFDgCANw7C1d5BLUatin6jdD0aZBlZ0ZyxRZNh4vBKz+X06QfRS+4tqLdvnfI80cRP8AUY1OXKDsTMiUSTzc3eIHYJYPvpNIcRDIeUEEkWyJq+ZvalU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrIYrRX6; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrIYrRX6"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488811c9ebaso258320f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790340490; x=1790945290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L4PIEXS1O+9+24VT1vn/XjTFXnHCWV+rBSZ2OYKFHlQ=;
        b=LrIYrRX6hJ/C/+LUz8XFGzziy9aiR5w2iwSUC0kHh06UqRn67Ls1x/Tmh6So4LAayU
         JEQYPTk2HU3OaKvdGxCNlNdMC6+/XykbYCEFbo5pqecDzqzozpgR+LGzgcYAYU01Ab9D
         u7l9gTbgFw7AkpbdZn/jC51rb0r5mhGQwgQA8Fmw1qx9TOTA7Zg0JyWSyVG1HHdL1t8O
         vaxTnbEAwakLgYfPIXIfj5V8gn6vtHukv/o4t2s7247Z4RPvfxalW06IfyTC5Q+PlNe/
         WqRxxJqkR/PDQ4cgKZoHHcJgsAPcyDakhACpNVqnmYzgGK/gIT9YtyGIls/NWu4Fs06I
         QR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340490; x=1790945290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L4PIEXS1O+9+24VT1vn/XjTFXnHCWV+rBSZ2OYKFHlQ=;
        b=rexC8u1HrrZewDXZ7S0M33UphrNh2+ngjI/3TW5I0zqG64fJzl+d9TwmeqId3FpLsD
         GJDYPebHK1EGOVlOh/XQqhIcpx7pJrtLNNFUJz68mhyYQWE1qb0k+GRrSJsM9IYpXqe2
         olp0Ca1OopyQU1fVT+Uqq8Lc1CnUBgYHV9yAmbMoP2eOr6zlKkDlBT2zjcQMo+0TDGR0
         r0J6DkQN8ElfhXXmLLVJ74VvekYuwwAzTeTtx1VA5Saqe8AjrfakWFr8DF7uRt/y0AdJ
         KmM65iSEXhemkjNV97MbJo5cc1+EZl/TIFpBeRGLPnCm+2mMlFbeYEq65aZByZ7V0aHy
         LU1A==
X-Forwarded-Encrypted: i=1; AKwUvBynXVNTBSBC9osdv/vVEvJOHzCaTzA9mMCcZEtG2GNHbBIHTnGLSJoBuzB5T10GTQmFdNnfI4nSRHxQvqM=@vger.kernel.org
X-Gm-Message-State: AFuF++nztt6QIWYxQ58CVyL97+zmktNojtwO9EmV6V4uvNB0WCrmhUqk
	JejtdU1th+YPKeV8TRRIv0d5Mf1txHk0bjD1FsJg2E2WTHLauof4Tv6d
X-Gm-Gg: AYBFou0ZiOitCzW4UsAlKEtWaGOxppFi91PyaC504Z1AY7954QYlD4XWpjMdaAnrvmK
	PpHL48qJzpyHRJw33z7R5vf786Ykh5hfWDDVO0ZvLI3JLMFIfIuuIU3xY9Aa7eQ3tD7LYT1WWya
	684/VG+q3Iu0yF7W7QW1DHBiymYBnN25RBTUpqbP7RGz5QTY2uk13/o9Cqgs7ZYGqlh2Tut6wWQ
	VWPylduuCTVw0R3bkBKHMK7gMJ9/26PmCs588EsFH+A9CDCkhlcoVxxmaKa+nSyiv/dQHClwfLe
	hI4GIzz6JolwO5LOvnmB09dRCQCWnbkA8s/3mwLWsO9BM17qBhM5QffExJ+Fp0JjknVTZvAx8X1
	DUb3qtXXcvqXD0ugGdueNw7f74pRhV+KKQoqHvYXgNm7M9YwR0hNVzpQl5EkO/RLLUj+G4ZB606
	/pWGbHKSwkgqaVbEgMSXkjux/+wnbDZsuVogZU6xaRL2j/lK2uriLayZ1Nj8s=
X-Received: by 2002:a05:600c:4f4d:b0:49c:dadb:18a7 with SMTP id 5b1f17b1804b1-49fe66cbb21mr116104615e9.10.1790340490347;
        Fri, 25 Sep 2026 05:48:10 -0700 (PDT)
Received: from fedora ([2a02:587:200f:d100:bf67:f785:caad:e278])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a36189bsm6670499f8f.21.2026.09.25.05.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:48:09 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Min Ma <mamin506@gmail.com>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Koby Elbaz <koby.elbaz@intel.com>,
	Konstantin Sinyuk <konstantin.sinyuk@intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	mail@taterr.org
Subject: [PATCH 1/2] accel/amdxdna: Replace create_singlethread_workqueue with alloc_ordered_workqueue
Date: Fri, 25 Sep 2026 15:48:03 +0300
Message-ID: <20260925124804.58808-2-mail@taterr.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925124804.58808-1-mail@taterr.org>
References: <20260925124804.58808-1-mail@taterr.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

create_singlethread_workqueue() is deprecated. Replace it with

alloc_ordered_workqueue() to use the shared system workqueue

infrastructure more efficiently.

WQ_MEM_RECLAIM is added to ensure the mailbox can process

interrupts under memory pressure.

Signed-off-by: George Karagounis <mail@taterr.org>
---
 drivers/accel/amdxdna/amdxdna_mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index cc8865f4e79c..05c3786de135 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -481,7 +481,7 @@ struct mailbox_channel *xdna_mailbox_alloc_channel(struct mailbox *mb)
 		return NULL;
 
 	INIT_WORK(&mb_chann->rx_work, mailbox_rx_worker);
-	mb_chann->work_q = create_singlethread_workqueue(MAILBOX_NAME);
+	mb_chann->work_q = alloc_ordered_workqueue(MAILBOX_NAME, WQ_MEM_RECLAIM);
 	if (!mb_chann->work_q) {
 		MB_ERR(mb_chann, "Create workqueue failed");
 		goto free_chann;
-- 
2.55.0

