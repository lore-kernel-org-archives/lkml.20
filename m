Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D373CC324;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788719828; cv=none; b=uK65cXGDdqLU8OzW6h5fq4xVjfz0gwB62Z9yGNDAph7zMTg+IpdH112tmX8iNqsCfhUw7ePTUVbvR/jhfGLe2fngj36kYg/hVo2j+lU7KKJMw3OvHyFS9ODWf+H0hEF7zG7v0hVZrcb0PizCispa6wmRpk3EK7mAIJEPcTy8R/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788719828; c=relaxed/simple;
	bh=pbpXxrcnBEcXBzVXZAWh/ik8j3e+Lr/BQd6kXeq0PEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GXHlBdWJVuaxy60rhaRMb5snM981trSNo60sikFgPcnHoRYmYsNGR2/GIoyNWUS3/N+FxRZm3rIaIIEYnhneZ3H2iA08JC22o2qlGtOK6S/Va5RXkIAv7AamB8Q+SJ6jiNU6wUgTv4eIMl8zAHabdpI2mvxtkRHGNae4fJQ3nBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHHwSmrM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHHwSmrM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0EB6C2BCF5;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788719827;
	bh=pbpXxrcnBEcXBzVXZAWh/ik8j3e+Lr/BQd6kXeq0PEA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hHHwSmrM5iuVVUdz8bmEDAsc+rWVBJ+wMZcRIwCS6RisOE+eRizQcHnx73Ye0egAu
	 gpuxvrDRyLe4JsIFTPzPKgMBm9UUgAWC10FAc3dQDwVIsreP4fqwtDHezD3vXI/z5n
	 /6nSsXPZfDEpPIReG87ynuutt0e9gn9cBXjEFzPCgg0vqrJvdnV/p16NbeOUu/AZ/6
	 7/axctQLHvOuTn82+4n8DdcdSou5SxW+SG40BYZuKaClOZ06fYxcIlvMuMY8/12QaD
	 8KmTC62qQORrlkaG31/DtHPnaL887D7uF1lDlwPbCHZO+bJS3JATiSjbLo8o1G2mU+
	 MdCUHZRkRKs2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C148FC79F8C;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 20:36:33 +0200
Subject: [PATCH v2 10/22] thunderbolt: Unlock host router ports during
 startup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-apple-soc-tbt-v2-10-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=pbpXxrcnBEcXBzVXZAWh/ik8j3e+Lr/BQd6kXeq0PEA=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bcTQcqm0T0zrw/crT/RDCT+NO8f4X/zl686divVHVsz
 4tJ6T9udpSyMIhxMciKKbJs329v+uThG8Glmy69h5nDygQyhIGLUwAmomvD8E935ZVKXpM9flsv
 OPesj+3yetXlwyV4x+ai3NnZ9xJOvuph+MNfMDn6x/Wqljulkk7xP+vLfX62KFTtz/if3tjzN+V
 fGj8A
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

The downstream ports of the host router may still be locked after a
reset. Unlock them when the software connection manager starts before
scanning for any connected devices.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/thunderbolt/tb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 47753a5c0f2e..bf1c192ec10a 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -3016,6 +3016,7 @@ static int tb_scan_finalize_switch(struct device *dev, void *data)
 static int tb_start(struct tb *tb, bool reset)
 {
 	struct tb_cm *tcm = tb_priv(tb);
+	struct tb_port *port;
 	bool discover = true;
 	int ret;
 
@@ -3049,6 +3050,14 @@ static int tb_start(struct tb *tb, bool reset)
 		return dev_err_probe(tb->nhi->dev, ret, "failed to add host router\n");
 	}
 
+	/* Make all host router downstream ports accessible to the CM. */
+	tb_switch_for_each_port(tb->root_switch, port) {
+		if (!tb_port_is_null(port))
+			continue;
+		if (tb_port_unlock(port))
+			tb_port_warn(port, "failed to unlock port\n");
+	}
+
 	/*
 	 * To support highest CLx state, we set host router's TMU to
 	 * Normal mode.

-- 
2.55.0


