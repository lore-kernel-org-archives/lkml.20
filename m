Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794031385;
	b=YtDEAAh8sujLK+FJvbAsvGms+jMI+TbxdkxWkz6IXNhDPs5bBELNtA0syaH+bKkpVKwH
	 szbPU2fdi+27nZzS7H26UXT9j+YHmz/V0/Tx4+e+UWNFnKzSTEiHL1XVpGSuKvnXUpKDB
	 xOKHDc/xu3MvRkY9ouVXtc9EKJJh7AM8sXlUvSpjrljRZb5DosxwaxgOr4nJzGZ2Ef294
	 zoN+pWu4QirjpXezyICtfKwU9xzu5dDM3cPypA3jm9GaJVZCf+mA4u9Fx5/UkRau58ob5
	 FYK8JmN/O2WydyhxEK0a4ta37GyGBBJTQQFrhtg0QU/a5tFYGSlovAjg/KWZH2wLEfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794031385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AKa+5Wpszs7j7cPw/Xoo3jlJeQpFmBrGSTTM1AaN5Jk=;
	b=DqpfKVdAAdz2X53DwFOxYd2AmyyVffe3KCIdtAHUefYZ5W7m7Qyf5Ja7GVJ8LBveqjFe
	 6dCkZlFD/5pje+SSBy0Wg4NEV++NnP/cqKHMkTERjXxD5+JZNarvOCCybvVnXILBKcyfw
	 v8FS3J2XkIXqe0Td1PrPN3sSVZ26kq0UV6kSYQTyg6YMUo/CklYYeDeWaRrQwZM0ZKmv3
	 cLGpFo6c/Z6LJH/1Bq6yEHzW6AVidym/Msj66a+047vJ/gncudi8uH/TrZAXhWDL1LXZh
	 3missPIiA/xbBrYvukAHjMv9JWmzHZe0hdGwhJ0K5Jp3PMIT8G+jFZXKKIJzy4lKbHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N75+LnAI;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F73606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2F73606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N75+LnAI
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9eb579c0eso7393935ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794031384; x=1794636184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AKa+5Wpszs7j7cPw/Xoo3jlJeQpFmBrGSTTM1AaN5Jk=;
        b=N75+LnAIaiqc5Q70qXqCKzbNRZs11+Jdk38lpTgfMBG1UISrhU2nxjKxXd7Ki2Z2Ml
         A36iX7JXQDB0oduzRNcD2eM5aqWKBKBXeSiYv/eT+DAXVPrRZhKfgHimEq3Tw9S8MMy9
         V6Td7WwQR1zGPzRNDGaAkuGZRy1hs32jhzG+4Z29qKmU7rUL5JiRhUtJklifidkBN1Gm
         siKVzVAP5ajQkAbxDRVR1DkurE1LhJOYFWZH8RstlYTkckaziInI/sfRJv8uSlVLq9Mu
         vH7JPYAlMMprPd/coi4iCvZfNO4Sw8bdEuf87ZBbBY0DKznHWdrbbJSH2+RtqEJ/dCtt
         Ohuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794031384; x=1794636184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKa+5Wpszs7j7cPw/Xoo3jlJeQpFmBrGSTTM1AaN5Jk=;
        b=QiM4EphRrh/TTLqgI3OmVMpuua2+PQON39qfm72fchSIGR14Ijwv2yg70zpyI0osTA
         A3zJHODpJDQmXZebYMrNesgpp4La+xtBh6Mva9vTSbiXElftePAiloxvZ+gFebd0yDS9
         V5N4tleYFR9fpP9bXT6U6uwBgD6Jf3J9DMjO+ycI5k4d7Bp06XeOQIF/+O6d6JTD8oE5
         VSJs4rkdUxnWaeE3Nfq4oASEplAJ+raRnrIEuWFAL90bnsAOR95cRsvItaA0qRyealWm
         YuFBlmckN75Na53gREkUkYJaVrAqQWqDSkgHO5S+1ChVJ6Orn3/k8ozOk98+Ac34HdkJ
         ZRhw==
