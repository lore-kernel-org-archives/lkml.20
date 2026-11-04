Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811468;
	b=DQ5V5pifb8m1EC++eIvhIAz897Dl6++pCkuzwWP7B9uILpyeHmFQl5RFnR36c2jN2A3G
	 OeDUvFZpJ5i0Uip2xd8MSWYRC52LgZ37ZV6SlCLxixhUd/loUou1NBf2JLOr8YEV1fiFW
	 4mNnxkmB9+fdfU6QyLZlLMTLBMyL041F8bk6qCxyzCmJyaWe8GSU1SzCK5QIGq8AVuf+L
	 cRVqj+Hn9Amhrcs8RhbCJ/BDQPjeQd0YJMhygGgQB7DB+I1lcdr/WCgERTDPTxL6l04rC
	 uRcwo3mA6wXvo+3z1SChL6uRdH7Xf/nZmqwNAOgZ6bERwYLGc40I5tDmid8EKQryhZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HYFy8sOOELLyqP//oMKFGSpOITyv86S+D257oV2UNCY=;
	b=XO4OcJr2SyjNpbWbX0LEvubl7Swti2QRnwlmHP1ptGwbY5zZTMUZkvoY+Jc9eIExDYVk
	 Laq+lJ/yuDLx1EHHSlhCnYPVKZKRAbkHmc8QXNXZh5lAn0uGWb1jTUjDxmDA6L2JNXv9P
	 TUtaWbPll78NEAMQQOUGhCHy4GnKPui/W+S45FcPwi6gp1bSn2z1dwRdQnvjkQOqRt9fh
	 L94pyqw1PT9XIwT+G8PmSoCsWiw5ULKS+js6ahmTGLDM5b6TC1v5sdFClA9/CAyq0hoHh
	 o+yrdJS950GfOCYb4lutklhGacUis19xbizgTV8HgEEQv2zwhCASRXYauYMFW1bxYzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+yZfRyu;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903DA606D824
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 903DA606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+yZfRyu
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36661f953e4so1259121eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811468; x=1794416268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HYFy8sOOELLyqP//oMKFGSpOITyv86S+D257oV2UNCY=;
        b=H+yZfRyu1YpjAqnbnHiKh5xNTmCDYDOnNqBVbKlooMK+sxvVJEQXqGJdt2ppEr1oHx
         t435KiYlxJLi6R2A+7xJQKVHU0bpd0p4PwvDNarn62o3341CZREK7JiPVkwmMKTVkZNz
         BPuL/XdarsAwqfDbJv8Ra0M5t2G1eDT8Op+OY5grEIwd/imbjAuY5jPGa59Euw6GYLM9
         GX5rT/byFl19eCTBAowU9TiUfPVTY8CrphI0yYByVAzBDZsS9lwj0htyPQuwfm1cCYSJ
         jFIBEzQv/l9itvS6ELOYrAx7w4GDmZWPFyGVpIPncbIFaiHeSVl0GE9j3rCjCkbMz4Zs
         sfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811468; x=1794416268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HYFy8sOOELLyqP//oMKFGSpOITyv86S+D257oV2UNCY=;
        b=T2hA9a4YtYilJSyn85vGxUPpVIh96U+wDNB7mdMmtoltjSSMMvUSlRXdKU/FtrWFa1
         u3dlq6o9TXhqMeLDrx4wAuAatYFbIgM8Wsr+OJS6Z88zuJxyggLkDOwNsx3x7DuJA5L2
         B9GZCZqqpI5GjQxPOrQZsvxzjkmyOm8yqVR7cgfXu7wu/HFSSjaMYZLasJmrYnmU2ir3
         2LJgqduaYcMHnTpcWIU8J5rRsK4G4mcnSlDn++bEFVuOXIUCzOWZvyaPuCE5/gVMbOXa
         eLTjHTgphAhtHmNrTBW9Q2h6+jMqvFZSqP7iQhh7yiIdB3zYH6+KH4LPx9av6nHhzviB
         Yf6w==
X-Forwarded-Encrypted: i=1; AKwUvBxiNPHQgExJrOwZwBbPOaM2E1ffhWZPNzU+HQ4fOD8EHrbFOS6BbhBwbUcSq0uW8BzkXf+FLelnwMi0Bik=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VmBsDlgyBWwS/R9Im8tRpEZfybma/nkNBEPbkJ2sLQiWpywOo
	r04uNm8zuPoWl/8I9Rh7QZewKkP39xsUh01acZJGCe8E1+KkPjmQV4ru
