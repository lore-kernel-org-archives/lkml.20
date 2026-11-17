Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907662;
	b=pCILnkvQAs4RkoukEstCdF8SQJKGJ6eWsHgpAPB7XDV6ftGLqjs/dRNa5rrFCP9sySEa
	 +GCdocZGcVL1u2WJNhA8mArNtOGKoK4fKASAdfBdUojp4mTBrb4r8h5PtYN+yk6dNjj6F
	 W92kkNaC2o0S8yu8oAemB84GtQDKVaZ2/D0AlFwC3l6D2M0qGSqAxCn97e8HDCtsZq3zU
	 T0yHSQvPLBTscMnGyBYDwsqL79puKGvSAteMrpU8JS9lBhLtzqH5MTF0ipKdsT0JyBzQf
	 4vhYXs3LFmGtbWiXJE5POwpL/ylKIzVNr/t1zwlAf+JKqCHQDu/EBbWSqn/6ben9AJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aDSdHKsmTGGWkDOKCvZtMPEPFRR2Z2wRDeQx9ZQTN3o=;
	b=EULzf1Y9nXvNz1AVv3hJ5DkNI+50tL26lBfYnuWv60TZU+hsStb2BIVsR8pyMpjL0gG0
	 m5vtsPqT5joP952yLQuU782H5oBYaiXeqftx04dURNPTZQxxK8csO3+O/PLY9rnriEa3r
	 sTo8gACkWogK1uSYfPUQYsIEZSXDIHXhD7LH2/p1tsf6FjTXljnTnsltHrkwK7y+Enr4h
	 EVEdyFyyqBZhXZGyr5WjPOpHvnJInUkKifczbpzIPTyNmuyR0yh101XwjomJj2hBHaAkJ
	 43zkkwZ4n3ppB468uIm4RpI6K8pbUqgecKJzgl0J52QP+q4y9FCFBpA5B76q5qGetAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0SeRLO/C";
	arc=none smtp.remote-ip=74.125.229.131
