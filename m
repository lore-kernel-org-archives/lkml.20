Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208281;
	b=dT8pUVSjgLjzyriEiwiDCfJVZKaZHXdQD0o8beWqquTPILoHf8OZaHFbhiNRqcW2P66U
	 7dwB6lLiN5ogrZLvavnCN656pv8+nVs1yaiEqINzrf153oULhG7eP216fhjJi7/lJ4uZS
	 TlE0rEAnMdwi7pCMjA6IDBbAbmG3F7jsZpGTbM+fQOfKFn5Pn/Q0l8NnZOof7RxW44OPB
	 LY5ZMo/Gw/dUw2OFhTgH3nHawOvz7EnXMNEBDfXXWovO76pP7iYTZXatEjoiMmli+TNxg
	 u7zZCd/OQnZtDTIVtH6FU89tV2idzNUaCo9tF6fZ1PlwJqkFAxpQhj/brtK8nSgZokw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7mHMsCDVeycRBqs1waIeg/qc9zHDhufgZN4r24QbNvY=;
	b=tU7BL2lryPQm2veQrShLGJwFWD80V5yfBEMMhjmMUHz27BEr3nowO/rhQ7O7IVAi47yj
	 gZwP99D+B0mTQyz93c1ZxXTEVRULgQFZdDRqMbQcflKJty4/+mNLbexZuq7Vm4xwPukQU
	 sPnsjh92m5Dvckq8G1bKS6n4Ao5AOHYNK+giWvrmOq/yHdeyvQVUgrCxN5sxpSOIOjjob
	 J1UhJ+BqcjgG2D45M4nnAd889hURT4EV4jCrOy9sklz9TQ7fQForSn+zrtwPxZRMhipeB
	 Wb7EqjOZ6nagjmjzLHvand1cPo76BktII+Xc03z6dxqIYWO3iN9lo6TTHamtvCiqF5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yrqxFb5P;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AD9606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73AD9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yrqxFb5P
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a8cc11ac42so351172c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208281; x=1794813081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7mHMsCDVeycRBqs1waIeg/qc9zHDhufgZN4r24QbNvY=;
        b=yrqxFb5PaoQQpJVCeHWMecfV0DneFMtWF/GXOqRhI0nEu2oGg9szux5pv/edWk9+Sk
         +ppyrwclcOxV+2mENRlj/4KIDweTwG+EqIRER130x0e7FLSpReLt0D+07OrhFl/CNj74
         jTfLsmKQpgXRDkQHRHSLcePJ+ey/araaccry5l8QAO1xfFWqYunFSq2awtolqAN/Skd9
         VdCI0eB415MTrBz3FRGDOx+Oixe8zNqL+9dGEYxBHJtja7zk700Cxfo3aveVGV43hd1c
         Zb0PptMUKNJE7zcrXz34xw8SnuWKiy1n526v3PxdxA2SX3TU0f6GIh6CJ9aDoxgSHHRM
         R44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208281; x=1794813081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7mHMsCDVeycRBqs1waIeg/qc9zHDhufgZN4r24QbNvY=;
        b=r2yyAaJ5NE50ZyZMexPgTM8Kf5u2lkWtUjo5/UltM+KwU35yZ6Jfu6FS+ZKy3ROlJD
         ewjQY8zMMkg0sUoofrw4jShC18lelMhCFZkI7H6X0YmAz75vhP9AFE56GNLogRtsZ1SJ
         6UiAt8su3YzCLM4XBu7CfY42KqpjtBUJ4WNkG4pDF/ent6QrSufWBCZNUPVrlx4eDbjn
         l61q4qd/kRBQK+n05j7ApWd9wp745rGqCCPnDVk08sTEx9hdpd3B+l7mRPDuZWJA/oNM
         H1avlwHiCkEiZEYiqMCyDaNULXUykvIq4lebDEA0JfcavAfq38toq2b8p+FxlP5MBM9d
         yPAg==
X-Forwarded-Encrypted: i=1; AL+hErFpw2g/5swvOo5zGSaPRdvaix4yms8APc6ab2MDZTCTciVTezCiHGHBKIpjtI8AurDCOL+nSgYXb+ryL08=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MJXcLM42oJ57uUSFg7852uJDryWvPdGJ5pIS9zeS9vMRUDniY
	HgErvdegyCUdtod1pDo/8JfKMG1Ji4A0WdBC6/G8w1nfrGc+wf4j2GXo
