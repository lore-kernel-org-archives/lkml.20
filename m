Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794684882;
	b=Va0hVvlnqSPKbujU0326mCWIoBdK0p4/VNwKwCv+0f8NRD7hhYa7lzlZY8yy0bTVn7Wg
	 MdZphNzvdsLdS2zoDO5BxdtXRRn+N7BmzAtzomJRSKvCY4I1WONP4jny8e4rOfvv4tImJ
	 SmhmMdBvO+3OcGWCpFLjr0dUC+v9cj8Yj3esqNhXsEQaXoamvTjA/z0OjNPTjT3mv3rt0
	 FAW0xPF/e25jzd+yy0n0MMdT28yS4NlNQfI+Z3ipycS15wXYCUd8cfImlMC0wjOEYmN7x
	 r/RanmVFJ7sAFa+Gl1EzGrTgJFzgpxaxRFodxEEe8Bn9jh5F3JG7VOeUekWeYzi/6DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794684882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4XRaUjntmnwgXMBa6bG6H6t68ZP5x01BzH1Lhm94CSs=;
	b=BTuAnGGRhhgfnO/Z+LHU1XwlJoDhN+aL/lAVZodCZKCAO39Eises3Xy8rezJ9BOEN8JR
	 9L/TXpqgdSuPeLq9LxUuRhB3oxxYm1PmJTzm9J51a4kGFmqeTMAHPQzC9I//IqDy1a+DA
	 Ws22lHcxQrjgaEpHasnu0Yg/TdmOC3K0EEpLAWMJBD7B4T+3ifZXw0bZR+eyfBeaZOaHt
	 th5HT/CmgeQTs5uEduYbocF1snUmovVv3wUTdn4YyM6XzNQYKBTgcctaUCJpv6VqOfh6D
	 UBsUAtKT2d9C8MmRwKnffPimKIg5+oHpymoEN2e3fFm/MXTTaZAHtxRgvZYZhBai7xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nMkesfph;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB451606A880
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB451606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nMkesfph
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb684859cbso1821848a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684881; x=1795289681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4XRaUjntmnwgXMBa6bG6H6t68ZP5x01BzH1Lhm94CSs=;
        b=nMkesfpha3IiAu8eFTJotinhZcu2J28OQMJipRI6kXIr8GsJYdbTCe1FwN6G3tz4CU
         8lYRS/q/LMN94I1Qmk7Y80BMjTG/WmRZtrj9qtlNXXcCZVtOqEe4oljdF1DnnRCThoYs
         lcDSo/JDgmpmi6fvDRGh8NRfOBfO//vt9VTlkrp9SAIdPEX5UrLNmaWxAblfM5oXdtE/
         aylciJhX8Y9ifhod7bittejOWiMFZpeOPvaZKsBxlMMJyz31LyEssDRIRy8sKHp+3bfC
         fSqgoIamXjgl+0liu5GkPsMxaPtRRkye/lFB8P1lREjPBjVLEtVi8gE8su4bz+3uyQLO
         P7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684881; x=1795289681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4XRaUjntmnwgXMBa6bG6H6t68ZP5x01BzH1Lhm94CSs=;
        b=zGHbewienhVgwuqg4MlEJRr+ABTCw48U5mpPOTYukBrpO7E2I+Sa1rBNZvAI4cb9ZE
         nFevYjfsIUKXksUJUJ9xZtg5OShWptAKOwc7bAzJA1vycfnGjzAh0t1oA+IH52HBQC2X
         vqKDx3gftaJQGQewZ1zubGSnrOF4+cJN+lzyW1nyaKgsqa4lNCkje85Q5KbJS6Q51hRB
         VelsQGFN7yihVEL3eR455lB1HdzLCIZbZtqiM31G6tchFVL5IxvBd9BsfwP0nZfgf2+Y
         GT0ohdBRj3aHiX9Jmctp6uajY8GczuGMGz6adKIrs2LDcnxD1tBAyDIr3UDerQezKGpe
         CXEA==
X-Forwarded-Encrypted: i=1; AL+hErHA1DqRb19weiB5FIda5VPDsanFBWXQastrceW9Ep4VlPhHgaUO2ltp6isgm0kLZe+4hHhQ9W5l4zMOhLc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/prGnYegsV2I8yxKNDHoOnTzPojMI8pLR7XG+QOnoXZwCIRgMM
	yMYO+Sw3GQpMG8uD36KczJnMVU1xJAUJJ/MmCOeo5oGJBip4ZBcMT7+n
X-Gm-Gg: AYBFou3y0lwDDqr52DFQDc5k77y19FVmyHzJ+WKLxv2O90Q7dkAoXma5FsEedQvkabD
	TmU54fuZdnMdDxXBtvWo0vFnPp8tifYzKlfqnqNedVPKAMNZKy5Vl61UAEHeWhk2y9IDLMzO4Or
	ZHMSXH/6E7cscnOvpr2dU5bzG60oBj3g8w2FRQNsS6dIhPKbz5wLPxqCyfZzzIDzMaFGCBn/00l
	9wJjS+PPx/vyQy7HWWDqLWxGxw2LhFJSkgW2NyVGqepka3RSdz31ni/mw0joPvY/4Ff69JZmYXp
	EPbNDkXLJsPgA4tHCq5Xbh31lHPufIlbmGDjqmsrfQATYue4e55lk36ZwHaYAniF/HlGYRp/9N0
	BGCjHmXR+fFo4l+nn3SUb4FmrezxLDez9gBz5xR1YTbBBaD2JprP9b1+KbK4eAxiNDieHIXk2So
	xUhXQhTbwcaanC9XQqpr3zOKxEZZN4wR8IB9TK6As9MolbMddMfiaaD7HTDp5hNSgjdGtIXlqUZ
	lyTI0lAx62LYcyRTklL2Hq016p58buvF4d8zBQ8zQpIuuS7qGDVsYBtg1HagmRNOl4+22MZN1ko
	V+o5AGURo5PwYIdqnJHVgkFypo2zzt5Mb7PKE4iuRaNWEROXFs6kQVEplWdshd5q7TXxK/oflVK
	DBI5RsftOPFj60dHrzZMAqzI0DkVS3F56Cd6A7xVLVuvLXRmpJK9apHnBC2AkLrMXCCAhABjJDH
	/LuA9dKVIYoSqliD0TqUC0FC1e0hJf4MSxsTE5khzg
