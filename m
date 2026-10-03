Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4559F4078C5
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791022947; cv=none; b=WD+54+H67FIFaN1Fng8RwoAiz6o4wpy5EPdbV2l0ktQxByxL1Uv2rRyFszTfPpqzqIHhC+XPTP2imNJHZ8bQVoRRFyKUlSOTUnQSuKBvPtb3ZPdXD4SpJKao0mUfC9NfeSM3Vnjw9+XIcEDV2nYbQepVZtwNj5H6LzK/ZDSgk8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791022947; c=relaxed/simple;
	bh=9dbU2MdjPPQ+2L06YpaubCzSFA40VM5mN5AfcEjE9ko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iFNJN0vV//P+Uj9jozOYF1mvUNkMD8ohxj0iwduiQHMB6Eyj6UXirHK+uGvZ2a8uCFh6lbQsJd+BhODqD9gHkRT0g218/Ggg8DIc9mTCSsvxP+IPHxCDaAmQfpNf9ah9YQZXF8Tn+SJTmMwvW+7Sm+AiyRmUvOAJvX1cz7N5hVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWSkUf+P; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWSkUf+P"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a0a911e8d6so141850a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791022945; x=1791627745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BUMcFmx4x50WyYpp/LJX866o0Ow7gt7cpBwhiL0d2Ic=;
        b=UWSkUf+PEHylaSMq5Vy3FTo6DZK+MgmkajW2dK0w3tkmPO2Ah8vCiWtNwokrmiDXX9
         smeYQjm/1c1hTU4SPsYtq395XzCJok9ydVdda5z9aBXAwIQmL0HuJBRsfJ9prYdFPIzn
         ma7A4q+qebzcbf8pflOCi229JTJVJ4ozc48K3V7pheeSPEo5DmKayJCmqdP87LzL8WQL
         CWpVQ/vkfwM9G6b8qWc/L1cFWX2wTFNKTHt+fx3kZhfRs6ykB8GytJrLhgHtyAs5OR4a
         V4UIUGkPwpvFwR3eF6UKlTBvr/wkoQfcKThV46El7JYe4wgYRm8zNB4smGP9OpwTQexs
         VqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791022945; x=1791627745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUMcFmx4x50WyYpp/LJX866o0Ow7gt7cpBwhiL0d2Ic=;
        b=KDHUSZ82vi4TyfvN9Qa4Bw5KVv2plMntgcHszA98tnu5Fp3I6gYjJ2M8ss4V7J1vbc
         Tn5RFn83GITHT6Q6lLVMHbt/+O0yq8pQrU+LQS26BhYIj6iu+P+NeNO6/8nUtEUdF0xp
         F1RqjCk1auTXCJ6/A5OzcbFQwojoVZTIRfUJnNqkSvhD5tJjGvFVN0X+XbIHvRfYYW1h
         OMm7V2TpJXhiN2i7dqOq1LUR1pHugEDJSuNB8YnbA17+OFhXg+VRk/SLNVEpUDV+SVQU
         q3ebpaCvYY+3eAfvg3ElWhXOy07nyZfE8Brv6YbtZbYzTt30V7CNHmyEKpQBLkwPi9Or
         P/0g==
X-Forwarded-Encrypted: i=1; AKwUvByVHmRPNyYEdTC2Y0J0vwjZD9ELvFuPb4PodpanqcaFn8C+wULJnBWEtiOfJ542uHYiYL8/fSiP02bcudw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJHRuGNaaks100IGhdEZUx7QrbTAj5oGrfcHC4acaUYaJOTZv8
	RNnzKQLaatlsgWedGj6dcfGSwVQjXmQRGOVv2MfhcCveFp7nx46w/8c=
