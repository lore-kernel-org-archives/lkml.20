Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A37C37883E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338058; cv=none; b=MKzvR+qMEJ+rVpnIZQN2LDHPJ/MTdR181ibmVLMHKYPzJmw/Z9GjZrU00w0Pb77as1VqEMo9yeYW0n8nBz2e0IRonUCnJ0WzFoblnyWjW8rBMbj3CqJyjStxfjV9YEmTbhCQIxP21DR7VVJilmRcr72j2NNbhHhOO37kBHEY9jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338058; c=relaxed/simple;
	bh=nQSMfLXooTdM45Aimk7uiT9RoDYsM7bG1cJP54C7pfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CCAGDS+eeziHd97jUHQxbrZpTqtmEu9tGf3nSd0orPL5VfEyMDLMgHNx06eDqlt+X+9Yi+n6g4Kp30VQVQZfMTI9v9HLaNcITH7vS0G2bq/+r93enMoNayry30HewRn7Tmw/JuuWG5gk76KmZRnZomXCIQuJX1TEeOXFs6x0eUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TToWNUaI; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TToWNUaI"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8558c0b26a8so639254b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338056; x=1788942856; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MxYlVCLZdHbqd24Lf2nyCsb+xngw/v49TM27dJoKKB8=;
        b=TToWNUaIzVpT43/eIGmJ+sOviGw2SfZ8QptGM38+SAOSxmkvqNYz8eIbdmJFYn83uq
         /nVkVStUn4g8joTePTsh8Vhe7/ZU56dDVpDZt9lunDTEGQVeEvFFsQ1F5zUZMfNq8RPI
         Sql79FsEQrRb7iocvyoVGgxqGuZhJ2ouDWef80ihihUijrsru8/94BV6Ed8N1g2ywXVZ
         pVxlhLQoHme9sGYw8MiQVtvh1d2qt43rvP+H3FT6meqhJr27FrGwKE0f0k6UCCDtXV17
         KcQ7wt+2aGc967l3KYLxSJrJVdgIRhvlD45vkTBLmBWOkKLN1TleIHOEBPFr782WxLTg
         2F1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338056; x=1788942856;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MxYlVCLZdHbqd24Lf2nyCsb+xngw/v49TM27dJoKKB8=;
        b=H/XJxZ8X0r3vstX3Zxw6kIGPBIGTHFac8Bn0hKnzs1h1tFW2VlD0eIkTOUcL2fPsbX
         I1/V5Ig/LjnJgP47Ubtna5cFtxuJRUFUfIvfiKGGr+pZbs8IulohvSQd+1nDlRwDnwgV
         Emh5hCmtHkQxmU9nxsJw1sMZUQnG0GFYzrGJowmWxByFkTIgItu8X01v9u6WmoyG+sTp
         57dxuEO0HEYb3jhWxhcXPY96LTrZ8u6h30wLzWlbHJZEzWc27MOPx8ruE/qshjttLYF3
         T4oRgh33obzaoCa7A6HVttOLQsWMVnoXu4c5lKIz0osBGDK9x27oQame/ptEU3Ue6Wsb
         VPKw==
X-Forwarded-Encrypted: i=1; AHgh+RqLqA6mvDrDhVqC/WDdcaJ81isU5AzXRyAo3Euav6DaLsFSN6FmhH0RlwD5+DpVxfgtJ0LAaYbcj9ZQEXM=@vger.kernel.org
X-Gm-Message-State: AFuF++k6GDI68hqkV2rvfiOGK1kNaOsCHK367+AHXDypkJMXKQJrY+GM
	8sG6Aat+Txx2aKjkg5mmmCgidc7o7L4JvainwDqiPV3jgHWMzqbnAolEhBB0z4pt
X-Gm-Gg: AR+sD11EuWMRZvpmFd1zfBrvEGtAiWsYA6EObofi9vrt3nrH/ocwUmEIM0CB72pbpuN
	0kuAC+YvLsp1xKU1rzeO/vGbmMZXj0RWFrOes6emt5xIw8ZcuxnSupLnAhIk/ulkdh5XhGjGXYX
	2LkgspWShNOQtH+/xpKYhQ5pT6a3p7Y3GRNLqgOVrxg+AJ1oamXOdbO4Z4tZk1r3acpfIyAsqfN
	qENPyP0rx/6aJGWUCc1z7aqQKKQLbo1FwZd45GMKtT0Vas3BIHHOS0oTAPob0qMMc03LYY1mXOC
	uMXMOSG2+OCaRc4/5z/wPR5/P57Fijatv0N4npJIH10HYJspUAz5pfYHVzJnsRHNzZ0MHlUKR9Q
	0pFBo9RGaggRtOGfpqwA6QyWObamhelXgrUVM/moTC/2YIRm8apcT5wL7F6HaAK8tnrmziGqL8E
	9f9P32CK9jL4YMRgoi4TzvLMYRi/FOcSTHnOBn3Rj6EjMAjPaIja37wadz53gqCQe2NiET8y8=
X-Received: by 2002:a05:6a20:a124:b0:3d3:af85:eb99 with SMTP id adf61e73a8af0-3d9af3f35b9mr4310867637.27.1788338056366;
        Wed, 02 Sep 2026 01:34:16 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc34d0022c7sm726419a12.15.2026.09.02.01.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:34:15 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Wed, 02 Sep 2026 17:34:13 +0900
