Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED29849EC7F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 12:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611701; cv=none; b=cI3miMjzg1fPvbJanDTEmf9peHVWorIJ36U9QGEXZkSXtpnx3t6nB3N9Eg4K5IyLeHeyXzCJykTpnGetj5eDlnFN4LD3jgcD7YUFXu29MFoM5gv4K8/phi+NrcFiFppbmRSNyUHa9IfUUU6S8XCIJ+EvpY337IUPhElf0KQARoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611701; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=noOtzqAGgEneCWVssvigoY+1kaRs1kla/iqX51C/pv1wi240pgEltXcrsQCaDTQjMvcs3Zjjjfn/WHKpkYi+30IQQ/+RDIj3Vx5hcTjo2mjuCKxjSb9leJlgNW78vJHjUMvQuNTtXRWb7R6fxNazCRr7RPyRfabcsOLyos0pCh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtbnSs8q; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtbnSs8q"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so1728174a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611696; x=1789216496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=YtbnSs8qfPdzgH+oeRaodn+q8Vb2tox19c9H6lxT0EFKc+LY1/TEPedO12k3EV0weq
         ZubHW2aMvu5d9wRdvZ2JZKz7OYJGt9lSYnONx4iIPgTgklB3Zi9nQUeDscBHQNI2nipN
         8PAydIGehlYBeD+FYQjwg6pUJGFz8Zv+UkkQ3/NrLop+gj8ozrTjmwWo2IbPI+M0RoI2
         BN+5/uzNIMcpl8wO3T4RqLVBYURIS6zQbCgT+MIiipkpQV3o9deat8Ivesk3Ege7KHGV
         agTdBI1D8e/AHP9rHdTaJMom7wYS+xvDGlXRUX3Io89bY3cqjDkY4ewjOrVt3ANdSDC6
         BPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611696; x=1789216496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=RgHoTwn1cyo2R1h00jyH+Feh49icvDPIFlhJlKxuMGbpmzSZJAlQWoY4YuIvl7boAF
         INqJSHHJnpT7evwTEYqyXpNKmntzkogy96iQil3ps3JwORa4qkqKAQYOKqcEv9uw5x62
         U+v/pAlzF8diZq1Pw6tNXLmQF59/gB4y8Sv/7vFbhqgW89OU7LrY8udkJTJAm8IZRjXy
         1+sRwXmJaL6aGQuHDjn/XddDvHQHNuC0/I+CEq9pvt+d1cxSGTbLVCgClRpF5+3EkmOb
         itdNgQdn2SIS6bsovbXrs/SLLF2jTWQzJt/i1Hd7Ldz6u2YGyAUXf8FlfHryIlbFKnqq
         CQzQ==
X-Forwarded-Encrypted: i=1; AKwUvByB14g3e9JgJoXd+8vdOAT4LNM51FLT4ZtUCrC3bXkzaJMAVmA+tTmH/VsIgeV0BN9m+tFCr38EmP2HMKY=@vger.kernel.org
X-Gm-Message-State: AFuF++neUN7KAuXHt721yp+6vDPyYaAxwJ813319OvNwbY3GLwHAk/iJ
	zg2akYFYPgYKIfC/SCh6/W6agzY1DPdMrDAWclUyEdLwSDKGkP8VCrkO
X-Gm-Gg: AYBFou0dAAWw9jPieS15NRZgG9WX7RklRJw+OVHHrUpXt6fMA+rXZaGg02mb/q8hO/x
	gZzx2oudWF5DaUlvgfOe51Td3HVg0FQN80v8CpTgrMNurySVZ5UOrUo7gb1+0WkkS7upXJMtJY1
	gEvJGwLCDOnzmKGBMbe5QBorErGzeRXjTtmOImDM9QA6WchmUAJ1ufX7LdfJv81Vjr3JqV2COsQ
	cykL/xjtTkxiblin4jGTFiLrKJymVPoS4KA929puafAMoj5msgHMcMz51K7aG6NWxQKgYk7HtVm
	o0Co+2klWNNA5Gh+u2HxP3uDjcLpDWW/WBJf2FFNb2T0Byl/OfHMrhjrdc52Xe6DTarqsv0uU24
	bRpPAvwKE9V1CDYS1CNHqHzWBcnTShiCJfoSSyorEldbaZI5jojjlwEKwztQXpqjhxqErupt/sT
	7BhPA6ocmDozuS+YAXYN0leIf1Ar8HBseRnLFIG9G8rnTbGZSUw16GsRjeQKmTZzRl3SRzmAro1
	asrXdwLPSv2yDsqY+EDXK/crnwUyJoa
X-Received: by 2002:a17:90b:5905:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39b262133ccmr17366120a91.18.1788611696373;
        Sat, 05 Sep 2026 05:34:56 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm13829815eec.27.2026.09.05.05.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:34:55 -0700 (PDT)
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
Subject: [PATCH v6 1/4] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 09:34:47 -0300
Message-ID: <20260905123450.5620-1-breno3011alves@gmail.com>
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

