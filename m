Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399645;
	b=B+hjiptEZHw7mTKX67VsV+4IoEsLblZc5j2iAvQE8Y1Ar6hdjj7HL50i3ixID2qvB6ln
	 FioA/ShSLxirp9GPAPCTUEwVH3kYG3/ktHeVlhYUAq2oa+r7/GHHoA/SEcvzRMMGbpbPJ
	 oXMUM9EP5EMBevwzPOhSDpnOIIwdzJIfjM4Tr0QMNzFG2gwYUsOCXlrK4/neISgl6RhZj
	 BMziQtl6ibHTL3Zwfk3oqsgIXl9w/ZkJnkMH2fU5Nmwf32grUY+Jx7lCI6u4QUTOUE6MG
	 Eg45OubEo4vLB/+8TMF4wxoAzKvetjr2ROEv4mreAjVYGVtavJW2Q4/PAvQeuwjNHfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lY0pxtvUJ1KUjGauum4/uEvThtLNCFkzMFjgO1TNNk8=;
	b=0b/PhpIIJYrvYCyjaEXpaWpRp5gOCLrwvNiKPvjpJWPsJ6gf8dJCa+gRoa5mI60Hpmxr
	 POwO4Q0JfPQWMg6eba+mjziG57y6hyEv0YsHGF3z4+Vbahb3qguve/aBbGdI/BUc32gOJ
	 GSHM1kGxfzs0EpauV+ckyYrkIOrWNcdVv0MfdVsLuWF7TqSDmzfjXf5LR1OFxIyvHHpRD
	 OOpzU2BPp8uk9fpU3F704Mc5JMSUW9NGRCuDfCEdS5zUXeXuVy5Uc5frGTO4wCCGhOkdQ
	 ykYR9XiIgx4IgwUQtWLdHkfEL3yK4vAJ+uMPcAxVpLDb6jovIdeyGRQzZ2IMM3YZisw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=ks0n9IAX;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97555606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97555606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=ks0n9IAX
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1130495c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1793399642; x=1794004442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lY0pxtvUJ1KUjGauum4/uEvThtLNCFkzMFjgO1TNNk8=;
        b=ks0n9IAXQP3S3rjG3PAgDsFVr97FmjNg9DraM05Pjcy+ulerKNygO5f5hE3chUQ05o
         0ReQBzlptibciyO+kItXs0+6HEOgYl53XvLodZbyVGBxhhllyQ6bFiqZlnRBQxgs2JIU
         uNLNYvRS5z81m1T4yAvdCjjzPKdO8uDvEE7mI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399642; x=1794004442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lY0pxtvUJ1KUjGauum4/uEvThtLNCFkzMFjgO1TNNk8=;
        b=BWz1jfRPnjUUVFLsq7iPHXFRzDRM5bOdnxv6pRTx06dsnWZk4zPIPJjQZ6JKZ/bgX6
         4Z+l43HdX4l1wxNDJtTk2KB98kwEewzeJ5tTVDmokCGRAH+dkrIuUJw6Y0ut30uWlANP
         lm7Ev9FKK2l5WHosupy0G09M7fp03DTvbODD6gVQFLqUtZ/puojDo+LWonaJqhylCpvf
         ihAZqeYggc8qHlSXnsDiinnQZ+briofkyPRbID1mbr43/E3ddr2VgH7FY5ubxq3anu3Q
         wXZuXWbiacS4Hi/307eXVUkY1JkrczoTbMUMUFipNzg0NG1XS81xCGvcqfiI472d/mSV
         Aveg==
X-Forwarded-Encrypted: i=1; AKwUvBxahmrcgykzOWwAdDvY/meGJnY74YXeGF6ACNDqLYgZ90pstof/AHZwwvc3egnEmfufW5Ig4m0Q6gY/ztU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAxFSBvHul61dSE2Hoi2Z/3mUsE1F2R0ekfp2TbngZnCfQ/sM0
	/p3fR9vOzHvua9aHTqT96oNNqAAsxw/OSLt8/dxnOg8b2m0W12faJ1urDulXtD0S15YDXxn1gww
	6Fuw+
