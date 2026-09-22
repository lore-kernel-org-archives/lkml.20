Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8DF47D46C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110816; cv=none; b=tSdsfzpupjziqP75wg9yYtiPRry5h+mlQu7aOiYt8LTn06CbKhbt/RAaFcDk2/z2b6390Q0xa1weIR3+N7l6+tsYsHxI+2hU+2ZAperGy6phvnaDfFmcfaqo25uVl29U8WzrKYWT15MHO2Ys90RKGPLqD1YvynjJ1wP2p4TEj6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110816; c=relaxed/simple;
	bh=EfkQyGvJKcJIlERuYYl99LlLoocWM/vzIQceRWFC7Tc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qVscR/JUxceaVEizAJvFSW310zgSg7GmW306eIE3prvOKOwmcL4FBA6qP2i47XhlnM4hdGNf7W0XTBpOJp6xrvbp24SCwy0KvttiP5woTwyJ275fa0f+wFeCdcQW6YCYG0572ZyodXKyT8fj2HP8S495Os5/jVfO8z4B8Q/3hhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nteFhT8i; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nteFhT8i"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-3396cec93b6so250139eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790110800; x=1790715600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Td911GW/RuVeylqJZh+mg3PMQ4kx9/FZxzP7fXWcQL4=;
        b=nteFhT8ikcT8uSOS6GhxMTKGk78Sm+wmngeuLT/gn2Qi3ZAOQXE5U4npEcmw/oRHk2
         I2etmKeTLIZAlwav2Rc2QKnW5axSvVA90LyTuQBpwd1B2njIN3SnrliKTjXh2HkFmkSs
         MWvK+gxVAX0Qb2HHD1v8m8wDg+xgCx/GI27kI1VKiaAsNJqtFRpNZXxoOXUdmU4s4uZ+
         Nh4SZxk/Rh6fuDg5uU3tkA5G8DMIwwNH01i8fo+fRY/F5rseAYxp5D3nOPS+Me47GJHS
         3ebOQzRuYKzYHnR/2Nx+LLlUKsThFci3VTowY3ys+ATRPIniA8cQDK1mpUwFs5/tbWHs
         +ghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790110800; x=1790715600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Td911GW/RuVeylqJZh+mg3PMQ4kx9/FZxzP7fXWcQL4=;
        b=PmfXsUCwkqrV81hiGnUCNXHah091RZ0clrzezmrXjkMZs9XW9SY8oogmBj+h2+uGe6
         odMtcifdZOwTqyp28RLtFcEm5ZMcGQRNJwzlufSK+1I5lPJZwmNHrcZyIvgLz2UyVzaV
         ILfbTXWL7K3VI0Kp2ziVytn7qgux6x1uRhmF5e3tztFybL73DczmbZbdEXd4kiwvTXcS
         pbmVzp+z0hJya/XFPc/HZPVMrq0lKCJ37isbimQefLhPYhYQ7eaN7XNrN/4/i0XSVcFQ
         iYNj//hPEX3szCdqOTdbl5li8PTUCUIzSZyHLWQZHJx1lWFSkcfhGm6vHR7rkj29tJEd
         fwwA==
X-Forwarded-Encrypted: i=1; AKwUvByCyjx7prREMOvGFUB9MfmokLg+2hOuyigYSLv4O1LSiIUFV26B2GT/GfPFSMwmVGuFBjVweQj7yCq0hXs=@vger.kernel.org
X-Gm-Message-State: AFuF++nJSZy8dtXvy9aoFgxk2JDeoakcpqfDv6/WFbQlmmiNp18wYdpU
	r8n5xRahYozID+0nqCNHQbPcgPQZVdcBYnd/78cxPLDsm+VXXAI/dPyF
X-Gm-Gg: AYBFou35AVBW3D7izHM055pVjsO93wb11ozxmIs6apOiM0Py7JHozV6H+NFyWPEAe+j
	wWhyrQ/VfdTmsbxPbi+V4TZW/k8aM80D2PqtREiOxCWrVFd2a75rWHJxGCBAZom/sem7ony16ou
	wTKYiYz/t3FfUj6ZhiPBmRoMzlxXGow8yGMankWTpDltCZd5gONCSKNIyMdGJ6WxxuZ9levy6HX
	hfuXOgFSphyW/w9vVIi8KU0T68R31DDakRhmNx66nOYLbcpJg94O/cxUVcK6jyfGx6Ad77MezkJ
	uMb/6ViSll2WWBQcfUmhIBm1gtfiaXhol2OI/PocqVh90Fm+N3W2daaYyPIzkOaamMfX0e8YZqJ
	bETsUPBh4HaxiSTe76C7+ojnxWF40Uk6H1jXmEunk7WXQHEfWTcHrq9X45Qv5OnpIjSIJJlHY26
	ieI4OblG0K3hl3URCENTLsGr7/XfZLYFZRRnDwCKafiyVJWPhcCcA+xawBp1YKdYo9oBMikSIrE
	Krw/OkobDPnKDJmd37Tn8fqHsGXjSkHHld0ev6nl/x+2jgouS6lzfuPVkk9A2PKVJP5cao7OG0=
X-Received: by 2002:a05:7300:ce09:b0:33c:1dab:89ba with SMTP id 5a478bee46e88-33e8e0b95f7mr439345eec.36.1790110799660;
        Tue, 22 Sep 2026 13:59:59 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:f16e:2102:25ad:9cdb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm760952eec.25.2026.09.22.13.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:59:59 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v8 2/3] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Wed, 23 Sep 2026 02:29:23 +0530
Message-Id: <20260922205924.32173-3-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922205924.32173-1-hemendranaik@gmail.com>
References: <20260922205924.32173-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tc-testing case 83c0: build a TBF + fq_pie hierarchy on $DUMMY, push
traffic through it with ping, and verify that 'tc -s class show' reports
an fq_pie class.

The per-flow counters themselves (prob, delay, deficit) are printed with
the companion iproute2 change, "tc: fq_pie: add support for printing
per-flow PIE statistics"

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
index 229fe1bf4a90..15b2667285eb 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
@@ -40,5 +40,32 @@
         "matchPattern": "qdisc fq_pie 1: root refcnt [0-9]+ limit 1p",
         "matchCount": "1",
         "teardown": ["$TC qdisc del dev $DEV1 handle 1: root"]
+    },
+    {
+        "id": "83c0",
+        "name": "FQ-PIE class stats accessible via tc class show",
+        "category": [
+            "qdisc",
+            "fq_pie"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$IP link set dev $DUMMY up || true",
+            "$IP addr add 10.10.11.10/24 dev $DUMMY || true",
+            "$TC qdisc add dev $DUMMY root handle 1: tbf rate 8bit burst 100b latency 100ms",
+            "$TC qdisc add dev $DUMMY parent 1:1 handle 2: fq_pie limit 100 flows 1",
+            "ping -c 50 -i 0.001 -W 0.01 -s 56 10.10.11.11 -I $DUMMY > /dev/null 2>&1 || true"
+        ],
+        "cmdUnderTest": "$TC -s class show dev $DUMMY",
+        "expExitCode": "0",
+        "verifyCmd": "$TC -s class show dev $DUMMY",
+        "matchPattern": "class fq_pie 2:[0-9]+ .*prob .*delay .*deficit",
+        "matchCount": "1",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY handle 1: root",
+            "$IP addr del 10.10.11.10/24 dev $DUMMY || true"
+        ]
     }
 ]
-- 
2.34.1

