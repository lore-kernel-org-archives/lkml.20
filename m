Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB3A5013CF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901775; cv=none; b=gDkR5oQqMUkcruTJ6/xTqxiv7m0Si+93+dGEVBFMWxb8j7wKzDCGS98p056A+3xrXuKlJjPPBJRfQrOyYIwDsqoaqXulJ2hqIUJXgvjEoe/pIyqxWkirjK64+hOelyYwQxl+lzZpviRMnL0TLd9ftq35aAdZ8Njx0Lf+YvPBWUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901775; c=relaxed/simple;
	bh=+mE7mXs9FSK3OKtza6Zete/g8pAuxQQijr3UMZefDpA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fVlT3mdgdUpcHQCgqajh1BTX2GUAQvOeQeX8Pdr7sEymA9tUR5O9yicc4NBiyj/log50Nx2Rg92BI0+h+SZRK8gIxNIWSDF2FqW5L3t00rnJNJq2hQB6eNaxybGrjjKdNvMSt97sNU4LDa+L3xpRwP1GTq30F8tp5BXtQU2MikY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAmWr/tL; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAmWr/tL"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2db80fcdf8bso17107985ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791901774; x=1792506574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2A8qYWgVmxVZskPAtuBTjYWM8uCy5WAXwZZq8DzcTYU=;
        b=UAmWr/tLxaxOWNEI0DPwNk9/VPLvbA41b14QtxsJrDiJjF++WN/J3JRoIgM5VeodBO
         /9ky+r15AhIpDvJS+nq35sfRD4uMo3+tRRX5lZKxvGxUWopyq1WX41YxGemmGmRcn53g
         A/uXSrJipXvAcGdfaigjx8blHHNw6jgMlHGpXnsdwNMb+hD+iLZryRBprOXi2yAEF6jW
         V0MMK0olurqYPP8psbu8+P6/DpGt3mE8Qp4ikysImgQKThHXSYkJtekwvc/5JCvoJ8eg
         mJSaAicdfr/NHf5xY3C3HBVVfxBxmN3sMAYEQCpnXfbIs3yZzEKaURr1yAb3CY/ifdCJ
         Tvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901774; x=1792506574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2A8qYWgVmxVZskPAtuBTjYWM8uCy5WAXwZZq8DzcTYU=;
        b=xLw4XYuLW1AsXUn2X9Iqzoh1sANRny8bB9FeL5rCyLh3UHcL81R73xZFDvnF5S97ov
         PeLY/gbKiiOBgvkj2w6znyIbDjEOYFle/4dzSbN1d2tYxGyBGol8rsx0c+fKSFGAT7TI
         NvwbGeK5iqt2SCGoiiifK4KwsehmuYWQ3vbTnttVMitVs7u1ou295hl65lgoT4GGoy8X
         xdasL6d3STanz0RNCdoXtAIUHnX8nexb6RtWc8n2Gu8NR3nPhFrSzDmuVxI3Mro+FjKo
         NIN7098BtRtII7M/bL6ovgcZNilrAgjdzcdCPJR9RWBp7wn5laU2093bqfHMwlHx9+A3
         AwOg==
X-Forwarded-Encrypted: i=1; AKwUvBysVUMTNmUcfGTx0iMAE0ZSMPaqfr/90emNkS9dFcy4gPMkKBZgLI0+QJ5nVVevgLliECxT8EzLRx5ANJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2oJGH+Jxk8hxgZyy9KDUHGe5zZ8Kx/xQTP/SZfFdCcn0CYYeC
	AnQQBkxDgwA6D9m/vaGNk40zVFTO2L7ZsBBed/DAFvvL/QUfYvpxkH4kl9aFeqTYccIQ
X-Gm-Gg: AYBFou3Dk8jHiLZdqJzJQtBAL7/vhRYNb0IzWwVmTz+Lh5/2u7HbdYDYk8WSikHn5oL
	rQbI0/oNQXZwDr4Au+dScR1qiwuSOHhb8x+yniTp2D0OyvXq7Eu5Jf9d+P7W7wCUGSsp9e72wTu
	svtFwSRt4zNRZQGqELmEYxuE9kFEOexjcAkbPdO4bVfTbSFitjB+wjQ0eSkGfwxcXGfdk+0hd3T
	+wI3TFvAXjE3v2v/Skcw6w6814Llmi7mp6nPC9BhR58imshnHL1yndpnVbZC7IfMA9Pyr4QwFvJ
	hrWKi3xj6p/tdZDz0gNPu5nVq+Oy0UTyQn9+CEKIoWY5tZLXUapMm5CNC586F/fDdVWRpYRKNqY
	C6Ldb33BYj6vVaCXH59cAS+iUP1xdsWb9yUaSd4y1y30x+QsTi2EuTgqhns1Kq9EtCH8ZEO/P9v
	hbzZ6m3/iyZz7YscvK1TGE8ce2S3tQTjfj7XkbcifpVn2ACan0A/pcQqr4qCv/vAXlARyzifI+B
	a/+neyE
X-Received: by 2002:a17:902:ce12:b0:2dd:ad73:5b6d with SMTP id d9443c01a7336-2e8429ad1bdmr103140745ad.29.1791901773175;
        Tue, 13 Oct 2026 07:29:33 -0700 (PDT)
Received: from localhost.localdomain ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e519sm58353405ad.25.2026.10.13.07.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:29:32 -0700 (PDT)
From: Wang Yibo <szwyb123@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mustafa Karamanli <mbarancemkaramanli@gmail.com>
Subject: [PATCH v2] staging: most: fix typo in driver_usage.txt
Date: Tue, 13 Oct 2026 22:29:28 +0800
Message-Id: <20261013142928.443858-1-szwyb123@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a spelling mistake in the ALSA component description of the
application layer section: 'can by used' should be 'can be used'.

The same typo was fixed for the networking and V4L2 sections by
commit b114ef1efc49 ("staging: most: fix typos in driver_usage.txt"),
but this third occurrence was missed.

Signed-off-by: Wang Yibo <szwyb123@gmail.com>
---
v2:
 - Fix the author name in From: and Signed-off-by: (use the full name
   instead of the nickname), as requested by the patch bot.  The diff
   itself is unchanged.
 drivers/staging/most/Documentation/driver_usage.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/Documentation/driver_usage.txt b/drivers/staging/most/Documentation/driver_usage.txt
index f1b6977f4543..32a2e5ecb48b 100644
--- a/drivers/staging/most/Documentation/driver_usage.txt
+++ b/drivers/staging/most/Documentation/driver_usage.txt
@@ -109,7 +109,7 @@ following components are available
 	   driver via the V4L subsystem.
 
 	4) Advanced Linux Sound Architecture (ALSA)
-	   Standard sound applications (e.g. aplay, arecord, audacity) can by
+	   Standard sound applications (e.g. aplay, arecord, audacity) can be
 	   used to access the driver via the ALSA subsystem.
 
 
-- 
2.25.1

