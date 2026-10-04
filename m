Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50B044A408
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 15:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791127750; cv=none; b=bCeUpnjPdnTYWtO7Bb2Qs9hRmsIU2lGB9ugVfXdSuxj4edfehJTzcE2iuHH4a8jwsB3jN4XWsq7boy56iEvBSLqRLtPqSj6m3fNdLdlqpLI+4oYs9yJFnKIwQMEtlwwZ6911CveFjVheYBWtUCO/qOy4UaZ3vrwxWZgQunkSZ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791127750; c=relaxed/simple;
	bh=8uJjw3Z2XoTgeVUknKr8jXBNygiBE0TzH48ibqct/uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OnxGngOS6S5wJrBP/S9yC0HYooyejw4ttdenlCaKlgvNX8A7kT+LrJuXmCH58GdvhDUFrHlF+3pKFTakqfW1grS/7ZuWM+DyFlpI/JYhqUzQvu6zUQtRcvBWPeyTHWhrkenimD8ODzyKOL/xM4TJF7Kp2pEOOO6eEf29P56LTEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qR3NuaIt; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qR3NuaIt"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48bbb06e746so385211f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 08:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791127746; x=1791732546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjuVkIYnaqcKfLZ8gNPpy7PzsEJhC75OnnV9vKlbU3I=;
        b=qR3NuaIt1+lu1m7M84k4mWci8f3O9vVd0PchUuN+Jpmcyi2/F90UKt0leBIG3HKR3Z
         86PaFzX8JNzEhaPn8utmhET8mlh6LFPGKWJCCUUDq13OMObSXMWOwgheYFKhwioqUJPv
         vZ2Wa0HHc2UsyCFzeFTgYHBEyxMkUiRKISl+KBihi/DkBeui7td3nhgb8i2OqHCy6Ily
         ncwn5Vxb2s1cuF3gd8md0SLlyGs5TIDR+WI9IcwpxO7B4bXerCsq0x4i8plHUlAhKxTo
         WyWC+9su4IZyc69BtT2Vm7hbYs/XWLiTs70xdCVRRWo0BDhQvE0KhA+RRzpsP4U1t7eQ
         l7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791127746; x=1791732546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CjuVkIYnaqcKfLZ8gNPpy7PzsEJhC75OnnV9vKlbU3I=;
        b=PQY0xu7J2hzRFN0HtqlqlItzD2kNTbHAFbgmIFTuyIMfd63ktf/Oghc0ISTqHWZTGN
         qpXwb3GMI0DNqh00Jd4178q9UZ+eG5CmK7C1bIXAkIqIBf9RB2gKHXabh8G//nq+gUvK
         mpn7gikP+B5EKl3NCMj9POEgwDm4fZn6ug7K++zXKzepM6sLeMKgOHklGMZ8M6pxbKSp
         bWalCGGsRDm3HzPUxf/wxAfsIGH4TaO46KGdGgXh2zuu/W1jmYOluphoiaTLnku7uZdL
         BJ72c8AwNsZCfINRwWaBHrJ6MMw4iUk1lBClLxMoWtNA2gLt6Qh45vrSbApqMsvY+0Xx
         WBJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxR7XtPnHur9EYwYZVrIvePPSRAlpyYfJMLaHwJXwP0uezPV1PDw77ymAt2W+5J/LsXX9sa65jm5P36wqA=@vger.kernel.org
X-Gm-Message-State: AFuF++mDn0DqQo5IFGJDZugrl82ZKyEzVCd01GUswehyQ4q3txnM47hV
	LFC7wNEV5lZqEz9a5MYaDwIeVdwFeUUsWtwIMbZaU3QWYHpKZeNRgq8d
X-Gm-Gg: AYBFou2mhhp9isAWSemv7NOBVLibvcERUvoFRGaBf4KW10IBxeEcV3xpbJnABIUuJsA
	8hAgpNaUNqiti8ZpfMK3oJ25wYHtikNXql668wjFRViG7Tg7vt2Cwxau9P2+rGmgzuCiWAVJlND
	MrEOnvBaSmkm7bPB199pylXS/isABkAAdx75jeLyVDwhIWewGFzRfn2aRSpo1Cs2ScUTFSamn4d
	CqlPucBgrcJoAJcxkYTs0gbMOg5GsgEXG+Gmk16N6gOLkn4GC5UgE9K2Y+oNnlYA5lEuMgk5ba0
	KXlM/nb5MtT+42OZ453wxPN9E+a0Hg3JLpKK1HDtZX+YmL/DVuFSZvzkBeKR94Abni7B5Ucfh02
	kf1MrN7XYjNBsOqg5JzR3L1G7asvBRRV1ONwmrfIPkyxTRHA0OhKgphHz/PEmBFl85nqc29V97Q
	366P+By3dJAHkpeWrjXakT+wRcazgOpQFmPYHhdXzRrKWfz+ygnVLANl0kntjPpIvbDoUNJC84O
	2VYMJRlMtOz81mlTuoQhY5NEdPzKzpJNoOsoAefmnxg9auCDqR+EDXIobGI0Qq8tB3nBWFN/zb3
	gGnPaJ98cA==
