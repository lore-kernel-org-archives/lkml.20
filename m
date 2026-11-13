Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794598449;
	b=Rmn42cPeTDtu6d0fID10QqLNDiRYl1P5zzEMH3eAvWfdnl1yeU/H5ZGA7ovOSAV8ON5u
	 uYZ1w4NaZPd774QKcrEEtq1942Ti7abno3LDIUpbzEzCs+MLfa3jDvvTdzYa2rh2Sx9B5
	 j5LwSTAjuqYaMQgO/SCWmZwXMjIb2uGsB5rG9RveaKoM1bzWzzlKx0E6VcMJAmXEmNNV4
	 /uTha74p+ZYDg1x7FNqytKYk7Nj4wnHdQzclfdx61JWvHdQFeuvb1oDE4egt4vrhulHOG
	 PjR6cWB2stHKQwdV4mnZiTxBlVyd+oHo21YuDI+BZozo6Z84zsxCmazLnwdRaaDek2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=amJUpy0muk67Lmtq4mgK06dOCjsDhS8b31fd7d7HHbw=;
	b=w0bEphlMW9c+RbTMtDK/iNTN24tTz/jcc2wVNrTHzlqiNBBPRZ2Gh0D7SdN8uSz3SD2U
	 f2Ynhmrrn75teqfNjFfFmjDaJeB2eNibzpZfe5/W78Pfruh35N42WG70eYSzymyCe76fR
	 B1rWqV7NrlUvkLYwnwAbEmv+wsfHGSrvyIzwCu8ieQVGK4OpAG1ApnWFAHiUI9HS7/e96
	 VcdkcRoHGJLTJFaMBCvEBh4DKsomPa1lOMADUTnDQ5U13A2pQaCanxAv+EAF3C8l+wEdg
	 kMUGIKHAoJbgNk4nATJULdevF6qcmF3QA/lnrRzuJ0/nSlNsy5jiIGO5tLvQ7slmJkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Cr25mBJN;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A6D606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A6D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Cr25mBJN
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67c24619b19so1021942d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1794598447; x=1795203247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=amJUpy0muk67Lmtq4mgK06dOCjsDhS8b31fd7d7HHbw=;
        b=Cr25mBJNTaPYaFybl/WgcQYQZD+BXuInesiZbzsy2EXZcc+TdZKQ9R/KGTNt9/J0dq
         Ef6erL1FBd5HvgdjNNoM8g566RL2k0kDjzqAozFT6RvoXADFn3bi3aw/ko/gUQOShvCT
         pnqh716dNkuYPCobelnggPblORQ6SN/GDojTO562hoUJRyLPTZaA72U71sho/DeWNDd+
         4Jw8LqPGtLIgjdy03iZATRPhlJzmifJFqT42vzcTZk2HKDOEsM+GFAAzIYkzA/cQ137c
         D3Bijroi3RKdgeGtVzCVhlQ4QrWOHHJou89exmajFNOKS3uaDG52PXaMKRnLy/fJihtM
         ALsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794598447; x=1795203247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amJUpy0muk67Lmtq4mgK06dOCjsDhS8b31fd7d7HHbw=;
        b=V19GobQdwdOgJni8OCdX1Fe5jwdvNnG9q57og09b0dVRvX1imjaBr+ZbjqdJIueoWl
         zSrcU4bwsW+OuiaAp123uEKdTK2G+Zu9Chdv4iK9nPVwCAAW0d1f+nE5MXOWusaTNYfg
         GFuF/siRLg5YZRXaxbLSr0kCbXxukhjp7YpqhCmp8b4HoK0khL4dKbSZC6Ui3OMR58Fi
         /pcikGm4sOXJ5sbxbhdxDNPKUZPM/P8oduWuiUl0+7Sy2+4OPe6dcy09qo4FG8lltKJn
         EpXUgwUdWttzGIEgPyMi5WJjUyDb4nnY75yHedu7hr6Rhu2lo6832pxUEgkHZhbuXjUu
         SGEw==
X-Forwarded-Encrypted: i=1; AL+hErEi+Rpppj3nS62qENbE8Wa5qbDltnj3IWbev5n7vwlF/BH6xvrR9HOsQUX1lwHq9DonKpApP8gVrwceIwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EHOP7XPr/8QeJsWZs0U/0HiaQGVcKGSWvrgC+ERCGC4eMZ3Y0
	QDWrueK5SRBGmRvCz2oushF3tn4A1kgpcOAwOo3iQVhkCO64MNVWsbz6115cL1fcPg==
X-Gm-Gg: AYBFou0A/CH65PV+lbjNg7z2ji3mB+3pefLC9aHaUVJdCJbX/e5HhTE++LOM0jdWIZH
	nwdTD2LZsqNpPZPHsGiDzM2s4s/AK9SldztWKLkIWtA0nae1oy8KfFi8XtWqOHvgGhEaEzL4Czj
	hzh7ch5M7Qbn5IQoOn60FGTo7FEexDJhFTi0CgiQYBPQyC8tIhY/+sCgkEQUe9CR1qdLHb9rHL8
	IpS8oLSR5Xzf1ea6cQ3VQebaeiaK7wqY9nW/oXLQi9Vl1a7hd4ot0210wibOojjYgHGmqhx+ktw
	guknDf+evz+/BfuDwbPi4GFMYnqbFg9uCv5IpajsO+ywRe9nknH1mDSFLGu0VpoL8xiAcsz/pO6
	a7/dZhlzcuNws14KgSwH7OjgQwhVVQiX5D+BSreEqRY7Q5z9F1mhywKWZYX9CjF1jCyBJOYwuEj
	iWElovk9LEFTfxKoJHS0NxFDke7ro4jjoJgtT3tNd/EXXo8oZJ9/Ez5iMWPJXKc6tLMBP24JxvX
	H9U63+MtlfrIxGS77+SR74Mb71REz4sJFGN+0g+Z/LjKV0roYk+SNRg2dqbkKnr6kPnvqbsj6Ao
	sVTJLJheLQI6n/2j8W6WcZayTyVO2usLa55w0FuiFwIo1q5zdYA=
