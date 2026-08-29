Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A513BB116
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788023231; cv=none; b=td6pcweI5QisAQGF3ie91PtSIKJKqz+BjRIhWOS6XnvjWxfyiQAPvZsZ1cqS8WW0NC3JKy2NDli4RN//9nSH9EDUgwy6/uWN5JbYT4PFqY3z1+5ZJqbT6YoDb+OObarMKqjGknA5Y6ipdWLdizITgjxSWE34zIiE03wmvPVPj6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788023231; c=relaxed/simple;
	bh=pHbnwUN3UUCK4uiyoAaioeKCV4llbaKe1YQzv4Jod+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h256sAhNHbTP6oYDdLj2bt5Tnkp1/K3/s0eVD7AkFd5u9zWIY+2bvXKIhgYAVrpnOzJRZF/3UWFyK9NEACEUVtKjxpmZ59YS9z8NNWA1zGsw8TLE7QbOh8AyjNeuNC7Mi9OGAJ+IJdDyF7E2iEYFjJHU0vtJAOq3mhBXAQGbIKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUhQOgkQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUhQOgkQ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47de0093c42so1985466f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788023224; x=1788628024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qc1W4fex00U+eOWL5xaR6NDiG48y7mOQwn5RsxVM7a4=;
        b=fUhQOgkQ0huY0PfIjDpKtX1qwp34/hG2mIsavIkzOoZg17PInORw2E/9dkI9JWV0h6
         ZpApOoJxEDvO1ZvoD9C7JgcRm5DbFyD6oSGBqQDOSyo2/fBezZzv/wwYePwsO+5gUTCA
         KUlOSsMkQ9Oh4rh7FjYwQUXTSIDpYkCi/cccV/ISEYGdM5lB0iebrZPZLH8vG7OlrEiO
         7CqKYJwXQyon7Un/HLV+yg0ZU2f8JFnTVL5wBMw84lPT5wWTLxIHhoYTu8xyzBi94OHj
         sBDha1hvlxaDa9lSjuZnDtm3uDX2mnBPoDqVJKPusuKdb7OW/7JCtskFY39ebZ3ICv+t
         2lyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788023224; x=1788628024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qc1W4fex00U+eOWL5xaR6NDiG48y7mOQwn5RsxVM7a4=;
        b=W4roSet8RL7SoxOWDdhgQpG6+oxG446895VkUw4VM2ogL8iGFPMFPD3t9fJ2YQ/ZKl
         z0LZuc/QRzDftJsx8zMSJIut7FoRZDP95ujOvQhhH8aeTzI94nTu+LJepXTaMzibXCUw
         5sy9XFDbL0f+R7WXVdCGPIWrdhJcOSWOLOlPMPqazXjZcHcA7ut6sOdDYmjl+7g6+mfp
         PSoRk5yAJ5rOu+zhj7euGIymkl/HxmH+Wliv1VgjN0LZ8imBiPMgRt9h+h1T6O+XmmL6
         pqbzJjA6g2gIhuivjDG6738RdYX6hagvsbllBmzcn8nAOOdtLuvOtSEsm+iYUxswzv4J
         yMhw==
X-Forwarded-Encrypted: i=1; AKwUvBxnd4cW7T4nS/l5HycEuAkIi11uthgdH9W12WrXs1W7C5sLB0Yau0QMUxFbimAM4d8Mcz0CjbP+zEeq8rI=@vger.kernel.org
X-Gm-Message-State: AFuF++l+gl3m3WpxWpe51OtLVqvk+OXR940awqXIbtO6Q27vkpmsRDAb
	NPI+nGgqVBAaTycN9n8rVlXoYmis+GIC4MHurvkY8BqpL4iS+2zgoJlo
X-Gm-Gg: AYBFou1DPLvoWAvtQMEGpSUkZLk4rufoli08quaSpU7lA1A/uvrGhB7+Au+rMheYdQu
	KEZoGRgNrEuS2bw1wS0yNkKEVINjK4moE0CDU3e0MBzOzCnnIeHNX37Tu5a5kOpZhzOrwhSXnls
	bcaYm0kbKQ1tpdHe680TfzcSRlUdHLiEjHmRaXXCTn8JkWPdpq9OgY34F9g/VYl1V3kvB9J09ny
	3VmYIQ3H/PVKGRsC1l4kAXMw6kMA9Q9fTXUxKdluVufGStlXdMjsIi/Yjb8D+P6t9en6C3i9yJ8
	ipEHfHOPicirMi0o3jvWurXl0QI0UjtqJavkTpTO/rVgYx8v8F6gW60hmb5Xrcp0mC7fwBaAb1+
	X+v2ST0nlOI3Ww5u+HcQspKutfDId+27nCHGwhq1jpqzxOZCIvkDLDxSmVByMUAcH3Zi1SlAHTN
	SMwNa3e/nv+ciZ4aFmCip/JtTG3aZh7o30JGzp0yc6n/jNNL28vZif6UH2KNwGQdKOIg==
X-Received: by 2002:a5d:64c5:0:b0:47f:8b24:ef01 with SMTP id ffacd0b85a97d-482f7977aabmr22156144f8f.1.1788023224359;
        Sat, 29 Aug 2026 10:07:04 -0700 (PDT)
