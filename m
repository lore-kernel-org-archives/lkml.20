Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC583483BDA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498405; cv=none; b=hKCFEtONqlsnR0INYopRGl5cYR5ZTxU+Fg1bS46XJiLO63K7ZwTMZeb8Z/Kl9ae2FgfrFR53kKkWmeYhXXRuBLXC8L30UsalhQUSq1lLNmCowdvLdDI8sW9wglWRR+V5YpBXSQTIrYHAbl0NHZ+EohnsZVuGKANKNJjfRIyKbV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498405; c=relaxed/simple;
	bh=BdXuWYnFC6mW8AzlAuTnRylrEW9B8jQRjQdbFJ/Dv3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dq5c8uvffSfF70v2VWKrhJN7rZ3LHrlAboVII7iCph8wqxa5KVOcZk0iBXfbKsmHtwZgiXsELsv/H98aK3q4bW4R47bhtDqPpIepFTyHHMyITN97nUv+UA8DchDlMuDhvoSEPHALulOh4tvYigY9UQg9mkD22Dv8pKc2Br4nVUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnBs20N7; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnBs20N7"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3535aa147d8so58523eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791498403; x=1792103203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8HRxgfJUsb3JUSHlaPlRDGMli+DzHQt8v9NsuQ2Tag=;
        b=BnBs20N7d1oy2GR7K4YqFp0JzRUjBl4RvbTyV7SOMbZ4XH90iWGuG+79woqLoQVBiA
         GHZVIWkD3Ua0RGgbmDK2HseVGAVMR+c8/VjHSnvOrATwD/4cACr5WwnVq7AQF+iHnaeD
         qH8KLYTGC4fuz+AIFEXsGjyGQ9mbxNUgSqXThoX2UZ7Mowbf2CgvBptKZlY/+o+h7Iu1
         FMfS3aR3C4UvtE1nAEg9wIO9K2/SSvRGza3VqH+PXT+OCcqUv52adt1no9aN7dhFc093
         WWgwnv2MCYUDBFFEYRZ+aUv7aZ+JPfrcr2qZVwooYN9F+BILRLQpsPo669VRmQvSsesT
         LN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791498403; x=1792103203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H8HRxgfJUsb3JUSHlaPlRDGMli+DzHQt8v9NsuQ2Tag=;
        b=i6gCf9rfz0CeXIf5dW0rtu/ndJQbfg+XskibvNjldhfxUoMyNoZNP4aPBErQ6Z9BgZ
         3ODR0Pi2Dtl2uEhLRfD4btYOvBH4eYJx7oy0Z8OSf8enF+esWKzJpRUQdYCwSFEKusSe
         tP6XW+1T89mLIKwPX4p0fE5+VP2wmb0AXauaSlB+Krn2HGYDO9sZ5Av7Idgag6AwjhpR
         HiK/5GYjpTZ0xCZk7mmRvZNYrOLcQ9jQnnJ5F6SRuadeQasHUQdoevzt8W5tu+Fe3wKS
         I/iVnsQihBc50NuTaKlGBnnQHX0GrWRgiRVwHCMM/ZpfzDuCP42x5j6VbeoRCrOvG9UD
         yMVw==
X-Forwarded-Encrypted: i=1; AKwUvBxEndufeke9LqZHQSaE5y9rGbEmVD/RdhPHtF7NqTmY/jszjkI01YOCEiJoeE6j4hfD8ubaSeB+irQG574=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwpRvx66SG221ZX0yC8YsLcH9sllKH3Ml5i1IIRNGHx+HCAkp6
	fpFHEKXwxrEviNlGNRMRrGCQsDM5rwo6CN+ZPwV9HBXnP5mCEYfDxW7I
