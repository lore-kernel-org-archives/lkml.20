Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99AC541E70
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111278; cv=none; b=GIP9L7pFC9FN6BmJiqtJB3r/G4X1bc7TL8VPpDrZ540G4v5nCChdUDF3/fOyIDLJZl2ACL+fR8q9Im3zMl19ExuiYcMEO1kPQFeVqxKuMmJiy5L7p34/7q5QUr8J5zuseT/q0UndUwTETGeDoShFNxYXKXnlZDPx4ftAGy7q408=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111278; c=relaxed/simple;
	bh=JGv5Hgw+VD3kIdQ/ZBUha8cXE25Cu3UnWv7XY8BDPm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jwS+kwIVywXFB7owqFWdqr2cC4aRvrNUK/PwM1xZgY23sFL8OJd7PPftFoYVkXA+H6XvnYuIWM5xrSID4WGC+CrDBF1oHG/fH6r4DYx1cG17NniRbMsSbSAIrTgL4XGk2kllTGirgPkhJun9eCyJCskbUQsoF5e+Wy1CxNIPCAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgJgm8rD; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgJgm8rD"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so488456a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790111262; x=1790716062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EeL85Yka+smpT4FhVZXHXaAJCGYDOpSx8O4lbscuj70=;
        b=YgJgm8rDsmsqTGP0pYuogzU9ryh8QU9TfIg/8lhvc+R/p6ZF04rCvDPLLeAkXbzrIL
         MZMUuZwp2C/xJsaMv8f+7FuwZ3JRllaYBUE5HV7e/0AjoWcR0TWVsBd/HzG8P/jaSp2P
         701xG7qr23K36Xv/yo6eNbLUg0V4WnfBXq1AQblzZgpqKMo+Px2v6g8xQatQ9PGzJsT5
         lCN8FNCrX6jWCWf15RM3YUZvp23kDf2Ic1O8PZsV+4lPvaYvvOz+n5FvuJDOO6WbquKz
         OD5XUape4J6GuVqOzGlN/OqgcgGWJUd0fDjA+QlR2lIq+/XVB8NrFgVPigguMZ91LMOB
         4hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111262; x=1790716062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EeL85Yka+smpT4FhVZXHXaAJCGYDOpSx8O4lbscuj70=;
        b=yRo66W/GkTKKUjKgT9SZS4h+LmUidSnheEFDmvmVwrzVnQdUkReu0xvWlto906ykV3
         kxZpLpIxElQyAcGbZVnim+6x9P+KU/vbctzYY/t5lonMhp5Us/5xuCxe8mAh2qO9ftjp
         cnma9DP9w9iSeeKXRdE8Dh+i5+kmXv9+AswMlh+fIH7VMFisenvUguQ2OSnIYFfbsXrm
         07Z6XzyDgv5fGJuYg/K5zBFg8HNyUe+aoNbNCknW3N1LK3OzGbL68w8bTFNTlUow32Cv
         m+UfSjzMn9ZnJRJLiSl4xSfx2jv1h+ur3QPH6KG2M/HdhoF3JnhHDUaJjaLX0QhBiYQK
         CJbA==
X-Forwarded-Encrypted: i=1; AKwUvBwj8s7wwydMfzRzP8jVxOlCalk3iDjlJ6UCE+2jb4DJ0XyYY5UJgorvzNOX1bOzaXqeKjZ+/XLIVvWwM/U=@vger.kernel.org
X-Gm-Message-State: AFuF++lQj9q8uV1xCaT5vg3xiVuctogrIk73/kyRax/2wl62H5qA7K+E
	aIXUCDI16s4ifCMavkIvJJh7h3xZBszrjh5cdnAd0hkYUYm+E66GEkZwbtb5W2AQ
X-Gm-Gg: AYBFou36+23cRjm6EcoJQNdp9S0ZvsvUzFt9BKqnUwsy0zQzl5UMurg6c0F2vhznyIW
	dKRmvmmXSX/OWwq/k96BBy9GL3NpTJm6u548MXUQ0oclxgCOTcH7CREFBV7Fyedk1++qeMzjJbq
	GsKXvqOX6ZiUUCtu6zwJNu2rNWq5IrXyJQ3JsDVgJDhZK0j6ypIp6PXRrqHLa2YPIpaj9V/8ds8
	EP1u/oP1usgusuW8LnuCvmaf3VoP8YyJEYhDQ/rp8x1rHo4yYOUIIzC/veIx4ZjEkCNxV0GRkqf
	pCKEamLMDRr2z1Ehte+Cl10CMVk5Ib4Vr5BdRyHXzXvuvI0xZxohxN+pJk+VuWv47PYPAjVLIcE
	vU4LVX5+xianbfx9NsP50fHUCSO3dgpVGxgrLpME3+sCt9+yOlwjf1KlNE/21W7Dj8vxCCt9KEW
	9gyGbpZqCvw6AgycuCSbMVn/hf7tmy9XBhFS+yLSrxS2pXR+qi6smKjGsSEdJYbnXj2XlNkfFGD
	lXdXhSnNjr6+SEFUEuXKWMd0Q==
X-Received: by 2002:a05:6402:21c2:b0:6aa:734a:a08c with SMTP id 4fb4d7f45d1cf-6aab3bb3bb1mr430543a12.35.1790111261500;
        Tue, 22 Sep 2026 14:07:41 -0700 (PDT)
Received: from WBEC1813.wbe.local (xt27d7.stansat.pl. [83.243.39.215])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab386e596sm316940a12.7.2026.09.22.14.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:07:41 -0700 (PDT)
From: Pawel Dembicki <paweldembicki@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: rosenp@gmail.com,
	Pawel Dembicki <paweldembicki@gmail.com>,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/85xx: Add fsl,ifc to CoreNet device ids
Date: Tue, 22 Sep 2026 23:05:09 +0200
Message-ID: <20260922210531.1103068-2-paweldembicki@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 0bf51cc9e9e5 ("powerpc: dts: mpc85xx: remove "simple-bus"
compatible from ifc node") removed the incorrect compatible string from
IFC nodes. Commit 25957f7c3dac ("powerpc/85xx: Add fsl,ifc to common
device ids") subsequently added an explicit match to mpc85xx_common_ids,
allowing of_platform_bus_probe() to create the IFC platform device.

CoreNet platforms use a separate of_device_ids table, which still lacks
the corresponding match. As IFC is a direct child of the root node on
these platforms, its platform device is not created and the controller
and its flash children are never probed.

Add the missing match to the CoreNet device table.

Fixes: 0bf51cc9e9e5 ("powerpc: dts: mpc85xx: remove "simple-bus" compatible from ifc node")
Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
---
 arch/powerpc/platforms/85xx/corenet_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/powerpc/platforms/85xx/corenet_generic.c
index c44400e95f55..fe9e7ba5b77e 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -70,6 +70,9 @@ static const struct of_device_id of_device_ids[] = {
 	{
 		.compatible	= "fsl,fpga-qixis"
 	},
+	{
+		.compatible	= "fsl,ifc",
+	},
 	{
 		.compatible	= "fsl,srio",
 	},
-- 
2.43.0

