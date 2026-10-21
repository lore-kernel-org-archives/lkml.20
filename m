Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792559272;
	b=rLVdXw+75FqbHPovSKYt+CpG4EnMakWEK27x81+hFwbYYETx5tc2cDnCQgIsZtKVE94N
	 vZrgv8O631+GvWnSSRWCP56pw3QBfqCT3OBq/QDfrTs80H9UYKYokrscrXLlay2QhRwpR
	 SPSloi3A6JTO18oilpom49/oIpL/7+nStx6YKUR+OFowAAjA4Oj5NgA+/vyjCXz7+sSoQ
	 mr1tuy5UbDelS+x6k0aAE5LypESJnqM5hZEIRLb7/LL4C7qzPr0GYeWwM+ymqAzSuz0ad
	 O8mUEydJDePw4cU48vfuHIfxfIYZ6nWI2u15kNAtchtIJpuA7up8RM8KO07LGKzXpGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792559272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=YyJXsx8WGgy7IrPhM3cdbJDYzcbLMYhf/whTKN5q+t4=;
	b=mQC0vzR4oI4Ozq5+UtQk6xboAaPzlXVuTBGBhTA2TGAG8VT9E7delMCjxpdtKLtWnM2O
	 hh9P1FJRjDwlgK9ZuD1a12NzPq6DJTRWMvwJNOErunWlQot1NMu8N/axwqnuFzJ7KTw52
	 oTqPgQKEe87sNsfPfFeN2HCcqlUHUWH8NMnaDjOkLPuaKz8dSsT30Jj1RWqDzRRe1cUqm
	 msWOVBRXNBQ30Nd8BKvRNfXoVUAOa7+paVloJ71nwJhOFGJ43XIcBlHwNf7KsBdUQDSZ1
	 3ZBSfxwHJ+3yIgS3YIlWXv0ksOtwB4Xjl+OTPmI5TlmrowedZda6r6OVU6XKBMnn7HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YKWlfUV6;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BDB606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6BDB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YKWlfUV6
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91ba702cceaso4338856d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792559271; x=1793164071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YyJXsx8WGgy7IrPhM3cdbJDYzcbLMYhf/whTKN5q+t4=;
        b=YKWlfUV6Q4V3WREwukU3jwyClakzk6TeJrt+Eqi6a4i5qqj8UFIruL+ItTej4a6ylv
         AjOxxEOzJTq2yErYppVunVfoI/+dtgBqb5ygIoRpmPJpxhAhzJXnl1Z0+06JChqmBWrq
         /0KuiWNvrgn+Eyn6DVQoEq59fcjy9EGw/r1mcZQQdhuVS8Q3TrJziOL08nLECYRVc/VZ
         l45AWxtfnqNC9riarXH+hYxJGFfwhPKrCehC9MQASXvp2VP4oKctRLoJfX5nNB9+hOEt
         q9So6Fh0YFwnMkzpTmPo6Ii/+x66KYQc6Gr9a/83cm7UoQsIJVvi++m9rXSbgSmar0wa
         Z2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792559271; x=1793164071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YyJXsx8WGgy7IrPhM3cdbJDYzcbLMYhf/whTKN5q+t4=;
        b=oFJnM9xvpepQwz8kQvzKfUn6eGZgua4EA4XG16USXkR5vDsTV6cIA2SIfoeGmmGz/r
         nUDK7QN1uHh9upy3tJ0YLXKSSDHrRTIJdz3O9Jv80H+6qBGbrQqXc0+NMiqhIIh9wSx8
         9EB9mOZjZ9pc7KqPv+dBAOq5lrCS/7ZDJb7yndpU0c4nJ/1Fbsuy4u5oIOKXnJHMpAu9
         EZrVP7QruJ2O9kL2E3s7hQHnWatACP98fDGiCIve8Oz2kQ82n36cSESxGNxBN86zJQHh
         XTPXTf2aAIGeYkecL8a6oT9RcPwPUbHv1J/p2ihpY7PK26g9/HxL2ACCmJBIMlGMzLy4
         fOtA==
X-Forwarded-Encrypted: i=1; AKwUvByyF6KHxSvJxGCk7iszcgWoel6TK5B9PeUfQ7HmEsJh90T2IF0A+aGD9LY6WWAz3xvHEqH6P1ntIOu+LFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0FVeqeEfVqHVNO/jOWfvJMN3C9kxtHjer8SyW4URS4kvXEo1b
	e5Gw4SDysSebwF121HKel6oAWuDgdnLMjdsyiKSr8IEqSLfXHVdqZ9uX
X-Gm-Gg: AYBFou0M0+o55CZdqwU5SPQSqPdNJGmHeOCpIq632b1SZKGQGcFhj2yKGShbGrcjCTd
	vYiRgvxp9GnNp09PbTyG98rG4q34YsPc3CvfgJ4zSqDMdE1itLCZ8sPbEWjUVdDFicBdku7g2FT
	Up/DFr9uZDBfs3fj53eDTBXK2NbWHJoP5SF/ES5wyFKEQqwgbDq0g+o3d1lPwdDR0j3KYU5ogJO
	hh2yjLsAwMZJxYatKRPyXXM90NG4EfGGBHHMOqFYcsK7VAwIT3+H70UAHYLLnhj2P25QI0+fNKY
	72GPItZ+rHDOXLXI2gnU96w0ezx2Y7/dCFRa4vcz1NFUtGog8u2oo2qQsMGOoZZgrq52Gk8N2o+
	5AdeMPGQaFkbUlL6SJ5q2eaSLDuMlkEFfALtUHfFZbyKk8XJKoWNxYDecwJw5iGUUR26OV9ZvyD
	j745TAwzbYU3/WaXCOOyYcmmuJ+cf5gHYrQXQpLp2FmEKcK728G1C0CiOjIJC4eZJldRbcbQ+Ce
	IA1hm7J2/TLEMSreNQ+HJ1AtD6yVyI4BSu02ay78DcjPeSuhu73UU4Q2tHxGQD3jyxmJxTHejoA
	EaFqTDGRBVlI46RTcQSqjSE7JmVzGOraWdFYIqUgGYrkue5aaqpBbkKchGo3W8of/Ue7d1E8LV1
	PiD3B5VxwlcwwwBimBNM+AOT9RcGJKR6euHWN1Hnq2FgQ1TO9fAPli9RNWCTOLn4nj3WpRxmd
