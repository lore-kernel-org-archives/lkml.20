Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4861D485CCB
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206894; cv=none; b=lc+GsDYSUYhwcjifOWwel3h+CqzVWKlL9suRSJ7Ard+gtKGlMdU0NoxoEYByWNPPBYiqdbbEP9kxx+oeSIXB+TAsp+97+P/Q6WApIDjoztQATJcYFSvAwWq1tx/Ao+rEjNgeHrEy4h+2DAXLPhgcBoIoAuMdTRJDrxYCu+wmYys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206894; c=relaxed/simple;
	bh=akgxDLCMRWnju1F8nlTi8ruGP54ydtpCtXeCGsNTtP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Mme50Ajz5p3kC0ocW6XpEQglOY3JsCA6ICEAFamzzWBDtX5XGIiOp5actu22J37NiAkXEjNwV4YmMssBI7dHqwh+aCSGYO9SPsX9BeK5V660yxHxNlH1S2e1R8LfeCcDliB9LKFGMX76S5ytIoGwmhfeO+wx/22oKUeiZ7zJJ50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdlMj8jl; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdlMj8jl"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0977b9c20so23372185e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791206878; x=1791811678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2UiFZMjxaNVOcwpMoTNUMbszzfHwtYL0qU2Yy5cm+FU=;
        b=RdlMj8jlCxNGEq20K+2pFddX44VQ7qcDVW0iXNleAhb4e2gJiZYizJJM2Mz9LNYywy
         uYnf54aD8sNAaJWoxfCYzfKaA0zIE/9838Xrs+HxJtnyQyoGDRrznPv9u8ewAdnx4hQe
         NIJ7cS/r1oAtCYbzQQa1yOOSCpSFaotjc7s3wp9Q/ZKQTsnzEvc0uCC5bsGbSGP+WcsH
         SueTPeKOcVHT2IrGDvcDko5h9u5GhOuLf1TsbQt1tPd2ZFr4IIGW5ecPMjFCFaNwyDi5
         UMz3JzWAf0bYquqPGYNx3tsfAcNgRPtEzupYedyrLdVqfTafHbC1nApl5sY6V7yAE4uH
         7ncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791206878; x=1791811678;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2UiFZMjxaNVOcwpMoTNUMbszzfHwtYL0qU2Yy5cm+FU=;
        b=kkrlPH5SsMF6iCRmV4j0lfrJ9kw48Cob5hFDTygyat3pkHFySn87PmPCY7U78Ezfik
         7+ij0TVBs1Jdrj+xr3vui/Ql9skGU5DNjy/RzYHoWWlSiJvhoVGzZ67YHQQ9fQIDnECG
         6g4ITx71F6dEAb4K1Q2/591WhkGGJiuuXBAdirZgSPECzgtUOM1vb0/z3dHshMSio5Ie
         A1ynVCus9nl7CA2niEJX0JYPI/v2xaEv6JQPuvH6hw0Qgg4G53bG3KhlLAGaKEj6aAvv
         SAYAMQyJ/N83BkWMDivtQUXo7eowgNIycrGm5mw9ktpoqfXwaGCpI6Nq+m0T9h+OO1vK
         5gdg==
X-Forwarded-Encrypted: i=1; AKwUvBypNnH/6W0DMm3jTAElBbLHj0UkD44qjtcfBlNrocwNp/Rizk1HZpw5O3k9+8t+ZyHbkJvYW3oV4r47jE0=@vger.kernel.org
X-Gm-Message-State: AFuF++mzDdu3l9ELgGIRt7vax9MhRFARRgseE6ExMmRh1QifyWl82bIg
	BCgt81ldrvecdgr9IotJdnp/5KtFKGG9uAzm0ddgBF3E0il188W+ronJ
X-Gm-Gg: AYBFou1hOEjssRl0CNoimzceWRQ7oaE18OX2a4obpdyIwjin0/uB4qQluC3iF8KAJlF
	i8EA8Y9Eorjx23gRXce8Ee8UDL3Tdo2jo1NOq0j7EzOhK2T2i3KpZjvSV0D4pt3KDqklp5rECbe
	qKYwm4ME6YAWEow2nfRmiFHrRbqWX9m+wDGrh6sXMn3Ija1N9L15bndtE6Ky2w66m6LEKqcsac4
	DqqMWgCR+h0/iR+/4rV+DTP67Vb8ApqRr5c1sov4VmqVDk7eN7RwxwWonBOgAXAerUcCpbNf2YR
	w2MSCRY8GQY2caSp5zQrT0/QaRJok63ffFJ+QjgDfai6U1QW6IK1XAvTegTfzQf42Qc/zAkIF+g
	ghLqZ5voEBtBp4I+3fHlJz+UdOTn7qjkrargdSu4cygVKLNzPzvq3Af/yeSo15ZJ0kvzon5jICM
	c5vikLYUXs+ewVpPMH9GILAwuie5ZEas5qd9VPxQEQyxzMQj75wOjggr8o7WmQT6OQIj9O
X-Received: by 2002:a05:600c:474e:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-4a02759b67emr197566455e9.22.1791206877810;
        Mon, 05 Oct 2026 06:27:57 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16d6295f9sm260315305e9.14.2026.10.05.06.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:27:57 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH net v2] nfc: nci: fix out-of-bounds read in nci_core_reset_rsp_packet()
Date: Mon,  5 Oct 2026 16:26:28 +0300
Message-ID: <20261005132742.324374-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The skb->len != 1 guard admits a 2-byte payload where config_status
at offset 2 lies one byte past skb->len.

Fix by guarding the nci_ver and config_status accesses with an explicit
skb->len >= 3 check, and restoring the original skb->len != 1 condition
around nci_req_complete() so the NCI 2.x reset request stays pending
until CORE_RESET_NTF arrives.

Fixes: bcd684aace34 ("net/nfc/nci: Support NCI 2.x initial sequence")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
Changes in v2:
  - Preserve the original skb->len != 1 condition around
    nci_req_complete() so the NCI 2.x reset request stays
    pending until CORE_RESET_NTF arrives (reported by sashiko).
  - Fix NCI version labels in comment (NCI 1.x = 3-byte RSP,
    NCI 2.x = 1-byte RSP + NTF).

 net/nfc/nci/rsp.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index e20df7fa0829..8226d09c99a5 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -32,22 +32,15 @@ static void nci_core_reset_rsp_packet(struct nci_dev *ndev,

 	pr_debug("status 0x%x\n", rsp->status);

-	/* NCI 2.x reset response carries nci_ver and config_status;
-	 * a 1-byte response is the NCI 1.x status-only form.
-	 * Require at least 3 bytes before reading those fields.
-	 */
-	if (skb->len == 1) {
-		nci_req_complete(ndev, rsp->status);
-		return;
-	}
-
+	/* NCI 1.x: 3-byte RSP; NCI 2.x: 1-byte RSP, request completed by NTF. */
 	if (skb->len >= 3 && rsp->status == NCI_STATUS_OK) {
 		ndev->nci_ver = rsp->nci_ver;
 		pr_debug("nci_ver 0x%x, config_status 0x%x\n",
 			 rsp->nci_ver, rsp->config_status);
 	}

-	nci_req_complete(ndev, rsp->status);
+	if (skb->len != 1)
+		nci_req_complete(ndev, rsp->status);
 }

 static u8 nci_core_init_rsp_packet_v1(struct nci_dev *ndev,
--
2.55.0