X-Received: by 2002:a05:600d:82e6:b0:4a1:6c48:c789 with SMTP id 5b1f17b1804b1-4a16c48c849mr62190295e9.2.1791127745884;
        Sun, 04 Oct 2026 08:29:05 -0700 (PDT)
Received: from citron.bnl.ovh ([2001:861:44c1:870::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1698f7910sm83819735e9.3.2026.10.04.08.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:29:05 -0700 (PDT)
From: Benoit DE RANCOURT <b2rancourt@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Sasha Neftin <sasha.neftin@intel.com>,
	linux-kernel@vger.kernel.org,
	Benoit DE RANCOURT <b2rancourt@gmail.com>
Subject: [PATCH iwl-net 2/2] igc: Flush pending Tx descriptors before returning NETDEV_TX_BUSY
Date: Sun,  4 Oct 2026 17:28:40 +0200
Message-ID: <20261004152840.61222-3-b2rancourt@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261004152840.61222-1-b2rancourt@gmail.com>
References: <20261004152840.61222-1-b2rancourt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the stack sends a burst with xmit_more set, igc_tx_map() defers
the tail register write until the last skb of the burst or until the
queue is stopped. If igc_xmit_frame_ring() then refuses an skb with
NETDEV_TX_BUSY, it returns without flushing any pending tail write.
Descriptors of packets already accepted in the burst can therefore
remain unexposed to the hardware.

The queue is stopped at that point and igc_clean_tx_irq() only wakes
it once TX_WAKE_THRESHOLD descriptors are free. The hardware can only
complete what the tail exposes, so if the unsignalled descriptors keep
the free count below the threshold, the queue is never woken and the
Tx watchdog resets the adapter.

On an I226-V running 7.2.8, in all 25 Tx timeout episodes of the test
described in the previous patch, the stalled queue had pending
descriptors after a NETDEV_TX_BUSY return: the probes inferred at
least 214 of the 256 ring descriptors beyond the last tail write. For
that queue, the register dump showed TDH = TDT = the next_to_clean
value recorded by the probe: the hardware had completed everything it
had been given. For example, with queue 2 stopped, next_to_clean = 190
and next_to_use = 167:

  igc 0000:08:00.0 terra: NETDEV WATCHDOG: CPU: 1: transmit queue 2 timed out 5353 ms
  igc 0000:08:00.0 terra: TDH[0-3]        00000099 00000091 000000be 000000f5
  igc 0000:08:00.0 terra: TDT[0-3]        00000099 00000091 000000be 000000f5

Write the tail before returning NETDEV_TX_BUSY. The refused skb is
left untouched; only descriptors of already accepted packets are
exposed to the hardware. Those packets have already been accounted to
BQL, so flushing their descriptors lets completion processing
progress; the refused skb is neither mapped nor accounted here.

The previous patch makes this path rare again for common skbs, but it
remains reachable, for instance when the linear part or a fragment of
an skb exceeds IGC_MAX_DATA_PER_TXD.

With this change alone (without the previous patch), three runs of the
same test on 7.2.8 still produced 10751 NETDEV_TX_BUSY returns, but no
Tx timeout, against 25 on the unpatched kernel.

Fixes: 0507ef8a0372 ("igc: Add transmit and receive fastpath and interrupt handlers")
Cc: stable@vger.kernel.org
Assisted-by: LLM bpftrace
Signed-off-by: Benoit DE RANCOURT <b2rancourt@gmail.com>
---
 drivers/net/ethernet/intel/igc/igc_main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index b94a08791102..16f2ca32f5f1 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -1621,7 +1621,11 @@ static netdev_tx_t igc_xmit_frame_ring(struct sk_buff *skb,
 						&skb_shinfo(skb)->frags[f]));
 
 	if (igc_maybe_stop_tx(tx_ring, count + 5)) {
-		/* this is a hard error */
+		/* This is a hard error. Write the tail for packets deferred
+		 * by xmit_more before returning busy, otherwise the stopped
+		 * queue may never get enough completions to be woken.
+		 */
+		igc_flush_tx_descriptors(tx_ring);
 		return NETDEV_TX_BUSY;
 	}
 
-- 
2.55.0