X-Gm-Gg: AYBFou1fyRhofplUbS0TpzQBhw+Wt/Nx9CyZV9Z/E4VHPmarygVd+KunLz3PqCTXXld
	jWALVMohHlo5P6rDbEgRBn+4p3ybSnGiUvs5RF8tk7U0FdAg3wSm7y/lNLIOnSGr0kWn1l0q3/N
	gKh7fG3+Vp4yDW6Lu8zZ2Hah2h0oniC9vaBQRsvVXoPnZ3pR/7YNtGJzhO+kcjjeQzmC1tFBc4B
	Ypf8659ruW5S+slKogMy+aM/mm9XCVJu+QHjSCKqlbKFDyrIcLpAYc3CleO6ktvhrJLeHJNccds
	0j9POVEtG8BTDr3mh5XYmdZAFpi66n+YojXT5/tzEDlDSBxauUT1ONkAtlygUMvpOi6C9ahe1RJ
	GTWzYGMDuJY/sqcvUWqM9wpUoVIRz4o/rZJbKxTRs7HzvLrwr5UJbcLnBLJn0byOHBoH5L3DlxV
	99tfbYF/FJGXuObOegCDiL04eZMy8c2OqQ9m5kjrVkOMfBvh5+7nRDJVbLYQEqkmGsVYCyxoUCI
	EQIvpvGgxaIpLEPsMrFWAxmn78w5DC8k4iHPbOPRblEwXDLcf7cgcXzHF+ajCqVTPFqYSH5rMaO
	4X3MdWdcOdjfR5pRdMTach0uGUUuJeHnsmU5Wnt8VUqPfh7lSdASOmkNbB2PBLA6vI4CrrMJQH3
	yCZFjYsCHsNnjOlX81JvvxMKh1HXK
X-Received: by 2002:a05:7023:d07:b0:1b3:ad63:b9c2 with SMTP id a92af1059eb24-1b3ad63ba53mr2044328c88.22.1794208280449;
        Sun, 08 Nov 2026 23:11:20 -0800 (PST)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:cc96:e14b:76e:f8f1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm13443513c88.4.2026.11.08.23.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:11:20 -0800 (PST)
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
Subject: [PATCH net-next v10 4/4] Documentation/netlink/specs: tc: describe fq_pie per-flow class stats
Date: Mon,  9 Nov 2026 12:40:17 +0530
Message-Id: <20261109071017.438478-5-hemendranaik@gmail.com>
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

Add the tc-fq-pie-cl-stats header for fq_pie per flow (class) stats in Documentation/netlink/specs/tc.yaml
with its five fields: prob, delay, deficit, avg-dq-rate, fq-rate-estimating.

Extend the tc-fq-pie-xstats fixed header with the type discriminator and the per-flow class_stats fields
that follow the nine legacy __u32 qdisc counters in struct tc_fq_pie_xstats.

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 Documentation/netlink/specs/tc.yaml | 33 +++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/netlink/specs/tc.yaml b/Documentation/netlink/specs/tc.yaml
index b6ccc645b0e3..b159c4b563c7 100644
--- a/Documentation/netlink/specs/tc.yaml
+++ b/Documentation/netlink/specs/tc.yaml
@@ -894,6 +894,30 @@ definitions:
         name: memory-limit
         type: u32
         doc: Memory limit in bytes
+  -
+    name: tc-fq-pie-cl-stats
+    type: struct
+    members:
+      -
+        name: prob
+        type: u64
+        doc: Current drop probability of the flow
+      -
+        name: delay
+        type: u32
+        doc: Current queue delay of the flow in microseconds
+      -
+        name: deficit
+        type: s32
+        doc: Number of remaining byte credits
+      -
+        name: avg-dq-rate
+        type: u32
+        doc: Current average dq_rate in bytes/second
+      -
+        name: dq-rate-estimating
+        type: u32
+        doc: Is avg-dq-rate being calculated?
   -
     name: tc-fq-pie-xstats
     type: struct
@@ -934,6 +958,15 @@ definitions:
         name: memory-usage
         type: u32
         doc: Total memory across all queues
+      -
+        name: type
+        type: u32
+        doc: TCA_FQ_PIE_XSTATS_QDISC (0) or TCA_FQ_PIE_XSTATS_CLASS (1)
+      -
+        name: class-stats
+        type: binary
+        struct: tc-fq-pie-cl-stats
+        doc: Class statistics of a particular flow (invoked via tc class show)
   -
     name: tc-fq-qd-stats
     type: struct
-- 
2.34.1

