Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3863B0AE9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084482; cv=none; b=qhpPK3rpOp/ueJWx8OnleDGGK/BPgl75E4wtreX3mazrbGQYK1mQ9+A2ODRqbBKdKx2JTm/uxym7JZ/IHRINN3q8H75QSukczVaC1bfxFPZLKRuZ27E9Ljm3ypwhucAy1B+zUpWJL6own2KRv8j3tdswi+q8LBEW2OvCX+vp8zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084482; c=relaxed/simple;
	bh=WueL8tY9e+f4EG9kegBhb/48QAgoQxxqkg2Jsh/Y0p0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBClYIgjgWt56d+TO3WW9dCdtDjU4vrNrJ/ZawOV9yO+flESoX2pr0azMHRzWYf/QiJTZHQd5XPZPLCerFFfA2lTXk3N7xcyJ2IMAldG2BiQ9OLjIUxwhreJrA+VcKeGmBvak9qS/zZiczL3JgjIs9XdqzRw2/luu6GizLzmv8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQfK/WOl; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQfK/WOl"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5302b692c8eso4572251cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789084480; x=1789689280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=imdVCDjW8TkcoAnhfj8hrX1xpu4892DD4sMcv+6zDbc=;
        b=aQfK/WOlkYplsyVZOLtnvnwYXiMn69OWGKrxDpGWqQn70cuUPsEV5IEJ5CdMGFNVOW
         zMZLlnpFsn1KV0KC14J7ib3T7rBykqy7m9pys3D010KzJirhmpw7ouSDM1Z8JggoMRmS
         uNsuh9ezCUOIiRfQx4YUzag+S7std5q+S79zLBI/IfQxMEbEHb2M0jpvQe7Wn/FRXRyC
         nJyTxwYqIqXAleiH16I3L8+k9GQZYBMhiN0Wj9pqmlbgpWHeecDMCdMU+bE9DiSJxZ1/
         nTt7Nh5zOWo2tUL/05n1gJq6oT4ZQ1Z0apNwB8e/4uAIwAW7cp/HqXh9MQyJGU/P4fk0
         f/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789084480; x=1789689280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=imdVCDjW8TkcoAnhfj8hrX1xpu4892DD4sMcv+6zDbc=;
        b=Hw5WoWvgo3NgKMiTVT0S3xtUp5xGR5c/h6TMf9zo9N8cVSoext9cJmMxAu02KzVz9u
         DtsnIwpoK/+ZBWPTWbWcpCaeeiUv4W8gusfQs6HbyibW1X+o9K0ul/ISjyXig6fXv4Pg
         6wKhHRZaoxwfLeIUh4svcoKBIcugLb5KaVeKwQTiiZj87sxFZOK9os3CNxRPUf2jc3+e
         5UYerjIlBufcusvugVq2jLfEKfl5C4CHdoV8gYRKnV1/XI+caIrZbH9H+cS5RZFONv9q
         xoplnojmqN81oLIqo+02dY7JF8pTKvhtS97wBBeEo7VhDW0IA5CROMKteyOeDQLEX56p
         38NQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCUCXeqqZtdZ4ys1e63+WVy1cr3JJq6RfEHEMXKpsXRQgCRW/G2zKDNCR7AK5QuZ3uo3Ay3CWvybsypWc=@vger.kernel.org
X-Gm-Message-State: AFuF++mMWKsV0JhbbQEjafjEjq2unWvXI6ACzid5Sq3W5EUwxH/f1rZy
	OIOucIUzvOzQD5sCDJj1tFA6+JBjgz6nfap3gl5yG4nATynRoB0ZBqs=