X-Gm-Gg: AYBFou1heKCB9gAM4MKZ1Orwk08DaSotrEmowsAMo0ZxJnlgO6LaYrunMQfbIaK1q9W
	bb1fJMWip0JSL30uCZ90WKhqfevtNAqwQPJeBlQ/CLJcW/AgY6QPTO5l5aF9SA1/em2dIhywN3c
	mhO3HpA9eMWSjQs2Vvxfb6/4KUeIsjWnLdpSWIYBSmW8VO7BnT84levPjlNw5ugh05z1uyc+6bI
	qMAl2wPyqYBLUgviemxc0P+F56OLvbkr5zfVfwVAnXbyhV3NGcRQFGiT4YKS5vbryHcm3aXEcsq
	tTk2xWqGl8m3+uTtwJpG5aPcIShWKzcSrtbGUGP7j+pMQ2jEHKIrmHu3V1J9qoEkMAIvl2Lja2e
	BrykS8Ucl+D+kLmfApGZQC0WXP0+o9z8TWuEhSW2GfCDJtdxeai2RNb46RhMsCWHCBkDwuFa2DC
	X6AqhvhceQNqt3pakZ92X0invNulFtnI3DZQdeLR/4yArEBvSkkdHWmHpx3G19iY1+km75FVZzR
	GU56abWgpn6AyIDP9ZWnpVKQSPw6xDpy1kfoH5cy9W9FjqCp0Rk2nQoOM1bzbir4ZFdVZO2FFTS
	JKyGblMdTgY9ex/Zd4AgfVi94Yjw777uSRQLNNrn6Sgh0nYbKRyBrRZmNg2+PM+Fl7hmxXFMmuy
	N5LGcKYy7zIlsagXC
X-Received: by 2002:a05:701b:2816:b0:182:94d7:f76a with SMTP id a92af1059eb24-1ac6088a34bmr4779354c88.43.1793399642429;
        Fri, 30 Oct 2026 15:34:02 -0700 (PDT)
Received: from shiro (p1795186-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.207.151.186])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1ac192c2e9dsm12324147c88.9.2026.10.30.15.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:34:01 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: andi.shyti@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] i2c-powermac: Silence modalias failure message on G5 powermacs
Date: Sat, 31 Oct 2026 07:33:18 +0900
Message-ID: <20261030223318.1140883-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

G5 powermacs, and maybe others, have i2c nodes that have no compatible
and cause i2c_powermac_get_type() to print a warning like:

i2c i2c-3: i2c-powermac: modalias failure on /u3@0,f8000000/i2c@f8001000/cereal@1c0

The point of i2c_powermac_get_type() seems to be to override the modalias
that comes from the compatible so that normal i2c device drivers do not
bind to devices that are managed by other mac specific drivers (like the fan
control ones).

Since a device with no compatible shouldn't bind to any normal device the
warning doesn't need to be printed.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/i2c/busses/i2c-powermac.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index f99a2cc721a8..b37cf5b4ab10 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -299,6 +299,18 @@ static bool i2c_powermac_get_type(struct i2c_adapter *adap,
 		}
 	}
 
+	/*
+	 * Some Apple device trees have i2c nodes with no compatible that can be
+	 * ignored. Without this the cereal node on G5 macs prints the modalias
+	 * warning below on every boot.
+	 */
+	if (!of_property_present(node, "compatible")) {
+		dev_dbg(&adap->dev,
+			"i2c-powermac: no compatible property on %pOF, skipping\n",
+			node);
+		return false;
+	}
+
 	dev_err(&adap->dev, "i2c-powermac: modalias failure on %pOF\n", node);
 	return false;
 }
-- 
2.55.0

