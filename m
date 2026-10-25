Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792945940;
	b=VI0QZ13I9W0Edd5DwW95WbKt/USF99KumA3ssznzWJJU/e1uAwk2bbr/HsUxPbkE4GHs
	 Ea/ZiYg73Qb7ZDgxm393QHefxIcBX+vfmULmdYQrOK9BfpxEFoyvJGLj9bUBGtpPI8YOh
	 Sl+3c2dm7JEeKxgeII1lbRfobjiq4aFlzel4lH4k7qw+45QEXIIuERq92o0kQ6NzbkOx9
	 mUixjm5tbcfZQJ6pv7IuP64VERbJQNQVprXhhAI1fpCmSBlWnuiWZ+TGR+jDRnejWDogE
	 hkf4kkPcyj//n+sEJXjUouR4LcXUOymQ1RQT0VWLPOhSCX8R4U8VLfp+Wil5y6T/qYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792945940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8okjaHqjL4OJDz9RgzhtvzITY5sy3ytCZSHI9pXfkb8=;
	b=cT0FCmpQ1J4BCUyhOIEYB778Sf+IZHVejdeVK0oYCsrL/mBAKgsmijc6xYN74HA/dhU/
	 TsjZqjOvzSVbJhIcutKCZJ4shtifqOo0Y8+FQ1tBgdIK3TQsE7722Gd1EAz6INyr9n7aB
	 LazsXGPINQtBRgH3u0roICIFv5l3CKF5uarQ9i2PR73XK1AW+IWe/BBDARO6z0CP/ITrP
	 hgo/QKDoxk4OZK2GlVynrw9craQbPBx/hOoD366+KxBCW+YwhWCafXw4z36sEs/kiJZ8F
	 pn0s2NUofFEr1lXCk6hMPcVdwBlD6VnFjQ17bK0HMzOcUfVYZJGJ/bn21c7+j4XryVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qFZnebnx;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DDC606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21DDC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qFZnebnx
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-16079d54c17so1681205c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792945939; x=1793550739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8okjaHqjL4OJDz9RgzhtvzITY5sy3ytCZSHI9pXfkb8=;
        b=qFZnebnxj5Vvx6U0fvVEUOfRvN1himjhFXtGu5AX5OCfmExMSshqb9FXwntjZV7ys+
         fcCHEN5ZlCO424XaWgf924/upjgtY78bqJtP9X1c3zhTu4HjAdm7gPMnD8Ef3QVBm2ey
         RXixkmHVVp+ruBQr1s7NdhTOhKGV/4NqqGhTq5v3vFDgTxdcgNP3T234mYz0ChKSgyGd
         cZhpuwtf6yiHBG59MNE4tVkGMEMSF26y3eDENo/8p+5mIDxrVzbUPHM9PbUSdkJqeZXx
         Wiz0oVF34Sj+k/JTutL5kLTll53rD8331uuwZfcDJMLpeuY/N84+AC671UZ1VCh9GuaQ
         x7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792945939; x=1793550739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8okjaHqjL4OJDz9RgzhtvzITY5sy3ytCZSHI9pXfkb8=;
        b=XqDp0pQadGaTOixd/z2HDk+fH0FP4+ziBN5sUQuIkyo17sb6a9vanVW5njYSVKn20f
         W22korpj6UJk1FJ4XHSesYUYswxHZEzDOZghl/5b3BI4aUTCiTMRgB2wJU1eTgyJhoYL
         lNd/9KtYm9oxgxK9H5g2gnD0r8onudxPjCtyxigKvj5fGYM0h36lTKxzbcuwrOVeuSFM
         J0BHZg/v4e20aBWdbrFcs7RRpznTTUXoSzmFCIPa3gaS+4j+82ET7KP93d04KwbJJKvx
         VwBXY9Uyw14xJ+z9OQaCgUR911Ye31MxAsjF3ZzpSe5b1TN+L/bp5FdWatoCwvG9fpok
         AUqA==
X-Forwarded-Encrypted: i=1; AKwUvBx3BMZ4juTp0y9fFAs9jb5/o/1BD4tv9nuHu35BaHt8AO8L7Wrfw+/BLJ7WlzpFlNyscJajOwhvs0En+rs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1ZYNnlBoso4F7NqiFZTMX4WH9yzqTeGZuwylza6ZYHxbPsOHe
	QA0PltNlmZ7l49vfn74SxY7LUe+2GGd7HYFdRm6aN/qxJ7B1JdXMp1l4
