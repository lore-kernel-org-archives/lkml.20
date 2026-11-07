Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794025087;
	b=JOSoCl+jVQpgfk7ZRzA611LgOUmvA9PizkxjtcJUTOtsqEfk29B6tqobT90swOOkfcy8
	 NXYffr+peGs8Cd2N0Y/Ni9aIr3JMkO+29uOdTPY9auU77fv1xVyUH1gAYa/p9VTjQ+cxT
	 ZzJ+8w4v6OO3xqr9tTlnr+gpTjBQLWSOBPZ+MZgyBe7HKLGZ7JC4ska70v+y30II1pP/l
	 vJUhiraQLNs0OWUFmnkR63y9OKnJwczhJXEU+UANobg5DXlhfCgCEuJIUki0BZybs4Jkz
	 C5d5FFAi4qNTFTi2oouuvm+EcbG4aF1j13eTv4hE80VIx5KwQadidT1wkmAjXIbrStg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cuN/Wu6kktf8GRN0frnHoHZPEmUKd7TSmOYwdClsOmA=;
	b=q6qUmQQ3CEE3lhJzAbdRSNQvvPpmqVObWl3Aw0DFLZcyTZxUWxr/2uFWoBG2RnscNslN
	 g+7PP9aYMqwRD4v64Mi9hMsS3mjoobzyioA0s8cjXk0MqbYjV5QvrrrcrJsD5InSg3BV+
	 BN7M2kBmkIS0UPNVJI8F/k08wJyNmk7E2cI16yGbjmRRaNHBzhc6SLo/iQUJY0S99ffdh
	 /gTWgiLiyU4cbZRDGj3VKOKUpbZl05+dL+Ij5dxaylTmYFtzdX/UsRbNU1Hw3OD4DN4qK
	 5kmA1qQ5B+Lr7qVyipXmYGChoRoQQUralakqEfGMlxUpLTvLUOKYd1F+X+FnaZ8907A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b="aSOI3z/i";
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A49606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78A49606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=aSOI3z/i
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-825b40f8a26so557899a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1794025086; x=1794629886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cuN/Wu6kktf8GRN0frnHoHZPEmUKd7TSmOYwdClsOmA=;
        b=aSOI3z/ivB3dLGUeIFD60/qU+RZHCfSGJam7HUGnDYE6+Cxb0ESvpaauNmGnAy85CX
         fWEwhNdKw1xAwlpNmPmGfbJ2wb6OWAgDmSJVVbVTd++//Kf1luBFiIOGzM700MLMS8gK
         72gMqOTQ4KOv69G1T6Uk6xESdIEbXLQUQpMzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025086; x=1794629886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cuN/Wu6kktf8GRN0frnHoHZPEmUKd7TSmOYwdClsOmA=;
        b=JQdxr9slzRcCDqcvA+mZVaxKlmwiOOC+2Ci2DjzRO9pTNAhV6aaepdy93ngTlUM8vL
         uHZ8VaAY5QXWKD5ZHhjfrhyKLA43Rwlfdjl8QykYpf/D2ZX4jxSkuYvb4PN9zD67h+5s
         WkwYti1rtWCLeRbE1IWOgQnXGRj1xR3VZYXEmcHm2E8Dacbf+Dfb2hFIb89riZvtvZnw
         A908bNLzLXOBlemF0dxDkuVBU8MkiJts85pgnWHq4ajGgIvrjxzDnnA8y5FlGshxhVmr
         Ws5yj2R8t+nG7+NYGB4XFA2xu/N3/muyHr6AIg1PCczgSNzBw7rsZUm+qwpeTgnPRa9C
         /NrQ==
X-Forwarded-Encrypted: i=1; AKwUvByBHQI2zgu3pz0LzE8bDdyr7Um6Kq2OUN4n1R+Y9IefsPw2gWvDcx8iy8LPfgMwTxI1Nrv7sUO7bwCD00o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2OGxix0BRxZ5xzDW5OssTCiNNjCU+pIeSZ6/5EEI9nn+e5w10
	0sVSh59B0+sr2KKeoDyOy7Sc95HLzniJPaqAQD/a5uI5Kuh9dfDEKEMY8wyQasaUdOw=
