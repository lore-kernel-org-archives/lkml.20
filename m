Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0CA47142E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860260; cv=none; b=FHPgAMlQ3QC/oIaKMgAb1YX6Gc/lVTehd2uQCKQfaa2FF19mDeGM1oSULA910QJf79D09imZwnk66oeNlHkR5n1kK9U6Pyfrdr5GGiTaMTen5SeqJUjOFwbvykDQFjJcJASaHGGnOEo42TUrQI+BHRhPqL3T4A1dtjILTpZ/pcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860260; c=relaxed/simple;
	bh=rU6/NcSV6wlLvUaIiIjQl2cds/mD4DK5bYnjCOtOQ+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JgnPbd2mb/+f6nyB7MpIGiL2LZ+PC1ZBkBXd+Bmtl+oLJ1trQy53CvCHFAajGVK9s/JO8C+AIb06GdZf9nnd4t4REGeODS+S4+l0gk3yJpxwdijohjyJHTVHdqRqlQu0x3JwkLKYL73CFpUu4RgfRUXY0TMpbz4a9uA+UUHf7Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security; spf=pass smtp.mailfrom=octane.security; dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b=luB6FJbd; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b="luB6FJbd"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so4685788eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1791860257; x=1792465057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/RJ4GyWHSPpIYsWpDseMdmR+JugHfXlVBzuKwLssRqI=;
        b=luB6FJbdZbr0o8Ab9fQY8Y4FpIEsDSMMzELrrJHKPDaZliUIg82gKyWEIIFVb2R8PK
         BhpTDsBywetxDI4QmijSV6xBB36JHbJXhhRc8LnnmtAsq4wwD6VX+cdPooxgIVe2XJR2
         Llg06DD8cYUN+o1zH0TsQA9hf/oaGQwAM+nnBM/L9PIWOzALSDnkEB6mjkDzMXeU00Qf
         op3BjGkfsfqxkGfnzXxUf28Bjf2kckOPBFzJFG7Qae7Um0N0VN7NpDxVVZTNoKeNtBfg
         OlIlYBR8OcuecgVfeuxMetz08CUIvUVZsWnFkrMEzgxFXXlVQiqwEgtA8KvWJpmt1O+t
         rX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791860257; x=1792465057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RJ4GyWHSPpIYsWpDseMdmR+JugHfXlVBzuKwLssRqI=;
        b=EjahBe7DP823sjCFfuLdEr5J+EPR2M4dyjdC4+g4iAmz4EX8HNE69f97KPbWmuMlbf
         BNqav3TArhzfMczoLNlm9W8BMkaTFyidG7tT+znRpmrfxeywoIJsDEd7HPjkiu/9ZezU
         IHl17nwDWRzWgbF0UcckVwNFC4yO2DB2DMyyoQ5seyGJzpJozCeC2UyCxJZs6YnMxOSD
         DVUkoQX/NRwyO75mOXfk4aykTmnh5Xf02c0Ot2fvHxzgcNu/2C/XGEPVNv15atDLzclv
         Z3EBwzOodzS/jIHNKoZ3cQn6RdiYPafg/VgXj14mT/YKbWmWcPENv2b7Cdw86auy5QKz
         oXwA==
X-Forwarded-Encrypted: i=1; AKwUvBxVDoKzTbSNcwPGaHTZBZoBh4X3AXH1c/JZ1j55wkWuolq/udL3rMIO+nrndgXj+NBa1fggKtBKuhfOKxU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLC9gJciQbaRruWZOlW0RFK0k6XfYjVUAStr9x+RSlHYxytjVZL
	kKTJPsasJuoFcg4ygvunGhzTrxCxPzIp/Ih1R3II0e4//q1UEhHhsxbTTF5v6mRGrfY=
X-Gm-Gg: AYBFou1Nl1umJDpEcO9qF+zJ+tqBedPKWPgas9sHAnwG1ghoQ7/ssLZXoELozdk5ZAc
	2h2xFtwCmtmR1StZr7WLp/mcjZMiPd0Bd6ktJczT8f4c06ju/rCd/hikbMtMvP4FjqIFErjoU3u
	4Yxj0nF2spS4VgL232ud3WRwRUgCAZpLEgBJN3KvwvFXlNkD7uETtZi1sy2jSYbXfCzFpKoMS8v
	T3KYEMz9AllZ1lx98LhRlVoBQ4xUHCNxlr7MtDkOt/6sKt5F4MofpJhfHoSQg2twSoVYiKJhTtq
	ebdYdWhVmSi8N0P97VPnKiirzd7iYUmvfI1uHuGvlNlPKVjAHORK+jMQ/WL1AvxSIXPRgULmIPf
	/JzkH/k3xg0Yh6X/kz45vjbRYYivRjCYT1yhyp11WyaVT6FpX/Bc6207CDLxbBjYouajoj5FzJm
	LIkqebT23ozPLIOC9KMODA4fO+szoym8Da2KVgy0M8vWKEgvE97zXl783u/d7tYvZ9ZUzSKgt+E
	xKZVKvBpc1RmQjOzWp7yeCSCsmdmW9dbTAHzKcr5FqZeT/IpK4MV/LvQhpojDXYjBbWw6n3Fq/j
	WxpUcm8okDE/9A==
