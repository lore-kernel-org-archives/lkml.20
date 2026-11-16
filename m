Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863494;
	b=dPF3Sd9X9y74tFUhSbpSmwPAQlvDn51tw0NXlOd44YIUvr2OaNT519jIwyDdcqni3eej
	 mqcBKNCiiwpNgQgfA9xZOfGi+ZLNepGSm/JB/oWzj7qbJH7zVwSHMaUWLKUdbe0OuDa6S
	 KHbHYfyEgG6dBh3O3O4KUFPu+Pnlnk4rC8E2Tc2721wjrIIo06ufre7JF3EyEl9t65/2k
	 IGedKLZJgNfu11Gciz//Nwpl/brNNuI5DBsxGaVa8GhopmR7plyuaJWrff1i1ZyeCoUqQ
	 vYhJ+85KKOXlEmeP7T/GVaxHcIeBaP28C+gH2uoRhcPVNi0zZP9UmWXUIbjJcuF9oww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ILoO4goQSOoAFXrp9tlM49AIZVlr2sW5ElqOP880MOw=;
	b=lB6RUGuuRIDcIsokS34mOZWbZjQzps+ppGopJt5vExSTqYVltAIUM3G6O/vog54kpHPg
	 o2EyG864xWNRkFnGyEYSFBGLXAtUmPqlSBlAH0R0exSyqP2Wvg9lGxQ/N3SvWsrgwATlC
	 9Fsju7QsjHQKTeDeyIjfh4mUfFJui0MhH/DBsibq12uPH0z0mVXPCbzVN8HXdL6Ta50j3
	 t69Iocyfet7rQVnozQS1ZNYX+f5SyGMeyn3b1YKt1tw8DmVClEHEW/9WfSOQOr44cadxs
	 Yqg617IjOd/w6pxRCzUcYp7Z5d5RisRyzAN2vtMb8qkzJYPKK9wPSO+gRhKq9ULSsgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1LOCLVb;
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296B7606A89D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 296B7606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1LOCLVb
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67c0bd676eeso3064904d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794863492; x=1795468292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILoO4goQSOoAFXrp9tlM49AIZVlr2sW5ElqOP880MOw=;
        b=Z1LOCLVbqg3v2F2CfBLW30hHZGcUBUbf5PwM9IOmOKHSWFMqNO/IVH5dTHhY8OBBHb
         b8LmnoKVgF0wAbyinTuMmNNSpPniKQ5eiWzPfzDnhJtBLCTuS/cWH0/6K3616b40al6n
         uxGMSiw2aHfQVOSeV8PrN2Eju1fM45uzJpN1k437ZYsXMXgNlsRvHBtOQ9byhmHmb0VI
         9uMS8b+uRq8crE+tWrYBT/RA0pUBk24JGppTS5ULSRxJNjCAasdTFlqpu8PY+xrt1MrB
         08y+5BL8m3gi4K4EvV0dpKAJ2rEwcv8KJAmTRKtaa3rgoVyIyDC9WkaDFcecmecEnJB0
         xFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863492; x=1795468292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ILoO4goQSOoAFXrp9tlM49AIZVlr2sW5ElqOP880MOw=;
        b=ilHkmN+59lnqMhRvdECR8qzjgJPDjNfZ2uTG/g8edTz/XKyKyGa3BOtUhWBKJ/Sihb
         /tre8nwF2TFQix87WiLhGKwCap7P3TrABJdb1ZUO/QpyxSzPzF7cK5A6XLA573wH25hK
         t8+txAt70QjJ7MBZRY7XH5NUb8w7bok5QoxTNtbVixjTw+b70xf1w7ClRdADMzKvLtVY
         Dm2OKMFyy33uWXcaAg9UDZRkrH9dNhb6AysoUwr/fVURTzT7V/RQANThAWZ7YJInaQFh
         T9Se5VJWUz8oH5M96Dv9PN06cizY4C2KVNcbMxBYVTrITsfCAfZCjGPrW9Drq6Prsf42
         /2iQ==
X-Gm-Message-State: APuU4Z9NfK1MJh9pTOm5jsP9U+u74QPHJptoE4zJmhSPAaKf/VJmKKI5
	IMiyjxqj54Yam+UKvbvzR5k7pJ5bEmSbxiQwYVmEO5EY74K7ohNgc+3s