X-Received: by 2002:a05:690e:810:20b0:67c:2752:e528 with SMTP id 956f58d0204a3-67d896a2a02mr1517407d50.63.1794598446787;
        Fri, 13 Nov 2026 11:34:06 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a433a15sm2868680d50.2.2026.11.13.11.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:34:06 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Simon Horman <horms@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] neighbour: do not update an existing proxy entry on SIOCSARP
Date: Fri, 13 Nov 2026 14:33:55 -0500
Message-ID: <20261113193355.3820232-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

Commit dc2a27e524ac ("neighbour: Update pneigh_entry in
pneigh_create().") moved the update of flags, protocol and permanent
from neigh_add() into pneigh_create().

However, arp_req_set_public() also calls pneigh_create(), with all
three set to zero. As of now, SIOCSARP on an address that already has a
proxy entry clears the flags of the entry and makes it non-permanent.
The entry is then removed when the carrier goes down, and the host no
longer answers ARP requests for the address.

A similar issue happened before with the protocol. It was fixed by
commit cbada1048847 ("neighbour: restore protocol != 0 check in pneigh
update"). Perhaps flags and permanent need a fix as well.

The issue can be reproduced with:

    ip link add d0 type veth peer name d1
    ip link set d0 up
    ip link set d1 up
    ip neigh add proxy 10.9.9.9 dev d0
    arp -i d0 -Ds 10.9.9.9 d0 pub
    ip link set d1 down
    sleep 1
    ip neigh show proxy

Before commit dc2a27e524ac ("neighbour: Update pneigh_entry in
pneigh_create()."), the result is:

    10.9.9.9 dev d0 proxy

After that commit, the result is empty.

This patch will add an update argument to pneigh_create(). Only
neigh_add() sets it, so SIOCSARP leaves an existing entry alone again.

Fixes: dc2a27e524ac ("neighbour: Update pneigh_entry in pneigh_create().")
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Tested on net: with this patch, the entry stays after the carrier goes
down and the host still answers ARP requests for the address, as before
the commit. "ip neigh add/replace/change proxy" still update an
existing entry, and SIOCSARP still creates an entry when there is none.

 include/net/neighbour.h | 2 +-
 net/core/neighbour.c    | 9 ++++++---
 net/ipv4/arp.c          | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/net/neighbour.h b/include/net/neighbour.h
index 79a5a548a129..d6d691fec124 100644
--- a/include/net/neighbour.h
+++ b/include/net/neighbour.h
@@ -394,7 +394,7 @@ struct pneigh_entry *pneigh_lookup(struct neigh_table *tbl,
 				   const void *key, struct net_device *dev);
 int pneigh_create(struct neigh_table *tbl, const void *key,
 		  struct net_device *dev, u32 flags, u8 protocol,
-		  bool permanent);
+		  bool permanent, bool update);
 int pneigh_delete(struct neigh_table *tbl, const void *key,
 		  struct net_device *dev);
 
diff --git a/net/core/neighbour.c b/net/core/neighbour.c
index d6e9c7c59a89..ae2db3912454 100644
--- a/net/core/neighbour.c
+++ b/net/core/neighbour.c
@@ -783,7 +783,7 @@ struct pneigh_entry *pneigh_lookup(struct neigh_table *tbl,
 
 int pneigh_create(struct neigh_table *tbl,
 		  const void *pkey, struct net_device *dev,
-		  u32 flags, u8 protocol, bool permanent)
+		  u32 flags, u8 protocol, bool permanent, bool update)
 {
 	struct pneigh_entry *n;
 	unsigned int key_len;
@@ -793,8 +793,11 @@ int pneigh_create(struct neigh_table *tbl,
 	mutex_lock(&tbl->phash_lock);
 
 	n = pneigh_lookup(tbl, pkey, dev);
-	if (n)
+	if (n) {
+		if (!update)
+			goto out;
 		goto update;
+	}
 
 	key_len = tbl->key_len;
 	n = kzalloc(sizeof(*n) + key_len, GFP_KERNEL);
@@ -2155,7 +2158,7 @@ static int neigh_add(struct sk_buff *skb, struct nlmsghdr *nlh,
 		}
 
 		err = pneigh_create(tbl, dst, dev, ndm_flags, protocol,
-				    !!(ndm->ndm_state & NUD_PERMANENT));
+				    !!(ndm->ndm_state & NUD_PERMANENT), true);
 		goto out;
 	}
 
diff --git a/net/ipv4/arp.c b/net/ipv4/arp.c
index 1ca4ced280ae..3bc8db6ccd68 100644
--- a/net/ipv4/arp.c
+++ b/net/ipv4/arp.c
@@ -1099,7 +1099,7 @@ static int arp_req_set_public(struct net *net, struct arpreq *r,
 	if (mask) {
 		__be32 ip = ((struct sockaddr_in *)&r->arp_pa)->sin_addr.s_addr;
 
-		return pneigh_create(tbl, &ip, dev, 0, 0, false);
+		return pneigh_create(tbl, &ip, dev, 0, 0, false, false);
 	}
 
 	return arp_req_set_proxy(net, dev, 1);

base-commit: ead6fa9a0ab194f02a2f36d634b193e9c5f9a1c6
-- 
2.53.0

