Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41D0326D4A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790570080; cv=none; b=Xv2usXb9fsbUopkd3xyo0uS73j4jZJMA4HVnc331SvoRgyBLC5rI8wD6PLM0zDyTCHXcdQCN1rtLH6OevycN7p0ROvakPpTDOvJKTxGWIEvso6oVYcO8RmJvxxxGqESsr3tILMNCeEzf0ykTwVlTTb6OnWzYt+/AZj+O5xdKhJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790570080; c=relaxed/simple;
	bh=EfkQyGvJKcJIlERuYYl99LlLoocWM/vzIQceRWFC7Tc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WRezJsSog8ugne6WsiQisLN60NUimMBuak7vc5sz97ZTwtROb10+S+TcjPXvkWudbKljSIKz+/zIBfC4ymxRjp+G6mPW53Is9n7lO2tDwlke6h+O8UfjvK6Wkt4Kdr/+rd28he/b2TGX1oFgHBjD9zd5nW5SKQ9oGLEsrqnp1bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSGttAIe; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSGttAIe"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04be84so3157382c88.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790570078; x=1791174878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Td911GW/RuVeylqJZh+mg3PMQ4kx9/FZxzP7fXWcQL4=;
        b=SSGttAIeCU47ECAoDOt7zXP3utQfxuIKuhFJ9cs8NdO4mPYdpWs5cLj7wT5bw5tR5R
         PahxToIkbfRi9AJ8Zkj/fDrh7NQIBfDFeulZjXaqsT/PkqcDPq+c9S00sgA9qAXKsdf7
         D7kcir+PRc35UjwTOHrifaPA309GScZ01saq8FBg8doEiZ8nQYjvPMH09tZYsO/BGzb9
         JABjjcghXUn9Laugp0E3QLe/MEP+n/CSA/vaBia0AVkm/H4TZ8dKLJymv9FBYmxn83hu
         6r/ATSUgQuVut3zGvpLJlkxZFbEkkSWrGNTorNJCh3ey3SZutP8LVdRIYuraT2JXbM+J
         zDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790570078; x=1791174878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Td911GW/RuVeylqJZh+mg3PMQ4kx9/FZxzP7fXWcQL4=;
        b=1Tzm4qgpuzrTCiXoOnxC17qBuZzJARi3AOVCiXU4qu1yj1CLXOVuyv7dZ1Xd4cU2Me
         jW7wjAgX0wJM+s8vE1aTxZAomqnJSRWlYcDlDH+o8GpMcX259MN7xTO/Ba0QQWdsUZhg
         qld3UmzsqU46XKBuroTOE0EiixU/QMuelD7yYoupuY09aMs8Qlk7YU0D7aX7qZxQvCTh
         FjVXjgQZLpfAGa3iBxm5vZh2ayUgtr/oX/tWfx+IUeMGspKjuY5PK4ZnBrf5QwxdMlmP
         LWbItDV+FicKsXvwrmYog67Hy9yad+hapF7xYIA5EX9fxURbnLGvXdchjXWtkPU2CjrN
         NKIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQ4f31u0bs7W+cI+iOmLyq3ABEf8+rFsXufu1Onsb41qI7Y3933WZDEFdVG/UcFFaRG05HJGAaSeO6EQU=@vger.kernel.org
X-Gm-Message-State: AFuF++lUyBcgSz4qAOSQkxPQW7OFGEMJjMCib4ZUkvqAFxDPV1uD5skz
	qAM7KsfXjwF2rgEw9UdaG5/+awa6Pd/8NWlLGRScT8mpa/P27Ztkw5iN
X-Gm-Gg: AYBFou23QW1Do+a1XcSbKs0Mgzfqdr3sW0saDJbOn3uku+tgLJ5zKEAnEGxcvII+GeR
	tW+SCTte31HQ/MW7PYq+UOsJGNZWaudAcXpsSTWv8qMJ2HXbrigtcPzPpgr0qvQoKdw0i0AMe8X
	MWm4d1AJaJ9kaIzqf5GYMkCmBFYVO+pRexxnsgP0iK+VVso/Wx4C0oaj10K65HRQSO1hhi3IJLG
	/JBkV9ZZYE1lLRXeVCh6cVfDykWOHgywG8BszZSeZNoMZqNw63V0G+AFVULl3n5jryM8c8K34ku
	jfFD5mCsZuIbB9ecvPY5Iy8lIH/62z8w1wy5AIi/eV+BKmBCeXitXrSY26BYC/u9hbVDOlf7Z3g
	lWuQQd0AT4++xYm/T+PsTwN2tIDLS6TXBf4NY52QDFQEEzOG20sT+LrV2udUkawwqbBdYNb8NKW
	U+yaC7XplbjfWwhjsbasbazCzu+XinXD7uNFHWc0uucXeQr2z030xiWNPxkmE2WcWtCnLFg6+r/
	6Cgobnll7yxJFIIqDi/CSNvvjOINA6Bfr7rfkKkV0dXmHZNMsuW/nT04ES5ZALjQF6yf0PezbfJ
	OJx5axQ=
X-Received: by 2002:a05:701b:4204:10b0:139:fb6c:b37c with SMTP id a92af1059eb24-146ce777babmr9343617c88.21.1790570076591;
        Sun, 27 Sep 2026 21:34:36 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:571a:2a:d409:bce3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adbcd1bcsm27921045c88.14.2026.09.27.21.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:34:36 -0700 (PDT)
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
Subject: [PATCH net-next v9 2/3] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Mon, 28 Sep 2026 10:03:57 +0530
Message-Id: <20260928043358.6866-3-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928043358.6866-1-hemendranaik@gmail.com>
References: <20260928043358.6866-1-hemendranaik@gmail.com>
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

