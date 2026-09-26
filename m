Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88708363081
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790401209; cv=none; b=h7EyH0i63NHU9Q1TZf2T5vkrm6OtMZnxXBSC1asMpr2BTbiYFUcNHMkbLTt9GFFsEh/TMZ20FnPlFjMP8QGLuO5gnCkK6yHXylm9vvvNHTjEAZVlFRrFkZQueh8QPW3RfXkb24o+ODuEmKtAfGojt46AXcw/UZjc+dReIU1weeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790401209; c=relaxed/simple;
	bh=HbE8bRzC3Goxq4kk8a/U3awPlEBLYj8peqtDmlNZCg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gh7b58gDc0sryoQuGeIRwN7kUnE8pRWtKy888g6tYzXE905EUrffDaHmFAWZVbXXR6EKxubH3CuTfLIR1dDPZ+ZaUYzKOTf1UcpxCVDq0hX+vUIxlQO+KwsaV4CrtAFqPRgakQvT+7e3dZuPk4YHKI/xmoTax04VZQWxFuJgicc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQbjL4fZ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQbjL4fZ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso857030a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790401208; x=1791006008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/LOtpyVE9/QTeVfm3A+dR0c7jnfkvZnCHDHej3iEpao=;
        b=CQbjL4fZG0bQdK6PdSMYy4WllTuc5QowzGNl8qeixG/vS9Sg7bmO82W7+FHU2ubkcP
         01Vv1vi5ueo4+ou0bod5rN2tezH1Si+E7z0QpQX1jdJf75tw9yZRsorfQaShCn4eq3hp
         iZAHP856fgojfimLaakg+ubQWoR7TAxoLDgJE3PLDuFcEGjLGFWSXVKr2qXbTSNshh73
         vmNQmRwTUbUTBCVkhuXYiikbiAReQSdUSuOTCpj4IaDXfMJUFJoVo6SzZlGfVYw32awE
         YMQbZ5HcVJV2c6BJ8R0o5SeBwIIyiTXH0K5bdxgPnS8TqDMm6zRdphZDgNMYo0Kk4Nj6
         GzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790401208; x=1791006008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LOtpyVE9/QTeVfm3A+dR0c7jnfkvZnCHDHej3iEpao=;
        b=caGeNM0mARZoYHP5s2cttGLP/SUYU3yjogQWRtmDdZr3kqGJVSGkOD4lhBEFlFNlLq
         IKXRQXT6ogyKoRoXaee3TPPBatHaB1Jmw+upyohAeg1v5xTZLCfSs3ty6HcOCi9SmjIc
         Plg5Sfyj4G20VgnYx0sAGUEjTIzo0zwpkrQqgbDDm5ovAxaFyKiXld7xfN7vUUfg/1Wl
         GFgelAMJNJzl5GlVvnx+YOKPsJdjyz5iP1fq1jDppoNvI2scO8hAK4j4hoXBDVuswSIS
         ZOSDl76t0uHbALSuVPl3g5QhkPAN5PKz3ACeXxE+lmX+TyMYhQDrFepeFavROohjeD/D
         dcZw==
X-Forwarded-Encrypted: i=1; AKwUvBywi/cZIAt4OY+tATHtu+DY1lCkEx2hUS77u6QY9/2y2uteWzxliITxw+3Jtq3Gdl3XmIxGxZLkauT80u0=@vger.kernel.org
X-Gm-Message-State: AFuF++lsLLW9DCyopef8r5Ii5/9dhLR4138YfJ3TLZgJFtU1jlmXHbbE
	Y0o1Xj5wuZoWYSYv7fEBELa6Lrbfv0UvJP8pA8K6I0L0YpksFozxktB0
X-Gm-Gg: AYBFou2kpal8VpMePpRtCBEUJVsGAbZNo+g7Y4h1d6h2ED36qaFgDykRdy81cwOJinw
	r9etjQYbPTPsOE4CAWBObndExbK9z8xEhaI+e8M7W2/gnI8nUFHszW4K5fomOnqtLJLp4qPfW/W
	P2nVxdrtGFVo7W924qnblIVg3UhrT+McwpK9bbUEtAauA+45n/G2WBgUdE+TW7OsCh7isjVGu/r
	3xRErLtKYhQ645eaL2BKkDNGpvf0kTVs3DqtGGA5pd0GWIhPmLNYLMRZ46KCTFSmHWBWhHHSflG
	1uI0BhOR6ve0FZgv9Zz7HWvMNGYkzMCmM1h+FyhSo4m1r7cYBK+JVNS3khGimH0JM2Bx3F96yy2
	DgYCjkAe5YyKtb30muLcg6jB/9I24rKiFBX32VWf/36NbDw79Kb0g0/7OjjX+6gaOMyZnpKoIdD
	26/Ro2pf+Py0QIuYhlR6l0vHWGjZQVeJwmuaztO65dHNic0am32ojsG6EkHtkXMkteF47jB46cG
	XD1K49FVUhf7H3+PBaS8OxeSlB2j0WZJtCm571FD4CDPPvyeviH5+Xm1h1GkI8gBVaXBRTcy+R8
	hOd2liLk8afjOMsAtWIzE0F0xW63Ztlh3VuAwQ==
