Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434842;
	b=uGCITJRIvMHVk0VkxTpw865M6cFNSTEMKxPCur+OIdfw51EFm/4sl+eODOkOeqp7uHLC
	 j9/2kKxB/iP+ct1sw/v4Qr/Oba4vKOUs8dZRFIGYtgmZ0X+QU1hNm4sIShFNXIXZlWXvW
	 sgjzyKYCVZxTnR/u92OJZ1RoNaE5s6d6r1zfDXJduLSaIuRHyzWphLt5XB9+z8vlVtSWK
	 gfnJEAxEen8mSfIsuVm+2H0kw58Uj2O//Fn472CEtHVfyxFRrLF7R0N1Wjk3MG1imaj95
	 3IrF/kX+XFHSl3rtF5472JNJ7Tj7FrB4v+kZCyXfjphQ259+7GtrWqVxjhFVEOf6rdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+dsS8/OU0wby4BZ79znZbA9Ny2A1+vlGylVbT5sKa+g=;
	b=yh3owvIqObi4YbloJmvzHxlPDQneaQBjCIritUQKKiYMhmGiehCI95xGyH1392T2N/IX
	 q6oxyWVd4VSs4RRwsjFldGLnWKTc8XnMUUsvlqikeTL+63CxcCfSFnQ/uiDe+fBaK2+Jz
	 1L4YlLekNUpi7d4QOeSVGfaS9s2ZiAj1pMkg1JMjKDwNjrVMxmJDjW7W+CtlkQpvG7aQV
	 V44N5RJRcfCMW+ZaH46vmTXAkGpXJfS139WKMAYNCUy/Q95qOqT4MEpGHZ2I9+3qbAHC6
	 D3h3M/AJc31hXQrFN3wLRfE3cL287uZw9pVGuaHF5rahpRVsut3Or/WcFX5rY+iKFWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OfmZeXLs;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600C7606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 600C7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OfmZeXLs
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-170135e43c7so1715295c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434841; x=1795039641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dsS8/OU0wby4BZ79znZbA9Ny2A1+vlGylVbT5sKa+g=;
        b=OfmZeXLsZxtJ1Th/6u8HXKD1b2Z+Rsm/yMPKCaB0wZ9stXNF1v6MjlSYWfAZgVHVBj
         YNJNhvEZWoQhdru1/u3Qq45zmIAcxDgOQWc8DsDRVxVNtvXtBax470hMSfD4PAuiooIY
         BXSI7apzxiDz9mP1d4yL21RD+iZPDWKU7sy4N9cvGIs4AVTRYc1PjoTZtmLAmNlA75Vb
         TtrZlZ4aes+rw1zNwInfW8ek/emA5n6j31Z8ZO30GHLBDWEAVnzmhOMUxdQEtK4U3L/c
         tHZdNCjmQ3MhJ+2Ax4GgYEGPGIvTd0L4vET2eOBQSNx4NSW1aWxXWmlK5c95+XIQ0l5c
         8iNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434841; x=1795039641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dsS8/OU0wby4BZ79znZbA9Ny2A1+vlGylVbT5sKa+g=;
        b=VXhcr9MlOoGMz/Diz7GDa7sI8dJOvL6LTd1tFdfzcwGUWTRorSIORYHc/30BxpEpDg
         4uv9s//UB+4QWGOf9S80gVWQX43jPX/PSZCngSycswlTC1BXe3uOVuJxoxvBlmJJVpPS
         EeblsxbXPKGwoofrHlVU2E8MVh0iUduwI7HqvPEsa6+0VL4chdauJwjfLslUn6Qwen1L
         j+kkF2kCQjnxRcFK5iu2ZEvAlqtWCP2hXcJdVx8MzbU+/KjLvagEvgBqN7trLE/NTCAT
         eQ+P25qUeiLXRsJnAifCTAgt5DLyUVARBv75loi4VAdG2yKwFd3JTxX5NSxj/LZ8r9ZH
         xvuQ==
X-Forwarded-Encrypted: i=1; AL+hErFqWL4oFPKAcTs6dg7pYAkF0xQOelBIrK37FgmlS2mT2zddOzYxY1Odbj7KogkuJ7Zlov/oiwIxTUnNyoY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Amadua/sAWSXNZSL7TBKRfKAD/RtAb3udOgWc4fQTn20KdG6F
	gz3L5vZypZTsqYlmR6U2qO9ic4n6bxp0cKgH2Vknbg/36dsawop4cctswutWSZyO