X-Received: by 2002:ad4:5aaf:0:b0:917:9cd8:f26f with SMTP id 6a1803df08f44-91c12ed7e09mr15835936d6.25.1792559270620;
        Tue, 20 Oct 2026 22:07:50 -0700 (PDT)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:81c:ed4a:9bc8:12f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10c1c8cfsm15888056d6.33.2026.10.20.22.07.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 22:07:50 -0700 (PDT)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	linux-nvme@lists.infradead.org
Cc: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Bryam Vargas <hexlabsecurity@proton.me>,
	security@kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Stellman <astellman@stellman-greene.com>,
	stable@kernel.org
Subject: [PATCH] nvmet-rdma: fix out-of-bounds write in nvmet_rdma_map_sgl_inline()
Date: Wed, 21 Oct 2026 01:07:48 -0400
Message-ID: <20261021050748.32491-1-astellman@stellman-greene.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <166ea8e3-189e-4212-a457-e0b6e2e678f4@kernel.dk>
References: <166ea8e3-189e-4212-a457-e0b6e2e678f4@kernel.dk>
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

nvmet_rdma_map_sgl_inline() bounds the host-supplied in-capsule SGL
offset with "off + len > inline_data_size", evaluated in 64-bit
arithmetic. off is taken straight from the host SGL descriptor
(le64_to_cpu(sgl->addr)) and len is promoted to 64-bit, so the sum
wraps: an off within len of 2^64 makes it small and the check passes.
off is then used as page_idx = off / PAGE_SIZE to index the fixed-size
rsp->cmd->inline_sg[] array (NVMET_RDMA_MAX_INLINE_SGE entries), so a
crafted offset yields an out-of-bounds scatterlist index that is written
through in nvmet_rdma_use_inline_sg().

The mapping runs while handling a received capsule, before the command
executes, so a remote RDMA peer can reach it (the Connect capsule is a
write and takes this path on a queue that has no controller yet). The
host controls only the low bits of the resulting displacement, so the
expected impact is an out-of-bounds write that faults the target
(remote denial of service).

This wrap was reported, with a KASAN reproduction, on linux-nvme in May,
and the check below was suggested in that thread. The fix that was
applied, 48c0162f647b, reworked how the offset is mapped but kept the
original check, and its page index turns a wrapped offset into an
out-of-bounds index into inline_sg[].

Reject the offset before it can wrap.

Found independently by static analysis with AI assistance, not
reproduced at runtime.

Fixes: 0d5ee2b2ab4f ("nvmet-rdma: support max(16KB, PAGE_SIZE) inline data")
Fixes: 48c0162f647b ("nvmet-rdma: handle inline data with a nonzero offset")
Reported-by: Bryam Vargas <hexlabsecurity@proton.me>
Closes: https://lore.kernel.org/all/LM21QIR-1-qJb7PViyJKCnGBnUzizeiNJVWQ3wb7ZwGezodjgKg3f-iobqOyequ-sT1jFCKJImfqNO_BKU3KO80xFITnaI5GTV_GxLUNDDc=@proton.me/
Suggested-by: Keith Busch <kbusch@kernel.org>
Cc: stable@kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---

Thanks Jens, and sorry about missing the CCs. Here's the patch.

While preparing it I found that Bryam Vargas reported this same wrap on
linux-nvme in May, and Keith suggested this check in that thread. The
fix that went in (48c0162f647b) changed the offset mapping but kept the
old check, so the wrap is still in mainline and now indexes past
inline_sg[].

Tested: builds with no warnings (W=1) on mainline 4a8bdffce502 with
CONFIG_NVME_TARGET_RDMA=m, and passes checkpatch.pl. Not tested at
runtime, and there is no reproducer: triggering it needs a host that
sends a malformed in-capsule SGL, which a conforming initiator never
does, and I have not written one. The wrap and the out-of-bounds index
were confirmed in userspace against the expressions in the source. I'm
glad to help with testing.

The issue was found by Claude Opus 5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook

 drivers/nvme/target/rdma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/target/rdma.c b/drivers/nvme/target/rdma.c
index ffa1e172c2..e47c572d82 100644
--- a/drivers/nvme/target/rdma.c
+++ b/drivers/nvme/target/rdma.c
@@ -864,7 +864,8 @@ static u16 nvmet_rdma_map_sgl_inline(struct nvmet_rdma_rsp *rsp)
 		return NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
 	}
 
-	if (off + len > rsp->queue->dev->inline_data_size) {
+	if (off > (u64)rsp->queue->dev->inline_data_size ||
+	    len > (u64)rsp->queue->dev->inline_data_size - off) {
 		pr_err("invalid inline data offset!\n");
 		return NVME_SC_SGL_INVALID_OFFSET | NVME_STATUS_DNR;
 	}
-- 
2.43.0