X-Received: by 2002:a17:90b:2748:b0:3a0:8a9e:1212 with SMTP id 98e67ed59e1d1-3a0985700bdmr5517140a91.7.1790401207720;
        Fri, 25 Sep 2026 22:40:07 -0700 (PDT)
Received: from dell-pro-max-tower-t2.cse.unsw.EDU.AU (pag-t2-pc.cse.unsw.EDU.AU. [129.94.173.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c7435sm14789739a91.11.2026.09.25.22.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 22:40:05 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Madalin Bucur <madalin.bucur@nxp.com>
Cc: Sean Anderson <sean.anderson@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH net] fsl/fman: validate the port id in fman_set_port_params()
Date: Sat, 26 Sep 2026 15:39:57 +1000
Message-ID: <20260926053957.1628730-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fman_set_port_params() uses the port id, which comes from the device
tree "cell-index" property, to index fixed-size tables without
validating it:

	set_port_liodn(fman, port_id, fman->liodn_base[port_id],
		       fman->liodn_offset[port_id]);
	...
	mac_id = hw_port_id_to_sw_port_id(fman->state->rev_info.major, port_id);
	if (port_params->max_frame_length >= fman->state->mac_mfl[mac_id]) {
		fman->state->port_mfl[mac_id] = port_params->max_frame_length;

liodn_base[] and liodn_offset[] have FMAN_LIODN_TBL (64) entries, and
set_port_liodn() also accesses fmbm_spliodn[port_id - 1]. mac_mfl[] and
port_mfl[] have MAX_NUM_OF_MACS (10) entries, but
hw_port_id_to_sw_port_id() maps, for example, RX port id 0x12 to 10 and
TX port id 0x3f to 23. fman_port_probe() truncates the property to a u8
and does not otherwise check it, so a device tree with a bad cell-index
can cause out-of-bounds accesses.

Reject a port id of 0, a port id outside the LIODN table, and a port id
that does not map to a MAC, before any state or register is changed. A
cell-index above 0xff that aliases a valid id after the u8 truncation
is not caught here.

Found by static analysis tool CodeQL.

Fixes: 414fd46e7762 ("fsl/fman: Add FMan support")
Assisted-by: LLM codeql
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---

Notes:
    Compile-tested only (ARCH=arm64 and ARCH=x86_64 allmodconfig, W=1). Not
    tested on hardware, and there is no reproducer.
    
    The CodeQL query behind this report was synthesized with LLM assistance,
    and the fix and changelog were drafted with LLM assistance; I have
    reviewed them.

 drivers/net/ethernet/freescale/fman/fman.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fman/fman.c b/drivers/net/ethernet/freescale/fman/fman.c
index 46cc28895e565..e25050189b1f3 100644
--- a/drivers/net/ethernet/freescale/fman/fman.c
+++ b/drivers/net/ethernet/freescale/fman/fman.c
@@ -2103,6 +2103,18 @@ int fman_set_port_params(struct fman *fman,
 	unsigned long flags;
 	u8 port_id = port_params->port_id, mac_id;
 
+	/*
+	 * port_id comes from the device tree: reject ids outside the LIODN
+	 * table and ids that do not map to a MAC.
+	 */
+	mac_id = hw_port_id_to_sw_port_id(fman->state->rev_info.major, port_id);
+	if (port_id == 0 || port_id >= FMAN_LIODN_TBL ||
+	    mac_id >= MAX_NUM_OF_MACS) {
+		dev_err(fman->dev, "%s: invalid port id %u\n", __func__,
+			port_id);
+		return -EINVAL;
+	}
+
 	spin_lock_irqsave(&fman->spinlock, flags);
 
 	err = set_num_of_tasks(fman, port_params->port_id,
@@ -2170,8 +2182,6 @@ int fman_set_port_params(struct fman *fman,
 	if (fman->state->rev_info.major < 6)
 		set_port_order_restoration(fman->fpm_regs, port_id);
 
-	mac_id = hw_port_id_to_sw_port_id(fman->state->rev_info.major, port_id);
-
 	if (port_params->max_frame_length >= fman->state->mac_mfl[mac_id]) {
 		fman->state->port_mfl[mac_id] = port_params->max_frame_length;
 	} else {

base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.43.0