X-Forwarded-Encrypted: i=1; AL+hErE0Bcr4V2ncBJuUrPLq5fnXdO0geZJkUtjWhTiC/VU7J9szTG4jAwyaMblz0utAWR9ysrpsrV0EOeNniaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wejnhwH6v3Q5iWAZd6sSXEBTqLb232uoqKCVOim5kX+a1U2ag
	QoQ6IDvaYWBakeAtnjLGmO1ENZ4YTIBxVAw8Eo6U5hQqq2ePo8YnqhRE
X-Gm-Gg: AYBFou2JpSsNGjTrUSAMR1LEE4c+mmWexl073F5G0WJo9Vc2ZskFK0Ia4v9kSX5yGB1
	QZVwE+2MNR+u9p70M5uis6MLJILf06kbPYGyHQm+7ciac/IQa3Erz0eCyjYiDUUGp3qvLi86yK6
	/0nj1TpUcySO682u99B6Dll+3rzwYfjnHmVG07vCFNhjPjKM80tVthv5bGXNhR/lMmMCABrLsqf
	xx2xMxxE2uCsJw8kzf5HdEkbnhWLTagYocDWJN1bHh2MbUvifKYkLkL6Z0LW7TGzu0Y1geMCorH
	ZjvoumIKY9fnBN7I22mE8XMXSrtqnBhiDWGfyFMFW2wlE6dW7C/y5XSrP9K1IlBIXye6XPg4Pz/
	tLXv7iVzxYrUwVD54jDX6xpgIVpmmIWQRbdiOwRfr/cDdCHvyQj+eD3DzXoS/2j1ZegiIb2E4Et
	qF5rt6ju7ssurAU2icNnK5lcU/nA7nOqPQcAwVxyViRQ1Jkih/qxshtzgkT0ZqxXXYTl4nRzauV
	Jn4SH+xyh9Aw/kJygFefM8eDFLELk2t6ZFgvQ85vJp0NU6W8/taRkNR3ysfX0IPKQqD8D7Cv2ek
	kE9eiyHqw/nPGsMKxCzspxYZ2R9OkiGN6qY4mwRTxRJcwgTVJoNdgs3JhXVJJJM+
X-Received: by 2002:a17:903:22c2:b0:2ed:146c:cbba with SMTP id d9443c01a7336-2ed409890b5mr53794365ad.21.1794031383945;
        Fri, 06 Nov 2026 22:03:03 -0800 (PST)
Received: from fedora.lan (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d7bd2esm10488765ad.56.2026.11.06.22.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:03:03 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] ARM: dts: kirkwood: Remove duplicate DS212 compatible
Date: Sat,  7 Nov 2026 00:03:00 -0600
Message-ID: <20261107060300.597337-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 .../devicetree/bindings/arm/marvell/marvell,kirkwood.yaml       | 1 -
 arch/arm/boot/dts/marvell/kirkwood-ds212.dts                    | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml b/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
index 120784066..bca7f98df 100644
--- a/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
@@ -55,7 +55,6 @@ properties:
       - items:
           - const: synology,ds212
           - const: synology,ds212pv10
-          - const: synology,ds212pv10
           - const: synology,ds212pv20
           - const: synology,ds213airv10
           - const: synology,ds213v10
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds212.dts b/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
index 416bab50d..8b5af5122 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
@@ -14,7 +14,7 @@
 / {
 	model = "Synology DS212, DS212p v10, v20, DS213air v10, DS213 v10";
 	compatible = "synology,ds212", "synology,ds212pv10",
-		     "synology,ds212pv10", "synology,ds212pv20",
+		     "synology,ds212pv20",
 		     "synology,ds213airv10", "synology,ds213v10",
 		     "marvell,kirkwood";
 
-- 
2.56.0

