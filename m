Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749758;
	b=cAGPvxuSMqSlMalBjnPYRa6rlc1Nxoj65lFxCTcw+w5H0+Wlk3HHAcDKGegREtJUnoVs
	 JcFlFoVTVHNJZF2ZQDwla9DF4Qgzx14Sf5L6s8UK8Ro3YR8vEB6sipZEdiLSnehzHnDAU
	 RSVwT0abD8V8ua3pAFHuxnUAgsa+sRKiaGn7qxjAtOd4pK1XmzevcddaN3UVmUKD1TbCs
	 BmKK5+SYZVyMk0DecSvjoLj5RvrDvbXUTw72KYJZ6IWs70tmtfHa8LPbQmWjF0zuUHIiX
	 O2FOgpgJ+f1EduG+4uztlJiVd+8wYBQNKWYA/hUH0CVDYdKWzVrHbGe2Ujn6S0euI7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749758;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ju9NrhjKwyqGjCfeoGNQvWm8BL5cBqSNVtogiWWf/Cs=;
	b=AapYy0EQe9nsJjwt0XGnNF+TRTXK5qrvsKTte0zSznbsE5u7wp3mALksr97HE+oHLYyy
	 so3+fxAnsAivUcjeQokboMH1T/xDdJdWNejxImT6dVsmpdlR7tS9EIXOF9vq9lUXbtnz3
	 rz3TRdNSFNl0m6RGRPXc2svXI1F++KiRy5xmL05l0R9YgGRhuRLbnXufrbFcez44mT4tY
	 KasRebvapAGLaC/tPVSGwfq/Z8GUkp1ixqndE9g4e4+iLjB39sZxxgnwx3j/HyF7WH4r5
	 eyuEvrcb7Qh5i4EUHacvAyLn2Y7OPAcP7MT7j0Vjp8S4y0UH4jZqb4EFdzNMkMg8pIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RdoyXUWE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E628606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RdoyXUWE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156751F01828;
	Fri, 23 Oct 2026 10:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792749757;
	bh=ju9NrhjKwyqGjCfeoGNQvWm8BL5cBqSNVtogiWWf/Cs=;
	h=From:To:Cc:Subject:Date;
	b=RdoyXUWEfYR1PzfkVanoXIFYtMcEQ1VZXDUbjztJ/vrs4SaA42khRGBO4uqvxFBzs
	 NhJ0kerRuI9mNTahCq5kBvmjt0Fv6DsU6KPHbDovLZ2aduxtDnln5VznAjIDAd86Bg
	 A3ukEcjLIpH2+RSgzYMj0wlKtHXwCRQomeLQYwU0WoDh8OoHngd4iE4/QfimhokpcO
	 +61/abTDt5Vc7EK/jm78+e/msCHJsqlMYPrmC8mG5IB//6P02lAGvNfveFifSMpmOI
	 KfanhF+69NHyatdPQJdIRHZFenUIV+SnjJifwE5J5l5YPT3SMVsGoAY1T1aoG2/X/j
	 l2rK+LYhBg+mw==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] dma-buf/dma-fence: Document why signaled-bit is set early
Date: Fri, 23 Oct 2026 12:00:49 +0200
Message-ID: <20261023100047.2589846-3-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
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

There have been repeated discussions about why the signaled-bit is set
before a fence is actually done signaling. Repeatedly, people try to
change that.

As long as the bit can be read locklessly, for example by
dma_fence_is_signaled(), the bit cannot be set at any other place.

Document that to reduce further noise about the topic.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
I thought that if people repeatedly try to make a change, and it
repeatedly gets rejected, then we can all save ourselves time and work
by quickly documenting it :-)

This way, we also remember in 5 years *why* something was or wasn't
done.

Philipp
---
 drivers/dma-buf/dma-fence.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index bd58688b81a7..a71e18a9e346 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -359,6 +359,16 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 
 	dma_fence_assert_held(fence);
 
+	/*
+	 * It would be better to set the bit after the callbacks ran so that the
+	 * fast-path-check in dma_fence_is_signaled() cannot return true while
+	 * they are running.
+	 *
+	 * That is, however, impossible because many parties now check for the
+	 * signaled-state of a fence in their callbacks (or in the work_items
+	 * kicked by them). So we have to keep setting it here as long as the
+	 * signaled-bit is read locklessly by anyone.
+	 */
 	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
 				      &fence->flags)))
 		return;

base-commit: cf5d8e390e2ac2cfa24a50645efdbb9f0eebe65f
-- 
2.56.0

