Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559227;
	b=e/2LWwxRL+IWHImswfaJ2S5VN5WgjslaXwtuP7m9pOvhy4ngXuHN91GHNDXT/wqPRW02
	 Tj0SB4bSliF4oIBvLZs1sjEoxQvo1DPC7CTnL8xwREviz9oQIgzWI6fjbq1Fvst16go2G
	 oHFNPpU7DXojquXMXdzE8kXyciOMcHNsMNEuz5HPkXmMWsyQuThaQUbebruPCwRY/6dCB
	 IZy12kCka7OeO7Q8yWR3TQNRrpL8ngBrZtwhqBdxkIXLSuzV9q+LGNY6hr1922ohxPu+7
	 Ax/kgIpkJJ/faoOePaz8KUfaRY3eWBjziWgryb0Zo51d/Fki2yy6SnfCbNZ2o1e4NSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R0nrv620IQZ/22wegrLOV31hxsjt1XF7G7GYY2hu98s=;
	b=PwqrMkfBifSbByDACOaYAzG6vkSh9MbdKaWHGAEd7CGB5DJsiZXIR2rdDDS3su21cAMq
	 +gOCy2oion25ce5MIfLbErZYSqG7ho/9Gt+7qKAfalYsTCYL8WOnZvXmPr96RSVQNnZL5
	 BBTuIdH5mwx6uoDKf/7fyWcCjmz4H81v+AUGTVIMTlv+MpUYz8603DgZc193kkcobeORl
	 I/7fWr4I4Tuzkw1/A6m0h+vxgKx8qP4xWFyp/Un5ECLKVtQqRZ/vwE1u249m/XmgH4hFm
	 1KUQ1kRP+qMH1cvmWQjOuVGjlsHqgHKXkc9ayqYOzIOyp68EwC8sFBg4wAczJoNKKuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WMW3oCUZ;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEC9606A8A3
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDEC9606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WMW3oCUZ
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so278082a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559226; x=1795164026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R0nrv620IQZ/22wegrLOV31hxsjt1XF7G7GYY2hu98s=;
        b=WMW3oCUZ/rAbrvlxycYpeBLVSzfh2TLgjVIcTTWk0wKtre5oqsAU4oz9pcN6quLYki
         EU/bMMfcvEgcttMb9KZqWf3fu9f5+JyBdDUffJwHcSWVoQzx4x4aibqf2XX2cuWGlEVN
         jHg+RH+23I1Hwne/9x6ygIJUDwWrX8IAll0CKyXc4bjsaWYGh/v4cEvlblf11+PRq4TG
         aOQ3JKy/k+k1L3Jfm5IxA1OIUtrFHzONFmzEA8ZZs40hWUFED4kxkbdRsSNOkGpv+/aP
         ve2h2AkSK1xNt6f7GxVjbdv/44T9tB5GaQHXLjsduAhQNcgbD9fUH+finDFVkUy23xTR
         B7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559226; x=1795164026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R0nrv620IQZ/22wegrLOV31hxsjt1XF7G7GYY2hu98s=;
        b=W0PQxQ/1RSO1LbSgEfrwNJi9u2sikLT59BQOMpzTtGTRQvekadaXNLkGNcIPfOVyU5
         PGker3oLERFf1+edptbOhd+B20peD4OQ//6iJ713pLENItR+sgvA9ikHrgUCRKQq/yTd
         VIr1tp3nb44Li0evtLDYiPpRXGGQZhetCdb3k2KqXmH36Jd7n1uYrvlqpHBIcGjl0nJx
         qh4hOoJTUVGXb3NgK/a43gsZN70FUd3eHSse/2Uw00o36Ia7KvgdjRcxLesJsud8cGDI
         lwpo99GBq2XA+46Egm2PU4NWLnPaQFAYQIHXPUSQ4SYDFYFLYZ6r5z3fV5hzGrkEOa6Z
         a+AA==
X-Forwarded-Encrypted: i=1; AL+hErEDfECK+I+zLYZ/sdId2fEXBDmoB59kiLQ8O16ev3R9IxujPhw+ZVBu2MtlgJLkUx34nNTwmsLkKyOowlg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BSfGDDhYQhDlStucT+I4u9ffsYVQBB7gKjvwcQ2ucAX1HL6Fi
	WHIE5jbY+AIGn9w4H+wTrHovACyhjvTdkGDbtknX6bQ9tbBAuyp49xvD
