Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D07C47F2C6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754396; cv=none; b=hodCnSgkmGT/zE4PlZcLQe77QlObxcnXRRAMI8z4F4+UMzUfQDZdiZbhGAQWc1xRtpLB/KbfdqERjutHbjcB/O1fuhf6RRSEguFi3gXFpGLRfScQjav0SQPB1LfiWhnNC4wLZW3M58qSxyOUsxbpXCtMS/pJUhINA1nMY3ifRYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754396; c=relaxed/simple;
	bh=T8+9GlGP9MFqBMqKA24QJwMA5/YrBixZGvj9RwPp7mg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SKs9/vFmsMKbMPSBPNF30Md91ecshhQVcdbYm4IAIuIiDcWHsgob879dvxar/ygfQsCNTHxkgxBb/YzCfkTL5OF1GyQoR3khsuA3Bc1fmmqWsjI6NqoAhzzMV8nteLO/Z90y2tXqJtDFRd7k0eJ8vM5QPmCXGDs6pDVJ5VqO8uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmZ3pBAC; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmZ3pBAC"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so833164a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754393; x=1790359193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+paugbOt45TmuWzryTTwPeNc9ZdcNY2MsSqwjEw8MA=;
        b=bmZ3pBACq8j/dnlRAOnFU3KUNdn3tLu3ShCv4NY5qnW53bF5WsLSUkUw/jRwwDYD5r
         fU6p/zpnsilK5nQ89lGEtpyoQBoN6PGCOG2SAT0TNCeWZMnYIowkZYHhR50VyZrlTL3A
         NgpX77muCkBwf8MAbzqmG34DMrXvCy/50uv4Olglgoa7e2OpaLsa6dIPVY9ocH4jz5nB
         CM38JjP7DYsQ/YAlooko0j3OYQ8W7eXX+rHDYWnUnYRl4/1ynT9/i88zAcD9qTEEPLB7
         7P5LAOpWbPQep+aGvOECkIFRRqdNDFpnFqbxwbwf0tugAsQ+7l9anqkD1XzhlH3BP57E
         aW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754393; x=1790359193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+paugbOt45TmuWzryTTwPeNc9ZdcNY2MsSqwjEw8MA=;
        b=OgC/mKxvrr1tI+tZk3takwKuHoRfEf5JxW/AMlkoTmtNA/39NKXaTeR9khfah0vTGn
         c2vQJ4kPyCqM4plR7eT667pGBlz0WGhKzUjTH85slHvRML/de9bD2yFmF/Nv0RUBmx4Z
         i0ZRsM+CTUcY5HHn9Pe8gmt9PzfkTaoMDqEvOw8mvgsLFckHe1xp/KVP3aSpoPvK/iua
         AtXb23S18Y6qhz87UCgcG5eA++rBMJg64zco+TPMQ458bZ4L27XFJTnaU+7LU1BdyXuK
         HePTYO6bkm2U7rl5+e/2UjMU+kcgP0Kc6ggd5UImYnZEWo/A4vzWrXLnbvxzP3MqJ/pM
         9uZg==
X-Forwarded-Encrypted: i=1; AKwUvBxbxUxWM5Tn6HHMA33RtRlXE6pV596syL+gzeIs2438rOglDlZGNs4v9mvb37d8BSOsr7F3KlzkEYUHxj0=@vger.kernel.org
X-Gm-Message-State: AFuF++nLCHua1sf3INNTysFSxJTrJlF2SNbhIX4w9AOjo3XeAq7xGc66
	g40BlvRTZGLul59C1m5zlwZEBl22xjPWPcpNpCkP5pKhmL/XkPuntin8
X-Gm-Gg: AYBFou2+0ieawQ7bNFdbV+B5Oqkx/ET+BXSsj/MmLfGbgCL5/mF2FPKCfXZ3xwM4wiV
	1LXd76JAGLqdulmp7C5WQYY0Y6wnnP6CdtgY+9M2Rd9xdpUa9tqNTAFT8lqEcVPdz8vYN37rSP5
	khDkirP9EdPVK3eVmve6ZhftU/dXNWF6kX9vv5YyLwQFEuSws26rzCcx8ttLho/uq9TGn/AwPhQ
	vWWq7/6XUMdPCo/eQjWKsl011oOCwSOgxP1OPVMT4QgL4XKobMJ77+++Ap1fcclKaB3QRhXty8k
	OQYILBvwlIIHx6sQy0u12RLvk8NtE0hv97ZrlJ7UHifh/vM+7obmjHDuGA6Hu8NtfyHkeyKOSY+
	R9LDVFhr4KMwPmjm6LBUPpfQDnC0q/6Dk4A3arO0C2+7Nxm1DS97HLe7U2mRzlwWXAGyzp4IRbs
	3ovXOU501sX9S8UNXA0C9StBR4R1RS2eKZ//YMuFqutZuslPKilNlfOu3oyQ3gYDmJxqctqauqB
	7hWqIhZdsQtKu0KO08K6WzvNcJt/Ao4lbEv5iGtO87axqGbFDvdNT0iVj5Nd819isP31uOOF1BS
	hyyv0shnCuWr/8MdwOqXvOgNmoXzijHhO/+xl6WvwpjUJmGl
X-Received: by 2002:a17:90b:3b85:b0:39e:6c69:34dc with SMTP id 98e67ed59e1d1-39e6c6936b2mr506482a91.64.1789754392938;
        Fri, 18 Sep 2026 10:59:52 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55bf843sm304342c88.8.2026.09.18.10.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:59:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: bestcomm: Enable compile testing
Date: Fri, 18 Sep 2026 10:59:50 -0700
Message-ID: <20260918175950.21657-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow the BestComm DMA engine to be selected for PowerPC
compile-test builds.

The freescale ethernet and sound drivers now need a dependency on
PPC_MPC52xx as they use headers/functions from that platform.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: keep it bestcomm only
 drivers/dma/bestcomm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion1(-)

diff --git a/drivers/dma/bestcomm/Kconfig b/drivers/dma/bestcomm/Kconfig
index 5dd437295964..153b5492c93c 100644
--- a/drivers/dma/bestcomm/Kconfig
+++ b/drivers/dma/bestcomm/Kconfig
@@ -5,7 +5,7 @@
 
 config PPC_BESTCOMM
 	tristate "Bestcomm DMA engine support"
-	depends on PPC_MPC52xx
+	depends on PPC_MPC52xx || (PPC && COMPILE_TEST)
 	default n
 	select PPC_LIB_RHEAP
 	help
-- 
2.55.0

