Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793302504;
	b=V9m+4oD1miXHIFttAn1zjgU+d2x6zLEjjoCCTSNIi6iSfb4nGDYfSvcYJ7ZAuLPUW4tk
	 P4mvIJ2g+B/Dh9WFmsHrzlpwCiQdbiXwjsC7RlMPQ1lIg8tW3x95CphRWIHRkJ/yXh5b0
	 AJAMerBZP/8BisTo04ITgJtUWi8KyETATSdbAHsZalNo19MRE+wmtF8ZH6mxGdd+o7Z01
	 D8o/gpDM24Imicamhp/bVlEDgihHe0Z9pDSYDf2zjzblKe0vpKuqB72n84p2wk7HcYMvC
	 y3M2rVm0qLP2ju38XhGC/lTVWP1iCmd8dXH6TmvOy6VtAcVHbU30Z2JqG21gqRelDEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793302504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=laioZ8N0OQR8oGU3jFarnfPkuthFm2r6CwyVihbfb8I=;
	b=H3v4YSTOig3Ae45Z4IAkVXYmvhVnEAV0XR0XWjvQljocrONEQdcO+ZH+lrxaXM6V/jyH
	 rO1R/LaNoVrlWb1XldtF86kF0GJsbK4avl9Y7SGmFbw8GnCZF30SGNnvo/AgnU1cl+N7K
	 eqIgVmVGlHmJWZiH9qXpus4uKCddI6x1nT85LtvWA9lMOMSfzGWFvgaCK4XtTaP4l47DP
	 uWCdFCnjolJsSrF7ff0CHQsglHWqngSGcvF8BGClfG1wOGtpOGBolUj/RJwySgjJ0sppX
	 yKHvkU5rKOgpHwTZlkeaYyczVOJYqIGe1x3/jgPFPK2gcVyGLTwtM2j168jrus2Pj8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xr4pNwCK;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B70606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83B70606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xr4pNwCK
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1379867f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793302503; x=1793907303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=laioZ8N0OQR8oGU3jFarnfPkuthFm2r6CwyVihbfb8I=;
        b=xr4pNwCKgYGulSw/az3ibQgRd3q7lIyi9gAtf0ESPFgOodSG05E/NuzpYrS9AdfFJq
         /3XnLbnR81g0VIcYmNAbug97vSIHtPJoNSreJGScZ+D6+n1Z78pDSeecZp0ARZ8yxZqH
         ySR0BaGEWVVQv+B6HqFTgKIAFx0ANskp4JqGTrj7rzVYeYttOkZ31xZduzyXAwfSW2ih
         XSzjfCh99ugHcJbRPc3X5AyaqtFh4YJ7y9RXQUp5EUjP9Bp8EhJEJ4z9p3eh6h2Zr399
         soNi82h30lyjo8knSvtarMORMcxjDxE8Fpywhu/VDW1XI8pwVNkPu1JITIMBxOj82+Ol
         dnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793302503; x=1793907303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=laioZ8N0OQR8oGU3jFarnfPkuthFm2r6CwyVihbfb8I=;
        b=jlgYSGi2vqknDleoF7yzNhiP4+QcpbM133zN4IwTgEWgy45DvOIoyBXGazaTeXmdGX
         3oXlRg5yht6nv3KhKLbvvKl6WebHdiQhIPfL4EmkAUKVJT70B3uimpDioxaLxI57C0M1
         it0Vv4dx49vP0iu5K6MY4+tmmI8LqWJYz1A8dZz2ictoHY4SLw5ecW/VHnhRbShO2hal
         WnncNmRUaxDraMFBc4VxnPImiHcz07LP7wMOus3yn3wTZF7A9+5mjBv2fxRLSxfd8uzR
         A7Ye06RUBsBLN2c7qnu7/WB7mU3T5VSpHEwUch9yxEr0w07qLuDKfBmMeR6eMTx7y5EG
         2JaA==
X-Forwarded-Encrypted: i=1; AKwUvBw89jcKXTaFA803jl+Bj6XvWb6Mupvb1Shn93MK9lXmHJtE+a7H62QM80xpvYDOERq9/9+FAC/mtVqS0lE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlkcKyUfwmUcXRE02HRZ1tyIF9pSrSUjsbH4IthCuST7g5Lrf4
	gOXHJX2R9RUDRGeBS8tRNpMY0+JH44YmJcBlyjvt1b67CekVouiy5oka
