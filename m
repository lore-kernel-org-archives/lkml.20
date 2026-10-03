Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC88330E0F2
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 22:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791066088; cv=none; b=CE91v93k6VDtvVlIvXdfpdmoW7vUhduSKMA5E2KUZkunM/cyV0YJ9nWeWdG7bE/FBXmx3wXutW62p0daKGu15C/SESLvR1qBK7X1s/ZV8cfJ5cEDWvruSmXMiBbIZ13UN2frQxLF+CbhN/5iiR1NNNXv6tY1Vu6Czz3BU3uSb8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791066088; c=relaxed/simple;
	bh=GqP1kw14JkewxSUQle72wM0zScwoml5WzU48eNYPO/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tj20sI0P4ET/JvA2jUpJPBZBMw/NNyARhapDIIL3rA+7CffmAg4STwohEEBUh0sXe7eU00eLi85Ti1KqFblkoJTfwac3UwX3XXAU20wBfUz1vZnewRYyWKcpBFVx6V+Vxe/08g6BpNdlQgNthPRvVa0ULent8BQDz2+cdy9c5G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adrianschlegel.com; spf=none smtp.mailfrom=adrianschlegel.com; dkim=pass (2048-bit key) header.d=adrianschlegel-com.20251104.gappssmtp.com header.i=@adrianschlegel-com.20251104.gappssmtp.com header.b=n0yS86oO; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adrianschlegel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=adrianschlegel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adrianschlegel-com.20251104.gappssmtp.com header.i=@adrianschlegel-com.20251104.gappssmtp.com header.b="n0yS86oO"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so4789065e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 15:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adrianschlegel-com.20251104.gappssmtp.com; s=20251104; t=1791066084; x=1791670884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nSz2kVU1/aiGRRcK39q9ZWYO77RTsz6YoD59coEe4vY=;
        b=n0yS86oOTFH2DgJYPhVuFoNAJc1WqALWiVnyjQ7kM2ITaZuQi3mPDtcKPm8bEL/ZaZ
         SaCagJjSIwkoyZitGQIbxQRWgP0toNyFrDEL0wQ8s17w97v8OrPe0oI/VxgpBBl3IQ7j
         LwycGo93/c7zQyyjwYsR+G4FzoeasqFXq7FZpjQeRFyp8ZxxsAvGq3LezUtzj5gPa3dF
         nyPV/QwckhWAN60Hbes+j1qErctymLQ6VKqLVOVJCFMijn17IFQp4bFSCEu15/3vByBF
         eB6ZFaCjPMHaz3J0WON4z7k3itWbFcoj63pW1JZ5xRi7vvK+2W6zGGLJDplBcoVl04x7
         Zeyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791066084; x=1791670884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nSz2kVU1/aiGRRcK39q9ZWYO77RTsz6YoD59coEe4vY=;
        b=eRcrehbUr3Qh9CEjnurs8Iwokc1QQb7HNAVgJfvMOBFnaWvLTMk6M6Il+F5jIKH6jw
         f9ZuGOI4b5CGSeqqOYOATzbyh2Noe8cc5hTNyl6Gjci//7GX9jwHZHN9NLx0BlIkvnEF
         QTwBW1h4HSHPwqRxeFZgC0qfR0Z0R/4zl9f9481BvbMSsImGRPEkdECcROZvmE5w1QNL
         Yi6UVcoIYWDWI+4R/+HmUrZpKK4Nj4QX1COfumxTFQcHOFcZhkUSlteZ1rymCpeqQ0G1
         f3gdmioG+W1zfYNgiuw5LxYMDZpxd9AD5EZ4fpTzczjwohGVIZ3Yaw34iLcZ8fRrPypw
         kSBA==
X-Forwarded-Encrypted: i=1; AKwUvBzGFoHEhe4rNf8ofhMfitaCxIWtV5P/hKeIPCRlxF3qkhWKro6tZfQ3ZCqRrDdFRaZRcz0rDjsnXHZraO0=@vger.kernel.org
X-Gm-Message-State: AFuF++lAB3b3sUtpfji7W4C186aZ5fqiIOrC6VitaFr1VuWA5Ke7b/5g
	TKHb9+sYgUc5Hz9lbsLid7kazQga4CFbYUhIiUnmxuXCjXbXqZqDUWsxiZ8R3yP4tg==
X-Gm-Gg: AYBFou0Gj67OeOKP0HsEiWmLgMdlP7nYRm6uLaZFvCUHX8MDQ0R1bHv3xCpzkKm2suM
	KuclLHbvlgis+ZUSaMlojtTjCksvPXhk80xDowznCzoykIX/1uAxkNWDuSytMgbS5+evk4l5EcF
	2rkqZEPm7gXDoTOu2tyw4QcHVga2+4eQCkN20Z2QhacCvbbe1LtOkV4heqwWO7IlulrLjNC8PZ9
	JIZ2/NgfjdF+MqD0ccfEA/gpNtb51UyRHjQioEaJZwnSzQj7NPIaKG8qwbWMO8IFSxbt1aR3fCd
	NphWQ0Z4V9WR3KYW95CH4o6XlP07eo9R2AEoWRNWxCgqs6nrqJtrZ5daj8R5dT5ZcNChJ3we/zo
	Sv0oI5m1Yg5kuJ081OO3f1T7qHnJHu0Z6IFd/5BeRmkuLghJevEhwdgPe94DWuLOhNJfNRyORBi
	1qvxcoRnT5pqYDUjR2gE/kip7V6M80gmotMDV73SdWUohchYGs+ZwJW7kxEj2bDNE1ZgIpzP0Z2
	qonPjSntBwXY+tnx60X94SWMUPbBO/6x6XXoHfn2A==
