Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7667C3AFAF4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370145; cv=none; b=eYd+ZpcX18412Ai1FLOa7XK86W1Yr0W+4/Pgc9wSrQsjBwsmLGOsWOT20puxALTz11NM58rs+ysS3zRiXkpaCGd1K0kZ+smiQ9LIoiMWwp4fPYxJHiENtDjxNaVIMWWBaxDLyANjoqcZ9FbX0yPUQ78X4rARxpNaEo8qu/VBGCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370145; c=relaxed/simple;
	bh=jSJaAsJ9GUyAudepjyD7M4Zr0u8277gmamjboG8joAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mw17NK/fLTEFs+5cZQQUYXEZLvrsxZQmiMBPVoOQ6ofZTYNi+IWTMaBfe0ZLVK8imPKlsWfiZgIJ56EriBP8m8V6zycfah9OHJuTZVmvHtyEYOENPSLtOHhkJyNyatCv7FSzu69B9LDf0YLfbq08z+YGZxJ1UU6mlLcGsfbmlBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4c8A6cg; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4c8A6cg"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874aso1329969f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370142; x=1789974942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CK5GX+kDbjRMghqOTfEiEdFRpT8/kc5WErzxR+yMM5U=;
        b=Z4c8A6cg8kdb54lm2Jv2uiCZYemrhUNORG/U6kCq3AFENw/pUTxti6K40o8o8z6HvV
         1vhfb82RLpLJoL8AjtVDl3LbmbVO43ZaWA5PBXmVsXtQV4rcSbFAapAMF+Y3pSw0zT+F
         fffToe2zywkiutCt20RNFDVv5GT6IZTcjOk4evWAeomTvnO1YR/7X/xUVX7X5oorEW4w
         HlOoDi8FLStsbSdvqZlLXsqnDojbdLaizQOij2PXBrZMxgsyR7oamh853Ay/o5Pd/W2T
         6jmHZWKz26DuO+jUxKmQsIdm2wLQgSHzIiprmhvpX72/SDh0tuf40So6mbo+50X9ryrg
         S1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370142; x=1789974942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CK5GX+kDbjRMghqOTfEiEdFRpT8/kc5WErzxR+yMM5U=;
        b=GELUBUp57oC/SKdPpxYp8CYCub0KPBTfG4M/jjr72sw1W1qQtY6cy1FyHOiy7crIlF
         kITnGH6MBafgeywXqtatVB6cxJ3m2kQbYGleowFi7XCkJSvXF9o7Z4bsTKgWC4O2gUiZ
         JGg/F+xfUe8Orp6cQsO1/n610Sc0Au6cV5feOPm4Fap47rpt7uCrlw1fLIA8srbuebov
         nR11HcNS211k5HNKSPsbKrnzIc8eAENRbC4dr9vaqxpPLXVzmvamU52MZOl01BjGeEDW
         I3qCfAE4sqTh8ECkOtkPp+dkQC0KFcUz9nbMag4v+x9DvcDhZ9femUXINeg4AGLKMJSm
         uSQg==
X-Forwarded-Encrypted: i=1; AKwUvByq6Gr0l4rdklFOqSNvUIEWjn8XYUWCOeHrFrNYa/1a4GDWF7SnwnamEtrKi2xHAQY+ggKMWNEbRFjO1vM=@vger.kernel.org
X-Gm-Message-State: AFuF++kqaoWccNrqmsboE49qdjXwp41ezPRhgV+BbYmmZaj2f1RY0rTH
	rWDFOducOQ1Eo/0b8lYPcctufW1dO05kOGB+FNXbCswEAMXaaqSX8iTU
X-Gm-Gg: AYBFou239VghxcSc6k+LeNEcmm9Yr59Yywrow8rVUfxSeMsbKhXSvs05yKiDH1qXMH3
	t1Gc9MEj2uVe+EtRNQJKC63OHRr/Ul5/taikmximnQhv5yA1MHYjZ8RDncwc56LvpJ2utqHVggI
	6Br7ABx2dZE3T9wTYTCbpEfEb2IUqCpxt95YWVX4WFmGQdoDVIdg6kMajJxucZ6knlTCXsqra09
	laH9pjOclaCUv29Z9a0bmyhprhgl2bhvNUTLHdDxnJ1HyeBWDc6q+lrKZvoY+v9dZYTDS1dt/hQ
	VceacDg93mFm5+sXy5KfwGk9vrw397mCE0dy6EVm9hlcXa7Ba5DeBtYmhNczE9+lt/srM4P36Fq
	BA/tfq0YgnjaMOVKtocYqnufdoKPCbS1WPKlVPaaXkFl8UD/qHWkj25EkLa+p+5DMNsyTJtGcsA
	A8A8tg5quP9NLAZEondOcBbSklkYTc0xEAzaIMy93IPFS4N8lLdG8UTWo+tc/Xj60FLHd+gJgi5
	2FHRzJbNOFiWaCBHZQl7ilYxJo23VsbvnOxEeDm
X-Received: by 2002:a05:6000:71e:b0:484:3310:c4fc with SMTP id ffacd0b85a97d-48702b2dd2bmr2636915f8f.23.1789370141587;
        Mon, 14 Sep 2026 00:15:41 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e4b5sm24472558f8f.22.2026.09.14.00.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:15:40 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next v14 2/4] ptp: ocp: fix dpll cleanup on probe error
Date: Mon, 14 Sep 2026 10:15:29 +0300
Message-ID: <20260914071531.11640-3-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260914071531.11640-1-maimon.sagi@gmail.com>
References: <20260914071531.11640-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two problems on the dpll error paths in ptp_ocp_probe().

dpll_device_register() takes a second reference and stores bp as the
registration private data, and only dpll_device_unregister() drops it.
out_dpll dropped bp->tracker but never unregistered, so a dpll_pin_get()
or dpll_pin_register() failure left the device registered and visible to
userspace with a priv pointer into the storage devlink_free() releases a
few lines later, as well as leaking the registration object.

A failing dpll_device_register() jumped to the same label as the failing
dpll_device_get(), so the reference taken by dpll_device_get() was never
dropped either.  Give that case its own label.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 401b04f12d2b..f4299878c27c 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5124,7 +5124,7 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	err = dpll_device_register(bp->dpll, DPLL_TYPE_PPS, &dpll_ops, bp);
 	if (err)
-		goto out_devlink;
+		goto out_dpll_put;
 
 	for (i = 0; i < OCP_SMA_NUM; i++) {
 		bp->sma[i].dpll_pin = dpll_pin_get(clkid, i, THIS_MODULE,
@@ -5150,6 +5150,12 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		dpll_pin_unregister(bp->dpll, bp->sma[i].dpll_pin, &dpll_pins_ops, &bp->sma[i]);
 		dpll_pin_put(bp->sma[i].dpll_pin, &bp->sma[i].tracker);
 	}
+	/* dpll_device_register() takes a second reference and stores bp; only
+	 * dpll_device_unregister() drops it.  Without this the device stays
+	 * visible with a priv pointer into storage devlink_free() will release.
+	 */
+	dpll_device_unregister(bp->dpll, &dpll_ops, bp);
+out_dpll_put:
 	dpll_device_put(bp->dpll, &bp->tracker);
 out_devlink:
 	devlink_unregister(devlink);
-- 
2.47.0

