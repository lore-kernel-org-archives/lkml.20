Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA71D2F1FED
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434138; cv=none; b=EF9PJXzoGYGpiAsRVfxE0HagsOnuaUxS6lI5VNkHRxpzYHN5V/6/L/kD7/K4Z49ltOluSnHfzcR/JYUudFU8vUPifHUiaaRA2IHhAHiucV4XO+A5G59bI7+at2kefh2EEP8i2QgH3qd6Yev/d9tS57tOotk9wLkx/7YJoPHlc7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434138; c=relaxed/simple;
	bh=cEPjvYmUpZzkbb1qaVYv5rKfnVTnkZ4bUmEcd21UiGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XddJkdN48XwhN0HZKOlm9wJzGGOxXiMPQ4jsacyBSr1est/X/AMNBO9RgJ17T9WOD3+a2U4kshkKFELrB6V1+u1ykt3PL5q7OjH6HW3iI8y2aqtq6FiJHA2jNL/KEjR57y7XkY6dgrHBllLPlvazyXnWy3Hz8otVXw6G1Zttw7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZFe0V41; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZFe0V41"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcbe20aso33400156d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434136; x=1790038936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t1LNCA2rVzMsb3MvU5q313bU41WDHWDxRU5eL4UYHU0=;
        b=kZFe0V41S6X1LEVc4McSBjHP3wpzUjXEL07O9l27zbrDk69kwc0yOEctUmgN44ZvE3
         Pqolor1qG5f6crA15wZ6vlNcYYIxnMEate1T54ab1Z2k2XMZoINdD7z2uKqMMDh0q1EC
         qDep3QGhUvOniuJgvW4i1HgFm5r9z8dqXHTq+Jv5MznXHhWVq3jj8nX4noP3rYBY1QOe
         ttl80keYxgRhFGK652oIdPcbe3yBsSaWsUR1GuI1+vMcXGygEH1zBEMdn67u8DqJMRFR
         wI06g7XnPjwS3fgrn6rHzNoy4TsIDfS4BbrbKi9uU2zdNcUx6Q2XQDuvC5sw5Pn81Xv8
         Q6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434136; x=1790038936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t1LNCA2rVzMsb3MvU5q313bU41WDHWDxRU5eL4UYHU0=;
        b=M2+a79W329FfZ4oloOse6EPODDlVDWlk9bajG1S2WVS9UD+3QVPkvKrXHqJQZnwMDj
         O3qdNWDoQuIIgmI6CjLilQl2ende7qG3WG4x0FsW9LCuZlpw1ALmyz6V50wE6OUDNXJA
         5eoOp5ZccdSs0io2de6FkTO4s43f7s37IaPhj5z0KTGnmnLuSEyDHc66H3TzNC1WErQ+
         RFjRhxHMZmJHaz0H/zh+1LHU6KR+Sfrb4PdG9iP5HdEVI91jooIQ22r4JZluqZpMPTWA
         OtyDKseBwR3IpIo7PlE5o63Mqxeai6uek/5X6y7zh9vThLiO34fEm7O7/0mjNZsoreSb
         QY6A==
X-Forwarded-Encrypted: i=1; AKwUvBwqrnZpdGrwGaUP9TgzkiekcPApA9ZFsWIHgKAv+j92NiPy3FBb4BSRJkMJ0iw+3iAIyb1Jwk0VzD4BOM4=@vger.kernel.org
X-Gm-Message-State: AFuF++kqq2fMbBF76VVwTA36OT6KaKvkpyUHYHRGj5TJXxFjfIcMj6X6
	vHRQsNvJR56Peh8N+9/X7ilfLqb42PwKz+5KPkVpBStPZJ//Y5HnwqM=
X-Gm-Gg: AYBFou3JinappziB986bUElSAHZgIxWUjiW4e5knXoGZ32+TO/ghXj0jo3u8bhkdylt
	Yq6qPAonZEAFMl5iyCgNqOcdTZYKrm4t1NsUd40gOv2qmZbEyLOlN4v0mOoYlvLFvZXbL8YgJts
	1t3tojSkgczT8q4DduT8DvyunbqIU1lrdxBMrY0j0Rvut08tPLBRnmAA0WmGZ1V9zOG6DVJnZI4
	mIHh1dCCjOVVTeBTukg0vz8+5vVhU2oZiTG5lfkt2tY0+Z8uC69XNoSOTSlE+CpGY4iPPPnxoNR
	XrzfzqT5tlMs7w3OE/wApBqclLEF0mLmZq18ODBR5XCEyUoHrQYGx9FGzoYWz7EIpD7lAmjdCPQ
	lUZBpgojP3S6HInX4hf2ydYZmXEeqlQt2AEyfqdsBIbIcnLWeiHfaYYocjcps//AGhlBGHQwy5s
	bUTTgLBWFeo6x/FFEux/qxAl5csLEG1pY2EqUjGAmvQcqkqsoAPdEyliz2eqB77B1wSf8t/IXk8
	rE3w+tTEQ+uIgSPxjushQ1pFYF1x446et38L5EvfXHpDRRrc/9CUJzNff+cC+/yVasfhlYz9dM/
	wXVlSnC6uUgsbMY/zUUz6uc2+mc1ZFn9jl2mIT2NaAZPCZSDGnnUc39ICi+14Vk995mxyw==
X-Received: by 2002:a05:6214:1942:b0:910:48eb:605c with SMTP id 6a1803df08f44-9122e676001mr87569056d6.28.1789434135881;
        Mon, 14 Sep 2026 18:02:15 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d51ffsm110574986d6.45.2026.09.14.18.02.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:02:15 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Hannes Reinecke <hare@suse.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] scsi: aic79xx: Disable the PCI device on removal
Date: Mon, 14 Sep 2026 21:02:08 -0400
Message-ID: <20260915010209.53250-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ahd_linux_pci_dev_probe() enables the PCI device, but removal leaves
its enable reference outstanding. Disable it after ahd_free() has
finished shutting down the controller and releasing its resources.

The imbalance is already present in the initial Git import.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/scsi/aic7xxx/aic79xx_osm_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/aic7xxx/aic79xx_osm_pci.c b/drivers/scsi/aic7xxx/aic79xx_osm_pci.c
--- a/drivers/scsi/aic7xxx/aic79xx_osm_pci.c
+++ b/drivers/scsi/aic7xxx/aic79xx_osm_pci.c
@@ -113,6 +113,7 @@ ahd_linux_pci_dev_remove(struct pci_dev *pdev)
 	ahd_intr_enable(ahd, FALSE);
 	ahd_unlock(ahd, &s);
 	ahd_free(ahd);
+	pci_disable_device(pdev);
 }
 
 static void
