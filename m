Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177360;
	b=KCKAkFi6iFKsnQikPprMVhyMAXFda0we9OOFf9FLCZAYy75oHLIuippKohE8Tw6IftkQ
	 M9z/2j+JQjYGysFwlw609bqW4iXIVg4DqYT2IgVD8IzI+7x9NX4Bo0/exA+82D5ksSjtt
	 xUJ0CDtBEK2ruU2sTQ9aHZD57deuov0VrQ8gohGvWljFhIX838dvI6SGfY64BSGLXqnys
	 0skspJMhHwonphvgff2jZ+ZOUWkkQEyxM6+LH0SagveXCYxCdxTwQSHGRy3MzVDMhbZTw
	 bnU03MZSAcs84Nps9Fi/ZfNtdw2HTSwUj5v9+ufoES4VIkADg1ffRW03NbPgXo3a8lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5NOPjmUBERfG1JdXLBN4IOoecv+cO9goNy7l1WkTKWA=;
	b=Y/+ntnmbEd9RdVDKghWxqLvrAHl7ucJyGQr2CBIOExhRENex0mkFnOPTrPHdxMW2Emv/
	 Frcp0ybYFK4tGNxUM7cu0RxHJcShfGM/P9dwXKB+AjkYcDEdxnAxrnno4rSJcDU3eL4/z
	 pbmHfch0MDIQyWpNEry0VHM+ZDaEffgnZpkSVmoFYCqEFYh7+yU7upMyr4b1laIUymB2R
	 uYMIz4S39biFTm/fox9AwDT/yGgu9WlFJez1f+YNXGxCz4FwsRCBMPNVq04jsVsMCrtoY
	 9oFGVu5GtxoQjA0P26e2B9Q5VAD8H8Wn3XK4kaKGC/4sPxw1yBRe9GZSWyY+4rPgoxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A8JriAvH;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D59606A325
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D59606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A8JriAvH
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4cdc606b47so45059766b.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177358; x=1794782158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5NOPjmUBERfG1JdXLBN4IOoecv+cO9goNy7l1WkTKWA=;
        b=A8JriAvHV/abs6G5nqD27gaqULltoJJTI4DeYI+q4pB7vLK0kRihCFrJFQA9T4twyI
         dDwW5o1dJCAJEyoYH3rWRd47ksRVzVl2qt5nRE+Obo3HxWopHiI9GcDYKQkhVNQ4hAL0
         HJStySiqzgE2zW9Z133uKgjHrjlqgRug5+XnHGhvO4FPV5skyLNU8yIMHmyd8hg6V17B
         PxO8muYQIjFWhJA8XraWNJVn3GREej/ysMvpixITAxN6nOVjUExOJaCp95vcwYXC2L7C
         gWVKOVxbuXPYl7YNOx0TnUvafeY1Hy/jkVLsd6VJeLMyPHnZGvkLIAYXo2yV+wEEQiom
         nkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177358; x=1794782158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5NOPjmUBERfG1JdXLBN4IOoecv+cO9goNy7l1WkTKWA=;
        b=aVGpmiXztw6+otRycacgSssBfLkO1zsyuke4+2dZ2bKtaCodrMoIP3mbjVwLqJfcwW
         rPMcrgAMBahjkt+qw0iH9iZvxTJgvNLFDYCEf3vwP02o2EZ87BoojQd+eMLUN58aMTHx
         vGpTbAByzUNjpKcKuAh5FqWbBNnJtu6bs6Tn0bEMptLQ/yjXfbUHEvYduoIFZeCvRGe4
         aHZ902N/2FTQ3gUkxE/oYf55xMqjTvc+aL0qLcKIpEX67eBRU17/GLBC9jLJwHJRT/KD
         IIj/4x2kXuMIhji3W556Zqb65wmJnpf73WVQHzg5Jc3J4sBzF1Xgvr7SI1W+yIUBeywg
         lJTw==
X-Forwarded-Encrypted: i=1; AL+hErH56pKxzVBv3/1bsTACc/uQ+9fkJiVzjyrp/FT8zPa2I3TsEKDypL4bY5VF7dQ9vm6MYMEqZ7APuAWTdRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lOrShDjCUuwc1oHPoZHbWR2CAvKU0UYikfnvhMH0GxUYNg9HQ
	kolXpCRMCFZT3eKoHhOrlActPe6VpxUW5soql5CeUWZ/313NpH8YFz7m
