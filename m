Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B87241D641
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504417; cv=none; b=FO7B2gpj2fwWdu86EblHHDyJLBn7Xo9ykQn3A2WvPWIeeXASXonuO+0aAt9PW3rppBtsH/DUKidRZC1s80LVrREHTpdz54soJiH7O3tqDsSFk4L8C9qzWMQh3lC2n4xhBsQvHG3NGHGwloQkEQZMBKgws/8+CPMISvCjQawCAyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504417; c=relaxed/simple;
	bh=k83g3B4wyK1YqpWFcu6vyK/PE11PEixOqag4Kww0r34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYSi514PE+0vqVtiCAaZOGjUukE6TxNGBab/UbR+dC6IG8bnc45zSm7GNp2ZrYJI8S3EbgPUwu68s41GeNOKo8w/nSZSrWFXe6IqCw9lITS4Ro9Q6cQfqh9sBUzY3Rekn9lVrtnb/0CjgcWoFKBNivJq+fl0hrqxKUAFd9oUjCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=hXbgrTLS; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="hXbgrTLS"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so844307a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 23:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788504415; x=1789109215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7pjpTASWBe1MPfmz6ei1KnjSKeXW2/lZjjY0V99IAUI=;
        b=hXbgrTLStXF2kNXvHGeENJmvojsxqrVxllw8t17eLKs/9NDMxLLDmt4f47keznLvgG
         NYhbVJZNxFVf5JZxJ9S92kY1n87gqW36DxP3CqGBq5qDPiuTk6MKIsqv5u1hhyITn9G1
         Nvv1CXdRpWfeM1wwNlA0ObnfkzqmrcQlpROGLCH+7KSRAW5LDqnECi8bWDEGPvxdl7Cf
         +d5NL2hxAJBPmYUF+772/S9kT/uAMK8srpw1JAsfcAmNq2QzxNpDuuvBtvYNwzPo6rqV
         mjrBw16jOD1TsTyruf1FV/sfY5jGYbOndu/46b+sHcGm1uetUgQkjWbF4e2hBHGU8T0g
         mK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788504415; x=1789109215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7pjpTASWBe1MPfmz6ei1KnjSKeXW2/lZjjY0V99IAUI=;
        b=mbuNQ/0Jx35PfA/5w9N6m2LlvYnUdxZb4WK8r9FJxMRKeJqRlrghPoBOc/z5a11Pcn
         WlHuZnTEpN7YdGAI8SPXAyHPAvlkH9IRA4RH/b+iv2Ps3owXGr4JdCwfoDH+Y5RtBw0D
         fRmCSITtvL/aM+fWtkySvoYyTjqkXIBiRjHkD7YzQdoB/jtPuRG0CWPopQi0OsHKcWaw
         vxCmeirkigmeNwoetmdu0RFVO8QLcbcXkvk2Al6vhpnfhxUDav+aVg/cnO9AbHZJ+OA+
         CKK34FKa27AEy1Zs07aEco3MKsYCgtyycoWQDqWZImQv+wgQe/oY7WKwCtG39dcSUDFi
         2vwA==
X-Forwarded-Encrypted: i=1; AKwUvBxQwsY+5F8Z12btprZIHwA9lzkDf24eo0osmYzHDLQmHjNcMdI68xyRo1wT8WCtJb6O1DXdYqsIeio0M5Y=@vger.kernel.org
X-Gm-Message-State: AFuF++m8hDVq9xIKAFruaZ69dZ5UENUc3BnqjF+AwFB2eJOJkoe6ErS2
	3Y923+Tpt7FlMD/YbfVBLByAXgG7tT07illQ6wLfqsNh3BF01bvdY1Efjf9n2JpLMdqUQoAWAJF
	qabtGXw==
