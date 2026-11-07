Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794020736;
	b=QNFdZW7A8i2UGh6ILeTuEj8lZisbsD453xpCd8pbu4c4T7ymAEvRInsyhTXNDepvyVut
	 NbT16sQaAJoLapm0l7GpEnBLEqoaGCYGSY0kAkd/HzqRpR2n6Mj9hhxFTkuT6/yiHrl3+
	 O2hZWkHFeel9un+aZzyMiAhSJrvYAIFEqFLUqFcESFPx2J6+mWFYQZchOUW9w7hswmq+o
	 /yTwTZcTtAWuXsd6n8I5Uz2mUEJoV5MiFKwMMb9/9DUu0xDL/SddUeHGnrQxC6OPeALiw
	 5C2JocQcYBztqafRcXOY+z1U+UGdOKGdlPufzHkn7f2j8aIHPr6Y2FBSKFaw50e7KQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794020736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rP1Yhc8V6RNptl8ZAiLhF4SuAftOJVbuJVVUglBaikU=;
	b=xkSflGYT9feXKQ4kDNHSG7BYCp5Hxfarg8m4JW3A8Ckejq34kDqFk3FYkVfRgLmomCde
	 KnZIQYkvWqBxPiOHJmhNYoptfC6cCb6x+8011Uz18wGwSjQJynsoP9w5hdF+4nvd0oE0y
	 Voh082/HV/GdVotDpRDuD1QDvsgKHlZqQxpu545PSQg/d4T0odNiSpCCh0OhEkjcJXL2P
	 lsyuLZiO9TbQUsPvueFxjVrCN1RukMslLWCN7ArUqjKi9vMPcZUCagYOD8IMbPLHKCozd
	 j/BhnQ+7a8ODn/4BUMP9VwKQSetq3eAYU9w103GMYYQDV4gWG52rnN0FOCSe2yZeVLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=LnwVBnrF;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EC3606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 03:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51EC3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=LnwVBnrF
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-716ea2598eeso734811eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 19:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1794020735; x=1794625535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rP1Yhc8V6RNptl8ZAiLhF4SuAftOJVbuJVVUglBaikU=;
        b=LnwVBnrFVKd4RmmtwNpC5ZIpYUQ3jidty2bj9aG30X4RnNmPVWvtRXkubIjjaFev8e
         PaUNsCLZIbiMUMitEH3IpDfAiaxnytnUnwoYmJnQzGiYfREvafWZ/dSQ2hFI7mcgairU
         p8CuTzrpbPrrSbBINfVDKpwHDcX7tx4rBpBCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794020735; x=1794625535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rP1Yhc8V6RNptl8ZAiLhF4SuAftOJVbuJVVUglBaikU=;
        b=d61vewDvj3A2scrXM7F1vUB1dW/WHDlqTje2fWDVz74XKfTXD5rm5X1P420JSPbOw4
         S285WBdJZuda1tajkzFsOlRpJ8a2um4qRgfs8ZGaYJwoodC5nTzSOr+DTeNQJ8u+WtLG
         PtQjjd8meVYqUfM+7VAQ70KUISVZ4gmj2dOLksufuiXrC1JJlSKY4WfbTLZf2IdMOM8X
         b5+XHOI1Ybxd4IDYZM42nzAsVByD3io8x6c7NcNNNox+/ZL+dbqTtxc1ZT34vamh+YYe
         DK4m6S5ZBhm0vLVoMWb1XiCTjcI95vqWo246TPVOtDplZKqzBhauju+1jAGArAoRR5pQ
         i9Tw==
X-Forwarded-Encrypted: i=1; AKwUvByN7IokxZKN6hgocBWcC6+LBkKARPxjYSA/Wbm/YH/8gCPp4FYsNFkP4RaO22PVYl+v47UqZubDBpEMKpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z95jgl8ASH+qHRFDGzOe8W1yWJ51wxTRWe/bkZzTGGmanMo8vEl
	5FZb4j+RxFIPNeGh9qkxXn4JUU/fpj5dDXBcacA9mz6/iHeUfSHOA2LNh3WwKOSoPfI=
X-Gm-Gg: AYBFou2F9Q/XVimIJqrXL4QWOMihXL4AtWSn90lab2y+j++o1pd75aKjOJ9mPA0O14n
	cCme/C/qVsOZR5b1W8ipeZXzSD5Mpzx5iZrtKEzZnrmu7IVHErZhx3SMbr8I39JTIMq3HeVcaAa
	uKxZ+5/z/vh+COefEaOVQhpxyYgBgo8pzZuKp1SX4gFYJTnXLuoObx0AsYCICjdHZVhVPHBpkR9
	dx9o5SPMq1Wtr3og2nWk2QnJf09hwn3LEQ0uVdAJBe/g4liQtL3INyY7JXk8x+f5LhX4ttRXuGy
	hjFj9SlEe736BWLmHORxTi7pBNhpSYJnETTv2RNwcsUO6nWCTw+mfQHdFA1H5s5nj5J8v07F5RG
	6V3ZNJ0et+RrLTPn07nqqF8L8T4btf7zA97DB3O+j2J/Rui92N8T+0twD1+GsHG37UUA/jRjkrF
	orHcKboqpAE0TRNuWRwFakbFybEVGb4Wr5KXdkyzSTVc6fUH7oN1n10ZG62eLql/DKcNoXrTC+o
	aPxYACLl0w4viTmIyPba0bSUmpoLkvjaeo2l3jA6m/JDNcACvvs+InawI9DDB37OLi1371v51gj
	gFcKW3d7pacGID8FHKYbFpNLVlCnkcp+pd8wM/zduch0eWN8NmEtpdnAcApXKJELvCv79FIsyL/
	vxLEpeFtJfMDvqK+etTjdDkhiMT16bA==
