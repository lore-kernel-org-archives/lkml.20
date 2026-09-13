Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0F0344052
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 06:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789280971; cv=none; b=j6rVkjjJ8lJSSiekU3laY7KfTdtYiieuTtfdWrQxCWldiz4yost2cACczpCnH/H1o+ADbMFBf3Hrg9NCVBvy7aXVpv8TR4H8vENH38+7IJKRgA7cQGHo6v8G1nvFzFNhguuN15j33n+LJyX3ZSVf94vr4K6UylSm4pPADgJFvjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789280971; c=relaxed/simple;
	bh=wN4J+1s0Cp2LaxDKmorg9VITLNvE7jjca+2GJ8juIAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kz6BhB6jrP1bDhSf0640xWPsVPiCDt1U8Anqjr3ZSg9F1f3OiHK8M8EdppwL8Ipjr86mfqNS8myQmqvkivDAz72X18oT0MUIwpDZB6wEZX5XBi7Pi6lqWOX4WJsvKRL5+xHHULp1ahwWwfiVV+1pym7qrhYK1AJpM2AxIFMq1Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtqY4cmp; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtqY4cmp"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so638040a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 23:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789280970; x=1789885770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lk4ypTHp9u3h2OenB3f+2Fs407BPr+j3PkOUabDhX5s=;
        b=XtqY4cmpmuLwAqMqpzOv6Glta76KdVxQBn2JazhYoaRD3N6vZQxd6BILrBwfEDvmL5
         Dw2mZLQKOjBevXJzn2wxc8JQOC4b4mxf6FnS1+p3TwErRM4nIa9MTE9UXvu7TQLMtjeh
         NsJAy/YrFKstUGjQiD5F7TTn5E4mYsS1Dhzi1GNq4NZmOlRbPjx4OAYiJ9wf7vr6Jk6K
         gjT5YO7uLCqFCo7xNdV0OfMwZCeARe8u+jOuui+vLrHg7OryuoxahhAOzFUBIrgxw2Ik
         JLnps+KiKf2tvZ8EjRER4eRhRyTU6VlJJgndCaFHBN1b3rzmdK1VFeDojn8RHK2XAC7L
         2OcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789280970; x=1789885770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lk4ypTHp9u3h2OenB3f+2Fs407BPr+j3PkOUabDhX5s=;
        b=O5Ci8aU7V1SDxLd4BL3eny/gmLG/xp0X6hnVtrKo9DIGZa7sqRPY7CQ1BVx0QWs+4E
         FBk9RDz3ZAUounUT88SQNogWNFmbGeWTw7y5PoUEnPEa6RM/CdwNkZx8XJ43zDJn8MU+
         OXDFcwisTBD6YzRfqy0v0ildtX+pNlr2yjk0lfd3DFZVpr+cEcq1R+MGuw70gUQmVQAg
         5zu6bn5NFkW1rlIElHSXPDIjx6ZDbITljpHfH8seYuzyQW16rh+orG/yGf9u46X1RQ5m
         79pTSnAQYFKGkldbacPbE+woxp6ANN3OOJtrYpYBZdNbDJBTHxj86hDRArMi53VJmRD4
         xFhA==
X-Forwarded-Encrypted: i=1; AKwUvBwLQwtg4uIudrepwoOqm/3ztIzMroYcdEGLfZ0kFKbmmAXCmHQW8E2U0bti6fx7ij8mabdx2ZN7tUBo1Og=@vger.kernel.org
X-Gm-Message-State: AFuF++mX977gWWc25SbG8StOujeD9FnZZE+B5LTUxvl2kx5TIlEg9ONR
	r+1SJor9LuHPQEICmP5gnHjDjKDRPAcQonfnJN1bfOrpNRqll4qk1b8t
X-Gm-Gg: AYBFou2iHvTrx//UOcHcgBANQSsAzyi05+um/JftSGhHrotSG75+TP2iMOPnoM2Cjnl
	JZ7AtFdat2Z88YkY9oQUpWUuJc5K5IOkKRBKHlNOD1wjgJmqHD7r0aEP55lbfNLqYTSLVJsmJgm
	0DVuG8zC6053lORQLJs4vGvSNIsE927q64RfloIrwv9TyVpGB8HvOgk9sG1Q294fjorJZnsDx4v
	vCHWxle6vzHHYBIEbIqmGoASUdP+Zt3h4lXJoYs+vxl1ZYqGS665DzP6zwx9J36FeU0R55XxuHf
	tKyBAOUftPbPItlx4HGGSSPT+tFgBeMb00tNFKYd/kcUmr0qVuj/nISHIQe/ycx0rRhx0PIag5b
	xQm3i3EDL7sJS1cQRJ7HL87VML8STe1/zCHhzD1zxMS1VISrL59L3hp7cOAXmuo9of18RyG1RDI
	eGhLsKbrkENkagzj6tRFcg5n2OOMsEPnvLFGJCgomtKoigtihKg72ZR5k=
X-Received: by 2002:a05:6a21:6013:b0:3d3:ae40:51e4 with SMTP id adf61e73a8af0-3db0e5ac054mr10625772637.24.1789280970075;
        Sat, 12 Sep 2026 23:29:30 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c657156bsm3200448a12.21.2026.09.12.23.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 23:29:29 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] gpib: ines: fix memory leak on probe failure
Date: Sun, 13 Sep 2026 14:29:08 +0800
Message-ID: <20260913062908.1437895-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ines_gpib_probe() allocates a local_info structure and stores it in
link->priv before calling ines_gpib_config().

If ines_gpib_config() fails, it calls ines_gpib_release(), which only
disables the PCMCIA device and does not free the local_info structure.
Since probe then returns an error, the remove callback is not called
and the allocation is leaked.

Handle the configuration failure in ines_gpib_probe() by freeing the
local_info structure and clearing link->priv before returning the
error.

This issue was found by manual code inspection.

Fixes: bb1bd92fa0f2c ("staging: gpib: Add ines GPIB driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpib/ines/ines_gpib.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpib/ines/ines_gpib.c b/drivers/gpib/ines/ines_gpib.c
index 6cd6ff596fda..6d09dff5e797 100644
--- a/drivers/gpib/ines/ines_gpib.c
+++ b/drivers/gpib/ines/ines_gpib.c
@@ -1143,6 +1143,7 @@ struct local_info {
 static int ines_gpib_probe(struct pcmcia_device *link)
 {
 	struct local_info *info;
+	int ret;
 
 //	int ret, i;
 
@@ -1165,7 +1166,13 @@ static int ines_gpib_probe(struct pcmcia_device *link)
 
 	/* Register with Card Services */
 	curr_dev = link;
-	return ines_gpib_config(link);
+	ret = ines_gpib_config(link);
+	if (ret) {
+		kfree(info);
+		link->priv = NULL;
+	}
+
+	return ret;
 }
 
 /*
-- 
2.43.0

