Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697280;
	b=AAG9Ckt1OYldX+yn0vme7F+nx2rtNiZQntZCJLHY2C7GoJWHkvv7LCrX6N+E/oXujSVH
	 3pg9ySyhADMMhiu9ednP88ShHhdaTF7j7qsuEyINvux7VnLbfcvzxNzKknBA45//YgiH0
	 DPxq8TznoQ9OUW/HKkco6YDU3w8DBjxWGS7TXPDPQJVU3zd9O8M/EO/C7L4i1FFajz25w
	 lonOMlEcqR0ENQHrUNBLltIpe5hgv+BB/n406XOzKMMlzLMdUPJ9Uu1lXKxzl5DtETJdj
	 XaUDkxxIRWo/XIsDOslXudUL41fotmOqwUhVSDxLWKYJ5/MgbH6j3xFpgLkVC1fOL0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7i5zp/nMBoh4FpTzc2q5LQUaQs09zWC1CfEISFvjXJc=;
	b=fXMsMejbLP8YtUA1JiEAYShP4/fjXXP/2t5/jfrp9YRMOBgmZkoqzIHlXDpCMcYJpCS8
	 rjwFNvGZh5qHDVWCQaxqslYCYYOTQcLFaZ/bBUbuwWwfRew/iA34IMH6UEePebILqTqEC
	 VfdpoR5GgYzuihlJzOTXiSvq6PuDrylaiSk/xjhsR/Mu0zx2OWoYOY+2WT7RyYN81h5cD
	 gNtqZkLmOBRFznGE/DR8CcOXDEkXghKBKD7Md7QlpdyokMImQB4KA66fPOZbK+AC07LGt
	 BrKv5UAXwp0zOqYPzx5gzlCNZ5mUlleoCjcVIyl0r9tGI6Whu4O5rOo9qqd+1g3S4Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jcVNGsST;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683F8606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 683F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jcVNGsST
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-917bab38b14so2488656d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792697279; x=1793302079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7i5zp/nMBoh4FpTzc2q5LQUaQs09zWC1CfEISFvjXJc=;
        b=jcVNGsSTUgOJZcsD4vjQuyUcr+VHbKW452Ay+18BZmBjCtAmtShccx2Mm2NqZJqVrL
         iA0pkDn622MxPFIfy2TOVL8bEutW1ghtxtQRpbTilXonVWn6Pi3WZ6M6NXcjDjui0fUq
         GDfocVuIHpVgJtVD3OvAuGo9GBEyOM4Bugcy52PrhM6KS76zbcrDXkPzVwmazuFERIMp
         QTGwZUp/pwg/X3m9uyy8q2qjO3p7oKuT9+YpuaTKAu+eQ57cg+/vbTsw42DJtwVYX6oX
         2ByBAGegWuUra3lxMOOJtliqlhHHFSy/Peg0tKviIpbbNYFkYe/yCoJrvA+TtvB9lwd3
         Lnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697279; x=1793302079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7i5zp/nMBoh4FpTzc2q5LQUaQs09zWC1CfEISFvjXJc=;
        b=wMbgF7/X28v0LbvfR/Y5tfEEEaT4EwcZipFIZnyeS3L8Ve3S+O12gmBnImccxz+LbN
         AaPJI91F6LQWp5Fk6xZOHyEoYBiP476U5U1BbUj/V58hY44F8TNVnBbpGnd0Fip3M0eF
         Zk791LlY23T1aSD59vGOW5m2C9jZoMf3A8xRxbhYlUoDF0d/lzyPEv+gUhONxK4G9xy9
         qn43b6caIB2P6OSTHnSaFvpViKphaKnYWD6+j7Pl4zIMojsixKqMgtvokvAQIX0yGT/x
         S9cHlElUaYzquKXIaWTLoUPJZYA9PRyu6EPZWGjok/M1Uca0DJ2RQzGDvoU5nVdzEMxi
         bDpg==
