Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA2E4DA548
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407169; cv=none; b=rgui2RaBvgNT0MeNVX1sBzBaPtqkG6aFVFqQBooOfaoxGMPgipIzRVoS8j9BoUETFKuOBgt6bf54NnjSJ9j9H9N2oK/wQutTJU6sCKrRyk1fAQ4RFSe487z41Dh4vxOBt7r1p/ylhr1fUS6hqBoCxQf4qKJ5Nm6lZiME2SgAo7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407169; c=relaxed/simple;
	bh=21H+oiuRQhr1bTwN5k5fm68vZAo/wIv/vUXUABGcE/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAulN1n//1CxNUsFg4CyWb3OR2Yorq5AunPx3HKIL1/nyg1o6e3me1UOs6ZpZ7ndKgThn2GMcaJvpaiMRCK0RuuwtfVtgQxDhLaOPHBDReEAl2vj9e3goCNojG8HkHR55XhVPH1lE5k8uM1JMg/J9GS/JTy3Y0h/j47mmgVbfTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=LjiEw6VQ; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="LjiEw6VQ"
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8CD643F321
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792407162;
	bh=FCCK4lukVu46UX8q/+nvsePnhoGpz0IH4czbYBTEba0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=LjiEw6VQ38GVAI1qWjT4BFpQcwsd3O4jiuaGVgp5/ZgFqG38qQoiLKb1Dnmz+myCH
	 7dtIekLq3JlmdT69m3yVG+/qCK3vcf6qp7zVuPZeroLQ7qrWBCzGlQkQ3vMa0YCMg/
	 lPCyYX3T1JKoW0Bl4hbmlojTgAwTyycL33OivJHpfQ6uBFtAtFnOyCPBFxN/Q9lof3
	 cfa3KieV8sfklpOSdoHYxRCfxmiCmhrIpYFYBmhs3yhSjjrnuERqnbWB3DRWC5JllP
	 Z4CJCspHJVpnVSZ4AW0WIwZXHPXUfl5kmrQgdWW3xi4RrlP89ZW8dZe2bNVJiSpx2s
	 YMKn28lBu+5nf8Qc2gKL9hXWG/z5hJzJGrfTU1aEPJSx1v2a6LVc7oHbws0XVckh2C
	 HyRtLlslQLaCUNGUqLo60ACk9wUHWKTCGsJxehIlEcvILtNZ2ImkGTne2dcK2VUBIq
	 s5WpTC+h6wmZMTL5/u5nzTVtWkbUcjmbqCLrukGfmQLDDrl9wMU+FtHnQSJtwLE6yx
	 nP7ReKLom7JvKV4eQI/LoRvh1WZk9QQVGTERjd9XCJNXjpDqE9VDv4S5ViLMjoYy1s
	 5Mj+uXx7OfWZWH8KgyG3+orriTnSejWtSHEgghkG1OXZfLXtIOC3xGO1OyHW36dF4E
	 8ZtLFKfzKOYlqs5j0j3qAkh8=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1bfd5516bso19998125e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792407162; x=1793011962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FCCK4lukVu46UX8q/+nvsePnhoGpz0IH4czbYBTEba0=;
        b=HxKtv3Ie26oOmzdD1WbQJG50iGYof778eLYWw6ynXidDrmrotL23Qo0gwyytQ6vGoq
         xFQM8ieH7PXSKxNmp+33zV8UyDybEsGrzwnDd3AfPiNHvrxqUGyJZEJjrjSw10mL9VVJ
         v3/PwDquRbI0JEN/z3ZviRTuWAfItPh7nb792IRO9SCNkafNPyrTcnZA/rNjI/6oFCWb
         n4jASFVtmljqdEuaTVO3rhKqLYwgloSPjhybx5h/Rij23Thyr+hgR8av9NjBi8OYvjN3
         ckwpRcMCLddIBMIdzUe2Yuvc0xekVosMbZ/mN21IpQrjZsWiBgGOYahEwOCUqxUNZckE
         ZrQA==
