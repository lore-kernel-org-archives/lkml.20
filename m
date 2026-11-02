Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590072;
	b=FV89VtYdJuvzsO+9cxHOEf3WqEo0BF6m/z+oGv8EX+w91Cyajq8XSvuN2xKjs3NiHAWs
	 U6/tXARrIYa13px+v8O+0Abhxm+uIqGNBqTQHJpvT2U2cIJAd5lYcZA3jLrNbmVJTDZS0
	 cNVHgug5oia549Pz5jR2Erhy6EFU44ac0sNgU5wlTZzERSjjqhXeWAxX6Xpa2auusK848
	 mTjSWQ+Rj064YwVva3XYbcaD07q2t0SYKi1JQSO8pUHPUToLB5DhwcNK24O6WyXh9+NG7
	 XCY5W+p0r9O8RFceASGWJFCGqGyOgGFzFOjf8yd/yKbQgomJlTHx+8KOCVJ7RDN+M9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8Llr+o6Ts4ECL1b5wY6waQNbg14/hj40EOsrJUW7ozE=;
	b=NNW+TFgk3NrCzmnqrSTFxXmvo3Befy3pab4NHsHAbbV/QCCsgRUY83NJL3vrl8erSRvC
	 x+rJfI55Tx1DGqKLKCCY4VlYIrxX94gOLzyu2BvQ5mX7wfKdZ+8L7IXQhMN5uTZGEr7u+
	 896vgdZjIwk6itQvcuK9mpZHbzCTYe+MYGrq2duczJCzWnBS1/pyiJByqladYWAOYhnMI
	 rX04+IvaZJGjVA9bZvs1F7V/gxEMxa2GJ+UxJG8uMinLraDfVS4fEGgsuPYFbMMpsyzH4
	 hWWNeGbeuISRaG0bCXbyC+EkUgp7x3oIwO5gReV34fLopU163vbmU3UhigS97iC6/Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hp/763Rg";
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1A8606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F1A8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hp/763Rg
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c60e30054so28925416d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793590070; x=1794194870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Llr+o6Ts4ECL1b5wY6waQNbg14/hj40EOsrJUW7ozE=;
        b=hp/763RgOF/wT8bcAevxBP9ug5KDLc0g3ts+YAgLMuoUBcWcc5nAXIQo4U4Vb7mGC2
         Ln752RcJgv7sD5UQo/lGCcJL3jjuwwf+KFd6KUHcVQ/Y8si0Ka81q6poUuW7yntj1ha4
         1AfQWopqakSkNwQLyqlz2ErNU5uJXPkv3Lhfd4B0wTZBojcylZAdOF+mzHrCtjDnKo3m
         2az3eDoEPMi1fbMFANKLZUk95uEpY9Qai/7YY27guSFumOv6PZGITCWsPRLsvBTkxDRP
         uYbup6LNU2kQHJDEyuaCsaQ2/gB15wkXVdqGwyuUSjqAQMEdHReq7WKg6fE8NzIbG4z4
         Dd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793590070; x=1794194870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Llr+o6Ts4ECL1b5wY6waQNbg14/hj40EOsrJUW7ozE=;
        b=2g6P/FCFfIl+Mxp/YnXVxsfsmT6UdEA00D0eqQ/UHjG+Z8UXi4R6aalTJifqMQYVgC
         eQHxPvh/IK4pSaqpY5kXEZvCaCz97RvuR0BINAz0Hg8iCsQlJjCzMaM3GeuNXdar7oJH
         nO4nBpu+sYPxOdHaCJxv/cKyaEA67RQGQtecOi80clp+1H8OcB2Q85x0tLUsFTJ20zhT
         dhS/hMXt9ZkwEMgIFcfW7babMTsxXPQdTCtHNIWvpOl7aXbO9XojNyNhbFcyZ9YG5zSV
         71/3u0IGP0qKMbnWQwl7CBi5Gcd+/0NCkr2RR5mA6qEPIWN/deOZSf8w8YwHw4kKXE1L
         K2Rg==
X-Forwarded-Encrypted: i=1; AKwUvBwyqrjHBuTpqLYkSrtSh58tw5V5Fi2yyRXDQ9vx24vDrlS3B5bzMHqH5pIG3iuQshs+v3/Xbs29gfnkSJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8v7eGt6cMsxY5X9yqhVj3P+dkLkmRetGDagvTQjEeKpN7Nn6DQ
	Ik2HD0eLNizQfLAqqoarrICqOwt/ubkdrwTjKqEh7f2b4e0Ss4eyLKuS
X-Gm-Gg: AYBFou1gHm5SFuMop+K+FfPbiKrH1aWaaHccdKX/iE8y2gnNMZmop3B4kWmvDsxzkn+
	v1uGJqVpq9NSb+6H/X4RuqWFgGewN0tmVQkduRzyNJxv8DWIslI2uv2xnPuCv3GN7Zg1LKKPaoH
	rdav2v7Ate11LOR5QWzXGJNa+24unDqhWLdj2GeFEjv7KhgWsGsmfN7H2Aylb3R4q/bFxocRcb1
	YY3U4omFyaVFWrE89ErijKIWVdLQOhK7zpZSI/BgOPBAGnksNDjzi+eiKTkYTBC7Xwr79HZ2oBh
	1JUYSuKeCsvOc0v788oI/7jbUnc3zfRUo49eg41NvrF+n/7GrSmgVjOlWGiuNfu72ZB8n9vp1l5
	Ax9F90d++WK2rz56xv2aBuE/+oWRq+qBj1lFfvxOMOuX1pcFBR9NZ7tIgXRFK4JuWDatYoi0gIN
	j0DHTdwdgU4Cl7enw5xmlbZSQVhEyahi06jkX/0QydLgq+aBmlBP84J6F2+zNsK3MIHHlQ3061F
	nzPcHsGbKaiIZznfks2+hnvcBA/t85z34d96RHmtwHlYtDuWI+1vJtbrnAwVtAmkByhII9QXetk
	SiMaO02A3x2H5vP6XpvT3UIeEPn1J7H09hVunyKoyfATz1Q0LZsc
