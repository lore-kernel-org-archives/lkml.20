Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792892293;
	b=msF6u82Ln/gq+k1K3RCj8WUJfhn+IG68JnBOkK8XQBmbdt9qcXKERFz96JjdumwX9wp5
	 8txPxnYLd8Zd297ApsulgVwKcIm3fDms6K+shAyg+/NwEgOUmfzbJJdo1q+A99xR+5Q3l
	 lQ7AaSSA9zFxV6u60p1Ux00DuYkNgXnWSmIANajA/OduQtwKODBZJ+JMTdjt+YvH9IO5S
	 rERWhNT1y+rR+mf/9YFUZAsnzaG+fG649t2rcl9DCgVo107NCc9kXC8b5L46A8uwJPcxu
	 8HDQ4dtrnxbldhN0L5t2CRM9cFz1f4Y2PtAeEht16Vb4SKmGX3TNZMJIV7u84iLr+SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792892293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dyBv9Dc6Qhx1XOQaA7oqdIJfObyTsj1C7Q26W9Ag+os=;
	b=mXDP7yMvD3OOXO/2a9inXryOyg8Z+KuDSJMuTcLHotsl8n6t0WLmbbJmIQcM1qGwHpqU
	 Dy4SEojezHs+JOIQVHW/uI06cp0yhXUNPyDy9i8oVnY5dtTL2tzAnxs78lE5HjZlcaFTr
	 xtQiYt8crGzDrKXmOkLAmFBsZvUNp7d12W3TKCF0qkp0I+tTrfBbwRGOdB/C8K/6o2yGM
	 TROPXWg3fxIcXV4d7YDj3K3Zmcm/yVP1ff1fYXM7Ae0Vl+cPglY62T2bE4yXWVo8dV2DU
	 +PpPbIOoELOEeKNU0F3ZX9ABpf6rP/w6lJxUdcNERFtZ9IYvTt7GhgdkYBBEZHhJokA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=iQHI7mA7;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568F7606A328
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 568F7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=iQHI7mA7
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so3193265eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792892292; x=1793497092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyBv9Dc6Qhx1XOQaA7oqdIJfObyTsj1C7Q26W9Ag+os=;
        b=iQHI7mA7+ZzOl9CK0wtM3zFhG196uutFD8us38y2LTGi8QugKaq2lzH6OukKW9FGTM
         misApk5qzZFKUhZo8t5MWvifMvUMyOfT10FQBGQ/OFe4rBpJdEk+OCqn3aLovyWiszmn
         2FTg5YCDH5ndZazMmzgTwtOylV1NFVyRCeJ8edC5fqTZ904MTHeUmYctHSXGtu+xTblw
         z5c8CULHZYO8Sbwu/mZ68/jwBq91jem/Fl2DBqpR6s4VVYqwSGxpfDnSKTupdXSu0D37
         mmaw3E14HbQneLYcjm7uJppGomjpEXWLXbdaK7uUKQNcMqYlEL0nzX40P2oIK3Xsj9Eg
         BdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792892292; x=1793497092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyBv9Dc6Qhx1XOQaA7oqdIJfObyTsj1C7Q26W9Ag+os=;
        b=GCHYkatLhCRHkMHF7NWSFezJSa5T4pcjiYgTG+hw3wQJFnc6vH/BKsrT8ss6X2XVcc
         BeDQ4e2hcq+3w6/VCYWojPMxbNLoN54RKtpcW+LCdJ4oYO8IZBA30xSt4yCL/6wQsPYl
         RttJMgkEpNohOENsfz4/gQ3LmibjWHj3kL01SsCTfP5Ogz+Ue59WiHUAo1DSuN7Tg0lM
         xnxbwl1nolaN2HL4EuNvRHDVrCby/mrHJidxodiWxrWmiv+FgrSWvXpKAdTJweqhE46b
         WYNbrIkfcXwQ6vBz/pZXvFyljji/+09MxeLJGK3JvMsCetf85yJQE6BItN1D/HkTmibY
         pJkw==
X-Forwarded-Encrypted: i=1; AKwUvBw0gYXTP/qq6C6SuyH/UDZTqTgWMRku5u1h0otYKMJvN3lcQrGyxeajzdv00DXYfyslH6aZdwFBknMm+mE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRXzHiUKCMKYECOSXKzEBPHqQ6QxqVmz3kmlFu/CA3raaqhOJP
	hjB/O8TrKqIQkpLbre+/cOMaqg6sSN8BBYy88pGz3Y47Idw5Gz/kNuoZIav/XIHTruk=
