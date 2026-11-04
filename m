Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793824962;
	b=wI7fsl88pK7hmsxUZoQhBnqrifchaaV5f/mIYXvFoPXYFvAdq8B+R0ziphQX0x3fRKcY
	 NPp3s8vq7Nciu/gvlj4JruZfCjvytTfM0L0bYoJ8GuKfWbb0Dx2UTKFpsbRSXUMG51ZOZ
	 2w5v3dqj+Bhnp9T0SRysA899cMXq66DLX8brB7uNvisgFIAnpr7r5QXkdx0J0+qT1zG1r
	 kFLwL2Y4821GzbfMnaLLKPXGaNBd3sqo4XJ+R8ReRJiPTCj+9sPYszKgD5FDfvpXeyk8f
	 3sNeQX1xHT9ydQADsM2A/HuceNsoCYoMqoVvzjs6HkJqVQ8nI6hd+H/Y2CwjpS5Phvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793824962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h6dwKVBh50DCzDeIRT2L9U5TfDV06YRfq9HuX25Gdcw=;
	b=Ah6TYjRTVWZItzGi5gTsKjF3bdw1h/BqqQSRk4coRv9+siq7suM0UDK+loIEgVKHI7sV
	 gr1NSIElUz83GI3dFZKVsoIBIqKlyMym54M7CT5uQV7h+3+SE0WoRxKl8Bq4PlTwFLiFL
	 JxS7ZG+VjAtTEjBrAMWTpQ/dEp/n+5XMt8zbHGZVkLWyE+baDLki0zXz8Y3DW7SMg9DXV
	 q/2j5NwazWx1BoK1/5H9iJZtC0JGOiWJItFRHghvP45W+/YBek+WelPKNkvoQZnLjUMuX
	 6tKH6WB39zLRBsWiXnEnBEBrrBPH0HR2imE6xAN4GDV0w+CTIVQeE/uCy12VlL0Mt2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jy+nCzPT;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D14606AC3D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D14606AC3D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jy+nCzPT
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so8376665e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793824960; x=1794429760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6dwKVBh50DCzDeIRT2L9U5TfDV06YRfq9HuX25Gdcw=;
        b=jy+nCzPTOhrQXB/Hv2iczYzO8CYB7TExusym3+qGfuyVkzge3vTqTobuwLFwtz+5xW
         dY+/Tieg5C7PV9S18O99QaCzW7th9sVpyoNhQr+qHqBqX7cNpbsR0vmZrZD6P3unTXT3
         02SnKXHoF84lpCoIptklFUYcN6MlnSfADFVvTrDQhW3e9A2kzQ5XLg2ZvhhQ06fVYAgJ
         rA/z7ihQN+PNxiQP36ERe0sailT/sMlzSd6r5gzZRUOHMCTYRzQqHrnBWM36+k9lSxUZ
         wxWMx3pw6lHB38v907lIl81x5WeYHUsohFC8Zzllr2d0H42CgsJ/ji7WKA8uuWbAm+r7
         IS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793824960; x=1794429760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6dwKVBh50DCzDeIRT2L9U5TfDV06YRfq9HuX25Gdcw=;
        b=mMcmEzukp3fH2VpYO0RjnjciuDKkx05JDhNCUABmBwORHjCwOHqBco4mQTveNKyIIJ
         zbEs9PAks/tVfg+vGqfqJ5sXpAo89CS/F7cFJG2EAcJ4wh4numTAi6ubxcjTH13FBsMa
         1L0k+QXUyf9sMqWzK273mbSH8F9SNsGudby7xlgpc5p6fTHpazM88M/3TxYjUmlx4qxx
         L2MFMKj0ygglCXhEbEpaqFKxTLj543UobzBQf22HxDwgfQIYxyEPbQriyJjADPcXYqP7
         lRXJmOJyhttxVWdAtiSsLX68coxrQZ588poRbQkLuqaFf7bxG5nZUOk7YbmdX1k0JlWt
         FweQ==
X-Forwarded-Encrypted: i=1; AKwUvBy41oP25KTma+bcC57Kp/DcQcYWOeDiCsc/Oq9MuJeYDSoGk+ZYUOzxULlfVUVvflFNPsRua0/OT+dyl04=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/cX058cIlA11lmOzlTpay1h7RHQXjZWD6wzHPADjPAj4mAP+2
	MyOsFMVdNmMGR2E3PdiMeUgspYQ6kSqcbPYOw6NDBG0RDZy2C7EtjvBh
