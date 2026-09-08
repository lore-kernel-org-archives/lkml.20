Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443B8381B1C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848789; cv=none; b=HcbBo58hi7pgwFzuUPRp9myRYfHZzbQO7dejAEYkqZSWaM6eSQLFmakWZSl3CArap0nxLeBzgEvWRu9BhnRGD83iTifxcMz6Yvkgy0NCYVYK2bJ5/IMTdv6meslTX3q4zciMEFJTSqPVK0kzLP8F6PapTmCzykSkDZD17OucTGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848789; c=relaxed/simple;
	bh=k/Ku8LU6ugqloGgzvXwvaI4XL7y3mzzbLgYVblGmuGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t3lzpdfOVy4BLO9WRDNMJhBkJcJKWjK6Cpm+UQYzkQnutLFvCnezwXJUGvv88CwGaxaRy/R/VKwRaHOvvLeqFofahFEFBbY/1YXzW8oK3AMOhow/7A2WOocGcHPDjHuQMD982rca7EAcqmb48XFL14g+GNMOaqHjCec2fpcUBzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PeUX4eZX; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PeUX4eZX"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so3701680a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788848787; x=1789453587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H+8mig4WNfJCkEjs7JPdgjRjkIJBtDmluQCyK6Ikj9E=;
        b=PeUX4eZXuUqvx7vgB8W54a9Ki94Ckp5L+iLZJZ4+uOI70QHfKX997CU2SXEDRvwWkq
         YdEn2fP2mkR//rxVUwMghVxVcNUYBJ0cvLe2aRCHrEHaWbC7fMypLkIJ96w+HxeAw2ne
         hzBvQVaHSTm/7+aT7tMgKMWhGhOzVHIpsb8tupnm9Uh8GmDccarQLA82AcKH+fOylrxx
         ccbWGfMhW//m8JXJAdihrwk509XDO3djEMrjRW6VCzmk7AtCud5fHZggAyYWsiTkAAuI
         7HyzqWuud8v5+P8q/ruJx+AZwTK+JVaS5FhSz4AePg2RMd/G0624pvKG3zoFpaX+uDZA
         q3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788848787; x=1789453587;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H+8mig4WNfJCkEjs7JPdgjRjkIJBtDmluQCyK6Ikj9E=;
        b=FlJbZNsT/SqUkkZ6M7dxz8QAHOxgU89rx4YQN/bKJsl6qB10xbVCBeePeTRxuIWH0t
         OiQMQjOJxkWbm8AtgrCVuSFpbgBcuXMxfd885WkDfnrCckIpO40XnCJQ1b9Je6Fq/CRg
         vmjPkpSZorNdLYfscEHHPeSmrAC/CXsv+L8K8Oky8z9upawK2LhlMc/Ylikv65TFkk5Y
         ln2uExKiA5eQi3maejJB6LbS+3ea6kUIii6oa+ptqyZdHxJ9/G4NsJEAuR9y3Xqmum7k
         3GbAIj4JJBlMItx/QpYsEoQNT7M05Q1txkLjvswFVYLbatme0y1+hu0+HLoOrFqkKOQi
         5cCw==
X-Forwarded-Encrypted: i=1; AKwUvBw1QBxgZhdwx/gc7sDPLwuE2X0Aq0sl5eTMFdnN/Okoxtj9Sy4MZzzWE4NaQCvl30vdmBlvTGlhyZfrDqo=@vger.kernel.org
X-Gm-Message-State: AFuF++keLHRsr5Lr0OB2W3rtehK7BwvwSXVnQpSvdJUfNvi+cpUce5WE
	nxcZ4vRoZ5c0Gq+kGwWQhK0E5TXXrJSgzfAJR4AtnaaDYZlxDfCYBdcfJy8a100V
X-Gm-Gg: AYBFou3srn2YFbeMUpDnpBJUAgnTybNgdWTRgd/ipH0ivlOWHJlp8S5DEnWTPNHsBEz
	1Cu/oq5cL74LMNgiOGSYbJYgfbXKY7w4KMVRNMERE3BVnfs0doEM4PYZJ9ImrmPe58NcW3Snvco
	bZCAVIs2w1aw3TVupL4QvI4fMxY68BxjHaBavgl2C3e7fEK+7ijJ40CTqlf3L8TZpenyHcPVntW
	H0uncXG3HLPjpZFyTzxn1NvHq1LswmLZqo2x8ITuN5XQ1+GngFPYQWV9Z/ct6I9ijXNWv/F75hk
	GCj87AQ98ar3YbUHBwkkTOZIzORu2+sGUx0isXpBWR4/CA92kB6sbkpVYa6LcY6TV7TOsYFl7BW
	6U+JCuJZ5nD1vaZYqHgI6qhdbrIBUtzQ7BHqghfKwYjG/vZsTkpsaIz+S67WRJnh+JaP4CHDrJT
	SKV7LB0vdSf7rftiY0IWQeVDYenMIctl2bE2OZqALF4qGtSGqwMgyNRPUrlqGqUESOXrcSLtHGi
	V7Gu++s0T+VSJ7KyFfsOa0b3dBCQFszlD1+xkHLaciT7NpsehqTFqQYX2S9kQO55AA/Xrjyg8T5
	coCZWgZ9g32qvDCNwsIovTnk4poU4mSvNhjKxkgAmg==
