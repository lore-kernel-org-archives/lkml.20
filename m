Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1457329B20A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789072280; cv=pass; b=PR01wfbu2r2i6OmX+HkC5mkfpehSebWvycl+iDIhfUfjEKMNUl1xIkN4ypsuKjQtA92LmZCVK0j/G6v0PFjKgVy8IWMgpN5I2scF50E+A82Kj48QqeVnS85bg0dCKU8cSGcSmn21ru8KWS3sFp2Lat1IkXNzjtwSSfux7EVj9sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789072280; c=relaxed/simple;
	bh=HnpGtnRbnZM4AM/ENNwGiaWU5/n9HHmzlea3vnt2Eao=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=RUlDiEvhPByVXQfbAwIjCQkXA79WaV4kXSTOhq0f/yEpydxuCrz6EV6pky5azh1N/p4dOqiiQhJkVSmPGjNP0mpsew/F8RDTUfVg6SiGjjeQyDGUHk20d+UXydLFbEqYQRSV/yI0ByToaNjODfLPKvFgclcbzBM0fcW9yO+cDog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=gWBo/ZXP; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="gWBo/ZXP"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-85377c8bc96so112270b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789072277; cv=none;
        d=google.com; s=arc-20260327;
        b=gCjJ3XeBz7m5Vf5jxucyd0/AfnYlDAlHzpRL+S9CTbtzrx5+3zLKqb1+ipeqUJtcR2
         GeuxQ92tQl4q/FKL+P1EtIFeoI8f3fk5WHppBES1WaglT3XBL495sIRC1RigJ0a1bSmr
         xbvL/+wL/igwevaoyzSfeVZ5KzJ8y11oTW9+Z2TMN1L01aItdj9zaY6zovrcUNW8LYmb
         GvbxFgQ9ODc7A+qyvkPa7HyWrvR+MpPl1p6uVCM/thu/AaydyjMb72EsXidPvDmHfiwB
         hymXXOjRNHYsqoMjanayztYVKJ8FmjOki1HZH8/AoGxN2F9VYuWT+ER8x1YKA6qYPlsF
         NtkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=maCUZCHQL/0Dung/jQglQrSJpIrbe49RGrAjwhWAl9E=;
        fh=J6qLwGJUZXNDkioYefnkr2nyLp5SGiZNvjpnOAKeA0k=;
        b=nAPehJO7IsaHD3TykWyJVXWx/eY53U7ukMnNFnOeiF7ezL8BoROEKy4mPuSKCbnXdb
         uSX7xdNSvFXnP0j9PwWfqI6ZVTk/fT6J25XySLxzvqvz4qKH9P0O6uBJznwz6sRYC4Jr
         iip6yIoTlPFLgiChCKw4lqJ8D+cvM0+LHxxfSNlwmGQuDR3KuDdOD/kG/NtBFKU49nbL
         RT/HsIyoCD1VDJRY8DdS6uIxA1Eq4r9+whV512Oo0qCl0buKY6DTBj3LTWI7CzK1SkTT
         PAlHkK+brot9fEaGPHKefynqNKw55fhJtEkx8n4UmsXbMY+gSPqmjEfG8uWmi6ZX4qW3
         2cDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789072277; x=1789677077; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=maCUZCHQL/0Dung/jQglQrSJpIrbe49RGrAjwhWAl9E=;
        b=gWBo/ZXPT4YZik/B+Jrmlb2U1l6J+wYXZZoaJDOG8Bn3Jgtf29X7Wyu43Adr3JDxrW
         veyxYkuPxigA0wYCWvFgvq1x9kg7uApW5OqFhijdUD/JNxROj6JZ+1FLUJS+HTOUQid6
         ke19X7blz4r5bqBC3IM41a8yXKRU2xlqMl0o/5SB7inuvrAu27CoXUCo6BP1kXXYh7zW
         x0JpnVCy20WRGC7GkoazdeuY/Mo2Y4b5EJlypHXHQyRE2mub+tE9qTwpNU6Pa8hgPUCs
         j3cNCEQL//dQnnCFSyXRsJ55hXPliYPCdeH6WDlXHKu9sUaALMSEJLpvmlfHD9+5inG/
         Xm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789072277; x=1789677077;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=maCUZCHQL/0Dung/jQglQrSJpIrbe49RGrAjwhWAl9E=;
        b=U4Jk2yA6oYyfrTHH82RuSNzfC+3ONC9v8+Hf1QdnPKw9hUEpcuocinPP+ZA8Wm4tFV
         9ORXRcOrB3gcHUJCp3CFNB9UFp5DQEf8EIkcmmY5qZP7uVSiYfvLeFS7ogcnCc6OjAOI
         Cwbea14Xf/YuyXf1Fy2tHUsbAtiPaAJYQsSuzSSo4Kg9EgAWvCTD1pjCF1zAK0Bayalp
         9eXVI/zyKnARV+BmQhIzlYUQcFh8pkEjGE0ymeeUtbBQNEfZY0TtDd3y8EfcXm8OdivF
         9ioFfoYOiZPv8Hd4aLg3xUEayYgS9vvjnTvJYzMMMZfomKtqeMJ0yhbdpZI0WvN06HdD
         wl2g==