X-Received: by 2002:a05:6214:4518:b0:914:45c3:7920 with SMTP id 6a1803df08f44-91ca4b1cb1amr156083956d6.31.1793590070385;
        Sun, 01 Nov 2026 19:27:50 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca804eee2sm80737396d6.27.2026.11.01.19.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:27:49 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH iwl-net v2] iavf: reset the VF instead of freeing rings when queue disable fails
Date: Sun,  1 Nov 2026 22:27:43 -0500
Message-ID: <20261102032744.304907-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
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

iavf_close() leaves the Tx/Rx rings in place because the hardware can
still DMA into them, and iavf_virtchnl_completion() frees them once the
PF has answered VIRTCHNL_OP_DISABLE_QUEUES. It does so whatever the PF
answered: for a non-zero v_retval the error is only logged and the
DISABLE_QUEUES case runs anyway.

The PF can fail the request while queues are still running. ice and
i40e give up before the Rx queues when a Tx queue cannot be stopped,
and ice also fails when an Rx queue does not stop in time. The rings
and Rx buffers are then freed while the queues still point at them, and
received packets and descriptor write-backs land in freed memory.

Keep the rings when the PF reports an error and request a VF reset
instead. The reset makes the PF stop all queues of the VF, and
iavf_reset_step() frees the rings once it has completed. Until then
iavf_close() may warn that the resources are not yet released, and
iavf_open() returns -EBUSY.

During removal no reset is scheduled, and iavf_remove() would wait for
the state to leave __IAVF_DOWN_PENDING forever. As it resets the VF
itself before it frees the rings, complete the transition to
__IAVF_DOWN in that case. If the reset never completes,
iavf_disable_vf() now frees the kept rings as it does for a running VF,
instead of leaving them with page pools that point to the q_vectors it
frees.

Fixes: e284fc88dfb6 ("i40evf: delay releasing rings")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
v2:
- Let iavf_remove() go on when the failure arrives during removal, where
  no reset can be scheduled (sashiko).
- Free the kept rings in iavf_disable_vf() when the reset never
  completes (sashiko).
- Rebased on v7.4-rc1.

v1: https://lore.kernel.org/r/20261022192753.69765-2-oss.patchbox@gmail.com

This was found by code inspection as part of ongoing, not yet
published research. It has not been reproduced, as that needs a PF
that fails VIRTCHNL_OP_DISABLE_QUEUES.
Compile-tested only (x86_64 defconfig with IAVF, I40E and ICE, W=1).

 drivers/net/ethernet/intel/iavf/iavf_main.c    |  7 +++++--
 .../net/ethernet/intel/iavf/iavf_virtchnl.c    | 18 ++++++++++++++++--
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/intel/iavf/iavf_main.c b/drivers/net/ethernet/intel/iavf/iavf_main.c
index 2f8a80a11336..70ee5ae14a64 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_main.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_main.c
@@ -3064,9 +3064,12 @@ static void iavf_disable_vf(struct iavf_adapter *adapter)
 		iavf_napi_disable_all(adapter);
 		iavf_irq_disable(adapter);
 		iavf_free_traffic_irqs(adapter);
-		iavf_free_all_tx_resources(adapter);
-		iavf_free_all_rx_resources(adapter);
 	}
+	/* Also release rings that iavf_close() left in place because the
+	 * PF failed to disable the queues.
+	 */
+	iavf_free_all_tx_resources(adapter);
+	iavf_free_all_rx_resources(adapter);
 
 	spin_lock_bh(&adapter->mac_vlan_list_lock);
 
diff --git a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
index e6b7e8f82c7c..28818319a6df 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
@@ -2718,8 +2718,22 @@ void iavf_virtchnl_completion(struct iavf_adapter *adapter,
 		adapter->flags &= ~IAVF_FLAG_QUEUES_DISABLED;
 		break;
 	case VIRTCHNL_OP_DISABLE_QUEUES:
-		iavf_free_all_tx_resources(adapter);
-		iavf_free_all_rx_resources(adapter);
+		/* If the PF could not stop the queues, the hardware may still
+		 * access the rings and Rx buffers. Keep them and request a VF
+		 * reset; the reset path releases them after the PF has reset
+		 * the VF. During removal no reset is scheduled, but
+		 * iavf_remove() resets the VF itself before it releases the
+		 * rings, so let it stop waiting for the queues to go down.
+		 */
+		if (v_retval) {
+			iavf_schedule_reset(adapter, IAVF_FLAG_RESET_NEEDED);
+			if (!test_bit(__IAVF_IN_REMOVE_TASK,
+				      &adapter->crit_section))
+				break;
+		} else {
+			iavf_free_all_tx_resources(adapter);
+			iavf_free_all_rx_resources(adapter);
+		}
 		if (adapter->state == __IAVF_DOWN_PENDING) {
 			iavf_change_state(adapter, __IAVF_DOWN);
 			wake_up(&adapter->down_waitqueue);
-- 
2.43.0