Received: from mail-dl2-f3.google.com (mail-dl2-f3.google.com [74.125.229.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4FA606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F4FA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0SeRLO/C
Received: by mail-dl2-f3.google.com with SMTP id a92af1059eb24-1521c45a248so3040301c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794907661; x=1795512461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aDSdHKsmTGGWkDOKCvZtMPEPFRR2Z2wRDeQx9ZQTN3o=;
        b=0SeRLO/Cu/Z7fD38T1aAPibopqP6aQGUmhp1Bo9C+KNJ0zCPPS4ridEDVsmduTWVMB
         IcSiChIYc5OtxT7LxawZZwt+I4vRJx+Vqq/qgo8Z8FQoveqYdA9YRJcwE/sXvxSDpMRr
         xicb0QeRwgjZ9gDwefSkUvHASJVJQlsYzMLlQ4EAKa7se1CKQDlqSiZO4Xwi4Wnc/QC2
         VNJwxXOQsdQW6+6QcfmItcKP+zjvb/hOjtnhCrZe6LlBjJf4dHf/HEeX6Tndo67/JG2A
         sGSH6TS8rkRN0Xbzr2uiSUXWh7FLBkPXcSgHu7bfSdxyrlnkvQ/DQ6n04bjGVmj+umb1
         eyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907661; x=1795512461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDSdHKsmTGGWkDOKCvZtMPEPFRR2Z2wRDeQx9ZQTN3o=;
        b=K7RBb1AccZuRX/lLcIB99wPi4ZsxRK60s1j4TfMRe6p/28q+1ajOVzC3L10aCAegws
         hiioVGP7plLEa8qRaY5qC7ayN+ruwOEiB/jD0QHGRZq8fd7LnrfH136Ez7Q3cWV+AMk/
         7g6Vwk8aCNBx1v3skJmJ+xK1nRJfKxcxgBCAFbS4ACzgq0mkPzwflNM0ZF8SKNapOuXY
         lb5cUz7flYp3J+gz2mBpVe4rYX8AcpndHug43JReJCUE0mvChexqV+pYoSMKj23zTbSS
         JaUvV8MLXublzJaTHVwDJvzkb1j/smZaM10nIIb1Zf3BZS/2c5p7H14OvU/jltLd6wnd
         6rRw==
X-Forwarded-Encrypted: i=1; AL+hErHm7KgM37e4ODIKd7HU6iwxdJIkj2Cphn89ccth7p52PcFgg6JWpFI9rf2xztqYvwjS+Ea4ahgbLiK/Su4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PMh4QkhfzzDv08CiAQ2Xz172Z7csZCCk4suBothFgIx2zv6UD
	WEBMBcu57paKfKyOmantKvXd3Nd0Q2aalQJDi41M21rbdXsxLgPndixQ
X-Gm-Gg: AYBFou110FOO/oUZIonlSwuHLg/6LbnrjnST4SHVdkLep9IaG7cz+IKwDdzO+85MnGG
	s5OrPJewg1se45IQ6ATgd7Yz3R8dBS9n/Lo1lFgZxOxprFaDF67Szy2pEEEwmiah4q3HTsgSsyO
	j4mo5vbza2+9sr4klml2OdAgr8nDsR8c+RTuPNA00HyGm8cDYerw1SufN2yVdpJqYvI3ojthilD
	5Ea0n9HPyym3ESkkklAt/UDlKcmNwTSoM8tv/Qvu1QKOeckXUwsH0a2847uXtWIERz4trybYhtR
	h21MnUOKMjcV7A9/OrhQFwm+N98V5Ur+ysd35DSGdNAnp3XyY34J1hGSB3rPN2eXFu7M9wfUNFF
	q642+22BzvdU3IEXDVYahU7aS3TNe36hFUF4b+dprscsTSjMmkLUBl5mDZmz8TGJzwPQtp4jsX0
	4SLzA3CgDOjFvPhC/yvKvwG5e6/vZoE/qWCNj048ulB2jA0Lmlc/Zj9QDc0L4XTXft8V8bKHX5Z
	DisXyj4oU5+ec0S9UUNRz69PE0pK+RP20fxIXw0GB/DVMK/rg67LIxpZaBNA/Hh81bLTzDEwZBe
	oWSghJMVUjWCYSNRclXFrr5e7N0YIcIqdHoQpH/OKED9zrco4EywdihKSdLQTXkiQcMz9lMC5b/
	dAQ==
X-Received: by 2002:a05:7022:438e:b0:1b2:539b:496c with SMTP id a92af1059eb24-1b503175d03mr21231997c88.35.1794907661127;
        Tue, 17 Nov 2026 01:27:41 -0800 (PST)
Received: from DESKTOP-GSNRJ5L.tail4a8ad8.ts.net ([104.28.223.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b27dsm38381531c88.2.2026.11.17.01.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:27:40 -0800 (PST)
From: onLeaf <onleaf322@gmail.com>
To: pablo@netfilter.org,
	fw@strlen.de
Cc: phil@nwl.cc,
	kadlec@netfilter.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	onLeaf <onleaf322@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] netfilter: ipset: exclude add-path GC during resize
Date: Tue, 17 Nov 2026 18:27:31 +0900
Message-ID: <20261117092731.14656-1-onleaf322@gmail.com>
X-Mailer: git-send-email 2.43.0
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

mtype_resize() copies elements to the new table including their extension
pointers. Garbage collection of an expired element in the old table after
the copy therefore frees an extension still referenced by the new table.

Commit cffcf57bf03c ("netfilter: ipset: exclude gc when resize is in
progress") prevents the delayed-work collector from running during resize.
However, mtype_add() also invokes mtype_gc_do() directly when its target
region is full. The packet path can enter this call while a userspace
resize is copying the old table. It then frees the old copy's comment, and
collection of the published copy queues the same object for freeing again.

An unprivileged process can reach packet-side ipset add with CAP_NET_ADMIN
in newly created user and network namespaces. The resulting duplicate free
was reproduced with KASAN on x86-64 and exploited from UID 1000 to UID 0 in
the initial user namespace on a non-KASAN build.

Serialize the direct collector with the same GC lock and honor the pinned
table's resizing flag, just as the delayed-work collector does. The table
remains pinned by uref while the lock is held.

The issue was found through AI-assisted source review. On the fixed kernel,
the same copy/old-GC/publish/new-GC ordering completed without producing a
duplicate object; /etc/passwd remained unchanged and the test ended in
LPE_FAIL.

This change was prepared with assistance from OpenAI Codex.

Fixes: f66ee0410b1c ("netfilter: ipset: Fix "INFO: rcu detected stall in hash_xxx" reports")
Cc: stable@vger.kernel.org
Signed-off-by: onLeaf <onleaf322@gmail.com>
---
 net/netfilter/ipset/ip_set_hash_gen.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/netfilter/ipset/ip_set_hash_gen.h b/net/netfilter/ipset/ip_set_hash_gen.h
index 80ca523f304b..70f768ba7b44 100644
--- a/net/netfilter/ipset/ip_set_hash_gen.h
+++ b/net/netfilter/ipset/ip_set_hash_gen.h
@@ -1009,8 +1009,12 @@ mtype_add(struct ip_set *set, void *value, const struct ip_set_ext *ext,
 	maxelem = t->maxelem;
 	if (elements >= maxelem) {
 		u32 e;
-		if (SET_WITH_TIMEOUT(set))
-			mtype_gc_do(set, h, t, r);
+		if (SET_WITH_TIMEOUT(set)) {
+			spin_lock_bh(&h->gc.lock);
+			if (!t->resizing)
+				mtype_gc_do(set, h, t, r);
+			spin_unlock_bh(&h->gc.lock);
+		}
 		maxelem = h->maxelem;
 		elements = 0;
 		for (e = 0; e < ahash_numof_locks(t->htable_bits); e++)
-- 
2.43.0