X-Received: by 2002:a05:6a21:a05:b0:3cc:9620:5816 with SMTP id adf61e73a8af0-3da39cf20c8mr43080673637.8.1788848787479;
        Mon, 07 Sep 2026 23:26:27 -0700 (PDT)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm30960386c88.11.2026.09.07.23.26.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 23:26:26 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Peter Rosin <peda@lysator.liu.se>,
	Andy Shevchenko <andy@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 1/2] i2c: mux: Factor out channel node lookup
Date: Mon,  7 Sep 2026 23:26:22 -0700
Message-ID: <adf12f66229d5faa0bc75571da1c3f53a1c81dd8.1788623619.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1788623619.git.ahmadexp@gmail.com>
References: <cover.1788623619.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Move the existing Device Tree channel-node lookup into a helper in
preparation for using generic firmware-node operations.

This is a pure refactoring with no functional change.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/i2c/i2c-mux.c | 84 +++++++++++++++++++++++--------------------
 1 file changed, 46 insertions(+), 38 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 68a4c34b5987..d207f0e81807 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -264,6 +264,51 @@ static const struct i2c_lock_operations i2c_parent_lock_ops = {
 	.unlock_bus =  i2c_parent_unlock_bus,
 };
 
+static struct device_node *
+i2c_mux_get_channel_node(struct i2c_mux_core *muxc, u32 chan_id)
+{
+	struct device_node *dev_node;
+	struct device_node *mux_node;
+	struct device_node *child;
+	u32 reg;
+	int ret;
+
+	dev_node = dev_of_node(muxc->dev);
+	if (!dev_node)
+		return NULL;
+
+	if (muxc->arbitrator)
+		mux_node = of_get_child_by_name(dev_node, "i2c-arb");
+	else if (muxc->gate)
+		mux_node = of_get_child_by_name(dev_node, "i2c-gate");
+	else
+		mux_node = of_get_child_by_name(dev_node, "i2c-mux");
+
+	if (mux_node) {
+		/* A "reg" property indicates an old-style DT entry */
+		if (!of_property_read_u32(mux_node, "reg", &reg)) {
+			of_node_put(mux_node);
+			mux_node = NULL;
+		}
+	}
+
+	if (!mux_node)
+		mux_node = of_node_get(dev_node);
+	else if (muxc->arbitrator || muxc->gate)
+		return mux_node;
+
+	for_each_child_of_node(mux_node, child) {
+		ret = of_property_read_u32(child, "reg", &reg);
+		if (ret)
+			continue;
+		if (chan_id == reg)
+			break;
+	}
+
+	of_node_put(mux_node);
+	return child;
+}
+
 int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 			u32 force_nr, u32 chan_id)
 {
@@ -327,44 +372,7 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 	 * Try to populate the mux adapter's of_node, expands to
 	 * nothing if !CONFIG_OF.
 	 */
-	if (muxc->dev->of_node) {
-		struct device_node *dev_node = muxc->dev->of_node;
-		struct device_node *mux_node, *child = NULL;
-		u32 reg;
-
-		if (muxc->arbitrator)
-			mux_node = of_get_child_by_name(dev_node, "i2c-arb");
-		else if (muxc->gate)
-			mux_node = of_get_child_by_name(dev_node, "i2c-gate");
-		else
-			mux_node = of_get_child_by_name(dev_node, "i2c-mux");
-
-		if (mux_node) {
-			/* A "reg" property indicates an old-style DT entry */
-			if (!of_property_read_u32(mux_node, "reg", &reg)) {
-				of_node_put(mux_node);
-				mux_node = NULL;
-			}
-		}
-
-		if (!mux_node)
-			mux_node = of_node_get(dev_node);
-		else if (muxc->arbitrator || muxc->gate)
-			child = of_node_get(mux_node);
-
-		if (!child) {
-			for_each_child_of_node(mux_node, child) {
-				ret = of_property_read_u32(child, "reg", &reg);
-				if (ret)
-					continue;
-				if (chan_id == reg)
-					break;
-			}
-		}
-
-		priv->adap.dev.of_node = child;
-		of_node_put(mux_node);
-	}
+	priv->adap.dev.of_node = i2c_mux_get_channel_node(muxc, chan_id);
 
 	/*
 	 * Associate the mux channel with an ACPI node.
-- 
2.50.1 (Apple Git-155)
