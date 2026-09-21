Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F81364EB0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970432; cv=none; b=AGbEGTZlBNXpBYTrRG5NLf/zDMEQpyKNggnNO/gVBFbfJhyTpjpIJSp82CQ8wdrmGjJCIcOjPpbVIS7IZMtjcx5eYQmC3/lq1IOMsjAmoOrE4Ymul3+iQNwzuZ9CL2yYyg4nY9ohVXORgcY3GVj2gjDoRtJkLYnts+KTh4r8u08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970432; c=relaxed/simple;
	bh=AXpA8RvM6kawDldLMecY8xFEc9YXqrk/NMuGudPk2vw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eXhtZycrk6EJDHWIOiLdzY9aerv6lpTO8JSJtA4BqaIq+hm04aXOezJYQ7f+pEFmyzlk+fhGueUDszHZqackN+b5vTAHd961umEQxkYFG+NpNaqUhh9IhoeZm4uUUpwJYc9CeYVqlFMEXSG0meTOTYyt2wZGDxdHiIi9AKfW5Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAcup59y; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAcup59y"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so12530415e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789970428; x=1790575228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bdaDi91QTKJpghjSNCi+hMWuT0eZZ+v0mEr89udI5Ug=;
        b=MAcup59y/ffFJqBeAJMLbX+89i12USVbtQsDgXHAk3nb1VfWUm5kf7Jiaz3+N3jS9d
         +VtTcVEHS5ghGWnd6yzHD2qNM0F+PsxXvkltvmKhD4HVCGhWbnmXNsKgq0bX2aMQudmM
         wLIIlefJWERIT2vMJzmkQ4c9YjeHSRUbzPDJ0PAO9QXVO2+TnljPipjsqbJQc0QTquGk
         VXCy7tOPsEZK7Edv4bLQo0tXI4BUThvfxN8vfin8uH+MAP73V/sQj5tbU1CgZTHZYPa/
         cc9RFZ7qREjsYsi9YS1gT7MfCoXOAo7OQK7L5h+BOXYGvKEZp88BE+pJxpDjkvOFW/CB
         cz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789970428; x=1790575228;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bdaDi91QTKJpghjSNCi+hMWuT0eZZ+v0mEr89udI5Ug=;
        b=cKgUtfWO2GFJOENZ5lndQtpUZSiQ6eaqH2I3j3pZdZDqAD+CaYDZ5mGV+ivf/xCkEn
         MZJUj7q4H66biUByLhqMlgN+PldmU7tYbonqJpkgvelpP2xyKnrXENmEjfAAvoCpdYii
         cZLK4wbWOYzHa/CY70zZcPW/h7L5BlgRZ86kIxgo7192HpIAfYCh7iFK+pQs8xa8XYJY
         0ckq3nDAu+Hqp7SaEWgQP96+hd6XHJ/jed1EcnkBhc14AqpNmjDQsdsBYMS3BMdGYLD7
         rFg5Mt7Bd2xONP0tsa2IMpV70Eua0ZXrTZZ8QPrfh6H6DOoYNy5Uu+bo26A4eNVYnrA6
         XhjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTk93EnSBvL7eZaj7t910CO7WjqErXeA5QpbdLONG51YlHrUTjUnBUtvokX/ISqOErmcc/Zzz7QYVNmy0=@vger.kernel.org
X-Gm-Message-State: AFuF++llsOQlL2vUWFJe4sgnCnhVzViftWkYxUbp4rWW2UPJz7OvKefj
	vUo4gCy3OYuqeMsELAFhqVF468iy+TjiLkPCxCoHRmmrRR5v1MJotwhd
X-Gm-Gg: AYBFou2vS9+/cbdstxGBIuIiIxyG8prEiJfhYcRzTHzgyo5xYsq6gVOj+SNMNyGDudh
	O59uLPwBldIiZt4DmwuPAYZeaE37SRhKwma4dcMibFSs1e4gTAnQTMydM5SoC7BuDS0ZuJ4Q00c
	E/FZV6pNeOfOnf7pTSCvQ02MdUIZaez3U5oTeCA0L/bxWGG7ykE1nEfWrPnlbPXIH0LCQ0Q/IWG
	KV6vx3y+ILZr7x54Na2Dk8AtiVwaxpatntOMvPlC1Pc/ukfIScDN/3BUwfOGxOUtoacTUBRr3AD
	aCIyLcHaLCD361g2pp/tOoDWtcdYlpTxkkdtxkJc6re0GhKNXL3Lh8lZoslXbOGctCDmDKQKqPz
	BsUlY7/AMZoUHADVsb7FQ5LsheB6YF7AH3qMrWF0jk8M6ziZ6PZdWFaPSqEdF4IY5NxqimbP8fN
	4KuAhctAsJ57oTrHT5+wjuaXmAD/jyEwA8sq8cz1WaUR/sc3Y7v2rEnQJLVW9vS/DEExhkWdZfm
	xls0hoBn4zJqyIjKXTCMpxE8ykefvjzkUlsNChyGEc/AFHpwOCtNorNxehi1xOSAb3xd4Mkc+Yg
	8U9Ww7N0L8FZVPgEqFvm+Sbgl8jjveUtKk70nfW7ZE3jDGYxCmPiRjQ/Qt0ASbubHlKJZU7m5Kl
	Ujy0=
