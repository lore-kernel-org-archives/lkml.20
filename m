Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD873FD12A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762885; cv=none; b=hNjqDb1InYWPdQTspNT8MJfGAfste3W3c7kfHk+gxjv+OteaP9N9DDgK5McnIbIgcssgbZjN7HG44f+ofEafNue+3L+KV+SUUoIJcDsmXmFhPcrmzFhG1LvjiauQwdVcbqg/W6yun7kj1HLMEvZYDLvEcoW/n+WFeumpYzc7bo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762885; c=relaxed/simple;
	bh=mF5bB7ZuCeAivvXX11QVrUiyugh1yN50bL/u3C6zj6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZPFq08mkIbtRhVM7HZyr60Yas0AvLuPIa6WpX0gAz4T7LHXiR+A3+cgeapBcZeHqzdcy1JpTddvdzock+i6qPBL9stTv3K2VmqRyqISZjLFg5xQghqdTQtnB3cASPMI5DbFcR9foAPDvmhpRotBN6/EfgJd3Ot+APYdRRLHkfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrkcdD9h; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrkcdD9h"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-853c07a76adso3025703b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762883; x=1789367683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWG6h0UUZGYCltMe9vagrJc+4k4VjMae5SVmtvIpYNk=;
        b=JrkcdD9hatFHmiZlW9A/C3rCzzpmyLs05+cr91F5kv28Rq82oxifSzUcxdTF+FJVE3
         2wll57XpAc8Y6wWDiTDN9p8JDP48G/pxF9Ws5Gn9aqBCtgy26JfupEbrbkkZ4a/zH+5L
         ZhQXkQG4tKjTB1ITrNfX6jKORwkj5VYVW6Z3jVS92LeyHvmUI4FCP5yJoz6G8QQKnb/G
         nhZb2sPywuzWGe1BnfikTOkzyYS/xFnclL88vPp5og19gpWhPu4CLRi0EevpKcVBZcKw
         q7Qemi2C1cjMpyQZvYW7VsNKOcrz3sFLqVLvBHqdgbiQezyQAS1T0/HCC3WtrfUMpYt+
         qzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762883; x=1789367683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WWG6h0UUZGYCltMe9vagrJc+4k4VjMae5SVmtvIpYNk=;
        b=cYuUQr3XKUgENnu+cvpToEYgaq2kKfumDT5xz2pzSJVHkJYYKLJm+UKQoDlH54Rs3x
         NOFPJ1YvXdDZAZeG6DrRhf1ks1ECfnhS1G4JZ2kuYakFXVTk9VkqYN80TeOZLQh5iukm
         1gmhZ7ICaZG70ADzYS41swdCmFnrAARuUsP5yRMP6TSEpvmmhGQXuTBbMJRChFqdTPtf
         AKWOt6u6+cCYvLIepFkXe/rLJjgkcNs9K1JfTLIehiYhx6l4kNbHn14cKYiZjeSRaUqC
         /Q4qnrlgtkwtwbYckzzsRZ4Ne7kKU9byaxsx7/rQvt5U3FwBW+BjlkBZMxjK/YLVBAG5
         OsJw==
X-Forwarded-Encrypted: i=1; AKwUvByUCZSPcAWKRU6AD/WPbmUM48K3HJw0YC97rplurKi8i8Gg/aRdPXztpqqZ+FxK6gENnQ+PNhIEMovhYRc=@vger.kernel.org
X-Gm-Message-State: AFuF++kqNWWiajqfmp48rn4szOWnM6ujD0SOt5rN1HL+GKxnJH1cqfqH
	zciqIpOtcdSJMkCoIW9zS/NSIGqcGRLuJptW6aEbDadKa2oEnUywGkfm
X-Gm-Gg: AYBFou3xVKKrRJsBTWgToUo5u6VYoIvvUirmFPbJoEwfKekInmApbYofpxn805s0NoH
	qqi6dolOJAe4igsFCMmz/zKeAk3V1RvGqoQNJBJoEmEg8iqY6lEPGK/re+pT8bMFdMAsJWxOb/q
	4TV5d/URG+guM+lyH+pahkkVjqjzm0q0XIMU2MOtwtMd4Kojmhkfr1AItzTgkjSZ7QHsk5YNvkm
	/ZnIvTEdvHXf9WV3Jz8DTa40mx8Xtugm+2LQbiZieZqMElrji/jll7PH2funLIS0nLtFgHLMFYm
	XJwNZC8aqw95kNi0QCZf9x6f3TAlFbHubpueHEqoSDi0vBPZfl2oPNVUCI5Uh0lfVk+xIQN/pjP
	y3SjJ8XgnRBUuwAp8nSrM8cIU7aqprIUsnxEmekztuHR+7mYalfHk24LxZvGUL4DG0WOQ6U5ItX
	Ww5Sfke/7lhiCjLTwPZ5qx/Y4nwoA9UgS+D2oJdJMTC8Ea0pftEEZekkebfafL9Ruj+SbK8H+zH
	/CopuZwlHe5qg==
X-Received: by 2002:a05:6a20:3ca8:b0:3c4:46ca:334b with SMTP id adf61e73a8af0-3da39cf4744mr31751078637.9.1788762882626;
        Sun, 06 Sep 2026 23:34:42 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm27634416c88.15.2026.09.06.23.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:34:42 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Ira Weiny <iweiny@kernel.org>
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] nvdimm: fix typos in comments
Date: Mon,  7 Sep 2026 12:04:33 +0530
Message-ID: <20260907063434.23060-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907063434.23060-1-hemanth.selam@gmail.com>
References: <20260907063434.23060-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/nvdimm/namespace_devs.c | 2 +-
 include/linux/libnvdimm.h       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
index 557fe0cb43e2..4935c6508448 100644
--- a/drivers/nvdimm/namespace_devs.c
+++ b/drivers/nvdimm/namespace_devs.c
@@ -1448,7 +1448,7 @@ struct nd_namespace_common *nvdimm_namespace_common_probe(struct device *dev)
 			return ERR_PTR(-ENODEV);
 
 		/*
-		 * Flush any in-progess probes / removals in the driver
+		 * Flush any in-progress probes / removals in the driver
 		 * for the raw personality of this namespace.
 		 */
 		device_lock(&ndns->dev);
diff --git a/include/linux/libnvdimm.h b/include/linux/libnvdimm.h
index d929d83abf3b..586421b86162 100644
--- a/include/linux/libnvdimm.h
+++ b/include/linux/libnvdimm.h
@@ -59,7 +59,7 @@ enum {
 	ND_REGION_PERSIST_CACHE = 1,
 	/*
 	 * Platform provides mechanisms to automatically flush outstanding
-	 * write data from memory controler to pmem on system power loss.
+	 * write data from memory controller to pmem on system power loss.
 	 * (ADR)
 	 */
 	ND_REGION_PERSIST_MEMCTRL = 2,
-- 
2.48.1