X-Gm-Gg: AYBFou3Ng56unvcXhaDQY+4Q8d3RTS3QHckJucpacCHmlmse7M01X+A7Za/yHInNvLS
	TpoBG8DaOdZYCd/qqFDyMKPQXJRWXMRi7HH2It5hvVJfAVvngqu3xl2cdPnwUc2CSF6IHhYg4tz
	VvNlntFgmx46K/pxbxgfBIV9WN/KLmXFHuKpTekueQODAb9rulJajX4fWi6WzgeDWgYul4kzlPU
	p5EnOLLNHD/TS4uM/6okkFoBduSsThFx7bFQhoTryZ8A5W/XmGof1pkXjJMAQLavVmjk1jJdx1t
	BcK65aGza/4WCb+nh6XwXmiaHQuFdKNt+h4oISGeE+RuwzyDdSfxelDnnviId1kl0nfdda48QnB
	IL+wgJKay4qnktxo37wRu3G7bQZCttOgvvGWH4DNlgAI/OwXGDA9KUdoU+aFuOK0ThVFKArhCbW
	w3UbDM4ZDQDitsttB0NY+HNGSJwLYf2TSg0rA5OLTm14Tjso/ZNjuRMbxSF8POGJqsBUB1C9zPU
	C62rbWOrFBeTYTGThxTpOKS
X-Received: by 2002:a17:90a:fc50:b0:3a2:b70b:9cc8 with SMTP id 98e67ed59e1d1-3a7877462d9mr1377137a91.61.1791022945437;
        Sat, 03 Oct 2026 03:22:25 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a79a98e7c0sm1240273a91.0.2026.10.03.03.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 03:22:25 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: bhelgaas@google.com
Cc: alistair@alistair23.me,
	jic23@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] PCI/DOE: Fix double free of a duplicate feature's sysfs name
Date: Sat,  3 Oct 2026 19:22:21 +0900
Message-ID: <20261003102221.59894-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a DOE feature is reported twice, sysfs_add_file_to_group() fails
with -EEXIST for the second copy and pci_doe_sysfs_feature_populate()
frees that attribute's name, but leaves the pointer in place.
pci_doe_sysfs_feature_remove() frees every name again when the device
is removed, or when a later feature fails to register, so the name is
freed twice:

  BUG: KASAN: double-free in pci_doe_sysfs_feature_remove+0x117/0x1b0
  Call Trace:
   kfree+0x11a/0x420
   pci_doe_sysfs_feature_remove+0x117/0x1b0
   pci_doe_sysfs_teardown+0x90/0xf0
   pci_remove_bus_device+0x128/0x2e0
   pci_stop_and_remove_bus_device_locked+0x1d/0x30
   remove_store+0xd2/0xf0

Clear the pointer after freeing the name.

Fixes: 2311ab1820fe ("PCI/DOE: Expose DOE features via sysfs")
Cc: stable@vger.kernel.org
Suggested-by: Alistair Francis <alistair@alistair23.me>
Assisted-by: LLM
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Changes in v2:
- Keep freeing the duplicate's name in pci_doe_sysfs_feature_populate()
  and clear the pointer, instead of leaving it to
  pci_doe_sysfs_feature_remove() (Alistair Francis)

v1: https://lore.kernel.org/all/20260928035035.252394-1-donggeunyoo.kernel@gmail.com/

Tested under QEMU (q35, cxl-type3, KASAN) on 72d3fcf802c4. The device
reports its CDAT feature once, so a test-only change either registers
its DOE capability as a second mailbox or inserts the feature N extra
times into one:

  case                                   before           after
  no duplicate, remove                   no report        no report
  no duplicate, a name fails at probe    no report        no report
  two mailboxes, remove                  double free      no report
  two mailboxes, 3 remove/rescan cycles  3 double frees   no report
  3 duplicates in one mailbox, remove    3 double frees   no report
  2 duplicates, a later name fails,      2 double frees   no report
    probed twice

The doe_features listing is the same before and after in every case.

 drivers/pci/doe.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/doe.c b/drivers/pci/doe.c
index ac95b1d2d9997..6b5d9ba8e9697 100644
--- a/drivers/pci/doe.c
+++ b/drivers/pci/doe.c
@@ -208,8 +208,9 @@ static int pci_doe_sysfs_feature_populate(struct pci_dev *pdev,
 				pci_warn(pdev, "Failed adding %s to sysfs group\n",
 					 attrs[i].attr.name);
 				goto fail;
-			} else
-				kfree(attrs[i].attr.name);
+			}
+			kfree(attrs[i].attr.name);
+			attrs[i].attr.name = NULL;
 		}
 	}
 
-- 
2.53.0

