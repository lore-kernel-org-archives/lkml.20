Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C3242AFB7
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 14:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791295467; cv=none; b=cUmV6y1BjqvR8Tj2ZhNLHw02JLEOFbXtlsCop+18lYhvy+K02nLd8noytSt/TO5JsBBdcjVwfnI+d+4Hd9++6WMTFDkSkOoYIwaXQEz9LI7i31rC859MvTJ4y2SDdmLSi58WxCmWLMnNQyopJUqf6tDYrHi5PTCqx5b9hzAetLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791295467; c=relaxed/simple;
	bh=STeKd4YFIQ0n3LH6A34QwIhke3uYslT6i1FZ3F874iE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EoDkEzHizVChzVnKsEY49NH4wF/qo8SNljofj+WKCK3CEiO0bgC9hiWFR6LyJ5kXpQpib1GilbkwcUo6+EM1Gw33i6vkoN43+t3NpVodl6eJvUjH01EkJxf28AcmD4q4AQcHfLIepQpyUYGTDscCs8pKOrBPeD5YqSt734YvTCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iayFEHez; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iayFEHez"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66c9995ca60so936392d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791295465; x=1791900265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJzvr3iFE3HfrvrQ99af4WvccIiSGFTCRjpk4CcYQWA=;
        b=iayFEHez4txgwuuDMUCX/7zQswdcFCYo98a74R2d1vgUC5q7IxUfzQaFQPisN+3gIr
         k60QWg8lpxfFq1YzKwTB7/zAPo9qBEzS6KRDkqNolIGqRZtmu2WTDBTz60GhJiOsxON0
         wPwHvv+8v9lykI6KRQkdyddMTpOpWyuFTGthzzOetF+Ok6SnFjoCjD60Q2TiYz31B9QH
         4jG/MNuKaXXqwfjZabZxSLfBVMflWo+8MG+iv9nkWSbPUvOqJl4lQNgXeGk7qVID7xH9
         PC9mlp+jx6w7Ugv/zzqcLUEgDiMkiNlKpENd9x8/f0hD6FaRzjHRsGoU6hUa0GrKxcOh
         EMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295465; x=1791900265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DJzvr3iFE3HfrvrQ99af4WvccIiSGFTCRjpk4CcYQWA=;
        b=PCKq8aOZ3yifPrm6OYEK81g/Ube+q1OAZRE58Wwb1Jrqqask685B3V+bJH1WgIs0w+
         f5IwQTEKn375Ov5ruVw1eM35vxi1PbRbyjnZ6VRh8a+UePuRQp9jNbPODObVzx8nKyGx
         B95Yi7c/XGXE2+ARA/Hs+PPyf92htfRS6PWUNcMJffvLrf7tDHZXfKQ6EPhnRRr3tg2v
         SyOm+jl98NzlPNqk6yXaBatA9Jv9++7U74G2QbrlLg45C9BAF5p3RrM60CqHDkCcpg6Q
         KciCUpjwn/CpfOjh7J4+MVzsTXkV7Lrp6XHv9j/F4aIJ40DbAJmnpnQyv2bI/TMOnopM
         EkeQ==
X-Forwarded-Encrypted: i=1; AKwUvByVzxuAUYpY1HHPda05IwCuAqRioDLhr7itopbR7ZC8yDN/td2XXbabFZHoQD7e9HkiiH9stFJZLK9PhWI=@vger.kernel.org
X-Gm-Message-State: AFuF++mmkMPDeLQXHumSCzDejvJ5YPv+7Ny2T+5DqgRevvVZjLW1cxKo
	8homn2nfb+xlZErbPHExeM/d+wi97Hyx5EI5s3zZAs++PDkxAs+81Vvd