X-Received: by 2002:a05:600c:3152:b0:4a0:2500:2cd0 with SMTP id 5b1f17b1804b1-4a0275977eamr111245305e9.18.1791066083939;
        Sat, 03 Oct 2026 15:21:23 -0700 (PDT)
Received: from Adrian-Arch ([2a02:168:96c6:1:452b:38d5:263b:6319])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm242906545e9.1.2026.10.03.15.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 15:21:23 -0700 (PDT)
From: Adrian Schlegel <me@adrianschlegel.com>
To: tony.luck@intel.com,
	bp@alien8.de
Cc: x86@kernel.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adrian Schlegel <me@adrianschlegel.com>
Subject: [PATCH v2] x86/mce: Do not treat cache hierarchy errors as memory errors
Date: Sun,  4 Oct 2026 00:20:12 +0200
Message-ID: <20261003222012.19685-1-me@adrianschlegel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927151904.30524-1-me@adrianschlegel.com>
References: <20260927151904.30524-1-me@adrianschlegel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Intel and Zhaoxin, mce_is_memory_error() returns true not only for memory controller errors but also for cache hierarchy errors (MCACOD 000F 0001 RRRR TTLL) and generic cache hierarchy errors (000F 0000 0000 11LL). The cache hierarchy checks were added in commit fa92c5869426 ("x86, mce: Support memory error recovery for both UCNA and Deferred error in machine_check_poll") for uncorrected errors. All callers of mce_is_memory_error() expect it to report memory errors only, as its name says.

This is wrong for corrected errors. A corrected cache hierarchy error means a bit flipped in the cache and was fixed there. The reported address only names the line that happened to be cached. The CEC still counts these as DRAM errors, and with the Intel action threshold of 2 from commit d25c6948a6aa ("RAS/CEC: Reduce offline page threshold for Intel systems"), two such errors on the same page are enough to soft-offline it.

This was observed on an i9-9900K without ECC memory and with a faulty core. Bank 3 on CPU 1 reports thousands of corrected cache errors (MCACOD 0x0135, 0x0151, 0x0179, ...) with addresses spread over the whole physical address space. Within one hour the CEC made 502 soft-offline attempts on 159 distinct pages. 453 failed because the page was in kernel use, the others took healthy pages offline:

  RAS: Soft-offlining pfn: 0x24f6c8
  mce: [Hardware Error]: CPU 1: Machine Check: 0 Bank 3: cc5ffdc000100151
  mce: [Hardware Error]: TSC 21903b589a2 ADDR 24f6c85c0 MISC 2516485

As a result, healthy RAM is lost until reboot and HardwareCorrupted keeps growing. Pages that cannot be offlined are retried repeatedly, and the log messages suggest failing DRAM while the defect is in the CPU.

AMD already restricts this to DRAM ECC errors since commit c6708d50f166 ("x86/MCE: Report only DRAM ECC as memory errors on AMD systems"). Do the same for Intel and Zhaoxin.

Fixes: fa92c5869426 ("x86, mce: Support memory error recovery for both UCNA and Deferred error in machine_check_poll")
Signed-off-by: Adrian Schlegel <me@adrianschlegel.com>
---
v2:
- Fix mce_is_memory_error() itself instead of adding a CEC-local helper (Tony)
- v1: https://lore.kernel.org/r/20260927151904.30524-1-me@adrianschlegel.com

Tested with mce-inject (sw) in a VM with an Intel CPU model. A corrected cache error (status 0xcc5ffc0000100179) is no longer counted and its page stays online. A corrected memory controller error (status 0x8c0000000000009f) is still counted and its page soft-offlined.

 arch/x86/kernel/cpu/mce/core.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index ab469605f..4d2ace76a 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -542,19 +542,11 @@ bool mce_is_memory_error(struct mce *m)
 		/*
 		 * Intel SDM Volume 3B - 15.9.2 Compound Error Codes
 		 *
-		 * Bit 7 of the MCACOD field of IA32_MCi_STATUS is used for
-		 * indicating a memory error. Bit 8 is used for indicating a
-		 * cache hierarchy error. The combination of bit 2 and bit 3
-		 * is used for indicating a `generic' cache hierarchy error
-		 * But we can't just blindly check the above bits, because if
-		 * bit 11 is set, then it is a bus/interconnect error - and
-		 * either way the above bits just gives more detail on what
-		 * bus/interconnect error happened. Note that bit 12 can be
-		 * ignored, as it's the "filter" bit.
+		 * Memory controller errors have an MCACOD of 000F 0000 1MMM CCCC:
+		 * bit 7 set, bits 8-11 and 13-15 clear. Bit 12 is the "filter"
+		 * bit and is ignored.
 		 */
-		return (m->status & 0xef80) == BIT(7) ||
-		       (m->status & 0xef00) == BIT(8) ||
-		       (m->status & 0xeffc) == 0xc;
+		return (m->status & 0xef80) == BIT(7);
 
 	default:
 		return false;
-- 
2.55.0

