Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040443;
	b=0N5lZ1oR3M6tZTTIJpszrpDS7seOjsIzf5A3OTlIGn61rM3G3msbOb2STsI9LSBHc+sY
	 bXJDD7MVhQ14TL72P45PFSfwBeEwUiiq7yFxMI4Cwz73MnV0J4l7WTY6bV+M3tnoHxtmw
	 2tlTa9NJ4rlQDJYcRn1xuBile0Jj0SodG3BnHnDExENB6jIhcSdOi9rJhO9QcuNfIjMLp
	 kbwlRVr/EC4GvDfGQABe1Er+ZwaX/v7CMZSDqJ/ncQxWKJnRA3Pkl25b2oPOuPuvHhLHE
	 DhW+3mH2tqR67mSCOFHwtu5Y8w3eY6PJCOanUDS3ArPGF3i7c7HNmZ8BeH5KZIBB5Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=04ZAW9YYQFyNzmPB2rE27kvKEWlMN6ldEO2+3cJbpTw=;
	b=qXSpVQ8ATlorSznpUKCGW8wPlQ38fBQzqoh7jdFEQlxuzk+R7k01wAyQj8eQEo5ZwNZo
	 x1/69dBy4RdouTyk3Ff2dv37b4e6HYE0NuRiBV1RybPEpp/jU85CvHLLOVE1Vc74qb8/w
	 fn/csF7HeqrUzXBoUmP4A4lgeGiP3QJjYArZyF02jhtqfu9bbEQMoyUflueyOu8yD6sHB
	 PDP+yCeABGm0urxEnYP9VzyChNSrbz1weKjuk2+9d49KP5TJw05CzM/qK3uu9icEymbLU
	 rVgnQCyclq0Z4bTPexi4nQ1zdHEV1ftKp7VUOIU/oAwRULOB1+mc+UDihOUNmXG/R3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NZ9ICBZC;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD01B606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD01B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NZ9ICBZC
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9906034086cso989619241.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793040441; x=1793645241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=04ZAW9YYQFyNzmPB2rE27kvKEWlMN6ldEO2+3cJbpTw=;
        b=NZ9ICBZCzxW3s0bk8FGimW2otzmwXKaWj+IXpTD0jbmKCvC3iKgcNTcDl9anOiHUSR
         faglWTNrbN1hTKt3WTnlwfrkJmn8n9AmHm/rG4g5L6nUo/ZclQui9g+RIuBE9bJyyet/
         +ddp2yVbY156sUrl4gmnmZ6D59yjQBi2NpTzYqc0/8pGHomOL93/iItySIbWJDSfzbSZ
         I3E6bOpbXlJtMLUdWuQ3toO/Z68IO5wjviegG7PQ4eRNjDd91/4LdlRptm9GAPbxPmaO
         b/ohGulISh6l3v93HbLQ2VSIEkkNlpCOeQ6jzgyPBket9ifYu0vOv5ypWPnVHJDnpOHV
         yq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793040441; x=1793645241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04ZAW9YYQFyNzmPB2rE27kvKEWlMN6ldEO2+3cJbpTw=;
        b=eINanzO/hrvXW3Y/Q6HeBoPkAHnWjc3FYU6QBkKIF8pviTMpNqM5DlkpvWRWQ+hemP
         FSaveR2jW2gdk3KIRRtp+OCqaAq4ARZ/FHciLdIq6pynDhwcDN122fAIc0tMELZwqPWU
         D/aZGYactHYqtRruhbRaVZkjHlOWoJp4MQ04EVsyRz/yxWKl2oTNpnH0dLlsIsuSJJMw
         8f0wNs45EarYBXtxW+rGYsNvxlxswq7hKPLY7wyD2uP3qMNyhY7DfEgkRkF+vKm12P58
         WbKgZaEQFyotCrC7g8swlwTjF01DRsGquBX8KRTtSEd7s8SKxtzl1FyDwqzielfDTQGY
         TwVw==
X-Forwarded-Encrypted: i=1; AKwUvBxYVGyo0FWZJ8pKY3Y0PTkiUVb6Ub1EJbOuVy5jyoBCHx0YzixQfgIRNue/QjNpQNSjElr4yhUfRVXxT6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmbzi/w6A5jF5vKQ/TwPVG1iy7+V5G1gKEIrNr3VpyJcbEUOeu
	Nc160WjHRL4EF/uOUVBwKjDeJKCPU7UMJkSUT77Foj+CzPmJWAR8lEoz