X-Gm-Gg: AYBFou3Vz+xE8/9VoFImFgth6doOigYWF94sXwPkFzEYq3zMdBBNUfjtk2Vbo1qH+Us
	JX0M0eZAbrVFk5NK4IaACH/yZ3Y8aJuaF2rKV8Ybu2gs4/2vzWMygsKqIYCN/bd9gJKAig2ATFh
	BonxXbT7nnBg5FxGPZFfb11AooI1AgcCD47g9u3O7GOEn83okoNZCdu0xJj3XtqtVvbFDzM3lwg
	pnQWiqsp5a+4fk8bc2h71KMOhfde01iJ3gLXyZKD0CCER+ng1RnvQdJyqHv3O9KK96V8FPryCy3
	q1C+tYk6ysdcGEkGnUi2M2DU08tVkgUBICre/YhstXSh/IPfT2sQwq5poS312ypVBrbnScy6hBy
	/HkgVJLckl2giT+ztN3Q5hGQyNHBUilDFLVzAyaP7UpKyOJv2RkwHPioa4+7X1pvV2YuenmWBXe
	4vkrzRqiDPvy1EcA5CJfBW8ENuf89cCDx95ZwR8iNMU4v9y01gpmeezi6kVpqzxP866UnzDT1sK
	HqdrgbKgICsIzjJvqKkdK9/1DaMJrqDudjoU4SpfDt2ifcGBZpEIStU2N2HwbYesiokx2rzjt95
	axyttZmiv5jxPZSxrAj+Yn4x
X-Received: by 2002:a05:6000:250a:b0:48a:f073:336b with SMTP id ffacd0b85a97d-48e6e2fcd88mr842417f8f.23.1793302501851;
        Thu, 29 Oct 2026 12:35:01 -0700 (PDT)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6eb81d48sm274585f8f.24.2026.10.29.12.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 12:35:00 -0700 (PDT)
From: Andrey Misiurov <andrey.misyrov@gmail.com>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>
Cc: Jun Yang <junvyyang@tencent.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Andrey Misiurov <andrey.misyrov@gmail.com>
Subject: [PATCH net v2] sctp: fix ASCONF address change on single-homed hosts
Date: Thu, 29 Oct 2026 20:34:54 +0100
Message-ID: <20261029193454.1028626-1-andrey.misyrov@gmail.com>
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
asconf->transport when a plain DEL-IP removes it. The wildcard delete
can now free the old asconf->transport itself, so point it at the
surviving peer; otherwise a bundled chunk would reuse the freed
transport.

Found by manual code inspection while reviewing a backport of commit
9b2854f86f0b; reproduced on a two-namespace single-homed renumber.

Fixes: 9b2854f86f0b ("sctp: don't free the ASCONF's own transport in DEL-IP processing")
Cc: stable@vger.kernel.org
Signed-off-by: Andrey Misiurov <andrey.misyrov@gmail.com>
---
v2: the reworked wildcard DEL-IP branch could itself free
    asconf->transport via sctp_assoc_del_nonprimary_peers() and leave it
    dangling for a bundled DATA chunk (sctp_assoc_bh_rcv() ->
    peer.last_data_from) and the following SACK; retarget
    asconf->transport to the surviving peer. The pre-existing wildcard
    SET_PRIMARY / sctp_source() point is left out of scope.
    Reported by the netdev Sashiko AI review.
    v1: https://lore.kernel.org/all/20261022163639.2566945-1-andrey.misyrov@gmail.com/

 net/sctp/sm_make_chunk.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
index ddc31a5..9719464 100644
--- a/net/sctp/sm_make_chunk.c
+++ b/net/sctp/sm_make_chunk.c
@@ -3151,9 +3151,12 @@ static __be16 sctp_process_asconf_param(struct sctp_association *asoc,
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
+			asconf->transport = peer;
 			return SCTP_ERROR_NO_ERROR;
 		}
 
@@ -3166,13 +3169,9 @@ static __be16 sctp_process_asconf_param(struct sctp_association *asoc,
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
