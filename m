Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88484BD10B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005345; cv=none; b=It+N39sGPaPxxpM9aeqpoz6W7uhviig9zd5TULza5prPkWFu7RTMEy2O8GGF0RDxTinxx42TPfu15MBIgXo56Jq340spqwsQ5xFUY3k2vq3C49JrgRDSfNZeLXmGrccbjAZa1zqXUr31qQ9VH1cbp9SO4FWATNwPxCaXn2FnaYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005345; c=relaxed/simple;
	bh=lRZjMrGJtMkO5fjKjctGS+IB0XlrEM2bLj8+OXK50P8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9rK+g7VEwOORDHmzS0v10RzzrBx9DKQC1dmyMR8WAzu3hxlmXlgT8psxvB9/vWHlKGYvgnzLWi6OZunvw+OUmuTRLsROW0p+N/Xc6PSlp11hC2nXgmzb+FWku6ZLh/RfZkRHZbwQaqMfOHvMI3cndDg68CE6057iUU1Jb9jvZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWSjkzkA; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWSjkzkA"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86e6d007703so2634330b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790005343; x=1790610143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvCNVHGgMCfVbha0X/YNf7Xfe8skNfPu5j6zn9xlEcI=;
        b=LWSjkzkAxtngWvNPj+ec2XnJNetA4WlVoAxfp6GBSUuAVxgvUmmtr0gEEdy95h0HMI
         VR+wIHYLA0qMjd2RSNJdid3HSbBaRczUF6O5hYg06mgYeT8izXmpOGTPh5maK2WcMjqs
         f+yPkTomLK6SsRJzuQbujYfIvZA3jM61fkWKGZAYz9ay/NNSIZlQaHA9JbsKuauUFwIr
         0/Vv4+MmS0IYiw76JnjR10ewGaeZ2Qn/Udcgw78Rormfm26Eo2ViYfA9AVe8JcTdT8NL
         ETD3nwXswJ7W92kdys9T/7rNAkNb38AdIYg5XnFkytWjanjiOsQMNFe8gPv4p8GS4WVV
         TVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005343; x=1790610143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UvCNVHGgMCfVbha0X/YNf7Xfe8skNfPu5j6zn9xlEcI=;
        b=Ib38HAnkkRC8QBe0+R+mT1onU7IlLCsgRxEYKvuFNEH/oqSyYaFG3iNaxELURPJX5F
         jlKbOxc7IKj4lTlXoZLDD2qG+F9lx+3X1+/d/cv0Xbf0A89BNqkoILAES4BSZfvb/rcr
         gMS0PdrWpo80y1neuV+73P0uteuOjkE2109NDjWt7JUgwOJYV79o06GbfU5X5FZzDEYa
         tNNYj2342K+twBaOo1IFU/qo3anyEDBR7pYzb0uFCXZYjITEUtepQ6pA1zUeJo3pPiN5
         ceOLQza2YxhJSzxKru1Q1JlvTn3h528C3dMv1pyOK0zIMLFzp5Aos9rAq+Gydz3WB11x
         1upA==
X-Forwarded-Encrypted: i=1; AKwUvBx+r2jmKm+PmZrXKwyAxV9Q7ViyJ7V6+j6dXEiT886cNDsEHoVQTHjsnYqH9TzwmBEIIhergAOck8eKqlU=@vger.kernel.org
X-Gm-Message-State: AFuF++n53Rt4pbA99p61Fs8wQzDG/uF371R1d6aijMuPep9esffAL4HN
	2jT1/Etj9gKd16QbFI3peCeGvsfDmiNHxsEPwNmI+hu6KF/6kD6ROu8E
X-Gm-Gg: AYBFou3AUJfk3MA59AAyk9VVhkeLEEnu8Xd2H1mZyAPjhYaQxNq8WwtyMz4dIk95+tV
	wZb9Cg0X+hr23epPdxDMIWt4fZRuerPNbsKQkZ/y8yDuku1fq2YmppsXAJ9gm4ygHepCr5yeSZB
	3Uy/6BiYWBseOb8Rs4/bw+VC081BrJBIQNHknKe7lAcQl0wpS/UL+v15XNyS1rw9+QGDq/xH8fo
	awwHf04Fs8iCZA9p7raETHuZipAVc7V0CXdrGkos5F8cfF3I4DIm9lJXA45M4HOyxHTMy8alk9F
	jh1KqHUWXTkJZ/VVhzPvlso3cXIJpo+TD/4BQbjRry1Rw9XKzAANBGPvUDrVNiBngRdeqHh+C04
	15O/2OAHBxc6S/JzztTlHzD+yznzqxw9thwgO7pi5MIxUwH7vL8kaE7BRgNiSnINyJOdxOMGM/7
	4jqep4qRrLX9+AI8egNXGlfZ9cjzcbi7fUWVpoCdatEVQZAmn0OYCQuxaE5oQh8GpZ
X-Received: by 2002:a05:6a00:856:b0:848:4859:a45 with SMTP id d2e1a72fcca58-874db7f4b04mr16549838b3a.2.1790005342833;
        Mon, 21 Sep 2026 08:42:22 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa70200esm3449599b3a.61.2026.09.21.08.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:42:22 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Arthur Kiyanovski <akiyano@amazon.com>,
	David Arinzon <darinzon@amazon.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Dawei Feng <dawei.feng@seu.edu.cn>,
	Amit Bernstein <amitbern@amazon.com>,
	Netanel Belgazal <netanel@annapurnalabs.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 1/2] net: ena: fix PHC cleanup on probe failure
Date: Mon, 21 Sep 2026 23:42:01 +0800
Message-ID: <20260921154202.471662-2-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921154202.471662-1-lgs201920130244@gmail.com>
References: <20260921154202.471662-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ena_probe() initializes the PHC as part of ena_device_init(), but the
probe failure path does not destroy it before freeing the PHC private
data.

The normal removal path calls ena_phc_destroy() through
ena_destroy_device() before ena_phc_free(). However, if probe fails
after ena_device_init() succeeds, the error path reaches ena_phc_free()
without unregistering the PTP clock or destroying the device PHC
resources.

Call ena_phc_destroy() in the probe error path before freeing the PHC
private data.

This issue was found by manual code inspection.

Fixes: e0ea34158ee8 ("net: ena: Add PHC support in the ENA driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/ethernet/amazon/ena/ena_netdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/amazon/ena/ena_netdev.c b/drivers/net/ethernet/amazon/ena/ena_netdev.c
index ea89619039d8..5f0864d16dd3 100644
--- a/drivers/net/ethernet/amazon/ena/ena_netdev.c
+++ b/drivers/net/ethernet/amazon/ena/ena_netdev.c
@@ -4122,6 +4122,7 @@ static int ena_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 err_device_destroy:
 	ena_com_delete_host_info(ena_dev);
 	ena_com_admin_destroy(ena_dev);
+	ena_phc_destroy(adapter);
 ena_devlink_destroy:
 	ena_devlink_free(devlink);
 err_metrics_destroy:
-- 
2.43.0

