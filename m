Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F205C3A9605
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788891231; cv=none; b=dVgbWYcyq2fVOcJkCw7y73uw3aS5jLcjC3jUF/p69jg4lP6wqxkcPa0u8hYmzKVAjwpfIydeH0n3nHHNGvsmv7jlDbf0hbKywBt/DErOk9cR6HtxKzZGwgdgi4I3I5OSU2aeAO6UvaEB2zUUhJ4yMTSPzPOPx8789HQnBdT8O54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788891231; c=relaxed/simple;
	bh=j2DJfVUt0mtvNFgR9qjhwA26YfFt3lRsoWgx9vJ3wP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JnhiWvvDEj7bula0tka5XAuR8cdbjFS23SFUOOrTmkHRgnGBHSkWkM3MMS50Iuk3qps6CkSMSwcI9GNRY+SHqVeIaEKC0h8r+EsPc9BeFf9D2f7OfvjJmWWjjRlFVovi7XSyrXd59LSFpaXp9+UhVeprlIH9VRTfdxv+SB1m8nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Buz84a6K; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Buz84a6K"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-382ef647e20so5203224a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788891229; x=1789496029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+U6lKJy3E9UudZt3FknVdHylx4G9kfIGWhaOGKfOa4=;
        b=G+juz6CZJ4SvhjWjY9q6MvRTc8ZV3iJB+jbtdyVS87VBvEWM5KjIFKRvaq9ak2fC6K
         dauy0iT1liOF+TKTNSbqqSX3xv0ismosDQTWUKj4eLA6tM8X+xnCuGXMaSEOb1dRwpEU
         tCg+59hw3hPlY0tyoe3xIzK2pmiD4mWZYcEfUPI03PbdInh6qJ30AG8iiGvdapC/6BLj
         xPD8QPzXwOjKG/+IRvK9eLcyngIe2U3XRxTte9uFbNrdKm35K5cDNUCDVQ7vmDts0E+U
         nh46wZPZU4gHph4ouK4+0MjBy90xcR41jFtai1gV+gGZJczmNJqyVBkC4nKgGU6qvNae
         930w==
X-Forwarded-Encrypted: i=1; AKwUvByt1bHU0ERRp9qvDlJaX8i3+J9yeZQsxlweIiCj+i7E5w6qs+t7t6UfaPLfbgGlku4LZN19hf2bGpWiAGY=@vger.kernel.org
X-Gm-Message-State: AFuF++nb8/OPKkuVZPAFLeUj4R8nMNdByMbAeUOIPJqKuuNkBQ2hgbU3
	BzDZLV1lN4g8aQdCBeIQ1wtaYxaO9OMcHblt3iD+qPZQ29e1wIFDMl9FjIDFitVhztO5nUM87ui
	Ika1yBY5tRcdls48XBnHcQP3wBYeQFnZQW/BY9fyJWdam1LIp3YG2hEW2WvqyfHaVRsI/X32VvU
	BltS/oyUpVgOBGrkswNC2YBRQzRcpPpHpVFmVwzAhNBIJvUA56LYAdGhbi/esUGz191C90ZO3+p
	hcbUfFClyIML4mX
X-Gm-Gg: AYBFou30Po4XMGcUNxinuZtIY7akLflD+jvUXMz0DQpX535IDzcrVWHU9LuJ/vBWabh
	3yeL16N49Ojh41D8ZLcn9XER2sVT7DSa6f0bvWDsPq28aN3Kl8CpGcfpz31s1NmEkFjLM1WyAKb
	RFvhDcpyVesLLLyiK0jFpJ3X6lf3f23gFDUcExZKEXZew2oEncMnzmZNvcsgWjsthoFdZOXEKwZ
	IJ3hmg7qy23uA4Nw2ACoVAqe8lDSXuWpxGIc9HPCpdGpF4On8DGsi1dJjhcsNN13SdOEKkitHxp
	wzRiYFJedMxzzvHGSN6B3zTW4+ksjuA5AkirW01jfaMWKiDvv4WHlDq3aboomfd4Ee6+2d5xNnm
	fOfXFUjdqPbpRwxT5CtwkYZuF4NHhJEsJr6dcAq3fqYtWq1AoEeChNQfZooPnGUmkjBVG5HI6ew
	t1QI4XxGSIPjQnPaloMSE7hP/gRtR3iSrG5wE=
X-Received: by 2002:a17:90a:1c81:b0:39b:3109:10ce with SMTP id 98e67ed59e1d1-39b310914e0mr28091846a91.16.1788891228764;
        Tue, 08 Sep 2026 11:13:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b1600a403sm10369557a91.4.2026.09.08.11.13.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2026 11:13:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so83104641cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788891227; x=1789496027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+U6lKJy3E9UudZt3FknVdHylx4G9kfIGWhaOGKfOa4=;
        b=Buz84a6K0xdWIl64jv9rPHWLmUNiW6xmRe6TWqyjq2WyJL0xdmmflQIXt0MabWiwak
         CQJZLY3SQk2rQQxtVVb9/FN2IEmkfYS6QtDRSWHx/H6fkupGICZ4W9nN/EtyL16Bi1CV
         V2Q1az2bLGkuAaAYN19XxZTMeJwEoiGj3p5oU=
