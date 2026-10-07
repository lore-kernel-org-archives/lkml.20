Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC7339182E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791359907; cv=none; b=BsPtWUd37DFOMkEHoZgVgBZ3GRj4plOtNKiTH7+iQmN69i2Kbex39NRLlT2mGR4oAF2iHJM/tGIIgNk7oy+inw3EmMrakGdC4s9D5UPhWkGkmoLcsADiKXM1VdmYH6gfUe7cIB3UG9ej36Ioy5VRQe7yKQzebNC2CCElLa3d5pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791359907; c=relaxed/simple;
	bh=VlBjWCmlEY3jsJmiwgg3uw+HzRPX31Hs3LHqiqs4His=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BHr9vgwelR6AlLj8vzLLwlmzIfaFzcrgxb7iH0ToGyJWQax5JcCnpKDN2rZx8+xQiQfjgxipu8v5N8S8lr/yhrmY2INYZOGJEa7S+/5sccbb5wsb6aVwssEdaJyuHc/0PKK9TdrKDsDXI1pxgcbTXDSoO9jRJ6XjZOTskNPUTTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security; spf=pass smtp.mailfrom=octane.security; dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b=R2Ws40Fj; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b="R2Ws40Fj"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1517bda04a0so1141041c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1791359894; x=1791964694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMlrps3FQRw0geA67+RuoC81Gj78UWuju498uX94Pp0=;
        b=R2Ws40FjK3G+PUqF+n72mug8qMsDqeCZyNHNk0evQKMrgPIoLsl03IgHao261uX7W8
         3BqRYYDHrabQ3XvOrEkzbDdyldGIkk9zCAxwmP2fwgU46WGJ9W2+MaR5y6tiUyJb14/p
         PNH7nLVNSaLC4coo1C1NOgurzliq1mPNpglOJkpwHylotGnNu5sKFwTpaZ3pU/rm6hdY
         Nzc1O4o2glYP0IbSY12qBKLMVsfjkfi7bE2KEqwnb2grjNIVYmIqGq5Ezeyqy2mGm5v7
         pDL6cCDbLgUIxRtaoHyXqe3O9IABnBE6ZQeuCaaXAM12hrBNgcYK37p8hz/6T9qtK+nK
         6wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791359894; x=1791964694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMlrps3FQRw0geA67+RuoC81Gj78UWuju498uX94Pp0=;
        b=Eg8BfgTKBomZYzddSQZmZfQRzrJzQQEBVUtLe1NxS/ZinZ6cGMMSlHr31qkrZLp+7a
         HuflOZ5MLgOXREVdlu66BUWvRrxHFG4beeHkO6fsmeFuVlt1uBKiXTcsddrglnj+iLof
         NY+tJ4CLYGaXTxdd7yQ1S0vIQJut+jQORd31x8M605RcfYFDHEfmYrx8iw5Wpn8bKbPM
         gwsyHhJkKFYquH7tA1UAyXVRNEz9Bd3Oa5wDuGOqMAMwjje11dp3BLVUlIYlO9zy8uoM
         vIBuI2nsCVuK3Hxr5qBmu58+6P2NF9SNWAJQY9zI+FReg4CNX6Cbz0dLRR0Y1uTBziiF
         x/yQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkmkqViXxW1ln4ulhQfNWU1GsKPWkhtC6fv2e6xDAljiUNLRpwJxcreo95GCSLptQ2a2A04whCaLwmzX8=@vger.kernel.org
X-Gm-Message-State: AFuF++mdbyqggUyZUPKXiHwwzIAbSenk52ivbT1E4mjr1i2KO53e69ak
	AL08dGuSskUHCkrKzg+PBCtVwTk9ew98BxyjH2ETFzI0lYQHaIM4ftM66szUfuKdrvc=
