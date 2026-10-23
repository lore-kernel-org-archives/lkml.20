Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792788432;
	b=3ShAp0Yi2+mj3ZXERvS09eso21mZmgPUbaHtm9FjxarFGXYVfTB3GK9jWrs8la6V62io
	 yLzfy5vCTCeIemSmioPc9hj/5f4FYzssYXZifA9aMHtE9UlDJ4IwEzA9Q0mzRxcU7vC71
	 F18HADtHLGZ906QZD52YlnJli1IjeWFQtUZd19iBM5aItuN0XVu1tq33tql1LZc/6HOhv
	 00y6a8vaTCC4sZz40AYTCJLXtzpdwKPMRj/mN3gP2bm6Ztvn4WxHEwzuPV2edblejSJQD
	 OWmIIdoePcvbUBhavfLkBItaY1IRjcOyXyDMssq53inaHKfK+5yW92CXCWb/hkRR5Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=mD3l16ACuVEn6QpphRJ+hfd7U3+vee3g8XcGaYAQ40E=;
	b=nxA3910DJ3SSwngDPrH6JF44Qj2fT0iXgT+ktTB/0dtSMRajbSJ51SZNkb+ckU1bXu3x
	 RVsCsmC41T5PxV17SdvzqKY2IkNHpmrC+P3/4y9PXT4ET+aGYFR48EXwl7sAowhqgniTx
	 xZRllFza7GNXXHWnM/aQ2k+HJOgJcPm/Ne0AgpJE52RUjVkhBz3y1+wz04VJKKmG9vZYe
	 hqAPIZ4OCxV2UHFZ5YJKGvsTwp0OyJMViOQYd3HsFMPlj0uOg4IS0cfVjNbEJcSq/a8pQ
	 DAtc1JmvMRDseLmUxobpJKJb8mBYn8SHczfGwl8LqZOFobLtJ9OPqUQ8s9OAX1Lq/ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=oX3K9bdn;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49A360A2605
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B49A360A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=oX3K9bdn
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a06750c74fso969737b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792788431; x=1793393231; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mD3l16ACuVEn6QpphRJ+hfd7U3+vee3g8XcGaYAQ40E=;
        b=oX3K9bdne9gYuUNa8bY/8vaocj9DltxCaWQlMvlM5nAZxBs5DYwdKZRfLTWc3x+V5+
         P7D9coGVtdW8Nn/+TF+iS1aD8uXwFdM9MfM5v/a6s5OK/EQlnYk57LSkec3n2NRAP0IY
         EFcD0UQwSK1x3RrzydfSOsEt67lZ53EA05V23skWDU2AvH+yaoB6n2RTDMSDZWSsHvTS
         SHwUWYVv1tQEwI2XrcNbzIbefGyINg36zahDBgoWV24h287sDEuF9xPOK/YANEC/LCdZ
         NN3FYzE/J0bwvLUnyZVvZ/NZ/mM30Gko/MKMBDOis+rZj1aRasrg+fyE80eLKmX5CaOF
         NbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792788431; x=1793393231;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mD3l16ACuVEn6QpphRJ+hfd7U3+vee3g8XcGaYAQ40E=;
        b=mp/J2Iqrp0/kiD1M2PZpGQUnoYHNIvtqPPFot6XwLTENGk5v7U5/dzqylKkcAuwylO
         55jIDIRuGVwhvTtXTVxcpWxCCBPfdSCKjE85v6O0Xmeoq/wkxUDeW4tsvoxVUirZhCfn
         kArPVMuLglWhQen88f5ygTjcwGtRt56pzrdtwAoY4mxB3xiDqmPLsghJ1Hya1KTr/RGW
         hC8TNixscDuPNTLJrPSgzggYGfIMlfFPdwtId3wgxKLwhG/YjkGY0S7BL1QXB2KpN7Q9
         f+5f14Qkca1P35d0ChARV0zhV/ZI/oBeE1fgotbBv3C0VJ7VBR+NuwixtYXC6kwSh19e
         hDFg==
X-Forwarded-Encrypted: i=1; AKwUvBy3hNDpdc6PkH0S3xrKks4gsP5gcC1svDJtrjx7O4D5ucE2H1Do6gIcIjGJPIm4S7rWGpPQUknk/3aAm8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTJuQeC9mCply2cV1sfeyqlGgoHyI1k0FTqBuW+ylBbU+Unn0s
	dgrREAVnCprI16EVzlW+3fWeQf4o0NAHAq9kRPhsCSSxjNoSYhHsMLvOp2tbmS7IW2g/0dh4eEX
	NY2eidZCJeDB3LmPSdd8c6nzWTQ==
X-Received: from pgbbw33.prod.google.com ([2002:a05:6a02:4a1:b0:cc7:e738:5b0d])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3cd2:b0:87d:cc3d:fad4 with SMTP id d2e1a72fcca58-8a369b16799mr283179b3a.54.1792788430824;
 Fri, 23 Oct 2026 13:47:10 -0700 (PDT)
Date: Fri, 23 Oct 2026 20:47:05 +0000
In-Reply-To: <20261023204706.3112215-1-hramamurthy@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023204706.3112215-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023204706.3112215-4-hramamurthy@google.com>
Subject: [PATCH net v3 3/4] gve: Block invalid ring sizes when device options
 are 0
From: Harshitha Ramamurthy <hramamurthy@google.com>
To: netdev@vger.kernel.org
Cc: joshwash@google.com, hramamurthy@google.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	jordanrhee@google.com, willemb@google.com, przemyslaw.kitszel@intel.com, 
	nktgrg@google.com, maolson@google.com, jacob.e.keller@intel.com, 
	pkaligineedi@google.com, yangchun@google.com, patricion@google.com, 
	awogbemila@google.com, stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
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

This change was tested using the DQO RDA queue format.

Cc: stable@vger.kernel.org
Fixes: ed4fb326947d ("gve: add support to read ring size ranges from the device")
Signed-off-by: Pin-yen Lin <treapking@google.com>
Reviewed-by: Joshua Washington <joshwash@google.com>
Reviewed-by: Jordan Rhee <jordanrhee@google.com>
Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
---

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
2.56.0.257.gf7497c7d27-goog