X-Received: by 2002:a05:701b:240d:b0:144:eb46:c3f with SMTP id a92af1059eb24-16a572659bamr17782878c88.2.1791860257094;
        Mon, 12 Oct 2026 19:57:37 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a6021e49sm34465316c88.20.2026.10.12.19.57.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 19:57:36 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: achender@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andy.grover@oracle.com,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org,
	gio@octane.security,
	Shubham Antil <shubham@octane.security>,
	sungbyeongchan <tjdqudcks0424@naver.com>,
	Robert van Eijk <robert@octane.security>,
	Paolo Gentry <paolo@octane.security>,
	stable@vger.kernel.org
Subject: [PATCH net v4] RDS/IB: validate receive fragment completions
Date: Tue, 13 Oct 2026 08:27:29 +0530
Message-ID: <20261013025729.40815-1-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rds_ib_process_recv() accounts every receive fragment as contributing
min(i_recv_data_rem, RDS_FRAG_SIZE) bytes, regardless of the completion
length. When a completion is shorter than the header-declared amount,
receive accounting can advance beyond the payload supplied by the
completion.

Only an IB_WC_RECV completion has the buffer layout expected by this
receive path. Other successful completion opcodes must not be interpreted
as ordinary receive completions.

Reject successful completions with any other opcode before processing
their length. For ordinary receive completions, require enough payload
to cover the amount accounted to the fragment before linking its page
into the incoming message.

This is compatible with the current transmit paths. MSG_ZEROCOPY is
restricted to RDS/TCP, while RDS/IB copied and page-vector messages use
full-sized non-final scatterlist entries.

Found during an LLM-assisted source audit and validated under KMSAN with
a malformed short receive completion.

Reported-by: sungbyeongchan <tjdqudcks0424@naver.com>
Closes: https://lore.kernel.org/netdev/20261006205204.1322102-1-tjdqudcks0424@naver.com/
Reported-by: Giovanni Vignone <gio@octane.security>
Link: https://lore.kernel.org/netdev/8a6ee1d5336ae65b8ffdc8c40a1135657207e204.camel@kernel.org/
Reported-by: Robert van Eijk <robert@octane.security>
Link: https://lore.kernel.org/netdev/8a6ee1d5336ae65b8ffdc8c40a1135657207e204.camel@kernel.org/
Reported-by: Paolo Gentry <paolo@octane.security>
Link: https://lore.kernel.org/netdev/8a6ee1d5336ae65b8ffdc8c40a1135657207e204.camel@kernel.org/
Fixes: 1e23b3ee0e94 ("RDS/IB: Receive datagrams via IB")
Cc: stable@vger.kernel.org
Assisted-by: LLM (OpenAI Codex, gpt-5.6-sol)
Signed-off-by: Shubham Antil <shubham@octane.security>
---
Changes in v4:
- Reject malformed short fragments instead of normalizing their length.
- Reject successful non-IB_WC_RECV completions before trusting byte_len.
- Explain why MSG_ZEROCOPY cannot reach the RDS/IB transmit path.
- Add the source-audit and KMSAN discovery details.
- Remove the author's self-Reported-by while retaining linked reporters.
- Leave maximum h_len validation to a separate investigation.

v3: https://lore.kernel.org/netdev/20261008124940.13371-1-shubham@octane.security/
v2: https://lore.kernel.org/netdev/20261007062135.49946-1-shubham@octane.security/

 net/rds/ib_recv.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/net/rds/ib_recv.c b/net/rds/ib_recv.c
index bd6cb3ffaa..aa50b85b0f 100644
--- a/net/rds/ib_recv.c
+++ b/net/rds/ib_recv.c
@@ -949,6 +949,12 @@ static void rds_ib_process_recv(struct rds_connection *conn,
 		}
 	}
 
+	if (data_len < min_t(u32, ic->i_recv_data_rem, RDS_FRAG_SIZE)) {
+		rds_ib_conn_error(conn,
+				  "fragment shorter than header-declared length; forcing reconnect\n");
+		goto done;
+	}
+
 	list_add_tail(&recv->r_frag->f_item, &ibinc->ii_frags);
 	recv->r_frag = NULL;
 
@@ -1004,7 +1010,12 @@ void rds_ib_recv_cqe_handler(struct rds_ib_connection *ic,
 	 * event is processed.
 	 */
 	if (wc->status == IB_WC_SUCCESS) {
-		rds_ib_process_recv(conn, recv, wc->byte_len, state);
+		if (wc->opcode != IB_WC_RECV)
+			rds_ib_conn_error(conn,
+					  "recv completion had unexpected opcode %u, disconnecting and reconnecting\n",
+					  wc->opcode);
+		else
+			rds_ib_process_recv(conn, recv, wc->byte_len, state);
 	} else {
 		/* We expect errors as the qp is drained during shutdown */
 		if (rds_conn_up(conn) || rds_conn_connecting(conn))

base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.43.0