X-Gm-Gg: AYBFou3Jrzn+guQ7RQZdvY37mLrw6SuM5667uKH5JQVvQrybiXE/6/8eHohCbSmRoWY
	2gT88jMBdOXGzrQIanMZNMLoIm4LTJAW49MCIK/QWIC/dF7FsvmnXsgDnmrFUtHJCN4VsjoMEzl
	xVC36K0BxuceNBx8hqla2Pnhdm5Aw6zMlwZtsql4QN0QzddOdha70LAsbqBjvgaW3BBUT9ZRLCW
	IMG43Pykb0CD2iE2bvNPMNSdt6hagkGUqGXDhAZYWN3ks3Oe0dFqbPQ8iOtdrDVeAfUB/4O0pbx
	3rqff6aFh2k9ALFgl0SGDrOohp4SMBdmD7P5W8p/oYAjv5rhwI2SB+/Voj+RjVXDCSRCtm35uqQ
	f1FlCzk0gLL+gGUSFlbvSxwcp1wDe5KJr6VcuzoykeNstPCCU65cXLVUlnlF3fmTg232yYdD3YI
	ftyCp5zF9xa2jewPPbIKhV8FH9qi2h3KBQOvFzGeqnO7sIKj4aGhJ2/zpSNSnZg2oUguVCxRbFk
	IEoWBgMPKw1B9fbz7Z9PW1B/K8ty4tjgwWxTeEK3bpOygq9DPzcC5f+zJnXo+qvz7BXc6qGua5u
	hWn3rCsl4KgDSmxXg/TCTtcycqBpneLQszgIwRHHDl9tQW2Iff9DQSG3Wr7jdKmSJg==
X-Received: by 2002:a05:7301:4711:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-369e84b7d3dmr5194521eec.14.1792892292449;
        Sat, 24 Oct 2026 18:38:12 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:dba3:be57:a674:a67f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8dbaa42sm13724329eec.21.2026.10.24.18.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 18:38:12 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v5 3/3] RDMA/srpt: widen the indirect RDMA context counters
Date: Sun, 25 Oct 2026 10:37:48 +0900
Message-ID: <20261025013748.3755639-4-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025013748.3755639-1-yhlee@isslab.korea.ac.kr>
References: <20261025013748.3755639-1-yhlee@isslab.korea.ac.kr>
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

srpt_send_ioctx::n_rdma and ::n_rw_ctx are u8, and neither of the values
stored in them is bounded by 255.

n_rw_ctx counts the INDIRECT descriptors a command carries, and the count
guard in srpt_get_desc_tbl() admits data_out_desc_cnt plus
data_in_desc_cnt, so up to 510. At 256 descriptors n_rw_ctx wraps to
zero, and srpt_release_cmd() frees the contexts only when it is non-zero,
so every scatterlist and RDMA context the command allocated leaks.

n_rdma is not a descriptor count at all. It is the sum of the
rdma_rw_ctx_init() return values, which is the number of work requests
each context needs, accumulated by ioctx->n_rdma += ret. A handful of
descriptors for large transfers can pass 255 on their own, with no
unusual descriptor count involved. A wrapped n_rdma is then handed to
atomic_sub_return(ioctx->n_rdma, &ch->sq_wr_avail) and tested by
WARN_ON(ioctx->n_rdma <= 0), so the send queue work request accounting
drifts too.

Make both counters int, the type the values they accumulate already have.

Fixes: b99f8e4d7bcd ("IB/srpt: convert to the generic RDMA READ/WRITE API")
Cc: stable@vger.kernel.org
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/infiniband/ulp/srpt/ib_srpt.c | 2 +-
 drivers/infiniband/ulp/srpt/ib_srpt.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c b/drivers/infiniband/ulp/srpt/ib_srpt.c
index dfcecbe3a47c7..a2af0882eff5a 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.c
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
@@ -959,7 +959,7 @@ static int srpt_alloc_rw_ctxs(struct srpt_send_ioctx *ioctx,
 	struct srpt_rdma_ch *ch = ioctx->ch;
 	struct scatterlist *prev = NULL;
 	unsigned prev_nents;
-	u8 n_rdma, n_rw_ctx;
+	int n_rdma, n_rw_ctx;
 	int ret, i;
 
 	if (nbufs == 1) {
diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.h b/drivers/infiniband/ulp/srpt/ib_srpt.h
index 506c11b843593..d9061aa65c1a8 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.h
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.h
@@ -223,8 +223,8 @@ struct srpt_send_ioctx {
 	struct ib_cqe		rdma_cqe;
 	enum srpt_command_state	state;
 	struct se_cmd		cmd;
-	u8			n_rdma;
-	u8			n_rw_ctx;
+	int			n_rdma;
+	int			n_rw_ctx;
 	bool			queue_status_only;
 	u8			sense_data[TRANSPORT_SENSE_BUFFER];
 };
-- 
2.43.0