X-Forwarded-Encrypted: i=1; AKwUvBzt2hniEYDOEJ7q2OG714FGX0QEYlvF+Lb3qA812ursdPnVEJCzr4+ouAB+3LhXPYzmEyW/6HFsmZu2x6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTQ7oKk3FAn2IRBzwPcha+pT1OtSEYI1RqpSZzRkBxMHKiaZw8
	eJf/f/nHMzr1Upo1rV0kJ1TWGizHRoT14V7QsQ+QxYZMi6DajrPdSAlFO/EG3A==
X-Gm-Gg: AYBFou3xnbm1n/DHSonO34xguZayjr+DdB/N9NrFU7aT/acBAeQZfxjYdujTjfReHdd
	D7OYuv+HWEFWJL4yJZslUtHCIt+6OG8b1ptjz/xJIhEYfDZl8+BSxSGm9Pr5MIx44zFRIKDb02d
	6uNFdUVx603YK64ivar1Oxmg9RUW0V1TFL5FbZ/InCtTAaJU3Yt2s7zhP3S4ckOJMUFSXm4o92j
	S+44We7Ex9bx8AZRXaKMfdeeixdL3I6bPZmlr+s+dBODROZ8A4hlNaqQFLB+O2NqKVX51txPHEm
	s9WVUEhDuRmSNHX2gYA7UzKbjhA2KSRFN2W2Y5vPIVpQQRmpBLDID6FOqcj2rDOzuwCKQOGvQ0B
	nZDASPtXzrhGbMAqE3OCNlWW9dw564MqLXm9Xzb4swHHjd9100vVJcEkHwKmj2dBKpao1mm+AXS
	dB2LtTkUPj2khCuPqGFLX8vw5zCUboP7IaulUbEG66Q2HDBUJG66vJuLUXnNum/6+OwsGIEswGc
	iS+xQgqfSPkZzhJSbOgmYZNs4lfr8NQwnDBCMKK+Ie4WxZJzhp7QAKO01olouO3ab52QokEnopq
	lHI=
X-Received: by 2002:a05:6214:509d:b0:919:5a24:d20d with SMTP id 6a1803df08f44-91c12eb53a6mr104325966d6.11.1792697279221;
        Thu, 22 Oct 2026 12:27:59 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c396afa91sm370296d6.11.2026.10.22.12.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:27:58 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH iwl-net v1] iavf: reset the VF instead of freeing rings when queue disable fails
Date: Thu, 22 Oct 2026 15:27:46 -0400
Message-ID: <20261022192753.69765-2-oss.patchbox@gmail.com>
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
iavf_open() returns -EBUSY. During removal no reset is scheduled, but
iavf_remove() resets the VF itself before it frees the rings.

Fixes: e284fc88dfb6 ("i40evf: delay releasing rings")
Assisted-by: LLM
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
This was found by code inspection as part of ongoing, not yet
published research. It has not been reproduced, as that needs a PF
that fails VIRTCHNL_OP_DISABLE_QUEUES.
Compile-tested only (x86_64 defconfig with IAVF, I40E and ICE, W=1).

 drivers/net/ethernet/intel/iavf/iavf_virtchnl.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
index e6b7e8f82c7c..178bba609677 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
@@ -2718,6 +2718,15 @@ void iavf_virtchnl_completion(struct iavf_adapter *adapter,
 		adapter->flags &= ~IAVF_FLAG_QUEUES_DISABLED;
 		break;
 	case VIRTCHNL_OP_DISABLE_QUEUES:
+		/* If the PF could not stop the queues, the hardware may still
+		 * access the rings and Rx buffers. Keep them and request a VF
+		 * reset; the reset path releases them after the PF has reset
+		 * the VF.
+		 */
+		if (v_retval) {
+			iavf_schedule_reset(adapter, IAVF_FLAG_RESET_NEEDED);
+			break;
+		}
 		iavf_free_all_tx_resources(adapter);
 		iavf_free_all_rx_resources(adapter);
 		if (adapter->state == __IAVF_DOWN_PENDING) {

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