X-Gm-Gg: AYBFou2QSMcwknfhKHHyExNau178Ox2fpWOW4KhrAZcNSGu8k0EGTylw4tKS+vFyBV6
	qmxFTrkypheWD3hH2CvatGqYqJiSxFU9BFoc53QJ2N1qxOydQ1GPERtO7Slgdg67UvCqS5WO7Wj
	YU9/5MuNnYPHMR7WV1Xst8YCgxQCyKR3pVpH+/iwuGcf3h/wiQD1VYf1O7/pjISPCuDWbsAEutm
	QYtlFlo1yUcsdfOShyCwXHtz6HX0dPULWUOwOegepN/eduFxJS/gbNNXll40FIx07/Ip9IP+ajZ
	gf1EKjtTa0PyOe4n/rnTIcwbO2fga9dN+c47a7eAwyk5KnviR/yrR0lJj73hifpNMYSCwV6wSZc
	0S5TnaxyZ8/DdHM3+e6LyETcNFB27uEJyaB9BINuC7s8t1bUmaiEu+EOxs18pXeD7Uq8V586hUz
	JevUiGvR6jjp0kJi9mr8fmikyDG6dsk1rtCwq58g7KeHhpJtVnryuubFeNtTGnrgZoiEiTiv7Pw
	PZsj7DfT5A5NSvGTN/tCCqZNOJrYwHxG8qaqfz0lxxBYzUN+yYgZiaW/szvoh/+yj0=
X-Received: by 2002:a05:6102:3e89:b0:7cc:2b48:cb1b with SMTP id ada2fe7eead31-7ce5ce76692mr2747252137.35.1793040441466;
        Mon, 26 Oct 2026 11:47:21 -0700 (PDT)
Received: from bridge.. ([2804:14d:ba6b:8339:9a5c:f039:9435:df2a])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-991259c3067sm101634241.5.2026.10.26.11.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:47:21 -0700 (PDT)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	hare@kernel.org,
	sgogte@purestorage.com,
	wagi@kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Subject: [PATCH] nvme-tcp: fix request PDU size when header digest is enabled
Date: Mon, 26 Oct 2026 15:46:21 -0300
Message-ID: <20261026184621.29276-1-christian.aurichzm@gmail.com>
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

Since commit 61b0ed3be81b ("nvme-tcp: parallelize I/O queue allocation
and startup") the I/O tag set is allocated before the I/O queues.
nvme_tcp_init_request() sizes the PDU with nvme_tcp_hdgst_len(queue),
but queue->hdr_digest is only set later by nvme_tcp_alloc_queue(), so
every I/O PDU is allocated without room for the header digest.

With hdr_digest enabled, the digest is then written 4 bytes past the
PDU, over the header of the next PDU in the page_frag cache, and the
target drops the connection on the first I/O:

  nvmet_tcp: unexpected pdu type 159
  nvmet: ctrl 1 fatal error occurred!

Queues that a later reconnect adds for the first time have the same
problem.

Use the controller option, which is what nvme_tcp_alloc_queue() copies
into the queue.

Fixes: 61b0ed3be81b ("nvme-tcp: parallelize I/O queue allocation and startup")
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---
Based on nvme-7.4 (aaedcff90148).

Tested in QEMU with nvmet-tcp over loopback and parallel I/O: with
hdr_digest the connection failed on the first I/O before the fix; after
it, no errors and the data matched, also with data_digest and with a
reconnect growing the queues from 2 to 4 (attr_qid_max).

 drivers/nvme/host/tcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index f876375dffd2..7733aa092544 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -566,7 +566,7 @@ static int nvme_tcp_init_request(struct blk_mq_tag_set *set,
 	struct nvme_tcp_cmd_pdu *pdu;
 	int queue_idx = (set == &ctrl->tag_set) ? hctx_idx + 1 : 0;
 	struct nvme_tcp_queue *queue = &ctrl->queues[queue_idx];
-	u8 hdgst = nvme_tcp_hdgst_len(queue);
+	u8 hdgst = ctrl->ctrl.opts->hdr_digest ? NVME_TCP_DIGEST_LENGTH : 0;
 
 	mutex_lock(&queue->pf_cache_lock);
 	req->pdu = page_frag_alloc(&queue->pf_cache,
-- 
2.43.0

