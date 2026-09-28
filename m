Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FB1466B09
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593185; cv=none; b=mUsNMxMrlcOPqCM0jZ2QnNeaKtHYSELU7EurouQNBJVuthX1mS/kyi/Tehz+Fyf9OCuRurvzNSLYcIH3f/amQJuQJIUXk/RQ5LfAOOFedh5SOPABLW0rFDZs1Ao4zxZtaSsh/WyMNbITJLt2KabJ9C2hEFf2K/lFSdpoXUknWY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593185; c=relaxed/simple;
	bh=XRQZB1JgmbvbFhZnhAsnmip/c0L2L+du13hr5NiGQuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WEEUPy3s5dylrNENVJzSfSVlANSci0svRw6ULTYBLcYFxjQdlRT7IrOrv6XCAY9EH02VRpU8P0R2SS5YlZ2nkKV1k9yvv1Q4uJ50U6ycunG4VN6XoRP///5bpPBQDp3TZPi5CptoprwuJQSKTxqVue2Ue1UrUaoQX3mfiEB+vhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSAWAdGR; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSAWAdGR"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91ede8035so24486905ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790593184; x=1791197984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7mh/86w7X/Fu/V88QblY8Kz/+S1umUNlcAg7+csYpTs=;
        b=JSAWAdGRFBhh3nSBZfVscpSZCiqz6+CJ2e08zPWrdakiElS/XMDM3ozccOEV0Tzby4
         ot54WIzbcm0jMX5o4Wr+xB3yuBpGvmjshQO+C7rIhA/MLHtq6JFMkP6QHrMcI9UDtejh
         yBdDIh6a/5zs/oDlJa6AqEgXZ+yQBUNhQ5aUcjJakdkK/NbHWlNqbq7ja0VLiRdT8cVp
         rc+/qdD0+uq0D2WvGproFbOZ8I9Jao9cLF6JcAtJjWDL8QBQqVI/Khp+vio6p3zerUAE
         Qjjz3eZX7CR4FAOl0703bVZiNTGtwstCrp5FCbhO7BVEpw89c2WudXkrnyJMw07A7okV
         IDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790593184; x=1791197984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7mh/86w7X/Fu/V88QblY8Kz/+S1umUNlcAg7+csYpTs=;
        b=OiCeuZ/PowQJf5ueOYoCVFcRTJUzZ9pselQ8rUhqj1DXNxe1B7I2Pj0nT9QHqFp6af
         mlxAE8eZRe3onpCe/MDXOFhfAcN1X61SX/JnD1R76vV6hcdO6dX2Pb5F+HW16Zqu3Mjv
         oje5QCgDgrOAfaHd8pyBKPQz6iOPFyDtP2FWR3UEcqWcY9u2tPHa2lEtDuy9dvOC+tP3
         x9iAqNkB2kId/8Pe9T4I2spYzAQN5AvOfW0rv4cpW+4FZbyX5BILDbnTrGEgU0528L3K
         A4o7luJp7JaKNw5wJ5EJlIGyje7egrE+gHnPNnx+gOFt9QT0g7JTdmOcnI+J/FwbWnuV
         mevA==
X-Forwarded-Encrypted: i=1; AKwUvByvIF7okQyZjLg/RvEMkVjeWTTbFpxDWizITTU6ev72lsl7AbLzvpXLD5AWoDHHWCJWWgVtwTtWI6gvmns=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAbLYpH+U8BSfOrFNVR9yv+BVmrD7Ds+9UOuI3s50bny3F6TXh
	mbVKojhiCzOarJdRJx06uS0GZkIO0S9hD4jR3Grv83o3Be94uR3Umpji
X-Gm-Gg: AYBFou3Xlp1ZCw+A4mZ2h+yJsQ/4lasEG8MJ8mWIVaOqAwmZa+vQ9lJHPRqvudmsdhq
	ub+zp+QVaRsMt1FtGQ5njRiPB22uP1thn/HptT/3XxPxkWqzbObCWYqZYdKDKMHVJqPtU3qxXd4
	XgoOV5FkAkfBLpkcPHxcLV51V0CdMWyhzpv5go6feywPi9irpcHtco9gDMwhHUbBcom0+XO67iq
	O06FepSbXrddtLi3/EOj01fMroKEpl43RL5ygJXABFMr6jrXZYouF1D6CVe2iUtJmxcU/2jO+Ey
	PupeP7ZpSV0gipdlQLdH1TP0ytBXyvLZFjEl0yxtRKsmjAUPT8gt0PyA9uEqn5GSHwxtFmMDqfI
	m5P8beAgw7G2zZt3T1/RgXIizwD39svbEw3h4yB4ATw+0sN5dKiPfm5ghb7sCdsshjBVuP/v6qG
	PYQCCrrU9N+clz4xxNBXL0gdt/lqQpLsHlP162toanw6hD9IHOOidKD0gt6OJ26Hmw7sieTHNci
	m0n8m5uxLxq/HJkMqkiB+/HGykXuemkRAUqRR0r1gK6Jm2QJcVPgfBQoiItNajOj/lzdc0KwNH8
	0SQrbhFkSHoq5QUtP9cbaxcLiPMm37Vk3LGJ4ZtzGx1fiC/0jSoTRbZIBdzeowS6oiigG88=
X-Received: by 2002:a17:903:32cc:b0:2dd:c100:943d with SMTP id d9443c01a7336-2df94c79e49mr69463255ad.59.1790593183696;
        Mon, 28 Sep 2026 03:59:43 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fbbd2asm39681665ad.12.2026.09.28.03.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:59:43 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: name the gregkh/tty tty-next branch
Date: Mon, 28 Sep 2026 18:59:40 +0800
Message-ID: <20260928105940.2186243-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The T: entries for 8250/16?50 (AND CLONE UARTS) SERIAL DRIVER and TTY
LAYER AND SERIAL DRIVERS name gregkh/tty without a branch.  The
repository's HEAD points to branch main, which mainline already
contains.  linux-next merges the tty-next branch of this repository
(Next/Trees).  Name that branch in both entries.

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
This is part of a cleanup of all T: entries whose repository HEAD is
not where development happens: one patch per repository, sent in small
batches.  The plan is at [1], and why it goes out in batches at [2].

[1] https://lore.kernel.org/all/20260924033200.3615554-1-matthias.goergens@gmail.com/
[2] https://lore.kernel.org/all/20260924101844.2403008-1-matthias.goergens@gmail.com/

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 140eafcbbd78..cda86d5bd806 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -140,7 +140,7 @@ F:	drivers/net/ethernet/realtek/r8169*
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 L:	linux-serial@vger.kernel.org
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-next
 F:	drivers/tty/serial/8250*
 F:	include/linux/serial_8250.h
 
@@ -27813,7 +27813,7 @@ M:	Jiri Slaby <jirislaby@kernel.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-serial@vger.kernel.org
 S:	Supported
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-next
 F:	Documentation/devicetree/bindings/serial/
 F:	Documentation/driver-api/serial/
 F:	drivers/tty/

base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
-- 
2.55.0