X-Forwarded-Encrypted: i=1; AKwUvByzxO2c9boySQG7CD0ft3HfT0aqOgf+4TRoGSVPyu5qkP1LyBabBjuCuRfZ3FU5sOrL0aPYNgZd7M0CXYI=@vger.kernel.org
X-Received: by 2002:a05:6214:4905:b0:90e:7e02:cc3f with SMTP id 6a1803df08f44-9103ef88ddemr25982186d6.18.1788890854645;
        Tue, 08 Sep 2026 11:07:34 -0700 (PDT)
X-Received: by 2002:a05:6214:4905:b0:90e:7e02:cc3f with SMTP id 6a1803df08f44-9103ef88ddemr25981186d6.18.1788890853962;
        Tue, 08 Sep 2026 11:07:33 -0700 (PDT)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106412e038sm27114866d6.20.2026.09.08.11.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:07:29 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Petr Mladek <pmladek@suse.com>,
	Joel Granados <joel.granados@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v1 2/4] x86/vmware: Add the vmware_record_panic_msg sysctl
Date: Tue,  8 Sep 2026 14:07:14 -0400
Message-ID: <03e5c9855e9578b00abf8da69764f1b468597218.1788414671.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788414671.git.zack.rusin@broadcom.com>
References: <cover.1788414671.git.zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Full panic text is useful on ordinary guests. Encrypted guests should
export it only when an administrator opts in. Reporting a crash does not
require transferring the log.

Enable panic recording by default for ordinary VMware guests and disable
it when guest memory encryption is active. Expose the policy as the
boolean kernel.vmware_record_panic_msg sysctl and document that it
controls only the vmware.log transfer.

Register the sysctl only after the panic buffer and dumper are ready, and
only when sysctl support is built. A registration failure leaves the
internal default in force.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 14 +++++++++++++
 arch/x86/kernel/cpu/vmware.c                | 23 +++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index b6328cd0f43e..4577e935ddcf 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1690,6 +1690,20 @@ entry will default to 2 instead of 0.
 = =============================================================
 
 
+vmware_record_panic_msg
+=======================
+
+Controls whether panic kmsg data is written to the host's ``vmware.log``.
+This setting does not control the separate VMware guest-crash event.
+
+= ==============================================================
+0 Do not write panic kmsg data to ``vmware.log``. This is the
+  default for encrypted guests.
+1 Write panic kmsg data to ``vmware.log``. This is the default for
+  ordinary guests.
+= ==============================================================
+
+
 warn_limit
 ==========
 
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index bf59653d6e07..3848811550e9 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -31,6 +31,7 @@
 #include <linux/efi.h>
 #include <linux/reboot.h>
 #include <linux/static_call.h>
+#include <linux/sysctl.h>
 #include <linux/wordpart.h>
 #include <linux/sched/cputime.h>
 #include <asm/div64.h>
@@ -255,6 +256,19 @@ static int vmware_log_rpc(const char *buffer, size_t length)
 }
 
 static struct page *vmware_panic_page;
+static int vmware_record_panic_msg;
+
+static const struct ctl_table vmware_panic_sysctls[] = {
+	{
+		.procname	= "vmware_record_panic_msg",
+		.data		= &vmware_record_panic_msg,
+		.maxlen		= sizeof(vmware_record_panic_msg),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	},
+};
 
 static void vmware_panic_log_dump(struct kmsg_dumper *dumper,
 				  struct kmsg_dump_detail *detail)
@@ -263,6 +277,9 @@ static void vmware_panic_log_dump(struct kmsg_dumper *dumper,
 	char *buffer = page_address(vmware_panic_page);
 	size_t length = 0;
 
+	if (!READ_ONCE(vmware_record_panic_msg))
+		return;
+
 	memcpy(buffer, VMWARE_LOG_PREFIX, VMWARE_LOG_PREFIX_LEN);
 	kmsg_dump_rewind(&iter);
 	(void)kmsg_dump_get_buffer(&iter, true,
@@ -283,6 +300,9 @@ static int __init vmware_panic_log_init(void)
 	if (!hypervisor_is_type(X86_HYPER_VMWARE))
 		return 0;
 
+	vmware_record_panic_msg =
+		!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
+
 	vmware_panic_page = alloc_page(GFP_KERNEL);
 	if (!vmware_panic_page) {
 		pr_err("failed to allocate panic log buffer\n");
@@ -295,6 +315,9 @@ static int __init vmware_panic_log_init(void)
 		__free_page(vmware_panic_page);
 		vmware_panic_page = NULL;
 	}
+	if (vmware_panic_page && IS_ENABLED(CONFIG_SYSCTL) &&
+	    !register_sysctl("kernel", vmware_panic_sysctls))
+		pr_err("failed to register panic log sysctl\n");
 
 	return 0;
 }
-- 
2.53.0

