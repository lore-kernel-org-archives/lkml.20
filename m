Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB2137F8D3
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857274; cv=none; b=e4EDJ5q+CDOSb6fUAeiMzdeaqcLcPF8TfYSVtFkPACl+qcnNcf9ZN6eKJOqlJPOT1hjq4aAzhoCvC7vb0QfxFUZsHh3vRs+9gPUk18WW0JSB3+yVrTrWYOTqKk5JPLvB0EmOQLJ5cGkr6sOuaqatkGVnB6ctR02JzK41Z9uXXtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857274; c=relaxed/simple;
	bh=JBFXLhzHo1/W1XkPNm2f8N0vTk0jOx/ouyfoD7ChHO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XGCWKlX+Iv2r9xbtPRiF5Dd2s5bbfzpyHavOn6Z7fOcceVW3Kg80WZggVbJ4WZxYY+aCidauSjuiPYgQDqNhXonzRAU8+3PTEQELnZ3lRIP+sIs+oTkZ2MEQadAKikDGsd1QckwRaozMQmLvxJlSqN9PH7OC3uo9PtS8o3Wnf9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPNNRoMq; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPNNRoMq"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so1445279a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857272; x=1790462072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p69PMisrwCoU7hEWrCmi5c9SKhhm9fMhot3qveIvDqE=;
        b=hPNNRoMqOTAybRv25/lCPrzpQMX/DMfmmGUfd5bV48aB7u5W4E3EbrHoejbAwAFerm
         RQEzB/CiZJYuAnems7gGtLrJUXsXdDKMy8j9IsRmqdbY2Kw1cE7J/2cCa+K4LXOIgxhA
         kPrmHMuLP/cDrXXKf3hR6SK6VrtgaQrqHjpD6oy3U4L9rzMpEyRAunt4kNmybRQyy0el
         Nld97WY+YEFwpnAU4ppaYtidI1lztbdRiGnduGpRnAsWHep3vqMsG7gN4qgQRBLq2/6d
         Cw6bQPtnaJaijKfq1tTrwSoFL4GDU6KYYt6/jundHrn6NriOIvDeFTpwx/RYyILqW/I0
         8qhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857272; x=1790462072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p69PMisrwCoU7hEWrCmi5c9SKhhm9fMhot3qveIvDqE=;
        b=U+RO0dC5aRBrC/cdPW4DqSdvhbl0hulzQNUPDIfDKv5F4z3pW07vFhDYrz/94aHSmS
         Q+ydnCrWvY2cQcX64XSw6cwfMl5Jx4F1XTDuzvP+PGp7PdaTvcuuQOIE/5TSa2LlT6ru
         e9g3/v569Q6WtIzf0oawYfqD+VNm3px7L6/GZqJ9UTnXQu9eLkadk0d5drz3rdPSx3R+
         Issazes+8sEWvOHH+rBxGgmktGlfVZOOBeeu5anITEAw7VY0qkBzGCcLLA1ToS50G9Vh
         U4C3PxkrS/trqOTqvAm5kRp+CS9/qchDLzWVrtVSybyGh+GdVy/PErGFkmrOmlSozxzm
         2dBg==
X-Forwarded-Encrypted: i=1; AKwUvBzl9Ar6NLU2lXg1m5okyAq5Iq/LvezGyeJerk2GG0LLrDURNGtpYbpzR/Mf6eR4JoQSyiiXeN9GynSQNi4=@vger.kernel.org
X-Gm-Message-State: AFuF++ktXNjU+ph6FR3SnV+EhHdc3SDRuZLVKHdxHzKIt+PsbVtvPLK9
	YTqUtEXEI63GRphd85J6JGS9THIdWdTDs01ovR2sNF1WLxxPHoZlNrqduRDmuVeH
X-Gm-Gg: AYBFou3mWtNBfevrVYUL8tyYvTvsfe8Pejeih27PYDGYHU/Ns1s0B3+tdLUVP98w3TL
	cqws+H5+ZuoASTJsxBWwZjuO+oEsRr2jxzovuSwBxiPKarTQA1Btml4NC7zOvH9UNOxqKSBFO6V
	yelItpQWH08SuZr13bWRKHIlyPS/OLW8sHmUC2l7rpe0mrpsSix+Uacvh9/ELAd0iqnqu15kreH
	bSx8e1EXU/9wdxMHwbOgjEX84e5FaJJ69JecOrfSzvJzQ5XDNSyGdYvGO6g/0LkkHHUqPsefWdz
	Xe2sMfCNthMBvX4C4+la2onTFJRYb9OhJ/+KfEyXuh/3HusfYbvCwcG660lUEwzgom9CdvK8Y4i
	RXTdloKTpa4J1Lz0JzLBXqLwn+lFUJWszV/l3IyuAeSMe5c1jFdEe0U1CByPhDKvnkTumSFqg8D
	FDolgNszBc6sJF+lqP7zcbBFcu26kSBE0O67d7gdcXLMtdebldjgX+jo8hUKJd8rmJ4WfACUnAB
	n9O4mNfjYP1FLWVF8F11tjIj3PneqBq2vm2GmvbqNcqQqVkPGx52qKTNziJdi6jo6Mu50YAEe0q
	aizkex9Bkg==
X-Received: by 2002:a17:90b:4a03:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39e54d38c48mr16282630a91.8.1789857271719;
        Sat, 19 Sep 2026 15:34:31 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cabb771sm6339035a91.9.2026.09.19.15.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:34:31 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: 3chas3@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: linux-atm-general@lists.sourceforge.net,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] atm: br2684, pppoatm: add missing pskb_may_pull() and headroom checks
