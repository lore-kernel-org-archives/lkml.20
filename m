Received: from mail-vs1-f98.google.com (mail-vs1-f98.google.com [209.85.217.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A28E526AB3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788891195; cv=none; b=Y2LBbqi+HKmyg1PfFEUvMpciOx+Qq2mfzoRMGHNFIEKMyXGiFE1GqtjXOdoGLdX4I2p4dC/245+8pTJjwXjBNe6DXHa/bwYpt9VviKF72oHt5C3/0JoaUkQUwyh7SgDHW5ikqLkVSzTti+QsbENteCOhDRwMYLpk+HQRrBSRV0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788891195; c=relaxed/simple;
	bh=Mvcs9Lt0sPQOGP5yNJDCK3xofsCRtXPW55QU80iioj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jIjH6zUXLk+RZVZfH7lpJgHd3N0fL+g0Dfp9d09WBUQkzH8n5M/ef/6nqupNMa5boeSnzOKKTmPwSDPDdTJQthKSV1lleVg5IBxbYZ14Q9ojvn2rWFnyhs30+58Ba7rQV0Sqnr9Ssns8sZeWUWqmbtPNOZpGyzh6FXs5x+6ISRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WErKZg57; arc=none smtp.client-ip=209.85.217.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WErKZg57"
Received: by mail-vs1-f98.google.com with SMTP id ada2fe7eead31-7564b7a9490so3950160137.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788891193; x=1789495993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIZhE29+oVPTSBZvjxk3RWug8DvHvEXFsH8XGpUQx0Y=;
        b=O83GmB8KTlqriUbCMZx1fShq24B6FoQFPQOODpIf1kPzpJKxdyA5GX8IOQt+qGFM9I
         5Yrcq0so6LgzzOipAiO/YYb1ftoLqEn0aLB7MHwVZdMjTxn1JKXLxHdtzNIuBpDdlIAh
         pX2j6XzGZ6XgdMyn2PigzaI1lRDWH3hA3udETHDLzX3Sz22MFBonvUXRDFGz6XvJQeTK
         GNAGqwwpesBksF/MICX0sd2SYF7jPpL4pHjKHBJ9Y9n3zQmf9/RH8EDPjT0OKJDKsVKz
         sl30sjlgnWQmva1hu+71Ln7IP6RHssDfcV4hD3pRx6rGrEFZ8Imq2uLQS0SeHMfm5JO7
         Y/+w==
X-Forwarded-Encrypted: i=1; AKwUvBx5+Tg2hsaOkiXAagbChD3+ZOB+4rgA70SEZjnwsCse2BBE0TjVOUbeZf3j0rL8gEQkk9i+q3+wIKSL/v8=@vger.kernel.org
X-Gm-Message-State: AFuF++ks7vHn3ku5W0v9P91rNy1dZeosxVCm9pI5r8rLTIzP18TOV7IQ
	7n54iM5mqBR4I4+pVgKfLc+XAeq3qhVhLbavz1Y6qN3VYtOhizgImyR/PhY0Js5PczRaVRZHXd9
	Px9aYWSW5uZ5WSTZcrZ5fS6aTXxBQkgR8yvRm7YUQWz7BOPrxFbI260V9Jn/Rp4YPS3gUm3vJ6K
	YCAlYxq6IXaltWXnRx8+PkmS1VrCQEBDieHi9jT/7rZrcyNiNXTNbN7768SaguoPTuS2L4tL1PT
	Y4y6Je3OAOWnTop
X-Gm-Gg: AYBFou0SJkyVcHk9v8rkhyS8j3ivIsynOKTFdBkiCY8gzuI4MQUGNxxYLzaxrXW7SPl
	JVKPLKCykmRk2zUFU83dyQ8Lf1qdM6AWvVDssebUMCFtKTbItGY2eynfpqCSDV08YU8DjVdkPpL
	RADKMgDeyY7aSkphrh+FoR2H7cykOieL1jwZV7+9TpQnSD6s3YwzD61nust9xW33TJVtBroFg8D
	ZKPvvYy6f39iB9Tuzs9bb251Kd33k1bbb4T1mfO3A9Wm+rrv6vuRJP8WZWsydkfHNxLGXh8H8CO
	dvuWmqpSwZZaFPeeqGNQvvI4sisXUXddCC3K0Z3PD9kJpVDJRHMlZIc9K9f9tL2Jqa4rOWtjIoR
	OBje35jNgmPmjJVJR0JDxUwM1YuZipEroTanAguDMx9JMOa6xtRtp9w9JxM8/s1662ukYmAssu4
	W6+qe2mzpZdN/a+xwlbQuvj0Z9WGNh+uug
X-Received: by 2002:a05:6102:80a4:b0:785:8ad4:57f2 with SMTP id ada2fe7eead31-78dd0104c80mr2264059137.2.1788891192813;
        Tue, 08 Sep 2026 11:13:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-78a64bccd0csm192406137.26.2026.09.08.11.13.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2026 11:13:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bffdc86fd4so5357428e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788891192; x=1789495992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIZhE29+oVPTSBZvjxk3RWug8DvHvEXFsH8XGpUQx0Y=;
        b=WErKZg57p8gkWugOWsPxGe9p2sPvih4iVqTEzODlB10aB8sUCwWLjl0JzHolkmaIAr
         tavXb/dVm5b12tGoE57Fh71v5E5glDBXBILgaBmZAk4Wqts9Koa5AGhben+q0Llx5M8W
         SHzV/GraXTgsgp5zEs/t95Y4PiQQ03TUduJVc=
X-Forwarded-Encrypted: i=1; AKwUvBwQj3RT/5P1sXTyV+9JtbbMAL/gNLj3n5JZEmjRqTj0KqbB3IfE3UGxY7aTuYRgz2ioMNBb0yQSWv4Kvt8=@vger.kernel.org
X-Received: by 2002:a0c:e003:0:b0:910:69e3:2983 with SMTP id 6a1803df08f44-91069e33187mr23819576d6.5.1788890849448;
        Tue, 08 Sep 2026 11:07:29 -0700 (PDT)
X-Received: by 2002:a0c:e003:0:b0:910:69e3:2983 with SMTP id 6a1803df08f44-91069e33187mr23818676d6.5.1788890848717;
        Tue, 08 Sep 2026 11:07:28 -0700 (PDT)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106412e038sm27114866d6.20.2026.09.08.11.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:07:27 -0700 (PDT)
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
Subject: [PATCH v1 1/4] x86/vmware: Add a bounded panic log sender
Date: Tue,  8 Sep 2026 14:07:13 -0400
Message-ID: <18115e519d85b753c147b45470120721eaf14505.1788414671.git.zack.rusin@broadcom.com>
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

A virtual machine may have no guest-local persistent storage or working
userspace after a panic. Preserve the newest kernel log tail in the host
vmware.log, which remains available after the VM terminates.

Allocate one page during early init and register a panic-only kmsg dumper.
Copy the newest records once, prefix them with "log ", and send one
explicit-length RPC message over the low-bandwidth register path. The page
limit bounds panic-time work and avoids sharing guest memory with the host.

Keep the source immutable for up to three attempts. Retry only checkpoint
responses, zero-fill a short final word, and close the single RPC channel
on every exit after open. The panic callback allocates nothing, does not
sleep, and emits no printk messages.

Free the page and leave panic logging disabled if dumper registration
fails, including when CONFIG_PRINTK=n.

Link: https://lore.kernel.org/r/20260309235250.2611115-3-alexey.makhalov@broadcom.com
Co-developed-by: Bo Gan <bo.gan@broadcom.com>
Signed-off-by: Bo Gan <bo.gan@broadcom.com>
Co-developed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/include/asm/vmware.h |   1 +
 arch/x86/kernel/cpu/vmware.c  | 158 ++++++++++++++++++++++++++++++++++
 2 files changed, 159 insertions(+)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 4220dae14a2d..598d4cd448ec 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -57,6 +57,7 @@
 #define VMWARE_HYPERVISOR_MAGIC		0x564d5868U
 
 #define VMWARE_CMD_GETVERSION		10
+#define VMWARE_CMD_MESSAGE		30
 #define VMWARE_CMD_GETHZ		45
 #define VMWARE_CMD_GETVCPU_INFO		68
 #define VMWARE_CMD_STEALCLOCK		91
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 34b73573b108..bf59653d6e07 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -24,11 +24,14 @@
 #include <linux/dmi.h>
 #include <linux/init.h>
 #include <linux/export.h>
+#include <linux/kmsg_dump.h>
+#include <linux/mm.h>
 #include <linux/clocksource.h>
 #include <linux/cpu.h>
 #include <linux/efi.h>
 #include <linux/reboot.h>
 #include <linux/static_call.h>
+#include <linux/wordpart.h>
 #include <linux/sched/cputime.h>
 #include <asm/div64.h>
 #include <asm/x86_init.h>
@@ -52,6 +55,22 @@
 #define STEALCLOCK_DISABLED        0
 #define STEALCLOCK_ENABLED         1
 
+#define VMWARE_MSG_STATUS_SUCCESS	BIT(16)
+#define VMWARE_MSG_STATUS_CPT		BIT(20)
+
+#define VMWARE_RPCI_PROTOCOL		0x49435052
+#define VMWARE_GUESTMSG_COOKIE		BIT(31)
+
+#define VMWARE_MSG_TYPE(n)		((n) << 16)
+#define VMWARE_MSG_OPEN			VMWARE_MSG_TYPE(0U)
+#define VMWARE_MSG_SENDSIZE		VMWARE_MSG_TYPE(1U)
+#define VMWARE_MSG_SENDPAYLOAD		VMWARE_MSG_TYPE(2U)
+#define VMWARE_MSG_CLOSE		VMWARE_MSG_TYPE(6U)
+
+#define VMWARE_LOG_ATTEMPTS		3
+#define VMWARE_LOG_PREFIX		"log "
+#define VMWARE_LOG_PREFIX_LEN		(sizeof(VMWARE_LOG_PREFIX) - 1)
+
 struct vmware_steal_time {
 	union {
 		u64 clock;	/* stolen time counter in units of vtsc */
@@ -64,6 +83,12 @@ struct vmware_steal_time {
 	u64 reserved[7];
 };
 
+struct vmware_rpc_channel {
+	u16 id;
+	u32 cookie_high;
+	u32 cookie_low;
+};
+
 static unsigned long vmware_tsc_khz __ro_after_init;
 static u8 vmware_hypercall_mode     __ro_after_init;
 
@@ -142,6 +167,139 @@ static unsigned long vmware_get_tsc_khz(void)
 	return vmware_tsc_khz;
 }
 
+static int vmware_log_open(struct vmware_rpc_channel *channel)
+{
+	u32 info, id;
+
+	vmware_hypercall6(VMWARE_CMD_MESSAGE | VMWARE_MSG_OPEN,
+			  VMWARE_RPCI_PROTOCOL | VMWARE_GUESTMSG_COOKIE, 0,
+			  &info, &id, &channel->cookie_high,
+			  &channel->cookie_low);
+	if (!(info & VMWARE_MSG_STATUS_SUCCESS))
+		return -EIO;
+
+	channel->id = upper_16_bits(id);
+	return 0;
+}
+
+static int vmware_log_close(const struct vmware_rpc_channel *channel)
+{
+	u32 info;
+
+	vmware_hypercall5(VMWARE_CMD_MESSAGE | VMWARE_MSG_CLOSE, 0,
+			  (u32)channel->id << 16, channel->cookie_high,
+			  channel->cookie_low, &info);
+
+	return info & VMWARE_MSG_STATUS_SUCCESS ? 0 : -EIO;
+}
+
+static int vmware_log_send_once(const struct vmware_rpc_channel *channel,
+				const char *buffer, size_t length)
+{
+	u32 info;
+
+	vmware_hypercall5(VMWARE_CMD_MESSAGE | VMWARE_MSG_SENDSIZE, length,
+			  (u32)channel->id << 16, channel->cookie_high,
+			  channel->cookie_low, &info);
+	if (!(info & VMWARE_MSG_STATUS_SUCCESS))
+		return info & VMWARE_MSG_STATUS_CPT ? -EAGAIN : -EIO;
+
+	while (length) {
+		size_t bytes = min_t(size_t, length, sizeof(u32));
+		u32 word = 0;
+
+		memcpy(&word, buffer, bytes);
+		vmware_hypercall5(VMWARE_CMD_MESSAGE | VMWARE_MSG_SENDPAYLOAD,
+				  word, (u32)channel->id << 16,
+				  channel->cookie_high, channel->cookie_low,
+				  &info);
+		if (!(info & VMWARE_MSG_STATUS_SUCCESS))
+			return info & VMWARE_MSG_STATUS_CPT ? -EAGAIN : -EIO;
+
+		buffer += bytes;
+		length -= bytes;
+	}
+
+	return 0;
+}
+
+static int vmware_log_send(const struct vmware_rpc_channel *channel,
+			   const char *buffer, size_t length)
+{
+	int attempt, ret;
+
+	for (attempt = 0; attempt < VMWARE_LOG_ATTEMPTS; attempt++) {
+		ret = vmware_log_send_once(channel, buffer, length);
+		if (ret != -EAGAIN)
+			return ret;
+	}
+
+	return -EAGAIN;
+}
+
+static int vmware_log_rpc(const char *buffer, size_t length)
+{
+	struct vmware_rpc_channel channel;
+	int close_ret, ret;
+
+	ret = vmware_log_open(&channel);
+	if (ret)
+		return ret;
+
+	ret = vmware_log_send(&channel, buffer, length);
+	close_ret = vmware_log_close(&channel);
+	if (!ret && close_ret)
+		ret = close_ret;
+
+	return ret;
+}
+
+static struct page *vmware_panic_page;
+
+static void vmware_panic_log_dump(struct kmsg_dumper *dumper,
+				  struct kmsg_dump_detail *detail)
+{
+	struct kmsg_dump_iter iter;
+	char *buffer = page_address(vmware_panic_page);
+	size_t length = 0;
+
+	memcpy(buffer, VMWARE_LOG_PREFIX, VMWARE_LOG_PREFIX_LEN);
+	kmsg_dump_rewind(&iter);
+	(void)kmsg_dump_get_buffer(&iter, true,
+				   buffer + VMWARE_LOG_PREFIX_LEN,
+				   PAGE_SIZE - VMWARE_LOG_PREFIX_LEN, &length);
+	(void)vmware_log_rpc(buffer, length + VMWARE_LOG_PREFIX_LEN);
+}
+
+static struct kmsg_dumper vmware_panic_log_dumper = {
+	.dump = vmware_panic_log_dump,
+	.max_reason = KMSG_DUMP_PANIC,
+};
+
+static int __init vmware_panic_log_init(void)
+{
+	int ret;
+
+	if (!hypervisor_is_type(X86_HYPER_VMWARE))
+		return 0;
+
+	vmware_panic_page = alloc_page(GFP_KERNEL);
+	if (!vmware_panic_page) {
+		pr_err("failed to allocate panic log buffer\n");
+		return 0;
+	}
+
+	ret = kmsg_dump_register(&vmware_panic_log_dumper);
+	if (ret) {
+		pr_err("failed to register panic log dumper: %d\n", ret);
+		__free_page(vmware_panic_page);
+		vmware_panic_page = NULL;
+	}
+
+	return 0;
+}
+early_initcall(vmware_panic_log_init);
+
 #ifdef CONFIG_PARAVIRT
 static struct cyc2ns_data vmware_cyc2ns __ro_after_init;
 static bool vmw_sched_clock __initdata = true;
-- 
2.53.0