X-Gm-Gg: AYBFou388nrg245LtRci1mKsmfbFNOvuMAcSueJfcSY5YseUJM3TpH9qfb6fmMvOns/
	VOHJ1YZEJQVi1aJF4G/U4k6iRANcCtwY25oB8/wFUzqJHtORvEnQ9MrG60HjUC0knXqAz2TDsdj
	6C+RF2RQc3piToLtQekp4AFspbqCfH93vEp1lJHjGv0FzM0IUReF/QBt8FlQISk2q4CrtdJ4Yph
	Z3WnPR8fNL1bjkLYkXyk+5mmIWPaeQoncSJv/hJlV7dTZY+zZeycpCGXGSDXhUe+LyOKqo4yVbh
	CI0tH8rFWd5YwtKZLk7STrHgVBKt6iWLOWE7ceBrSQSK/2lPkEF5eZIVJVNAK5nmtqoWqj93yij
	k0hMcA/Rl3hPWqj5XVzIRktBm1HdaynWbZBrkbQ/7nsGZB4ikaP+c4V9lYf+RZou4noYWjwGNnf
	xS9LIb3eiJ3IU0FnRwfCLWgtjF/5qAlzMfL0unngwl4L/41Yv/UH8opV4F85IWKCN6kBGvzDehh
	Mfar0iKMp6byy3JB73Vv4aMtSaMWu/iVxrT4FlbRwL4zoLH3sLZMLk8sfVDsrVNvzEx9XvGQFop
	rnj5nti67+5CaXapllJv
X-Received: by 2002:a05:7022:296:10b0:190:d0d9:3110 with SMTP id a92af1059eb24-1b3c0365599mr3096674c88.45.1794434841284;
        Wed, 11 Nov 2026 14:07:21 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm20571438c88.3.2026.11.11.14.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:07:20 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: soc@lists.linux.dev
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Vincent Mailhol <mailhol@kernel.org>,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2] arm64: defconfig: drop four symbols that no longer exist
Date: Wed, 11 Nov 2026 22:07:18 +0000
Message-ID: <20261111220718.2586239-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111202914.2558187-1-takano32@gmail.com>
References: <20261111202914.2558187-1-takano32@gmail.com>
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

None of these symbols exists any more; the lines are left over from the
removal of the options they name:

  NFS_V4_1                  folded into NFS_V4 (7537db24806f)
  SLIM_QCOM_CTRL            driver removed     (7cbba32a2d62)
  NET_VENDOR_PACKET_ENGINES vendor removed     (aec3202247b4)
  SCHED_DEBUG               option removed     (b52173065e0a)

The Ethernet line was added by commit 32379ad4060b ("arm64: defconfig:
Drop unused Ethernet vendors") a week after the packetengines vendor
directory had been removed, so it was stale from the start.

The built configuration does not change.

Link: https://lore.kernel.org/all/20251223134807.3543642-1-mikko.rapeli@linaro.org/
Link: https://lore.kernel.org/all/20260317-arm_defconf_cleanup-v1-3-8eecb7fdd24d@kernel.org/
Link: https://lore.kernel.org/all/20260317-arm_defconf_cleanup-v1-9-8eecb7fdd24d@kernel.org/
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: the commit message now carries only the change itself.  The test
    record, the earlier submissions and the AI disclosure moved below
    this line, as Krzysztof asked.

Tested as configuration text only: "make ARCH=arm64 defconfig" on
v7.4-rc2 with and without this change gives a byte-identical .config,
and "make savedefconfig" emits none of the four lines.  No kernel was
built or booted from this change.

Scanning every Kconfig definition in the tree leaves no other stale
line in this file; similar leftovers remain in other architectures'
defconfigs and are left for separate patches.

Mikko Rapeli sent a patch for the SLIM_QCOM_CTRL line in December
2025, and Vincent Mailhol's "configs: cleanup obsolete or incorrect
assignments" series carried the NFS_V4_1 and SLIM_QCOM_CTRL lines in
March 2026; both are still unmerged.  I am happy to drop the
corresponding hunk if either author would rather keep their own.

The change and the changelog text were produced with an AI coding
assistant (Hermes Agent, model deepseek-v4.1-flash) working from the
tree and the git history.  I reviewed the diff and the reasoning, and
I am responsible for the submission.

 arch/arm64/configs/defconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..513f8d6be073 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -424,7 +424,6 @@ CONFIG_MLX5_CORE_EN=y
 # CONFIG_NET_VENDOR_NETRONOME is not set
 # CONFIG_NET_VENDOR_NVIDIA is not set
 # CONFIG_NET_VENDOR_OKI is not set
-# CONFIG_NET_VENDOR_PACKET_ENGINES is not set
 # CONFIG_NET_VENDOR_QLOGIC is not set
 # CONFIG_NET_VENDOR_BROCADE is not set
 CONFIG_QCOM_EMAC=m
@@ -1756,7 +1755,6 @@ CONFIG_QCOMTEE=m
 CONFIG_MUX_GPIO=m
 CONFIG_MUX_MMIO=y
 CONFIG_SLIMBUS=m
-CONFIG_SLIM_QCOM_CTRL=m
 CONFIG_SLIM_QCOM_NGD_CTRL=m
 CONFIG_INTERCONNECT=y
 CONFIG_INTERCONNECT_IMX=y
@@ -1824,7 +1822,6 @@ CONFIG_SQUASHFS=y
 CONFIG_PSTORE_RAM=m
 CONFIG_NFS_FS=y
 CONFIG_NFS_V4=y
-CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 CONFIG_9P_FS=m
@@ -1861,7 +1858,6 @@ CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
 # CONFIG_FTRACE is not set
 CONFIG_CORESIGHT=m

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