X-Forwarded-Encrypted: i=1; AKwUvBxDWj+1aMPoJcfzioQAhm5dwtknvtcHz7NigLXGxN7vkVn3eYWDGN3W67GBvgLjHVTGm0itedLiG+mwqYE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKo1VrEhj6/pp8Hs2XEuGgSPa4SzjnMlGkcBPQZqbjPNcYyPrX3
	oAyNUhg5km84r66ZtiSOdmaBcj0oN/dp0fofDBGzmvVnJkFxhWf8Fup+CALMru8hO1EmqX8eSbY
	2FglzpqPSHtmLu8ryCsUgXbPdKTijBIyRXfmAD8w0nSg5udGzWk/Ff1rj3qPsLTCogHsd/kR0gD
	dftPWoTQ==
X-Gm-Gg: AYBFou35E2TGzoG+iFzqokjLX5sAO2u2W82t0NY4GRdjlvu+Vl9ZGQmv3jHblkjA4cv
	BGKraqPyn3Nc7v44RJCfENuQflw2GjTdWq5LoBTTM1Z29bxJaIxcDpFUsNoQTXnJ1hZ+smVSyZl
	uOQYaEN9YzHvF8Z6FxHDgKgFw4kbqkieFQ6Xpye6okapiUUFVSOx+OJYqN+G0rsgb54nxKxg4iq
	WkfaAqwuQrbeqXLrdnVFkDFuebARTknG2IDoE5MxOencGRvOdkEvYNbpxUPMw722Wqft3cNQWh9
	1/+oXj1BTSobwzxkhDxFMz8A53vN4kUcPIby/F3vCTj7kmVAYXZz1PgRwc2PF9nLBZ8Z3egzbKZ
	A1lMaJJAAiAhrtjO7RnlMED4pQDPPfeEOmoNDhXR2uclkdqrZ6ToRhI+jcoTkl38J9TkUySElnN
	z3bP89k5olv/+e8lVtaB+amDgrbh9bQzWaujdadB7CsZc2MRjmRArwwjoukQNE4UGhVgnl4HPdf
	v1DDvBZ9v23+CTCclr0EMUP+g6G1OoADJFrmKrv
X-Received: by 2002:a05:600c:b99:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-4a1d75a9828mr140136165e9.1.1792407162004;
        Mon, 19 Oct 2026 03:52:42 -0700 (PDT)
X-Received: by 2002:a05:600c:b99:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-4a1d75a9828mr140135825e9.1.1792407161618;
        Mon, 19 Oct 2026 03:52:41 -0700 (PDT)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([103.155.100.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510201sm23238930f8f.55.2026.10.19.03.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:52:40 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dan Nowlin <dan.nowlin@intel.com>,
	Brett Creeley <brett.creeley@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	intel-wired-lan@lists.osuosl.org (moderated list:INTEL ETHERNET DRIVERS)
Subject: [PATCH 1/5] ice: check the full PF reset polling limit
Date: Mon, 19 Oct 2026 18:51:51 +0800
Message-ID: <20261019105155.3793063-2-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019105155.3793063-1-aaron.ma@canonical.com>
References: <20261019105155.3793063-1-aaron.ma@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PF reset polling loop includes the Global Configuration Lock timeout
in addition to the normal PF reset wait. Its timeout check still compares
the iteration count against only the normal PF reset wait.

Consequently, exhausting the extended loop reports success while PFSWR
is still set. A reset completing exactly at the old limit can instead
report a false failure. Subsequent initialization must not proceed on
the assumption that an unfinished reset succeeded.

Compare the count against the same bound used by the polling loop.

Fixes: c9a12d6d2091 ("ice: Increase timeout after PFR")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/net/ethernet/intel/ice/ice_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_common.c b/drivers/net/ethernet/intel/ice/ice_common.c
index 04633103e3e61..82b803e74aac0 100644
--- a/drivers/net/ethernet/intel/ice/ice_common.c
+++ b/drivers/net/ethernet/intel/ice/ice_common.c
@@ -1291,7 +1291,7 @@ static int ice_pf_reset(struct ice_hw *hw)
 		mdelay(1);
 	}
 
-	if (cnt == ICE_PF_RESET_WAIT_COUNT) {
+	if (cnt == ICE_GLOBAL_CFG_LOCK_TIMEOUT + ICE_PF_RESET_WAIT_COUNT) {
 		ice_debug(hw, ICE_DBG_INIT, "PF reset polling failed to complete.\n");
 		return -EIO;
 	}
-- 
2.53.0

