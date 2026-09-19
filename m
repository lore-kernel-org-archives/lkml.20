Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E486A36EAB0
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789797748; cv=none; b=q7aGMi2cXzbhApsa+PTG3eM9F4WZLnbtEU9cd0CZBDwbTlLkIIx8y8w8MBsW/H/7mHnGOkL28aoy48xNuxEpnMuK/XWlI+TQyntS3on+UZ3Q3eTPOgnF++EECVsc/wz+JUUgPriF09F4DOfEDL3S1apBxAGOCsJhzjQb211BhdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789797748; c=relaxed/simple;
	bh=91dEzI80SCpz4uDkGgaBokLp+OVmX/1A1W9gUWuEI6o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lvNJ6Bv0m2C4TGJGhPHIYcfebgoUWakd3n8oD4htYer3/zF6ojc//QEZHYbS2SsLlpZndSOfXWdpdG8CsS89IbaPt9I6UTSGNG21xtl9SXVRWnn8tItE+ysZeQLm85oaLO3dEx6xzoQ41SXz7ylvgvMFGGt5KrDAveJgZ9apa0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r0b99gqO; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r0b99gqO"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db1ca06a25so10198245ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789797746; x=1790402546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ejDEyCQkXZMmRHy1Hubxmd2/DCnmb6XQczuQJ37e9NQ=;
        b=r0b99gqOPVDcsmXh2pIdv2zIb3RG2O2ut73mTwYFbRvsMLdWyuSeYQG5JXMQ7NVkgE
         ohFY6Ht6YTfatOwSjCJueg69lsrXwU2KCMMxQBPPZUUmm2qJPY9eTSXD95HGOk/xgN9h
         vcG6ORimgr53p7Zeot/0yEfZuWU01uLRfglB6RIqwS9ZJTtwB+VOWFaqcrcCYWLLf6l+
         LSM64stfSNv1d4qTkTMURe6K2Lm32KoQXx+/d/a7EXBAvHUCPkJUXw6ymKtlKtKAgGTr
         W50Lrl8Ct2nroxDpiyowfiSGZ/uvo+bdevB9S08KGOy93w6By3xgU5lE9w2UzLbHevS7
         s1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789797746; x=1790402546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ejDEyCQkXZMmRHy1Hubxmd2/DCnmb6XQczuQJ37e9NQ=;
        b=aSHSOfJ4sdtagpPYZ9PeDCs51DfDJc9yKYnYPnV5eyhsd1SIpQFyKS/93FeGf5/3nt
         yxguiahGHF3CrWk4BH2bV6ZStdFO4Xb97bxJtMn/frKcwM6not/SAb8jLPitr43gpkcZ
         EBrIkrHmUj9YXsh4b9PO0GpxqpNwm5kz3FbOSgwu6KQReTQRCxk0trwA0ul94oOzOQN5
         e9nOAN85qUjCzTxvyzRxd9UVN5sMNi9t1vu0B+DRjtfhIkD9qgwWWi6sjx4pX7JmAlX7
         HCMo1k5/lGcauBS3g4JNiX6lmXptfRXlNaRlwthbc9FzguddQ+BsJ6VqRJ5FV//Wqlqr
         a0AA==
X-Forwarded-Encrypted: i=1; AKwUvBzn4bPNMRFrLySfRCxKee1FzQzVXg24+3esJxsUBxWokOoUwDi0mutmSiqUni3UwgKD53wfTfJNdaJoAag=@vger.kernel.org
X-Gm-Message-State: AFuF++nvOJcfjW19K9lOh3Zl/h1ko+TNZ6cUS29pKECzIpPwjUBmtzMb
	t5CatZnb5MweNFkFfDBT271ZhlReC71VyLEbxmDzBzUVvczjI0/xP+vO
X-Gm-Gg: AYBFou1l5mMRQfC1Iy/9qS6MBbC+hURxzhkg3bPVEwS6/5Uvc52ZgmkJO4JfJ6cPke8
	XbLVrXfiKuYg+IVu4Wb0xLv0QMva/b2fxxa8B3OR0+kybctF+3Iqj9Nl9+5soJHsTxLijeFrx0N
	HS5fNPaYzkoKvDBgSwu8+h8FtiUm5qhgja/5omnwNEsrjCtOoAtg8Q7vA733Wd1aOTf7ltPb9IF
	FCDBXRfhvHsUTy/9RB+YWApZXGKxjlNbpsiNoV77UAjT3R1ZcGrwPWhOSN6c3OXl4/FEG8OrX1r
	3JwCX2BTpelN+ZUurMi9ibXXAlKn6AbRzrCFQFc9wUiEPRl52uFGxx4HXlZf3vskLOl37jAeqak
	/bJbz1abcJWUWz7WCabQBtK+i7ZrHqa3YJ6P7Ck5ByFNN5Kv/q7vl6Fmt4TsOWXyWHgh+U+0oXA
	scBsGciOz0SGJ3pCOYCOyfDaFxt+4rkoU9iLgrM7dEpHQapMyzbgDzK2/yR1EIU2bknNWGcjAM0
	ZC8Ctx+601unorjo3SXIqnQR2dJ5Girzi7tZVC6FdG/LEOWyfWU/o3cXHeO45K0mxqVw46JTSQ=
X-Received: by 2002:a17:902:f681:b0:2dd:c053:e0f3 with SMTP id d9443c01a7336-2ddc053e127mr30905315ad.34.1789797745830;
        Fri, 18 Sep 2026 23:02:25 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:d11b:773b:fa83:c49a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c33140f7fsm3658321eec.13.2026.09.18.23.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:02:25 -0700 (PDT)
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
Subject: [PATCH net-next v7 2/3] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Sat, 19 Sep 2026 11:31:24 +0530
Message-Id: <20260919060125.38063-3-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260919060125.38063-1-hemendranaik@gmail.com>
References: <20260919060125.38063-1-hemendranaik@gmail.com>
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

The per-flow counters themselves (prob, delay, deficit) are printed only
after the companion iproute2 change, "tc: fq_pie: add support for printing
per-flow PIE statistics"

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
index 229fe1bf4a906..15b2667285eb4 100644
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

