Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208259;
	b=c1urC4iBjgY10IWqwNeBn9U4iZISqxcZ0oo07eji6ejZCpsxTwcFq5ZoaTgGwq4NzIxJ
	 6KAhzDmTgFYmkBgz5VqCAM9GTBPGiwY8SGeQzDlaRaCbBDftS2+UF56rpEEtgD823b0ZU
	 PBb3A0zzym+bt7XsCoKdBSZRDp3xiC1VUnzy0h9xwHhM0r2RI5oVrQsPsU5UPA4/DI6y7
	 0wAcWKeaXYNloJxFRufOaNuy++j1JvpYozvgBrqDS3BCm01vNKawWOwActHSsxmq+VdZO
	 ILCXh4QQUMUMWxNU4+1hU8zsjEvP9sB0l1fxajTTk8HSaefXHfezvyohlEFn52XkO7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Td911GW/RuVeylqJZh+mg3PMQ4kx9/FZxzP7fXWcQL4=;
	b=3vQvLocFZk8QXNwqoj/Y9zcdV7cZTQK/qsf2izgOtpgBv3eGlykA5nXX8y2pay6E3gUm
	 R80lI3V3yLTIYwLQLXlOVDbhCUnNPq0SKm1Mz9ja1/1QGNtJS3t8dh30lVVEXPLV7SEOF
	 VkGWehEsBDPSPYvtIJU0N4E9sfyhig4kHsy6W/LgVwISSp+GUoyWIqwFCYkIyCJTV/Bbi
	 VPrmMBL/E8WP7fEWM8NFpPk/E1UmMSsuQxe9e3WcRDS0cvdxqPdWf8MbG4P82/NcoMWbP
	 dP7QixN6k0NCeyE1870uHE6ZFzmmR9l/J0E5CshNRiJWJ227MIyxKEehpJswaMKfOeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lrxcpB//";
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBBB606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDBBB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lrxcpB//
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-14394530ec6so616142c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208258; x=1794813058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Td911GW/RuVeylqJZh+mg3PMQ4kx9/FZxzP7fXWcQL4=;
        b=lrxcpB//IjTuPa7XFTDWdg33npJj5T51SLHc6M8AR/74UrbF2JHehRosylQO0o9XZ8
         j4RFL58oYnVWIv9sFQomNvmL5lZfqA4yN0zluUI/oaSPkOm47PjDowot5EUfn4AHGXqT
         cA38vbof9RnIcx752HV/8bqsO5uzBJkOnUWuKVS3QfaIIRvgAFjsL4cS8G5ZTbsc1ouj
         22osgFP7Chezl2hnKavXyxyFC64t+4LIE41HcNabkfPvbhqPiG2DviQ3+C9LRH9rQkjU
         WTBuAktne/jYLtMWTW/gdzxRR7QzphX5+h/TliNKEuhu/DBdMKXWcI+DQIjkosbkrPpV
         gygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208258; x=1794813058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Td911GW/RuVeylqJZh+mg3PMQ4kx9/FZxzP7fXWcQL4=;
        b=g30pBeE4dLJaerG9w/dEdp2zdWxC0fFSZig+t2eQ8UMHgpw9l4fqGMrXSiNZzdPb86
         Jnmcp5meUu8HfcGjWuALG95/zwrUbPjfQs9eZDJ9Nym83OjztugyvD4Flk3LbVvyk/3+
         r1ZOwFStwSWD4arlar+f4b6UNMg7wIYZGrdlXmAE0lfDdu+ppMjtbZitcyxKxOSSdMzN
         RwEj9IuXifcVRw9eaPBsMDOjNMesWaytR0aT5kfjGk/LbbFpCmnN6LEILlMK6Fjvzbmc
         dgKzPyHwafHx67bsFbVRtZd5lofdPEppUjvOAG1P5P49Qke/SBWiXXiktUb9FQlL4ZbL
         uVxQ==
X-Forwarded-Encrypted: i=1; AL+hErEQuedAIqcCy83OB0/mLWTpbTFTM8Rsfo+lQVWDH6IeWiegx7L8WgpZ6GiD8gPcNZfE897lwKBBGuoBF5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cpCvNzuV06eR1R6CVvkov9wAYGKo+jX/kYv+THN/uOZmxi5SU
	+bz4Tc+nE+JsZPLMpwSDFYAbbwQFO6p6hHVSbCtNMnWVdMZDJv74CypY
X-Gm-Gg: AYBFou0WYlyateNLqDio9dAX+0eTMSCmaWAKaSlhjFdqls3BSJv/6mCyiHsLitQMf//
	YGGVdT9WtpOoRsE380L0P/hhBS3SA5wKsPdYChhCwZYfzVledCPf8XVTLF5PU1RUip1QuCZYQuf
	hZ2TPWCtlhrdRbDxpmt2yUCi9gZeTOUSI5IBW7F7vTQr9ESPPCtLYr975jT6PmjqHKtYI+c239s
	xgYwQjpj+iqfA6PuYgc//GHYhaH8AYA3y5EGat5PrwqbZzvbxdSFPkAEQMiEZuQS6ADSnFW3ZkM
	+F6tGpYcanVjqdrN5ALoSLCVKcWWi1rMAfO3IuyKvR2C0bLcNKfRQeTmgwJc6/5Qimr7Uh8PAis
	ZqHEygk7jnGP1u6yadW0cqoVLVYvJDkBR7lt+8IqUvA2F0C8hHwJdfjm+oz8gJ0yXwBgBZqQHGi
	/ym0QEzRAqzaSEMx+VoCuFz3ho3Ors1MuAAO9fbhbSXi6VriEw5IaHjuoBUwpVmao+pPIWyd6aY
	ktJOaPc6R/ybevOHBg+/wWAFRBDFj00Oc6jfciUqWkXeg2JSD+xTzEvhrqS8hlXCY0kBSsiinkS
	b3kQnefVCqTsOk4WzK0LVnY/dttd6AeCsIzK0Ibn57bVJPcK+T2DzurE56G16h2gvbmZmz/MZQ1
	wwoW5l24ej7tktkuNq/4k1DLajKef
X-Received: by 2002:a05:7022:1586:b0:1a8:b566:80c2 with SMTP id a92af1059eb24-1b39fed11a6mr5130904c88.17.1794208257851;
        Sun, 08 Nov 2026 23:10:57 -0800 (PST)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:cc96:e14b:76e:f8f1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm13443513c88.4.2026.11.08.23.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:10:57 -0800 (PST)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	donald.hunter@gmail.com,
	ast@fiberby.net,
	toke@redhat.com,
	liuhangbin@kylinos.cn,
	j.koeppeler@tu-berlin.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v10 2/4] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Mon,  9 Nov 2026 12:40:15 +0530
Message-Id: <20261109071017.438478-3-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261109071017.438478-1-hemendranaik@gmail.com>
References: <20261109071017.438478-1-hemendranaik@gmail.com>
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

