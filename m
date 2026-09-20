Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18038347BA9
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888516; cv=none; b=Jf7EwfsjQnd0SEnJtQcLzwmFHL9poI7nlx8zEhaEI+vnbwpfPvKDtYIiJzz3XOJ94sdn74P+aDLS+srkHQ0ezbq/7fH08oemdeGmuKSPIzSeyDTeBL3vLXZ09pD06cMTGIvEm9eHbs0swzfySJExcoOvesGclewuYpypRMtNK8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888516; c=relaxed/simple;
	bh=FVixjlluzEHTxx22SrIF+flCrrPxr57wS6rdNr4tA18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ajttw23ngFfcL1b35Vsj58tNO85FBYV3s+maeOtnoSKI6x/pyodg3PYfxZ3hGrcHWqUuWc+aPLjt7ZIDMaEaIm0y52b2/giWDzzCzUvhsF7CFvqaAoJlnXyhnfNC+kaWwF9oovRdoKAhnQ+mn7ZzuDEuup9odgHEojEjj+a6noY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=hnC3LTU2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c1Bns42P; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="hnC3LTU2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c1Bns42P"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 8FDBE1D0016E;
	Sun, 20 Sep 2026 03:15:13 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sun, 20 Sep 2026 03:15:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789888513; x=
	1789974913; bh=CFpWsUUThGtI/AXZLA7sMxoGTX6R9XpPJUMuRn5W5VI=; b=h
	nC3LTU2w8lHxuP3tsrHOnxgcNDhCkVvmHVRm62HCtcevvgbHsQKZTiPfYghW2LC2
	VyuLMAGOR3MupSs6is+uVJlaTpDtB7RH3LzSHPVppJKlpm+qPKPq4fxepBa+Xett
	pkNKhZtHEeMwqNz5SMGz8mNYfK7k8U8A6TaXYjCPWeNAEBoGK5tUDd8OP5iDN749
	58nV16w2hTo+BWDkK/UM5eK9xZsQNbS0B4Uu4WizC3FOA6n5SSP9yuzILt/yahoN
	I6WgFpclbext3EbOcspdLmrqjgDIVLHVmlV1eYlpKlW6OIko/uOwEOcub89m/+B6
	fhU8xlmIPUJVCEs7Iezwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789888513; x=1789974913; bh=C
	FpWsUUThGtI/AXZLA7sMxoGTX6R9XpPJUMuRn5W5VI=; b=c1Bns42PGcw2mrg77
	umNr6P6uGA/x85DodbzeAawRjpSAYWtPai386gr9vRd4m23d7mIaspMiEkhjhHtM
	os7XpAG4ZKgH6dnGsMNdgjnfVfaOCuTmBb5JbZ49HF1qVKK4nWw7PFpv+OgRbGmP
	rVh0T8Oi/aa7bZbz+qai1p68oSOEZenD5Eym7L8cU/6CAObX9tkNSrQB7HjOUtCr
	GHQoPqDXM37Re31X6ortpjpdmZKUJLx+9rho3xX1f3ToCR/sHkHj4Q04+djkSZCj
	R5tU4VODb8i0o9+Kb92xfT+QlJ9/qwVgzWUrn101ggw8MZE/r2LEM2jeLI2R/BES
	Y6qig==
X-ME-Sender: <xms:AYivarfo9my47Z3DtaIPIuKjmOeIBUvjaFdFnSXMksRbxwLGGZrF7w>
    <xme:AYivavLIw5zkwAzxMtTYcbLDxFrYbnbgAb1FIL8vlPLqTOBJCXbjeRVAy6VnBaiaL
    l_ryRZwRMHIoKMsg4hd2hvZbdOy4neRMLsjWuHHdZNws1kilkBioaLe>
X-ME-Received: <xmr:AYivasF4xKr_zzBvGnGCGPNgELwnL8FOPdLkHJVce8LIMRWqCg_py0-29bSRx8lBpSXNqNQhlMLsl_-DmgN_R3S6rSxyx1pBnxuVT9ip61yCHQ>
X-ME-Proxy-Cause: dmFkZTGyn/xqJvXtDE0aXPg7VTWwa6ZytMhAGR7nxGfLocNGHdWz0wX8vkRz8WdekLHOxF
    ueygXEtIzUz+6+8Nu5jOylzMouJEEmUtyHAiF3hAv/PQOii+fQIaA16F9rGbK5eIj+gHX2
    7oWQRylPS9prm6P0pulDgCxjr7FHQNIloAyG1sC2/WA+6SlZoZfvrwyAbbTgLETU6XAsrH
    oSG/gVQ4B96IyAbe0lc8e/7OyBZYZjJJI2xl3NT5AIvarGgLVxYLAZiD4NlCbAozg+Dur+
    szvikqwlwyyPnE8AnV3AbHNmxlz1ORsNjtHjAvxgWdsXLx1vkCYM0HOOrP6u1ZYIqTWEDr
    U5MT1QOXaiifx5iQypjwSIeJtLlrQmgAsrSD5H01QG0Mmjd/jhad3jKks4l0C3CdzvlIFg
    yBmcfRZlVAOq/qkdrq62piUXaORzSfnhIO2oiA5yhPNR9IA/SF+pEI/djG66Mllrf/4OXg
    dj9SQCN+uBCN0AlvSRTqpeu53pYS+ZUIAkh/WSaqKDLCgGHnRz9uWSsBkjqoDz4NImhwb9
    3Ufd5nVipxO2JdiiCZhzm/CnvHpGcfvDjpGdkPyCQf+kWPXVbSnvclHhNIapa5iMVetcLL
    DFx6Iy11O0OINjHR+xg96uCvAaEEDQ7kBjbovGWlGqIr+YNNY8uhaOxHOsmA
