Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248444;
	b=TOSVTQZzdN3YkON7jchktB2G2FVsJJIoYxbWToaWk104o+0QNGqws1I6wneNj49HmmfX
	 zuReH67qBTh6NgKy0i3bzDKMrQLXpiIwv9uEUru9WGku1Diul2x4BabsLYeJG+8uV4gLs
	 A7JyNG9PCDPU9VONAX3wWk2BLyMcIIABHKjStfmEaXwZRysB5HPMXUaLyQyf6AUhOh+iT
	 mOXIPk5Pi8nXyXaVf7YKDe1o7s+YD8R/LyCQcfnF2DJPD3njnF1yEC7Eeh3yrmwQfWNBR
	 T377u4r3kCFnyLccVJ1qW+UxpHtsc/56QUYA4J7/uQEaxlyESAupMNTu8W19TllkBJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=rCaHTCa5vn6z6N2cGAVausZT+4RyYy4OLcNeXx5Cvmg=;
	b=KGIVdz5bBZpcYWpbYe+0j2P+OUM3gVKcRs5e/UF/wsh8WzQK5JAv4TSMDPX/ZVaUjcHS
	 kWXbwoc0meXQZEOmPW4e4EdS/kbrsqaBXcifg8+b5pzra0W3HnEl5TO2qBtjkCvxqnAyI
	 CLE/eKA97qwU0pC76H9UVsPmmxPCTuGX8BkFXtePZ55iiaNMdAdHC7IoFdWUUZfqvQpHb
	 QOlLfCq7yUbw9ddz7HxPlsVeTUctivkyaEQs+F0yl0whe4CpbuaT2SNafHWZoF6KIlmV7
	 F/xpa3sDX9rlIKqL649KmagEVDaMsTl0GsELjEnpj8/+Nr7oHX3NbpHyyHXpOaqpXqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z1PlDQLH;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24F860A2612
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C24F860A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z1PlDQLH
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb869327e7so1046769a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794248443; x=1794853243; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCaHTCa5vn6z6N2cGAVausZT+4RyYy4OLcNeXx5Cvmg=;
        b=Z1PlDQLH0Cs0QZ+Tpf7mvGa1GjvrRTmkxOT6OVPUnIbWi/zDkeYgbcUuvVvdoJzzNG
         1V6YiYDgZW4ztlutjinBpC1nawBJaEZNg7Ow+61usPzRouOdhz5trCX/w5oEu3fFLnNr
         mXwv9twdRk95N2GexX1/9ZPkdL2z41F8PDgVI6bVOxUSeq850MrUba4Z2AN2UF/S8XAq
         ohYTYGtYdE1Szsm9qtu1Xy0h2zsXHG4scVM2rrOw4/Zh1VxtTB3xHNaz4Ysj/L0BSgNu
         au8JxyGX/wA1O7ZCK0tluxoojrT+urGAoy26PHJ5se6nZfbRBhRc9xXwiqxVCf8Cqxya
         LZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248443; x=1794853243;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rCaHTCa5vn6z6N2cGAVausZT+4RyYy4OLcNeXx5Cvmg=;
        b=miulK8hVyPl0bWFYkb/VdLnYPDxB4onSiUZZcHcMMRXZKnUIlX2OTdAZngftph+15n
         XFPuWyIrAK4Za/v7q4dH9lKWKHlRVp7A7feUvrV1ADQyUkf8PCvYL9dB5aFTFi03VZfJ
         95jvW9kS2uKrQKfGZr+wlHmmMp6JSMPWOC8UiYpzxgOGAs3Zf7JoDqDgGeyW3ukg7nS+
         e/NnlNppjsPiIf2OmAHKW6IFVreFLza7HXvqKypqO8IZlDKc5cOYLJS84xfmHxi0l1i0
         t5FEmWdZEgyBcXqGDQ1AlT4wucC2uz6wUSaQ0tPGtP+bdxaGLYUmwX4QO/hrikikjbZ/
         bGpQ==
X-Forwarded-Encrypted: i=1; AL+hErEFV4xqwOZBXH5vJJbca0vYie1/ornXCpPx+ENbFvr/tI6CQ/qYR0U3nUPudUtois5JmplC3puecK6XXHc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2bSlXmxEvTfxV1jsWvcgb8Y4GztkAsKHeB1gvNwz7TYtcMbuS
	nodHojktOl10YaxmqzKW9UuPOoRoYMfn2NSR7om9Yf8pkoHhZRgzeRunaFj84YKFIonSFx9bn9f
	/IIemtICB1uACkL7r2PwuokQezg==
