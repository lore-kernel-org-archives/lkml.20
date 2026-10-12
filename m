Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F86346EF6B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791833608; cv=none; b=mOMU+GNrcQvCmWWlByc/sotLtWnCDQQUQ8E2wFZptTxkw8fBiknxNB1GYOqH4tL0I7UraMbj/XTc4cgce28MgjOZrGxe3SerzE5O2sDvCu6OiJOQ5k9UMj/xryepDYV/AawvDEz4rXw5HglBCkXMDWdn0gfp1CFKXCaqPGgX8IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791833608; c=relaxed/simple;
	bh=K3vL916hwAzIEhpMQoKwDIcw4kalgkk+rOVRXH/u/q4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uViQ3braQnjlpUBcYtyfAWCFT7eFqb9CESxufAY+3rQseI0ZTR4b9nA+ByniS47in7ygbnUyphfpjQvluIOm9V5o8U94tFH9Ce40FaLihZpbJNfh6P6sb4qjaxb6VH83WsZUYB7WBh4M76BC6SJhGjrdNFbdeDBo0sRSOw301LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adrianschlegel.com; spf=none smtp.mailfrom=adrianschlegel.com; dkim=pass (2048-bit key) header.d=adrianschlegel-com.20251104.gappssmtp.com header.i=@adrianschlegel-com.20251104.gappssmtp.com header.b=XXIf3e5w; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adrianschlegel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=adrianschlegel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adrianschlegel-com.20251104.gappssmtp.com header.i=@adrianschlegel-com.20251104.gappssmtp.com header.b="XXIf3e5w"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so27171515e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adrianschlegel-com.20251104.gappssmtp.com; s=20251104; t=1791833605; x=1792438405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lXnE2SxGJ5rLYuIMSksp63RAMKlg3urlDD6GhDVjHOI=;
        b=XXIf3e5wTRXopiqCvr0hU83zZWWxYWOmRKZhvkYQKVDNr0nNJcEH8uTstzBgbbiVsN
         sp2b07jf37g9yvJBy92qyZ37F1F2J/br2819a4sCtGmgKIk0QafmL3sFHgNF1iK/Rucn
         sXoOygaXICDozzEASbX2Vo2ACc+jBIuBPZeqQTrwhazo89cirKQfmx5F5ZJ5VRpoLxNA
         HrEFvXBdZakOyJt0SSPEyPQgTx6kNfJVvYI27Y8DATWwJyLvkRqTuDfIacs6YmG5O53Q
         L9a5q1Zo0wCilzrtn7Co2/iO19lOXcUuY8USI+0uIJC7hK+f6081AZDCNKKxbk/kyEB9
         hLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791833605; x=1792438405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lXnE2SxGJ5rLYuIMSksp63RAMKlg3urlDD6GhDVjHOI=;
        b=b7157x4tRfH983wlMepxeN99x4LRxUjdXUPrybg+CgJLBZuDEjIhIIYgqWmyy2SFMp
         CXEdMSIKqgdzWYPRt4rhLyz9bvQ7YBxfGIPFh5vAftPRfxiSxXiqDJ1FZuyZgMts8grI
         fhK9ELLjMNjX+WUaF8TfFm/1+Kul9iMuxCQebhR8KENh8LKW0Li9gbOdFCNANXi4S993
         MXrsN54TYezzzgemK8l6hojII6gVG0oJ5URowzUPf4TsDjEKD9PafT58sdaaziGQmHX/
         QQ4fLqS7yflfaks/BOMfTBn42k3LJHTRW7snu1XOGVfKe8d1SX5iFY71yj1Au2h/v6C8
         1Vcg==
X-Forwarded-Encrypted: i=1; AKwUvBxwnghZyKuN4Qi0fzYUwxWYi46wKhbfbg7VpVYLbc9JO9H4dCyJ8Y1lWR/MeFFtuZiHPDZsj3UOSS/dZxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTFbVusTSlRzFQBfTV2L41m8mYfVWuf7wGcQsdigycEsgidNBC
	EplgAQubx+UYkGg5f9T2beMPuYXqeDehNLAcOVi3PswGYwpkhuQzTs9PQkdN0dH9mw==
