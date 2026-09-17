Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0CE447813
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789627667; cv=none; b=DipfWrprKMa2daBE/anXgdFphK0GgJmN1BVZ3dZMtGQSuYNkMLI8Xp1DYuMYgNPt++zmyC4Z+HUWaPJWfz97UcSI402lovldoN720igQb9nAdtnXcgC/4sLv15Ab/LD8t9Y8iKGAPmOLl6EuOb2M/VMO6xGeshz9EB6TEMTBYyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789627667; c=relaxed/simple;
	bh=3AdI/BQYPg6y23Mk+YkLKGWL7iI3glitB+qiS7zTldk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pKKQkb+QnplKvqdD4w9tyAQ7c3ECj6UrH5Szjkud2tCuhaz6jDMc5nWcF8gG768RjSntK9K1w1VTZEk8fKA1+a6p7Lypao2bxFPt7vijN8E8mZTLKp2AH33z3JuRPKJSHFp1Wbf/cr4dFEwElHK8S7z2BW5xCv3sBdqe2nJirIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTD4+RoM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTD4+RoM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so2190335e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789627664; x=1790232464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y3wbvAbBWnutdIwHnF3F6m/7uEF6jqU2B+avYv0omNg=;
        b=OTD4+RoM5uTERP3mOlPQntz1c/c6k9oR7kAwKmVnnSEeUVZh0AXJ7rR2JE3mw7v5Ts
         JksLeD1O37XZWAITYjFxSdcfSWknGG9MV2xnWMsdtDg/P4fwM6adS/y5LETFkn31gLAc
         kFGkB8OpXiTo70mDlI+DWVUAeshK5lUC9zIrjHszqLM+HL7ogoFk2fjqpKsdAMDBClKu
         ThjsBWFcpI4P4RwdfE1NxpRJG1nnA88KCIdoz3HXf+6zktfMyQbnZPiaoePBk2M3tDkg
         wCKaFdZmpIEwtn48SLfezt30nJQIE/l3/ETu9I+IslMkRl8+2g17ZhgRBWRNTAFwAe4x
         tWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789627664; x=1790232464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3wbvAbBWnutdIwHnF3F6m/7uEF6jqU2B+avYv0omNg=;
        b=olrHodUFeEmz1GJ5FMiJT+Q9+GXdW0XNiWB5gN/Q7xnCe3zBKM1HVZ2VxuJFHouJBW
         zjKyB4wQTMA+TGh/xbnC6So7dIoMVBnFbm+otGGtCcpMbNg89gDYwxiVcBsZKm/kdLUs
         jx3BQlne4WGV/vKi8AvIbEPLk1cOmtCRjMh8WFD10TJc9QZ5XTBrVdIQIvJzsxNGK+py
         biU1XrMlAG9F1Nd5ayBMiu5xez8QMpG47/6sLYWlIQPf0krFj7DhBdriHLPc2ghT5MTb
         TWnbyMTVjbLNqXvi+pwPW3qNs/DHAf4WA32QicNI0EcYk9JMUUK9UBDYOIQlzUmjfWa2
         /ceg==
X-Forwarded-Encrypted: i=1; AKwUvBzFp6ro1POXUfUV81OW7oc6H3v5Hy+JLoQTBWnuDxGHuNGtC635MYvKwbGDaY4UzlYvhL3WDEk2Sj2rcdc=@vger.kernel.org
X-Gm-Message-State: AFuF++nYGylFRVuGWKV61LZ/o46nwzrPMs1mHQRTuiHHFmXC7IgF56w9
	fw1BtwRgc6lTFwVJM1b6WospqpIJttFMkK81PtK+jdxAzCJM5B68chNO
X-Gm-Gg: AYBFou0zvfi5v9f7afaDhzOT3V5RA43eIjCfaaS2DQRcY5GIjyhatvWRVT3IFN55d4E
	OE3fJbnaurHfDSEfZq5jF2LmML9J5vW55zYoihks3Bs+By/iolXEuJEknJhebCLEdDVtZ0HMWo8
	y48lffE//KcTrgRrHAjwOt7apDvsO7cBXOQLhk3a6Y/tRPUsHDvvOqazdjUY97SK2iwRxivwAtY
	Yy6ewYq3PWyFR9EE6zSZqoeEpcvrS2fLEuxKsYpJ8UOeNUB4+aVjFhyMknUab3E+guBkZhx+mZ2
	AgdpWANfygSlhqtlDCfmarAz7KmgW7xl1Dc1M3FNp+OHrctzxrB5Q4Oh0Yc5u43xlLS5RhbUuba
	pJvdtxjyVI64x9z8IURfHD4oL0u3iuEmHzOHZgSVHIZb7b8M1x4NXxv6kX53Kdz4zhuGP/mNIy4
	IA4gYPctbJDrhVm9AkmCLaZN6ihYdLSM3s9yxKA6mdX4a5pBa8XuEdm4CJBfLat3LmWduCdkPFD
	xwRI21VJJMpRdSMmF9Olcx7DOPRAP4lRS8iY2V7BsJIown5cUfDiMxTqWwIhyV5XzHhJpOtV+0N
	UaOWk6Z2zO94sZliSfRs9cBsA1BoycMKqn396p8NK4uf5jQDrOP4y3z4Ral/rExSTcUu2iFvgEQ
	W
X-Received: by 2002:a05:600c:8b17:b0:49c:fa20:cc0a with SMTP id 5b1f17b1804b1-49eb7339522mr57916485e9.33.1789627663778;
        Wed, 16 Sep 2026 23:47:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9dc6-c001-54ee-4741-4927-0a28.310.pool.telefonica.de. [2a02:3100:9dc6:c001:54ee:4741:4927:a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf438fbsm13129266f8f.36.2026.09.16.23.47.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Sep 2026 23:47:43 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: microchip: vcap: Stop selecting DEBUG_FS for KUnit tests
Date: Thu, 17 Sep 2026 08:47:36 +0200
Message-Id: <20260917064736.77354-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VCAP_KUNIT_TEST enables DEBUG_FS even when the kernel configuration
leaves it disabled. Remove the selection, following the dependency rule
in Documentation/dev-tools/kunit/style.rst.

The debugfs implementation and its tests are already built only with
DEBUG_FS. The other VCAP tests can run without it.

Fixes: 552b7d131aa0 ("net: microchip: sparx5: Add VCAP debugfs KUNIT test")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Validation on net c9151088f167: x86_64 LLVM builds and QEMU runs
with DEBUG_FS disabled and enabled. The other VCAP suites pass in both
configurations. The debugfs suite is present only with DEBUG_FS=y and
all four cases pass.

 drivers/net/ethernet/microchip/vcap/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/vcap/Kconfig b/drivers/net/ethernet/microchip/vcap/Kconfig
index 97f43fd4473f..1af30a358a15 100644
--- a/drivers/net/ethernet/microchip/vcap/Kconfig
+++ b/drivers/net/ethernet/microchip/vcap/Kconfig
@@ -40,7 +40,6 @@ config VCAP_KUNIT_TEST
 	bool "KUnit test for VCAP library" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	depends on KUNIT=y && VCAP=y && y
-	select DEBUG_FS
 	default KUNIT_ALL_TESTS
 	help
 	  This builds unit tests for the VCAP library.

base-commit: c9151088f1674fd29ff26a20f5fc687acf53a2f0
