Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB2443F0AA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493405; cv=none; b=qzpTUfls6F5zuf0u2SHdqHKg9kC2W4rwOA7jcNyO5fWnj7EdyjOa41SofIY4R5rvCiAmnPyRj06VRj2szV40BDoeWpq65n0nZx8p4SOt20vqUWFOs0td/cLjiqhJyWe8z9vv9i4t+uVx903rGnXk1xVwdIGYPJtyb9bLCw/FSs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493405; c=relaxed/simple;
	bh=eNF9AfY31ifKJcp/wEnDWb5NxkFPFrVkSamyLYsUttM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZECrp1l87rjd/6FoYxkF9dFlV0zNJmVm1G+NgWT/4snzQ/pJhzGIg0zEo08IdXAjfQe8bpc46ijeVaN6bubnrdkwnMG5MibIFF2xuy7ZS4XFpf69TlSt92F/VUSTs7vb2drCaNfVljj2jloH1UOEY3F3eB6NrI+tt/GwFCvmf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=JhatXkic; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="JhatXkic"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-917a7c03eb8so57149516d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791493400; x=1792098200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJq2iGR6XjS9tOGb5y7ebTTlkIKkVZtFa6s12jsD6jo=;
        b=JhatXkic0EDV4M8l7ms0jUt7E9pE5+bxlKrgJP1O9N/ZibUN5IYjOoPzKtrGy67/DK
         Drs286lUUQTClCboZKrcDgbMdVELXgZzhLMPgFqegiaApPpbdTIlriLvA+wBoZqTs6vd
         Y6wPmcIanWZCH73XBLn8DJ7iG1xmRXljYNmE0hFf0Eix33HAYCnnwY/iGvDJTZgYdK4d
         68ug6wpHNND+cLVZDIeisi6bYWWUD0iiszn4ihyNILGowGAVQsg6zrEM1RpeSIjVw0mS
         WqfDE9OGh+4oVsj/hKq8yzM/rjQrjlZ7ZlzQm5xh0OstG0IDdY0byEnWQCmMU6ZB+e+m
         I6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493400; x=1792098200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cJq2iGR6XjS9tOGb5y7ebTTlkIKkVZtFa6s12jsD6jo=;
        b=I5ipwN0C3joikMzqLj9nTV0ISzLMN/xJlJ7Ky7q7Jivxn+sbFiMBSSCm/Si6bpZr2A
         undKRtRVv6FxrSP1FXks92lIqLoIKxBp21k9u7XsKNfLM9g83/o9hUGommWcgCClqpyD
         QqDGY7n1FfvLbFU9xVvp+g2WEjzylGoYl5URjd3NLpsAFNjbowS4SHGZ2o4uC1fZXmTQ
         uf9Ps2ICJmzXBFMvjvpnZyNsaJsXIGNn02r5p81WUZMrxGN9qGzXSQqTyV9eotJNXu9I
         6nCfCOrcEGabX4vpTlwMwyIboJvf2UT3jU1BsEAL/Bjz48hsC6JLDKEm0XCWmktCn6ed
         Dumg==
X-Forwarded-Encrypted: i=1; AKwUvBy6euUq1EuYJ5qcL1/3bwDI8h36mwZfzKMxtLy2oMhFFDObRkJhn2PSw0q5Aoisl7BZ4AMcA0vl/53u91w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAiX9K6XHQueUni+QLe0y4lv2U20UM4OjzCEAdxZ0Q99hjXyHu
	c+jkmOX5NlEwgNM7YotK0GUKF5V14frk2lu2rsDs1fJiUhQbYD4aK7pUmKPEFEv2ZdM=
X-Gm-Gg: AYBFou2o8orDzDeT6elkk6dhjDETNSu3fX6slladHgHpVfUMKHMb+b6bv9OumB3Fh4+
	du9BkqgssVFzOVwExOE6cMwqHij6Vkl6Y7wzK7yZt0wiAljLYVVwLaYKASOFfyt9UWYBoEYBxVD
	sOh2yLl9Xr/9eYZn+l6sW1ejyn+e47rRczS7IX32bdLxlDpuYJXJ2rB18UAXgz5Q0gU0xGJRqcT
	nRYPXbzKPKCgQ9lO7U/sa3+OrfJ641DAp029Ij8sFIh0/NymQ75yuoCEsFaJV02yWwtx1qwtuLu
	PNbKcbh1Whiaa+euS7lPbT3VmrPZxqKcaB//+sevJpxI6SRUHlxt7kZ2Ykv9iDtKfJ1HtS/J4uq
	KhGPh1UMyGq4Kmv1ZfyJhWSTISL5mTxXfnL/Xzji8IpS/j/Faw4YuI/4XIkSvHnO3yj9MFrYt41
	tFQG2VPQx+4Gnctrzjs9iq7VAl0RcWJmDRFxJZ6AaKQznUQfM/9jlFchbIADiuhb+eyEPYkLfG9
	eyQFqRqMt3J/RE=
