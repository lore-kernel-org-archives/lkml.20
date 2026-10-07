Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8A63DA5B7
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791395874; cv=none; b=Qw0D4RjzaCurkbo/WpixCabU0hVmTVVSIqTsi0uxllKvWlrGiffyX1oEWTOJ1yD9E9S1OApNWrCz8vTb6QSFjgQebHrnI/L47Q5CXywGowgFadNPdYWpy+x8if4VEQO2b+usyGRyQNZp0gQqRPo9KxqDFDO5Cfdbk8YiJklzEJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791395874; c=relaxed/simple;
	bh=8siqpym+SZiWtWrY6ilp/qzOSB35ebH+f54wdBWICCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bK0ovAJCB0vsEKPq5qw4gtOAUReidFnGW7J+sF8MYJGP7IfMYN4UBW0IMKw0Blepzvm9wF3p0XfsH0ke+awiA2yyuQll+1AkgpyakjEWOKiUAHLXa8mFWwk5qg9mgT7V4YyT8NV/sWPFZZVI7xnM5HrAPdBQk5507SSN3ktkV58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=CE0s4oES; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="CE0s4oES"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5339733feb9so17224641cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791395872; x=1792000672; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MAJHQ2Wkik4PqvnpAIT0i+1papDfY48uBw0Kb6tIGEA=;
        b=CE0s4oESOVFEMLAQh0Hs+ZqLhK2zgAsvQLcId26VH/B07Ql62bqi021mS/FZYC9P4R
         vQcSRWs7Rf/K1tZS5PttSrOhYz5JEBLeW83GwMHjz3fYmiwV9HI/tCYc/hTytX9j+pcJ
         j7dTDtoNtrOwL4G8AAt600jm+wxa5rCbE/NVO52T3Ta+SQ6j9nOlDSJ3ghIC7iA+7CSZ
         puPL5rx+g6+KmoCXu5e9Jv/Ba0RznjEVojpeyw63tlA/CGHj9o/tG33FU3r3nfRjG1t6
         7OHOfXHMP9SbE9o83nUpgmIvgnyD0IEKzcLx01DTTJLzDRYUsm6G6aLWpWBpUr2vKpY1
         OkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791395872; x=1792000672;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MAJHQ2Wkik4PqvnpAIT0i+1papDfY48uBw0Kb6tIGEA=;
        b=FvLalQoa3Mq+fiMVB6tnUGvSGfvhGts6I9JhfdpEY5Obcfp+1dyBfWONR3NJUZe35t
         xMc3sRxIQusI1k8oro2kTwCKu3uS24Ftl9yyW4x2iv6Pmg1ghP1Hn4W6OquEog7HHydq
         3SeitJoALz86lrmYUR5+a6eZzRjYlJV7upPFxHCjQKLfWMjD2uEavQ6o5DIy9XoV4dQ6
         RtX3KHS9jHYhU8fsrx0EB/kZQds+RvGEY3Lf7yDA5JoWfTs+Mui96it2L6Sp2qoIWtC9
         VxeHuXe31Oc5L6ANeRuHtcw5JmvfXWjFQ2Id2E/S5LQyK56Q6E4sB3Pt3LSIEXF3T8Mo
         yDXg==
X-Forwarded-Encrypted: i=1; AKwUvBw9mQVRa8CIJqgaTAehGc7RYBgDszNujGsRYt96a7WmURAaAdm5s39Jybcip7zYYaeuw/2FMP+YbRt6YaM=@vger.kernel.org
X-Gm-Message-State: AFuF++kQotdDZFjcEACgNCxe/Hp79YCum5QWVMI7NXFyhw5rI74/+yDy
	sUKpnVC1HEBZG9La0N65Krtd/RR6xhVAmvtu+lipburDEUf+nwhjSqvolwr4a9qaPtU=
