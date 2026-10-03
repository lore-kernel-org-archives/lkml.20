Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B100D3803D1
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 05:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791006895; cv=none; b=oa2bHVle2l5JLtZ42WSrsuKCaGgp/vKpFyIMxgM6/+N0If9u7uFagR4vtuz+w4JG+vpijIEpv4Q0/f1oJLdRdKlaLVvlj3IfqS5Q0WV7BCkS8ehjg4KFadPTV4AWYGKOi6CZC4UYd3jkWlhLo7JE2q+yMB0W9e+Wc4D+C3WIPhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791006895; c=relaxed/simple;
	bh=qFNhszLLB9dTEiOuPH/sQrt5mMgL7iCMVMjdV3MUWtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D3QCpBM1KyIdp1JeGfGfm3v8mX2bgvmbIjMgPz/9JG+TNG7nUrPMNh4uumEq8FpcME1xdDg4fYEGgfHRuKkGtDZ5fc4iAj243mWO+FwDny0ImiN4l509zjUF3Dqd/Br7/CA1zLfdRBsXHWRrNrB0lbHSzMHZlQzgvh7Sbl3t4Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhUrRI9x; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhUrRI9x"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so950510eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 22:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791006892; x=1791611692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CP5IvW/8BARvYuxT7WVUifaSWeTsRK+9cyxc/YtlDjw=;
        b=BhUrRI9x4d7WLtiWTs9ZDT0tu52eVnwlfDZ8om4i2aTDbfaHq94jDhDfdwL76GQph4
         BiIOL7n98Jc/5Jk6m8ZWbuqRZLItWB06S6ApFjvXy1Bum6QsKGvk8V/RPB2hJHpUGMYO
         8yb3sEW4o4gTQDM1UsSEIxWuMaaSxZKQJjuL7mWgUCtYnqX/U31nxuBHsUwii6FD/OCb
         uU9vlsas+Dx8N5rJMU8X9hRjWDdSQHFp1hzAZiIBzFOKLPQo5/gJ3JeWXarHN55TdJHI
         fUhlt9hFltpjKqGPhLESh+MJJHG1+ep5hXWCQsPnOQvBsPF1x+eg3e13kXALGFxkhWLK
         IB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791006892; x=1791611692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CP5IvW/8BARvYuxT7WVUifaSWeTsRK+9cyxc/YtlDjw=;
        b=JSL4bxE2tZX+GUmf2czXt92d5yri+pG+NlvjHJSZgHD83CWyS21aLwWD+c0vB9x+yp
         vIa0Sodt07PZ6ETXfHXxQ7PcLJkiHMWjymUSvs/fQJGgAG2NjrBWDv+fgQnTC77ZMLb3
         ma2qkW8ptbAkabEZBWlTqqRno70Ibuwo2OaYRSLjpivHwysMWtbc7DZcEf3/28RVPCD/
         LMtNakhTeZO3NsdnDUdW5DL5woY4PbrbN7gfwUE2eUaRf3VbyY+8TDcdAAmMi8CHwBi8
         gAuQbG7jx/+LxSavHaR1m9e5f78s/42SJbbyvg0hFBRTFnlTQh6fkSkGsSObZofxXkjK
         Kc6g==
X-Forwarded-Encrypted: i=1; AKwUvBz7dT7fT1wXBoKrWhPvij0DDxRH8i2b1ep1856PV7RsXiPcq5CGTS9nwhnYXxNvWkWIdo7JwCoe8WBY8xs=@vger.kernel.org
X-Gm-Message-State: AFq9FYISXoFY2kO5UO0rDE+Y0qUa3HSE0jAQ74kit7Lq92J5Il29NWmN
	r0eSX2nSNl1yf8tVIJotuKYetucgxJF8Cb9DBPz+tl6Wd5vzTcUf0tfS
