Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B102F9DA1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321220; cv=none; b=FrPP3N+Dn2yV7TcxmADevKm2dXiauc52MSbB6ui/NXI5cBwaRxfEXdbdTeJk/JlbI88hhQgfLKwU2H82fBqKkYc0/ZFT2rQpkOWEnC4RR0sz+URgyUrLN0gLLORLAUzAp/VQ26M6JZyL6T11yOLapE2tB6a2w7aDuGaCLmAPJR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321220; c=relaxed/simple;
	bh=JY8TWNetLtaCfnOffM627gWa8XUCz+EjVUleDxIGQn8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LCtKydf66l3qnojamssh54xCcSQ/dwUXRJRlGxfIKb7xtHzS3UjBljWg6saKEZ3+v5++NyM4aSPWuKElCXEWpIKAzld64LaC+ONxCl3qyEFRCzaMNxcWzlGdNzsOVxEIOMg8PE3wGjrQzMAkxqycuxSap9CdDH7RCbkVCHTGZaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBLh9oqi; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBLh9oqi"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d8f265cbe6so5204205ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788321217; x=1788926017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rU1Mo2mZlynI3rZpSuzLl2Dc5eq4kfyxRQofUmB2lfE=;
        b=fBLh9oqi1w+VFMlPAvejYqxAo89Ws+wt/kkliV+rW2Hzn1yaWQ+1aUdolMtqgFFNqI
         iArd3EuX7lwURRygNpNYTT7JNGmnQxquewkoKPchSkzPCEowikoUmS3SobST8Y+i04oc
         +8CNo+NQWYamf63P+7NIUTZPFG6I6DT7YFE6dsFavS6jZdcueEXj4EV3ctYFORySz3je
         v9umQbRrziJPkwr1RKtg/t8idiptNhav0ro/l41hlYrDVI/dhHh/oVvQVo3sYg7KNZ2Y
         +vZhFlHZxUbkpojODDFUZeUZWUmqfIaDZacfsX9v62Q94UVWRXq+7flvlTGO9wBYGg+N
         3D6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321217; x=1788926017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rU1Mo2mZlynI3rZpSuzLl2Dc5eq4kfyxRQofUmB2lfE=;
        b=FQQ4S2KFwLtovavRYU0pzFd0W6XoKOaqBHjkruKRCviik5CibIPuqItgzV0WG8fYA5
         AQqi/rASNkeuzp7ITl2SAuNkvgqo1aS3DG1Sk2frUUKq1OY3nn0e1EMCN7caEhgJBt1n
         /TdrtFMu6qA1F4SgmJeOg7WT+pmV/oNhQWT+dEhN/0FU+1pdlHUQt+cfgqzOtY3P79fv
         6yJAc6sdoZtXmNxGO2gh+JH5xTequIx4YSts8dH1uzFs+XiBWnAu5RRDxx5FdqRXy2AE
         z/blS/Z/lrd8M8/fTt8cBFbIQzGw7DRrtCy94CoRgobT0QqcSgnH60jizRmgCo2IXn/V
         5dqw==
X-Forwarded-Encrypted: i=1; AKwUvBy6Phgvmqeg+XiGG9kOJbwEwv9QIlniY+6O5bJe3Q3fiiQO69PkCgWADKs7ArHeaqY2LNGBhYYOShmk3sM=@vger.kernel.org
X-Gm-Message-State: AFuF++mlDe8UiPFEWhCbpMK+MMjMkZoJzH7nqXmvKL4WNobeaTIy4jpm
	ytrZWxd3KYff39KjIfwQ6rNrAb6XoSdAXP5B3D3IS43kdZGe8XB0A4/b
X-Gm-Gg: AR+sD12xxz7MeKeFMgtnbfLlH83mYr39iD7nMPOXPW7Q1CcgNlIkIY6gc4MC6YzR71T
	XBwZGb0kOGUKqEm1UBpAcykTCJO8Q959IyzpOSO4v6+R8dsc+kSw2XbKcErYAAC5NE9snvXcNJv
	b7qYGfl3yllSozJqoNZIFm8/Lo/q5PrVwt2oSY2HXj4Roue6io0N+GPnyA00ZoDruyR8vYEw9jK
	FeZsE2r767Xky6BT5auJOJcWcMJCOH0QwU1xGADPhTtDcccmay+DPYSmZriUZ2K2URGOFtDhMqU
	1SErM05WJ48y49uDCOlwe/JSZiLh9YQb8ClWO2Cm+TpDHxYCztKvsJ5u87abkF3q9XJ/srA2Db6
	/5ovPrKhLk6enXxm7haSS2tf31AdxMTiljOhyYZRu6lPVrQJFrRxwWXxWnUKPDsioJbkyhKj8gi
	qV2x+eajc4utK0X5x3T17r8UBayXL+wVNNghLsOg2iJwEx1qoR8k/ew0TcSWeyndy/Jk6470Ijv
	8uYkzjnTF5LLK55uggoyb/qana35QMwE+eYdz2lUfA+OVQ1vD9ysn+0+QCes3Fg
X-Received: by 2002:a17:903:234d:b0:2ca:660:b1d with SMTP id d9443c01a7336-2daec6d77c2mr26779885ad.11.1788321217430;
        Tue, 01 Sep 2026 20:53:37 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:5fdf:d463:f07:1882])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b7987csm2502377eec.16.2026.09.01.20.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:53:37 -0700 (PDT)
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
Subject: [PATCH net-next v5 2/3] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Wed,  2 Sep 2026 09:22:30 +0530
Message-Id: <20260902035231.81866-3-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902035231.81866-1-hemendranaik@gmail.com>
References: <20260902035231.81866-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tc-testing case 83c0: create TBF + fq_pie on $DUMMY, inject traffic
with ping, then verify 'tc -s class show' prints per-flow fq_pie stats
(prob, delay, deficit) with matchCount 1. The test fails on a kernel
without fq_pie class ops.

Update case 83be to expect failure for 'flows 65536' after patch 1/3
caps the flows parameter at 65535.

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    | 33 +++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
index 229fe1bf4a90..d4081fcb0933 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
@@ -1,7 +1,7 @@
 [
     {
         "id": "83be",
-        "name": "Create FQ-PIE with invalid number of flows",
+        "name": "FQ-PIE rejects flows above 65535",
         "category": [
             "qdisc",
             "fq_pie"
@@ -12,10 +12,10 @@
         "setup": [
         ],
         "cmdUnderTest": "$TC qdisc add dev $DUMMY handle 1: root fq_pie flows 65536",
-        "expExitCode": "0",
+        "expExitCode": "2",
         "verifyCmd": "$TC qdisc show dev $DUMMY",
         "matchPattern": "qdisc fq_pie 1: root refcnt 2 limit 10240p flows 65536",
-        "matchCount": "1",
+        "matchCount": "0",
         "teardown": [
         ]
     },
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
+            "ping -c 50 -i 0.001 -s 500 10.10.11.11 -I $DUMMY > /dev/null 2>&1 || true"
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