X-Received: by 2002:a17:90b:1f8d:b0:3a8:6045:5a19 with SMTP id 98e67ed59e1d1-3b1b0a20e04mr6004859a91.37.1794684881101;
        Sat, 14 Nov 2026 11:34:41 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b24938bdsm5093969a91.1.2026.11.14.11.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:34:40 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Stuart Yoder <stuart.yoder@arm.com>,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH v2 2/4] tpm: tpm_crb_ffa: Only probe when ACPI TPM2 uses FF-A
Date: Sat, 14 Nov 2026 19:34:32 +0000
Message-ID: <20261114193434.117714-3-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114193434.117714-1-sidchintamaneni@gmail.com>
References: <20261114193434.117714-1-sidchintamaneni@gmail.com>
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

Prior to commit 677042afb97a ("tpm: tpm_crb_ffa: revert defered_probed
when tpm_crb_ffa is built-in"), built-in tpm_crb_ffa only registered
tpm_crb_ffa_driver from tpm_crb_ffa_init() after crb_acpi_probe()
confirmed start_method == ACPI_TPM2_CRB_WITH_ARM_FFA. After that
commit, tpm_crb_ffa unconditionally registers on the FF-A bus at
device_initcall time (and when loaded as a module) without checking
the platform's ACPI TPM2 start method.

A platform's firmware may expose a TPM CRB over FF-A Secure Partition
for UEFI boot services while advertising a non-FF-A start method to
the OS in the ACPI TPM2 table. When the ACPI TPM2 table designates a
non-FF-A start method, Linux has no consumer for tpm_crb_ffa and
should not probe the FF-A TPM service.

On Microsoft Cobalt 200 systems, the ACPI TPM2 table does not use
ACPI_TPM2_CRB_WITH_ARM_FFA, yet ffa_init() discovers the FF-A TPM
partition and tpm_crb_ffa_probe() unconditionally sends
CRB_FFA_GET_INTERFACE_VERSION via FFA_MSG_SEND_DIRECT_REQ2/REQ SMC.
That request wedges the calling CPU in Secure World (with Non-Secure
interrupts and GICv3 pseudo-NMIs masked), hanging boot with an RCU CPU
stall:

  [    5.507519] ARM FF-A: Driver version 1.2
  [    5.507519] ARM FF-A: Firmware version 1.2 found
  [    5.507551] ARM FF-A: Notification setup failed -61, not enabled
  [    7.150580] Freeing initrd memory: 293640K
  [   65.515248] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
  [   65.521346] rcu:     10-...0: (3 GPs behind) idle=dd9c/1/0x4000000000000000 softirq=37/37 fqs=5262
  [   65.530031] rcu:              hardirqs   softirqs   csw/system
  [   65.535589] rcu:      number:        0          0            0
  [   65.541146] rcu:     cputime:        0          0            0   ==> 30028(ms)
  [   65.548102] rcu:     (detected by 66, t=15010 jiffies, g=-951, q=1384 ncpus=132)
  [   65.555228] Sending NMI from CPU 66 to CPUs 10:
  [   75.560686] After 10 seconds, these CPUS still haven't responded to the NMI: 10

Check tpm2_acpi_start_method in tpm_crb_ffa_probe() and return -ENODEV
unless it equals ACPI_TPM2_CRB_WITH_ARM_FFA. Checking in probe() rather
than module_init allows tpm_crb_ffa.ko to load as a symbol dependency
of tpm_crb.ko on non-FF-A platforms when built as modules, while
skipping FF-A TPM requests unless ACPI advertises the FF-A start
method.

Fixes: eb93f0734ef1 ("tpm_crb: ffa_tpm: Implement driver compliant to CRB over FF-A")
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 drivers/char/tpm/tpm_crb_ffa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/char/tpm/tpm_crb_ffa.c b/drivers/char/tpm/tpm_crb_ffa.c
index 025c4d4b17ca..da676da6f3f0 100644
--- a/drivers/char/tpm/tpm_crb_ffa.c
+++ b/drivers/char/tpm/tpm_crb_ffa.c
@@ -9,9 +9,11 @@
 
 #define pr_fmt(fmt) "CRB_FFA: " fmt
 
+#include <linux/acpi.h>
 #include <linux/arm_ffa.h>
 #include <linux/delay.h>
 #include <linux/moduleparam.h>
+#include "tpm.h"
 #include "tpm_crb_ffa.h"
 
 static unsigned int busy_timeout_ms = 2000;
@@ -324,6 +326,9 @@ static int tpm_crb_ffa_probe(struct ffa_device *ffa_dev)
 	struct tpm_crb_ffa *p;
 	int rc;
 
+	if (tpm2_acpi_start_method != ACPI_TPM2_CRB_WITH_ARM_FFA)
+		return -ENODEV;
+
 	/* only one instance of a TPM partition is supported */
 	if (tpm_crb_ffa && !IS_ERR_VALUE(tpm_crb_ffa))
 		return -EEXIST;
-- 
2.45.4

