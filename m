Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334073;
	b=mEJuhZiETaa8MHjPAW0INRqba4qQGBx/+25BOQfJYfVmzvE383J3OzCUmT5dYXOIzz/j
	 j1xFtH4q7CdjqQFgHI/Lm12GSj3UawfqL2xQOF5aYwQQEPuFC/kf9aE8LkhYiH1DaAPSm
	 VbA0SsISrQoVZ9Bt8wrAEc4RYlQB54rJLTn0n+wRgJNoFyb2900jGUyRJoHRETFNlaT6w
	 JsVOO4QKlb6DCEFTdnEGd8JLwScTTUIHVIdDxCA41y3oTL0axWsLMBEXT0r5S+GzY8UDF
	 cdv+CnBkIX9FwrjfgZiVw5gOY0MLrdNUwVeg5kMzspQNV27zYbK40pvOp3yRrAzjWJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NZFxhxetntJ4eJV30GVWChY5vhsarJj0j6bepxHT7hE=;
	b=4Swel16+qBsfZcZn4d4KrdmHByXPAnKV5YbPpdoyxC7GzV8nwZdD+xCMMG/az2vTdGY4
	 LyG19BvVs9emX5luKGlcOX1BxLhsL9+w2LPFAj6F+CBCcZ39jG4mQg8Ra7ltAawqNmlPP
	 7b11Eowi89hIw/4e14PzaCouIbBmgEOmViFr5VAzmmpUpX/UZ8VpgF7t5MqrkGH1Zg6M/
	 0uVfOwErInTN64fFeZmoEi5VINce+DfAflSRlSICZWKZQ4ecb4gYE6ZkqnNkxgLemh57d
	 iZCdgXL9OCY32uiiTguKbnhc6Ho7b26v0w359K9KMgTfkjSyJJvDMpEpu7FwXeY/DYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=Cib7M9RO;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D80D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D80D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=Cib7M9RO
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-704597ef1d8so97211eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334072; x=1793938872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZFxhxetntJ4eJV30GVWChY5vhsarJj0j6bepxHT7hE=;
        b=Cib7M9ROjjLXZ3Um+4q0PaXIHuP48lDm8G9SQnQIStFIb7n0L7DduWd5JL7qHKgguB
         LwvOyZ0U9h4+3/gcSqnTmJ6uEGbU/HDoMG0tC2dlYBTxljc41dljju0e0MSR4dH9coFT
         FRY0+RTE1CC2znYpjXqKuxpSgTvZ3hi8iacGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334072; x=1793938872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZFxhxetntJ4eJV30GVWChY5vhsarJj0j6bepxHT7hE=;
        b=VYfXSWH1n435S9/7JshEZwCYwVDknJTtDzsUd9D/CZ8WyBbQzcNO1pWRRF/XL595qk
         rtsBogTzubAn9MjdlPJ7ZDe1Duld9qXTXtfea3uwTaBe0uX+UkXeD1iKwyAk3v8caODD
         VvnYH1Ng3reHoBg8VJQ+7Pdpyc8bHM1Jyhrc7vnNxC3G0HWx/duuY3flANNsgrikfnrD
         OL3LXZjSNv88ALFirxL6DzwVviufB8dj4+fOOQQgpAzyGSc/xpoQQInnG0K8YNruGKwl
         EWJH41tECXWEHSSJz3gZhMCcOiPRM37utvdvBzkWNqYbgCXKWaH67xpkmEsdyPA5f7kf
         eUEw==
X-Forwarded-Encrypted: i=1; AKwUvBzVGCftS2PN89gRx/Db+8dNfNtVD22jLoNJh0iRGdUrsaZ7Noz1R9JOY/mgQBD3LK2DB5EzRQUwqi2MZmE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGhw20WSjmWrprQn1PHjldpR0QLmWZVu3tMRgnsGOkF/vHT826
	Wne118Qtlo+FW3uCuiEZbLkOg8ZHbQbSdS6HFNM6mzthtg5urN6D1uezYeODxW99CgU=
X-Gm-Gg: AYBFou39CEr9YYAl+dmcMAvMeLkn271zBeHJaAzEZria1v+nkozVmi01XbEVqeU8OOY
	e0fpcpi1G9p7XS6tc5kVaVXUJUYSGT0HnjiWxpjC3UFY4cnq5ekvFN8BXYKHlS9HvbdJqEvJ8qP
	AF8eLle83tVcK0Q8bywbnRe+qNxXILKmYcipRXnbD2FtBrNVPDy8zsFjQo1asKjkQJG2PddQzVh
	9eBIhpHGBpc4ImfULw8CZkQpoGQrdZwwtN7meqDHFNMJpGQOXHYti28tFRS5mhj1chLN3cTWnvC
	8wXCAbQTIYROkAJ6OzmteZMALPFxd6bIBPxiIHIjnaic2Ulr/+ujmY+FzBvToRSIqJYZ+zSVjV0
	33XB1YNu0a9zRjTNfBE+xlmM/j1dBruLKUP4GGteBcv81AxM2jlP6CwK0feTrVZFSbo5tFqqCqp
	ElgdXnCXVkIDaZmT/J48IraLi8AMF9d3JpjP+Q9Mjm2dBtJCUJut4f7Ao/OBH6ptJxY5hv/qidM
	VbxEVpWLChDedN8IlWZa8ILxXdS41VReBmFQAwoqdFnMqLJdKr5X7nSmNV9UuhdMb877yS8U2/R
	xjkoAPec3tQEFMGXJU+pkDJfBZpPYa+z+5vEtSCBkTVXihTWxyLBgrxFipCf5w6A3pWr6shs/RC
	Mao9L9VYGsIQ7+KlEuH7lEkTCEhxQXw==
X-Received: by 2002:a05:6820:7093:20b0:708:d862:7b6f with SMTP id 006d021491bc7-714f24ea1a3mr577516eaf.6.1793334072102;
        Thu, 29 Oct 2026 21:21:12 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a90af650a1sm768615fac.15.2026.10.29.21.21.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:21:11 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: rds-devel@oss.oracle.com
Cc: Allison Henderson <achender@kernel.org>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] net/rds: Do not unpin a page after a failed atomic pin
Date: Thu, 29 Oct 2026 21:21:10 -0700
Message-ID: <20261030042110.73571-1-kylebot@openai.com>
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
This can consume another subsystem's pin and allow the page to be
freed while it is still in use.

Clear page when rds_pin_pages() does not return one. The error path
continues to release the page on errors after a successful pin, and
successful requests retain their existing ownership and behavior. All
four RDS atomic ancillary operations share this path.

Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
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

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0
