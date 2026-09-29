Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A60951AECC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683448; cv=none; b=tniUATn2+oqmkNcyFXJcJ5AqoSJ61+bh04mZb1wR9Bg3xFJyLHbI7q6sYrYBWlM4Ae5m3RB9iPEJKKGIA/jWY8z+QM06v2X/7EU54cJQv48nnHVaudRRjcViU7Y5eZDFD4XCrR7GhcPqJjpv9Lx354iPNjEKFMsa4aYMLcfbUNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683448; c=relaxed/simple;
	bh=CAOqvt2/eZ53OlhurfSmnHSmFP9lsKwEDk2dEwHxoBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CNtSIfHvUNU2x9o1o85mp1Yqfnh8kWcqv+JmE40feAg5X/T6aVlP93cmzyOzYpsf7xs1f04V1JYDaDFjfKD+DaZfjOR9EtoaEaIiAkq5jgC6SNy79P5UWuY0bIJC5ZMwV+brOHIjfWslOeSkVZCF/J3FtyNKxCYsWWuO8WCpLUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f61QIZcs; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MxM8oEYi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f61QIZcs";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MxM8oEYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790683442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9cJgdJ7LhmXl6+yqSKNaV6ms6joh7PI+1Jj005bKoCM=;
	b=f61QIZcsUSZLiy33rbRyw2BRIIRK+uoX50BPzbAqExVn7wDVYbKnO5tgCDuh4n3oNstC9t
	2imB2cmGNPuQmVDr0Yq+DZo8WPxRpGFoqr14NoABQTJ8b12lmnJ5IpHRpboaSmhKgFQhE1
	VpkRri4O2IasWrQV0wvwYJkIL2oG/tw=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-SABc_V0uPSCPIdJPyIdsjw-1; Tue, 29 Sep 2026 08:04:01 -0400
X-MC-Unique: SABc_V0uPSCPIdJPyIdsjw-1
X-Mimecast-MFC-AGG-ID: SABc_V0uPSCPIdJPyIdsjw_1790683441
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c8337b12d0so1260615e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790683441; x=1791288241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9cJgdJ7LhmXl6+yqSKNaV6ms6joh7PI+1Jj005bKoCM=;
        b=MxM8oEYiEBW+yEdTtCw+j8CicLXu64yEG1jQEMAbo/OsUAtYFFqoNk0m8JR1mLOnIf
         n3rX3DXZWgPmFCmscY+1Xxvxxd7CEqYGblknqpDC124Q01ZOVP/u3xWkjojQ9YQurv6P
         gR3vme8zrjdgZHCveHh0YZ8yRmmEYLUTHFe/0v5Xa5MbK8TzbKxDNXW/ELGJiuBUJoFt
         v8xd5Qpq9JmxTXAiEvOrUXKsFEBi9GcRDpVpj4qlhwB8h1FGhNnBdVnQN84z3fWgEJvc
         T/e/7Yeg2Lld96TbQqZeiJSUeLiXdWvYo2q2O5iZJM063aC26Os6OHfS2Y51qUwWCYSk
         gzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683441; x=1791288241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cJgdJ7LhmXl6+yqSKNaV6ms6joh7PI+1Jj005bKoCM=;
        b=GXpasu22OryuwJhHFiyOo5KmeF1mHpA4EQa5tHY3fn/eOKuK/eVaWa6KJjbTV/DFt8
         vkBqDpLKTjHXX1TphGjWmmri3fUAkw0NG0zDUDCIRSV6K+AytQL2x5gEVsQwPlpgEHmO
         ZD+7JjGw8qnmm+2O4dKevnfWgOBSqW7BuRfVKYZiUZT2IymMEAVwmtVaFEnH0bjOJmSF
         LKIN3835ZMZt5zk7qXH8yc4faxKWby0gzF2aPsH0r/ss9lC9IE8hinRll71jYK2AfK2k
         NJIhbwsJgDc2oWfcft/e/q7IPCugKCvgd4Li02KGoBFPcrrwkEWuE8w711aQVrZS8NGi
         7eSw==
X-Forwarded-Encrypted: i=1; AKwUvBya9fXj+6xOBrSHbbbwIgMw8h9hgWV8DTIoQvqWgKpQhI15WRow0HlQ7UZtbHvyr40L9gUKi1hHIchtMeY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP81U1DBm/joHSBSNHRvgTC/RnMdJb6B3AcTML0/+hvCqXeEZZ
	coagYVfsW7wI8NhGVoutrIzD/QnIn5R7SoaIw6HooY3hC08w2trre5ZB7oJMXYB4lLhWWEnMyez
	vUNzUY14GI3EDq2fm+uR5RmqnPlz9tS/LOJRAllai9wAJPyzvyaEI/LExlElVhjIphQ==
X-Gm-Gg: AYBFou2meElfgYNNHwGGLQBj9olepkqDPcIAATMUAvQSC/2qvBVU9yVzM0WDJUMoC++
	rZjORLSUZKv6xM8+D3rtPfze67OQ70AWeDdN9K+DxyG8EY3cZy3RKeRkDdF1Ie6jD2W0L7Jc8lQ
	GqkJALnLtAS5ULkA2X5QgOVmEfeTikYR3eYZWbObUyr+rrhMKFOkruXtUVSxRZkN7FdjJpaxbiT
	HoekwtcQWrl742BJffk+p4X2JK6zpYgz//1UtT1FoogsPkM5E5fb/7QPIX+3SGcwwKoPyWTazq/
	GJVN8YU2b2DgEly2pn+UwTwqT+e+ENbS+KBNHPPz6Cq9u0TVmMD9rQ==
X-Received: by 2002:a05:6122:1d06:b0:5c9:a610:cecf with SMTP id 71dfb90a1353d-5cb0c14ae0fmr6920973e0c.22.1790683440558;
        Tue, 29 Sep 2026 05:04:00 -0700 (PDT)
X-Received: by 2002:a05:6122:1d06:b0:5c9:a610:cecf with SMTP id 71dfb90a1353d-5cb0c14ae0fmr6920964e0c.22.1790683440083;
        Tue, 29 Sep 2026 05:04:00 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde4f99222sm12410835e0c.4.2026.09.29.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:03:59 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Berringer <jberring@redhat.com>,
	Vincent Legoll <legoll@online.fr>
Subject: [PATCH v2] riscv: dts: spacemit: set console baud rate on OrangePi RV2
Date: Tue, 29 Sep 2026 08:02:27 -0400
Message-ID: <20260929120227.1791356-1-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the baud rate to 115200, matching what is used by U-Boot on this
platform so that the console is usable even when console options are not
specified in cmdline.

Fixes: bab8dea259100 ("riscv: dts: spacemit: Add OrangePi RV2 board device tree")
Tested-by: Vincent Legoll <legoll@online.fr>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
Changes in v2:
- Collect tags
- Rebase onto spacemit/dt-for-next

Link to v1: https://lore.kernel.org/spacemit/20260520111150.3300707-1-jberring@redhat.com/
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 0cf60d1985604..d8b2cace4e7a3 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -25,7 +25,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {

base-commit: 4947ee60bf48caddf5caefc08dbbc84d09fbbc6b
-- 
2.55.0

