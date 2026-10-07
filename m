Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843853E7BD5
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791395630; cv=none; b=GSZt7ihZcHcs+j4b89L6OWyWquaF9KU7wyEgogJPfoacxs73vJT7TB7tsM1ksGODR+QQHPqerg0G8+mPffNm8uxFf/169nLKV9v6rsPpF+C/uu2VyzdEcbmIL4eKrSQIL19U+JffPoQtkJd0oMlNqJymEjwuLSAAfMCZFN6N+JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791395630; c=relaxed/simple;
	bh=2T8Uml0NShGNDvWiMP4NXducNTo6aIMaISEXdT4NZNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GUehsF+QXfUBqomnVWqYiLwy5lkoh0buY79Hs46D3kN50YSD10cMOw5TdtkpJ3EmUM2SpuqiRQfgF37dYLm7hiGSFBfijIKwVS+ABdq/dk7ugIWqcrrMOxsUw5t8uigqrQfkjSGM4HU1W/SUAEO2LJdt6DhljCes9NVTFDWqqDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADXn2KaD; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADXn2KaD"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-34c89609923so2616547eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791395628; x=1792000428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+gmgxmP0+2UXMwCdLFQZo3obMVJ/yu9W4LFjtiv3dxs=;
        b=ADXn2KaDWP/+D02ixgxH/48YDvW9wiwDGK4bbktJXhuM2Svd1iEJj7/W69UtK/G3nX
         DF8vSmhusadvvW9nCEX4XdCa5W9hf3ZD67waPhU55YUzvhC6dbrX7E+bvKZnE2r+6wMu
         yzQv95D4H9r9gQ+vEsR2b7WHtHWmxNtCSZImi9wm1a+n5KlDoNDZv87ez+ktX/Y3RMGw
         5SWDBfwcVs9to1CdsawSqqG86ubyo/OhVJUPcPe3wpvLUuBTwBPXmy3njam6D3Rjz4eo
         Q7ca6XX0gOxaF3puKf6G4OMedzsE6LhNpkv4azKtRlOj5rR8xJTNVDvnxqE/79X5AEqu
         FLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791395628; x=1792000428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+gmgxmP0+2UXMwCdLFQZo3obMVJ/yu9W4LFjtiv3dxs=;
        b=YTckhewdGIV+ywjjDMl6PpxmkC5kKinwZtIuruZyOyd7pRtcNUUksKtv/tzelchIm+
         aXxKak8X12wvhQw9swr/Oyz8Q4eq2ERXK7gIst3mGUL9+IiLtLHbBn35F2qN/1ryWtNq
         I/cDRP7tLEjbUJrwMdOizOoXbPdMtIf/WKU4BzUrp2IZUyv/p8C15n3VbJjnPqRXgtU3
         kCJQ8PBOY91RwEGQlE3Zn1igutNq6SluZimPdKkrM1Awc6QwowaNDOmflwTMmqcOiMYI
         tjGXt5xtmE9gRivKlSsEUzdf/QCpcuZe/Ef9NB35F+0AvgSywwGcAOtpXtUEAHN0tut1
         Bd2A==
X-Forwarded-Encrypted: i=1; AKwUvBxmUHlMI5sjMPL4BmJa+LFiK+5jEqRRoJQrseDyUUxYNm/+IuBDM+sE7tenTcIvF/wDMxNXBDFMfTsf5sk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkwH+B3AV7i2ARZMObXA3d+dQqGyQN8zyxzEJyQKgrvKABlLT0
	f6q2l9TgsWbPPXQMrWnPQzOhlk3bkV9eNlyJm0BTvlJ2M33LsRCfY0uc
