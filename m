Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877555;
	b=l2rVuJzuwed9qq2EUEY/kJIpuU0OlLldQE+a1rfURb6MsrrliruC8ufCWDtQDY9oQyLy
	 FpIHM59id7mtJtb4AUWUVCFODJuQfH5cY9p+rq7sTjykN1YLIYPlbK3YJ+NUSGkfZBNVf
	 ayKT/Wp4rtENvm5+0MWvc73nWd4JKgb9C/EzWsj+rp1unyadHGLb+1XWIf/Xk5OsAZ0Pr
	 agkzH+P6LBhLqhrgG4bjJ+zHEsphdjwRZ453WtPiAocvSiIUEa7iCjhygHua80IrZgFgM
	 tZsqvvH4darDEafwHT7qKz91Ry0b7zbZIQUOTADgI94wto5pcGaY4PThg8ChiK8mvZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877555;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=67HakQsonwhSsl3u3/d1uMd+cF2cdPKxF0LdS+EmnIY=;
	b=KgfmFjCmh5bHyYO9htA2js6Xx2FUzi/5jkY5gtqlfw7DrM/x+u74HPcQEU5fRI8gqQG4
	 0sY8P8ALMgX1kAYYd7zd6wk97uLdxdwk1+bxosYa9gik0zqW5v18Bgitd9jEmBCY7X/LH
	 ot6IgoB28rWa+cOBFCAGIoDz3dbHdoTZzO6LeJhLteeGUhIa+I8sqRc7+fOqhQaQJb9h/
	 V/8KK2lHjNW0nR6rBhmFxVk+J4A0QBbQ08Mdv6IeN3/mz+jGo6MfVbv3SaTNpZtZPz7wP
	 LJjuZtL25VrmFOlbM6RU18TDDMjMDjQ8sjxLhySdgRdI9EJIT0A5nDxiKPNLNCwCUCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=S8beuHQ8;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFE0606A32C;
	Tue, 17 Nov 2026 01:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FFE0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=S8beuHQ8
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jT63r3q6Pz4xPS4;
	Tue, 17 Nov 2026 09:05:44 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794877544;
	bh=eK5E2C1gB1pbXLRVgMuMbHXe4380hqcm/+aZjqAUdl0=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=S8beuHQ8gfA3noXxzl7235RjGXG6Z/l5NAt/PMPXtDQ7aqcm8PZTrCCw7CWYto0VY
	 1VX537IluFZEKratI/6NAPzlvxpYOzEXm1bZxKeP9VTod9FOfISfcwR/XGEkN0UACJ
	 fXXZ7OX7VSAy7H6QDgMkCQubCIRdvOqbSlVkMnYgzxP13LAK6TMpLZXyLBSbH/W0nO
	 Ou/KAmH2ypGFZ3MY3Hcvd7QGHS/WrAzaNFLu/lBiOHKytRd9nXJ41sus4aynNSGlCb
	 BYFj5A1Ne63q/3PECH1UOdtCGrVvLWfVjGwQlibMOUl2qs207Wt4CabU4CHz19IoYY
	 /lY9RSrlgD4hA==
Received: from szxl2zmapp05.zte.com.cn ([10.1.32.37])
	by mse-fl2.zte.com.cn with SMTP id 6AH15JQS050373;
	Tue, 17 Nov 2026 09:05:24 +0800 (+08)
	(envelope-from lv.yating@zte.com.cn)
Received: from mapi (szxlzmapp03[null])
	by mapi (Zmail) with MAPI id mid16;
	Tue, 17 Nov 2026 09:05:25 +0800 (CST)
X-Zmail-TransId: 2b056afba855930-0933c
X-Mailer: Zmail v1.0
Message-ID: <20261117090525032emq-t-XCAI7RO1PaX9577@zte.com.cn>
In-Reply-To: <20261116160310759KXBV_Mm-mVT-XuE_01dgU@zte.com.cn>
References: 20261116160310759KXBV_Mm-mVT-XuE_01dgU@zte.com.cn
Date: Tue, 17 Nov 2026 09:05:25 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <lv.yating@zte.com.cn>
To: <lv.yating@zte.com.cn>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
        <rdunlap@infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <liu.qingtao2@zte.com.cn>,
        <he.yilin@zte.com.cn>, <ye.zhihao1@zte.com.cn>,
        <zhang.cheng35@zte.com.cn>, <hu.shengming@zte.com.cn>,
        <linux-doc@vger.kernel.org>, <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIFJFU0VORCAyLzJdIHJpc2N2OiBod3Byb2JlOiBBZGQgTGVhcFJpc2UgdmVuZG9yIGV4dGVuc2lvbiBmcmFtZXdvcmsKIHN1cHBvcnQ=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6AH15JQS050373
