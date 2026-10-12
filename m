Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C14389DF0
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830933; cv=none; b=hb3Hvu0Aa4yHr/bj6gEsqid+RoLUhuLIg1wWKJRjNlj2Ux8UecaD8vA7m9OOIjV3mse/ZAf1EHr8+FhNu4gh/ZXJjlo442+9yZJtlqWzsveiKA/ZK1byzsmQeWMBQZPiTnQO5A+5Qv5qqqKpiZuxM6MzRmtEqYteKCGVJIxRBCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830933; c=relaxed/simple;
	bh=lHqcE6L/05Y5Gh1t1RuDhITcXofphAcppq5EmdQFuLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BrR15AWEGGHF0K3eH4NZnHCwTTQDidtMaDw4Zh7olA7WaMwJa0AC2S1oS+UOm70EH4GmR7VeorqG+4azr0+lda9iYaOaCu84TSDiwkq6ipb9WF2+XhXNRX8RRkC27y+QOFG7nGqwApF1aqcc6O7I7f9X+4/Q8TmzXrsJjQR9UXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvuY6mhq; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvuY6mhq"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e7496f947so347877966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791830929; x=1792435729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9gLypezyadrnh0M08opMU0Y8wfZpigwqaTEA/o05oR4=;
        b=EvuY6mhqmnypJ0n2Q2Fp++Ax9En4JybsvGIqnkiTt8bUda9JnoUgoEunpGUnUWIyQm
         7uhsxchtkzG2euYZly+A0xSeDs31XF6WBW2z8TaXC8IyS6bqcbvYdYoqQkLjnG2llp0M
         NmHazujB73v6dFUUFMZB8ebT1p9uQPe3D1oQ2efn0dE8cnHytpKz8IMhH6XjfBg+yUjT
         c99Ccu+hHpeMoK/LXmR/4NTIcrToEjNqnFa5e33Jhd9EyEN+/2VX+3gmwCD73XWF99bW
         VLEc6dv8UBfziVMiLqjed/UM3sSD38GghhQxxQM3vdd7gZB2o/FECwgM/vVbIEf5FQEB
         af5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830929; x=1792435729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9gLypezyadrnh0M08opMU0Y8wfZpigwqaTEA/o05oR4=;
        b=zGVsJHhp6qklkILL2OgExiUlmrykczZnVPg+JaPbg7A9PWGulPjcaENprC1iPvx9dH
         HpbtL+iAxyj4BS5B5H5foJrm0IbxkVadkLStTLTCS5EmQdzAuiyG5dLP2Ssvf2RlA4Tt
         9tVLOTZXW37/eaGMWoRyuwhIVmOScuFnQn7tgQVUyzJPisyIspABgW1cCw0DV9CKmYG8
         l6hWNmMoWaz7KyBrxS+iGdiKa18hwiN217P1XWAStaayA4zmS99sVrLCZtFxVT0T/sp4
         2AmFN31+TkB/ZM0svmpM7zOQ+WrvMXcmfnln5099iHQSb39E5OH0dmn26syI2sRakFam
         u96w==
X-Gm-Message-State: AFq9FYIUMSE/zIRkI6mq5CHrzo+nYd9Y1L2Hoi2CPtMez2PBWzodlWgw
	/1h/mmer6UArs0foFC4Gmx1TC4CkhI+qAxcbd/o85+XaRipITyjfm5uT
X-Gm-Gg: AYBFou0dsm+IHRWmgVLhh/ebE5ZOn7ZJyIHBeqfDokBTIXgq57FTnPhRj403jJLIqVn
	GQNAHb9txR5cO38MLc8PvvzOiTncnZLFSsoWehlCGghSckOAXUO54A0uahl88sF06gKilwjhNOk
	G2I9KlKh/1g4TZzQWwLeX3kPxOZxvOA2mtbWYCXDEzM/6/KZB8wVtObimuaTWOScTgecW1d+jLG
	D7TIx9aZn+HUl3HuYaWwYc9slFiA3ZXEhnBDiq1jwtZRTy7sIfEfreQ+UjKN7LKoeW0jqtRfCZ2
	vlRIWx/whKfFAEdUgFkw6xRhA2/EG1Xkgi9P+doEFbZ6QDy3CjCGGfXZwo+UI7P8fq0FyI4UfPl
	NRinSReGjN1eX5SDgBlOXZ3GyTpRPpGmi7pXauiHWcIXYX3p3SutTuJZSP97z/kn+HEWsbWMlyt
	dtI35aCJaZFfXRqWx5r6ax9r5oX+wyj//R8pT3zLae9oRhQl5sCgn+1DH4pWINLY0dHJ0Q0kS3+
	mmfC4EhyXcmGwgErrilx1eWnQ+uaFuGKV1rLoKJaXCruxVfAwTM
X-Received: by 2002:a17:907:3e0d:b0:c2e:80b0:deb3 with SMTP id a640c23a62f3a-c31a9a10e74mr1102093566b.7.1791830928881;
        Mon, 12 Oct 2026 11:48:48 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9aa5aa7sm488517666b.55.2026.10.12.11.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:48:48 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com,
	sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	krzk@kernel.org,
	oleg@redhat.com,
	linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3 3/8] sparc64: avoid huge kernel PUD mappings on sun4u
Date: Mon, 12 Oct 2026 20:48:04 +0200
Message-ID: <20261012184826.986050-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012184826.986050-1-linmag7@gmail.com>
References: <20261012184826.986050-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel PUD refill path merges virtual address bits 32:28 into a
TTE, requiring a hardware page size of at least 256MB. On sun4u,
kern_linear_pte_xor[2] and [3] instead select the 4MB fallback TTE.
Consequently address bits 27:22 are lost when refilling a huge PUD.

Keep the kernel linear mapping at PMD granularity on sun4u. Its refill
path preserves bit 22, as required by the 4MB TTE. Leave the sun4v
mapping selection unchanged.

Fixes: 0dd5b7b09e13 ("sparc64: Fix physical memory management regressions with large max_phys_bits.")
Cc: stable@vger.kernel.org

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/mm/init_64.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 103db4683b16..0ae97e616435 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -1696,6 +1696,14 @@ static unsigned long __ref kernel_map_hugepud(unsigned long vstart,
 static bool kernel_can_map_hugepud(unsigned long vstart, unsigned long vend,
 				   bool guard)
 {
+	/*
+	 * The PUD miss path propagates VA bits 32:28, assuming at least
+	 * 256MB hardware pages. Sun4u uses 4MB pages here: retain PMD
+	 * mappings so bits 27:22 are not lost during TLB refill.
+	 */
+	if (tlb_type != hypervisor)
+		return false;
+
 	if (guard && !(vstart & ~PUD_MASK) && (vend - vstart) >= PUD_SIZE)
 		return true;
 