X-Gm-Gg: AYBFou352fxKc2Zr6ps2oArJWt85ulOUx9xSXcGf4RRtnazB400QxpWgdSDfrwoiypn
	Pk+zpnMLq+x29qsBq9Npjh9AjftPCEvmXkxPHyQA3QVDqucp/XKv0XpLJpG9DuxG6tSwUeD+u+T
	4vBsOX8zihz0Ecn0IXyGCJQN59wKDnP+D6S0gtic8z/LuTpo/aoQ4hpixwkqHsFBz3ajTJwAk/E
	Cs6A1VWYggNBXFoPj+YZIChBl+WFgXxmYsqw0S/6Zys0Hn2IpGIVPuDVVwcL0JOgl7Z9csuGQgs
	KvKpRhLZtjkyoNfv3imI0RntVnPEMGCDYmcCATARU1vm5t+uohGFJUjE5u9T9QSc1zg8FyxHDLj
	Fd0AGjp2OM/DgCZaEU5jIPnX6J0xkNaBlbjX4uDlhFs38BKZUsAeXFDZtg3ZPUacOnBw9wd/FN/
	uPTXBt+8Ud2gSH/XMk/EgveYIsWqd4n25c5dDeFR5fqE1Wqs88nT1HGYrY3nxGuIDFFjxVRVw=
X-Received: by 2002:a05:690e:b89:b0:677:ed83:7f13 with SMTP id 956f58d0204a3-678fcc5ff7bmr633660d50.3.1791295464803;
        Tue, 06 Oct 2026 07:04:24 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b1a214sm4230624d50.6.2026.10.06.07.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:04:23 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 06 Oct 2026 10:04:15 -0400
Subject: [PATCH 3/6] alpha: clarify that _PAGE_URE and _PAGE_UWE are the
 Executive bits
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-alpha-hugepages-v1-3-a673a18aaa70@gmail.com>
References: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com>
In-Reply-To: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2285; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=STeKd4YFIQ0n3LH6A34QwIhke3uYslT6i1FZ3F874iE=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKO/L+b++pyyn2+Op2ZdyctUprYrhPf0HX01X4F20rP8
 4YBOdOOd3xkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw101sZGWbwylnef7
 jYUnThRRcX1iQj7Rvffis063E3L0p1Zq62VGdkuN+2ZZP4xrt5FxbOsnwb8ulE9Xedd9fuaN178
 GZP87Hek7wA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The Alpha Architecture Reference Manual defines eight protection bits in
PTE<15:8>: KRE, ERE, SRE, URE, KWE, EWE, SWE and UWE, for Kernel,
Executive, Supervisor and User Read and Write Enable. Linux uses only
two of the four privilege modes, and its user processes run in Executive
mode, so the bits it calls _PAGE_URE and _PAGE_UWE are in fact the
architecture's ERE (bit 9) and EWE (bit 13). The true URE and UWE bits,
11 and 15, are unused.

The names have been misleading since the beginning, and the comments on
those defines said only "xxx". Spell out what the bits actually are. No
functional change.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/pgtable.h | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 8a175e0c2b42..d123fd0d4091 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -65,10 +65,18 @@ struct vm_area_struct;
 #define _PAGE_FOW	0x0004	/* used for page protection (fault on write) */
 #define _PAGE_FOE	0x0008	/* used for page protection (fault on exec) */
 #define _PAGE_ASM	0x0010
-#define _PAGE_KRE	0x0100	/* xxx - see below on the "accessed" bit */
-#define _PAGE_URE	0x0200	/* xxx */
-#define _PAGE_KWE	0x1000	/* used to do the dirty bit in software */
-#define _PAGE_UWE	0x2000	/* used to do the dirty bit in software */
+/*
+ * The Alpha AXP ARM defines 8 protection bits in PTE[15:8]: KRE, ERE, SRE,
+ * URE, KWE, EWE, SWE, UWE (Kernel/Executive/Supervisor/User Read/Write
+ * Enable). Linux only uses two privilege modes: kernel (mode 0) and user.
+ * User processes run in Executive mode (mode 1), so _PAGE_URE and _PAGE_UWE
+ * correspond to the architecture's ERE (bit 9) and EWE (bit 13) bits. The
+ * true User Read/Write Enable bits (bits 11 and 15) are unused.
+ */
+#define _PAGE_KRE	0x0100	/* Kernel Read Enable (bit 8) */
+#define _PAGE_URE	0x0200	/* Executive Read Enable (bit 9); "user" in Linux */
+#define _PAGE_KWE	0x1000	/* Kernel Write Enable (bit 12) */
+#define _PAGE_UWE	0x2000	/* Executive Write Enable (bit 13); "user" in Linux */
 
 /* .. and these are ours ... */
 #define _PAGE_DIRTY	0x20000

-- 
2.54.0