X-Received: by 2002:a05:600c:46cb:b0:49e:660a:935e with SMTP id 5b1f17b1804b1-49fc586827cmr115985055e9.29.1789970427187;
        Sun, 20 Sep 2026 23:00:27 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8e9-c501-f941-243b-87f6-e5a2.310.pool.telefonica.de. [2a02:3100:a8e9:c501:f941:243b:87f6:e5a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd1149e0sm198706585e9.13.2026.09.20.23.00.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 20 Sep 2026 23:00:26 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Radu Rendec <rrendec@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 3/4] ARM: cacheinfo: guard the CLIDR read in populate_cache_leaves()
Date: Mon, 21 Sep 2026 08:00:12 +0200
Message-Id: <20260921-arm-cacheinfo-v2-5892c4531ad9-3@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com> <CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com> <20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARM1176 and ARM11 MPCore can be reported as ARMv7 by
cpu_architecture() even though they lack CLIDR. populate_cache_leaves()
therefore needs the CTR-format check used by detect_cache_level().

DT-based early allocation bypasses init_cache_level(), so its check
no longer protects populate_cache_leaves(). A combined ARMv6/ARMv7
SMP kernel can reach this path on BCM2835, whose DT describes its
caches.

Share the CLIDR capability check between detection and population.
Return -ENOENT from population when CLIDR is unavailable, preserving
the existing absence of cacheinfo and avoiding a new topology warning.

Cc: stable@vger.kernel.org
Tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lore.kernel.org/r/20260912195552.76673-4-kmehltretter@gmail.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Fresh full-series rc1 retest: three builds and seven QEMU boot/CPU
hotplug checks passed; see the v2 cover for the matrix.

The detailed testing below was performed for v1, before this rebase.

Reproduced on QEMU realview-eb-mpcore (ARM11 MPCore, reported as ARMv7
by cpu_architecture()) with a device tree carrying i-cache-size and
d-cache-size on the cpu nodes like bcm2835.dtsi: with patch 4 and
without this patch populate_cache_leaves() reads CLIDR, which QEMU
returns as zero, so every leaf becomes CACHE_TYPE_NOCACHE. Real ARM11
does not implement the register. With this patch the read is skipped,
the boot is silent and cacheinfo stays absent as before the series.

 arch/arm/kernel/cacheinfo.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/arm/kernel/cacheinfo.c b/arch/arm/kernel/cacheinfo.c
index 31591c947254..993c8a134786 100644
--- a/arch/arm/kernel/cacheinfo.c
+++ b/arch/arm/kernel/cacheinfo.c
@@ -80,19 +80,21 @@ static void ci_leaf_init(struct cacheinfo *this_leaf,
 	this_leaf->type = type;
 }
 
-static int detect_cache_level(unsigned int *level_p, unsigned int *leaves_p)
+static bool clidr_present(void)
 {
-	unsigned int ctype, level, leaves;
-	u32 ctr, format;
-
 	/* CLIDR is not present before ARMv7/v7m */
 	if (cpu_architecture() < CPU_ARCH_ARMv7)
-		return -EOPNOTSUPP;
+		return false;
 
 	/* Don't try reading CLIDR if CTR declares old format */
-	ctr = read_cpuid_cachetype();
-	format = FIELD_GET(CTR_FORMAT_MASK, ctr);
-	if (format != CTR_FORMAT_ARMV7)
+	return FIELD_GET(CTR_FORMAT_MASK, read_cpuid_cachetype()) == CTR_FORMAT_ARMV7;
+}
+
+static int detect_cache_level(unsigned int *level_p, unsigned int *leaves_p)
+{
+	unsigned int ctype, level, leaves;
+
+	if (!clidr_present())
 		return -EOPNOTSUPP;
 
 	for (level = 1, leaves = 0; level <= MAX_CACHE_LEVEL; level++) {
@@ -150,11 +152,10 @@ int populate_cache_leaves(unsigned int cpu)
 	enum cache_type type;
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	struct cacheinfo *infos = this_cpu_ci->info_list;
-	unsigned int arch = cpu_architecture();
 
-	/* CLIDR is not present before ARMv7/v7m */
-	if (arch < CPU_ARCH_ARMv7)
-		return -EOPNOTSUPP;
+	/* The device tree can describe caches CLIDR cannot fill in. */
+	if (!clidr_present())
+		return -ENOENT;
 
 	for (idx = 0, level = 1; level <= this_cpu_ci->num_levels &&
 	     idx < this_cpu_ci->num_leaves; level++) {
