Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794070649;
	b=WAqFdBLrgsbhAmujUs17J/KyuPyYcsqubhtx6aNYEpfCXZysM42DWpJz+NVydR1f9q9y
	 LaLIZyZZbPCP5Rvn7NkvhbSMyzsQxAjZpdOufKyi0rpTlcNbDik9pE4LhzY6zkhEapTvd
	 rZ5RV61znoazse4uwIvm9BuPax1kg7DcvWFtb5otpuiyK5+8CGrklyqPbwzZhEgPfZ7ba
	 Z3uNIMARGvUt/9cYPowENOSgG2B/aoRtWEgFTigY2hOLoGUeYDy0YdgMVyzIH6/hI1BJ2
	 AABovaQ0SCW4BlZhio7w1dLmg6o0YIxOe/paEIkyrTtiXWWWLgbihTwZSZkbFHbx+qA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070649;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received;
	bh=JOzZOraI8sktGVnhlAox4eAkjHdAPOg27ohrD02Wfes=;
	b=KmiNJpmcYEHwAJjgHYA9uLd4FzyWJxtxIqjNsSlWQWsUmotZ5EoR8FIu60IHONhfXdYD
	 sQ7zO8PO/fp8OVWCJInpApq6bi4xRprI3POqsf5lntUumTpYHCZdWI55Sqk52TnXw7XbI
	 89I8oltXmI1zBIVY6TmJZJxVx831oXAPqz7GhoPpsLjHwoI4Dl/YhaV8DOPjpR3yq6ePd
	 mRsz4DMQxdvlmqh6kj5/73p6HbNsI9ANuEpIVlpRKHZyMDVQpkaFYlvrIU3z8+aABhIN3
	 A6iPlyo7kqmEyebFe5a/8o5tinIisx1H+00Lc+piuOykGONYCPIvxElpZTqPZnlFZhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QDL2trT+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BBA606A326;
	Sat,  7 Nov 2026 16:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QDL2trT+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794070648;
	b=sGC/EePSyXgomDl+J9v8e4P1pXH6/sLCeNZC9IqtlS0ON1RvqAUcNXW4KTHf8hlueZCL
	 qB7XhhK+nu5n8sYGLdF94JSC3cf05oZ9dOe3NKJ0wQG632OV7/VpaINnjZb2VC5QNERCb
	 p3gdeicY3erFCCNLhI4ruAs9xPGF+lj6oVHL22XRJuM1M3aAq8eDzM/6zlYz3io/RDOI6
	 7W3u2EdQNBtsDGx4JFO82/AtlC95cjK4tvecH7a7Gb1OGkRZm9SgN7k4JdkqasqhvedTh
	 IGdx3p3BGMi/liSy+lSCTL5l6eopRSqwg0V6aZyXa1jaigQ2bgiZpVzj0Bs1CbdRUag==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794070648;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received;
	bh=JOzZOraI8sktGVnhlAox4eAkjHdAPOg27ohrD02Wfes=;
	b=jPjH9XX/roXF52PF3RV4HWIyhDUaKqzaZBgIGhMMxfTVT7yD8Yv8EvTVNtHIkjwsKQiY
	 IofEeEzG9bdC0IyVkymzmGv2bqspuk3QMLHCkOZmLyycHJ0l8mTPyMXoIkuYmDiCT700p
	 B0vxlyEfFXf1AZk3QCu1s+DmrQFy2RkdNZfdzOPhw2IufTg5aZ0PkgErzmsaucyoQBfFB
	 24Mjyy+JFtsunslqjRYSSHai2zCLDHGFLq+Ebs9YTwqgLN/39H6zndaK8nRdS+53EZ8aw
	 CurUyRQsGJl3yUYrOddJa1ww32pfjlzaOfLLShxQAshD8oWKSQ9ekYpjnTF8oeG8MLg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DFD461F0089F;
	Sat,  7 Nov 2026 16:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794070648;
	bh=JOzZOraI8sktGVnhlAox4eAkjHdAPOg27ohrD02Wfes=;
	h=From:Date:Subject:To:Cc;
	b=QDL2trT+pxFA3GrSlDsQ4gZfUJ/uysSd/GK+A4OY3RsWJ0Q3hD1b9NsaLCPNjlY60
	 NWNkeuAX3StW9V/FwOs8cUo0qNkZ3gKczPiUOktHK/q8stlL2bWw8eIjYfgfzp8zuK
	 lncxb8zdbkEAp69yUXmjpn5SjWzg72ojY3NfDauC06h+BFcxVR2FIetWRq9HsYpV0q
	 UYvx0KGgA00wUiaxphqcJZWbBqjg72qstrVMumRotfUgOsnIt/8DDY5EafDIB/MsN7
	 iVwel7owEvY6QP+tGHuWCHyqjjhBq1/Fv67qfTic8aP/bw/GuO34IK/H92beT+gL6b
	 5j+Ecnr8DFJ0g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2FA2847C82;
	Sat,  7 Nov 2026 16:57:27 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sat, 07 Nov 2026 17:57:06 +0100
