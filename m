Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E514528C840
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519720; cv=none; b=OO9yDiDmqRzig7iQvY/+B4urRT0rsUU+rdKg3gTaI/bJUscTzDjKaCCDdfqSa1iVZQoq5nDRGuaSqY1K5HvGfXJYcuygZw1mPSDwUIlG8Lhn2EmgqbOlRelvRfwkyNI4Dx/hTv+3/qnpQyPdgLKN52EV4k/Wh6OvVmYgCXLu9tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519720; c=relaxed/simple;
	bh=y2SdOXv9fUT0qcw2EGKO7yFCxCfTmzY8yHIMlETCQO4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J2prepdrDmFM8y/d6pUfWrAxJbWAUSCb2KLVtNoHoQZZ/rh/axwCfP/wf3htx3rJ75pLA2WFwfAkMzkJ3Ul521LO7qKfeM4ghOtI2dTax6BkPo+Skc3Cl4UNXDM6F0zF1k/H1/CBvsqITDL5M3b8wHo2ChqIowUQ6Y771wm5o4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+1Zx9rj; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+1Zx9rj"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-3468ec309afso206436eec.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519718; x=1791124518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMXueYzEMSkafhBw0cZtNBrJpZvkeyJZqfF9NmIV6eo=;
        b=o+1Zx9rjRKjJ5WTEbpZElH8CB4Ccv0gtXmfvrtEa7iV7GYV04Dip2ERLbN6fj5ERHM
         FAy7X1+dt8NtUqmii8pBqQtuRe1tKvHFfGGBlOFFgr3xgxz9eZIpkfYfnHTxbJ47XvFB
         4fHjRbQKhwBYfneG7Kw16ygpcZ+R8hbC091DPbdM0nwSbfuGcvDCNIK3++r5VzbJ4fz4
         PiXgdVDShGgZxDz5cbBq+H0XCVmBlymXXNP86MlikPEbLcn08kqAV9pX+hJ7skwld8Ax
         wFngB5r5htWDX3Qt8sRBrQSaFFi4eMzhotB31/aEv0frjN8xNV+jSjPoA+ioCfmFnZmc
         hTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519718; x=1791124518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMXueYzEMSkafhBw0cZtNBrJpZvkeyJZqfF9NmIV6eo=;
        b=MWaUdKVP0EUJC21VlU0hP7QGbuVu7fCTKQgyDjIHsg4oS4pGND3xX1mCuGoEskMMBN
         4n1/i+d2gJ6baTxZWkRAooHPIcusfV4VBLZ8aU2Mz0XBthWFAl8VUUUMu229S9AZ0ROf
         /VdoV8jAaC1y7pKlASDqppOTxLcFwMBVYDgU3+6DOpBPzIE9XZEiAF2Vgoa8/6zMHL7a
         EGD0nA96UL9aSp5U2ni2Cddr+C5WuesrPxvvwMCSvUU7FCg7YvmjCJ8G2xmOF5UC97er
         Si2ZDoSwIDo/tlQJMHt/e4hL85z695BVt4HOWJQj7qDqK0yYhGHsUoksh1KoIuDQjBLG
         TW4Q==
X-Forwarded-Encrypted: i=1; AKwUvBx08VNvOwKJqw2JkDHodYGkeFNsu2WbuiJLRt8ZCHnB606Shx0OZejJiRomIn29mN/bmqGWm8CEGUvJfjc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKugmaC0/t737/fBC+g0Xch0AT4L9VcMLlZqfizZaMGjreifFmo
	StXpH97krBRd/97x9u/wSu703NVwHRKLSU2XISiEiyXdimhXaeU4VEz9
X-Gm-Gg: AYBFou2x8ChfLZYQ+a+W/H0TeHd2cMgzDRHVGOHTXYKqKehQf1lzPzdpJGRG8KxNP2y
	OKXzQxzReZd2zcOfi/HuZrDdAeQDSOR+9KNRjKu2pz36NjfFG+u/CGeeTm7q0WGtXdxXq9C97Lr
	fCQ6adZilvVWFWdgBsDeNf4f/oFk+4QydYq7kS8tw2BI2nXAqB+1JEI2HGRZjW20g3D0G0U9gOJ
	XFnjJUiUSx8pWBikUrTAlFWHHjREyenYuB9SlDV7iFlnb0d/AvtymYTVY7nMwKFaiMtRrvCzkor
	4YcjowqwkEn2XUrWo1NokAFuB+nIRJPzSTqrFAhfumwmqM6PTQZwn4Jw2T85XeUcqBeye5sO244
	CmjMxslwWRGLSiper7D9xXC92T8xOAWFvSt++HP9uzrmwuhWcNMTiLealYqK8/YgxmiWrvEdWJh
	UrHLhVyPhpnUGYETnrpImSoHY4E4q/0941E6yrMFgXDYwg0RJvcJbX+P+rqOzI3zvY1Xx/vROla
	gYVBhoVzabMdnfjTUDQBZgVNcSO/ShfG6xQ28qEVjmiOpvX/758kyuABCrm
X-Received: by 2002:a05:7301:2623:b0:33b:fae9:fc37 with SMTP id 5a478bee46e88-342711ab273mr5485491eec.5.1790519717835;
        Sun, 27 Sep 2026 07:35:17 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144b4ae50sm21869436eec.17.2026.09.27.07.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:35:16 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 10/12] powerpc/pseries: Enable context analysis
Date: Sun, 27 Sep 2026 20:03:51 +0530
Message-Id: <bc1d8d5a9227776a49b8f72f64d96f840b5658ed.1790517984.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1790517984.git.ritesh.list@gmail.com>
References: <cover.1790517984.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pseries objects now build with Clang context analysis enabled.
Turn it on for the directory.

This checks that each lock taken in this code is dropped on every path.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 3ced289a675b..d5f9beec33cc 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+
+CONTEXT_ANALYSIS			:= y
+
 ccflags-$(CONFIG_PPC_PSERIES_DEBUG)	+= -DDEBUG
 
 obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
-- 
2.39.5