X-TLS: YES
X-ENVELOPE-SENDER: lv.yating@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Tue, 17 Nov 2026 09:05:44 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AFBA868.002/4jT63r3q6Pz4xPS4

From: Lv Yating <lv.yating@zte.com.cn>

Add RISCV_HWPROBE_KEY_VENDOR_EXT_LEAPRISE_0 (key 17) and the
supporting vendor extension framework entries for Beijing LeapRise
Technology.

The key is recognized by riscv_hwprobe() and reports an empty
bitmask for now: no LeapRise vendor extensions are defined yet.
Recognizing the key allows userspace to distinguish a kernel that
supports LeapRise vendor extension probing (empty bitmask) from an
older kernel that does not know the key at all (key set to -1), so
LeapRise userspace libraries can be prepared ahead of the first
hardware shipping vendor extensions.

Follow-up patches will register extensions as they are defined.

Signed-off-by: Lv Yating <lv.yating@zte.com.cn>
---
 Documentation/arch/riscv/hwprobe.rst          |  4 ++++
 arch/riscv/Kconfig.vendor                     | 14 +++++++++++++
 arch/riscv/include/asm/hwprobe.h              |  1 +
 .../include/asm/vendor_extensions/leaprise.h  | 11 ++++++++++
 .../asm/vendor_extensions/leaprise_hwprobe.h  | 20 +++++++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
 arch/riscv/include/uapi/asm/vendor/leaprise.h |  3 +++
 arch/riscv/kernel/sys_hwprobe.c               |  4 ++++
 arch/riscv/kernel/vendor_extensions/Makefile  |  2 ++
 .../riscv/kernel/vendor_extensions/leaprise.c |  7 +++++++
 .../vendor_extensions/leaprise_hwprobe.c      | 18 +++++++++++++++++
 11 files changed, 85 insertions(+)
 create mode 100644 arch/riscv/include/asm/vendor_extensions/leaprise.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/leaprise_hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/vendor/leaprise.h
 create mode 100644 arch/riscv/kernel/vendor_extensions/leaprise.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/leaprise_hwprobe.c

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 8454a6ae6fd1..336a2c5b05d9 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -431,3 +431,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZIC64B`: The Zic64b extension is supported,
     as defined in the RISC-V Profiles specification starting from commit
     b1d80660 ("Updated to ratified state.")
+
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_LEAPRISE_0`: A bitmask containing the
+  leaprise vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
index 3c1f92e406c3..d8d7c4b39229 100644
--- a/arch/riscv/Kconfig.vendor
+++ b/arch/riscv/Kconfig.vendor
@@ -16,6 +16,20 @@ config RISCV_ISA_VENDOR_EXT_ANDES
 	  If you don't know what to do here, say Y.
 endmenu

+menu "LEAPRISE"
+config RISCV_ISA_VENDOR_EXT_LEAPRISE
+	bool "LEAPRISE vendor extension support"
+	select RISCV_ISA_VENDOR_EXT
+	default y
+	help
+	  Say N here to disable detection of and support for all LEAPRISE vendor
+	  extensions. Without this option enabled, LEAPRISE vendor extensions
+	  will not be detected at boot and their presence not reported to
+	  userspace.
+
+	  If you don't know what to do here, say Y.
+endmenu
+
 menu "MIPS"
 config RISCV_ISA_VENDOR_EXT_MIPS
 	bool "MIPS vendor extension support"
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 9b04377c0f98..b153dedc8c10 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -25,6 +25,7 @@ static inline bool hwprobe_key_is_bitmask(__s64 key)
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0:
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0:
+	case RISCV_HWPROBE_KEY_VENDOR_EXT_LEAPRISE_0:
 		return true;
 	}

