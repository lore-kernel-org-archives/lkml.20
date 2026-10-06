Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D589545040A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 12:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291450; cv=none; b=eDr5mBpZTRBheQ0AYWaUEJWB87VNK4tXCe898UUMP+C9VeejSkFebl2n5C7PdSw73cjpRon135SANJDoaBjK5ejRAxM213f3PvXiiBiuUbqGsCUAxepkCgpvz+gm2TryK2JnF8+p3sW4SDHluZR/QvIRtnwNeM4IyzMroCzJ7qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291450; c=relaxed/simple;
	bh=Btqtd0UsCjcmoPb7z0rRhkP88XKfTDkNPWQFKJwxpPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZkDM+Cw4RRCDtKIA/od3EAJtVOFbeOrQESMCRCQaLMd/3Y6Maz3rw73I9eFzL0X64S8yJxvRGYBTu1UQ+42WDeyqZDVRJkwxXXLrqeZoON62Z7j//9O5lXcvN20DTWNitWkeU9azKP20sDk3hbZI8biHd+21z1Oh1m9fh9sFfhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security; spf=pass smtp.mailfrom=octane.security; dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b=rpbBwRry; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b="rpbBwRry"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cace91f112so4800445ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 05:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1791291448; x=1791896248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XGJoDXN8ML+5H+vmHlmrXHOZlyl9hQU4oGT+sBqpTVs=;
        b=rpbBwRryqlhYsivAKvTJ/AETTAXITegzeI1Ou+raE7HQznk7Lt77ONZg3FFYXEbU9z
         9/+pjQMXxa3mwvHLaPx7U/mPq1VYyWIjV9tR+7rI+NQhSqDz07bpyZCFrdINDO6rtp2a
         OZkBy4FbN/pIEVJjBdVNZciG5BIzNZxHYlmD1wthe5lQwUDEEnbxTJApXq7znpX++EC3
         UxTP4cOB8fIC3TtPWVA08wRKCNDnY05vfzdVd/GOUx9Ru7sYnfDopGxE5Dl0yyHhUh7k
         vN2UfGRE8zsCc2YSzTWp0+0JRKbyA2TqbodPRgQEtBlT8sSaI25OgbynOtaUUnMc7VnC
         nYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791291448; x=1791896248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGJoDXN8ML+5H+vmHlmrXHOZlyl9hQU4oGT+sBqpTVs=;
        b=WXm7f2jXm41uo9ms20c71GebG8+Z9+uOtgnw24W0IDq8unH87FFWuxGLsMkjeG4Qva
         YfYVGlFemGr9O1KGM/fq6F4dPwD/j7Av01phpgxk+iLFoT0NGsCu6ffazolUc691eCkm
         hKfPeFvEq0B6ACubQ5xeMizdoIxIVDXil0SsCqjJUQFow3WW3OwBsZTpReuPuFsnD8/e
         k9CFaSue1RbkzNLv2TLg5zkVDMguJh5T3jQDMAvDNSj8zjJ3DnOTAn5L+alLfpS2d3eO
         tyob+XbBurZZGajnhdJdLRlILGF3XdFU7z98NfRANU1WeKEcwlFHMU1J56pkE8GvUEKq
         9Dsg==
X-Forwarded-Encrypted: i=1; AKwUvBzSwp/0Ri0GHRrqaveDY3GaZhlZTE/rzw8BkQVMTanLKcnXtW4Bhyeyzl2F2rB9XJQEKm0FvQ+9kI3zLyw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxuhCEzkUuREuhEzqoDHAv4cpLNqXTjfS2GIoHQ8WAQ1pVrea7
	lMncHaVAH8jPT/4lYCDO9lM+qv86cMuK3Wwi18UsWesTo6J5QmNU7YkUkcPdgRM47ic=
