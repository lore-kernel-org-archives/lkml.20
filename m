Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186212;
	b=kh3aAfiDsdYBdyUrhQp15vQzx9TMIBT1esKoRbcY656g15mE72U9KKKT+73NSor8AunC
	 Gof3Lo6nCxnYIgaOBWMXP5E9RYzVmtDvgpK6SppguscbUsZfN3+h+VvuTG2r/nA5ykWn1
	 GkISzb4wLeS2MkD5Ra4pilfOqZUiv0tY7S6HaN5voRkrWKokTHAR21B4wK01W+wIfnWGK
	 TIxyS318kherBDIfU1OAbP8fD9gAfGvzdA0BZIUCgL06hBF3f+BJQXUFBwtK/Efe8bZd3
	 BGqr/OCSk91XlYZR1i2ArRuN1jNdPc5SW1BwSvOtclzAWgSb4fnfH2LN9FSK+g+PHKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GR/yFWtGsd7tJ+Usqsgdls8RQ503SxfITShiJgwMejs=;
	b=vVHfoE9zpcQ31uDvr8PqMoS02M6Gt7NKXlD+82ymQT0ZTxP7yqGYVWbHXHXs98AhjZIA
	 dSb651YDYJTpw1x8GZv+HBeJMDdz42i4VcymUr78mPy7OOjargy4O85oXrLy38ubYvcer
	 zCKUsWxD/JbX/xJ8ZYUuNlVE6WnOzJFc0A61Ya4yltvIRatGItev5wKJwVl/6eu6CgZ9p
	 H0qMtGedFYr/NjazatlcIjVuGEalL5EviqL6fPlPBjs0WVZqsLC0k0hwanZmx0mzmy7yf
	 4DOTbtYhCuxC4Ou3nWux+Cg8dmIsvoBJ5bYBDzIusDNcG4ZVhKuu/XCYKtClGkouu4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TuFDdViG;
	arc=none smtp.remote-ip=74.125.231.136
Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC01606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC01606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TuFDdViG
Received: by mail-oo2-f8.google.com with SMTP id 46e09a7af769-843c8bbfbc4so292214a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186211; x=1793791011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GR/yFWtGsd7tJ+Usqsgdls8RQ503SxfITShiJgwMejs=;
        b=TuFDdViGJGEL+b0nZfQKqmZyadWwdWMzBmFH+Mn7eeNaUHjaDgL07albXg0moMw9or
         9+JnvbXMRY6g0zpKWR8JMQ42xGk5CNHlmUj/wJkDMVIGSfuCf62/EwBaUIbB6CGDC0Ct
         cRRYLOBnhn+a1dyNi9s1oq/Ct4znyKZrx46NhV2gQhuDiEgOGEjkLp5guXAz3sUjbDKx
         icJWDFuwZdM+esbT/v1I1mXHJPIiH6N//3grhqxjAe4CIN4W+6sxnaVFF9gq93XKOKKq
         XHY1R737tLhs0APhGCAPhqF2V7EzZPPt18ruafFAY7KQxTCJPS3wmSYZgHCn+6DO8FmP
         p0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186211; x=1793791011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GR/yFWtGsd7tJ+Usqsgdls8RQ503SxfITShiJgwMejs=;
        b=1yfSXdUxHniMkUYPNFKpH+STioiX6BVQPo8D7Kg5QKy7/7j/Jip9gbgMuBmNNGVFz3
         iYu+2HykjbEjHc2bGOMJ7QANr78MWf03ipV0XK1ylR75tlq0rD94rSa7pSOLgzDaghNN
         HtlaqwGC13+ZpFuDN118kLkDF0MVub3sFA8c7VstNnPpgNuk9tDwUrHUFNfkl3N3e2Fx
         WGocvzD7Jc9ibZUfCA56T+r3HG9KcD6VCFhISCBdlevAddtPZmDfoxIv+A6+7jPIR0Zc
         Yz/fBJA5K2LQRfcwmLsg8j3h2kkLSAT+hutL2wLFhXcoICpy2aPf85JSLTdR0bhgSLqs
         4Wmw==
X-Forwarded-Encrypted: i=1; AKwUvBxcOCy9xYJqUWA3IYcZPE7A7Yteehq/kpYFCWAipsCxW5bVd4wOLOAX2kPWp0z8ME63btyuZPwq6iYm5+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7ya7EpQxRKvbMd+TAsG5yludLFRyHMOHOF1soeieW9zS4aDKs
	TaQbkSFy4NS6kW87wFEfN8X3DD1SGxWMs2Ar9UVaTmKh9c7LHrjcQB2S
X-Gm-Gg: AYBFou21ogkd0LFKfxVJNKCaoOql0vUQDHWx7Rlc20QAa/DZXdzSy2hcBxw9oOG1NYx
	DOg8GXZm77xcSztxW6D+gFqe34IYs37PDE2ZafHTPSXw8A1uZv5iRLV2xseB6V7wZNLgSVVhF4b
	iFUs6OjaMn0tdLtNW//Vw8wGGwFIvBKDWDF2LmV/fjpJCJFwrd+9xlNX7TIVS5+XpR47rovy12D
	vqK58NTH4GizD3WIpcrYWpJR9LZw7ue4VCVF7Ys2Xa1ed0OTNqhwsoQ+UptNo+iTVBoKTm+kyVz
	FhsEicGvOmpfbgDyqaZJ8X1uf/UVltqdLZIEfnXAO/MmoCu4ED/PaHbKCYrZ9TeZEXGebZxR5Uk
	w+X/60NyuZ5hTjivM+7pEbAopPcj/5x2LocAbhpHyJrW/WWfHyoaY27gEU/il+q1bpzBJQRnp0a
	ZZcDgmJa+4KTPSiXax1uYF5DnAqT7yOSIjcszIjCI8mFKkOj5cuFBJSa8RUtlPo2vbqI078e1Te
	uFOLembrhTecSfDGyfyiLYH6KryOc/QSiMJJ6ysY6NDc810WKRKbe0CjpwgrFec/B+LRFMbEpQq
	yJ3JKbvj6QdK+qO5J8BJIKOvj7uBRoRZx01JzAD5rv2Ryjiup5a9MpPJrGAubTBhN8n0