X-Received: by 2002:a05:6820:1621:b0:716:f44b:2dd6 with SMTP id 006d021491bc7-716f44b2f07mr1500290eaf.25.1794020735120;
        Fri, 06 Nov 2026 19:05:35 -0800 (PST)
Received: from com-75606.corp.openai.org ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm3581702fac.11.2026.11.06.19.05.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 19:05:34 -0800 (PST)
From: Kyle Zeng <kylebot@openai.com>
To: linux-sctp@vger.kernel.org
Cc: lucien.xin@gmail.com,
	marcelo.leitner@gmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] sctp: avoid requeueing pending control chunks
Date: Fri,  6 Nov 2026 19:05:32 -0800
Message-ID: <20261107030532.32310-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

The T4 and RE-CONFIG timeout handlers take a reference to their cached
control chunk and submit it through SCTP_CMD_REPLY. A previous
transmission can still be on the control outqueue when output is corked
or suppressed, or when sctp_packet_transmit_chunk() could not append the
chunk.

sctp_outq_tail() then adds the same list node a second time. Re-adding a
non-tail entry can corrupt the list without being caught by the
insertion-time list checks. A subsequent flush or association teardown
can access an already freed chunk. The ASCONF path is reproducible by an
unprivileged SCTP socket owner in a user/network namespace, with KASAN
reporting a use-after-free in __sctp_outq_teardown().

Check sctp_chunk_pending() in both timeout handlers before taking the
extra reference and issuing SCTP_CMD_REPLY. If the chunk is already
linked, leave the existing entry for normal output processing. Keep
the remaining timer and error-handling commands unchanged. This also
covers RE-CONFIG retransmission after sctp_assoc_rm_peer() moves the
request to another transport and starts its timer.

The issue was found by an LLM.

Fixes: 2e3216cd54b1 ("sctp: Follow security requirement of responding with 1 packet")
Fixes: 7b9438de0cd4 ("sctp: add stream reconf timer")
Cc: stable@kernel.org
Suggested-by: Xin Long <lucien.xin@gmail.com>
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
v1: https://lore.kernel.org/netdev/20261030042321.74407-1-kylebot@openai.com/
v2: Move the pending checks into the T4 and RE-CONFIG timeout handlers.
v3: Drop OUTQ_FLUSH and use the two pending checks as suggested. Leave
already-queued chunks for normal output processing.

I have a reproducer for this issue and can share by DM.

 net/sctp/sm_statefuns.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/net/sctp/sm_statefuns.c b/net/sctp/sm_statefuns.c
index b2f609f177fb..64519fd8f943 100644
--- a/net/sctp/sm_statefuns.c
+++ b/net/sctp/sm_statefuns.c
@@ -1122,9 +1122,11 @@ enum sctp_disposition sctp_sf_send_reconf(struct net *net,
 		return SCTP_DISPOSITION_DELETE_TCB;
 	}
 
-	sctp_chunk_hold(asoc->strreset_chunk);
-	sctp_add_cmd_sf(commands, SCTP_CMD_REPLY,
-			SCTP_CHUNK(asoc->strreset_chunk));
+	if (!sctp_chunk_pending(asoc->strreset_chunk)) {
+		sctp_chunk_hold(asoc->strreset_chunk);
+		sctp_add_cmd_sf(commands, SCTP_CMD_REPLY,
+				SCTP_CHUNK(asoc->strreset_chunk));
+	}
 	sctp_add_cmd_sf(commands, SCTP_CMD_STRIKE, SCTP_TRANSPORT(transport));
 
 	return SCTP_DISPOSITION_CONSUME;
@@ -6197,9 +6199,11 @@ enum sctp_disposition sctp_sf_t4_timer_expire(
 	 * chunk, it MUST be the same (including its serial number) as the last
 	 * ASCONF sent.
 	 */
-	sctp_chunk_hold(asoc->addip_last_asconf);
-	sctp_add_cmd_sf(commands, SCTP_CMD_REPLY,
-			SCTP_CHUNK(asoc->addip_last_asconf));
+	if (!sctp_chunk_pending(asoc->addip_last_asconf)) {
+		sctp_chunk_hold(asoc->addip_last_asconf);
+		sctp_add_cmd_sf(commands, SCTP_CMD_REPLY,
+				SCTP_CHUNK(asoc->addip_last_asconf));
+	}
 
 	/* ADDIP 4.1 B5) Restart the T-4 RTO timer. Note that if a different
 	 * destination is selected, then the RTO used will be that of the new

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.55.0.openai.911.g06873a30d2f3