X-Gm-Gg: AYBFou0JGuT0mu80XdxLhYFbExQraEzpBRLDGOkG2wnNHS4XanDCLC9qQvapYBnJO7G
	qv3XCpnQFsMdG5yHwaAG95Li3I64p5ztsJiyeuDEDDfvAvKhJfLbgbE42jYGcDw7mATqkJPje7M
	dnuownqFG4I7szzqW7Eu4yDgFq7s3+t7QNTNPcNb/urCzTRqBtmKQqbxfDe7BtDCX6nPyk/qkHg
	MQTIy5z+z8UhelJS/DUgAg9iaGndo5sQ9oG/iYbwMcrwcD6H3Fwe88h9eyTlmYWeEDT7TaYdUY6
	MlGDHvGmeKFG3mO6alHiDf78lzl1UpXpSoXzAL/ekjRawuwHOJsiGChPe9EJcWScMjKxIfVpUsy
	pL71cWSx5yaompTZXaB2+DKdIf0qXTYjJVtp/74ou5NJpUKcEuibsTBXx3UZGn4Cql4t7uYCd5Q
	S+Pmk+3DHUioZSVrwrNAhh4m08ofCAmDN8+6Q65mR4iM3dWfReBcx5dXpL+yvDUoRvkooRhmH1W
	2dbgyaKbmV05KEL3m5umBXnlRR7jpQ+0UrKwgKNBHmgP9PM/sb8zkAMdUxTtXcmnJITXlUbPFQ+
	KSoSwFw7gK54Sz0Q
X-Received: by 2002:a05:693c:20c1:20b0:351:1b39:9e49 with SMTP id 5a478bee46e88-3511b399f8cmr44999eec.8.1791006892449;
        Fri, 02 Oct 2026 22:54:52 -0700 (PDT)
Received: from kapoor ([117.235.138.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351123070cbsm4031471eec.31.2026.10.02.22.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 22:54:51 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Edward Cree <ecree.xilinx@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-net-drivers@amd.com,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH net-next] sfc: fix stale kernel-doc member names in net_driver.h
Date: Sat,  3 Oct 2026 11:24:41 +0530
Message-ID: <20261003055443.144554-1-kapoorarnav43@gmail.com>
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

No functional change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Comment-only change (plus moving a #define above the comment), checked
with scripts/kernel-doc; W=1 build of drivers/net/ethernet/sfc/ shows no
new warnings.

 drivers/net/ethernet/sfc/net_driver.h | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/sfc/net_driver.h b/drivers/net/ethernet/sfc/net_driver.h
index 3964b2c56609..76b48f96ec62 100644
--- a/drivers/net/ethernet/sfc/net_driver.h
+++ b/drivers/net/ethernet/sfc/net_driver.h
@@ -467,8 +467,6 @@ enum efx_sync_events_state {
  * @irq_moderation_us: IRQ moderation value (in microseconds)
  * @napi_dev: Net device used with NAPI
  * @napi_str: NAPI control structure
- * @state: state for NAPI vs busy polling
- * @state_lock: lock protecting @state
  * @eventq: Event queue buffer
  * @eventq_mask: Event queue pointer mask
  * @eventq_read_ptr: Event queue read pointer
@@ -788,7 +786,7 @@ struct efx_rss_context_priv {
  * struct efx_rss_context - an RSS context
  * @priv: hardware-specific state
  * @rx_hash_key: Toeplitz hash key for this RSS context
- * @indir_table: Indirection table for this RSS context
+ * @rx_indir_table: Indirection table for this RSS context
  */
 struct efx_rss_context {
 	struct efx_rss_context_priv priv;
@@ -881,16 +879,14 @@ struct efx_mae;
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
@@ -1711,8 +1707,11 @@ efx_rx_buf_next(struct efx_rx_queue *rx_queue, struct efx_rx_buffer *rx_buf)
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
@@ -1726,9 +1725,8 @@ efx_rx_buf_next(struct efx_rx_queue *rx_queue, struct efx_rx_buffer *rx_buf)
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

