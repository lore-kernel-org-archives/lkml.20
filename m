Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C625C43F0BB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493416; cv=none; b=amQoPEBFh3Vv2eb5wg4IAx6YzOWVdIrub0ejZyczoGHmNpY+i9DyYMQ7z9Ikgtf3HZZdf3CxP/ZpKgsHDrjhEDMz6mxzgj9uGzS82G4ROBaGQc5iR0tF+fYXxbssisccpRNh3EC8EWnQl5a6RE21pkNErEAQWtyw1DzZsHDwO6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493416; c=relaxed/simple;
	bh=3f5WzTjnDsDOAnT0hR8gZXIWFT9KoT8c/AVMjDx6NOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ikfd3CM6716DBUzDDlUhegJ5kr0zfnhd8HE4sfGsVevT4EpxTikY4pxreT/h/Wb5eCmgPmkhfI9+E2f9tihY9OZi064QGxqrI+VNMz98UOjHlecdQZHpY1iBC0vvZ8gkCWdTrm09BYAYCsCoklTIvFsmoY/izAADuSeEc9YJRww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=q7pzm3nr; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="q7pzm3nr"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53381e53b80so38886541cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791493410; x=1792098210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blrnvRK83a0BrC00ZsKjSLnGbEsSK17m6K1yrBXm/SE=;
        b=q7pzm3nrFDtplCyFUQ2gMv1Uz59Vk3Up1x+wsTJP5aAGDqd4kqjwAGU2qebIPCtwEN
         PBRgOvLMPWJFn4NOV4DMZU3RWVV5R2hK/JKmk4ym6BrIZzZwpysiExnW3DiPDpnbzLzh
         7soCgzjgGz2WRekTxJNydvIyyes3/wBZID4pF0MZEMVVFJfX2ELHel8PVUUYDUCrfDOj
         jAWOabz9qAx/QGzQ1yXwMSI/GzjlFAtyDihsj/Yd21lkB688nZqzCe9Fp1PC+kxLHch2
         nif2IB7em0In6/IjmmOwd5Y7lMK5ZDUCW3oLVViyqKtW3AqsB3YhgZhotV0Y46e8SUhn
         8vLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493410; x=1792098210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blrnvRK83a0BrC00ZsKjSLnGbEsSK17m6K1yrBXm/SE=;
        b=UCOLATiPiCzCanCIV7TNykgYX8XcSxGE4ENF1lESf9XdAidPbVwYOSVlb0dNUEM/vL
         B+MSK2pg6tLzre+J+pMaLchv34fTLT5JwOF9BJ9MlmFzAKkOujdM8+xFiH7cYHkspkPw
         kNjr3l+JeUoQd35jBLUdbW49Ws1edRIFz9cHXSK5l8tRe+RTfSiBGAZSlPULZwXaLJQY
         6FXD4TwKlOlrB1AJg0b5ml+/H49O4aFGCyhIPJaRznRu6VwLdefihJQyvE1+s7tqIUV9
         XeC7GURm6mnzqLbSreYXLMDuKeblzSyJq9+AJd2/cob3hpC9wGN2E1wa8Ho7uolQVohq
         Ji5g==
X-Forwarded-Encrypted: i=1; AKwUvBzRLHWdXUYZ9G/hfAtSRH3n5r/S5o2NXc2318fFrfK06jk0/Y/VY1e9KlubU+syEyUMWSsJjgvh6qz4gQM=@vger.kernel.org
X-Gm-Message-State: AFuF++nusiZxTpZYGcb5n2sqd8tymsL7QjHnwHBmtezpX00Oa6O+7Qq5
	sjb5+kzsfB5WT9nibQsLRheZ3X91EFraTHYhoNap/HCHA65qxeC0SybLAZTZQ6hRD+o=
X-Gm-Gg: AYBFou0izvpPpnzdJX+1B26ZHZEDwEmHV8Yde9IxTlFfz4+WX0OG5FoEWZhtTg9fPFv
	EnhgrrFR0231Xf9FJTqAXkQFQaY8FUCfQ1L+UmnZh5feN+U69wik/bXvSfGFwq0mfCGX7423hBk
	owdmDVDPUDfMSEdPYrZPZX3dPLIOKKOuVys0Aex+yCLpPb7vzibfdBh1q+nsgWJ7gdO8oJCH7Ti
	YeCc6Na3lcWvt7OYwTt9rqjHOCn0MjHmOeRapEiVyt1R4UQUGEykvaSSro3THKdRib3PF2jIPpv
	9NFG064kQI7G/kg4ctAAc8/avrsJqvJPytXJruG5kJVSaQvQvvKBBmYRmVMza28dgA+oXVl6q4/
	JgUKhleEdvGt23wweECCv5pAt3pSwN4mBsIiLQaP5n3WMncwFA8ePTRjeAqFgZGpc1E4Y/kq1HG
	U2z9IoaGEoQkVDkxXuUo9CDdo34x58tnTvPR5sCY1tPncVMnqFxH8vggm5ZPz32OkiPF8oDxWxG
	FJ74NVGFcatKZE=
X-Received: by 2002:a05:620a:1d03:b0:93e:9809:dbff with SMTP id af79cd13be357-93e9b8ecbf4mr1178890585a.82.1791493410404;
        Thu, 08 Oct 2026 14:03:30 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb99074f7sm22172785a.46.2026.10.08.14.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:03:29 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 08 Oct 2026 21:02:51 +0000
Subject: [PATCH net-next v2 04/10] net: niu: check for failure when pulling
 in the RX header
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-b4-pskb-pull-tail-drivers-v2-4-8f2bd9bee138@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791493385; l=1236;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=3f5WzTjnDsDOAnT0hR8gZXIWFT9KoT8c/AVMjDx6NOM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHTAZLO2IxS2OmXjiwrMC0xtj/kaDkW3OSxxKLc7dWB8wtA0dY5E/Ye18IDZRljWIONenVbHWP+
 B0r4Rpj6pmA0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

niu_process_rx_pkt() uses __pskb_pull_tail() to pull the hardware RX
header and the Ethernet header into the skb head, and ignores the
return value.  If that pull failed, the skb_pull() of the RX header
right after it would BUG() in __skb_pull().

It doesn't fail today because the skb is freshly allocated, isn't
shared and has room in the head.  Use pskb_may_pull() anyway and drop
the packet if it fails, rather than depending on that.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/sun/niu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
index c74a97fe5464..d1c0e868004d 100644
--- a/drivers/net/ethernet/sun/niu.c
+++ b/drivers/net/ethernet/sun/niu.c
@@ -3488,7 +3488,11 @@ static int niu_process_rx_pkt(struct napi_struct *napi, struct niu *np,
 
 	len += sizeof(*rh);
 	len = min_t(int, len, sizeof(*rh) + VLAN_ETH_HLEN);
-	__pskb_pull_tail(skb, len);
+	if (unlikely(!pskb_may_pull(skb, len))) {
+		rp->rx_dropped++;
+		kfree_skb(skb);
+		return num_rcr;
+	}
 
 	rh = (struct rx_pkt_hdr1 *) skb->data;
 	if (np->dev->features & NETIF_F_RXHASH)

-- 
2.55.0

