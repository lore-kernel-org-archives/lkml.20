Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792863895;
	b=0mZVSU78ztfaN+QwLH85CDJ4WNgZfpjVX1LapifCk56vU2+T7eSLlc39wgBw0r75b8hM
	 lUPEdC6ePGKGoXhZ60HM4KK419ILBHIfkyvh3lwqXWeqvUMVGuH/AsrIG6GuUFeTT/iou
	 UJoH6MYj0eEo5ESIxfVNwBHgB2cKXC2OGOA9zMce4gEaFusaemeaHSsfnk8TJ5h311kzQ
	 D8n+i9MNddPhlEWfvQEeBIydYVqlnsarqhahlVUkkhRi+O/kTkoy0hQVTCrOVBpbUWxG2
	 NEgeVBitr98xHjarbgEYth/mdErDSjdDP5tYr4nFVbCPiJMW9Fg4pYsS/iGj2CGL8wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792863895;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kmCe/XnoE3pu2z1aH564eD1m2h5eGZXwVLnoGm1bjiU=;
	b=Y95lW7nOfSPvieHpz3R1cd8NmOmxpoENbZx3ilWGNvaK1YF7DujGtlJ3lyTKg4Qgqkeh
	 KfVs0aeiWQvBj8Smro/L2GupJ/Yt/kGIuLkcsXwWDEMCZbyGgK7SErclkL57f5DV/7ISB
	 xsnfef4yuWyWWQa73rjVFoVR/4YISMoNBWhuW8gPoKFJbfo6cegnoSsCfhMuIALzYac8o
	 D2ngDHGoJHKQnsl/Pc9lsMe+mHBkmVfrtS6Q+JZu9mljpiRC3oaeU/WVdbvNpTqM6FOJM
	 8Bbmu2FC1C8hMeOT5Yz1sgVf+JkmJU3mvQsQ3rOfx5KBlvJqZAKno4X5doYj0nwE99Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=c6grM+cc;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D3A606A31A;
	Sat, 24 Oct 2026 17:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D3A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=c6grM+cc
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E1DDC82D72;
	Sat, 24 Oct 2026 19:44:51 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZYvhrl8N3ih; Sat, 24 Oct 2026 19:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792863890; bh=TWpn0eYogFmWMxnVSfEWtxcM+k1PFX9Bh/lBHXLOBWQ=;
	h=From:To:Cc:Subject:Date;
	b=c6grM+cceItwpi9pxQaNk9PxkOUarXttWRmcUhn5GNotjDSlKCJ9dt46AVUINCK+C
	 n50Czr8CtnKKCdwcA1k7B4Fm7pRbgouKt3ONp0pXCWODL1lttZKEUuhdzDksbDuglv
	 YliTMYVkBNBKsKHUx1tP64cRTFy4XBz9BKMaRc4B1fOsqm57Z5fcyNZL0JcWheO781
	 7PA+8Sw3Xrb6aGEba2q66DIGyH8Alh56Nbci4qNtT4in+u6T7X66eXMEQnt/sCNuRk
	 koAkajV6FS/Xxltx6DpJ1jPAaU1LaBbhy7EypA5PTgynn/o4kHi6KvArCUS92ax4qQ
	 7NTJbJ17i6+VQ==
From: =?UTF-8?q?Ali=20Ahmet=20Memi=C5=9F?= <aliamemis@disroot.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Madhu M <madhu.m@intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: debugfs: Fix GET commands on UCSI < 2.0
Date: Sat, 24 Oct 2026 20:44:41 +0300
Message-ID: <20261024174441.878903-1-aliamemis@disroot.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since the debugfs response buffer grew to 24 bytes, every GET command
fails with -EINVAL on UCSI < 2.0, where the data length is limited to 16
bytes. Clamp the length to UCSI_MAX_DATA_LENGTH().

Fixes: d9dc19910321 ("usb: typec: ucsi: Fix debugfs response truncation beyond 16 bytes")
Signed-off-by: Ali Ahmet Memiş <aliamemis@disroot.org>
---
 drivers/usb/typec/ucsi/debugfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 77a0dd75edd3..3cffd3778c67 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -60,7 +60,8 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_GET_LPM_PPM_INFO:
 		ret = ucsi_send_command(ucsi, val,
 					&ucsi->debugfs->response,
-					sizeof(ucsi->debugfs->response));
+					min(sizeof(ucsi->debugfs->response),
+					    UCSI_MAX_DATA_LENGTH(ucsi)));
 		break;
 	default:
 		ret = -EOPNOTSUPP;
-- 
2.55.0

