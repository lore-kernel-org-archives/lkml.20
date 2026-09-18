Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741263F39E4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702797; cv=none; b=dfLFkMhMK4SYmqGaOT6SmYxpIoDHDOiLSsWeemanf2yrsm00kYMgIWCetRGha/40ZdbphlYSFR+udukUy/FA/RjUpXcfhWGsjsMXpb47WNpCJZByJgGpiIaBA3o7iyHeaFTHjIJ1Yp2zxWraOrTS2o3QM5MSaQataXNJyIRvYZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702797; c=relaxed/simple;
	bh=yJiyg92QC6XahndjgkRwHsdfasvgZ8Sl+8BkRmHKw6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cWKezzXO0aygZsBcx7bgk8IJ+wpw2/lpoNXM8YfZDzcnKoJL5JeKGnszaDj7kMsVVe6gDWpNk1GByakTjDYFtJ9KeSKL9fPlI28hr2Uq9LWTGwcmVdSDi3Mi0G/BvfMsXZM6Ef3H7X269PkVfm9VHDYt7LjuQuD9ndDfoShUtjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gy16NSMu; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gy16NSMu"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso2061075ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789702796; x=1790307596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uey7daPDoexPjIHMCdJvQFu1kjO+d7SoV4geDUUnn+k=;
        b=gy16NSMuob6aZgfR18QnZQADpatcH/w9fbZD2etDem9Kllhxp9MVDmA+0CHkP/7xY3
         RKrETLo5PKTI7DoAu8MG0xv1IgyfI0KAPqTYzlR0dG6D9pQgll3MUia19StApmMX5HCP
         8V1Qz0qANcdL043nMUQApNEls4aMupDYPe0w6rmtOZmVCDWmYwqQeXMP4OxF7bC1Au+r
         /9uzzv4fzwzmtajJoyfT4LimcyiwsJ0jgLtelojrIkgUp/T+8oQXMQFT/j43A9JBMdPA
         jI3zk7X7y/lvlk676tRiDYwpboMtp3zhntTIDkdD6J1ZD2DGfBe6+Z30GmOU2dGiQ4D5
         MSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789702796; x=1790307596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uey7daPDoexPjIHMCdJvQFu1kjO+d7SoV4geDUUnn+k=;
        b=yNrxIjtVspRBmNy3qHjwN5kI49ywqTyLAHwwm1GnZAym/F3HpcnY/TMawkKgJZma4e
         ++BQtTbSl8x4gZLSAgWcf+LHrQpCX0gNCt67tBV7zDkpfLQ90td1DMD6dyWyb3l6Y/0K
         uAs4u6KCXzCTcxUQEsWluaqoAwm9NZvMb8TQ3E7J0bGjYOwOtl0qrNqyGAnzmRciuzBi
         QCUgN+Z8plhRJULKtaNKIT3HbgWnShi7/RQlS2B5kmDl1vAMpg5E9dxYp127sKOlIjy5
         5raNrK7D12dPyBXvId70h5aThnZLwHDA7JuO6i9arhmrVdq/F8VIhv4yvhWn0OWEQLB6
         92Hw==
X-Forwarded-Encrypted: i=1; AKwUvBwXj/GBsBCOSCMv3Sg84/6bUbgL8Nh5nnC2VUDkkiBOAflL+L1ZhtWsBFL0NkrO2A4M1f/JKhETxDVmu8s=@vger.kernel.org
X-Gm-Message-State: AFuF++mmC5kNXG2n5qDFr5WhV51VC/4eI5RC3JodxbGFe+mngdVkL1B5
	8qK3B0n2kS9lijnItggNO2UPKOgqxyuk/OeuyE3Q2DMhZYhPYmRJYQ2j
