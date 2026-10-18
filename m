Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085E5332EAE
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792292111; cv=none; b=s459oz/fscObiRM8OTcOmnPHFn2r3TJ9cYJFG0RooDZtMRVhNWt2TRi8W/EIghXJ8KWfA9V19Cn6V/oqifYf2xmjiPZgPXlqqhiX+UZAPGGqYL8ri2073ZJxVoXB3sMuLxo90YhkcJYSfvBGf8qIZg9dUxxZZHdyoSzytYkBv4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792292111; c=relaxed/simple;
	bh=RwBPxlm8zIzi9zYbkB7uCRvJVvU1Yu85C2n+Ve6sFac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=obErh7w7TvSnvsUq6GsIi/6dEZ6o7s5bsqivavOMPhyKJ8Y3pRAtl8nRGxeZ3DHRn0ASlZBwDf7tH0Eal5Lvj1aPlbDiT9K8tIqm+djZmAAmX0Gyp2n+dKTBTgQYWKdI6u0jlECw2qyVIs8Lw7JkLXszA4sB7EY6AGOhc0e/TKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=MtC3hFYg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AoY6u2Vt; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="MtC3hFYg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AoY6u2Vt"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id F05AE1D0006E
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:55:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 17 Oct 2026 22:55:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1792292107; x=1792378507; bh=2K7GpnnkpC
	mriI2pJfz2e7D71NoKLssGKUJjtYZwiPc=; b=MtC3hFYgQPEIJbMkMzv6sD/aAk
	4Va33/uvtreJK/m+3d3JqMdR6+8C8mwvCVEmiJikeIVIjqwqszrwvqG2P44vxmXQ
	GnzYbSz4ffiCEkDJr4KqHP6FGMrSjDE3sqkOwA99CKVvo9SgnRFU5CeFDPfeYgWl
	jnZBf7e13ixKPVrAa3cM5zXHl+Xg58yBCUTVf0M9qos2TsfBe93F2Pi4qvh9LRca
	TT8ROP8XP5Y1ndJgjeoq72qHuxAIu8blHswA8pqTQ3AwQKHq7zkdfgyo+1YtEBlq
	SmE3PBGn00xbdTbtUgIC6V3eUchP60LxN/jZBUlZ42uxtv7WRjAEJwWzjo4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792292107; x=1792378507; bh=2K7GpnnkpCmriI2pJfz2e7D71NoKLssGKUJ
	jtYZwiPc=; b=AoY6u2Vt2Zw+YwZfUC1QJEsHxuXdVnMrT/Tus3BCZo9dJvz0eUL
	+gttCDFgWquzP4eZMANW5zeHsQcRrFAHaqeSDbAopg/uHmot2IWQU8s/JupG0WEy
	94AwWly640SofjEC7CyW9jLug61dZeigcDMGDvi6NWEbLoPtfFX8tO6c32PFdteE
	bnq/Y/IlHKxpUlOCHzZ2xB3JBiHnspJgRQhTR4RZJmTRxSH/g5bYXUcpzvOB9VHY
	ajc1BRJMw1VI1V3/RYcmAvasHcYdQBsIeRzLKx7uL7ME/A0/AL66h0OeQcPXaOiT
	TWuMSw8wmuNqCKPM8HFC3whfHvND2WE22jA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792292107; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Pu9RmiTCiN5vX95TQi/m/5jbN5NXumYhcwv/bt7/W9XGi56
	qB3joNc2y/siuJb3hd9bhXHh5Z1Dqht4OFgrL/4H3AMkXpBqs9qTRF1Wiz6cKQaF
	GVSl9LQvYcyot0E8Uim3o5Td2LIFNUmmoOoCQeMxubAUIXAmzakijzS8LOcjFwjj
	05mQ6mjJWCaPZdqggs1oAlNd5MPzhMHyHlf8anddILJbrZyCI5c3RSdvtDXV69Z8
	dpN0gKYqG0cc7HXy5T7Zai7IUoE6FYdJyNuxFUO5jrboYTc01VQwvNNLoaAeDmoT
	XW0pP8p9aXerchwuVtq8g0m+lUgdiXlvFqUQC/Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:Sn1LKvgATmKSR9lqOVYsb/u4SD6y5DzxV4abH0aAHaI=:RwBPxlm8zIzi9zYbkB7uCRvJVvU1Yu85C2n+Ve6sFac=;