X-Gm-Gg: AYBFou0sTvSWReA1k3dyxFoglTZaeFZRlBj9mmzuvbNkEH7Ry6aj6QkcM1dJhsgB+zx
	Lgx8qG8NG2GYfwbdbHgoSDDhlExlE4v6YFm/2k0mFcTWMzzT6kMVf+ffy5YmGzLgKb5WbuBgVYP
	AdvvN5N1r4NgFYFiFLsUXaDOka6W8TaDvwU8dD7F9ct78BSQGe7/AQlMOJ/l1Gg54HFFVN3bMJ+
	SZu/PPvGEpdEVWgguftwxnW1rCDABG+wKL2MrWxmOvZrV8AuwkhRj1xnv/x1521phyRC7eSJprJ
	T11ZyyHHUcE5GuL7n+YOA1fPWZlKrTBka/fFUTpx0OXd1YlrJEA+wKMR2ArrjE2vzeQiPWFBsKb
	mtJvuQCW8QosmNLY25PGOVT7z2iccdQaWyyyUzCXx2Y2zGf0HBjTZY5l318GkPsU/UxvYLAeLLe
	55j4P2S2eOF5rcC38J1MFOmR+f9n1lscemzsV4hu0KvNmwyQbLT04S9paM4ICTYoIsGFDlvZPga
	vlw4Zg99ejgB6xQeSMtE9nLt3PYx9r8/2ROkajC3OekTTJ6vTpNxYZE9Sut+fzRDj7AUrEE/IDA
	rBKe2xPgH5ZMdP9mKWaPxi/EBJbMQXStZJnoBCDqReWBhnGV6beVUKDHJ4ksZdBHhMGexn8=
X-Received: by 2002:a17:906:7953:b0:c3e:34fa:611d with SMTP id a640c23a62f3a-c4d6db15eecmr154636066b.35.1794177357694;
        Sun, 08 Nov 2026 14:35:57 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ebc7b0sm859272a12.14.2026.11.08.14.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:35:57 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH 1/9] sparc32: inspect every PROM CPU cache geometry
Date: Sun,  8 Nov 2026 23:34:11 +0100
Message-ID: <20261108223516.1125534-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108223516.1125534-1-linmag7@gmail.com>
References: <20261108223516.1125534-1-linmag7@gmail.com>
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

Cache discovery runs from setup_arch(), before secondary CPUs are online.
Using cpu_online() to terminate the PROM walk therefore stops after the
first CPU node on SMP systems. It cannot determine the largest cache and
smallest line size across all modules when their geometry differs. Sparse
logical CPU numbering is not required to trigger this.

Walk every PROM CPU node on SMP and retain the single-node UP behavior.
Start at the first child instead of skipping directly to its sibling, and
track whether a CPU was found independently of the end sentinel. No mixed-
module hardware failure is claimed by this change.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/mm/srmmu.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index b491d7b32891..49d41b33aabf 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -964,17 +964,18 @@ static void __init init_vac_layout(void)
 {
 	phandle nd;
 	int cache_lines;
+	bool found_cpu = false;
 	char node_str[128];
 #ifdef CONFIG_SMP
-	int cpu = 0;
 	unsigned long max_size = 0;
 	unsigned long min_line_size = 0x10000000;
 #endif
 
-	nd = prom_getchild(prom_root_node);
-	while ((nd = prom_getsibling(nd)) != 0) {
+	for (nd = prom_getchild(prom_root_node); nd != 0;
+	     nd = prom_getsibling(nd)) {
 		prom_getstring(nd, "device_type", node_str, sizeof(node_str));
 		if (!strcmp(node_str, "cpu")) {
+			found_cpu = true;
 			vac_line_size = prom_getint(nd, "cache-line-size");
 			if (vac_line_size == -1) {
 				prom_printf("can't determine cache-line-size, halting.\n");
@@ -992,16 +993,12 @@ static void __init init_vac_layout(void)
 				max_size = vac_cache_size;
 			if (vac_line_size < min_line_size)
 				min_line_size = vac_line_size;
-			//FIXME: cpus not contiguous!!
-			cpu++;
-			if (cpu >= nr_cpu_ids || !cpu_online(cpu))
-				break;
 #else
 			break;
 #endif
 		}
 	}
-	if (nd == 0) {
+	if (!found_cpu) {
 		prom_printf("No CPU nodes found, halting.\n");
 		prom_halt();
 	}
-- 
2.43.0