X-Gm-Gg: AYBFou3s0Gtro6M1x8Y+/LLazhlJYRP90/S/neosfohoQxDOXvmfppbFzkkPrK6JBP4
	XSPURJQUbCSbyQC3n2NfzVcpQNmOZ4BdrV1CiXFCs5D95oIDF9VOBBeV62thDFtQfc+YAcCiQaI
	QA0gNMqOeLrrJR6SdgmJg+PvTudLHm9zK5naMQqNSqnaEdLx9Iy9GY2qNLhC7Hamt/5knegyGSm
	6WhIA2w8u8SdsrrvSCqiZ841v3U+Il/uw3BYPysEpt9AKCAeGSZkCQPTrk3cOpF5uGzcpdWMPjB
	bs36qHlksgzvmsNvKUhhHteWcytY2A66uaqMUTF9onlZ7rOXVsEInGFM1YolUWyEkfOIOiu7Yp/
	cjW4RWaGWMQ0ID+TxZElZu5TNx9ENJcdipdpqiDpge+7GZxlrGvV2AVvhsPUcmH5tzXNZNM/LWE
	884fHJwKnlETzbhwUAe7/3rVkVBfaRAFmQ46QHjzo6hkyrR9ApV4NgShB3p2ChEKYBgtfn6DVnw
	MAvTehGLnhJeDoo9YEqibY8L2JCpONyUi+MTLKpIF8oTO+u6A==
X-Received: by 2002:a17:902:c948:b0:2d8:d4de:fa80 with SMTP id d9443c01a7336-2ddb1ab39edmr24350885ad.4.1789702795755;
        Thu, 17 Sep 2026 20:39:55 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:79da:8b9b:16b2:8431])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c287aab5fsm608065eec.22.2026.09.17.20.39.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 20:39:55 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/1] sctp: check return value of sctp_get_af_specific in sctp_process_init
Date: Fri, 18 Sep 2026 11:39:42 +0800
Message-ID: <20260918033942.85061-2-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918033942.85061-1-ndaugoing@gmail.com>
References: <20260918033942.85061-1-ndaugoing@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In sctp_process_init(), when matching the source address of a COOKIE
ECHO against the embedded address parameters of the INIT chunk carried
in the cookie, the address family handler is dereferenced without a
NULL check:

	af = sctp_get_af_specific(param_type2af(param.p->type));
	if (!af->from_addr_param(&addr, param.addr,
				 chunk->sctp_hdr->source, 0))
		continue;

On kernels built without IPv6 (CONFIG_IPV6=n) sctp_af_v6_specific is
never registered and sctp_get_af_specific(AF_INET6) returns NULL.  A
remote peer can reach this path by completing a regular INIT/INIT ACK
exchange over IPv4 with an SCTP_PARAM_IPV6_ADDRESS parameter embedded
in its INIT (ignored at INIT time by the address family gate in
sctp_process_param(), but the cookie embeds the whole INIT chunk), and
then sending the COOKIE ECHO from a different source address, e.g. a
second interface of a multihomed peer.  sctp_unpack_cookie() does not
compare the packet source address against the peer address stored in
the cookie, so src_match is 0 and the walk dereferences the NULL af.

This crashes the kernel with a NULL pointer dereference in softirq
context, remotely and without authentication.

The other from_addr_param call sites of the same family already check
af (__sctp_rcv_init_lookup() and the ASCONF path in
sctp_process_param(), fixed by commit e40607cbe270 ("net: sctp: fix
NULL pointer dereference in af->from_addr_param on malformed packet")),
which missed this one.

Fixes: 0c5dc070ff3d ("sctp: validate from_addr_param return")
Cc: stable@vger.kernel.org
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
---
 net/sctp/sm_make_chunk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
index 84a4c97d0f75..ff1c013e2575 100644
--- a/net/sctp/sm_make_chunk.c
+++ b/net/sctp/sm_make_chunk.c
@@ -2381,6 +2381,8 @@ int sctp_process_init(struct sctp_association *asoc, struct sctp_chunk *chunk,
 		    (param.p->type == SCTP_PARAM_IPV4_ADDRESS ||
 		     param.p->type == SCTP_PARAM_IPV6_ADDRESS)) {
 			af = sctp_get_af_specific(param_type2af(param.p->type));
+			if (!af)
+				continue;
 			if (!af->from_addr_param(&addr, param.addr,
 						 chunk->sctp_hdr->source, 0))
 				continue;
-- 
2.53.0