Received: from SurHub.localdomain ([102.213.68.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbad04d4sm11936201f8f.15.2026.08.29.10.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:07:03 -0700 (PDT)
From: "user.email" <suruurism@gmail.com>
To: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: subash.a.kasiviswanathan@oss.qualcomm.com,
	sean.tranchetti@oss.qualcomm.com,
	horms@kernel.org
Subject: [PATCH net v3] net: qualcomm: rmnet: require CAP_NET_ADMIN in the real device netns for config ops
Date: Sat, 29 Aug 2026 20:06:56 +0300
Message-ID: <20260829170656.15548-1-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Abdifatah Suruur <suruurism@gmail.com>

An rmnet device may be created with its real device in a different
netns than the rmnet device itself (rmnet_newlink() resolves it in
link_net), and the rtnl config paths below only check CAP_NET_ADMIN
against dev_net(dev), while mutating rmnet port state attached to the
real device:

- rmnet_changelink() rewrites the endpoint mux table and
  port->data_format and, via rmnet_vnd_update_dev_mtu(), can shrink the
  MTU of the rmnet endpoint netdevs.
- rmnet_add_bridge() and rmnet_del_bridge(), reachable via
  ndo_add_slave/ndo_del_slave through RTM_SETLINK IFLA_MASTER, flip
  port->rmnet_mode and port->bridge_ep on the real device's port; with
  bridge_ep pointing at a caller-owned device, rmnet_rx_handler() then
  forwards real-device ingress frames to it.

A caller privileged only in the rmnet device's netns can therefore
rewrite the shared cellular data-path state owned by another netns, and
steer its ingress traffic.

Gate all three with rtnl_dev_link_net_capable(), matching the "require
CAP_NET_ADMIN in the device netns for changelink" series (vxlan/geneve,
CVE-2026-68432).

Fixes: 2abb5792387e ("net: qualcomm: rmnet: Allow configuration updates to existing devices")
Fixes: 60d58f971c1077 ("net: qualcomm: rmnet: Implement bridge mode")
Cc: stable@vger.kernel.org
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
---
v3:
- cover rmnet_add_bridge() and rmnet_del_bridge() with the same gate;
  they mutate the same real-device port state via ndo_add_slave/
  ndo_del_slave and have no capability check of their own
- correct the impact wording: rmnet_vnd_update_dev_mtu() only reads
  real_dev->mtu; the MTU store lands on the rmnet endpoint netdevs via
  rmnet_vnd_change_mtu(), not on the real device
v2:
- drop Reported-by: (implied for the author), per Jakub Kicinski
---
 .../ethernet/qualcomm/rmnet/rmnet_config.c    | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
index 78d4df55740a1..50c60e553d09f 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
@@ -312,6 +312,14 @@ static int rmnet_changelink(struct net_device *dev, struct nlattr *tb[],
 	if (!rmnet_is_real_dev_registered(real_dev))
 		return -ENODEV;
 
+	/*
+	 * The rtnl path only checks CAP_NET_ADMIN against dev_net(dev),
+	 * but the port state mutated below is attached to real_dev, which
+	 * may live in a different netns.
+	 */
+	if (!rtnl_dev_link_net_capable(dev, dev_net(real_dev)))
+		return -EPERM;
+
 	port = rmnet_get_port_rtnl(real_dev);
 
 	if (data[IFLA_RMNET_MUX_ID]) {
@@ -440,6 +448,14 @@ int rmnet_add_bridge(struct net_device *rmnet_dev,
 	struct rmnet_port *port, *slave_port;
 	int err;
 
+	/*
+	 * The rtnl path only checks CAP_NET_ADMIN against dev_net(dev),
+	 * but the port state mutated below is attached to real_dev, which
+	 * may live in a different netns.
+	 */
+	if (!rtnl_dev_link_net_capable(rmnet_dev, dev_net(real_dev)))
+		return -EPERM;
+
 	port = rmnet_get_port_rtnl(real_dev);
 
 	/* If there is more than one rmnet dev attached, its probably being
@@ -488,7 +504,19 @@ int rmnet_add_bridge(struct net_device *rmnet_dev,
 int rmnet_del_bridge(struct net_device *rmnet_dev,
 		     struct net_device *slave_dev)
 {
-	struct rmnet_port *port = rmnet_get_port_rtnl(slave_dev);
+	struct rmnet_priv *priv = netdev_priv(rmnet_dev);
+	struct net_device *real_dev = priv->real_dev;
+	struct rmnet_port *port;
+
+	/*
+	 * The rtnl path only checks CAP_NET_ADMIN against dev_net(dev),
+	 * but rmnet_unregister_bridge() below clears the bridge state of
+	 * the real device's port, which may live in a different netns.
+	 */
+	if (!rtnl_dev_link_net_capable(rmnet_dev, dev_net(real_dev)))
+		return -EPERM;
+
+	port = rmnet_get_port_rtnl(slave_dev);
 
 	rmnet_unregister_bridge(port);
 
-- 
2.53.0