X-ME-Proxy: <xmx:AYivapq7qIesFzuZCAvAnzDVd7W2h39c-cfyWirx9TAxGG_YmIiEqA>
    <xmx:AYivalTv8LRrP45hWB4bc6c2U-0alknyoah9ff5sncwhEulp4i-Qrg>
    <xmx:AYivamNW3ayfF11lIeuPJMJCI5oP3HpJo-o8-AJVCRyhOuH0gztMYA>
    <xmx:AYivaoPCnCctHPbQJFBlB5E3j9OjqtBEnrgupF8Wac-T0xQSMQO9qA>
    <xmx:AYivakzeI3MlOmzHRI5U-bHVn8rDmJmpyFXBD5K-UBO5S4_FSS1sXX6e>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 03:15:12 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] firewire: cdev: add KUnit test for bus reset event UAPI structure
Date: Sun, 20 Sep 2026 16:15:01 +0900
Message-ID: <20260920071501.77785-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920071501.77785-1-o-takashi@sakamocchi.jp>
References: <20260920071501.77785-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bus reset event structure exposed through the UAPI has a different
size depending on the target architecture. Extra care is required when
copying it to/from userspace.

Add a KUnit test for the structure to ensure that it has the expected
size and offsets.
---
 drivers/firewire/core-cdev.c |  5 ++++-
 drivers/firewire/uapi-test.c | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 50c675113d5c..6d91a6e7ad0d 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -524,7 +524,10 @@ static int ioctl_get_info(struct client *client, union ioctl_arg *arg)
 			memset(&bus_reset, 0, sizeof(bus_reset));
 			fill_bus_reset_event(&bus_reset, client);
 
-			/* unaligned size of bus_reset is 36 bytes */
+			// This structure has 4 bytes of trailing padding under the System V ABI
+			// on most architectures (due to 8-byte alignment of the long long type),
+			// except for Intel386 (where long long type is aligned to 4 bytes). In
+			// either case, the effective length is 36 bytes.
 			if (copy_to_user(u64_to_uptr(a->bus_reset), &bus_reset, 36))
 				return -EFAULT;
 		}
diff --git a/drivers/firewire/uapi-test.c b/drivers/firewire/uapi-test.c
index bc3f10a2e516..0bdacb1caeb8 100644
--- a/drivers/firewire/uapi-test.c
+++ b/drivers/firewire/uapi-test.c
@@ -72,11 +72,31 @@ static void structure_layout_event_phy_packet2(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 24, offsetof(struct fw_cdev_event_phy_packet2, data));
 }
 
+static void structure_layout_event_bus_reset(struct kunit *test)
+{
+#if defined(CONFIG_X86_32)
+       // 4 bytes alignment for aggregate type including 8 bytes storage types.
+       KUNIT_EXPECT_EQ(test, 36, sizeof(struct fw_cdev_event_bus_reset));
+#else
+       KUNIT_EXPECT_EQ(test, 40, sizeof(struct fw_cdev_event_bus_reset));
+#endif
+
+       KUNIT_EXPECT_EQ(test, 0, offsetof(struct fw_cdev_event_bus_reset, closure));
+       KUNIT_EXPECT_EQ(test, 8, offsetof(struct fw_cdev_event_bus_reset, type));
+       KUNIT_EXPECT_EQ(test, 12, offsetof(struct fw_cdev_event_bus_reset, node_id));
+       KUNIT_EXPECT_EQ(test, 16, offsetof(struct fw_cdev_event_bus_reset, local_node_id));
+       KUNIT_EXPECT_EQ(test, 20, offsetof(struct fw_cdev_event_bus_reset, bm_node_id));
+       KUNIT_EXPECT_EQ(test, 24, offsetof(struct fw_cdev_event_bus_reset, irm_node_id));
+       KUNIT_EXPECT_EQ(test, 28, offsetof(struct fw_cdev_event_bus_reset, root_node_id));
+       KUNIT_EXPECT_EQ(test, 32, offsetof(struct fw_cdev_event_bus_reset, generation));
+}
+
 static struct kunit_case structure_layout_test_cases[] = {
 	KUNIT_CASE(structure_layout_event_response),
 	KUNIT_CASE(structure_layout_event_request3),
 	KUNIT_CASE(structure_layout_event_response2),
 	KUNIT_CASE(structure_layout_event_phy_packet2),
+	KUNIT_CASE(structure_layout_event_bus_reset),
 	{}
 };
 
-- 
2.53.0

