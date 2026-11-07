Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794023619;
	b=oIgkcgevPN35wle3ohkKq5+XdsYoLii5eYItgIp5VVogXV3IKapIYl9pH3I3xQ+vmkp/
	 Y5axYDoDBT7uRgRblTxv2QEy7Uqx6pel3obn4X/ONtvcqSL21nXM4nFn4AUU2/Qlo8UJ9
	 Oy9ka5bb8Hee3a0BFYzkeEIZtuOfOuRL5OMc7qEAh/0h7b0DgK2q12urRhyspLLJlHuQA
	 Vq1Pi0KEqH7u51cJJkRTtjofD8xHoJtulif3COtxiyoJYwZoET6yDt5XZ2H0CscNw+OVL
	 C3MtrgLDHEpFkyXbBdyl+Sst7t9DVtv+sbhlJ8kV8klKl/Y9nHFj8pmRnSrLI6rG7Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794023619;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qd8AKWmP8Q9nerbOf3f/4gmjakERHNHG8V7WcwJi/tM=;
	b=U0iO3Wlu79IgUrX5ODPbcNCRPnKJgzlNJqbkHQ5/LI5ZDw+PjUkNNRGzvaAlHjrszW3K
	 x3t+VldDZQ5PpraQ5FiBi36DGY9g/FWHASiROzwfyofAny+Ae/B1ziB5rBuRNq3fqDrGF
	 qgk9WE8vFo2cw4G+EturNkk7JN70FdU16oU3wwd+0AwZvmxZdIDj/7XXTDRgRDMTUnmm9
	 rfilCUqMWDncg3J+mKYv/rGgi86c64jjXdt+5IL9SZJ6wAPRMA1Bdo3a29re6Gjg/U5Be
	 ko4yxFQGJkhW/KiRnXVyk2ti+c84P5gMrMmVeT2kp/TaH66DCRg9p56bd9ZGjwjbXUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=go3IBW83;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77655606A32D;
	Sat,  7 Nov 2026 03:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77655606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=go3IBW83
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id B4EA140172;
	Sat,  7 Nov 2026 14:53:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1794023601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qd8AKWmP8Q9nerbOf3f/4gmjakERHNHG8V7WcwJi/tM=;
	b=go3IBW83tlmEOcWJkfPtEGQExc2gbKX49T74eoMmVYk2iyCYH5hZ27HRf2o9Y3/VURgI9h
	l+lgSwtromes4trZ/ujoVUYIxqTRaybxCn/olq2uQ3m8CI5UPQhy+OjSzPArhFzj4eNWeL
	PbZVkZuETjMq+tLngYsDdtB+zyvcU5rEwGSIgUjiVMlRuqRlmwqJU6VzR1SEpOHLAsKzD5
	K+wWyYKZzSZPgV3avCgu75H917/XtLHsQFy4J5dq0o3WEFt47LaEAL9Xz1myYOzCzZsnnn
	y7+esJr6vIYnMWfzTc8B1P/eCQE2PSwh6mikrCIYQIoVjc3JQVOFpdtEfAUYEA==
X-GPT-Reason: legitimate; the email is a technical software patch
	submission for a Linux kernel driver (rtw88) which perfectly matches
	the technical nature of a developer's mailbox; the sender's domain
	(d-silva.org) aligns with the personal/professional identity of
	the sender (Alastair D'Silva); the content contains highly specific
	technical data including hardware validation results, register
	names (REG_SDIO_HISR_RX_REQUEST), and specific kernel versions
	(7.3.0+), which is characteristic of open-source software development
	and not indicative of spam or phishing.
From: Alastair D'Silva <alastair@d-silva.org>
To: linux-wireless@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>,
	Kalle Valo <kvalo@kernel.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH rtw-next v9 0/4] wifi: rtw88: sdio: Fix unhandled RX request interrupt storm
Date: Sat,  7 Nov 2026 14:53:17 +1100
Message-ID: <20261107035321.1210303-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
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

On 3081-based SDIO chips (observed on RTL8821CS; RTL8822BS and RTL8822CS
are inferred to be affected as they share the 3081 architecture), clearing
REG_SDIO_HISR_RX_REQUEST requires both a software W1C acknowledge and an
empty RX FIFO. Masking this bit out before writing back to HISR prevents
the software acknowledge from happening, leaving the bit asserted even
after the FIFO is drained and trapping the CPU core in an infinite
interrupt storm that locks up the system upon receiving network traffic.

This series fixes the interrupt storm on 3081 chips and addresses
related SDIO lifecycle, locking, and error handling issues:

- Patch 1 returns error codes from rtw_sdio_rxfifo_recv() on allocation,
  oversized packet, or read failures so the caller stops immediately
  instead of burning through the loop budget.
- Patch 2 tracks operational state via rtwsdio->running protected by an
  irq_lock mutex (using a mutex as SDIO bus operations sleep), serializes
  start/stop state transitions under sdio_claim_host() and irq_lock,
  cancels the TX worker synchronously on stop, drains rtwsdio->tx_queue[]
  with locked skb_dequeue() and ieee80211_free_txskb() in rtw_sdio_stop()
  and again in rtw_sdio_start(), and resets rtwsdio->tx_queue_stopped[]
  while waking stopped AC queues under tx_queue[].lock in rtw_sdio_start().