X-Gm-Gg: AYBFou1CA3X/y4YtGYf9N+eEBwQmQmepwbmdCXhHFXsok3BaR23Rf+IrOuPY5TzdcI9
	BSxNLjJswZ8QVisTwN73t9o3BWFH9EGEwJ27FbRfSDn3ix12OgXAgIxnUwY/2g4TtPTf6TO1ICc
	sGtvOKx257n1SUdVzAsWym3pLiUPOWPDtr4no3MRowtWn29YpeDDnHgBffncJkHf65AtkH9sOwu
	zrp6E3ZqFwPIQ+wfL06fsg5fp8GnYIt9zfLo7cIQ8DXl0bYSS11l963dRLX7MaJxwfLwUNspASg
	ruDjNKBDzLaQ5caUHZvmEtwbLhQ3RF2vwvs2kqHfHXSkAm7u2Eh7dxSdP3vqtdsOE33jI0NaIi0
	P6YqoZn0QyQT7RHG1gaC0O1WXax/r4VfU6t6+jLiWe4UVJDQA+n9Pnaji4aSzqrDPAQweYbAV/u
	FJ3wOvwMeFheW7xBYVcfMKPOK+7r0u+I1/I81EesHCJBto0HnZykEJM+ue33/D5RaVQEam2YswW
	RCLEGKOko77c4BnyTOsyhH7pJtK8PqqFJvHx9NVCMtlb2YBD5NgqOe9wmQtkbIroUJhV/uKDHtC
	4aNivEB3FSuzHtnHNm7ueKBOUkZi/w==
X-Received: by 2002:a05:7301:3d12:b0:342:645a:5cf with SMTP id 5a478bee46e88-3515dbd00c9mr4952275eec.1.1791395627340;
        Wed, 07 Oct 2026 10:53:47 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af90521sm16129669eec.19.2026.10.07.10.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:53:46 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Edward Cree <ecree.xilinx@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-net-drivers@amd.com,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH net-next v2] sfc: fix stale kernel-doc member names in net_driver.h
Date: Wed,  7 Oct 2026 23:23:34 +0530
Message-ID: <20261007175338.28683-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several kernel-doc comments in net_driver.h describe struct members that
have since been renamed or removed, and the EFX_MAX_FRAME_LEN() comment
is separated from the macro by the EFX_FRAME_PAD define. kernel-doc
reports:

  Excess struct member 'state' description in 'efx_channel'
  Excess struct member 'state_lock' description in 'efx_channel'
  Excess struct member 'indir_table' description in 'efx_rss_context'
  Excess struct member 'irq_rx_mod_step_us' description in 'efx_nic'
  Excess struct member 'tx_queue' description in 'efx_nic'
  Excess struct member 'rx_queue' description in 'efx_nic'
  Excess struct member 'extra_channel_types' description in 'efx_nic'
  expecting prototype for EFX_MAX_FRAME_LEN(). Prototype was for
  EFX_FRAME_PAD() instead

along with "not described" warnings for the renamed members.

Fix the member names to match the structs, drop the entries for members
that no longer exist, and move the EFX_FRAME_PAD define above the
EFX_MAX_FRAME_LEN() comment, documenting its @mtu parameter.