X-Gm-Gg: AYBFou3I2n2K9E1VH79L9K96QElw7XAq0dNnX2FblJ0UH1/m7GwNyqK2z4IHGXI3+Hc
	5N/J5rDN1HC8YK1W2DM6Chp/oIJTIQ8l9exY9hKgMFh4QJHHn7fjDw1VnGxByeuI2ZdSu62g3vf
	zhExWAoJrJ1qQkE3o290ofpOYoPs0Tn6Hr+HA8pX6aWSfhgUCVqIXhCgHsrAwn4GfyqLuvhbqxz
	57S34JUt+753QT4EJc5bLTxWrkPP5l/oHN34QyTjSpslGb9oj1lpENUdAp+9v1XPSsSbm5vSBzP
	mYr8DbMCa03CGm1bmWOvRMWVvkHnKNQB3ZinTVoJoMm/KmNGQmxGrGx/69pUcE6YTzXqEdYNNIv
	kjqaDFflWt+OnIsPQAZLpYGcsOAgS5ybyDtIe+CM3JP4RuPfhdAs953K3IIi7qWmfnjMgKm1wjC
	AXAEgPO+Mfipp3QpxWtVvHnVT0HQhFT0baaF4tZHp41vk3Yboc/WU45tVnWFiLFueLshQTVHkbX
	OpKG9Y8Jbt0vck=
X-Received: by 2002:a05:620a:890c:b0:93e:5b69:fa8 with SMTP id af79cd13be357-93e9b80d367mr562281185a.66.1791395871851;
        Wed, 07 Oct 2026 10:57:51 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.251])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e991fe1a1sm269754085a.43.2026.10.07.10.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:57:51 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 17:57:32 +0000
Subject: [PATCH net] xen/netfront: don't leak the skb when
 xennet_fill_frags() fails
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-xen-netfront-fill-frags-leak-v1-1-a8a01ff9cd52@toxicpanda.com>
X-B4-Tracking: v=1; b=H4sIAAyIxmoC/32NQQ6DIBREr2L+uj+ipZD0Ko0LwI/SEjRAGxPj3
 Qt23+W8zMzbIVF0lODe7BDp45JbQgndpQEzqzARurFk6FkvOsYkao4bBQyUbVxCRuu8RxvVlNC
 TeuH1Jo2SXIwkNJSXNZJ122l4QFnB8IPprZ9kcv2uNa0SoY4qmLkiv7aatyf8Z4Pj+AJbKHhWw
 gAAAA==
X-Change-ID: 20261007-b4-xen-netfront-fill-frags-leak-357ca746de6b
To: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791395867; l=1952;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=8siqpym+SZiWtWrY6ilp/qzOSB35ebH+f54wdBWICCI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKPBUTwP/hi5b4ZMT7RDyKAACyTKaU+F86iAtqdwrk+vWoZzfHOvsW0aj2tgmsgdCJbxvHAP8g7
 hKN5N3lq1pwY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

When a response chain has more slots than fit in the skb's frags,
xennet_fill_frags() returns an error and xennet_poll() jumps to its
error path.  That path moves what's left on tmpq to errq to be freed,
but the skb being filled was already dequeued from tmpq, so it's never
freed.  Each chain that overflows leaks the skb and the pages attached
to it as frags, and the backend decides how many slots it sends.

Put the skb back on tmpq before taking the error path, like the
xennet_set_skb_gso() failure just above it does.

Fixes: ad4f15dc2c70 ("xen/netfront: don't bug in case of too many frags")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
I found this while testing an unrelated netfront fix under QEMU's KVM
Xen emulation, with QEMU's xen_nic backend changed to spread frames
over more RX slots than netfront can fit.  kmemleak reported one
unreferenced skb from xennet_alloc_rx_buffers() for every frame that
overflowed.  With this patch the overflowing frames still take the
error path, and kmemleak no longer finds any skbs left behind by them.

Thanks,
Josef
---
 drivers/net/xen-netfront.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 2ed673649c48..e8675bdca595 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -1338,8 +1338,10 @@ static int xennet_poll(struct napi_struct *napi, int budget)
 		skb->data_len = rx->status;
 		skb->len += rx->status;
 
-		if (unlikely(xennet_fill_frags(queue, skb, &tmpq)))
+		if (unlikely(xennet_fill_frags(queue, skb, &tmpq))) {
+			__skb_queue_head(&tmpq, skb);
 			goto err;
+		}
 
 		if (rx->flags & XEN_NETRXF_csum_blank)
 			skb->ip_summed = CHECKSUM_PARTIAL;

---
base-commit: 23609bce9e1de525d1d0e73fc68c6e7971d0b49e
change-id: 20261007-b4-xen-netfront-fill-frags-leak-357ca746de6b