X-Gm-Gg: AYBFou2cEjr96Dw14bJ+hSokbZM6r7gJUMFZ1SV6oglYw7sszbbsU7XrduXVPwb22uc
	Rw9rzmiGSMKMMHoYkRtMPXbpWnXQYCc47w6eq1GIkny5pJ7sGzErN34OkedWGJU2Ch/x7SVmrVy
	uFq+AvPaZHlgi30u72xOf15OguJliok/1wxPSLthUrlIc4L90NKX4eHM49BfEanpPiOo/EvIW9O
	b8ubeH6BDE/ZLQGDrXzIlzSYsTBoAwtXHAvUzTZgFgIuw+vfU2jsWpf7nHIYZ5w+yFcaMP7S0XJ
	I8a+0uA8fWc3o3JRQFzCzAX9cndd3uE+GHXTuYEQYcXeHTdbF/p4OopQ1gRZ1WwH/n5dddcNukr
	lgISICgKLh/TUZwdeOJzO5vKUZUTYRmbw/MaL/ewA2N3LcYy73C6+heZB9cp4E9KE9G+lRgtlLO
	eBs+OfjqQfHNmH8uknpNcEVKt4eVpaB9tEkQKjKgyratLSoMdTJAyW4JrJQrsCaDcr5k/Fy7kBT
	YbTYVWFPdndjObtW0EiYvvkWFqgOpFQEk8h0ju/Qo10U+9IZRWS1UeFNp459F4guKwz3qlwfgc6
	IiOttR5X5x2pxqdu4XSxkBNMYgAmA/vbOxQzbSvBXw==
X-Received: by 2002:a17:90b:4acb:b0:3ad:6090:a189 with SMTP id 98e67ed59e1d1-3b1b0b67b18mr1705922a91.45.1794559226059;
        Fri, 13 Nov 2026 00:40:26 -0800 (PST)
Received: from localhost.localdomain ([183.62.176.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b25a365asm1264855a91.1.2026.11.13.00.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:40:25 -0800 (PST)
From: Yong Liu <pkfxxxing@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <mkp@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: [PATCH v5 1/3] RDMA/srpt: Initialize commands before returning BUSY
Date: Fri, 13 Nov 2026 16:38:40 +0800
Message-ID: <20261113083848.1517595-2-pkfxxxing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113083848.1517595-1-pkfxxxing@gmail.com>
References: <20261110030809.913063-1-pkfxxxing@gmail.com> <20261110030809.913063-2-pkfxxxing@gmail.com> <20261110052827.963143-1-pkfxxxing@gmail.com> <20261111065342.1282709-1-pkfxxxing@gmail.com> <20261112094138.1390409-1-pkfxxxing@gmail.com> <92a82300-a454-4ee5-a191-0ce5a2ee58c7@acm.org>
 <20261113083848.1517595-1-pkfxxxing@gmail.com>
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

srpt_get_send_ioctx() clears ioctx->cmd, but descriptor parsing can fail
before target_init_cmd() is called. The error path then calls
target_send_busy(), which dereferences the NULL cmd->se_tfo pointer.
A remote initiator can trigger this by submitting a command with an
invalid descriptor table.

Initialize the command before sending BUSY on descriptor parsing errors.
Do not request an acknowledgment reference since the command will not
be submitted to target core.

Fixes: 8b8807b9e982 ("scsi: RDMA/srpt: Fix handling of command / TMF submission failure")
Cc: stable@vger.kernel.org
Signed-off-by: Yong Liu <pkfxxxing@gmail.com>
---
 drivers/infiniband/ulp/srpt/ib_srpt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c b/drivers/infiniband/ulp/srpt/ib_srpt.c
index 43c3ff1ad8..127f256c6e 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.c
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
@@ -1597,6 +1597,13 @@ static void srpt_handle_cmd(struct srpt_rdma_ch *ch,
 			pr_err("0x%llx: parsing SRP descriptor table failed.\n",
 			       srp_cmd->tag);
 		}
+		/*
+		 * Even on -ESHUTDOWN, target_init_cmd() initializes the command
+		 * so it can be completed with BUSY without core submission.
+		 */
+		target_init_cmd(cmd, ch->sess, &send_ioctx->sense_data[0],
+				scsilun_to_int(&srp_cmd->lun), 0,
+				cmd->sam_task_attr, dir, 0);
 		goto busy;
 	}
 
-- 
2.43.0