X-Received: from pgia24.prod.google.com ([2002:a63:e418:0:b0:cc7:d071:a17f])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7e8d:b0:3eb:a4c3:7387 with SMTP id adf61e73a8af0-3eed4dca16fmr4547759637.47.1794248442975;
 Mon, 09 Nov 2026 10:20:42 -0800 (PST)
Date: Mon,  9 Nov 2026 18:20:35 +0000
In-Reply-To: <20261109182036.2910559-1-hramamurthy@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109182036.2910559-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261109182036.2910559-4-hramamurthy@google.com>
Subject: [PATCH net v5 3/4] gve: Block invalid ring sizes when device options
 are 0
From: Harshitha Ramamurthy <hramamurthy@google.com>
To: netdev@vger.kernel.org
Cc: joshwash@google.com, hramamurthy@google.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	jordanrhee@google.com, willemb@google.com, przemyslaw.kitszel@intel.com, 
	nktgrg@google.com, maolson@google.com, jacob.e.keller@intel.com, 
	pkaligineedi@google.com, yangchun@google.com, patricion@google.com, 
	awogbemila@google.com, csully@google.com, jonolson@google.com, 
	lrizzo@google.com, stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pin-yen Lin <treapking@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pin-yen Lin <treapking@google.com>

On older device versions, minimum ring sizes in the device option are
reported as 0. The driver imports these 0 values, allowing userspace
(`ethtool -G`) to request invalidly small ring sizes.

This issue was discovered and actually triggered by the
drivers/net/ring_reconfig.py selftest (ringparam test case). Halving the
ring size down to 1 triggered a kernel NULL pointer dereference in
gve_tx_alloc_rings_dqo():

  BUG: kernel NULL pointer dereference, address: 0000000000000002
  RIP: 0010:gve_tx_alloc_rings_dqo+0x1c4/0x510 [gve]
  Call Trace:
   <TASK>
   gve_queues_mem_alloc+0x29/0xa0 [gve]
   gve_adjust_config+0x1b/0x140 [gve]
   gve_set_ringparam+0x1f4/0x250 [gve]
   ethnl_set_rings+0x260/0x440
   ...

Fix this by falling back to the driver's default minimum ring sizes
(GVE_DEFAULT_MIN_RX_RING_SIZE and GVE_DEFAULT_MIN_TX_RING_SIZE) whenever
the device option reports minimum ring sizes as 0.
The device reports either both minimum ring sizes or neither, so a
single fallback for both is sufficient.

This change was tested using the DQO RDA queue format.

Cc: stable@vger.kernel.org
Fixes: ed4fb326947d ("gve: add support to read ring size ranges from the device")
Signed-off-by: Pin-yen Lin <treapking@google.com>
Reviewed-by: Joshua Washington <joshwash@google.com>
Reviewed-by: Jordan Rhee <jordanrhee@google.com>
Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
---

Changes in v5:
- Explain the single fallback for both minimums in the commit message

Changes in v4:
- No changes

Changes in v3:
- Retitled and refined the commit message

 drivers/net/ethernet/google/gve/gve_adminq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/google/gve/gve_adminq.c b/drivers/net/ethernet/google/gve/gve_adminq.c
index 8b215fca9c1b..2c848f0c23dc 100644
--- a/drivers/net/ethernet/google/gve/gve_adminq.c
+++ b/drivers/net/ethernet/google/gve/gve_adminq.c
@@ -191,7 +191,9 @@ void gve_parse_device_option(struct gve_priv *priv,
 		*dev_op_modify_ring = (void *)(option + 1);
 
 		/* device has not provided min ring size */
-		if (option_length == GVE_DEVICE_OPTION_NO_MIN_RING_SIZE)
+		if (option_length == GVE_DEVICE_OPTION_NO_MIN_RING_SIZE ||
+		    be16_to_cpu((*dev_op_modify_ring)->min_rx_ring_size) == 0 ||
+		    be16_to_cpu((*dev_op_modify_ring)->min_tx_ring_size) == 0)
 			priv->device_info.default_min_ring_size = true;
 		break;
 	case GVE_DEV_OPT_ID_FLOW_STEERING:
-- 
2.56.0.455.g6c5a503b38-goog

