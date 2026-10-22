Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687003;
	b=TFh+IoLbvDi3N/WBZ3A4k6HLMSPtJZqayxnHcr+Ti2YQMae3dT0V3mPUcebFLJgW/o8U
	 GFbI/f9VrgC22uUWClgebzPBTvZ5R/Ch7hBx+NLe2AxEUN2hlRGck6rO4TZDq9SkeJxTe
	 jQ/vPf+Pyo7dpSvEzoEn9rPXQBkNM4164xDTg2kYPLhjDouruuPXr+iaifQ0YaxXp3h4x
	 JQpsd9bgRqyRnS7NDjIGSQIuC9ezIg0Qz+DHwzisDB/uHpq3+bFjnekx+iY0iPjQvDSkl
	 mcsr/DquNDePl4KlD+1TuUwo07YhwB4uDx3BoUp4g6FPLIfkyVbIHY1Vn16tQUwzlGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R7l9GBldBqggvq/zvWK0w7jaQ7qb61TWRK+g3QMrrtM=;
	b=X3PXBryY9GXM/44nDkA0SZOmfn5s+8UpBWE7UhgNODHTGwEyEyt0qfUKT0CSyCBflZ9t
	 fejwqE650nG3BRu0hJnRAFlOtgRA6YOUKcYLEjt8xrzihmkW1bgTyQBM5iHpFW6es7lml
	 Tx56VRhHRGmS4PB1Yj/IkCBGvEKCg1Q1EFgRrdTWeRYqrirr3VeH0pwwUmgPtHJeZRGnh
	 hzZxdA24oZVpNc7Ke7deluSavdaIp+wPsOxBkDTjVZIlQByxwtbw4Hsabym8qnank21GK
	 wFLTuddbF1/rfSR+GESG3J2CmWXldwfsYBsHCE/2vXr2PW9quh0H1Jvxq4wv8t0lmRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Vokx/Tg8";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8E7606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B8E7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vokx/Tg8
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2074a66beso168165e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687002; x=1793291802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R7l9GBldBqggvq/zvWK0w7jaQ7qb61TWRK+g3QMrrtM=;
        b=Vokx/Tg8TYjm7F/SKH8DDaZUu92EOwWBEPcfCIIyGelydx+ks+r3kdT/Q7Pf8xeFu5
         Q93181FjebSTzRVLLMCnCIgs1ZtiJPV3dJTwJgt3PsEDXNq8O0NssbWA7dhYpG5cdMa6
         rv2M7wIv4eaS+CHYapfxkr5yKhlLjjGMdu1R/j2MjAIXxwdQabrnCVh6EnCXGziI0K9U
         XlO4jocMxrcN1M2TjO2Qp8EUHcTGoxAeWykVXoJ3K2NFKCv8ujmiHjJGh/puVnGVBQIs
         LVhhycFDpcGDnbNeR7uxY23W6NEAzsNdg0eK4riZzHlw4Jgm45N8SCjxNdT2OQjGo3b8
         aq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687002; x=1793291802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7l9GBldBqggvq/zvWK0w7jaQ7qb61TWRK+g3QMrrtM=;
        b=Urlyxw18MOCzitoXoNrIRoeXVffyC0fhwO/U/d/5WTDhZHJyxskHhQUt+D+Zdc/ONo
         FnvVwa2NK7G9Q4n+9+8zIkLlW46i9/6UFPgr4j/5RynUBGFFyhaRZD19dylPc++7dDJf
         e4Nmn82Evjq0RVZhCh6Md1DGWhPuvLv7zGevGNVPCDsslgTx3kvvh/xEwuyHUaKDiLji
         KJu6nQ+r4vzwqHkmoClimddUiBui8tPaYgsgu6wLA0TXnigkkm18o0Y0JsAiTP8w2enw
         h39jBrCGhoRmeiPkm+nTsOKwcaubUfG3lUQM+CAX3bHjz/+yZvC5Gi9XoSa8fsXpeMjj
         DnNQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5rBnulms/xNd534cmgURUsEDqlzg0xiSyu+OUSv4qMOuL622qall/RthNtzmV7n1wJPF6BDBCabO15kA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKudmeP41a9gRYQXc0YlRQUot1KlIKGAjSAn4RRC0aCNeU7ClAG
	SFZpwgMqJpKUmTHiNEBWExSsp7yst5gH6nQasCpuwtdGuH7X+Qzv8wXy