X-Gm-Gg: AYBFou14wdO80ElG2pJjsUejo7nbg2RILkaVg2RZHAc+zzQs+YQnQxoGZNU2ZyGUlpI
	dIXsod6bQtv7r29LkVjb9LN+0EBwiNwWd4rrFhMAYePupAbUsLmTPe1BW8Y4bsYhXUt9RzclWEy
	KwLWiG4frNIhVU1xstvlftIrR000ZvKvaOwoavt/H/k64CKllVObO+fFq0Qf743f7zdt268963O
	mPren/OiTVibuhsW6OhxkvoVPTApnYcb8FyWJawpiayWnIlQfKz3V1l+pdOnbivH2U9F+VDDkaf
	ebM+zUDyNW/6s5sdQdZq0ijZ/EAq4C/HJnJ9yOsNm0j02Bkh87V7vsl8yf+KcN34pMIDpP5lFKU
	yV+VUW+LoVg9Ncz3vE3iGvWpGD7R2GLgSr5iYYVstp1pHW084TztJe8jSoTukl1ae9if7XT+As1
	3Jqq5qDBvXEi27aq6ratU/+/GpoLQqhYTZ5SPlP635yrhI5n4fLxLE2qHCIm05Ya+saV0w4El4C
	6kbQgulIOnYLin1TVM=
X-Received: by 2002:a17:90b:17d0:b0:398:9bd4:d18 with SMTP id 98e67ed59e1d1-39b26298ba1mr5507961a91.23.1788504415404;
        Thu, 03 Sep 2026 23:46:55 -0700 (PDT)
Received: from b6ad5085b32f.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25c974cfsm2950848a91.0.2026.09.03.23.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 23:46:54 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Vega <vega@nebusec.ai>
Subject: [PATCH net 1/1] net: fix linkwatch UAF on uninitialized netdev
Date: Fri,  4 Sep 2026 06:46:44 +0000
Message-ID: <eeaeddc20bf5382336eaf704b5b15e3780dbb768.1788500348.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788500348.git.zihanx@nebusec.ai>
References: <cover.1788500348.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

linkwatch_fire_event() queues a net_device onto lweventlist and takes a
netdev_hold() even when the device has never been registered.

netif_carrier_on(), netif_carrier_off() and netif_carrier_event() already
skip NETREG_UNINITIALIZED. netif_dormant_*() and netif_testing_*() do
not. Pre-registration operstate changes are meant to stay local and be
consumed later by linkwatch_init_dev() in register_netdevice().

If a driver fires a dormant or testing event before register_netdevice()
and registration then fails, rtnl_newlink_create() calls free_netdev().
For NETREG_UNINITIALIZED devices, free_netdev() immediately kvfree()s
the object without draining linkwatch. The later linkwatch worker
dereferences the stale list entry and use-after-frees the device.

The same path is reachable from an unprivileged user who can unshare
user and net namespaces, because only netns-local CAP_NET_ADMIN is
required.

linkwatch_fire_event() has never rejected NETREG_UNINITIALIZED devices.
That goes back to commit 1da177e4c3f4 ("Linux-2.6.12-rc2"), the root of
this tree. Later changes only altered callers or were reverted.

commit b47300168e77 ("net: Do not fire linkwatch events
until the device is registered.")
skipped uninitialized devices in the carrier helpers only.

commit 22604c866889 ("net: Fix for initial link state in 2.6.28")
briefly added a NETREG_UNINITIALIZED return in the helper after calling
rfc2863_policy().

commit c276e098d3ee ("Revert "net: Fix for initial link state in 2.6.28"")
removed it again because that rfc2863_policy() call could take
dev_base_lock in software-interrupt context.

Fix this in linkwatch_fire_event() by ignoring NETREG_UNINITIALIZED
devices so they cannot be queued, without calling rfc2863_policy().
Pre-registration flags remain on the device and are still applied by
linkwatch_init_dev() if registration succeeds.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
 net/core/link_watch.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/core/link_watch.c b/net/core/link_watch.c
index 9c35aac8b2e98..1caa786df2c71 100644
--- a/net/core/link_watch.c
+++ b/net/core/link_watch.c
@@ -318,7 +318,12 @@ static void linkwatch_event(struct work_struct *dummy)
 
 void linkwatch_fire_event(struct net_device *dev)
 {
-	bool urgent = linkwatch_urgent_event(dev);
+	bool urgent;
+
+	if (dev->reg_state == NETREG_UNINITIALIZED)
+		return;
+
+	urgent = linkwatch_urgent_event(dev);
 
 	if (!test_and_set_bit(__LINK_STATE_LINKWATCH_PENDING, &dev->state)) {
 		linkwatch_add_event(dev);
-- 
2.43.0

