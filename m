Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793601880;
	b=lzj+wDqI82nlf3YeutCHuIklPoClsOgValYHY4prQCF9z/fvGrBBimOuCsa/iJ6N79Wt
	 zUXxqAKJYkwkH8kJQ2VbXZ0bnreyn0c9T3Tnwcmjh3SGDGsyUIBiwpKKCKrmytDJwujcX
	 Tf54Ap4M8JmFpZxjADO65+TugFljCl0p7hhbS2VEcvzQJFCv26DmxFF4UJMrbNBsp5hES
	 5xpsig0XlFURfvQuCJk60NiPJihOJ5OaZKywHAkmOyrq9eUGVWCUoFXeTkfoESttTEjUf
	 XRVUV2PaRuvUpP3mck4TwroU56jdYAZ0rctL8Y2VDLEDG41kSbrWK837s1aVouR/KZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793601880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JBahlw0BSTFIK+2BYvIp2lv3jJCouVM8oLSKaKh5Bf0=;
	b=PZGJn39H2+AXpgrcv0gohtEOKLhTXCO9FR/I7Hta5mzh+fU7Zr3L+IRmWmJTyFp8j2nO
	 Wre2KB9/XUmL+bTwdbN/rKIs5S02A82lO0Qi6zH0RozQYc/1P43sqUAJfwZ6pd0mwLDKX
	 mNJkboe0iaYyI73NrGoaw5sUIRW+asXdKLGHmLO5lfNwNRKPjDbvct6i51yKASYf6AYws
	 ymGA/Kh+LNJMxn3dTlBl8mBRcpNAwtX62qtY6kqH22+8uqyCvdnKlbStM+6vfb+SbFcS0
	 yCvAns9paBsSUwi7RA9lg6HlaM+oa39QWmlDgZHKSnE11B1DK0y4OnDe+gsoXMepcyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQZY3bed;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1ED606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A1ED606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQZY3bed
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e64d52949so233771485a.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793601878; x=1794206678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBahlw0BSTFIK+2BYvIp2lv3jJCouVM8oLSKaKh5Bf0=;
        b=jQZY3bedA75h5mL9U4lJCKKP1OWkkjax5oaslpe0icrr7xNWD+mT9VPSDNloxGrivs
         CoSj0zZDZHESTYv0dGlNcRkq+VcC0fmjMjUou9DGIVy0c+hahq1xN/uCr9esUs9FMpbD
         txHYgHneSfSn8BL9uFovhc4iAklrhyJsyeHxcQNQ0gLx2q2z5sn6cJ7o0aLE9eVBnQPf
         g2Aa2bzjwIJH5NSZqkM8K5a999TqigiSILmvNv2fPrrXy5tJkfcJWFVNmgi/67XpR3Rg
         2OhY6zU+gGfWHpkeycAPv2U12ZpJpFSt0VYJgb5b3MXLGRD9fC/20zgnE5fU8z91wXsC
         c0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601878; x=1794206678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBahlw0BSTFIK+2BYvIp2lv3jJCouVM8oLSKaKh5Bf0=;
        b=tMrc4Fo8wo/PNrwtusBESOiIGO+GZKgSZvul3XaYJ0VGe+JMb1lMEf521GMV/lixvZ
         BLMEfY5JSvQCe5oeyUao2zP8fLYgUgZttYntNiMe16YaH1XztyNwKPFNbOSsotAwXKuG
         gcaSF+PufUfiOV8fmHPDQNixCPGWz/yHUttCjYKgrYr7n09L3NM6lRcjysLB3tZK7TRb
         cFBfxYRBzuqzraqxAKhZ2fNUaWMfoY7QJuXpOYW9jI2R5E97kLQumgATatDJ37mcOedO
         gNOK38M4zQ/h8ezehGkodq/+k+AVBS+Yw7g7tXkedGWRaPbazg4yoAR+U3354oAElYsS
         5Zow==
X-Forwarded-Encrypted: i=1; AKwUvByRBgeEi5E2cLP0FyWHEmwi0McE+oLx41/vzHPGX6z2QYYMHF9DAS5W3FgEenVdV48gI1g3CWnHSRaVLdI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVqrkCoiAuunuFOGkl07CByoeqnIAW+PJBE5d9KKCpxGusq5lH
	AF/Qad+nCsQ3/J52CvRzQRtm7FPEnUzFEe4w/8Qr9v0B4Io/7e86ePJ6
