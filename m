Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5634BB274
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790357638; cv=none; b=MBlA7TJkmZYVVbO/50NB31+IVpY9gQnzfhX9DzXttFQVxoIUOHNAF/vMS5zXT9K9+jrq1j9vEAr1oWGtOPU/gk42kQq1fSWdNh2daVVrP6CBHeMFr4QVdLK2omlm4RNfT9QdSzZfoy/g4Uxngk7xFiWcYtWyhcSYclP9TqpoMFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790357638; c=relaxed/simple;
	bh=R4nM+RfRPy9cvXPuXWDDNjUJuldCJAg77WQq4LhuX8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sIYVDdgmvFHcR+GXpuXy3uUa7AClCzlCL08bDMNdeMaNDRyoI0ePDOtri7sVwe7kdCfyjB5z5G/u90N5pRFHsfb3SkDf/vZbIFZN70riGHvVfDo3ZQ1OdNZa2HtmqLiTAzGrYST4f1ZzNc3rIUsVv71tsftrqtMJ0OzTP/VDcJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YK1BkqT+; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YK1BkqT+"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso757266a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790357637; x=1790962437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CU4Pbk6yEdmwVsePqB7iY1Qnsa2ijgxKYqdvE/nBhpo=;
        b=YK1BkqT+XJon6Vhh1ZP7cVAbNuBjrlWDAA6sxMtRM/HfsS2sNjFXyVG2DYZTfbyTxy
         cFMaSAuMtY5WJcdzt2WMKloGbZo8D0koevX4Z71CdtgJmlHGtClgWEJ83Me1HokpYZ0k
         dUPpg8qN7/vm8ncxOOjOaRMUI51/DIEkx49S6AcHh1ARaR1F13LuDGUN1GxxwKcK55sy
         5kpm3G4kpuZcG/pWiydoDUU4CJzV1xYqfXH7vWrhcPsdPtCANwsb1IUvcm5f5YnvuV1x
         Z+ZPgpO0NcMGWo/gFxnUh3PJXP84xlyB3/yZ8gaftQd5A6DovMTxldK9dJ7b4KFiUQ3O
         2MeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790357637; x=1790962437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CU4Pbk6yEdmwVsePqB7iY1Qnsa2ijgxKYqdvE/nBhpo=;
        b=Qn1ZrmRrWk4t0tStlIDHCw3GCgWudeKTI2kwq0XNboLeek6+91RzJtZS0YamL1w6xo
         UJWis67U04AsnmWGrgm4LXpmCnFxEPTGq2j/OVXx/Yz0aniLwg2Gu15o1RHjTgpzxbzi
         reqGpy6hhdhP/COVXVinbkM9UXtlVHzZqj6192g+93kn2yWPtsh4C8iYITiwh7bULtI/
         4M2uvNl2ipPvYXsjB6xSTzgkFeacOoRht2b4+y10e4+cbQ5IE+EggRpNffWtnqZbkK9Q
         T5IubAlebg2cpJw2e+iS6gTghle2tA0LysR3hxUMpJ6PkUfcIpXq9OdROh/z1Uoqzr4J
         l8LA==
X-Forwarded-Encrypted: i=1; AKwUvBzKmCOmx17CXKVlVujjpT5CD10yZCfYqbfDwMLAlI4oJWlaeiVH8/whkMTxwMjYOpkIL6dyK6j9uxVjvjE=@vger.kernel.org
X-Gm-Message-State: AFuF++nUlCZYC/I2FqgF+G6KVcUUVN6khjkIp84ESWOxG13KkwmIvwT3
	znsjB8x/QZSvGaWRNe/5x/8nVzYBSQTY7KO3jVauSFxweaaqJq5wtOqL
