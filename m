Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C3345D916
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452862; cv=none; b=UFRIgcIpz0ndBilXp87TCG8Bb4+/mQTNHf5F1nZegwzx02BVWVuzg44PekpxZIQ4DyQL1n+Lul5/IfetVK/hi52iIspUb1/0aAm1RPGWLdrtSMHzoWljL92zvmXnlCIeBTxMn2gyAnA44vSwCvO8biZqXvlndq7svTXxzqnYZzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452862; c=relaxed/simple;
	bh=de1VYtZxZuYBiolieKv4Kyss3CVyEfpOMQRSIaZrmXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n5/0lPO9hcomZgcnp7EAqJPXpRei2uRfcuYsDfFcz4v4asIBTYVjuGuaI7YStkEX/a9zQAGcWABzzPWTsFBo8qKWDUX6psyv3aEAhhHbNuaIDwxsNMkB2QCz3HpPzepPipjDIY0XtWGaxjBAH4/fsFPSeqXxOwzhLF4Wv9fYuxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVl9lkXs; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVl9lkXs"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-351767ef18cso1851341eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791452861; x=1792057661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P9ZyEwHBBKMRO++jPxVaJMCJG2/++7HjKeORRjTAHvM=;
        b=fVl9lkXsR+sFByD03Xpd8u3QlGcLSuvokB0qNKZ94ag1rvcL4P0Lo+rAjqKQjaPLrm
         lNdOtS6id1shetC/QG/PMJEWv0XYYG35Sio1w4jOfnADKqN/45o/Ql421Bw0HiFQXcnj
         AyPQJ436UAXVGC99G+BJgp5CTuWDkoZFgl93j/Gc8XpGf/F3tXtJ2NqTS+NJ9TXStZJF
         4pfwG17iZt7fbQb9agYxnp+ZPUZftV936BMLuRP1SjuUBLASU0788irNW0lNmnEoRhuV
         Wqto2x16Q9zCoE9kOBCQw/3P6o9seza+FD83wUt+aS5JF0JkK8+mdAVmwy2TXv3EE+hq
         +01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791452861; x=1792057661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9ZyEwHBBKMRO++jPxVaJMCJG2/++7HjKeORRjTAHvM=;
        b=hZ5B3yCG5NLIc4MNrp6aCDeUN/L2EDrm6rK3vhg0s2pQtyv9LWQWtUIBug4HgD4IBC
         bXgRmX794qrsq+twFd6mtmawMML6Z7UYg09si/plrvVKe5uqBUpLSpJ+sdE6JOZrR+No
         UaLKNt0cdlh1/ydBv2438LFLFbP4SkRhsaQNWQg1Azq+9omIYXfvA5JzFBTHy3ueXsjN
         g85N+b/euUntwgznya9ekGsYhk34g2KiXinQyhC8gsN6cMNfk/So13LNoy93o31prsJZ
         EE3Z/w2lKR1pAmTWC0fJxvWuKMZoLtjmMTmHCMSAq4N9mTB6XdfuOkJ76VWHIlJey/t4
         lB2A==
X-Forwarded-Encrypted: i=1; AKwUvBwQ18sjm5pCihYuOdyFhRUZdCBVgm8+7bDMhNU+qtcko7XBHFUqKnTHqKyiHCMlBx7o5ShRfdn0OiVHWbg=@vger.kernel.org
X-Gm-Message-State: AFuF++kVblT479/Josa5EcwBfUEBwn6ARUmSnlROGd+NGn+AIAXDBBeb
	ybigVZ0NfptRRerkEeKqYot3TESCLPwWR1H3ZQ0/ADyZ9mLdTVUZJQqV
X-Gm-Gg: AYBFou3oQcrch0LSr/UKV5wWOPa6pYPaurm2l6n4uBXgMBv8NCV+dOoRMD6jep647Lx
	ny+hqCPwK58EtY3rEU3975X8/iEohsrsBQKii8nOhSNpk2mCEI1tcWV95OEXIQDWfbtrwKGbCcI
	hZYevTV3NpmLykpM4QIbUliZtzyTal9PN4jr6c8ZTSEQ6wq29veb8TGlIP3VBMOgzVXYtgZ/POT
	KH3AVisfxMF3+zJafjw9nRIEzXLFxpTsa/VK8NUHPCVYTOPGrcmB5ZnTTvNrS8EBLkOjyCieSZn
	4SuIuKKJ7RzEbmnVayDp1nlvblp83/aiWaT9uUJ+Orqx79lmk4ec5pxsslmt4az20XDvOI7Ff3H
	P8EX+ARHjkjbtlH22uMNyJVuA/nvhMYvL9z7T++yWozAtFcCOiW3eaadHuHXem1hg35bF52Dbnz
	0YLOXVqHrXcI/T7O/wvDIhPmdliEyPmlALcbj4pT30nzCrDDA5MyF7Fd35G69yL1ESBbxVVgEQA
	PgEu05R3E79HfnebEIoEDbdTh4XoQWrDUpiMdggkprxLeORmBA06AOwAabMkrc=
X-Received: by 2002:a05:693c:820b:b0:342:547:cc49 with SMTP id 5a478bee46e88-3515de373e4mr6689477eec.25.1791452860606;
        Thu, 08 Oct 2026 02:47:40 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3002:e11e:c053:ebcb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c00sm14994424eec.8.2026.10.08.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:47:39 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Support Opensource <support.opensource@diasemi.com>,
	Roy Im <roy.im.opensource@diasemi.com>,
	Dan Murphy <dmurphy@ti.com>,
	Yegor Yefremov <yegorslists@googlemail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] Input: da7280 - fix input device parent assignment
Date: Thu,  8 Oct 2026 02:47:31 -0700
Message-ID: <20261008094736.918137-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assigning the I2C bus controller (client->dev.parent) instead of the
I2C client (&client->dev) as the parent device after
devm_input_allocate_device() causes input_register_device() to attach
the devm unregistration action to the parent controller device rather
than the client device. This leaves the input device registered on
driver unbind, leading to use-after-free.

devm_input_allocate_device() already sets input_dev->dev.parent to
&client->dev. Drop the redundant and erroneous assignment.

Fixes: cd3f609823a5 ("Input: new da7280 haptic driver")
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/da7280.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c
index 77fcf868dca2..e607836efb50 100644
--- a/drivers/input/misc/da7280.c
+++ b/drivers/input/misc/da7280.c
@@ -1218,7 +1218,6 @@ static int da7280_probe(struct i2c_client *client)
 	}
 
 	input_dev->name = "da7280-haptic";
-	input_dev->dev.parent = client->dev.parent;
 	input_dev->open = da7280_haptic_open;
 	input_dev->close = da7280_haptic_close;
 	input_set_drvdata(input_dev, haptics);
-- 
2.56.0.385.gd3acb90ef8-goog