X-Gm-Gg: AYBFou2hrZufSRXyfg4r1xKXvgADyH+PzP254QEoTlkT/qdVQLWfebcsMJ1S7vtVKzI
	JkSuCl1DDfOf3JrpSWiJgEMDmr1G0YDpJ8z9oo5SkqyXQD/nUNdwrz2WIy4maoB/zJ4SbV1heLT
	2q8lWLJpdvOef6nJdOISRRHkwjOAKJuzm1kZ4bArKB7svpup68o+CJKyaB2GLXMZ1zkIxJ83j4y
	depqB1AYtxbsNhUAZf++c92WkIbE9xpK4cqmoyvHeAMeSItKo7illxcblxg7WBtshYk4Y/yywFF
	nzF0Ie8IgvdMERRT80HbfFDeoQy+PS7S143+cppQ4T8NYSPK1GuMecOMFvu4GBZO+NakAFw3/HB
	7AxBpGkkiUTJxssphdFW2DcSCin6w6ozOKjUoTpv/HhzIydGDu3di8dYbXyCAOJxYKzzMxQtTb/
	Vy1JCYqZAKn7GvaQVevnwUIeP+BDMxmGSLt2hqqNP04Wz+ZAN00wkIuUQNHaburgj/NLRks2xYz
	GdB8KaHc/91imPkoZmKOAwLHwHMiOlusjmbua3vYw==
X-Received: by 2002:a05:600c:5489:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4a18e4a5244mr199061695e9.8.1791833604640;
        Mon, 12 Oct 2026 12:33:24 -0700 (PDT)
Received: from Adrian-Arch.home ([2a02:1210:1c09:3100:bf3b:aefa:a3ba:26f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm570950955e9.9.2026.10.12.12.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:33:24 -0700 (PDT)
From: Adrian Schlegel <me@adrianschlegel.com>
To: tony.luck@intel.com,
	bp@alien8.de
Cc: x86@kernel.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adrian Schlegel <me@adrianschlegel.com>
Subject: [PATCH v3] x86/mce: Do not treat cache hierarchy errors as memory errors
Date: Mon, 12 Oct 2026 21:33:05 +0200
Message-ID: <20261012193305.38931-1-me@adrianschlegel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003222012.19685-1-me@adrianschlegel.com>
References: <20261003222012.19685-1-me@adrianschlegel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Intel and Zhaoxin, mce_is_memory_error() also returns true for cache
hierarchy errors. All callers expect it to report memory errors only.

The CEC uses it to count corrected DRAM errors. A corrected cache error
only names the cache line that was affected, not a faulty DRAM page.
With a faulty CPU core, the CEC therefore soft-offlines healthy pages.
On an i9-9900K this caused about 500 soft-offline attempts per hour.

Report only memory controller errors on Intel and Zhaoxin, as is
already done for AMD.

Fixes: fa92c5869426 ("x86, mce: Support memory error recovery for both UCNA and Deferred error in machine_check_poll")
Signed-off-by: Adrian Schlegel <me@adrianschlegel.com>
---
v3:
- Shorten and wrap commit message (Boris, Tony)
- Refer to the SDM section by name instead of number (Tony)

v2:
- Fix mce_is_memory_error() itself instead of adding a CEC-local helper (Tony)
- v1: https://lore.kernel.org/r/20260927151904.30524-1-me@adrianschlegel.com

Tested with mce-inject (sw) in a VM with an Intel CPU model. A corrected
cache error (status 0xcc5ffc0000100179) is no longer counted and its
page stays online. A corrected memory controller error (status
0x8c0000000000009f) is still counted and its page soft-offlined.

 arch/x86/kernel/cpu/mce/core.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index ab469605f..54ed053fa 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -540,21 +540,13 @@ bool mce_is_memory_error(struct mce *m)
 	case X86_VENDOR_INTEL:
 	case X86_VENDOR_ZHAOXIN:
 		/*
-		 * Intel SDM Volume 3B - 15.9.2 Compound Error Codes
+		 * Intel SDM Volume 3B "Compound Error Codes".
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