Subject: [PATCH] thunderbolt: Drop the DP tunnel activation callback data
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
Message-Id: <20261107-b4-tbt-callback-v1-1-5ade9391461d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDtgRE31KsVFJk50WrEliSKId
 2/U5Vv8v0NgLxygzXbwvEqQ75ygHhnY0cwDo/TJUORFrVSukUqMFNGaaSJjP6h15ahyz4ZrhlT
 9PDvZruOrux0WerON5waO4w8liXm6cwAAAA==
X-Change-ID: 20261107-b4-tbt-callback-775fb5f89e6e
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11811; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=vpOtS+KsLpRwTvuWWGQUwIquEM0RjvCPrf3l3BXb0qE=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9b7iIzzrAH2y/s7JS34jyw8lbuYs/K3EGvd26ztkTOTL
 qpsXqLRUcrCIMbFICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZjIz2xGhk0Wu23MvlwrYheR
 eve4efUeb54MCROuy++5/x7iWXh/oggjw/x8GTYx4WXtN9c4vn4rYqY47Y8zU8cr1Ydz2Gosfs7
 /ygAA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

The callback data is always the domain the tunnel belongs to which the
callback can just take from the tunnel itself.

Signed-off-by: Sven Peter <sven@kernel.org>
---
As requested in [1], here's the last patch now that -rc1 is out.

[1] https://lore.kernel.org/asahi/20260901081924.GA106095@black.igk.intel.com/
---
 drivers/thunderbolt/tb.c     | 10 +++++-----
 drivers/thunderbolt/test.c   | 24 ++++++++++++------------
 drivers/thunderbolt/tunnel.c | 12 +++---------
 drivers/thunderbolt/tunnel.h | 10 +++-------
 4 files changed, 23 insertions(+), 33 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 57c11ba13459..418ad0a61a5d 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -89,7 +89,7 @@ static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port,
 				       const char *reason);
 static void tb_queue_dp_bandwidth_request(struct tb *tb, u64 route, u8 port,
 					  int retry, unsigned long delay);
-static void tb_dp_tunnel_active(struct tb_tunnel *tunnel, void *data);
+static void tb_dp_tunnel_active(struct tb_tunnel *tunnel);
 
 static void tb_queue_hotplug(struct tb *tb, u64 route, u8 port, bool unplug)
 {
@@ -387,7 +387,7 @@ static void tb_switch_discover_tunnels(struct tb_switch *sw,
 		switch (port->config.type) {
 		case TB_TYPE_DP_HDMI_IN:
 			tunnel = tb_tunnel_discover_dp(tb, port, alloc_hopids,
-						       tb_dp_tunnel_active, tb);
+						       tb_dp_tunnel_active);
 			tb_increase_tmu_accuracy(tunnel);
 			break;
 
@@ -1905,11 +1905,11 @@ static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
 	return NULL;
 }
 
-static void tb_dp_tunnel_active(struct tb_tunnel *tunnel, void *data)
+static void tb_dp_tunnel_active(struct tb_tunnel *tunnel)
 {
 	struct tb_port *in = tunnel->src_port;
 	struct tb_port *out = tunnel->dst_port;
-	struct tb *tb = data;
+	struct tb *tb = tunnel->tb;
 
 	mutex_lock(&tb->lock);
 
@@ -2038,7 +2038,7 @@ static void tb_tunnel_one_dp(struct tb *tb, struct tb_port *in,
 	       available_up, available_down);
 
 	tunnel = tb_tunnel_alloc_dp(tb, in, out, link_nr, available_up,
-				    available_down, tb_dp_tunnel_active, tb);
+				    available_down, tb_dp_tunnel_active);
 	if (!tunnel) {
 		tb_port_dbg(out, "could not allocate DP tunnel\n");
 		goto err_reclaim_usb;
diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index c8c648f31107..a1f9dbb66940 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -1407,7 +1407,7 @@ static void tb_test_tunnel_pcie(struct kunit *test)
 	tb_tunnel_put(tunnel1);
 }
 
-static void tb_test_dp_tunnel_active(struct tb_tunnel *tunnel, void *data)
+static void tb_test_dp_tunnel_active(struct tb_tunnel *tunnel)
 {
 }
 
@@ -1432,7 +1432,7 @@ static void tb_test_tunnel_dp(struct kunit *test)
 	out = &dev->ports[13];
 
 	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0,
-				    tb_test_dp_tunnel_active, NULL);
+				    tb_test_dp_tunnel_active);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
 	KUNIT_EXPECT_EQ(test, tunnel->type, TB_TUNNEL_DP);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, in);
