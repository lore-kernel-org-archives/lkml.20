Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C08C371D1F;
	Thu,  3 Sep 2026 09:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426483; cv=none; b=L/9wVJJOQ5iQVaCGQhEhVeM/JefdSJBNH/u03J1nvoPcASoxTuCvpjgp178M/RpuB0RSpKW/vjafrwqxE8UW83VO3V6AvtvWX7BPqCfekdrmr/X7C5SEFBIJtR68zNZZEruel25XGAClhntqjz0Ft2pb3cnV7eAYfcz4f40QYjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426483; c=relaxed/simple;
	bh=ij/4VGsI7YZAvl/ArRU+fZ0wLZCSMbIGhdf7Qp2POP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZUrmqhwkpgzxUtL5PUpUrJ/uE9XjDGIhvdA8c0AD86U/E9ge0Lw71Qe5P6mrFJ4MfIeB7heIUxmc1luHkKt4KNQt25cmYYDRvZn20MlKtquBoikite/kX4jEu7kfwd9PtxEFe+Kdrx3gLfEcgkGCzy4ls9QZkVGorArS+zEaCNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2741F000E9;
	Thu,  3 Sep 2026 09:08:00 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] of: property: Drop superfluous !!
Date: Thu,  3 Sep 2026 11:07:58 +0200
Message-ID: <d32521ecddc0df9de1c5f21edb7935f7f543590f.1788426412.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When assigning a pointer or integral value to a boolean, there is no
need to insert a double logical inversion, as the assignment already
takes care of the conversion.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
No change in generated code.

 drivers/of/property.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 7568785391aadb1d..bc7cb4ee1627fb42 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -74,7 +74,7 @@ bool of_graph_is_present(const struct device_node *node)
 
 	struct device_node *port __free(device_node) = of_get_child_by_name(node, "port");
 
-	return !!port;
+	return port;
 }
 EXPORT_SYMBOL(of_graph_is_present);
 
@@ -1679,12 +1679,12 @@ static bool of_is_fwnode_add_links_supported(void)
 		return true;
 
 	if (is_supported != -1)
-		return !!is_supported;
+		return is_supported;
 
 	is_supported = !((match_property_by_path("/soc", "compatible", "intel,ce4100-cp") >= 0) ||
 			 (match_property_by_path("/", "architecture", "OLPC") >= 0));
 
-	return !!is_supported;
+	return is_supported;
 }
 
 static int of_fwnode_add_links(struct fwnode_handle *fwnode)
-- 
2.43.0