X-Gm-Gg: AYBFou3SWdM1eGZ81qHGhhmfpIG2y81+5PDykqxLlGFk+lJKZXQLoQ53QCS/6GWpGIw
	T4Foimp2kF4JeoI8tyE/fHe1cT1yo9kKMV5tZmxy3T5dB6u1d3IGeCnn44XEpWb2DHwn4QyugN7
	xdjEN+jGoHj6yIqQCqFm2VdpXK7VbHbfp5JI8pQVhGZwkydBI4HyPKaX4ZwH1YF7YfXsT3tYYoi
	Kh9xUpQ8N+TqAXZFusv/eatXP4ClyGyStnx7j52i3uGLm/Hm/Q0qpM/xZhpKX2ELmMDvOZHvjYe
	EySHwy8tgbiDgUSZK5GWX/cpqNMfSxD/qx2Ss3X9dYFYCBV9rMQqEjjPSn8WzFr01yVpyCyDNjy
	+Qib5O2AZXIUCz3ScsTDqhec0jNrOVjZTjoUuiEbb1m6oLg0zU494KMM6hx5yR78pJzyu1O1M9W
	ucnm1ADigmhs1aeclBl7wjMoqAx+j1Zs4w0+tf9bz7tChpl+5ChCHfiTmxT77j7woXgBhbygIxd
	6z7ZJflc5TT8prIwCHILXsnI4B3eugXIf0QsqtJZbPeOlSZ2V4=
X-Received: by 2002:a05:600c:620a:b0:4a1:706f:b40d with SMTP id 5b1f17b1804b1-4a1fdb1a609mr102596995e9.7.1792687001668;
        Thu, 22 Oct 2026 09:36:41 -0700 (PDT)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210299910sm8263415e9.1.2026.10.22.09.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:36:41 -0700 (PDT)
From: Andrey Misiurov <andrey.misyrov@gmail.com>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>
Cc: Jun Yang <junvyyang@tencent.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Misiurov <andrey.misyrov@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] sctp: fix ASCONF address change on single-homed hosts
Date: Thu, 22 Oct 2026 18:36:39 +0200
Message-ID: <20261022163639.2566945-1-andrey.misyrov@gmail.com>
X-Mailer: git-send-email 2.43.7
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

Commit 9b2854f86f0b ("sctp: don't free the ASCONF's own transport in
DEL-IP processing") refuses a DEL-IP of the transport the ASCONF was
located by, so that a later wildcard DEL-IP cannot use it after free.

This also breaks the single-homed address change (RFC 5061 5.3.2). The
host sends [Address Parameter L] [ADD-IP S] [DEL-IP L], the association
is located by L, and DEL-IP L is now refused. The sender never gets an
all-success ASCONF-ACK, keeps src_out_of_asoc_ok set and stops sending
data, so the association stalls.

Fix the wildcard DEL-IP instead: look up the transport of the packet
source rather than reusing asconf->transport, and clear
asconf->transport when a plain DEL-IP removes it.

Fixes: 9b2854f86f0b ("sctp: don't free the ASCONF's own transport in DEL-IP processing")
Cc: stable@vger.kernel.org
Signed-off-by: Andrey Misiurov <andrey.misyrov@gmail.com>
---
 net/sctp/sm_make_chunk.c | 15 ++++++++-------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
--- a/net/sctp/sm_make_chunk.c
+++ b/net/sctp/sm_make_chunk.c
@@ -3150,9 +3150,11 @@
 		 * packet MUST be deleted.
 		 */
 		if (af->is_any(&addr)) {
-			sctp_assoc_set_primary(asoc, asconf->transport);
-			sctp_assoc_del_nonprimary_peers(asoc,
-							asconf->transport);
+			peer = sctp_assoc_lookup_paddr(asoc, &asconf->source);
+			if (!peer)
+				return SCTP_ERROR_REQ_REFUSED;
+			sctp_assoc_set_primary(asoc, peer);
+			sctp_assoc_del_nonprimary_peers(asoc, peer);
 			return SCTP_ERROR_NO_ERROR;
 		}
 
@@ -3165,13 +3167,9 @@
 		if (!peer)
 			return SCTP_ERROR_DNS_FAILED;
 
-		/* Don't free asconf->transport; a later wildcard DEL-IP
-		 * parameter reuses it.
-		 */
-		if (peer == asconf->transport)
-			return SCTP_ERROR_REQ_REFUSED;
-
 		sctp_assoc_rm_peer(asoc, peer);
+		if (asconf->transport == peer)
+			asconf->transport = NULL;
 		break;
 	case SCTP_PARAM_SET_PRIMARY:
 		/* ADDIP Section 4.2.4