X-Gm-Gg: AYBFou2yPe0C+ZKWp/AQ2Xp/h6QCwnyR6eX/bZZ4CdaYsYsrhlrDteGc/DbJjyp+Av3
	wf/f3Jib0xCDKN3nq3OmuT/3ZlX6YEDP0b8h3vsWjeKgmz1ylKhDgeNVzOCzfdT6w+PljaAaaEO
	sYU31jqFKqm3Ij6wU3uxf6j3/BEWU/D/6LrhQye9ETrjHYAYFGNZyW+LhciHRNKGiDxGK3nJ1Bb
	JrJ2JqkkjEbNpZvvZP8/oPngDIfDb8blU+DWx8AJjL8oLS2Jj8yM+HM5cYZMe5TcLbp43kTes0x
	axMvFjOe0+nuJEJV+SUXbZ33GxNEvFNExwNrDEjlUxEqUDn/UROnxrto+hknLzc6oqdPvT5qhs/
	dGH/YOGLN/tBCRmmVyf9xtJIQDEC9jjUtLJl/6uGKFkNwA/e+KASXupOE2d3fWQP3eilrXTqQEB
	Fz2k0wBojcwcp2yALqad42lHkIS2v2UMWUbO59CKr0e/ZssCTweWGXvmUwPMG4FFjCb1Nzm3HI8
	jNBWD7iTw5d5j94Bremj1JYu+OWI+KPOHNXGEn2Vdtdlm/GtlWEwAYNweVBupe16wxDjraTasxz
	/9NjReWgyJ5Ftg==
X-Received: by 2002:a05:600c:4f55:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4ac182dcba3mr424220875e9.17.1793824959945;
        Wed, 04 Nov 2026 12:42:39 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac1a1csm5716451f8f.12.2026.11.04.12.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:42:39 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>,
	Alexander Graf <graf@amazon.com>
Cc: Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Pratyush Yadav <pratyush@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	kexec@lists.infradead.org,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH v2] memblock: don't allocate new reserve_mem regions on a KHO boot
Date: Wed,  4 Nov 2026 21:42:17 +0100
Message-ID: <20261104204235.9066-1-azpijr@gmail.com>
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

On a KHO boot, a reserve_mem region that can't be revived is allocated
from KHO_NOPRSRV memory, which includes the bootmem the next kernel
boots out of. With CONFIG_KEXEC_HANDOVER_DEBUG, preserving the region
then fails:

  WARNING: kernel/liveupdate/kexec_handover.c:1245 at kho_preserve_pages+0x168/0x180
  failed to prepare memblock FDT for KHO: -22

Without it, the next kernel puts its memmap on top of the region and
the ramoops records in it are lost.

There is no use case for adding regions across a live update, so fail
instead of allocating, and drop the TODO.

Fixes: f99230780211 ("memblock: add KHO support for reserve_mem")
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
Changes in v2:
- fail on a KHO boot instead of allocating outside bootmem, as agreed
  with Pratyush [1]. this drops v1's patch 1.
- not an RFC anymore.
- based on v7.4-rc1.

v1: https://lore.kernel.org/all/20261021211058.83483-3-azpijr@gmail.com/

[1] https://lore.kernel.org/all/2vxzfqxglrg6.fsf@kernel.org/

 mm/memblock.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index a450092a80fb..e325e0542c9a 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2827,7 +2827,16 @@ static int __init reserve_mem(char *p)
 	if (reserve_mem_kho_revive(name, size, align))
 		return 1;
 
-	/* TODO: Allocation must be outside of KHO_NOPRSRV region */
+	/*
+	 * On a KHO boot memblock only allocates from KHO_NOPRSRV memory here,
+	 * which includes the bootmem the next kernel boots out of. Only regions
+	 * handed over by the previous kernel are supported.
+	 */
+	if (is_kho_boot()) {
+		pr_err("reserve_mem: can't allocate \"%s\" on a KHO boot\n", name);
+		return -EOPNOTSUPP;
+	}
+
 	start = memblock_phys_alloc(size, align);
 	if (!start) {
 		pr_err("reserve_mem: memblock allocation failed\n");

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