X-Gm-Gg: AYBFou1KuWUnQ+c3Pkhcs+XRoLJ4WbaHcCTIhEWFRiPHP06xWialv7VboNFe2hE5r5F
	k28WIdhxsDO4ZXcgz14WF1aTp489Mk4MoSEY/+CbeF2e0IYAzI1HctD+SGDLfhQ7L1l6nRUCv3R
	j9nqxUMXgrSpz1CMxu9tL+M7aTXuEkEIXs0HNt1nfCm5f6ESh4d6QyZMi3v4IB7GRkcKjfidR0/
	KCd91iACDf23GVL0e8ZBepv/mlNh5TDz23XBE+ofBQF8vDFGmSdDxbyErw913C3OhRIKvdiGcwS
	9Nww1eDEakKqetnSa6Nm3mU1aGv/nRW/Xiw3+tlCoR0zQZSUlMCVRvur7w3hvyaky6BkxrzJUp3
	U38HAY6enET1p+ScygGGzCCVn3tYhRAKb3nhEyZDi6s3Afkln406ILql9YR18pED4k+WDEH2QUU
	IgkVbJ6Hy4jH8mecsHN4t2jdaNAOZY4UctVfQaFiBgLNlsizxMaI6aTgnAttOTSf46uHmPmjAyf
	HqWYmoLpTg6Z3RjJLdJCpR/a5tDvK8cyww+kmxvS9pBqL1zLJsIUw91lj9E/VdUAas5NZUyJxlq
	EekTqB/E8g49QGBP8jTjGmQemkFMC0OgpMmb1MA=
X-Received: by 2002:a05:693c:87d5:20b0:35e:7bfd:4613 with SMTP id 5a478bee46e88-36a42425470mr24210020eec.40.1793811467022;
        Wed, 04 Nov 2026 08:57:47 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:57:46 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 16/28] Documentation/litmus-tests: Add hazptr drain engage-wildcard test
Date: Thu,  5 Nov 2026 00:54:34 +0800
Message-ID: <20261104165504.2430480-17-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

Model the drain engage's wildcard defer: if the engage reads a
slot holding a wildcard (an in-flight slow-path acquire), the
engage must not complete for the target address.  The smp_mb()
pairing between the reader's wildcard publication and the
engage's slot read forbids the completion interleaving
(herd7: Never).

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  5 +++
 .../hazptr-drain-engage-wildcard.litmus       | 44 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-drain-engage-wildcard.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index c2bf20fa4092..daab126e45a2 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -110,3 +110,8 @@ hazptr-wildcard-flip-escape.litmus
     Test the in-flight wildcard window of the single-pass wildcard-flip
     scan: a straggling acquire that published the old wildcard after
     the final walk cannot still load the unpublished object.
+
+hazptr-drain-engage-wildcard.litmus
+    Test the drain engage's wildcard defer: an engage that reads a
+    slot holding a wildcard (an in-flight slow-path acquire) must
+    not complete for the target address.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-drain-engage-wildcard.litmus b/Documentation/litmus-tests/hazptr/hazptr-drain-engage-wildcard.litmus
new file mode 100644
index 000000000000..0cee89893dad
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-drain-engage-wildcard.litmus
@@ -0,0 +1,44 @@
+C hazptr-drain-engage-wildcard
+
+(*
+ * Result: Never
+ *
+ * Models the engage's wildcard defer: if the slot holds a
+ * wildcard (transient value 1) at the time the engage reads
+ * it, the engage must not complete for the target address.
+ *
+ * P0 (reclaimer): unpublishes head, then reads the slot.
+ * P1 (reader): publishes wildcard (1), then replaces with
+ *              the target address (2).
+ *
+ * The smp_mb() pair ensures the engage cannot observe the
+ * target (2) while the reader still sees the pre-unpublish
+ * head.  This verifies the publication ordering that the
+ * engage relies on to defer when it sees a wildcard.
+ *)
+
+{
+	head = 1;
+	slot = 0;
+}
+
+P0(int *head, int *slot)
+{
+	int r0;
+
+	WRITE_ONCE(*head, 0);
+	smp_mb();
+	r0 = READ_ONCE(*slot);
+}
+
+P1(int *slot, int *head)
+{
+	int r1;
+
+	WRITE_ONCE(*slot, 1);
+	smp_mb();
+	WRITE_ONCE(*slot, 2);
+	r1 = READ_ONCE(*head);
+}
+
+exists (0:r0=0 /\ 1:r1=1)
-- 
2.43.0

