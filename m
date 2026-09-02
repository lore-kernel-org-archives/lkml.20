Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274E33E49E9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788382969; cv=none; b=MH2UVXgqu9Ls415BYamsm9KDOE4m3hEOMQhD5LeLJu27XQarIzliQ+R0IkbavHuXgLh+o1c+MYYNDTqBeKAyI4z01inNodBL+ElH/Vvw6kJRbLp6wnV16V4VoE1aIu/TLu6pmfufZK8Ca07XIizg9KaQj6CgCqCOD9fMg3suHTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788382969; c=relaxed/simple;
	bh=07ACrW5zkIgUmTwhlib3E6Ezj8EphHq2ybDKAfGthPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OMYKYaTAfQ4X7C47NGuP9KfqwGgMrMPocfa0RGpnKJ16CMv8WZOftfmOUQ84HBJ5OtVHvggvRXv7x1QB+bSvTbnvQzrKqAZ56b3XOciyUChf2Na/SfxYIAlxpZn9juVJNTSNbMvwVnXoLrKhmpl7eSqEA75pqMG4Y0UNpECAZg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LX7YX9Ux; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LX7YX9Ux"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d58efc7356so21020775ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788382962; x=1788987762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zMLlM2fX1xLcX/WTGlvxUY5Z2fLG31XCRQQllFSHGs=;
        b=LX7YX9UxGKYOlkuVD7wejO+u1yMkc1RuIjLmvpyYvkEX7WJj0yEupyzlndJj5FZ0lv
         8WV+AjG4xB++rNFMHkP6NpH0b8xJ8wjZd8Fw/zplxJpgIaskOzxbjviJS564w3zfckzM
         ceRUmMJCkHOYOx8D9gEEtYsN3iybu+dmmtyggfCVSUowK//4H51XhEGTzfLlBLu7rnLy
         Nef86vSxl13iUNqaetQJokT0Pw/uKOn11G0xnK6Y9kMoXha2jw0sIS1490pqOvpow3TN
         52k4SMpd2EBHhU1deV1bGbkmaYkNo/WWMQXk5neZ/eJIf2feWqsvki+H3U1WADA1p2nx
         Dkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788382962; x=1788987762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zMLlM2fX1xLcX/WTGlvxUY5Z2fLG31XCRQQllFSHGs=;
        b=jcYzHqH83PKqL9Pd4RRHOw0zJQ1R5bb1b8a+gow7PthzwRqgiggj8vl+JFBwE1K7JH
         OusoYdSjvrnKPstvAVM7Tb/BWryoTcUg3z2oQbnc+nY3bMw+1woRwuIQ3Q4e5UkHG4Xd
         K+9dy69OJ96sSOTQA1uRa3pxfltJqZeZItNDsGYyg9vzuewx3cOZeJIDYcqxQADfGWnk
         iy4L7qzytmzITLZsG9/HhN+nPRBqozz6PHTNRJPC11HRVV4lPPaNWEVBKgeuiBckAM6G
         6jbN8XEyfhKG9/GMG7IydUtJn7vkrg6x99CMEyhql1GXcu6f8aa20XpUoYioabbyvFT8
         Uw8Q==
X-Forwarded-Encrypted: i=1; AKwUvBw/9q5nXuaYOPMoEB3CdKiZQmIKsfqGi8Jb84KX/Z0E4eMBp2jt8KujJvFlXEP7ReuIjIfq4U1uGv/9FPw=@vger.kernel.org
X-Gm-Message-State: AFuF++kAhPPOqMSYe6A+nDh2UnrD7OsPpymvEMyHWrbwGjuCZ/wJuAet
	ylMm9NzsKIIU3J5iHIckWjw4r2qZKoAPL6b5ngiNxR7W9A6F76wlLWID
X-Gm-Gg: AYBFou3AhsTP7Z5jkfJF65Zp3SlEB5De34sfP4LyRg03nXhGD8MwYAIgXQRHglqChhe
	dSoeL77K/MC0USyQVapqbXI5ggjm0MRqOPDM6rTAlzDeyo8DKpcDRfrkxpJ9ixkj3qxqaUhBEIR
	MJNboWiQmcTpCE4f7TDtbyuLAFNyonW/SFE/Xw5pBYMT3FZfRWh0AIJDHiGdgA7MCufIS4dmkyG
	lPc/Uh8sshgcgV2CcuxSo/QEWGDCuUMjzneX9txYI1iVNgm2Vk6Q+49Tpobr+V5vv8K8IftIamF
	Z/CpPWDkfMDjYIamyJ8Hnk6SG9ARyrOAuCa9IENPujlSFXtORHAADNSmc+7Liydk9Kq6ykf96e2
	3nyFPTIhp11Cy1BFPegw8SpEnFUGTx8LWAMhH8m2APOWV3KYUSrkUEKw9NLOS0SLcCJuTNHtt7h
	FQVPHFeLM+e9inTPdp2sYuH6MdABnDsrYnwiCcDamY0CSBaAasFq315I/o82Z9YDB5VZKfnfWIB
	DiRgM+KN+kr/2H0ingfCuaiCCPclC2ciaZ3PKYpTxDXGPxhT3rYIzuGv6ANsaNJUWZu5pf6iiRa
	dV+UHuWhcI/VUNkkIUjf96zgBccoXqK1xtY2sw==
X-Received: by 2002:a17:90b:2d83:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-39aee049464mr12342955a91.15.1788382961730;
        Wed, 02 Sep 2026 14:02:41 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083f04d1sm1141515a91.8.2026.09.02.14.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:02:39 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Esben Haabendal <esben@geanix.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 net] net: ll_temac: Return actual error from of_get_mac_address()
Date: Wed,  2 Sep 2026 14:02:38 -0700
Message-ID: <20260902210238.283494-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When of_get_mac_address() fails, return the actual error code (rc)
instead of the hardcoded -ENODEV. This preserves the original error
information, which may be more specific (e.g., -EINVAL, -EPROBE_DEFER)
and helps callers handle the failure appropriately.

Use dev_err_probe() to avoid printing an extra error message in case of
-EPROBE_DEFER.

Fixes: 8425c41d1ef7 ("net: ll_temac: Extend support to non-device-tree platforms")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/xilinx/ll_temac_main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/ll_temac_main.c b/drivers/net/ethernet/xilinx/ll_temac_main.c
index 711ed9c2631b..7a4890e45eb1 100644
--- a/drivers/net/ethernet/xilinx/ll_temac_main.c
+++ b/drivers/net/ethernet/xilinx/ll_temac_main.c
@@ -1579,10 +1579,8 @@ static int temac_probe(struct platform_device *pdev)
 	if (temac_np) {
 		/* Retrieve the MAC address */
 		rc = of_get_mac_address(temac_np, addr);
-		if (rc) {
-			dev_err(&pdev->dev, "could not find MAC address\n");
-			return -ENODEV;
-		}
+		if (rc)
+			return dev_err(&pdev->dev, rc, "could not find MAC address\n");
 		temac_init_mac_address(ndev, addr);
 	} else if (pdata) {
 		temac_init_mac_address(ndev, pdata->mac_addr);
-- 
2.55.0