X-Gm-Gg: AYBFou25WDYac5JWJQ4qEfwmwFdzfXJEn0sRi/SNDFQeXmlmW7+BAxxd214L+0jlpWM
	0DuiNlFAGjxx5fLlPq+zERfq0uBL3nBaEzHUQ/mBSX3NDw1no/vWoUlW7XJFggblu9Op/UT8vCN
	ZYvjvHkGlo+hpPRPCvn2tGm/pUtD/pvncvaZYfoLLrxUGpduJ1j3/81W9v+9Pr7l1EtMfAzx/qX
	TUgodPYP7IEAAK6b6NuWQp3mZieg0xJjxGJJgkdiIovC0i64IesPL1E5due9suAH6CRlbSK14uC
	Xe9yqLpWsxuhwZ4/hsINGe8fe9O4vXqdI4LPCHinrwzEq9gVhQ7MwEZdt/WCTlo9ZVOp/hF+0LN
	JEQXWDYn/9SsNgtOPKuAsnZ2jfRgjmteI9sRZLiscXPNVTv8LPXneOj9c66mDW5DoLvXQ9ZaGeR
	q4Ykfb3YRPg9CzjO9QpYGP8shWqPObmSnywLxRnDRr5s28HkDwmZ5W1CwTKPULb4VQfxU8a+tlR
	EXIwMhb84YByhXyYRMqByIZdleJPDqhDql2LA/ZxBd5DbdO+CxXcXPdCSTkLLpAiTvfh0P4Bd74
	YgsWI1/G+HqeMNdZuw4aPHHs0LYyDJjH5/QtQSqBBEh7aog+jE3pIHBWIhrLQg5+VGT5V9u8t3A
	Rqcejd0OoSznZGGAJn0AOv5jzLbd4WtKlcSZxFZsPgftEQFOBOBW7bQ==
X-Received: by 2002:a05:620a:2686:b0:93f:5f83:2cbb with SMTP id af79cd13be357-94421581847mr1475900885a.7.1793601878603;
        Sun, 01 Nov 2026 22:44:38 -0800 (PST)
Received: from ip-172-31-15-253.ec2.internal (ec2-32-195-47-40.compute-1.amazonaws.com. [32.195.47.40])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9442581b2a9sm765276585a.13.2026.11.01.22.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:44:38 -0800 (PST)
From: Deep Shah <deepshah146@gmail.com>
To: Bernard Metzler <bernard.metzler@linux.dev>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deep Shah <deepshah146@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH rdma-rc] RDMA/siw: Fix use-after-free in siw_mem_id2obj()
Date: Mon,  2 Nov 2026 06:44:37 +0000
Message-ID: <20261102064437.23976-1-deepshah146@gmail.com>
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

siw_mem_id2obj() finds a siw_mem with xa_load() under rcu_read_lock()
and then takes a reference with kref_get_unless_zero(). This is only
safe if the object stays allocated until RCU readers are done with it.
siw_free_mem() frees it with kfree() as soon as the last reference is
dropped, so a lookup that races with the final put reads freed memory.

This happens when an MR is deregistered while an incoming RDMA WRITE
looks up its STag:

  BUG: KASAN: slab-use-after-free in siw_mem_id2obj+0xe5/0x310
  Read of size 4 at addr ff110001042aed88 by task repro-rcu2/90
  Call Trace:
   <IRQ>
   siw_mem_id2obj+0xe5/0x310
   siw_proc_write+0x282/0x430
   siw_tcp_rx_data+0x12e/0xbf0
   __tcp_read_sock+0x12c/0x440
   siw_qp_llp_data_ready+0x147/0x260
  Allocated by task 89:
   siw_mr_add_mem+0xb2/0x2a0
   siw_reg_user_mr+0x19f/0x380
   ib_uverbs_reg_mr+0x2a7/0x4c0
  Freed by task 89:
   kfree+0x301/0x530
   siw_dereg_mr+0x31/0x50
   ib_dereg_mr_user+0xb9/0x200

Free siw_mem with kfree_rcu(). A lookup that loses the race then sees
a zero refcount and fails. The umem or PBL is still released at the
last put, since a failed lookup never touches it.

Fixes: 2251334dcac9 ("rdma/siw: application buffer management")
Cc: stable@vger.kernel.org
Signed-off-by: Deep Shah <deepshah146@gmail.com>
---
 drivers/infiniband/sw/siw/siw.h     | 1 +
 drivers/infiniband/sw/siw/siw_mem.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/sw/siw/siw.h b/drivers/infiniband/sw/siw/siw.h
index dbc998248b1e..4ec9c2ac75e7 100644
--- a/drivers/infiniband/sw/siw/siw.h
+++ b/drivers/infiniband/sw/siw/siw.h
@@ -157,6 +157,7 @@ struct siw_mem {
 		void *mem_obj;
 	};
 	struct ib_pd *pd;
+	struct rcu_head rcu;
 };
 
 struct siw_mr {
diff --git a/drivers/infiniband/sw/siw/siw_mem.c b/drivers/infiniband/sw/siw/siw_mem.c
index 2a08817d3cce..be70dc9c8f81 100644
--- a/drivers/infiniband/sw/siw/siw_mem.c
+++ b/drivers/infiniband/sw/siw/siw_mem.c
@@ -115,7 +115,7 @@ void siw_free_mem(struct kref *ref)
 		else
 			kfree(mem->pbl);
 	}
-	kfree(mem);
+	kfree_rcu(mem, rcu);
 }
 
 /*