X-Gm-Gg: AYBFou3R8ujpPZZCOMc3IuM0izfmKzNjB1drNMUmwX4YqzZUxBXelrJwWwEdXTWdhF0
	V9GCRIC+QvvkSmzO5g8yNVOPeOl/qN5B9wv2xnIHQmijVceX6zGVRS0dIva5cDdhuRLEuXPOqbJ
	MswR8ZU1heQCo3KPG/raoCoID+vguzOpcJZftP9rFtofOJ2LOtT1iqMk/2DxGOw9v+y3epl8niA
	IbApkQ4XI/Mgs78HvhF2pTrb1Se/wBdDiiSeIwT3bzUqNpgIAPBHUre5bpwBklOIxVi3cJRi73P
	P8278oSVbYf426HHpJLUmx/bVPXi0iz0cHt4mqoH8yq26tLsyLfHuzFY5VDua7UA1JAkLMPGA1t
	x9dwUkdQEDU5YIyMSEewlLC6Q7UAG6tFxyEV3YkcVyUs5uLaLLnbwh38FB7b5TnpLFuININUNjj
	HKVPUu81/y5xZiLP+9dfbtXnSQyShe0b/alyy4V7hRW3k5P7IGRvrSiJ0TfgoKuW2xvRxBRJ858
	n4KQWnHRK/1hk4XuHKZ3Lwb+4FRMTj+/3Epi28vjqUTrEZGLzt8a9fC5EZ3Onsqx7JRhXjL
X-Received: by 2002:a05:7022:b051:10b0:151:d6e5:596b with SMTP id a92af1059eb24-1993571a0abmr7277044c88.9.1792945939038;
        Sun, 25 Oct 2026 09:32:19 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f83cedsm22025164c88.13.2026.10.25.09.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:32:18 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>
Cc: Ido Schimmel <idosch@nvidia.com>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Subject: [PATCH net] bridge: cfm: keep RX work disabled while CC is disabled
Date: Mon, 26 Oct 2026 01:32:15 +0900
Message-ID: <20261025163215.62509-1-pocj8ur4in@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Found by reviewing the peer deletion workqueue fix. After CC is
turned off, a valid CCM can still reach br_cfm_frame_rx(), clear the
peer defect and restart its RX timer. cancel_delayed_work_sync()
only cancels existing work, so a later receive can queue it again.
The peer may then report a new loss defect with CC still disabled.

With a bridge/veth setup under ARM64 QEMU/KVM, disabling CC after a
loss defect and injecting a valid CCM reproduced the restart. The
original kernel reported another loss defect; the fixed kernel did
not. A test-only gate paused an in-flight receive until after the
disable ACK and reproduced the same difference. The gate is absent
from this patch. The reproducer passed with the fix; bridge selftests
were not run.

Initialize each peer's RX work disabled, enable it only when CC is
explicitly enabled, and disable it synchronously when CC is turned
off. This also prevents an in-flight receive from queuing work after
the disable completes.

Fixes: dc32cbb3dbd7 ("bridge: cfm: Kernel space implementation of CFM. CCM frame RX added.")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested under ARM64 QEMU/KVM using bridge/veth, netlink CC settings,
and valid CCM frames received through AF_PACKET. After a disable ACK,
the baseline queued RX work and reported another loss defect; the
patched kernel rejected the queue attempt and reported no new defect.
The same difference was observed when an in-flight receive resumed
after the ACK. Explicit re-enable and peer deletion were also checked.
No physical NIC was tested.

 net/bridge/br_cfm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/bridge/br_cfm.c b/net/bridge/br_cfm.c
index 9dcc97d63a6f..8576f387d037 100644
--- a/net/bridge/br_cfm.c
+++ b/net/bridge/br_cfm.c
@@ -150,12 +150,13 @@ static void cc_peer_enable(struct br_cfm_peer_mep *peer_mep)
 	memset(&peer_mep->cc_status, 0, sizeof(peer_mep->cc_status));
 	peer_mep->ccm_rx_count_miss = 0;
 
+	enable_delayed_work(&peer_mep->ccm_rx_dwork);
 	ccm_rx_timer_start(peer_mep);
 }
 
 static void cc_peer_disable(struct br_cfm_peer_mep *peer_mep)
 {
-	cancel_delayed_work_sync(&peer_mep->ccm_rx_dwork);
+	disable_delayed_work_sync(&peer_mep->ccm_rx_dwork);
 }
 
 static struct sk_buff *ccm_frame_build(struct br_cfm_mep *mep,
@@ -695,6 +696,8 @@ int br_cfm_cc_peer_mep_add(struct net_bridge *br, const u32 instance,
 	peer_mep->mepid = mepid;
 	peer_mep->mep = mep;
 	INIT_DELAYED_WORK(&peer_mep->ccm_rx_dwork, ccm_rx_work_expired);
+	/* Keep RX work disabled until CC is enabled. */
+	disable_delayed_work(&peer_mep->ccm_rx_dwork);
 
 	if (mep->cc_config.enable)
 		cc_peer_enable(peer_mep);