X-Received: by 2002:a05:6808:2229:b0:4c3:6d56:77c2 with SMTP id 5614622812f47-56382d8e3b4mr1287682b6e.41.1793186211387;
        Wed, 28 Oct 2026 04:16:51 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.34])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b77ac4e4sm2003351fac.3.2026.10.28.04.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:16:49 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Ido Schimmel <idosch@nvidia.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Petr Machata <petrm@nvidia.com>,
	Ferruh Yigit <ferruh.yigit@amd.com>,
	Antoine Tenart <atenart@redhat.com>,
	Seungwon Bae <qotmddnjs@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v5 2/2] vxlan: reject VNI add when the default fdb entry is nexthop-backed
Date: Wed, 28 Oct 2026 19:16:26 +0800
Message-ID: <20261028111626.3460759-2-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261028111626.3460759-1-bsdhenrymartin@gmail.com>
References: <20261028111626.3460759-1-bsdhenrymartin@gmail.com>
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

vxlan_vni_add() installs the new VNI - hash table insert, group list,
socket attach and the RTM_NEWTUNNEL notification - before calling
vxlan_vni_update_group(), which in turn calls
vxlan_update_default_fdb_entry() to store the group (or the device's
default remote) into the all-zeros fdb entry of that VNI.

Now that vxlan_fdb_update_existing() rejects appending a remote to a
nexthop-backed default entry, the group store can fail with
-EOPNOTSUPP after the VNI has already been installed and announced,
leaving it half-installed: present in the tables and announced, but
with no remote stored and no multicast join.

Check whether the default fdb entry for the VNI is backed by a
nexthop before installing the VNI, and reject the add up front.

Note: the missing unwind in vxlan_vni_add() predates this series;
this check avoids giving user space a deterministic way to reach it.

Cc: stable@vger.kernel.org
Fixes: 1274e1cc4226 ("vxlan: ecmp support for mac fdb entries")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---

v5: fix a build error on current net/main: vxlan->cfg became an
    RCU-managed pointer, so reference the function-local cfg
    (reported by kernel test robot).

v4: new patch; the failure path was made reachable by patch 1, so
    guard it before the VNI is installed (sashiko review of v2).

 drivers/net/vxlan/vxlan_core.c      | 14 ++++++++++++++
 drivers/net/vxlan/vxlan_private.h   |  2 ++
 drivers/net/vxlan/vxlan_vnifilter.c | 14 ++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index 3390e341d1e58..13143085065f6 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -422,6 +422,20 @@ static struct vxlan_fdb *vxlan_find_mac(struct vxlan_dev *vxlan,
 	return f;
 }
 
+bool vxlan_fdb_entry_nh_backed(struct vxlan_dev *vxlan, const u8 *mac,
+			       __be32 vni)
+{
+	struct vxlan_fdb *f;
+	bool ret;
+
+	spin_lock_bh(&vxlan->hash_lock);
+	f = vxlan_find_mac(vxlan, mac, vni);
+	ret = f && rcu_access_pointer(f->nh);
+	spin_unlock_bh(&vxlan->hash_lock);
+
+	return ret;
+}
+
 /* caller should hold vxlan->hash_lock */
 static struct vxlan_rdst *vxlan_fdb_find_rdst(struct vxlan_fdb *f,
 					      union vxlan_addr *ip, __be16 port,

diff --git a/drivers/net/vxlan/vxlan_private.h b/drivers/net/vxlan/vxlan_private.h
index b1eec22163608..0454689965aeb 100644
--- a/drivers/net/vxlan/vxlan_private.h
+++ b/drivers/net/vxlan/vxlan_private.h
@@ -11,6 +11,8 @@
 
 extern unsigned int vxlan_net_id;
 extern const u8 all_zeros_mac[ETH_ALEN + 2];
+bool vxlan_fdb_entry_nh_backed(struct vxlan_dev *vxlan,
+			       const u8 *mac, __be32 vni);
 extern const struct rhashtable_params vxlan_vni_rht_params;
 
 #define PORT_HASH_BITS	8

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index dd94085e08865..f07ae2a6a59ed 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -737,6 +737,20 @@ static int vxlan_vni_add(struct vxlan_dev *vxlan,
 		return err;
 	}
 
+	/* A default fdb entry that is backed by a nexthop group can
+	 * never take a remote; reject before the VNI is installed,
+	 * otherwise a failure in vxlan_vni_update_group() would leave
+	 * the VNI half-installed.
+	 */
+	if ((group && !vxlan_addr_any(group)) ||
+	    !vxlan_addr_any(&cfg->remote_ip)) {
+		if (vxlan_fdb_entry_nh_backed(vxlan, all_zeros_mac, v)) {
+			NL_SET_ERR_MSG(extack,
+				       "Cannot add a remote to a nexthop fdb entry");
+			return -EOPNOTSUPP;
+		}
+	}
+
 	vninode = vxlan_vni_alloc(vxlan, v);
 	if (!vninode)
 		return -ENOMEM;
-- 
2.43.7
