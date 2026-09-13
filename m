Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC64389111
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334095; cv=none; b=seE3sqi5eHMH8RM08hp/4YPWSKHYBX9KRQoBaUmSZkwVpZQ4i80nCrMr6tU7yPUuiU/KM1VnNw1w2YbpsSHz2vYYIzjqKQLiN4a19HMPSx1k8RRCdl3N1PvknC1P3HUtjCeum/94yaYiLjiluHA0WMY3RLMlcpfS428XO2bpZf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334095; c=relaxed/simple;
	bh=6QTSFu+QYOXAVxnu/+LpbdSsP3vJnCO72sARPcer6a0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sG0lgsm8rJzVzqsB5KVlTReYoBHxoMGIzfJZcBBoIJNL4G2oJIa4Qu7P+bTLeg67wL0Kf4Zu8sksE8capHPhDOp0C5gWajBLrJrfQ9UMP2MuYiN3f2aVNdPTzSu3z24DCkbrBart+2N/C9X86cisf2/wNVOHszS9WU3EmvvzYdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlFyf5pM; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlFyf5pM"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b8eb7f9so2942325ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789334093; x=1789938893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FAwWGoInaiibNI+PkowbPr1zLMnMrJfky1hPSvm8w8c=;
        b=FlFyf5pM3GAYs+p80ct4FtxkI7VJKlxyKL40ziyCnozRwlo7z7NDVd/8l7j99srd50
         R2reYFKpF/w5fROIsmB5++KmacplBm5+Pv/RMIDZ2EhWGB2OpJLSIOdiNfsRYh8XPVy1
         +KWhz+SikqZnPFlHW3Muchys0TjeK9BbFHhZ2FBuVZkBnSts9dTWLEN7cTzacP/1VSE7
         9g9LnMo9J9f42Ms4UjjFtYMuB7zwgKbrQfuI6EU0JmT5QMEXP2fLJ5xjdek3EQ0Rp2F1
         cid3JtjAQCdi9CG7Zq5sIIedUZmG4gDHq7b/PRfWD358gPpSoXMkm1QtzsdDNQWQ1wrO
         v5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789334093; x=1789938893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FAwWGoInaiibNI+PkowbPr1zLMnMrJfky1hPSvm8w8c=;
        b=Yxd93sUte92K5GFrVgUKvpq4j0H9xBc66tste299fMDuRzxEc+f5vCwL8BEIImnbtf
         sZmLn7eUhuPdlXRW3h1Q556YvcTqOFuwt7bCOpwDBTTgLTq4xVUF5EWc2tCw0RfdkKhB
         DDndPPW9KIjWWl+XJptl5YIfW7bLMH9e2Br/pBkY0SMxzxU6dD/ewiuP+HXgVFJZQSKY
         /XpWJ5E8xabEv2159FDlAq7gQWwGg6gUGPhYcd/afmGoJHziLZ/BWbO65VMBA9Z33YeG
         jKrH4rZnGZTRgnm5nqAVwEB6IfHbvMhRHo0B3LtufvrI8mhXP9eedb+Ggxg0g82/aCnV
         PJuA==
X-Forwarded-Encrypted: i=1; AKwUvBywxO+M6dNEn7aM0FUzVZ1USHgFZT0Gxn0W6uBfCa/TBwu0zqlf3sEaW5bdcu2ETcovwqncSqkAbenWiKw=@vger.kernel.org
X-Gm-Message-State: AFuF++knNoXN5RjZ09yO9Bsc0BlAoTOtvJgHQx5ABIOEHvWCEwQth1h/
	AIWlOKzUECZfhJ9JH8eEZcYzTll8WfjC3CTaFpAKs30ZUL6jEQoDekwo
X-Gm-Gg: AYBFou10gZvynzwIHKDdxLDzdqg4aepm5As22dmEXrHOA2t0SEgLlul948Gv7TKcciV
	wW1Z59vwPAf06TlQJHIP2nv/c7YtQIlQTdkSztem7DOfLJQ1f9zRY7eWWYS7l/B0fztacfgYAX9
	yyzBIGsFugGi128YKvp91WahjUL/qUHcFGPMUUKA/EcJipoUE23V/9DQ3WMWJOqHWcsk/WiYrgn
	aGD2FjNWgTsuWxgQevYgHjO1+f6xbf6SYqifTUl2snRufp4mKN1bs4zrSl0HKjXOJhwPQ/nZ2Z/
	Ef8+rBoJCY/JCTh5dYqW0MySQRfKZOBoYqwRb00WFHMMP8+KdbOmWzKknDVozJ18HgaGSBx3lcp
	RxFoqqj97QWYBDJElcW1G5Yamw2EOYWd4lBgZ4txI4uDASMTGrTZEXxJuI4qIvDw2RJa+8O3aXH
	bmZj/wI4DtnTLFZVP2rWsr0XBHpk7FxKmM1CFQAtYjDlOA7eO5zmfSLjRc5NzFA4huaqw7pf2mu
	1fvsNAb2IeXAyKgvaoH7vxHrTGrDW9/5BUmRZ5fyfm9wrG37Rc3ufzEhuGN97ivMYPmIPBu4Raj
	atMEXI6i5GR1ngreq7kv
X-Received: by 2002:a17:90b:3808:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-39d9c2249c2mr15929475a91.4.1789334092888;
        Sun, 13 Sep 2026 14:14:52 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm21382925c88.3.2026.09.13.14.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:14:52 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: miriam.rachel.korenblit@intel.com,
	linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	helgaas@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	emmanuel.grumbach@intel.com,
	nika@nikableh.moe,
	mpearson-lenovo@squebb.ca,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Navon John Lukose <navonjohnlukose@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH wireless v3 3/4] wifi: iwlwifi: pcie: deselect the product reset mode at probe
Date: Mon, 14 Sep 2026 02:44:27 +0530
Message-ID: <c370900547aa57b4397e5ea9b7b456b82256ddea.1789333511.git.navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789333511.git.navonjohnlukose@gmail.com>
References: <cover.1789333511.git.navonjohnlukose@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The product reset mode lives in the platform's ACPI namespace, so it
outlives the trans that set it. _RST branches on it and does not clear it,
and the deselect in iwl_trans_pcie_removal_wk() is a DSM that fails once
the device is off the bus, so a later request for a function level reset
can get a full product reset instead, with Bluetooth still bound. Deselect
it at probe.

Cc: stable@vger.kernel.org
Fixes: 9673c35486d4 ("wifi: iwlwifi: implement product reset for TOP errors")
Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---
Patch 4 depends on this, not the other way round. By the time a recovery
reset runs, the disarm in .resume has already failed, so the probe deselect
after the rescan is what clears the mode. This one therefore stands alone
as a fix and is tagged for stable while patch 4 is not.

 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
index e5edcc2..d93d8f9 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
@@ -4256,6 +4256,8 @@ int iwl_pci_gen1_2_probe(struct pci_dev *pdev,
 
 	iwl_trans_pcie_check_product_reset_status(pdev);
 	iwl_trans_pcie_check_product_reset_mode(pdev);
+	/* a previous trans may have left the mode selected */
+	iwl_trans_pcie_set_product_reset(pdev, false, mac_cfg->integrated);
 
 	/* set the things we know so far for the grab NIC access */
 	iwl_trans_set_info(iwl_trans, &info);
