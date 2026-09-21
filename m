Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E573E867A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790025503; cv=none; b=s7hL6QZ6SORmTObmbJNpZAKyP6Qa/HKGEn78s7rBNwcN79d1P71PGzSE6UEEnP3AqJf0OevjnNfJFF/76OtcxE5kgfRLhK0PBQrv4VGQ6M0GYYXApJffx92C0UZOHuOxWjYJN3L+JguhZlxFqXoCiDqxnWDOCeAk8n6Gwef7Fl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790025503; c=relaxed/simple;
	bh=72VPKGFgUFUjrL2n1VYKmbyNf3I0BnnQw/kQ9VbMmhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PpcHDjGxnVx2JRVCfzctjo99MBvniuQ2roDiJAoIK7ylJWkZnbRYffeUR7bJpD98yCUi+6gaAHwOzo986qYeXafVFvzg8Hr/7G8efKVCGZZpd3/aQmaHvc7X3xzcPcQu6hSQYtH+gXR6iofODTRNPH81kb6B1WiLkUw3EIksq/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com; spf=pass smtp.mailfrom=brivo.com; dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b=b7AceCuw; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b="b7AceCuw"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb7692a57so42677181cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1790025501; x=1790630301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XC9Sb/ipf1691XqMArNePnNNYX36EhvRdBJwfuO0HU=;
        b=b7AceCuwA7VVTS0jeFvUnrNbSLYisFbfbvuSUGbWdTb/7wGuUTLQLRykIQpWy6g1Dr
         M+3vUS0gANDzKphd8nH5TjFtPfNOtjd38/1RncKgIk7UQ/ihmBbvvRor4PU8kpz2KLmk
         2afskiBzuf6DpudC6ESqHhX4UJbCspAIcRtK3x9biSpViNo0ivIsH7awcEsYhV63ydrE
         je50DMo4WD/tSxZKRhqVwLY3qZ5/GBkByeuU7BnfoeI46MGjfkzwazRIRCmD8lR4lHDP
         hTPSH67FQ+l7HOtMyu4LL7dO6ZIUudL70vDJGgTow4cLNazSC9XhvQIqpNpe9FKbzHfl
         kQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790025501; x=1790630301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3XC9Sb/ipf1691XqMArNePnNNYX36EhvRdBJwfuO0HU=;
        b=h9cWNBN1Z7Qpl2W7Gzgy+oCjRM6Jxa7LFMY9QkB7g3VW0WS8JNPlzIjA01YgOCMKOE
         wNYQZ/10102nLpJ2PVaIoyiywlszD6MEGoa5Rdkm0XFlszblNp40djLQ3HJHeRJXO6D9
         bXU4EpRJLgDyT/efv1LCMUdpTsOhA+NPTGKHqXZytVMSpXja21+LnBbVGZxa8FF2MGhP
         NQjSU9HhpNKkmLMrfcHjnM7CT7a5QYMOa5lIjFfZdO6R9jmh9i2AMfHH5DCcFqLz7brJ
         W6tBxxKCVZbfZL3vcGIAnRB8a35r9Ew0tMk9Zoira2UE7vMEdjvLlnhzHQxzpzRDYYTw
         7VWQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4otmberoc1OblAWAuvzvY9l0j2ho+9sQSZIndH2tTU9TXUEh8CMOKlJt+TVffnj/0ZAcXI8pfEOx8bm8=@vger.kernel.org
X-Gm-Message-State: AFuF++nifNZQWJZ0obPFuRWtbk38mYTycDtktvcbYVN9JLwz6ck2Ku6v
	Up9X2XigguMAxnpj7eh2sV5eivrlr1D2m7bR4eBKNCGz5vKD3X/DeDFbVcCMYarFW0+u0xEHRvL
	fM3q3jsJJG2eMKCsxTUYMr3Bbt+rgt1lyDOvdorAra3xxTxJ343xGk/7Ji6g=
X-Gm-Gg: AYBFou2LP7Ra4umQqArqqywyZz/eEAqlznMzWUZpv7oEPVCjza+0EkG3LOff0cE0XCc
	gsZVBEGFJkenyHmcnVgLha4Y36aFayGu6sUYBuGMQSwPLR2UCTCkGM/gSNmwRh3rlZVjKAZu2YG
	tLlaV8LkvUGIppleKDifrjRMDj92SWytxQRUbM2sCUnWQ0qULaK+nywjooIyGXiFRf/K3V6Ih13
	1pxcZVxsU3RJJn5rYEL0ENBZUYggBErUfcFKPSSCUdBGYMzNZ+6GP8soSngZdrQW6KupTIgBBS/
	F9u7hwDkxK+r2qvDGSgJzhFzMRUOw/M/OaPmnnIj7dlD6oBukOxDPungR2sLS+ZFr5KE3ENQRju
	FXVsWU9TgehQhTvgf1UswmOV7KKLxqMA9e8Pt7slVSEtOjBOVRGqaePW1FApFjqSzXXqphAEAY2
	zJcEbWsU4P4Lt2okTIFrMgAGmxZ/7LpOy70jeOQjYXulw1zRPFrCLSSzuoYV1kKPo=
X-Received: by 2002:a05:622a:449:b0:530:b2e4:d598 with SMTP id d75a77b69052e-532dd5508e3mr6762731cf.51.1790025500842;
        Mon, 21 Sep 2026 14:18:20 -0700 (PDT)
Received: from strozzi ([66.193.28.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532df63ab0dsm267121cf.26.2026.09.21.14.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:18:20 -0700 (PDT)
From: Sean Anderson <sanderson@brivo.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes.berg@intel.com>,
	brcm80211@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	Sean Anderson <sanderson@brivo.com>,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH 1/4] wifi: brcmfmac: Fix canceling uninitialized datawork
Date: Mon, 21 Sep 2026 17:18:11 -0400
Message-ID: <20260921211817.2432341-2-sanderson@brivo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921211817.2432341-1-sanderson@brivo.com>
References: <20260921211817.2432341-1-sanderson@brivo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

datawork is currently initialized in brcmf_attach, but bus_if->drvr is
created before this in brcmf_alloc. Both of these functions are called
on firmware load, which may race with device removal. If this happens,
cancel_work_sync may be called on an uninitialized datawork. Fix this by
always initializing datawork before we set bus_if->drvr, as this matches
the condition in brcmf_bus_cancel_reset_work.

Fixes: 43b25879f004c ("wifi: brcmfmac: drain bus_reset work on device removal")
Signed-off-by: Sean Anderson <sanderson@brivo.com>
---

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
index dad6f4563d146..a3163120154dd 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -1298,8 +1298,6 @@ static int brcmf_bus_started(struct brcmf_pub *drvr, struct cfg80211_ops *ops)
 #endif
 #endif /* CONFIG_INET */
 
-	INIT_WORK(&drvr->bus_reset, brcmf_core_bus_reset);
-
 	/* populate debugfs */
 	brcmf_debugfs_add_entry(drvr, "revinfo", brcmf_revinfo_read);
 	debugfs_create_file("reset", 0600, brcmf_debugfs_get_devdir(drvr), drvr,
@@ -1349,6 +1347,7 @@ int brcmf_alloc(struct device *dev, struct brcmf_mp_device *settings)
 	drvr = wiphy_priv(wiphy);
 	drvr->wiphy = wiphy;
 	drvr->ops = ops;
+	INIT_WORK(&drvr->bus_reset, brcmf_core_bus_reset);
 	drvr->bus_if = dev_get_drvdata(dev);
 	drvr->bus_if->drvr = drvr;
 	drvr->settings = settings;
-- 
2.53.0

