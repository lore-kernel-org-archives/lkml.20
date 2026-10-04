Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1973A4483AC
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791117783; cv=none; b=spAXRJ/4TYbHMrTsX+0WeN2D1oJnO+MQSKskB29lqcPayQlQlg8dmnKG1X/yRgPGyRk9d09IctcWhDDl+w5mw/OKX3IE3xgunBW1u/gIwOCXkW+BcKQzYDC8RUhCzfXCu+S25RfBsNaJ3YD18ETC2V1Tgqlk3po7qZjmatwiA9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791117783; c=relaxed/simple;
	bh=tTgrBs3Hgw+xZh6szNsKjeuhK4AVLdIPNXX+P4056Go=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FXmeQcEmzUu821yCt1pis683NUqEp61m7pPfjH3Fpw2gIUsmFb2SKN0rvn0zWi+5CLHka9AzdD8EwuTxKUg2/RPY6VBmt0VvxOZHa+xRSdawwf5D6Ab93IpNySeDX96hHUArFZa4T/xCtcMo0BiDnkxfdgA/e2bvt8I7kxYLBfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=zQHtGsX6; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="zQHtGsX6"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e32f913c3so159867866b.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791117779; x=1791722579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eos+MZIZfy20RrX7r6puDDSBR2yAZWLtl2ZkahKdzuk=;
        b=zQHtGsX6JJaiQKrlhREB3iUwaH8qmqw6rNp0c8Ud/HZ636ON4MvvzaN0UogjDNyX33
         35/TXygpOW4t73T5qCDZJ8Cvhdace3WThMWYy0U9BeGj4uoS+98Yx/Ot+HXBnYT0ytvF
         FvPi21hYfXjyq4mZ15DnYkHT5of9anG8qaFR/DcqOzvtbJwGnvrqe6cUYKghLcfY0+sc
         KcTCJ89i7XWwg7InonywHRKBP8JYtXZKsj7Lr2v9B9Q1vT70pTCe9b9gKJeNs5VwYPAS
         hP6jUahNnQQq+0i59N/yLaa4kw3PhgKa4unGVnn48NreFSmk1AFUrsnAdPTGgdQwgIOi
         bxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791117779; x=1791722579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eos+MZIZfy20RrX7r6puDDSBR2yAZWLtl2ZkahKdzuk=;
        b=TuNQCidRfaWACn74t14dgaVLr9M9/kwBreaXDTumkt8T1QvqUVzmhy1cCo0ky2U4tP
         0J3+6UZkJPiVwuVSFGMyqCZY1tWxt7i2eW82nI+3n7S/o2kV7wE+Pr2qDsQavWvVFkXt
         f7Cc5dAsMNrxCZwIXtafct+pUFcwLryQRAQTE5NxNOZ0BNy+ZS2G7+mef/AE8J6JufE9
         pVdYtoV6jNJ7Z/j3DBX91Pn4Dfee14JBkFdfA3hbPFDW85Fm2mF03sXDo4NTYuNj/F+j
         4KRc+yv79dOaT93NRiNN8jI6na5w7vk3hJv8CyY2MVDvcy0qSQbsOCVseGQAMM8MwI3/
         aG2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxuEx6chZryiwcHCanTQTcZfiTtwAtN+tVWo6zsbluB+fUrjkFm5WNiM4fVspbbiW6zwOHMn6iwYCmCM04=@vger.kernel.org
X-Gm-Message-State: AFuF++mQVhtRIAuGHru1m0uqK0SwIJsZYXMSnX+Jl3u51OWd8QXCLWmc
	nauhvI7JMk9rCZTnWl98tp8AG6CN2y2muTxB9+hs0X8eCOm6B9MEHY7MwC8Cd9CtjQ==
