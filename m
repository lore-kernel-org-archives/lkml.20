Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86570377AB7
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790020549; cv=none; b=WhteUhq0KlxUQI1fmU2MK8RMLTcH4OxB/nGOCsUx88o4JMf2ZSRq8ytr4/mxbJ3Muq+K6Vbv5lHxHP4sE3+PbaVgyX2Hu5n0XQU3NRQiuXUdjrK/6/DeozC2OnfDF74QkzzXOI/xlM3TkfjjoTtuoI8NLE9hWB8GfrSc/DXDzHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790020549; c=relaxed/simple;
	bh=Am5y5kVXC1GCV+x7y5IybqM9iUf0OMU7dWzYv1FKPVc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=oSOGuDzYSQui3SAcW89s/koW2EFG2kjMcoV2ppfR08L6JW8X5qz/CdSuj3EvaTyXBBDadcXK0/mMoPezuVU1IsJpkyUaKD0RAEYQRVAX8G7TxhWQsXZiDX9r/UJXG0gCbtEinqUw41Dm2zbephHDz0Pje/kKsTsyH5MVxKmMvDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iSO9S9RV; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iSO9S9RV"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso4478827a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790020546; x=1790625346; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ra9T6cXaJqhPT0CKcD2IvswPIchXtKvGq79KsKugZds=;
        b=iSO9S9RV6gK3j01BNIYZtSm2UfFKioKYB247pPjpigbmQf2Fx37Kogftg+5CJl91YW
         VfbKIvo4/wquPMQLHrm7h0aAgj8tFD608G30E6DGjqoVbBxCo33Gg8cVqINWfZcpHHX6
         OWBS0LUUI8qHd8OO2EcH2mktSi8gf7LQpCm9H+AvwdZF3CgWV/GAnj/18d/y/1I3jkVO
         EjFs3OMZP6Px5hqBK2w8BfrhsDWFOtpxhdT7uVRSZgCSdGQj72YDwDLcxymfhQlCqAI7
         O0EkG/cDE1IAlnP9F60jXGho4vwi/UPiPWh1peIDoaMf9dSTqbrAxzuVyncdEbO2fOg5
         8cJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790020546; x=1790625346;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ra9T6cXaJqhPT0CKcD2IvswPIchXtKvGq79KsKugZds=;
        b=i6YXJ6mPxTvQDDLJxm83A6XFP2avTx2CEmscpLP45B8t4ZASE3gQKNwPb8OAhLLR1q
         5J1vijSMFPP4X41UTd8kiHexQh2rL/UrYF+fBCOtgmKIlBnaxsP5oX4YX/hk9wU9emwr
         DCUPJ5zScEM1g93pLHbK4/dMriFR7TNbtB8r8WAJY2+X+RhOwYRFckRQdn6lPlvFmSdZ
         jIaTupmzyvChoNHazS6r7/bzSB3ShG+9CX1r7AbJcXIdJ2LmQc+W1Q1rc2lY3LIbSAKH
         w+OTl+kIGsNcq3eNjefUHtbnhGFtqvQz+OrLIua1TQ211eor1M83Ki0ylpsshTs7xio6
         Ycyw==
X-Forwarded-Encrypted: i=1; AKwUvBzEegsBKYg8gOw4SdOuXEEUSCuwiYRH3+FzCtW2Nz3LxulxyErrGP/cerEEeoLWIsMycGg+DhVtD1OlCO0=@vger.kernel.org
X-Gm-Message-State: AFuF++lODBWtO40yD2No+d3oc9zyDdZ6PMDNuOw3vu3E7NoAdszYAKYm
	xjvuMgVEwRe45/OMrm5bUooHT4orrQaPOSx/7/VHjh7KMGKdH8rb8tsu6x4wMpQSIylgAuNAU8l
	XmBoaICd4imbdoNGuMzwyo77H4A==
X-Received: from dybml44.prod.google.com ([2002:a05:7301:152c:b0:33c:22de:a582])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:1f8e:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3dd8c2ddfc8mr18304093637.2.1790020546275;
 Mon, 21 Sep 2026 12:55:46 -0700 (PDT)
Date: Mon, 21 Sep 2026 19:54:12 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921195545.493253-1-almasrymina@google.com>
Subject: [PATCH net-next v1] net: devmem: document that bind-tx is
 unprivileged by design
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"

Unlike bind-rx, which configures shared NIC RX queues to steer incoming
traffic into the caller's dmabuf and requires CAP_NET_ADMIN
(uns-admin-perm), bind-tx only DMA-maps the caller's dmabuf so the caller
can transmit from it on their own sockets without affecting other traffic
or device configuration.

Add a comment in netdev.yaml and above netdev_nl_bind_tx_doit() to make it
explicit that NETDEV_CMD_BIND_TX is unprivileged by design.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 Documentation/netlink/specs/netdev.yaml | 2 ++
 net/core/netdev-genl.c                  | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
index e13461cf3fc33..4303593e5003c 100644
--- a/Documentation/netlink/specs/netdev.yaml
+++ b/Documentation/netlink/specs/netdev.yaml
@@ -852,6 +852,8 @@ operations:
       name: bind-tx
       doc: Bind dmabuf to netdev for TX
       attribute-set: dmabuf
+      # Intentionally unprivileged (no admin-perm / uns-admin-perm); see
+      # comment above netdev_nl_bind_tx_doit().
       do:
         request:
           attributes:
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index fa9edfdb32c29..690c27f63d260 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1180,6 +1180,12 @@ netdev_find_netmem_tx_dev(struct net_device *dev)
 	return NULL;
 }
 
+/* Note: NETDEV_CMD_BIND_TX is intentionally unprivileged (no
+ * GENL_ADMIN_PERM / GENL_UNS_ADMIN_PERM). Unlike bind-rx, which configures
+ * shared NIC RX queues, bind-tx only DMA-maps the caller's dmabuf so they can
+ * transmit from it on their own sockets without affecting other traffic or
+ * device state.
+ */
 int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct net_devmem_dmabuf_binding *binding;

base-commit: 8830e65ed46de41f849eefb8ba227d4852c460f6
-- 
2.55.0.1082.g2b9226bbc0-goog