X-ME-Sender: <xms:CzXUamgTrECrvapQkMpqrhHwBXK5bFsmPvuqpiDrdFO0md9kioL6sQ>
    <xme:CzXUak_8bV5GFe08_JEUcysRZoxppeq8NLJ8ogSshiLdVnaIBqUx8WUVQ4fSMkOup
    OZoZTLBMWgoxA554J12Yw9Y4TCzp64jvDtyT1QlQctBeJaGwVsdsV4>
X-ME-Received: <xmr:CzXUalrlHQpp1noF538Am1roYWpTc2qkNK8EOCBEz6SQx-AuT43T9HmGXfe8FSeOZOJZLGMrwCLCGjmN5nfIviniTeb_t16_qRaI9l3KM6Js>
X-ME-Proxy-Cause: dmFkZTGNuYtGb5IfLnheiBuBhXkepFvxKPqCCivo+WwTzZl2njmNYGZY7JXXTQ5KvH1WE+
    DZByVu7DIm/j3ziVAVAohb//Fbb51w7Pq9phjoUBvwjY+guVVX2GB2k+KwNQPO1byBYcVX
    3NXce3gA6uO0g/SFdk+SivWktt7GZdPJLfk/mFG4SGDeOC2fm7Jmfn1CXnmRv1x/baRVLQ
    Q3Eqmpmr86ZGFAothaO5qwyyZzrOOUu6bYOp5WSnRMiQBSTW7hMDdAGZFe2v+vLeovc+k6
    shy/nbpWfhHnkWrqYkEmw/wl37G8rX/mqcMDQwdQIATPBDV8FyoJ7YzPcWfAMWtUhHaWRT
    dq/tfH1FrEcsZnvQ2j9MNfOKthBJQ3VRfYsHs5lJ1awaGhwpbqlRsfE+VKZS3dg6Y+NPMQ
    cbVgX3hMcaSp8y+D8oNDCoKqkMBoBecchLFdlqE4BVJB9ZZuViQUT37YwaR0ieUf5dCmIy
    mYmGxi2R96/qUAj6ORk5VI1JSX51T/c6IkQZ3+QEhj3HSSxey7YHvaBulTnS+h7bZh+npe
    0AsAP9iEuNY8TTlYVxukIydjZmxxo1gC3DKWXAN9oGd3rgKfcrweo7u2dAS8bu7pNViNIS
    Dei/NVAV+ZMRDwwtgrsiyzQJ9rIAL6wD1UiHfAdCfCGFc8up0pVqRFP7ZGrw
X-ME-Proxy: <xmx:CzXUar9uWUMS-sC7GFfQ1GovkrRs6gAWkAu_aQq7B0HEShLrG5E52g>
    <xmx:CzXUahV0PJxJ_3UMAH7SfyqptRg4hVVAxsN1GIrxBoUb37WQApoG7A>
    <xmx:CzXUapBCNsFIlOm5NdXR9JKmuqAZQhwHx6j7nw9PGj0ecB5N7ub-Xw>
    <xmx:CzXUaqy_JXUXv8FWJin_HtQD_Zkho-bqgwq42vWcCVegqF9j33UkZA>
    <xmx:CzXUakUF3iA-n0wLinnfRKMDyYy6t6PfXJ7GUG2Amzx6DC8YTSY7Dshg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Oct 2026 22:55:06 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] firewire: core: fix race condition in split transaction handling
Date: Sun, 18 Oct 2026 11:55:04 +0900
Message-ID: <20261018025504.290598-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For a split transaction, either fw_core_handle_response() or
split_transaction_timeout_callback() may manipulate the same transaction
entry in the pending transaction list. The return value of timer_delete()
is used to determine which function handles the entry. If the transaction
is a split transaction and timer_delete() returns zero, the timeout
callback may already be running. In this case, the response handler must
leave the entry in the list for the timeout callback to remove.

A previous code refactoring broke this behavior, introducing a race
condition in which both functions could process the same transaction.
This could lead to a use-after-free on the transaction initiator side.

Fix the regression by ensuring that the response handler does not process
the transaction when timer_delete() returns zero. The timeout callback is
responsible for removing the entry from the pending transaction list.

Fixes: fa2dc2710076 ("firewire: core: code refactoring to find and pop transaction entry")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 22ae387ae03c..016070560c74 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -89,8 +89,12 @@ void fw_cancel_pending_transactions(struct fw_card *card)
 			break;						\
 		}							\
 	}								\
-	if (t && try_cancel_split_timeout(t))				\
-		remove_transaction_entry(card, t);			\
+	if (t) {							\
+		if (try_cancel_split_timeout(t))			\
+			remove_transaction_entry(card, t);		\
+		else							\
+			t = NULL;					\
+	}								\
 	t;								\
 })
 
-- 
2.53.0