Date: Sat, 19 Sep 2026 22:34:31 +0000
Message-ID: <20260919223431.3882212-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In net/atm/br2684.c and net/atm/pppoatm.c, verify packet header lengths
with pskb_may_pull() on receive and ensure sufficient skb headroom via
skb_cow_head() before skb_push() on transmit.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/net/atm/br2684.c b/net/atm/br2684.c
index 05712c28386a..4e397b1a3a27 100644
--- a/net/atm/br2684.c
+++ b/net/atm/br2684.c
@@ -369,8 +369,11 @@ static int br2684_setfilt(struct atm_vcc *atmvcc, void __user * arg)
 		 * by device.
 		 */
 		struct br2684_dev *brdev;
+		struct net_device *net_dev;
+
 		read_lock(&devs_lock);
-		brdev = BRPRIV(br2684_find_dev(&fs.ifspec));
+		net_dev = br2684_find_dev(&fs.ifspec);
+		brdev = net_dev ? BRPRIV(net_dev) : NULL;
 		if (brdev == NULL || list_empty(&brdev->brvccs) ||
 		    brdev->brvccs.next != brdev->brvccs.prev)	/* >1 VCC */
 			brvcc = NULL;
@@ -392,6 +395,7 @@ packet_fails_filter(__be16 type, struct br2684_vcc *brvcc, struct sk_buff *skb)
 	if (brvcc->filter.netmask == 0)
 		return 0;	/* no filter in place */
 	if (type == htons(ETH_P_IP) &&
+	    pskb_may_pull(skb, sizeof(struct iphdr)) &&
 	    (((struct iphdr *)(skb->data))->daddr & brvcc->filter.
 	     netmask) == brvcc->filter.prefix)
 		return 0;
@@ -449,7 +453,7 @@ static void br2684_push(struct atm_vcc *atmvcc, struct sk_buff *skb)
 			__skb_trim(skb, skb->len - 4);
 
 		/* accept packets that have "ipv[46]" in the snap header */
-		if ((skb->len >= (sizeof(llc_oui_ipv4))) &&
+		if (pskb_may_pull(skb, sizeof(llc_oui_ipv4)) &&
 		    (memcmp(skb->data, llc_oui_ipv4,
 			    sizeof(llc_oui_ipv4) - BR2684_ETHERTYPE_LEN) == 0)) {
 			if (memcmp(skb->data + 6, ethertype_ipv6,
@@ -468,7 +472,7 @@ static void br2684_push(struct atm_vcc *atmvcc, struct sk_buff *skb)
 		 * Note, that only 7 char is checked so frames with a valid FCS
 		 * are also accepted (but FCS is not checked of course).
 		 */
-		} else if ((skb->len >= sizeof(llc_oui_pid_pad)) &&
+		} else if (pskb_may_pull(skb, sizeof(llc_oui_pid_pad) + ETH_HLEN) &&
 			   (memcmp(skb->data, llc_oui_pid_pad, 7) == 0)) {
 			skb_pull(skb, sizeof(llc_oui_pid_pad));
 			skb->protocol = eth_type_trans(skb, net_dev);
@@ -479,6 +483,8 @@ static void br2684_push(struct atm_vcc *atmvcc, struct sk_buff *skb)
 		if (brdev->payload == p_routed) {
 			struct iphdr *iph;
 
+			if (!pskb_may_pull(skb, sizeof(struct iphdr)))
+				goto dropped;
 			skb_reset_network_header(skb);
 			iph = ip_hdr(skb);
 			if (iph->version == 4)
@@ -489,6 +495,8 @@ static void br2684_push(struct atm_vcc *atmvcc, struct sk_buff *skb)
 				goto error;
 			skb->pkt_type = PACKET_HOST;
 		} else { /* p_bridged */
+			if (!pskb_may_pull(skb, BR2684_PAD_LEN + ETH_HLEN))
+				goto dropped;
 			/* first 2 chars should be 0 */
 			if (memcmp(skb->data, pad, BR2684_PAD_LEN) != 0)
 				goto error;
@@ -535,6 +543,8 @@ static int br2684_regvcc(struct atm_vcc *atmvcc, void __user * arg)
 	struct atm_backend_br2684 be;
 	int err;
 
+	if (atmvcc->user_back)
+		return -EINVAL;
 	if (copy_from_user(&be, arg, sizeof be))
 		return -EFAULT;
 	brvcc = kzalloc_obj(struct br2684_vcc);
diff --git a/net/atm/pppoatm.c b/net/atm/pppoatm.c
index 5214786e61d1..c3a693e20aba 100644
--- a/net/atm/pppoatm.c
+++ b/net/atm/pppoatm.c
@@ -397,6 +397,8 @@ static int pppoatm_assign_vcc(struct atm_vcc *atmvcc, void __user *arg)
 	atomic_set(&pvcc->inflight, NONE_INFLIGHT);
 	pvcc->old_push = atmvcc->push;
 	pvcc->old_pop = atmvcc->pop;
+	if (atmvcc->user_back)
+		return -EINVAL;
 	pvcc->old_owner = atmvcc->owner;
 	pvcc->old_release_cb = atmvcc->release_cb;
 	pvcc->encaps = (enum pppoatm_encaps) be.encaps;