- Patch 3 fixes the interrupt storm by splitting
  rtw_sdio_handle_interrupt() into 8051 and 3081 paths. On 3081,
  interrupts are masked via HIMR, acknowledged via W1C writeback,
  serviced, and re-enabled under irq_lock if still running.
- Patch 4 refactors rtw_sdio_rx_isr() into separate 8051 and 3081 variants
  to clarify the differences in register width and HISR handling without
  any logic changes.

Hardware Validation:
Validated by booting the full rtw-next (Linux 7.3.0+) kernel on an
Allwinner H618 board (Mellow Fly-C5) with RTL8821CS SDIO on the sunxi-mmc
host controller (which dispatches SDIO interrupts via the ksdioirqd thread
rather than MMC_CAP2_SDIO_IRQ_NOTHREAD / sdio_irq_work), with policy
routing configured and verified via interface byte counters so all test
traffic traversed wlan0 exclusively:
- RX test (10s iperf3 to board): 44.4 MB sent (37.2 Mbits/sec),
  42.7 MB received (35.8 Mbits/sec), with zero stalls, zero lockups, and
  no interrupt storm.
- TX test (10s iperf3 -R from board): 40.5 MB sent (34.0 Mbits/sec),
  40.1 MB received (33.7 Mbits/sec).
- Bidirectional test (10s iperf3 --bidir simultaneous TX and RX):
  RX 29.9 MB sent (25.1 Mbits/sec) / 29.1 MB received (24.4 Mbits/sec)
  concurrently with TX 10.8 MB sent (9.02 Mbits/sec) / 10.4 MB received
  (8.69 Mbits/sec).
- Interface stop/start cycling (5 consecutive ip link set wlan0 down/up
  cycles under active TX traffic) verified clean with zero warnings,
  traces, or hangs in dmesg.

Differences in v9:
- Patch 2: Replaced lockless ieee80211_purge_tx_queue() with a helper
  rtw_sdio_purge_tx_queues() that drains rtwsdio->tx_queue[] using locked
  skb_dequeue() and ieee80211_free_txskb(), and called it in both
  rtw_sdio_stop() and rtw_sdio_start() so an in-flight rtwdev->tx_work
  calling rtw_sdio_tx_write() cannot race with an unlocked dequeue or
  leave a stale pre-stop frame queued across a stop/start cycle (per Luka
  Gejak).
- Patch 2: Moved the rtwsdio->tx_queue_stopped[] reset and
  ieee80211_wake_queue() loop from rtw_sdio_stop() to rtw_sdio_start()
  under &rtwsdio->tx_queue[queue].lock (after rtw_sdio_purge_tx_queues()),
  matching rtw_pci_start() and avoiding waking mac80211 TXQs on the
  firmware recovery stop path before ieee80211_restart_hw() suspends the
  queues (per Luka Gejak).