X-Gm-Gg: AYBFou30VXrmAS2oclRiQkWM8tXQ9DkDFPD/u+/uvRkab8xHfWQGfma9VQTBorKMZKW
	3WGmauvhHWmiJHh7BLmsxBj3Pg0qF9k4ziYJjiAZMc56ZcZT1n6VVnRD9xlB34dRV11JCfMp5j+
	yQATKxi/42vZSW+7Xas+VGP3MjhwWtB92URYXVPHfh6B6XUfUXtv02eHAAARNeQg/MhkRFW1tHk
	aEnwpPhEgccyS+BA+8zSqM6pbQwIxA6cJ3jEkuzZg/KDnAmP3CuyVsNxQnq7R1reVLYeDRVzJMW
	t6nUbrZJ0vbYzWU8+H0OTxtlxu011DxFAEOZlscptDZcCMh6CP/c0hZoFB5Td/6F6c6b0PmfhDV
	CYsaWO3+0IX2davJdJo0EZTmK+8o2W/oqa5+0PfOkmCbUeiz5Bh0iI6jLrmhXK/Yvu3bCbtyAbE
	cFk1HdP0iHTDej5abDNSl7QL5+KdoFHN8+wzGWDVY16KGmkVCSr34Vfj457vNzCzotdSA9JS959
	fhKsJk88WKA9p+A+C1Ac+kqvcjrWRfMnhpK+GwRc6U9+TyQOc+WNx5Rc/PLGdcO20aPsBJ+iWG0
	7UOqkWEvkZVdDxOOpGELI5+HHyqzDlfilhF2FymWgWT0rXYTNUllaqR0zwBXZjlS1bQse65flhm
	kI/R8N/kcGClBSWiyxB39MXeYr8PczWZj1UUSlKCdIE+3MhKAOeT2CKZL6yTkxL/YYy078F5Dau
	i5A0IllpzQXI6MFswE02JJ5wygeSf+VwwjwQqBLA==
X-Received: by 2002:a17:907:6d0f:b0:c2e:4196:b167 with SMTP id a640c23a62f3a-c2e4af2bd94mr627719266b.18.1791117779193;
        Sun, 04 Oct 2026 05:42:59 -0700 (PDT)
Received: from Desktop.fritz.box (p54aff5a5.dip0.t-ipconnect.de. [84.175.245.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e878b1784sm62473966b.3.2026.10.04.05.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:42:58 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org,
	bridge@lists.linux.dev
Cc: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: bridge: fdb: hold hash_lock when an entry roams
Date: Sun,  4 Oct 2026 14:42:54 +0200
Message-ID: <20261004124254.3525496-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

br_fdb_update() lets an entry roam to a new port without holding
hash_lock. It notifies switchdev that the entry left the old port,
writes the new port, then notifies the addition. When two CPUs receive
the same source address on different ports, these steps interleave: a
driver sees two deletions for one addition, or an addition for the port
the other CPU wrote.

DSA counts references to a host address on the CPU port. The extra
deletion fails and the extra addition is never released:

  qca-ppe 3a000000.ppe: port 5 failed to delete 02:5a:0b:a2:1a:46 vid 0 from fdb: -2

With one address roaming between a DSA user port and a Wi-Fi AP port of
the same bridge, the error appears 3-6 times per address when the two
ports receive on different CPUs, and not at all when they share one CPU
(4 runs each). With this change it does not appear (6 runs, different
CPUs).

Take hash_lock when the entry roams or its flags change, and send both
notifications under it. The common case, where the entry neither roams
nor changes, stays lockless.

Fixes: 90dc8fd36078 ("net: bridge: notify switchdev of disappearance of old FDB entry upon migration")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---

Notes:
    net-next 941056f91907 ("net: bridge: fdb: factor out existing entry updates")
    moves this code into __fdb_update(); the same change applies there.

 net/bridge/br_fdb.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/net/bridge/br_fdb.c b/net/bridge/br_fdb.c
index e4570bbed854..c8680ae3ef08 100644
--- a/net/bridge/br_fdb.c
+++ b/net/bridge/br_fdb.c
@@ -995,8 +995,17 @@ void br_fdb_update(struct net_bridge *br, struct net_bridge_port *source,
 				fdb_modified = __fdb_mark_active(fdb);
 			}
 
-			/* fastpath: update of existing entry */
-			if (unlikely(source != READ_ONCE(fdb->dst) &&
+			if (likely(!fdb_modified &&
+				   (source == READ_ONCE(fdb->dst) ||
+				    test_bit(BR_FDB_STICKY, &fdb->flags)) &&
+				   !test_bit(BR_FDB_ADDED_BY_USER, &flags)))
+				return;
+
+			/* keep a roam and its two switchdev notifications
+			 * atomic against a roam on another CPU
+			 */
+			spin_lock(&br->hash_lock);
+			if (unlikely(source != fdb->dst &&
 				     !test_bit(BR_FDB_STICKY, &fdb->flags))) {
 				br_switchdev_fdb_notify(br, fdb, RTM_DELNEIGH);
 				WRITE_ONCE(fdb->dst, source);
@@ -1023,6 +1032,7 @@ void br_fdb_update(struct net_bridge *br, struct net_bridge_port *source,
 				trace_br_fdb_update(br, source, addr, vid, flags);
 				fdb_notify(br, fdb, RTM_NEWNEIGH, true);
 			}
+			spin_unlock(&br->hash_lock);
 		}
 	} else {
 		spin_lock(&br->hash_lock);
-- 
2.53.0