X-Forwarded-Encrypted: i=1; AKwUvBxgOSb/wHLl5OjSsVNcfFRSLbXk2F928nBr6ehi5flLSIfP1EwYAvkPmhOZG9ZNgCpqmY8Y/ms70fy1UkA=@vger.kernel.org
X-Gm-Message-State: AFuF++mXZeWVdi6ugQ2nNPhOvS+MQWYBrEDmudx/hRicBgkMm0aQYwjH
	0Wo3S45pB6TNekHKSxQkOR3qwJwrfkwqir7zcP3qmhqdXAggZT1IaEXe2DeFA89VKdBssGBC++2
	JpoxX2gZsL4ENUYcEJUBBIov/jGG/9JuIiELkAPUY
X-Gm-Gg: AYBFou0CNyPYk1EJoVAP5b091/Qh6hgkH4cIy1v+97sG9HIDk89wWoawGQy7Wy8yZLs
	BNoZwKzzEHk/tqW6p+eXJ3DtavvTYuP5EB0oEgCJR39n4twMsLRuRWLlQTE+piqRb8bdnpg+pnX
	x8UuBlr128811HunurNY/DgjkY2iPJ8jZQQx+0qd35FBg6KJ8gz2Hapi1qxAkKyRUXpx/fPqVXI
	G8Bm+S+3NQhG8Bije1gw+oRUciSeZv0IU0mfc2zMdWa189X6g26l6Ol6s07HINPWQuNqWaArAQj
	zD3g/N+3gquvuUS3/QVqbrdgTdcECK8bWxPuW5wUmr+mzXvv2VZbvjwvX2xINptImg/763YwrXq
	tXmLhHg0DwgDXT3ReT4GzMzUfEebxpu7P6l1tYqKp1yE=
X-Received: by 2002:a05:6a00:981:b0:861:2029:4f59 with SMTP id
 d2e1a72fcca58-86b2eaf0dd9mr981631b3a.3.1789072275873; Thu, 10 Sep 2026
 13:31:15 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 20:31:14 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 20:31:14 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 10 Sep 2026 20:31:14 +0000
X-Gm-Features: AcwNN1VUXzs2Scd6J6vqkMNAsWPmubZx5Syf8DU19mCYgSWymDz_57w_RDyC_Fc
Message-ID: <CA+0ovCgMrVBnn+0d198i0th0bcr0EAwNZ=0juh1ug8DdJX5mPw@mail.gmail.com>
Subject: [PATCH] 6lowpan: do not compress headers that are not fully present
To: Alexander Aring <alex.aring@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Farhad Alemi <farhad.alemi@berkeley.edu>, falemi@asu.edu, 
	Simon Horman <horms@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-bluetooth@vger.kernel.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

lowpan_header_compress() pays for the IPHC header it pushes by first
calling skb_pull(skb, sizeof(struct ipv6hdr)), but that pull is a no-op
when skb->len is shorter than an IPv6 header, so the unpaid skb_push() can
drive skb->data below skb->head and into skb_under_panic().
lowpan_nhc_check_compression() has the same missing length check,
committing to the next-header compression path without requiring the
nhc->nexthdrlen transport bytes that nhc->compress() reads and
lowpan_nhc_do_compression() then pulls.  Return -EINVAL from
lowpan_header_compress() when pskb_may_pull() cannot produce a full IPv6
header, and return -ENOENT from lowpan_nhc_check_compression() unless the
IPv6 header plus nhc->nexthdrlen bytes are present, so that the nexthdr
falls back to its inline encoding.

Closes: https://lore.kernel.org/all/CA+0ovCjTsygN76s2o=TZqPqW8v2gBhmRnz+q6G-NaB3Cq-YPqQ@mail.gmail.com/
Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>
---
--- a/net/6lowpan/iphc.c
+++ b/net/6lowpan/iphc.c
@@ -1140,6 +1140,10 @@ int lowpan_header_compress(struct sk_buff *skb,
const struct net_device *dev,
 	if (skb->protocol != htons(ETH_P_IPV6))
 		return -EINVAL;

+	/* The IPHC header pushed below is paid for by pulling this header. */
+	if (!pskb_may_pull(skb, sizeof(struct ipv6hdr)))
+		return -EINVAL;
+
 	hdr = ipv6_hdr(skb);
 	hc_ptr = head + 2;

--- a/net/6lowpan/nhc.c
+++ b/net/6lowpan/nhc.c
@@ -47,7 +47,9 @@ int lowpan_nhc_check_compression(struct sk_buff *skb,
 	spin_lock_bh(&lowpan_nhc_lock);

 	nhc = lowpan_nexthdr_nhcs[hdr->nexthdr];
-	if (!(nhc && nhc->compress))
+	/* nhc->compress() reads and then pulls nexthdrlen transport bytes. */
+	if (!(nhc && nhc->compress) ||
+	    !pskb_may_pull(skb, sizeof(struct ipv6hdr) + nhc->nexthdrlen))
 		ret = -ENOENT;

 	spin_unlock_bh(&lowpan_nhc_lock);
