Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3718B3E63AC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791397015; cv=none; b=SoUxyoQV25ykvVHTrvVaorta5J5ClsuiPq4hCO4WeyiHz6gD69eZj6ltSdr7NqQB8pf0nfwBY1XBMnlVV5BWhgINGxvt/pzQflbbi+F1DElhhXa9Oa+Z1o+Co+7ea/P3+0/JoGvFfK6T7HeMUPhxqQIsA7wsgSwtVGdure+v6eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791397015; c=relaxed/simple;
	bh=SB4NDDKRAhqSJIc9FavKPbItFv2yX/PiEJ0MJpAzuVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QivxT8GiBC02nSnwYHadpyWTFNrPIFAltvc5bYjfQ4J3v7BBt96BqnWKpVlFZhQf1qdJb2RiZvtdFJBxhSZE2CpQdvREf7NSSZyDEpl1aA6NRGeoO4hZUOHtUO2gCZotsxpQbcZpUu5NZprIL1JZXXVrlHAKAWHDuALg2kT3Znc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=DwCApEzT; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="DwCApEzT"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91054f537ccso23544256d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791397008; x=1792001808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v9LzkPOzVBtC2oeBzL2RQojlIYdLdy9WRgZ+InvbO8E=;
        b=DwCApEzTOcjs1Ik9Y6zAw2DFEdXPQV6mWNK2FgXlEpn0Ajy5Caw20hy1fEPKy4R/Qv
         dOGDzYneuMXTJj9J4w9OeORvVKyc1WteXcoSrD9MAzADDmGcTUuoJRoRWkWlbM4Xkf3w
         Pj4FdGrI5vm+XfcnM96Ao5wBFihBkeHzx83u9eTazUMT3YC3HsHAWVfilwnrJQ5wbqda
         L7leCAJ6U/AteWl2RwPeY0StCu0pncvwSEVM2lKvbvGQbOQYlm2JYDw1eOpe0rT10sm2
         9DgdU0zAizraGaoPglMrV0lRl9iaR5q8Nsmmup6DRH4CGmd5jMHXrG4lXQAmLCjfxTHC
         Y3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397008; x=1792001808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v9LzkPOzVBtC2oeBzL2RQojlIYdLdy9WRgZ+InvbO8E=;
        b=GD4Y0CxF5o/LaIbAEY5Lp21XKGw8JEfWp+xpeGpzjar/fPXoCIxzi4Kd1FFJusrJTR
         qLtZ86kqQ2TcO15b4EUSndChTXOzTCdGKDl5+xQI3OlNVQjTYjWC4xyMTlramijDp8wb
         r42ItEykhPJfXQhZiyXnKRhXJ5YevEsLvK6k69pRn49EjQM2/BoMSnP5cTiUMew81T5o
         P793BmGWBTSLauOVOxqhbqRahMHbLz+Pkbu4v8leKtqyQesTRwoismFOnjkvx0ylTCFx
         vArs28YX3uYexEMcue48spqWenmKmBdi/QAPQbIG/4iqm0GX97jp5PUQBYFihOpeCP86
         uV1A==
X-Forwarded-Encrypted: i=1; AKwUvBwgP2Z3Dvnan4F7lxPrtb5VizcHHCl52xv5yoGakNP4gbe+tw3J2eRrMk1mdq1eVb7YnAb3HcuciIw1apE=@vger.kernel.org
X-Gm-Message-State: AFuF++l7h6uklZRrTP8GzVYfDqIQYTQWfl3OoIi9lv2z5bW0nU4tnOD7
	r426wKGSHrzrM7OnKipqCiw9n7NRp4670/htXDu202NqggyO05upoz2/x//B2Es7Ye0=
X-Gm-Gg: AYBFou0BoG8m/YUkdmfAlwRg6MJ0xvz0krmiYJFa3ASc8hfuy402VZHAulsGTDn38QZ
	oxAi8LS219pRi2WXW973OpYJIYzqF89rXHU4lDRmBDeslkRQKK4QuesNi/bGHh+621XPjlu+xJq
	inHuqqhXZPWPXFqSAVmKQ0uzCWfUjWuGFqRUcDa4VmTpe2yrIOez5qQTOWmQH8uUN/zj13FA8nb
	oP3mBuiDWU3z9OP5yCw9duCGCWR+guQVdDx+PunwmGbUBLs7Qz+WnCbblL6hIBrU0jdVy+JsGK4
	b8a31QOCCQN3hFRVclhTmmymxGliLTOsYMLwSMkuGT15Dsdbyx348H9tiqA2SFaDg7nvP01ZkWT
	9vxJd3VNT86Z7TVqXPHA0ED2KFhCOm4mDqQUMWjxd25EY61Zy/WOisG9KAmGH3ge+N2fdssCPZn
	LYFlUZU+8QYGaqzsIFZyMQDXyVugt530FwKxHUu4Pk9B6X//rcXwU/0PjcX3NRhPslT670jH1zg
	MQnDXCyUDPJhyo=
X-Received: by 2002:a05:620a:1d01:b0:92e:bc28:5479 with SMTP id af79cd13be357-93e9b0d409fmr622164685a.2.1791397008056;
        Wed, 07 Oct 2026 11:16:48 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91996cb6482sm26056716d6.14.2026.10.07.11.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:16:47 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 18:16:21 +0000
Subject: [PATCH net-next 8/9] qlcnic: use pskb_may_pull() to pull excess TX
 frags into the head
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-pskb-pull-tail-drivers-v1-8-9512b0fb977b@toxicpanda.com>
References: <20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com>
In-Reply-To: <20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791396985; l=1162;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=SB4NDDKRAhqSJIc9FavKPbItFv2yX/PiEJ0MJpAzuVo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKawHW1ued0W6S4cwaeFnOXmxDTI/W4Hxcn7RUYBu6+BybT6utdZRP6YL9LzmS5Mmr1yUPxsj4f
 B1rA2kxPagA8=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

qlcnic_xmit_frame() pulls the frags that don't fit in a TX descriptor
into the head with __pskb_pull_tail().  It already checks the result.
Switch to pskb_may_pull(), which takes the length the head should end
up with and checks it against the skb, so this driver no longer calls
__pskb_pull_tail() directly.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
index 761ef3bc8193..4a81d499e51c 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
@@ -682,7 +682,7 @@ netdev_tx_t qlcnic_xmit_frame(struct sk_buff *skb, struct net_device *netdev)
 		for (i = 0; i < (frag_count - QLCNIC_MAX_FRAGS_PER_TX); i++)
 			delta += skb_frag_size(&skb_shinfo(skb)->frags[i]);
 
-		if (!__pskb_pull_tail(skb, delta))
+		if (!pskb_may_pull(skb, skb_headlen(skb) + delta))
 			goto drop_packet;
 
 		frag_count = 1 + skb_shinfo(skb)->nr_frags;

-- 
2.55.0

