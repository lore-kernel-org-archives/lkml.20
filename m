Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794303453;
	b=r8QaWluqajHlmo5S45F4BqZz55hpwoPkzMdYG69Wr+neIiJdTwuUbvrWGd4Xh8n91W0U
	 mOSN8sYvk+LVY/aJE508OWojogVyKSq9fn4o1dj/EQK88qrVyYF0MSr0OksSflmWdtYJL
	 f0KIG0lZh7snfaGekAZbMe5+lr3wQdbSGlEqTiWgSfgHQktiBFcgtrTl+r7sId4U1hXbN
	 Lwfv0ncjR6rGu0fZ2E4/MjuKm95KltzamEXJtCe8l7YjRUdn7EcpR4ySoJtcrnNZCLCDf
	 QsdjGBrVDrtpu2chpJUZH5KIdJLPo/A4F58UI1FeZ1AbL+ejEN1MIh20LNwKe/eNVqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303453;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kgzZMDeQ9yD5lUTY6CXHw+dsm63catiIaqcb5N1fBu8=;
	b=mpEkUlbt1JORLfYnslc4bs5T1cuP2acu07ajawALw57vhJmD7UucC+iy4d3WeJGcT5Ji
	 0ltt3RoNznTXhzwwfYKNZkK8CpdeOiV2Y3/PY+bpa+o1AzF06a+Xe8dsYWci4nB6cbtbu
	 jLkL2MAiA+zNlplVvI0LqdscV2VYrSupXAwF+h4S00P3CBr9rt+mPaQiPZytv0nIBzj3v
	 ZixJmx9+A1J8648XtCksMA/oX3ua9So+fruPl7mbJ4nfy5ptMv99ePQy99+rvMDoBmeLI
	 lvelsY7fvoDpsUmJO0VVpljOhHdSTQwjwbkhKKud8+uAtuHg8p5da9oKSNc42XjPPMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROCrzN2l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152FC606A919;
	Tue, 10 Nov 2026 09:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROCrzN2l
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794303452;
	b=e1I1CcFtcu7xS1QsnFMfKly9Ut6ldUm79AnemUyRpvrslYg2LfRVbKvSyXF8JVqi+uIa
	 IOU/C847kG8Dn2rt+ziHHdaCg8WPsY0QZGWdRX/8Xo7R9UaaG1LwUkR/B9eHFnN4taDbx
	 fzRarIhAkHoCvBsJKl/nRbJOALVl3/meQiDuA7u8egP9oIq8IbOueMhKvSJujCU0RnY3K
	 1o66Q7Z3yV//b9DNzzRtc1sX9QcDf2bCiVOMYkwozmw0zwFLgeS2WkzKAkLPTK/M9mu6J
	 xjVn8f2ECKbosA+TxAfILGSVB3xaMu5WWcnNL8zkqF94khVI68Cs0XbU5OHNP+H4W4A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794303452;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kgzZMDeQ9yD5lUTY6CXHw+dsm63catiIaqcb5N1fBu8=;
	b=fqUBFIraJ8g85VpQkyGDByGm82/P3pWifFTIOIAYX8lOzsq7Ju1idNxgNSg9skjElVVL
	 eANKM26duHEbzVXf8uJncJdGTIPC5QNdKlBpQIUdxxWntQAEgzrNAyJHkyS6LeYrWcpvf
	 HN6r3idz2e5ogzOZb+WAqHrHcJPEMIavE1rI1jD/nuRzWiFbCPQRwn7ELinyQELQVnnhh
	 X/3SVyhVnSaRv04yQE0iHcFoWNA1qlQ8ySCuOwXbRLJeZg7BH2mTcUXdObkI20Z/4XO+m
	 Plk4JlahXZPvhLyzAqLpilvQks2D+o7DODbe2n71Zd9gPjxDm63cPL/28V6rrAeeIVg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6DB111F008A1;
	Tue, 10 Nov 2026 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794303452;
	bh=kgzZMDeQ9yD5lUTY6CXHw+dsm63catiIaqcb5N1fBu8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ROCrzN2lCDlIq4p7Btk0zb2VaWcHXLFrydvYsM+i3N69NmWtKqp6BdsUw9pXNsFD+
	 ek9PPrTZcBeuPmE77oEbkzlFsAZDwmgxmeJEjSJ/YVhj5jtreQ9oOGUKzGmLsdQZD/
	 L2OkE8wdxzTaQge4jvlvBiOUrG/PZeJy33v/LRkHx8TGgFnPb9cqW81fmOIzXNAYjG
	 +fz1yqL9esH5q+zA8k6fVu7TgHsSk0vESfAOyFJ0hAYhV4y6I9oFd3y76XkrMFfGRc
	 zDY0eJmy8ezy/fmIFgkeDKsnaXWSogmk9ikq1iirQKVYWp5aqPMTdVmKHkmhbQ/UtY
	 O4LZ3i0AZibGg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F2BAA48A71;
	Tue, 10 Nov 2026 09:37:31 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 03:37:24 -0600