diff --git a/arch/riscv/include/asm/vendor_extensions/leaprise.h b/arch/riscv/include/asm/vendor_extensions/leaprise.h
new file mode 100644
index 000000000000..abac6adc240c
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/leaprise.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_LEAPRISE_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_LEAPRISE_H
+
+#include <linux/types.h>
+
+/* LeapRise vendor extensions: none defined yet */
+
+#endif
diff --git a/arch/riscv/include/asm/vendor_extensions/leaprise_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/leaprise_hwprobe.h
new file mode 100644
index 000000000000..d98a383cfb72
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/leaprise_hwprobe.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_LEAPRISE_HWPROBE_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_LEAPRISE_HWPROBE_H
+
+#include <linux/cpumask.h>
+
+#include <uapi/asm/hwprobe.h>
+
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_LEAPRISE
+void hwprobe_isa_vendor_ext_leaprise_0(struct riscv_hwprobe *pair, const struct cpumask *cpus);
+#else
+static inline void hwprobe_isa_vendor_ext_leaprise_0(struct riscv_hwprobe *pair,
+						 const struct cpumask *cpus)
+{
+	pair->value = 0;
+}
+#endif
+
+#endif
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9a121ee3b436..6907ca4648ef 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -124,6 +124,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
 #define		RISCV_HWPROBE_EXT_B		_BITULL(6)
 #define		RISCV_HWPROBE_EXT_ZIC64B	_BITULL(7)
+#define RISCV_HWPROBE_KEY_VENDOR_EXT_LEAPRISE_0	17

 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */

diff --git a/arch/riscv/include/uapi/asm/vendor/leaprise.h b/arch/riscv/include/uapi/asm/vendor/leaprise.h
new file mode 100644
index 000000000000..9ee13f1ca559
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/vendor/leaprise.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+/* LeapRise vendor extensions: none defined yet */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cd7cf272e6e1..e60facabdd86 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -15,6 +15,7 @@
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
 #include <asm/vector.h>
+#include <asm/vendor_extensions/leaprise_hwprobe.h>
 #include <asm/vendor_extensions/mips_hwprobe.h>
 #include <asm/vendor_extensions/sifive_hwprobe.h>
 #include <asm/vendor_extensions/thead_hwprobe.h>
@@ -364,6 +365,9 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0:
 		hwprobe_isa_vendor_ext_mips_0(pair, cpus);
 		break;
+	case RISCV_HWPROBE_KEY_VENDOR_EXT_LEAPRISE_0:
+		hwprobe_isa_vendor_ext_leaprise_0(pair, cpus);
+		break;

 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index bf116c82b6bd..1f76fd4050c7 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only

 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_LEAPRISE)	+= leaprise.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_LEAPRISE)	+= leaprise_hwprobe.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_MIPS)  	+= mips.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_MIPS)  	+= mips_hwprobe.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+= sifive.o
diff --git a/arch/riscv/kernel/vendor_extensions/leaprise.c b/arch/riscv/kernel/vendor_extensions/leaprise.c
new file mode 100644
index 000000000000..08265f147092
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/leaprise.c
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/cpufeature.h>
+#include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/leaprise.h>
+
+/* LeapRise vendor extensions: none defined yet */
diff --git a/arch/riscv/kernel/vendor_extensions/leaprise_hwprobe.c b/arch/riscv/kernel/vendor_extensions/leaprise_hwprobe.c
new file mode 100644
index 000000000000..e7ffa57db4ab
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/leaprise_hwprobe.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/leaprise.h>
+#include <asm/vendor_extensions/leaprise_hwprobe.h>
+#include <asm/vendor_extensions/vendor_hwprobe.h>
+
+#include <linux/cpumask.h>
+#include <linux/types.h>
+
+#include <uapi/asm/hwprobe.h>
+#include <uapi/asm/vendor/leaprise.h>
+
+void hwprobe_isa_vendor_ext_leaprise_0(struct riscv_hwprobe *pair,
+				   const struct cpumask *cpus)
+{
+	pair->value = 0;
+}
-- 
2.27.0
