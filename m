Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166254E4C30
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618197; cv=none; b=Ln47i+Zb0j8CA7oaCslsJGBlCInTft+eLZ/C3xQXx6BrZOSzO0EtQiFlwVI0S5V/YbX5pYBpoSTql/ZzBLH8d0CpaYUw0AJhK2OX85hWz7CBP2dDsj240ovf4LuAw7RWrkdkb9SUL7iTtV3UelpWqfRh2BOLX1+Iaav1KdHVCTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618197; c=relaxed/simple;
	bh=d9cBTkOw0aK3AElv5ozuCCDHyzBzm/RESBhM7b8UGbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e/JEhlXzMszbmvLLgGXd5Obkevs4NB6p80+NhISHVua5tx5szXkELiY3PWHMwbsAchZSyhFWiXAStUQmGldooHz55f4HBg8vY2A+KmIDDsF06gCJFn7y3LgQ2BwJmnHMVkt0ivJF2MZptTG8rAk4w3+bhd1rqg9NPiQw/AhszNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=VZc3rWg5; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="VZc3rWg5"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so87954a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618195; x=1791222995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TVGlTnr9IEkHnZ4PdpN3QONqUPUFWJ903eZT9nZGA+U=;
        b=UoqsmccU28ko/Yhkl9sRoBrU6JFqNlzMxleNyf3MMEP4wtpuM7Jbe7WawNKU6TaLA1
         xrHH2WMznKW3ITpxXIJsIpaeb5qm8IUiuT9LHSSAh/IY3fn3xchh+PZgNSFhfEJ+61qS
         kPBe7PsSNwHBPlPhT1oIYiWQyLc1w+Sfh0NIrUblzvCYzu+PNiKlzni9vSexgxcAwgfb
         Bfcp5VHjWM1kGpxXRe8cZ1+gvC24NqSxBVqm3wvoUpwjHUptXvrxaFCpBqjCbghK51Gc
         MLlQkEGp7Q7DDauFpQn3jTNAt4hYPKTn/h2ZM1xsxSAhuAjmQ3D2nvauMlrgJddltjzJ
         WbQg==
X-Forwarded-Encrypted: i=1; AKwUvBz3Eqy7Wq4U1kZ8aXWL26JK7v7Bs16fZNqpaahYlj3qSsjHk9HnRPhNdimLdLPjtD8bgYjlaaS4aLi4mXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwT2FIhLVZXX6aE8zkWHi1Llz2GmS6OWQ4X87ERsM2uDM/ED0/
	Mktxds6Gm9tsW9cmP49zuRin0Aa/Th3wI/Z55YGCvBJYsWyuSSOVODcwN4Kl0WSQQncJF/FB7ZX
	1Krfl8Naiy6sG3ltZyaBvYR4jsCwaPChY4q3TFD//CiHxMSommoBTcjG7mYhuHg025dPGJ6gJIW
	LsfVrJFVH2QmF9tvyp/yZef6hqRplBcNgGcdtBHSTAgldo7aC1qaZCp2HQ7ddRxAQFcU3UdV+nc
	RKzKHzfpn9ZxZve
X-Gm-Gg: AYBFou3zoxD2OuiMJ6xTKfTNrsy8u7Irx8NpUqzOuADSLk2ljNWeoR0bZvTgATrPfqX
	PeyCgFW1t+qYyYsAsInhhX3sWIau+DZ0X/PEE4WtfSMGYbKjEd1PNaZ1f42gakP2sR3BTYwUTcP
	FBk1NsK7xzCkhPrv9HJafx7miwbQHNIPskQINQewKlPf6cdCe9DHG2oKWQdp2lkIxnbtkNp5yMY
	0ixFUdORefti4MbKCfVn2C8swuz2WLV83uUBPjvEpF0h6wJprlR+evq+pomeknid+z5/09gT/+B
	BrAVXW3lmIjUlZEz/AMAhbk9mz4zTPh3qS65j3EWfC8qEVkoNg7GtGnzz4c3NcRysavEIZ8tOxk
	0j7ztCqLwFW3CKPO+QBCSxhs2fGoweb5D70J6BBSgXS7kUbj38dGrtjuXRK9yUY/l3/qZwthqty
	Q6C5TodWTj2s6/bILxVCSSMee9EZTmmnYOugc=
X-Received: by 2002:a17:90b:35d2:b0:3a0:b3fe:91fe with SMTP id 98e67ed59e1d1-3a49c1e8078mr3422a91.42.1790618195051;
        Mon, 28 Sep 2026 10:56:35 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a498f17555sm35679a91.4.2026.09.28.10.56.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:56:35 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-342b66c0b06so119809eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790618193; x=1791222993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVGlTnr9IEkHnZ4PdpN3QONqUPUFWJ903eZT9nZGA+U=;
        b=VZc3rWg5nQAbac6tWqVkrJiayjSDCbf8EI06JnL+9FIzVyH2+9rBpJa/oEXy58zPC6
         8sXl45+rv5Ii8a6Hrny3mPpyBRmUPWTtbupvm2MRlDBVmMK537HEtOjEnG53d+9sqIGE
         dJ9oUwcOVBkVFp7u3ho2psRuSsvhy1n7Wr7ek=
X-Forwarded-Encrypted: i=1; AKwUvBz/uk/awIHr9UAOCQSNK7gVvPWOtgwcI5/P1jJrOMdhH41GQwiLntHeC2xYHJK4xHAIlkpQM/nwmawtGLk=@vger.kernel.org
X-Received: by 2002:a05:7300:6705:b0:33e:aa3d:ebe9 with SMTP id 5a478bee46e88-34af62b1643mr148591eec.12.1790618192285;
        Mon, 28 Sep 2026 10:56:32 -0700 (PDT)
