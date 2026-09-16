Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C754640BCD1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544281; cv=none; b=Il5W8bEoN4HQsaP6fEjtAzZ3fnLbozUchDBgKEYiXMh2hmsdKbdr8jCMK1mUyBxfVcKFsxg+XihWZQlhE+6PoKONC/BW1hfXWK6lNQSpZT7eIu2/XMNMbM6QtUK5SDHLDTu6L8sSw2LS+/HBMsSJeJF/d/NkJWKTcsN93jIg+LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544281; c=relaxed/simple;
	bh=j7jgslCWBYoA2+D+WAWshoZXYUkf/W7ampu9ziB7JwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RcpttW/0t2lhyY8D8vqGHfjNfiCnIEiBV7u3T90tyeIcxL/SjTYCKNsakzrmtNkI4AG1afPPBr83+E/mGFXww/EDCAArbWw2v4jRXqagNSS/GO6cIjcuHMMrro+DoReu8KsrbAjU/o2bE8DI8Hr1CH+puARmQFl+6GmuE+f4Prg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLpccVq0; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLpccVq0"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398c066106cso462467a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789544266; x=1790149066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4H2HhVJ8R9paQExr1TkyHeGUkf1dKuUDiaC/9DA+VGI=;
        b=nLpccVq0hHtlZbNAs98Jgt+76CGfUX68Ln80oDkeQBlYy7JFmmicRJ6k5gf7n2hv5V
         Ry1oRlg8QjBtsoAfC+ya83R+2uJtl7axr/P2VPBSNmxesoYqY8EWax0pXo3e6tD4t0J1
         lpRIt4KrttDtGEOKLOD4E7mgRhsDkGoUtZRATaGdqxmJNtC4lMKPF0D+PKLwgTEN1+ME
         /kTVJl63FBlC5rREfmacX0EIE/FcrCyX1sTO9cKTWKaY58n6sgeIazAaSXWf8AZbXOrL
         yO/EaWBYSYj6Px1lEVCI/N98hFD0z5eB4cjgpU3Cvhv+UQvd4G/CODofaGxRuGbUQF+x
         uqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544266; x=1790149066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4H2HhVJ8R9paQExr1TkyHeGUkf1dKuUDiaC/9DA+VGI=;
        b=e2bgQqa23gZjHdatWQ6xv59PqG87X7iYo2+LZR3ELZ7rkadodawWtAoUvsXKaV1Pmy
         2pd7RrgDalCUNq+jY3YI7YF1egPSSELNkOYZDQv0+ozKCTCr/iojxzJBxBUt0VNyDWfQ
         SwqP8DCkK1Xk8CRWHFG9rhHCJBwA4ttV3VXaxPJ6XRHGF9ubJzewcnqYo6C+JySn8XMd
         w5EfeS/95D1AmH/w2CPhTssH6VlkVaO0vtW4AELVY1nilEo/ZFJC0Gm0nV7JIizybsTw
         kWVEnRNwLtnSstL4Zhx6LblgNJoAkg3hsEC1r8QD7Pz2ZGuS71G597uE+pLHoSlpJYcP
         H4Xw==
X-Forwarded-Encrypted: i=1; AKwUvBw01m6RXbsww9/cywIvWVAhwWJOEcdOpyfrqhEIVlLBfgPKZSoWs2oGa15Z/JGuSYn2kADZIdWszEStS04=@vger.kernel.org
X-Gm-Message-State: AFuF++miQTvhS3vLOeAEc3/aHNmEUwu9hK5iHqc0UwN6m9KMTi+OG+8z
	OQDu5cDt43Ow/kH3iZzgu9ZNHjsunt2oFHKGSWZKJbnJIbrK8k1cLFem
X-Gm-Gg: AYBFou2T+XETWthiBl0CHxG775aNmyL2B1XL7YCKxoYiJpyvnjE5oNPPsLT39xb8bpN
	CVx+BOHQPU84SsngbXDXmST42AvAmFOytnHvz6rtLvj+dPHjKjVqkCyp9yDeuZ3CwDlNRf5kmy+
	dfjX5Uyrs/+X1V/rH0Pmi3ViNHz1idPokuzmWynUTmwyX0EwF5HLedDxUyQfNoCIzODRe4QvsqR
	h7WtNnZqIN1oQa3I7l4x6BJRIzL0gD3+4Q8XWsShibkyT/LfmkIboOghSY0mh7+FuUBe6e88BPz
	M6MsQPvs/qfl4vHSWgW0HhhCzlvPYoN/aFiCsS7NphzmLkgeEOLri+BfBWvkQqA8OjcdYJSFqQd
	VSH0mjpZqpLXrIvyi8X24NfHuYCv3pTZ3GiO4Ecqk7fV8O5lI8P6LMh/EQGceMSYuN2kE5W07Y/
	tduvN8ilAPB+tHO4RSg/S8uTP0OjyMK1GoLAUnJ1aN5j3dRwdT+Wjh/A==
X-Received: by 2002:a17:90b:3b91:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39e1e380e12mr3888761a91.11.1789544266209;
        Wed, 16 Sep 2026 00:37:46 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1c337e97sm897181a91.2.2026.09.16.00.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:37:45 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>,
	"John W. Linville" <linville@tuxdriver.com>,
	Ron Rindjunsky <ron.rindjunsky@intel.com>,
	Tomas Winkler <tomas.winkler@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: iwlegacy: 3945: free EEPROM data on remove
Date: Wed, 16 Sep 2026 15:37:36 +0800
Message-ID: <20260916073736.2952028-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

il3945_pci_probe() calls il_eeprom_init(), which allocates memory for
the EEPROM data. The probe failure paths release this allocation with
il_eeprom_free(), but the remove path does not free it after a
successful probe.

As a result, the EEPROM data is leaked when the PCI device is removed.

Free the EEPROM data in il3945_pci_remove() before releasing the
mac80211 hardware structure.

This issue was found by manual code inspection.

Fixes: 073d3f5f1b3b ("iwlwifi: changing EEPROM layout handling")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/wireless/intel/iwlegacy/3945-mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/intel/iwlegacy/3945-mac.c b/drivers/net/wireless/intel/iwlegacy/3945-mac.c
index cbaf250626c5..f7ca182d1494 100644
--- a/drivers/net/wireless/intel/iwlegacy/3945-mac.c
+++ b/drivers/net/wireless/intel/iwlegacy/3945-mac.c
@@ -3807,6 +3807,7 @@ il3945_pci_remove(struct pci_dev *pdev)
 
 	il_free_channel_map(il);
 	il_free_geos(il);
+	il_eeprom_free(il);
 	kfree(il->scan_cmd);
 	dev_kfree_skb(il->beacon_skb);
 	ieee80211_free_hw(il->hw);
-- 
2.43.0