X-Received: by 2002:a05:6214:8506:10b0:91b:51ea:8f3e with SMTP id 6a1803df08f44-91b51ea9005mr10470996d6.49.1791493399667;
        Thu, 08 Oct 2026 14:03:19 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b55120027sm41246d6.49.2026.10.08.14.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:03:18 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 08 Oct 2026 21:02:48 +0000
Subject: [PATCH net-next v2 01/10] net: skbuff: add skb_drop_empty_frags()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-b4-pskb-pull-tail-drivers-v2-1-8f2bd9bee138@toxicpanda.com>
References: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
In-Reply-To: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Eric Dumazet <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Manish Chopra <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>, 
 GR-Linux-NIC-Dev@marvell.com, Shahed Shaikh <shshaikh@marvell.com>, 
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 xen-devel@lists.xenproject.org, intel-wired-lan@lists.osuosl.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791493384; l=3047;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=eNF9AfY31ifKJcp/wEnDWb5NxkFPFrVkSamyLYsUttM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOI8lG/wdh6wd8yc4i7FHBwvmuyCaLtAuFDjmIGDKRvpDQpmhSkJsjkYyP5E/1+czZMvAKz61ka
 mmydLfI/gLQo=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

__pskb_pull_tail() releases every zero-length page frag as it walks the
frags array, even when it's asked to pull nothing.  Some drivers depend
on that.  xen-netfront calls it with a zero count on purpose to make
room when a backend fills the frags with empty slots, see commit
d81c5054a5d1 ("xen/netfront: tolerate frags with no data").  netxen and
qlcnic get the same effect when the frags they pull to fit a TX
descriptor happen to be empty.

pskb_may_pull() returns before getting there when the head already
holds the requested length, so these drivers can't simply switch to
it.  Add skb_drop_empty_frags() to do just that part, unsharing the skb
first if it's cloned like __pskb_pull_tail() does.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/skbuff.h |  1 +
 net/core/skbuff.c      | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 27ec1e38c828..c1295f6baf6d 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -2840,6 +2840,7 @@ static inline void *skb_pull_inline(struct sk_buff *skb, unsigned int len)
 void *skb_pull_data(struct sk_buff *skb, size_t len);
 
 void *__pskb_pull_tail(struct sk_buff *skb, int delta);
+int skb_drop_empty_frags(struct sk_buff *skb, gfp_t gfp);
 
 static __always_inline enum skb_drop_reason
 pskb_may_pull_reason(struct sk_buff *skb, unsigned int len)
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 43ebe61c7fc4..f798118df112 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3004,6 +3004,46 @@ void *__pskb_pull_tail(struct sk_buff *skb, int delta)
 }
 EXPORT_SYMBOL(__pskb_pull_tail);
 
+/**
+ *	skb_drop_empty_frags - release the zero-length page frags of an skb
+ *	@skb: buffer to clean up
+ *	@gfp: allocation priority, used if @skb has to be unshared
+ *
+ *	Releases every page frag of @skb that holds no data and closes up
+ *	the frags array, so the remaining frags keep their order.  The
+ *	frag_list is left alone.  A cloned @skb is unshared first, since
+ *	the frags array is shared between clones.
+ *
+ *	Returns 0 on success, or -ENOMEM if @skb had to be unshared and
+ *	that failed, in which case @skb is unchanged.
+ */
+int skb_drop_empty_frags(struct sk_buff *skb, gfp_t gfp)
+{
+	struct skb_shared_info *shinfo = skb_shinfo(skb);
+	int i, k;
+
+	for (i = 0; i < shinfo->nr_frags; i++)
+		if (!skb_frag_size(&shinfo->frags[i]))
+			break;
+	if (i == shinfo->nr_frags)
+		return 0;
+
+	if (skb_unclone(skb, gfp))
+		return -ENOMEM;
+
+	shinfo = skb_shinfo(skb);
+	for (i = 0, k = 0; i < shinfo->nr_frags; i++) {
+		if (!skb_frag_size(&shinfo->frags[i])) {
+			skb_frag_unref(skb, i);
+			continue;
+		}
+		shinfo->frags[k++] = shinfo->frags[i];
+	}
+	shinfo->nr_frags = k;
+	return 0;
+}
+EXPORT_SYMBOL(skb_drop_empty_frags);
+
 /**
  *	skb_copy_bits - copy bits from skb to kernel buffer
  *	@skb: source skb

-- 
2.55.0

