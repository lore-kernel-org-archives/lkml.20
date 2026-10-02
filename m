Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D933E3158
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952520; cv=none; b=Oy6RYRz3q0JukHeDYGfni1vs+Kj5PaIj17wFSCk+PgCVWdlV99f+2ly3heRqmE62defOsdcWWQ6dQeq4Kf4dUsREMTlVep/EmnrJbOeF8QJ/GU5/BYKOCwe4ZLG7+LJ1Dw4rgiNMcTsrd6gnIyzeKnp6iQ8oRd1SRtus/md6kI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952520; c=relaxed/simple;
	bh=3HRpLaud5Q175KJrOtLopzDWyHQITkJEPRA0KEMmP1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QiMg7ivPB416b+9yUXBM587oX869Echq0J2/kJLxpnNZaI2ycmAnm0e2WDpThP8dU2vM9iQKVZIwY+nJRaecDABx+HhnyzMLOmgdsKszS7eCtbOqfUp7MDQXS3Cyh6HX6oxQaaw0u4vCfBP3X0Tb13ynSIsGIHF1pPKHBZPAYIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHe3ttcx; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHe3ttcx"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bcb929cceso2578803eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790952516; x=1791557316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+qR2bmFpfj/mXdNscyHuDilv95LRNDcT/+z66Xstgtw=;
        b=PHe3ttcx2R3gN2wdaNQFUBeLOPHTyusHy6/dMr9dLy4qH+K3tKkQzx9G/ndBBmgtui
         g9LTjjGt728G+YyyaK7WqSDKrMZxkNjq7isNVX0tVazJm10hYyICayRkyy7YqGuUrLer
         OJxkwlb7zZWu/bbIK/wTZAqlWEN1PuZPDAyLFXK1/ELWd90jf7mM1zG7cXVP0OsEbj6Q
         mmwfP4MhLkNPpr55FWZ2BlqH4r80WSByDKM6xFiT0/Ax36VZTpZ89bD20bw9c4//oMwf
         K4jk0iK7ZhbK75Ar6tHoGA+bUALZnWCDPX+JYGAXbS5HhGZQt5TpypC1sqANxtiGBDlS
         8l4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952516; x=1791557316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+qR2bmFpfj/mXdNscyHuDilv95LRNDcT/+z66Xstgtw=;
        b=lzs0+r4Zs5xHP97PimijL8SA1UXO+rTEij2x719nDjaECAhimMZLBTVMEDN3pEQhsK
         H+SWXszszgs+yzN0ruQc1w7fPAoL00dFBm9Z29YKS7DkDFI53hdRNfRN/dFp82lncQNN
         0PD8cY2EOgfF50NA2D9bnf6sbnf5ilnktjIEBxbSnMAX7z4rQHB1Q6gB8byCPvKfnObP
         jY300wqoBwAkyORSLAP42cfDOyYcn/hZX9FksaWWg00Bk3cdTqCv/UP7qFdsvJOof1OA
         BYCDCV4nYhNB84PV2lbf3O9Ndjc4+3h5sm9aCzt8ITXhbzdNZdrmGi8na2/0MjrLoyRO
         Niug==
X-Forwarded-Encrypted: i=1; AKwUvBxDQx/hDaW5NehBrelLbiOYvp9kH+nISth+Oa4rqsW7lLpkjuxzW+TQ/8W2ikcOsIMlwDyc1N1WsJ5LKG8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7lqhSsZuyx5RKIbSevatU6XHATjeUH2O7Et5sUMrZshdAeGO1
	5scHo8FNHNdsRpfKxQMt3TA85bPySwTFN1GvGTaIBDPRx4rqVQijfNTk
X-Gm-Gg: AYBFou3LRLrzU2s7g217Skw5WSLtuKMt7yWscrawipNsd0asVkAokSqGhFgONiVTxmU
	vZAM9rGPOhnBBwsJZMHi4CXA1JXXq5+JnlfHmKCyEZBMnxyaa7BJiSfy41IpiifY0Fa8qJbesMn
	BvVex8affLqTliv3bd31q+ZKoaLjOrPd09xpDbm0J8PHBS4WwA9n/FgoxKRWXi+GQlEcr+BnI2o
	HhV6nCvE9NpuqBJxuBhTf5IPPSRURJBTGXLYm4rw1unqn90kbInQsyiodsQe1NPTuwX7usnZK1O
	H/j4CKqpNzqG0mpRthEfeAy9m1/ughGtMC0P10r1ggPqRKiz9uQiGrVU4Yh/e2x8D9XzZqpRvgy
	DwFBYK3VBFMk9enrA8rem64fhctbmMH+rQ01ekcNWqV3JXdPjzQokTpPmneluXsL497gmYLbqTx
	nScxG+9njsSMbs0/+wI3s9ixECxnPIO/Y/rQQkGFRpOvCZFWKgpSA1Ty5BqhjP
X-Received: by 2002:a05:693c:41d6:20b0:34e:f5f1:2f46 with SMTP id 5a478bee46e88-34f150ab8a3mr3318591eec.6.1790952515558;
        Fri, 02 Oct 2026 07:48:35 -0700 (PDT)
Received: from adi.. ([122.171.22.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm16747476eec.18.2026.10.02.07.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:48:35 -0700 (PDT)
From: Adi Prasan <itsadi2409@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	linux-wpan@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adi Prasan <itsadi2409@gmail.com>
Subject: [PATCH v2] net: mac802154: fix race between slave_close() and in-flight async tx
Date: Fri,  2 Oct 2026 14:48:27 +0000
Message-ID: <20261002144827.3479-1-itsadi2409@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87ik3tn1nn.fsf@bootlin.com>
References: <87ik3tn1nn.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

netif_stop_queue() prevents new packets from being sent to the driver,
but it does not wait for a transmission that is already in progress.

drv_xmit_async() can still be running on another CPU when
mac802154_slave_close() calls drv_stop(). Stopping the queue only
prevents new transmissions; it does not synchronize with an already
running tx operation.

This was checked against mac802154_hwsim as well. hwsim_hw_xmit() is
synchronous, while hwsim_hw_stop() only sets a flag, so there is no
pending work or locking in the driver that needs to be synchronized.

The race is in the core between stopping the queue and an in-flight
tx operation. The fix therefore belongs in the common mac802154 code,
using the same handling already used by ieee802154_suspend(): hold and
synchronize the queue around ieee802154_stop_device().

Signed-off-by: Adi Prasan <itsadi2409@gmail.com>
---
v2: Dropped the explanatory code comment per review feedback; expanded
    the commit message to explain why the fix stays in
    net/mac802154/iface.c rather than mac802154_hwsim. Fixed the
    Author/Signed-off-by name.
 net/mac802154/iface.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/mac802154/iface.c b/net/mac802154/iface.c
index 31353795fa24..929ccd464772 100644
--- a/net/mac802154/iface.c
+++ b/net/mac802154/iface.c
@@ -313,8 +313,12 @@ static int mac802154_slave_close(struct net_device *dev)
 
 	clear_bit(SDATA_STATE_RUNNING, &sdata->state);
 
-	if (!local->open_count)
+	if (!local->open_count) {
+		ieee802154_sync_and_hold_queue(local);
+		synchronize_net();
 		ieee802154_stop_device(local);
+		ieee802154_release_queue(local);
+	}
 
 	return 0;
 }
-- 
2.43.0