X-Gm-Gg: AZFdTZertI8W5DUiY9Td1VoBQrDOjDaWV9NjqDGLZ0dhr6L2/+wnoVhvS7nNEfaR93q
	EmwINvi9F4bTf5mCScHhDFJ8VA2go53zkVvQLLjXpMn0pFFoL0OjnsUkIVI/OkcdD8zRZ0yM9IE
	xwyum6G/SMOf4OEQWGojB/EagnDSZ03cwO2STacH1Q5I5EGuYCz/w0Jr+51RxowQNjNowEOm1t/
	h+ENgqHARKLXlAEkCrjNjvrw7VcM+lYu/pezh7VSdC6V0gp/kt668dUAwEZ4gnXFAOoOK4TsEDw
	2tj2qpBDYVPKszjJ20u8WKKi877NPH1dAalGGd/k5tWvMdf867lKFOZ/ouo29y08M6W/6Bq/3OY
	qUx4IeuOOBH/LyGqSfwjgDTFIXBFr/z6zOVlUZn3Jb56eTgzHkEvkrbovfahJE60iU38tI1Y12D
	M6/z/IEiDg7FP386XaI//ccHyAiXf4E1WKfiqqoA5qaQDuea/ECQj3of24ALrm5Ttbwv2TUzAwu
	d8Sur7w5wOlzPpLgMSM75r0SxoLDOdBIy3EP6ZhNIQhk8EGZJPR19gqYgO4P4HRI8J6BrYbuffK
	NVOq7KquHHWbVuOZAAUKtrzxsWk=
X-Received: by 2002:a53:a3cf:0:b0:679:93e2:2002 with SMTP id 956f58d0204a3-67d897c7c92mr5263413d50.80.1794863492199;
        Mon, 16 Nov 2026 13:11:32 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:44::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a59e70asm10952941d50.10.2026.11.16.13.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:11:31 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Mon, 16 Nov 2026 13:11:22 -0800
Subject: [PATCH net-next 4/4] eth: mpnic: support changing the MAC address
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-mpnic-l2-oot-v1-4-8dc6eb3582b0@gmail.com>
References: <20261116-mpnic-l2-oot-v1-0-8dc6eb3582b0@gmail.com>
In-Reply-To: <20261116-mpnic-l2-oot-v1-0-8dc6eb3582b0@gmail.com>
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, 
 Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Daniel Zahka <daniel.zahka@gmail.com>
X-Mailer: b4 0.13.0

Let the user change the primary dev_addr used by the device. Core
doesn't schedule an rx mode update for an address change, so the TCAM is
updated inline. The device address entry is rewritten in place, so
frames to the old address stop matching once the new one is written.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
index c01e276c4a74..fff35d150572 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
@@ -83,6 +83,25 @@ static int mpnic_set_rx_mode(struct net_device *netdev,
 	return 0;
 }
 
+static int mpnic_set_mac(struct net_device *netdev, void *p)
+{
+	struct mpnic_net *mpn = netdev_priv(netdev);
+	struct sockaddr *addr = p;
+
+	if (!is_valid_ether_addr(addr->sa_data))
+		return -EADDRNOTAVAIL;
+
+	eth_hw_addr_set(netdev, addr->sa_data);
+
+	if (netif_running(netdev)) {
+		netif_addr_lock_bh(netdev);
+		__mpnic_set_rx_mode(mpn->mpd, &netdev->uc, &netdev->mc);
+		netif_addr_unlock_bh(netdev);
+	}
+
+	return 0;
+}
+
 static void mpnic_clear_rx_mode(struct mpnic_dev *mpd)
 {
 	struct mpnic_mac_addr *mac_addr = mpd->mac_addr;
@@ -237,6 +256,7 @@ static const struct net_device_ops mpnic_netdev_ops = {
 	.ndo_open		= mpnic_open,
 	.ndo_stop		= mpnic_stop,
 	.ndo_validate_addr	= eth_validate_addr,
+	.ndo_set_mac_address	= mpnic_set_mac,
 	.ndo_start_xmit		= mpnic_xmit_frame,
 	.ndo_features_check	= mpnic_features_check,
 	.ndo_set_rx_mode_async	= mpnic_set_rx_mode,

-- 
2.52.1