@@ -1479,7 +1479,7 @@ static void tb_test_tunnel_dp_chain(struct kunit *test)
 	out = &dev4->ports[14];
 
 	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0,
-				    tb_test_dp_tunnel_active, NULL);
+				    tb_test_dp_tunnel_active);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
 	KUNIT_EXPECT_EQ(test, tunnel->type, TB_TUNNEL_DP);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, in);
@@ -1530,7 +1530,7 @@ static void tb_test_tunnel_dp_tree(struct kunit *test)
 	out = &dev5->ports[13];
 
 	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0,
-				    tb_test_dp_tunnel_active, NULL);
+				    tb_test_dp_tunnel_active);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
 	KUNIT_EXPECT_EQ(test, tunnel->type, TB_TUNNEL_DP);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, in);
@@ -1596,7 +1596,7 @@ static void tb_test_tunnel_dp_max_length(struct kunit *test)
 	out = &dev12->ports[13];
 
 	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0,
-				    tb_test_dp_tunnel_active, NULL);
+				    tb_test_dp_tunnel_active);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
 	KUNIT_EXPECT_EQ(test, tunnel->type, TB_TUNNEL_DP);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, in);
@@ -1667,7 +1667,7 @@ static void tb_test_tunnel_3dp(struct kunit *test)
 	out3 = &dev4->ports[14];
 
 	tunnel1 = tb_tunnel_alloc_dp(NULL, in1, out1, 1, 0, 0,
-				     tb_test_dp_tunnel_active, NULL);
+				     tb_test_dp_tunnel_active);
 	KUNIT_ASSERT_TRUE(test, tunnel1 != NULL);
 	KUNIT_EXPECT_EQ(test, tunnel1->type, TB_TUNNEL_DP);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel1->src_port, in1);
@@ -1676,7 +1676,7 @@ static void tb_test_tunnel_3dp(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, tunnel1->paths[0]->path_length, 3);
 
 	tunnel2 = tb_tunnel_alloc_dp(NULL, in2, out2, 1, 0, 0,
-				     tb_test_dp_tunnel_active, NULL);
+				     tb_test_dp_tunnel_active);
 	KUNIT_ASSERT_TRUE(test, tunnel2 != NULL);
 	KUNIT_EXPECT_EQ(test, tunnel2->type, TB_TUNNEL_DP);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel2->src_port, in2);
@@ -1685,7 +1685,7 @@ static void tb_test_tunnel_3dp(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, tunnel2->paths[0]->path_length, 4);
 
 	tunnel3 = tb_tunnel_alloc_dp(NULL, in3, out3, 1, 0, 0,
-				     tb_test_dp_tunnel_active, NULL);
+				     tb_test_dp_tunnel_active);
 	KUNIT_ASSERT_TRUE(test, tunnel3 != NULL);
 	KUNIT_EXPECT_EQ(test, tunnel3->type, TB_TUNNEL_DP);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel3->src_port, in3);
@@ -1784,7 +1784,7 @@ static void tb_test_tunnel_port_on_path(struct kunit *test)
 	out = &dev5->ports[13];
 
 	dp_tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0,
-				       tb_test_dp_tunnel_active, NULL);
+				       tb_test_dp_tunnel_active);
 	KUNIT_ASSERT_NOT_NULL(test, dp_tunnel);
 
 	KUNIT_EXPECT_TRUE(test, tb_tunnel_port_on_path(dp_tunnel, in));
@@ -2217,7 +2217,7 @@ static void tb_test_credit_alloc_dp(struct kunit *test)
 	out = &dev->ports[14];
 
 	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0,
-				    tb_test_dp_tunnel_active, NULL);
+				    tb_test_dp_tunnel_active);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
 	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)3);
 
@@ -2454,7 +2454,7 @@ static struct tb_tunnel *TB_TEST_DP_TUNNEL1(struct kunit *test,
 	in = &host->ports[5];
 	out = &dev->ports[13];
 	dp_tunnel1 = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0,
-					tb_test_dp_tunnel_active, NULL);
+					tb_test_dp_tunnel_active);
 	KUNIT_ASSERT_NOT_NULL(test, dp_tunnel1);
 	KUNIT_ASSERT_EQ(test, dp_tunnel1->npaths, (size_t)3);
 
