Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199320;
	b=Neo9IwLsMyBjotxSGMvWryqGPsN5NeKTLIx/oziseu1tO/XOmkyQfRvUmwZ5U9TxyPRE
	 kxwrBZvm4jwR/9Rcix6sCEMdBK0ZjSUiOyBmL6623Sr+0zvacn1W8wcU1X5223Lj3iKXg
	 WEmEINMRXse4NcyHnh1J3GkdmLJkPVpaNPKMqYvgUyxC35YR87PtzEqS2BPAyStD411vL
	 Ry1iC6UJoWTaymwls8Vgy5Oph3R7EspVec2xPIIo8WPjz9Q2t0FeumrEMKgSk/url5TnF
	 qsKvDReWhcnE1R1UtXMWrTk0usV6sJmp8lMb2DdUif1RRXXQOoSDi426Uth9ziXmtwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=meU1m866/ygpxNHbfayzs25nVPOgWuaJgkSGzs4sStg=;
	b=m1t38NnV+jXzDwHjTYaKU2ORus9ne/5iU0uelEkBJ8cjRP/iP+Ih4i8GX2Mo5G1bhDIS
	 rG7HhLE1inwzTX7Au5MB/Vx6Y7H4UHrwiCINhEN9f55R6hnyux3pwxNo788Bjhr2P3ENr
	 edpHBNxfAP7X2LvTMV7fLtVIEhfIE4c9f0e46wSaPfoa4Q0rJCpQjKicqMlz7GaUiMkh+
	 TLJ5skooi0OC1mkTqtbtvQhmOZwfHKmSw2ia9m/VfhrqL1u3nq8aq4YQite+D03CLi+PV
	 7OZoyv17Yp5xYwool3ynRoi9geouCEdXmOVPpMnel2lrPScHjh8muXHa5h+STpS0ENA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ll3SC1US;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26FC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A26FC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ll3SC1US
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e3b22e971so570197f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793199318; x=1793804118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=meU1m866/ygpxNHbfayzs25nVPOgWuaJgkSGzs4sStg=;
        b=Ll3SC1USAj+MFGElknEKyTZs3ptniL2lDh8IEIUgbP9oTcGk8nEXveAsuwV+ZIBuRB
         Hf1pkqzw+gbcl6jRLVtfj/RdAIAjCwEXFxHH643Lz7716ngw7zmrDfmcXO+D1wu1Bpr8
         ZjNF+darVQSlT5ZACsMCcXIwYz42k4HYZ/zOgbTuSpSV26gIX+Wtmf84iRxPjkHC9zWZ
         RKB4PgTGhOchFEdhEJnTW/DU2SEcNR1y3xuyFXGa5pOqnxTgQz7zQta/M2j/rOdzpe/z
         7Qfr+U7y3qldR2qRm2JByNVJm1zslMLzeSNlLFQ18Lfndc2w2HIz5c+GdxDMaoOvhk2d
         qt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199318; x=1793804118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meU1m866/ygpxNHbfayzs25nVPOgWuaJgkSGzs4sStg=;
        b=erDdJ//dsRyOXAmbUOSDWsfDzeeq1qAgKXj2xt/O/o+1DxL+QO4yE1fSuIY7AatIt2
         PonxiljQ58xwZPveNSyHYWOiKjOGFt1czIGbuo4Ue9Hcg15AVRu6jhyecRvQZip0HVmf
         5iQMoUTd5r8O4343UQoDgtIt1cJzoVe3nwjFI3evz9JO57LfVv2iAH3nNAXt4I1R2CFi
         fOJMMMGHcBMX6hbkH4stZgwT/OTdohWrPWw4keAKQfUcbPpLKBlp62H0kHfeBqX8huV4
         LEzwAQXgUvydqL+Gvp+N+ew03uRArFtaGq77E1EVx2LZ6DMIPR2RWsTJK8N0EyeUlsU0
         AbFw==
X-Forwarded-Encrypted: i=1; AKwUvBxoF24ms3zb28s3dUkSCSXRLfVFNsReTQrTKt1tzx1+jT5IagiAekxj5X2DqNpd/t3elShVkfNxy9Pg6Rc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4uBEp1nw4OeGSzTz/RbObfOvZjhrgMo4M5ko+XLbXNhJQR7hJ
	7CFEbAtkkToNpUikORouOm0OrDRPlbCcWEqOoI1hpxezKCrFR3EuK8hr