Subject: [PATCH net-next] seg6: reallocate the skb head on L2 encapsulation
 only when needed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-seg6-l2cow-v1-1-e823ce216454@gmail.com>
X-B4-Tracking: v=1; b=H4sIAITfl2oC/yWM0QqCQBBFf0XucwPrGIr9SvSg66gjscbOVoL47
 231eDics8MkqhguxY4oLzVdQ4byVMDPXZiEdMgMdly71jGZTDXd2a9vaprBV313Lrli5OARZdT
 tN7siSKIgW8Ltb+zZL+LT94Xj+AAFIu4leAAAAA==
X-Change-ID: 20260902-seg6-l2cow-77dc3ba41232
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=nQSMfLXooTdM45Aimk7uiT9RoDYsM7bG1cJP54C7pfM=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBql9+FlANzp9nxfyrPzdLUPJx3pqGmrdCXoEf+4
 riHCgA2duKJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCapffhQAKCRAq19F1Kl0b
 TWa+D/4mWf99a/uWnnddkAbdfKxfimeoxmhbibYJ6ey7R67XQsLRX/ixjAbjAd0O2sTvdusSLZJ
 tkFR+vKXbc9mONJuiiu03A+LigfUAjgWU6N/hLrYMXH3XUpwNr21QBqxW2Hpg5OYUSTfFTJFzB9
 b42plVdTTu7gWGpvNzrPABaGz5n699ULJZliilMYag2bPGKrt+StlDO2W9IHl2vVvuVig9452RP
 YQlxObylwpy5UgTtdHCmPs+2gIKSPoLnFVt02RMZnIZvezw7CXS8gOHVdwcZXvla9C2WrPbPPgF
 WV/AFIKRwBoMpsAljygK2rPnisqIRswwGAJyOkU08/5EI+91uSqraLpKfGfRw5o4YfGVd/or/Db
 c6tG9MR/hRG8WuHhzSlHBXAJTESbQtpeL/LtrIUh4uB8J6SaMjeoeQc5gwwa4qUG8eHau8uxOHu
 C+aBlQ4dMy6XcxTjXlOQd15MsbWrR4A0m7yv0pcGCLbGBfS1UW3xaI4yJngOHRv6fbA9LFH/++t
 LU8Z4yekS1NHl9r/kKpM++iKCCpK6GYUwpzefDQSp189+72BhNWJkW168GXFr/GqFaErqvkiYX8
 vh75ZEL80UtyqdoObGxbAmj3Yd4r+1MOlEFu5hGYEbz2i3TRxBwCrBnhRNBYJS7OjXwWbpoSROQ
 PY30aMtKkEi/6nQ==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

The L2 encapsulation modes of the seg6 lwtunnel reallocate the skb head
on every packet, where the IPv6 encapsulation modes reallocate only when
they have to. This site only has to fit skb->mac_len before its
skb_push(); the outer header that follows is already covered by
__seg6_do_srh_encap()'s own skb_cow_head(). On a forwarding path neither
reallocation is necessary: ixgbe leaves 206 bytes of headroom, against

  14 (skb->mac_len) + 40 (ipv6hdr) + 24 (SRH with one segment)
  + 16 (LL_RESERVED_SPACE, via dst_dev_overhead()) = 94

for the whole encapsulation.

The cost is amplified by CONFIG_INIT_ON_ALLOC_DEFAULT_ON, which many
distributions enable: every new head is zeroed in full, and that memset
alone accounts for 16% of the datapath profile.

Use skb_cow_head() instead, matching the IPv6 encapsulation modes.

Throughput at 0.5% packet loss, 64-byte frames forwarded through one
2.30 GHz core (Xeon E5-2650 v3, ixgbe 82599ES), offered by TRex and
binary-searched over 10 runs of 10 s:

  Before: 660.7 kpps
  After:  991.3 kpps

Assisted-by: Claude:claude-opus-5
Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
 net/ipv6/seg6_iptunnel.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/seg6_iptunnel.c b/net/ipv6/seg6_iptunnel.c
index 61c6a27bf202..a6556efd8e0b 100644
--- a/net/ipv6/seg6_iptunnel.c
+++ b/net/ipv6/seg6_iptunnel.c
@@ -446,8 +446,9 @@ static int seg6_do_srh(struct sk_buff *skb, struct dst_entry *cache_dst)
 		if (!skb_mac_header_was_set(skb))
 			return -EINVAL;
 
-		if (pskb_expand_head(skb, skb->mac_len, 0, GFP_ATOMIC) < 0)
-			return -ENOMEM;
+		err = skb_cow_head(skb, skb->mac_len);
+		if (unlikely(err))
+			return err;
 
 		skb_mac_header_rebuild(skb);
 		skb_push(skb, skb->mac_len);

---
base-commit: c8ea08ba34f2a2e9bfb18ff3d69eb2d69b324f49
change-id: 20260902-seg6-l2cow-77dc3ba41232

Best regards,
--  
Yuya Kusakabe <yuya.kusakabe@gmail.com>