Subject: [PATCH v3] staging: octeon: remove unnecessary parentheses
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
Message-Id: <20261110-octeon-parentheses-cleanup-v1-v3-1-ea6d4ecf2ec5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQqDMBBFryKz7pSM0SJd9R7iIqajDmgiSSot4
 t2beoLC37y/eG+HyEE4wr3YIfAmUbzLoC8F2Mm4kVGemaFU5Y1INehtYu9wNYFdmjhyRDuzca8
 VN0JLg9a6NhURQ3asgQd5n/62yzxJTD58ztxGv/dfcx5hbXvFWnOlmv4xLkbmq/ULdMdxfAGlb
 hUWygAAAA==
X-Change-ID: 20261108-octeon-parentheses-cleanup-v1-c1f3335a411e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794303451; l=2525;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=HpVvmqNpd6mNraRfdV9oEnBYW18VRLrqlhVstvdAHTU=;
 b=TQ5u1kxGwAjDY2wRn/wXd14s2gGSPQSFf2DU5pzJ1HqRG7WLvhstwC2z92TswZLzfKj3UDyTw
 zj9INZOfSFsAULsAFP6WgwuXGSJPABHepQgesXywvIqU8wCnGKqN0lP
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

Fix checkpatch.pl warnings by removing redundant parentheses around
conditional checks.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
Hi Greg,

This patch fixes checkpatch.pl warnings in ethernet.c by removing
unnecessary parentheses.

The v2 text was AI-generated because I don't speak English well
and I tryng to learn b4 workflow.
I try being concise in this v3. Sorry for the noise.
---
Changes in v3:
- Rewrote the cover letter and commit message manually.
- Removed the AI-generated text.
---
 drivers/staging/octeon/ethernet.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..f374fdf8f7a9 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -262,9 +262,9 @@ static int cvm_oct_common_change_mtu(struct net_device *dev, int new_mtu)
 
 	dev->mtu = new_mtu;
 
-	if ((interface < 2) &&
-	    (cvmx_helper_interface_get_mode(interface) !=
-		CVMX_HELPER_INTERFACE_MODE_SPI)) {
+	if (interface < 2 &&
+	    cvmx_helper_interface_get_mode(interface) !=
+		CVMX_HELPER_INTERFACE_MODE_SPI) {
 		int index = INDEX(priv->port);
 		/* Add ethernet header and FCS, and VLAN if configured. */
 		int max_packet = new_mtu + mtu_overhead;
@@ -308,9 +308,9 @@ static void cvm_oct_common_set_multicast_list(struct net_device *dev)
 	struct octeon_ethernet *priv = netdev_priv(dev);
 	int interface = INTERFACE(priv->port);
 
-	if ((interface < 2) &&
-	    (cvmx_helper_interface_get_mode(interface) !=
-		CVMX_HELPER_INTERFACE_MODE_SPI)) {
+	if (interface < 2 &&
+	    cvmx_helper_interface_get_mode(interface) !=
+		CVMX_HELPER_INTERFACE_MODE_SPI) {
 		union cvmx_gmxx_rxx_adr_ctl control;
 		int index = INDEX(priv->port);
 
@@ -360,9 +360,9 @@ static int cvm_oct_set_mac_filter(struct net_device *dev)
 	union cvmx_gmxx_prtx_cfg gmx_cfg;
 	int interface = INTERFACE(priv->port);
 
-	if ((interface < 2) &&
-	    (cvmx_helper_interface_get_mode(interface) !=
-		CVMX_HELPER_INTERFACE_MODE_SPI)) {
+	if (interface < 2 &&
+	    cvmx_helper_interface_get_mode(interface) !=
+		CVMX_HELPER_INTERFACE_MODE_SPI) {
 		int i;
 		const u8 *ptr = dev->dev_addr;
 		u64 mac = 0;

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261108-octeon-parentheses-cleanup-v1-c1f3335a411e

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