X-Gm-Gg: AYBFou0V89UgEFqaRHk8CkpNo+qk51Bkxiqs7mI8ulzgBUSNx+Y95FqzRKjxFJGaypW
	jqTshQa5Se+cu7azxed5EP/USGC3QwI3WlBRuvSRZOboZoxRQQs+NdGn9r4GeFC9CQgjSgOcbSS
	/at/HlctBojbWlrI6JecUAMJLKU5NYo2Y6m1WwiKwQheHwFCacvOr6tzqwPsno3psRTlEL36yrm
	o+miVSt+d5ZvAJbgHR7HG+C+fi4U4MZT9cNkphas1EJWkxjz7bn9A0IX9zjuEfTe6cbIqUIf6wP
	VmwfoYsiW1ugvtucJWgiYrUfY43wMzjBf/hHIqFu2lmUAdxD5i6ADfqxBBv5HHWezq1987FHM4h
	rCNJHTshA+d+wr8KgNLmRNPpc107Ql3ukmxgThNWC7usmdEo9R+KliihaAD9ipYFU5SDrbmJK0e
	J+m/kNoAZh0sEGR46SaEaPjllPgtOEKGSITT8IWyuSlhctzH6i3Ft2zvDnEPmcb9HxLs95jnHnD
	qynUG693Nj33tebPXpddnCYRFSWDhHyruYA7/2uzMEkVhAirwEr3NFC8rIaG5can6eHhRmWA07H
	ri2EC4y7kQdwr3BxjYavNm+0DqBnzi15rg==
X-Received: by 2002:a05:622a:2294:b0:530:b2e4:d597 with SMTP id d75a77b69052e-530c87487damr29756721cf.50.1789084479899;
        Thu, 10 Sep 2026 16:54:39 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca48912csm6100771cf.13.2026.09.10.16.54.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 16:54:39 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Zhao Qiang <qiang.zhao@nxp.com>
Cc: Krzysztof Halasa <khc@pm.waw.pl>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexandra Diupina <adiupina@astralinux.ru>,
	Christophe Leroy <chleroy@kernel.org>,
	Ijae Kim <ae878000@gmail.com>,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v3 4/4] net: wan: fsl_ucc_hdlc: release HDLC device on remove
Date: Thu, 10 Sep 2026 19:54:30 -0400
Message-ID: <598d90cf55981c38288fab8c32dd52286090f384.1788128904.git.mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1788128904.git.mhun512@gmail.com>
References: <cover.1788128904.git.mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ucc_hdlc_probe() registers an HDLC netdev whose private pointer refers to
the separately allocated ucc_hdlc_private object. The remove path frees
that object and its resources without unregistering or freeing the
netdev. The registered device is left with a dangling private pointer.

Unregister the HDLC device before releasing the UCC and DMA resources so
an active interface is stopped first. Free the netdev before releasing
its private object.

This patch depends on the preceding "net: wan: hdlc: close active devices
before protocol detach" fix (patch 3 of this series). Without that fix,
protocol detach clears IFF_UP before unregister can invoke ndo_stop, so
an active interface would not be stopped before its resources are freed.

Fixes: c19b6d246a35 ("drivers/net: support hdlc function for QE-UCC")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20260803133048.42650-1-mhun512@gmail.com
Link: https://lore.kernel.org/r/20260806020541.2011936-2-kuba@kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/wan/fsl_ucc_hdlc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
index 596f4ef053636..371150efc1a65 100644
--- a/drivers/net/wan/fsl_ucc_hdlc.c
+++ b/drivers/net/wan/fsl_ucc_hdlc.c
@@ -1255,6 +1255,8 @@ static void ucc_hdlc_remove(struct platform_device *pdev)
 {
 	struct ucc_hdlc_private *priv = dev_get_drvdata(&pdev->dev);
 
+	unregister_hdlc_device(priv->ndev);
+
 	uhdlc_memclean(priv);
 
 	if (priv->utdm && priv->utdm->si_regs) {
@@ -1266,6 +1268,7 @@ static void ucc_hdlc_remove(struct platform_device *pdev)
 		iounmap(priv->utdm->siram);
 		priv->utdm->siram = NULL;
 	}
+	free_netdev(priv->ndev);
 	kfree(priv);
 
 	dev_info(&pdev->dev, "UCC based hdlc module removed\n");
-- 
2.47.1