X-Gm-Gg: AYBFou18rgbx/M0mX9ULQruTYzuTue0csmoPoozY1b/e+kKkjpqNjZj99PFsmfjrtQf
	hTFNdbAwhrenpA3UlFMRb47KyoIUnOUy5a07C3C5uSA/jElieuNMz+6ERjMm6Smf/xPyK5BIgJW
	vokNxlXRtDSvmApSub7IK3PFX+JOdLLrZBpJ87Amg7GtwhLOdfaqD8l2PNil93R43AabOSNqpic
	XWCZve0Ab619mWVrp6onK7H11unXpA2QcCjjyTiBTE2pLcUtE1+di3y7wb3HR4suSX8gfS+KRoI
	56LfkBn4LOoSfnCbvS5QBwvBT9P++cREJVKvPoXQ53o79O7ozTu+HNVyxE/V8oUOMpdoQsjk+fT
	SXuDed/Uc2i9ZAiagwxe4mfcPH0f85pBWSolGlWhuqSpu8Mfgo21mrfRO7Ti08rwub8RxqCwsws
	xEAAkFT/eATMHMM5nTNN1XQIC38Dfk9jVU/XOBbAVU/cEj+N9/UiewX/BYStIl/C3oxjR5768f6
	tHEQZcWeav59CXGmZGYP/jEGgpzlWiquIjD3WpE19Fjrr0HGYZZU1jAXHwmeQcQrd2Y4Rc2Sf5I
	YKq7Ck4VBi3r/4Lnkr4wgviFpCn+Mg==
X-Received: by 2002:a05:7022:3a0d:b0:144:ddf7:2570 with SMTP id a92af1059eb24-1620805d81amr2190821c88.39.1791359893759;
        Wed, 07 Oct 2026 00:58:13 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-162263643aasm4844697c88.17.2026.10.07.00.58.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 00:58:13 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	Giovanni Vignone <gio@octane.security>
Subject: [PATCH ipsec v2] xfrm: zero-initialise km_event in the replay-notify path
Date: Wed,  7 Oct 2026 13:28:07 +0530
Message-ID: <20261007075807.70009-1-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xfrm_replay_notify(), xfrm_replay_notify_bmp() and
xfrm_replay_notify_esn() declare a struct km_event on the stack and
initialise only its .event and .data.aevent fields, leaving .seq and
.portid uninitialised. build_aevent() then builds the XFRM_MSG_NEWAE
message with those fields:

  nlmsg_put(skb, c->portid, c->seq, ...)

so the netlink header of a replay event carries uninitialised stack
values rather than defined ones. This was confirmed at runtime rather
than by inspection alone: the .seq and .portid carried in that header
hold values that nothing in the replay path assigns.

The request-driven paths set these header fields from the requester
(xfrm_get_ae() / xfrm_new_ae()); only the kernel-originated replay path
leaves them unset. Zero-initialise the event so the header fields are 0,
the correct value for a kernel-originated notification.

Fixes: f8cd54884e67 ("[IPSEC]: Sync series - core changes")
Reported-by: Giovanni Vignone <gio@octane.security>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Shubham Antil <shubham@octane.security>
---
v2:
 - Add Fixes: tag.
 - Note that the issue was confirmed at runtime.
 - Use the full Assisted-by: AGENT_NAME:MODEL_VERSION format.
 net/xfrm/xfrm_replay.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/xfrm/xfrm_replay.c b/net/xfrm/xfrm_replay.c
index dbdf8a39d..939495324 100644
--- a/net/xfrm/xfrm_replay.c
+++ b/net/xfrm/xfrm_replay.c
@@ -40,7 +40,7 @@ static void xfrm_replay_notify_esn(struct xfrm_state *x, int event);
 
 void xfrm_replay_notify(struct xfrm_state *x, int event)
 {
-	struct km_event c;
+	struct km_event c = {};
 	/* we send notify messages in case
 	 *  1. we updated on of the sequence numbers, and the seqno difference
 	 *     is at least x->replay_maxdiff, in this case we also update the
@@ -304,7 +304,7 @@ static void xfrm_replay_advance_bmp(struct xfrm_state *x, __be32 net_seq)
 
 static void xfrm_replay_notify_bmp(struct xfrm_state *x, int event)
 {
-	struct km_event c;
+	struct km_event c = {};
 	struct xfrm_replay_state_esn *replay_esn = x->replay_esn;
 	struct xfrm_replay_state_esn *preplay_esn = x->preplay_esn;
 
@@ -356,7 +356,7 @@ static void xfrm_replay_notify_bmp(struct xfrm_state *x, int event)
 static void xfrm_replay_notify_esn(struct xfrm_state *x, int event)
 {
 	u32 seq_diff, oseq_diff;
-	struct km_event c;
+	struct km_event c = {};
 	struct xfrm_replay_state_esn *replay_esn = x->replay_esn;
 	struct xfrm_replay_state_esn *preplay_esn = x->preplay_esn;
 
-- 
2.43.0