kernel-doc -Wall also reports three members that are not described
because nothing in the driver uses them any more, so remove them rather
than document them:

  - efx_channel::busy_poll_state, left behind when commit e7fe9491261e
    ("sfc: get rid of custom busy polling code") removed its users.
    @state and @state_lock above were its old kernel-doc entries.
  - efx_tx_queue::flush_outstanding, only used by the Falcon/Siena
    flush code, which commit 36ff6393292d ("sfc: Move Siena specific
    files") moved into siena/ with its own copy of the struct.
  - efx_rx_queue::min_overfill, whose kernel-doc entry and only
    assignment were removed by commit ecc910f520ba ("sfc: Make the dmaq
    size a run-time setting (rather than compile-time)").

The warnings were found with scripts/kernel-doc -Wall. I don't have sfc
hardware; this is compile-tested only.

No functional change.

Assisted-by: LLM
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Changes in v2:
- Remove busy_poll_state, flush_outstanding and min_overfill, which are
  unused, instead of leaving them undocumented (Simon)
- Use the Assisted-by format from coding-assistants.rst

net_driver.h has further members with no kernel-doc description,
mostly in struct efx_nic and struct efx_nic_type. Those are in use, so
I'll document them in a separate patch.

W=1 build of drivers/net/ethernet/sfc/ shows no new warnings.

v1: https://lore.kernel.org/all/20261003055443.144554-1-kapoorarnav43@gmail.com/

 drivers/net/ethernet/sfc/net_driver.h | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/sfc/net_driver.h b/drivers/net/ethernet/sfc/net_driver.h
index 3964b2c56609..71144bb4c6c8 100644
--- a/drivers/net/ethernet/sfc/net_driver.h
+++ b/drivers/net/ethernet/sfc/net_driver.h
@@ -314,7 +314,6 @@ struct efx_tx_queue {
 	/* Members shared between paths and sometimes updated */
 	unsigned int empty_read_count ____cacheline_aligned_in_smp;
 #define EFX_EMPTY_COUNT_VALID 0x80000000
-	atomic_t flush_outstanding;
 };
 
 #define EFX_TX_CB_ORDER	7
@@ -431,7 +430,6 @@ struct efx_rx_queue {
 	unsigned int max_fill;
 	unsigned int fast_fill_trigger;
 	unsigned int min_fill;
-	unsigned int min_overfill;
 	unsigned int recycle_count;
 	struct timer_list slow_fill;
 	unsigned int slow_fill_count;
@@ -467,8 +465,6 @@ enum efx_sync_events_state {
  * @irq_moderation_us: IRQ moderation value (in microseconds)
  * @napi_dev: Net device used with NAPI
  * @napi_str: NAPI control structure
- * @state: state for NAPI vs busy polling
- * @state_lock: lock protecting @state
  * @eventq: Event queue buffer
  * @eventq_mask: Event queue pointer mask
  * @eventq_read_ptr: Event queue read pointer
@@ -526,9 +522,6 @@ struct efx_channel {
 	unsigned int irq_moderation_us;
 	struct net_device *napi_dev;
 	struct napi_struct napi_str;
-#ifdef CONFIG_NET_RX_BUSY_POLL
-	unsigned long busy_poll_state;
-#endif
 	struct efx_buffer eventq;
 	unsigned int eventq_mask;
 	unsigned int eventq_read_ptr;
@@ -788,7 +781,7 @@ struct efx_rss_context_priv {
  * struct efx_rss_context - an RSS context
  * @priv: hardware-specific state
  * @rx_hash_key: Toeplitz hash key for this RSS context
- * @indir_table: Indirection table for this RSS context
+ * @rx_indir_table: Indirection table for this RSS context
  */
 struct efx_rss_context {
 	struct efx_rss_context_priv priv;
@@ -881,16 +874,14 @@ struct efx_mae;
  * @timer_max_ns: Interrupt timer maximum value, in nanoseconds
  * @irq_rx_adaptive: Adaptive IRQ moderation enabled for RX event queues
  * @irqs_hooked: Channel interrupts are hooked
- * @irq_rx_mod_step_us: Step size for IRQ moderation for RX event queues
+ * @irq_mod_step_us: Step size for IRQ moderation for RX event queues
  * @irq_rx_moderation_us: IRQ moderation time for RX event queues
  * @msg_enable: Log message enable flags
  * @state: Device state number (%STATE_*). Serialised by the rtnl_lock.
  * @reset_pending: Bitmask for pending resets
- * @tx_queue: TX DMA queues
- * @rx_queue: RX DMA queues
  * @channel: Channels
  * @msi_context: Context for each MSI
- * @extra_channel_types: Types of extra (non-traffic) channels that
+ * @extra_channel_type: Types of extra (non-traffic) channels that
  *	should be allocated for this NIC
  * @mae: Details of the Match Action Engine
  * @xdp_tx_queue_count: Number of entries in %xdp_tx_queues.
@@ -1711,8 +1702,11 @@ efx_rx_buf_next(struct efx_rx_queue *rx_queue, struct efx_rx_buffer *rx_buf)
 		return rx_buf + 1;
 }
 
+#define EFX_FRAME_PAD	16
+
 /**
  * EFX_MAX_FRAME_LEN - calculate maximum frame length
+ * @mtu: MTU to calculate the maximum frame length for
  *
  * This calculates the maximum frame length that will be used for a
  * given MTU.  The frame length will be equal to the MTU plus a
@@ -1726,9 +1720,8 @@ efx_rx_buf_next(struct efx_rx_queue *rx_queue, struct efx_rx_buffer *rx_buf)
  * Re-clocking by the XGXS on RX can reduce an IPG to 32 bits (half an
  * XGMII cycle).  If the frame length reaches the maximum value in the
  * same cycle, the XMAC can miss the IPG altogether.  We work around
- * this by adding a further 16 bytes.
+ * this by adding a further 16 bytes (EFX_FRAME_PAD).
  */
-#define EFX_FRAME_PAD	16
 #define EFX_MAX_FRAME_LEN(mtu) \
 	(ALIGN(((mtu) + ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN + EFX_FRAME_PAD), 8))
 
-- 
2.53.0