X-Gm-Gg: AYBFou3cbG9OBv7yM3G6qiBR4BnfWjn3tJz46WhhyZCa9T0SAit6WKdc4Cr73TC6ufw
	Qu3VbS81wf89tD3m2tJUeS7GwnpKDdL54sbJW5180DM6T9/zfoIFA1RfpgsChTuLC/WYe6QsLPX
	3MTAn4gc/XQR76AZz0FNLqsFu73fdHPQCVOZ6YPZZb2PEfBNeWMTqtG2YaSLcifQE3jQfmcqWwL
	SscCmZ7OOQZmkXh8HAELoFwxw4cDCxmMc6ZzpMLPVCNWjpOq6NfYALI8E5Ui29Bm1kLixDaIeH9
	013OHPCaPvWZBvg9qxUqYhypr12SJQokxwR2BkDY4GLGYqN4K/Vg+aBJ3jxVTjXVvH8SX2n9KZJ
	UqSroDeoFmYtGnzx2H6Tk6JKZpmrUARWMy3BqWkwkX+ohF6RWImQR0pCTQpomLxsmHcFk8BRkIU
	y+pFIuqlt733/XbxRq7n/mfCVvSEeY2iLsVY7SnYRE1AMpCMBFWJBkwz+OGaasIkqfNC2moqpM6
	Olip7b8SjdowdONMg9qVaADNWy0Jrgc13CmTpwH
X-Received: by 2002:a05:7301:4d0b:b0:33e:6714:3945 with SMTP id 5a478bee46e88-3537e0129e3mr468276eec.2.1791498402836;
        Thu, 08 Oct 2026 15:26:42 -0700 (PDT)
Received: from hitalo (208-33-161-131.in-addr.arpa.host.souuni.com. [131.161.33.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1d6e6sm985148eec.24.2026.10.08.15.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:26:42 -0700 (PDT)
From: Hitalo Souza <enghitalo@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org,
	Hitalo Souza <enghitalo@gmail.com>
Subject: [PATCH v3 6/6] Bluetooth: hci_event: Notify the driver only of SCO links that came up
Date: Thu,  8 Oct 2026 18:26:16 -0400
Message-ID: <20261008222616.2780570-7-enghitalo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008222616.2780570-1-enghitalo@gmail.com>
References: <20261008222616.2780570-1-enghitalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hci_sync_conn_complete_evt() notifies the driver of the air mode of a
synchronous connection whether or not its link came up, while
hci_conn_complete_evt() only does it for a link that did. A connection
whose link failed, or that refused the handle as it is being aborted,
is deleted right after, which notifies HCI_NOTIFY_DISABLE_SCO. btusb
picks the alternate setting of its isochronous interface from the latest
of these notifications whenever the number of SCO connections changes,
and HCI_NOTIFY_DISABLE_SCO selects no air mode: with another SCO
connection still up, the interface ends up at alternate setting 0, which
stops the audio of the connection that is up.

Only notify the driver when the link came up.

Fixes: 1f8330ea1692 ("Bluetooth: add support to notify using SCO air mode")
Assisted-by: LLM
Signed-off-by: Hitalo Souza <enghitalo@gmail.com>
---
 net/bluetooth/hci_event.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 14270711c..28fefddf9 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -5307,10 +5307,11 @@ static void hci_sync_conn_complete_evt(struct hci_dev *hdev, void *data,
 	}
 
 	bt_dev_dbg(hdev, "SCO connected with air mode: %02x", ev->air_mode);
-	/* Notify only in case of SCO over HCI transport data path which
-	 * is zero and non-zero value shall be non-HCI transport data path
+	/* Notify only of a link that came up, and only in case of SCO over
+	 * HCI transport data path which is zero and non-zero value shall be
+	 * non-HCI transport data path
 	 */
-	if (conn->codec.data_path == 0 && hdev->notify) {
+	if (!status && conn->codec.data_path == 0 && hdev->notify) {
 		switch (ev->air_mode) {
 		case 0x02:
 			hdev->notify(hdev, HCI_NOTIFY_ENABLE_SCO_CVSD);
-- 
2.55.0