X-Received: by 2002:a05:7300:6705:b0:33e:aa3d:ebe9 with SMTP id 5a478bee46e88-34af62b1643mr148550eec.12.1790618191428;
        Mon, 28 Sep 2026 10:56:31 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3421dbb2971sm26076069eec.10.2026.09.28.10.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:56:26 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>
Cc: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2 4/6] x86/vmware: Add a bounded pre-kdump log sender
Date: Mon, 28 Sep 2026 13:55:38 -0400
Message-ID: <c1313dbfd632d2d4f2c5a14577df24a6c1b3c34a.1790014793.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790014793.git.zack.rusin@broadcom.com>
References: <cover.1790014793.git.zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Preserve the newest kernel log tail in the host's vmware.log, which can
outlive a guest with no working userspace or persistent storage.

Allocate an 8 KiB buffer during early init and register on
panic_pre_kdump_list. A 4 KiB buffer can omit useful stack-trace
context. Use a fixed byte budget so transfer work does not scale
with PAGE_SIZE.

Copy the newest records, prefix them with "log ", and send one RPC over
the low-bandwidth register interface. Bound the transfer to 8 KiB and
at most three checkpoint attempts; zero-fill a partial payload word and
close the channel after every successful open.

The callback allocates nothing and emits no printk messages. Enable it
for ordinary guests, leaving encrypted guests disabled until explicitly
enabled by the sysctl. Skip initialization without printk support, and
leave logging disabled after allocation or registration failure.

Suggested-by: Michael Kelley <mhklinux@outlook.com>
Link: https://lore.kernel.org/r/SN6PR02MB41574A11D309A0530C63E0FED4842@SN6PR02MB4157.namprd02.prod.outlook.com
Link: https://lore.kernel.org/r/20260309235250.2611115-3-alexey.makhalov@broadcom.com
Co-developed-by: Bo Gan <bo.gan@broadcom.com>
Signed-off-by: Bo Gan <bo.gan@broadcom.com>
Co-developed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
v2: use the pre-kdump notifier, establish safe guest defaults, and
increase the fixed buffer to 8 KiB as Michael suggested.
Maaz's v1 Reviewed-by is omitted for renewed review of the new callback.

 arch/x86/include/asm/vmware.h |   1 +
 arch/x86/kernel/cpu/vmware.c  | 173 ++++++++++++++++++++++++++++++++++
 2 files changed, 174 insertions(+)

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
index 34b73573b108..ccf8dc84b30e 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -24,11 +24,16 @@
 #include <linux/dmi.h>
 #include <linux/init.h>
 #include <linux/export.h>
+#include <linux/kmsg_dump.h>
+#include <linux/mm.h>
+#include <linux/panic_notifier.h>
 #include <linux/clocksource.h>
 #include <linux/cpu.h>
 #include <linux/efi.h>
 #include <linux/reboot.h>
+#include <linux/sizes.h>
 #include <linux/static_call.h>
+#include <linux/wordpart.h>
 #include <linux/sched/cputime.h>
 #include <asm/div64.h>
 #include <asm/x86_init.h>
@@ -52,6 +57,23 @@
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
+#define VMWARE_LOG_BUF_SIZE		SZ_8K
+#define VMWARE_LOG_ATTEMPTS		3
+#define VMWARE_LOG_PREFIX		"log "
+#define VMWARE_LOG_PREFIX_LEN		(sizeof(VMWARE_LOG_PREFIX) - 1)
+
 struct vmware_steal_time {
 	union {
 		u64 clock;	/* stolen time counter in units of vtsc */
@@ -64,6 +86,12 @@ struct vmware_steal_time {
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
 
@@ -142,6 +170,151 @@ static unsigned long vmware_get_tsc_khz(void)
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
+static bool vmware_record_panic_msg;
+
+static int vmware_panic_log_notify(struct notifier_block *nb,
+				   unsigned long action, void *data)
+{
+	struct kmsg_dump_iter iter;
+	char *buffer = page_address(vmware_panic_page);
+	size_t length = 0;
+
+	if (!READ_ONCE(vmware_record_panic_msg))
+		return NOTIFY_DONE;
+
+	memcpy(buffer, VMWARE_LOG_PREFIX, VMWARE_LOG_PREFIX_LEN);
+	kmsg_dump_rewind(&iter);
+	(void)kmsg_dump_get_buffer(&iter, true,
+				   buffer + VMWARE_LOG_PREFIX_LEN,
+				   VMWARE_LOG_BUF_SIZE - VMWARE_LOG_PREFIX_LEN,
+				   &length);
+	(void)vmware_log_rpc(buffer, length + VMWARE_LOG_PREFIX_LEN);
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block vmware_panic_log_nb = {
+	.notifier_call = vmware_panic_log_notify,
+};
+
+static int __init vmware_panic_log_init(void)
+{
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_PRINTK) ||
+	    !hypervisor_is_type(X86_HYPER_VMWARE))
+		return 0;
+
+	vmware_record_panic_msg =
+		!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
+
+	vmware_panic_page = alloc_pages(GFP_KERNEL,
+					get_order(VMWARE_LOG_BUF_SIZE));
+	if (!vmware_panic_page) {
+		pr_err("failed to allocate panic log buffer\n");
+		return 0;
+	}
+
+	ret = atomic_notifier_chain_register(&panic_pre_kdump_list,
+					     &vmware_panic_log_nb);
+	if (ret) {
+		pr_err("failed to register panic log notifier: %d\n", ret);
+		__free_pages(vmware_panic_page, get_order(VMWARE_LOG_BUF_SIZE));
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
