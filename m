Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E74A359A90
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 13:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613776; cv=none; b=VW88XfDSgR0l/AohCS2YRU40/5KKx9RhoEp2nVmqpHtvaVSc1O86FMyycMDoLafoc0B+no/ni81JbKzpq3gN0LXUyURTokMZ+lHF8PUlu090Md3nfgNCnOQOP4Q5gM/4SFVS6MquOzqqPmVywCqcOqSR5crul2d7tNToQ2no3CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613776; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FigqNdIBBbXKgWykQzt8Wq3pJbiP7ARVhUObUakjZrhV0J4CNbyIJ0EPVuZUQlhvIsf36Bwcb/BxB3EqCmzH0bJ4tiFWPfyFAXCvWpPAnggNyKzidR/pBMSsGnAhocikmIpdj8K6GaeKgzU3mCRUOZY26uLcqQUXUnTbOLxwBjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFmFRufW; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFmFRufW"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-97ea7f0d417so586549241.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 06:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788613773; x=1789218573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=IFmFRufWLG0nOelfApNAMYBwtNqPS5XbX6iUCs567RT7YFVK1mBje84aIG564HG/P+
         cqHPTtZRGv7gomM/WpPNbdm23lL3RGugWACjN6+YfjDO81+/nXu1KtSWGjVUkDNh7AfE
         yepfrBT+xkK7IwcDNyygSGqVt+Q5B3ue4I7QLXaBaCbzNM9T5qES6NHiV0Mu8EReRdD5
         Ah+rAKxOAdJ1NYQiaz7c2kSX+3ATsIc2AVK6n5nAOZJgwDUa02Wi3tBamQ3p6flRZH42
         1jK87qFDvjYdyY0WIw4RVZcgFMEgFZgv5WinpQcXCLT4BI42K6tfxbYALSuZ9q/94kCB
         /4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788613773; x=1789218573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=SeIL9zMIfkdGhUExUACo/VJVHZcUtEVdRX3kDv7AXyuOzdx892kt9vdxvg/Zq98Phj
         MMwHT5z+DKS7qI3lAVmoK6x9immVJtaQ5cwbjDEdirY5hEocdrUmXIm8veuiDunmaBFW
         k7t1WYXaxky0kgOw5Zi5RzB4HSvVl3Osq2toROzSsbRU1RTgcALccAiIFhUNMze22Awz
         iAe04vm7AsCMJuxNMb2fG3WELOCJA6L4OoNKjU4kLEPR67A9PcCV8HKq3GsdWz+mQ1+V
         wLa7qlI3XQfNm4nOh1Oeh85s0ETK+MXEHgXZ7Q6YL0zo711+8IAtd8U7rV3BZmkRVyNv
         Sv1w==
X-Forwarded-Encrypted: i=1; AKwUvBxN0tUiBPQ+NzpFkpu2dZxiFv98OUu+rBI5HvD923QvCjQ0WddxcRf3hxQvP2fBJNPUMBv2tmgrpTE4310=@vger.kernel.org
X-Gm-Message-State: AFuF++lFTfWDk0qrb8Rn6RNoQ7oVl6xEb0APGdnVmnasSPg/0TTQTuEp
	PvnrmfHOyNGmd+FYPmYgp8POG9AxOP2FNbqUJimAwWf/lYKNBs5bcp4b
X-Gm-Gg: AYBFou3iF2/FmXF+MYCbpxUn5vrqEChlIqHtXZBKvE3pbzDhuSvqZvTIiawaLw8u+md
	Y17lE1ORgputsNram1oaVLQRhs4e8yOPD/PRDtCcvuq7qtzByJfUVRDgUsNLXgCTN/cTdttH27/
	NNWdkZmMuNhqpCnV2UNLM0REDG5YrPQxOQDys5oRMVGOhlg88YPItwBR71ll391fWoidQ36R8f+
	b3Yc1O0a2YHQ+Vq4nbsTf6af5XifD6yd1ayxxEMpUtTufhLUBbnYdA9kxietD33KMNjpZTREQXw
	tig9ldlPxRcMbLLmG1EHh70JRodLG4S6DlSUvR57iaK0KGl7/HRcNRl0vb8r3aLWbxe1q7cvOLi
	xGQ7WR2UONU9gf73ZY4Cz4ikTSQhZSBRMHEs8U4CLwi0zpbXwYqN0ufCp+F9aUWL/dNr3hfNAYz
	Cdh8BqaSEOW4XxHcdT3EFlmDzGQau1T43j5Ky3TwSTFMfYBsfpYt4gZs2rcOSaGyxAHfYBeKmNW
	itpw+lg3hevUNmx6c3j+V76knmSnYfTtuqS32vt+6c=
X-Received: by 2002:a05:6102:8098:b0:783:79ac:9dc3 with SMTP id ada2fe7eead31-78a4a880ccdmr3889707137.10.1788613773006;
        Sat, 05 Sep 2026 06:09:33 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76487sm3719782137.5.2026.09.05.06.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:09:32 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v9 1/3] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 10:09:23 -0300
Message-ID: <20260905130925.7115-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a copy-paste typo in the MediaTek interconnect Makefile that
mapped mt8196.o to CONFIG_INTERCONNECT_MTK_MT8195 instead of MT8196.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/interconnect/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 6bd656668..64170ab16 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,4 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
-obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8196) += mt8196.o
-- 
2.43.0