X-Gm-Gg: AYBFou2JmayuhSQ46/PFDLEOVs4cM2zB8sQ0gXUw6FfYpNpWOOtMeBUXhrG8I8U+CMC
	wu7MB8wcZQnNopI3Om5yQCEUgrCj3EqPqsxK5OHKtT/XAGg8OyYt/Frbj7Au2GhnHs38f8VmH9C
	pQM50E3KbED0WfdGGewDnwIJ9gXbEXKD5mD8MzIkXn8bd4vfP5fLxCietXRijhME7VHUmm+V6y5
	60nzSFC9XDRDZLGoM37UrY/QLLHcmrY98vdVdl1nlDV5R5KwNOeYCpto7TMIdd+XoTG4gJv6Gsz
	EUPI4ridXu2ZPdsW+1t6fTaxseuvl6BiL6xOr9XRmmLoPK6O1c/McJB9tYUEU3ei6SjZ+UmSdIO
	FyMI1rTLn0Ucq8sM7tfV/1zp4XP/oVcYq8HvqrA/1zBwIHHejPhGK0mgGWrCbPgZoJ97owm8XoU
	z2GKkeQp6TowjBYyiYe2BobkGzCsssbbb0XNQMsoz4/wxlqNm5qwp/di93I9q43QelVSg+3HfB7
	dWUbRX2XaPuqynCRlgnZFRu0LA9aPEzZiUStf+YEnAHDHaGfi/TbY3zMYymInCbRSakme+LJ8ER
	8hEEaPn4mfmH+zbnsObZ0Z45O2gziGLthyiAwg==
X-Received: by 2002:a17:90b:17c7:b0:39e:6c6a:6577 with SMTP id 98e67ed59e1d1-3a0bb653979mr2238198a91.58.1790357636683;
        Fri, 25 Sep 2026 10:33:56 -0700 (PDT)
Received: from dell-pro-max-tower-t2.cse.unsw.EDU.AU (pag-t2-pc.cse.unsw.EDU.AU. [129.94.173.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0d22281f0sm651224a91.1.2026.09.25.10.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:33:56 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 1/2] ARM: vexpress: fix device_node refcount leak in vexpress_flags_set()
Date: Sat, 26 Sep 2026 03:32:51 +1000
Message-ID: <20260925173252.933705-2-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925173252.933705-1-geoffreyhe2@gmail.com>
References: <20260925173252.933705-1-geoffreyhe2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vexpress_flags_set() obtains a reference to the "arm,vexpress-sysreg"
device node via of_find_compatible_node() and passes it to of_iomap(),
but never calls of_node_put() on it. of_iomap() only reads the node's
reg property to create the mapping and does not take ownership, so the
node reference is leaked. The function runs from the __init SMP prepare
path and caches the mapping in a static, so this is a one-shot leak of a
single refcount during boot, with no functional impact.

The lookup was added to drivers/mfd/vexpress-sysreg.c by the commit
below and later moved here by commit 9b06fc39084e ("ARM: vexpress: Move
vexpress_flags_set() into arch code").

Annotate node with the __free(device_node) cleanup attribute so the
reference is released when it goes out of scope.

Found by static analysis tool CodeQL.

Fixes: 974cc7b93441 ("mfd: vexpress: Define the device as MFD cells")
Assisted-by: LLM codeql
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---

Notes:
    Compile-tested only (ARCH=arm multi_v7_defconfig, W=1). Not tested on
    hardware; I have no Versatile Express board.
    
    The CodeQL query behind this report was synthesized with LLM assistance,
    and the fix and changelog were drafted with LLM assistance; I have
    reviewed them.

 arch/arm/mach-versatile/v2m.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-versatile/v2m.c b/arch/arm/mach-versatile/v2m.c
index 79afdf2a90b6f..c86b38386cf7c 100644
--- a/arch/arm/mach-versatile/v2m.c
+++ b/arch/arm/mach-versatile/v2m.c
@@ -13,8 +13,8 @@ void vexpress_flags_set(u32 data)
 	static void __iomem *base;
 
 	if (!base) {
-		struct device_node *node = of_find_compatible_node(NULL, NULL,
-				"arm,vexpress-sysreg");
+		struct device_node *node __free(device_node) =
+			of_find_compatible_node(NULL, NULL, "arm,vexpress-sysreg");
 
 		base = of_iomap(node, 0);
 	}
-- 
2.43.0

