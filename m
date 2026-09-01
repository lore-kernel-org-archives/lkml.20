Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2A8389116;
	Tue,  1 Sep 2026 15:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276533; cv=none; b=VF/4QYI/zNn7W9O4NTCDmtbNj515BIKFrPrmuwrj/Z67c0gcaSxKc7p0jIdW7ax7ujm30s5ra8R2d5cy6LO7NOceD08M+w33ZJt4mP6ZN/gZOkMWsA7ey9Z0D6CXBGKvzyc1ADHPWlF5OFk7BKFiMs91NgyDnjoHvxUV4cnoNYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276533; c=relaxed/simple;
	bh=dP3jHBtlCykvsWTQPAkCN/U9940F3pgF1VMDJMBHgws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KXM1nlnZuvnfThFYyBboG+UScq5Rfp/llHYa2omZjlXCay6Jyx/WBvkrkLYSe/msQUFFs30gZUr18XvaSfPyUoorWCSbuXx3t4xE4AZMdNL6aMnA1DDnt39stwUTrMES3bfkPxCNA/nqD8g6HgCHrFNewHwVD0YWmDATzT0z6dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wn2yKhFE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wn2yKhFE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39AF01F000E9;
	Tue,  1 Sep 2026 15:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788276532;
	bh=2FEhLESBrjQ7v3qhyn+5Qiqol0tw3sSajaykKFBK1Uo=;
	h=From:To:Cc:Subject:Date;
	b=Wn2yKhFEtGZGtdooiTnHwHFCjCkvC8CMshDspx1LRvhsxT+Riv5vngQmyvsNUPHtr
	 y5ymntIkYiC2kL39elmbIXZDzG6oO+LpeqpajEGuz8DP2Qk5Ns4HNThUr1N2XB7hM5
	 YJ65/p9Nz36nv7h3CnZFZZf8dXz+cE6hYL8giS0EMVmxc8OCS06uRgF9u5UW9snAtD
	 lnASKhHh7iqmm2MZ9MyotGm7ej/OYLfArcrQX1E2iJwUM2lmriWp7IB3ro8FoeNGIy
	 n95HtRKsMbenkK92Cr4kMVqtOOv5GR94b4VB1up6564glDI7x4e5qd/K32tupbzSCa
	 c0z741SajCLqQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: ak4642: Drop "clocks" property presence check
Date: Tue,  1 Sep 2026 10:28:38 -0500
Message-ID: <20260901152838.795864-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_property_read_bool() should only be used on boolean properties and
not used as a presence check. The of_clk_get_parent_name() function
returns NULL if the "clocks" property is not present, so there is no
need to check for presence first.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Just drop the presence check instead of using of_property_present()
 - Split to separate patch
---
 sound/soc/codecs/ak4642.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/ak4642.c b/sound/soc/codecs/ak4642.c
index 08ec2035b270..4f86728cbe0a 100644
--- a/sound/soc/codecs/ak4642.c
+++ b/sound/soc/codecs/ak4642.c
@@ -607,14 +607,13 @@ static struct clk *ak4642_of_parse_mcko(struct device *dev)
 	struct device_node *np = dev->of_node;
 	struct clk *clk;
 	const char *clk_name = np->name;
-	const char *parent_clk_name = NULL;
+	const char *parent_clk_name;
 	u32 rate;
 
 	if (of_property_read_u32(np, "clock-frequency", &rate))
 		return NULL;
 
-	if (of_property_read_bool(np, "clocks"))
-		parent_clk_name = of_clk_get_parent_name(np, 0);
+	parent_clk_name = of_clk_get_parent_name(np, 0);
 
 	of_property_read_string(np, "clock-output-names", &clk_name);
 
-- 
2.53.0

