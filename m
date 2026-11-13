Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578790;
	b=yaniwU/JG6/B65Vu0p9oDJ3upZ3zcFStWwDuiXJKaYgocLkokPk5sHb5aY4WqZz62/HV
	 RTiMTGTxHnsw+/J4EPc5yorjzyAQ1rMOOV9xscoUjFf7zEC/R3IJ4S60hSCPuj0aZqS4v
	 0O3v3Yck0B7+haXtUGOkVWAzd/+EtIN2c0F5Td8Urylarsp/X4iwkgqiO+RksrNMXW85r
	 FH2BKbllre/46OuCQpuWXtfn8hIpB/bCZZSCrHidlxFShH4ZwqnxKt//oFjQnGKVccIVh
	 2I5oGaTv/ltqwXB3PhKqShnX9EG/qKxCH9nlpT7WBg+v8HhMIRdHHSsykr/P4iYrT0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578790;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=BJ3Zg2LuETTfUENUITc6hrcKBX3tPly71UN4bC3tlhI=;
	b=Ap9nl9D0DxR9p2dUrr37vh7U8b0l4w+xEJ1BIzLR/4/ce0T4qJSvHOa+M+Px4bt3oD1g
	 D/hOJV+ZR/tV102cGCvjYKDHh3mVKo2Sf4t5sYiiDwQrVafgyMhL5rgP7+n9MfDSRYMY2
	 szRcAeYLubbphtMS1HjJjQkH7ma43CmOI640ta5ckpiaNdtBsK2wG1ohABn2W1fLFKLep
	 R1FH8s6T7lNwQYixsbC5PzvvS1zmYH45lrhcS8p99MgZ56Wc4DjnkDCRyc7oskoVWhGj5
	 udP3Vnybpi4ppg6KbbKmPjn35rYqB1tGjZ8P1LCnF8GGaUt4Ib09lSluiIW9hshh2fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o5iRXkmV;
	arc=none smtp.remote-ip=91.218.175.251
Received: from mta0.migadu.com (out-251.mta0.migadu.com [91.218.175.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B144606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B144606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o5iRXkmV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=a0kLJxc0CRDtsrFClTrJ0QiOKpkb8qwufEPWUUn02cY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794578788; v=1; x=1795183588;
 b=o5iRXkmVtH7rviUtb+RAdfprkEgrcLXLJOHt5GxAUZ8bbM/4Mf64k2OUpjcNenk114ASPH48
 UI6SHVg2x9Zx5eS533x4TvGO1PuDTeMmWVp0ra3LnphM7+j0vFoUefTkDXjK6HY0EeTMT5u7Zpe
 msG7Rb3hWiJZdeUMkBrtCkMs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 67f8c472fc21e3c5;
	Fri, 13 Nov 2026 14:06:28 +0000
X-Mizu-Trace-ID: 67f8c472fc21e3c5
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Fri, 13 Nov 2026 22:04:20 +0800
Subject: [PATCH net-next 5/6] bonding: factor out XDP slave check
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-bond_enslave_restruct-v1-5-364c549e78db@kylinos.cn>
References: <20261113-bond_enslave_restruct-v1-0-364c549e78db@kylinos.cn>
In-Reply-To: <20261113-bond_enslave_restruct-v1-0-364c549e78db@kylinos.cn>
To: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 Hangbin Liu <hangbin.liu@linux.dev>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

bond_enslave() and bond_xdp_set() carry near-identical XDP slave
capability checks. Factor them into bond_slave_xdp_check() so the
two paths cannot drift apart.

The only behaviour difference is the netlink extack string in
bond_xdp_set(): "Slave device does not support XDP" becomes
"Slave does not support XDP" to match bond_enslave(). Logic and
return values are unchanged.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 drivers/net/bonding/bond_main.c | 52 ++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index bb3752683456..5e36612cfaec 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -1884,6 +1884,29 @@ void bond_xdp_set_features(struct net_device *bond_dev)
 	xdp_set_features_flag(bond_dev, val);
 }
 
+/* Verify that slave_dev can take part in the bond's XDP datapath.
+ * Returns 0 if the slave is usable, otherwise -EOPNOTSUPP.
+ */
+static int bond_slave_xdp_check(struct net_device *bond_dev,
+				struct net_device *slave_dev,
+				struct netlink_ext_ack *extack)
+{
+	if (!slave_dev->netdev_ops->ndo_bpf ||
+	    !slave_dev->netdev_ops->ndo_xdp_xmit) {
+		SLAVE_NL_ERR(bond_dev, slave_dev, extack,
+			     "Slave does not support XDP");
+		return -EOPNOTSUPP;
+	}
+
+	if (dev_xdp_prog_count(slave_dev) > 0) {
+		SLAVE_NL_ERR(bond_dev, slave_dev, extack,
+			     "Slave has XDP program loaded, please unload before enslaving");
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 /* Make the fully prepared slave visible to the rest of the bonding
  * code.  All fallible steps of bond_enslave() must have completed
  * before this runs: error paths never undo the publication.
@@ -1982,17 +2005,9 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 	 * XDP can never become visible to bond_xdp_xmit().
 	 */
 	if (bond->xdp_prog) {
-		if (!slave_ops->ndo_bpf || !slave_ops->ndo_xdp_xmit) {
-			SLAVE_NL_ERR(bond_dev, slave_dev, extack,
-				     "Slave does not support XDP");
-			return -EOPNOTSUPP;
-		}
-
-		if (dev_xdp_prog_count(slave_dev) > 0) {
-			SLAVE_NL_ERR(bond_dev, slave_dev, extack,
-				     "Slave has XDP program loaded, please unload before enslaving");
-			return -EOPNOTSUPP;
-		}
+		res = bond_slave_xdp_check(bond_dev, slave_dev, extack);
+		if (res)
+			return res;
 	}
 
 	/* set bonding device ether type by slave - bonding netdevices are
@@ -5764,20 +5779,9 @@ static int bond_xdp_set(struct net_device *dev, struct bpf_prog *prog,
 	bond_for_each_slave(bond, slave, iter) {
 		struct net_device *slave_dev = slave->dev;
 
-		if (!slave_dev->netdev_ops->ndo_bpf ||
-		    !slave_dev->netdev_ops->ndo_xdp_xmit) {
-			SLAVE_NL_ERR(dev, slave_dev, extack,
-				     "Slave device does not support XDP");
-			err = -EOPNOTSUPP;
+		err = bond_slave_xdp_check(dev, slave_dev, extack);
+		if (err)
 			goto err;
-		}
-
-		if (dev_xdp_prog_count(slave_dev) > 0) {
-			SLAVE_NL_ERR(dev, slave_dev, extack,
-				     "Slave has XDP program loaded, please unload before enslaving");
-			err = -EOPNOTSUPP;
-			goto err;
-		}
 
 		err = dev_xdp_propagate(slave_dev, &xdp);
 		if (err < 0) {

-- 
2.56.0