X-Gm-Gg: AYBFou2kC9mIzNr20iUh9U74Q3Km/9P/SgKcMErtwrbFf9a7X/X2Hu/awnxfszTOggk
	9sfdZ1YLWf3V0WBOXc+UD/hRfgNz5Km0Yth7dPSmeRvfV3TEPDPUVld2vMjD8TbbubNYkzvK5ue
	co+rL1kTryxIIxH5dsUdUrOd6LyTCNmMfJQYjINuVUK0MJ8y4Ni/UvH1tWtJAVIgAezkoTkCRlD
	ncRt5IRgGapbGIkWlAqQI0oZ1bfZfPsiQ5nqamNiJeYzqdVJ+t3nGSzYZs1ROD2GYMaqsc6sb43
	2gb+5JbP7mGx3Hsjt9XLYxaLZ5GcKLUNJap9dSTaZ2gdstkpJCvcRphscNKTJZptB8ym9dPzh/L
	ugosP0oevSQ4AcXraUc0U0iyWHRHQz+GGbpSdQ2gEJTFhqB4fwQVTSCHw4koh7a1IgWxCFbfIi4
	16WLaB2J9T89x6b10rrvzp8Kq9TXt9JQ22o1JgVEy6aprz9ld4JhpUWUUkrYyXkMXcUg+D+jgtd
	HhSpbEB6Hpq0lS37Oh25efAhkH6jvoLjH2IoRJ8WxPTRA3Cr3H/oxImmT9jU/lmwc0U9k8BFCpe
	7TDEGSo/UsQ8r//Tp8k+a41Obm1zw3Puj2Crd/5JgpyC
X-Received: by 2002:a05:6000:1049:b0:48e:4e00:b72d with SMTP id ffacd0b85a97d-48e5d5d0a6dmr4813779f8f.38.1793199317639;
        Wed, 28 Oct 2026 07:55:17 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:47f1:8a3:6e76:cd9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm34432577f8f.44.2026.10.28.07.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:55:17 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] slimbus: preserve ports after failed disconnect
Date: Wed, 28 Oct 2026 16:55:08 +0200
Message-ID: <20261028145508.1111792-2-thnkslprpt@gmail.com>
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

slim_stream_unprepare() ignores errors from slim_disconnect_port() and
frees the port array even when a disconnect transfer fails. The helper
also marks the port disconnected before issuing the transfer, losing
track of which ports still need disconnecting.

Update port state only after a successful transfer. Attempt every
disconnect, return the first error, and retain the port array on
failure so completed ports can be skipped on retry. Free any retained
port array in slim_stream_free().

Fixes: abb9c9b8b51b ("slimbus: stream: add stream support")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/slimbus/stream.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
index b4e70a7edd1cc..ab26b243802df 100644
--- a/drivers/slimbus/stream.c
+++ b/drivers/slimbus/stream.c
@@ -150,12 +150,17 @@ static int slim_disconnect_port(struct slim_stream_runtime *stream,
 	struct slim_val_inf msg = {0, 1, NULL, wbuf, NULL};
 	u8 mc = SLIM_MSG_MC_DISCONNECT_PORT;
 	DEFINE_SLIM_LDEST_TXN(txn, mc, 5, stream->dev->laddr, &msg);
+	int ret;
 
 	wbuf[0] = port->id;
+	ret = slim_do_transfer(sdev->ctrl, &txn);
+	if (ret)
+		return ret;
+
 	port->ch.state = SLIM_CH_STATE_DISCONNECTED;
 	port->state = SLIM_PORT_DISCONNECTED;
 
-	return slim_do_transfer(sdev->ctrl, &txn);
+	return 0;
 }
 
 static int slim_deactivate_remove_channel(struct slim_stream_runtime *stream,
@@ -448,13 +453,22 @@ EXPORT_SYMBOL_GPL(slim_stream_disable);
  */
 int slim_stream_unprepare(struct slim_stream_runtime *stream)
 {
-	int i;
+	int ret = 0, err, i;
 
 	if (!stream->ports || !stream->num_ports)
 		return -EINVAL;
 
-	for (i = 0; i < stream->num_ports; i++)
-		slim_disconnect_port(stream, &stream->ports[i]);
+	for (i = 0; i < stream->num_ports; i++) {
+		if (stream->ports[i].state == SLIM_PORT_DISCONNECTED)
+			continue;
+
+		err = slim_disconnect_port(stream, &stream->ports[i]);
+		if (err && !ret)
+			ret = err;
+	}
+
+	if (ret)
+		return ret;
 
 	kfree(stream->ports);
 	stream->ports = NULL;
@@ -484,6 +498,7 @@ int slim_stream_free(struct slim_stream_runtime *stream)
 	list_del(&stream->node);
 	spin_unlock(&sdev->stream_list_lock);
 
+	kfree(stream->ports);
 	kfree(stream->name);
 	kfree(stream);
 

base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
-- 
2.43.0