@@ -2492,7 +2492,7 @@ static struct tb_tunnel *TB_TEST_DP_TUNNEL2(struct kunit *test,
 	in = &host->ports[6];
 	out = &dev->ports[14];
 	dp_tunnel2 = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0,
-					tb_test_dp_tunnel_active, NULL);
+					tb_test_dp_tunnel_active);
 	KUNIT_ASSERT_NOT_NULL(test, dp_tunnel2);
 	KUNIT_ASSERT_EQ(test, dp_tunnel2->npaths, (size_t)3);
 
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 2b911372001c..8145657835c5 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1117,7 +1117,7 @@ static void tb_dp_dprx_work(struct work_struct *work)
 	}
 	mutex_unlock(&tb->lock);
 
-	tunnel->callback(tunnel, tunnel->callback_data);
+	tunnel->callback(tunnel);
 	tb_tunnel_put(tunnel);
 	tb_domain_put(tb);
 }
@@ -1593,7 +1593,6 @@ static void tb_dp_dump(struct tb_tunnel *tunnel)
  * @alloc_hopid: Allocate HopIDs from visited ports
  * @callback: Callback that is called when the DP tunnel is fully
  *	      activated (or there is an error)
- * @callback_data: Data for @callback
  *
  * If @in adapter is active, follows the tunnel to the DP out adapter
  * and back. Returns the discovered tunnel or %NULL if there was no
@@ -1603,8 +1602,7 @@ static void tb_dp_dump(struct tb_tunnel *tunnel)
  */
 struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
 					bool alloc_hopid,
-					void (*callback)(struct tb_tunnel *, void *),
-					void *callback_data)
+					void (*callback)(struct tb_tunnel *))
 {
 	struct tb_tunnel *tunnel;
 	struct tb_port *port;
@@ -1629,7 +1627,6 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
 	tunnel->consumed_bandwidth = tb_dp_consumed_bandwidth;
 	tunnel->src_port = in;
 	tunnel->callback = callback;
-	tunnel->callback_data = callback_data;
 	INIT_DELAYED_WORK(&tunnel->dprx_work, tb_dp_dprx_work);
 
 	path = tb_path_discover(in, TB_DP_VIDEO_HOPID, NULL, -1,
@@ -1700,7 +1697,6 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
  *	      %0 if no available bandwidth.
  * @callback: Callback that is called when the DP tunnel is fully
  *	      activated (or there is an error)
- * @callback_data: Data for @callback
  *
  * Allocates a tunnel between @in and @out that is capable of tunneling
  * Display Port traffic. The @callback is called after tb_tunnel_activate()
@@ -1714,8 +1710,7 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
 struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 				     struct tb_port *out, int link_nr,
 				     int max_up, int max_down,
-				     void (*callback)(struct tb_tunnel *, void *),
-				     void *callback_data)
+				     void (*callback)(struct tb_tunnel *))
 {
 	struct tb_tunnel *tunnel;
 	struct tb_path **paths;
@@ -1741,7 +1736,6 @@ struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 	tunnel->max_up = max_up;
 	tunnel->max_down = max_down;
 	tunnel->callback = callback;
-	tunnel->callback_data = callback_data;
 	INIT_DELAYED_WORK(&tunnel->dprx_work, tb_dp_dprx_work);
 
 	paths = tunnel->paths;
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index 7d1d255ab5a7..28f49f7e9f56 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -67,7 +67,6 @@ enum tb_tunnel_state {
  * @dprx_timeout: If set DPRX capabilities read poll work will timeout after this passes
  * @dprx_work: Worker that is scheduled to poll completion of DPRX capabilities read
  * @callback: Callback called when DP tunnel is fully activated
- * @callback_data: Data for @callback
  * @paths: All paths required by the tunnel
  */
 struct tb_tunnel {
@@ -104,8 +103,7 @@ struct tb_tunnel {
 	bool dprx_canceled;
 	ktime_t dprx_timeout;
 	struct delayed_work dprx_work;
-	void (*callback)(struct tb_tunnel *tunnel, void *data);
-	void *callback_data;
+	void (*callback)(struct tb_tunnel *tunnel);
 
 	struct tb_path *paths[] __counted_by(npaths);
 };
@@ -118,13 +116,11 @@ bool tb_tunnel_reserved_pci(struct tb_port *port, int *reserved_up,
 			    int *reserved_down);
 struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
 					bool alloc_hopid,
-					void (*callback)(struct tb_tunnel *, void *),
-					void *callback_data);
+					void (*callback)(struct tb_tunnel *));
 struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 				     struct tb_port *out, int link_nr,
 				     int max_up, int max_down,
-				     void (*callback)(struct tb_tunnel *, void *),
-				     void *callback_data);
+				     void (*callback)(struct tb_tunnel *));
 struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 				      struct tb_port *dst, int transmit_path,
 				      int transmit_ring, int receive_path,

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261107-b4-tbt-callback-775fb5f89e6e

Best regards,
--  
Sven Peter <sven@kernel.org>