X-Gm-Gg: AYBFou05+jF0BAtiQw6r8QFame7KBKMGK8srsnz0myg2yQdmj06vNJVtGpRFpP+CNjB
	cjWQeh0hWLie/ynrY0F2nlROqukGE/R6O3VLV7Ls/493doZDtOvY73HRd0n+tUp/jwhSjOdTNvq
	h+P4V7zai9M7Lmjih2FLTRJ6VDlcGSEjgWlcxJJji3OfV3qayvnToLLvDRQAslNhnfACW1LCc1x
	EnYA9hnacCHFoP1GnLUgGTRNqkAlQlNzdnm+yGa6RQ/wcDyBXb4zwnfsIv8QxHlHunpFRhv/Fg1
	RL+6+nylcw+p9OOzsh844BKpQe7l11uWjCtZqJf51LgiCBQGEi7l/CtCK4gkiShEsCNPv80twm5
	wrzabUVPCNmoNXleLhQZDVE1TzhJpVDEoi0W3bk+T1MHlUlj6HOFXq/sYH3+InF+d2cuVJxd51Z
	swiLfLz1o6TSAAzvMeONBLLmxcuPdWpIQel0vhKqHCy9zVbKNp9V2FWILtGFCFWXE2XFFRLHVSd
	M5zVDYkIwzyEaCSQC4knJlryCR0HclvGJEC66iWJioo2chyx7qU/lB7SUSh12r/EBnMqRyH8zvQ
	hsndISr2A38V7wd0UFGSYnY/7OTRRc31+aL36pAbld7TdY6eRHANdlM8ZxbYjd7mE7ZnaBOyjkL
	/m+7NqLTa+ki4lkg/opBaFHN0P/eWxQ==
X-Received: by 2002:a05:6830:2315:b0:81b:bfb5:26cb with SMTP id 46e09a7af769-85f1cd702f9mr4751617a34.3.1794025086363;
        Fri, 06 Nov 2026 20:18:06 -0800 (PST)
Received: from com-75606.corp.openai.org ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1d951a8csm3575210a34.3.2026.11.06.20.18.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 20:18:06 -0800 (PST)
From: Kyle Zeng <kylebot@openai.com>
To: linux-rdma@vger.kernel.org
Cc: achender@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] net/rds: Do not unpin a page after a failed atomic pin
Date: Fri,  6 Nov 2026 20:18:04 -0800
Message-ID: <20261107041804.64213-1-kylebot@openai.com>
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

rds_cmsg_atomic() assumes that a non-NULL output from rds_pin_pages()
represents a pin that it owns. However, pin_user_pages_fast() can roll
back a fast-GUP pin after racing fork() and then fail in the slow path,
for example after a concurrent mprotect(PROT_NONE). The output slot can
still contain the already-unpinned page.

The common error path calls unpin_user_page() on that stale pointer.
This can consume another subsystem's pin and allow the page to be freed
while it is still in use. A local unprivileged reproducer triggers a
KASAN use-after-free write through an io_uring registered buffer.

Clear page when rds_pin_pages() does not return one. The error path
continues to release the page on errors after a successful pin, and
successful requests retain their existing ownership and behavior. All
four RDS atomic ancillary operations share this path.

The issue was found by an LLM.

Fixes: 15133f6e67d8 ("RDS: Implement atomic operations")
Cc: stable@kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
v2: Use the net subject prefix, add Fixes and stable Cc tags, and
    include the validation results.
v1: https://lore.kernel.org/r/20261030042110.73571-1-kylebot@openai.com

I have a reproducer for this issue and can share via DM

 net/rds/rdma.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/rds/rdma.c b/net/rds/rdma.c
index 078090d292fa..71b57abb96c4 100644
--- a/net/rds/rdma.c
+++ b/net/rds/rdma.c
@@ -957,8 +957,11 @@ int rds_cmsg_atomic(struct rds_sock *rs, struct rds_message *rm,
 	}
 
 	ret = rds_pin_pages(args->local_addr, 1, &page, 1);
-	if (ret != 1)
+	if (ret != 1) {
+		/* A failed pin can leave a stale page pointer. */
+		page = NULL;
 		goto err;
+	}
 	ret = 0;
 
 	sg_set_page(rm->atomic.op_sg, page, 8, offset_in_page(args->local_addr));

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.55.0.openai.911.g06873a30d2f3