Differences in v8:
- Rebased onto latest rtw-next (dc16902cad9c), updating Patch 1 so the
  oversized packet check from commit 83ca360e8528 ("wifi: rtw88: sdio:
  reject oversized RX packets") returns -EINVAL.
- Patch 2: Dropped the queue_delayed_work() re-arm from rtw_sdio_start(),
  and instead purged rtwsdio->tx_queue[] with ieee80211_purge_tx_queue()
  and cleared tx_queue_stopped[] with ieee80211_wake_queue() in
  rtw_sdio_stop() after cancel_delayed_work_sync(), matching
  rtw_pci_stop() and avoiding transmitting stale frames before
  rtw_core_start() or rtw_wow_stop() completes (per Luka Gejak).
- Validated the posted v8 series on a full rtw-next (7.3.0+) kernel booted
  directly on the RTL8821CS test board (per Luka Gejak).

Differences in v7:
- Rebased onto latest rtw-next.
- Cover letter and Patch 3: Included RTL8822BS alongside RTL8822CS as
  inferred from sharing the 3081 architecture, and reworded the opening
  explanation to state that clearing REG_SDIO_HISR_RX_REQUEST requires
  both a software W1C acknowledge and an empty RX FIFO (per Luka Gejak).
- Patch 2: Re-arm the TX worker at the end of rtw_sdio_start() so any
  frames left parked in rtwsdio->tx_queue[] across a stop are drained and
  stopped mac80211 queues are woken (per Luka Gejak).

Differences in v6:
- Cover letter: Clarified that RTL8821CS was observed and tested while
  RTL8822CS is inferred from sharing the 3081 architecture, and noted that
  testing was performed on sunxi-mmc (ksdioirqd) per Luka Gejak. Added
  details below the cut line on how REG_SDIO_HISR_RX_REQUEST level
  sensitivity was verified on hardware.
- Patch 1: Added Reviewed-by from Luka Gejak.
- Patch 2: Dropped the rtw_sdio_deinit() helper and probe error path label
  rename per Luka Gejak, and refined the irq_lock comment in sdio.h.
- Patch 3: Replaced goto out with if (hisr) block to avoid mixing goto
  with cleanup.h helpers in rtw_sdio_handle_interrupt(), and documented
  why the full HISR word is written back on 3081 (matching all non-8723BS
  SDIO chips) and that REG_SDIO_HISR_RX_REQUEST is level-sensitive to RX
  FIFO occupancy (verified on hardware), addressing Luka Gejak's feedback.
- Patch 4: Added Reviewed-by from Luka Gejak.

Differences in v5:
- Patch 1: Added Acked-by from Ping-Ke Shih.
- Patch 2: Updated Fixes: tag to commit 28eaf7971a20 ("wifi: rtw88: sdio:
  add TX back-pressure and retry on page starvation") per discussion
  between Ping-Ke Shih and Luka Gejak.
- Patch 2: Replaced lockless running checks with an irq_lock mutex in
  struct rtw_sdio. Since SDIO I/O sleeps, a mutex is used instead of a
  spinlock. Enforced lock ordering (sdio_claim_host() -> irq_lock) in
  start and stop paths to avoid lock inversion with the MMC IRQ handler.
- Patch 2: Retained running checks in rtw_sdio_tx_handler() and
  rtw_sdio_handle_interrupt() to avoid races during stop.
- Patch 3: Protected the 3081 interrupt re-enable check under irq_lock
  (scoped_guard) per feedback from Ping-Ke Shih.
- Patch 4: Fixed comment formatting style in rtw_sdio_rx_isr_8051() per
  coding style rules.
- Patch 4: Added Acked-by from Ping-Ke Shih.

Differences in v4:
- Split pre-existing lifecycle and error handling issues into separate
  patches (Patches 1 and 2) prior to the storm fix (per Luka Gejak).
- Guard HIMR re-enabling with rtwsdio->running in the 3081 handler.
- Significantly reduced and streamlined commit messages across the series
  (per Ping-Ke Shih).
- Clarified in Patch 4 that it is a refactoring without logic changes,
  highlighting register width and HISR behavior (per Ping-Ke Shih).
- Tagged with rtw-next in subject prefix for NIPA testing.

---
Verifying REG_SDIO_HISR_RX_REQUEST level-sensitivity on RTL8821CS (3081):

To verify Luka's question on whether acknowledging REG_SDIO_HISR before
draining the RX FIFO can strand unread packets if rtw_sdio_rx_isr_3081()
exits early (upon hitting the 64 KB loop budget or an allocation/read
error), we instrumented rtw_sdio_handle_interrupt_3081() and
rtw_sdio_rx_isr_3081() on the RTL8821CS test board with a 4-point register
probe and a forced early-exit stress parameter (test_early_exit=1, which
forces rtw_sdio_rx_isr_3081() to break after reading a single RX DMA batch
so unread packets remain in the hardware FIFO):

1. Normal single-packet drain (FIFO emptied during ISR):
   - Entry: hisr=0x00800031 (BIT_RX_REQUEST=1), rx0_init=334
   - After W1C writeback (before FIFO read): post_ack_hisr=0x00800031,
     rx0_len=334. Even though software wrote 1 to clear BIT_RX_REQUEST,
     the hardware immediately kept BIT_RX_REQUEST asserted (1) because 334
     bytes of unread packet data were still sitting in the RX FIFO.
   - After rtw_sdio_rxfifo_recv() drained the 334 bytes: rx0_rem=0,
     post_drain_hisr=0x00800030 (BIT_RX_REQUEST=0). Only once the FIFO was
     empty AND the W1C acknowledge had occurred did BIT_RX_REQUEST drop to
     0.

2. Forced early exit with unread data remaining in the FIFO:
   - Under an iperf3 UDP flood with test_early_exit=1, the ISR exited
     after one read while unread packets remained in the FIFO (e.g.
     rx0_init=1538 -> post_ack_hisr=0x00800031 -> rx0_rem=3096).
   - Both post_drain_hisr and post_unmask_hisr read 0x00800031
     (BIT_RX_REQUEST=1), and the hardware immediately re-asserted the SDIO
     interrupt line upon unmasking HIMR. Over 1,920 forced early exits in
     a single burst, 100% re-asserted BIT_RX_REQUEST and re-triggered the
     interrupt without a single stalled packet.

Alastair D'Silva (4):
  wifi: rtw88: sdio: Handle allocation and read errors in
    rtw_sdio_rxfifo_recv
  wifi: rtw88: sdio: Track running state and cancel TX worker on stop
  wifi: rtw88: sdio: Fix unhandled RX request interrupt storm
  wifi: rtw88: sdio: Split rtw_sdio_rx_isr into 8051 and 3081 variants

 drivers/net/wireless/realtek/rtw88/sdio.c | 192 +++++++++++++++++-----
 drivers/net/wireless/realtek/rtw88/sdio.h |   3 +
 2 files changed, 154 insertions(+), 41 deletions(-)

-- 
2.53.0
