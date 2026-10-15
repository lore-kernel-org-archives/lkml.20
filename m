Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A494A0139;
	Thu, 15 Oct 2026 07:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050633; cv=none; b=a/HmMuv1G4z6FsJxG/e/B+ay8PAx3oOMW9k7JW8B0yXA3yaLqU1+H5Ha+MtPOAtNONMMdVsPNar8ROAmk5FhcRRaP1H1y/JKFibHYVaVyZJN0aROf/BhthgX6C7VZcSaPnVmcB5s8vZvrbj2nnWW4olj+YOyF16Sdz1hqdQf12o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050633; c=relaxed/simple;
	bh=9xlHMAg+pLpEUPjfC3UrydALwWkve/cTUyWHyXeG1OA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Izogr6Amae+Ji9sYa3eB7D2jEL1JLazXab2m/cQtArAtgT7T6X1ci39LgJxfvnEmyXyAr8+qfNUg4xsnfyexDvfxiKdTOJp8cyUVKo0dhpAzyiIgzJ73Rbm1juBj5W+kM3NUsOg6vasvKxIBJj/5fHKgrJXV5JOCFe92q5ArFoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxBWy62F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxBWy62F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987D51F000C4;
	Thu, 15 Oct 2026 07:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792050629;
	bh=S5Xoohl7ceaKOSgxKaTChqZl5aHhcT0j56kwkJwhlao=;
	h=From:To:Cc:Subject:Date;
	b=KxBWy62FaRmL2+EFEOTgiKczznGn1qEUIqwYNOxD9MgAJBwzO0HAHIWB+LNqXKyFm
	 syIpgi24rxhDKrWbquh1NwBxXZS2IDZyirh2cCG0J9POnr8oQRNydFxrC2AUbQZ6ns
	 JG+ksyPztoVufFmWBOBF7ZuInFrjxETuTAZPP5PedoyvwbAlN1zmZjSIym7joRDBVw
	 1iP+9dqJ3l8iKvpKSBkIhWZeFOaYwv+Xiz36TR+0ta+oZjkLXL9Lu+JO1Zm5Oo5uHf
	 fIH8DO/2WRom3G+T8Q0wn+yt8fJROxWv/c4OVsQKA1etud1l0E0JPurH+lcsjTD4Dv
	 ZiN7ej3tdnaoQ==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xHGEN-00000005x5d-184r;
	Thu, 15 Oct 2026 09:50:27 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] USB: core: document purpose of interface parent reference
Date: Thu, 15 Oct 2026 09:48:31 +0200
Message-ID: <20261015074831.1418677-1-johan@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB interfaces hold a reference to their parent USB device to make sure
they do not outlive the parent.

Add a comment explaining that this reference is specifically needed for
asynchronous device resets and the device type need_parent_lock feature
(to allow driver core to lock the parent when only holding a reference
to the interface).

See commits:

  524134d42231 ("USB: don't cancel queued resets when unbinding drivers")
  af61396a992b ("driver core: fix parent lock use-after-free on USB disconnect")

for further details.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/core/message.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 276768f47558..a738d03c23ea 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -2209,6 +2209,11 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
 		pm_runtime_no_callbacks(&intf->dev);
 		dev_set_name(&intf->dev, "%d-%s:%d.%d", dev->bus->busnum,
 				dev->devpath, configuration, ifnum);
+		/*
+		 * Make sure the interface does not outlive its parent (e.g.
+		 * as needed for usb_queue_reset_device() and
+		 * usb_if_device_type->need_parent_lock).
+		 */
 		usb_get_dev(dev);
 	}
 	kfree(new_interfaces);
-- 
2.55.0