X-Gm-Gg: AYBFou0e+x2N9vJtqzOs3GsF02BF5CJgJblVa4vHHR+40JXKVkI/7aYzQ+BU/FTKSCh
	HdtzL7HHOvB/XQuxm2NHowdc6xSB6xjkT2VLYJdO5J/9WIJ5in+4aL0pzvm0kxrdu/2PmTc0Lse
	qpzZDLIGy/uW2hMrqR7Y2FdIi89bmpihU41xSLrDuyo2xTJxALrfNYLNAQ2WC+rEbCMrhwpLcba
	ixsaGPaVmCR+cs+/YAA0VfAJt9Cj6h40bRE0IypM+3Shom+/Mmkqj8zZW45tAPklzyDECh9pfr3
	kKlRg23kkevQ04H1vDvL0inn10WnL62th7UUGybuiDFoX+7JUJjDK01c04tlzCYXBYger8SO9PZ
	TzZlpuF/viS6U2tmLueVi9ydaC3ovh5JBqu+C8R0A+QDGVAvw5ATE0FqGtRs96BLCuCOpRyFrc1
	Sb8C6mv3r0ZXyzeAzjLVZsRW6yXHFm/0+gBmHalGuL/5NeIGPbzONL6ZD8LJ7ASHpdwsNzmC8Tq
	qJF0q50kPiTrolOOAcNE/iJDtEhEG73hYqzgAF1vVS630LcS1RScTQtmYWUChWxNTvzbZ8yHT1x
	Hu3jE4ZMlgp3gA==
X-Received: by 2002:a17:902:d2d2:b0:2df:950d:8f4a with SMTP id d9443c01a7336-2e5dcd9701bmr11664305ad.22.1791291448027;
        Tue, 06 Oct 2026 05:57:28 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ecb12fsm22942235ad.50.2026.10.06.05.57.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 05:57:27 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org
Cc: Allison Henderson <achender@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	Giovanni Vignone <gio@octane.security>
Subject: [PATCH net] net/rds: ib: drop fragments shorter than the header-declared length
Date: Tue,  6 Oct 2026 18:27:20 +0530
Message-ID: <20261006125720.81227-1-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rds_ib_process_recv() accepts an incoming RDS/IB fragment once the
receive completion reports at least an RDS header
(data_len >= sizeof(struct rds_header)).  It then trusts the
header-declared total message length h_len: for the first fragment of
a message it stores be32_to_cpu(hdr->h_len) in ic->i_recv_data_rem,
and rds_ib_inc_copy_to_user() later copies up to h_len bytes from the
fragment pages to userspace on recvmsg().

The number of payload bytes actually received into the fragment page is
data_len (after subtracting the header), but it is never checked against
the amount the fragment is accounted to contribute to the message,
min(i_recv_data_rem, RDS_FRAG_SIZE).  A fragment whose header advertises
a larger h_len than the payload it delivers is still linked onto the
reassembly list.  The fragment page comes from the per-CPU receive cache
and is not zeroed, so rds_ib_inc_copy_to_user() then copies up to h_len
bytes to the PF_RDS reader, including the uninitialized tail the receive
never wrote.

Reject a fragment that carries fewer payload bytes than it is accounted
to contribute before linking it onto the reassembly list.

The issue is reproducible under KMSAN with two hosts over rdma_rxe
(Soft-RoCE); the same reproducer confirms the fix stops it.

Fixes: 1e23b3ee0e94 ("RDS/IB: Receive datagrams via IB")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Shubham Antil <shubham@octane.security>
---
 net/rds/ib_recv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/rds/ib_recv.c b/net/rds/ib_recv.c
index bd6cb3ffa..fee77b6d7 100644
--- a/net/rds/ib_recv.c
+++ b/net/rds/ib_recv.c
@@ -949,6 +949,15 @@ static void rds_ib_process_recv(struct rds_connection *conn,
 		}
 	}
 
+	/* h_len must be backed by the payload actually received (data_len),
+	 * else the unwritten frag-page tail is copied to userspace.
+	 */
+	if (data_len < min_t(u32, ic->i_recv_data_rem, RDS_FRAG_SIZE)) {
+		rds_ib_conn_error(conn,
+			"fragment shorter than header-declared length; forcing reconnect\n");
+		goto done;
+	}
+
 	list_add_tail(&recv->r_frag->f_item, &ibinc->ii_frags);
 	recv->r_frag = NULL;
 
-- 
2.43.0

