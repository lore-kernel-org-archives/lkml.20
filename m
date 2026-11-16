Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793283;
	b=Aavm2NaMQ5UUAwImVNuxLzyH8Dcgoh2XWbzDUpKNEbP424U+aZtmJe38lJGUEXvj+xaA
	 50SKQpxi6Z/8gXS0RX3LpID2TpfnTV5XF4dtnMb+R8A4B0WZFCdxMfQfWuZLV8QYqHIaF
	 VumKufeQbfNtjD8K/B2QcSBKHJeXTbObUKMYVQ7r1vifebLv5mCdLKnqwNioBTepRJRYe
	 NquayReBTdZJM1mVWXMPZVXVS6prAbLna9ropGd+6fAjwlFE9wIpFTwa/C579irnj3Ggs
	 o/TuMt/paS9+qic4WxTeIFF8xeppeZSEZ8oyH+otdn/LesfBkluizDBXzjW1D1UNv0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793283;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=qOVRifjEIh993T1P++8v7aiHlVfmooUw7CEui+H3tlU=;
	b=wdVFxOWhI8lWyyhwMPqRVQcZrxxTIi4JikG5qiiNt51oNDJlg6UGJnz25udrip6EytZV
	 McCt7y2pvcA44nwMnV7t4d3dKAWR2jQbh/Wl0pSJvtpPEWnzsv1Rm1fTLlQpZu0sbzHQU
	 LIJJcfPXcqz4Svdgnv7dCmo9yetUf0skeh7gdAqwIXb4VrtxIOvqLgGVKfttrho2TmzCX
	 gBKVzA9tErhP1gfADFlJrY7DUdLEeDSB+Rlwe3NJ98vkPn/hnl2PRy8WJ9VnfCN9AYZYc
	 I/3Bt+a75OpIVJBeK+fP7pdXEZJc0606FW7dx2rbMvyPnU1ht1DtaUR7SAYusYmCXdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=invisiblethingslab.com;
	spf=pass smtp.mailfrom=invisiblethingslab.com;
	dkim=pass header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3 header.b=e6o+sZhv;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="tlwUYAX/";
	arc=none smtp.remote-ip=103.168.172.144
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0F1606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC0F1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3 header.b=e6o+sZhv;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tlwUYAX/
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id DB622EC00A0
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:41:21 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Sun, 15 Nov 2026 20:41:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1794793281; x=1794879681; bh=qOVRifjEIh993T1P++8v7aiHlVfmooUw
	7CEui+H3tlU=; b=e6o+sZhv9vNnpuQjKVPo4Y7TbJstPI8e46t5JtMDmQ6jYkWB
	lJF2T/9Q4KWCaS//Jbr86pxI0xz5/ZSX5wYFwJn5kuINozcaUJRxiD6lpziIN7sZ
	xttzw+hvw9NWoHTcmfeO2AWPDmGUbQdO7t0gE0NnHajDuzMo+R7hwxMC93WbBzeQ
	3nxP12oHSPCtNnIFAHy3weWYiGQbBslhr72ftsGWGXREvSz5PbkpMwX2VGLc5oQB
	gpfeSVAF7GQsDxngXQnKE0lR2tWeHzR8gQ2EE2O9efaiq2rtYM8E8acVJKfL70Tt
	Wu8DYw97xukofkJouNaAEBLCu3cslObQ4MMKHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1794793281; x=1794879681; bh=qOVRifjEIh993T1P++8v7aiHlVfm
	ooUw7CEui+H3tlU=; b=tlwUYAX/CXxoCaSwzahkWFx0vM+wmp/SbCk1FJaX/yYh
	+mD/Tz5Y/EpLQOOzguhu0zZV5edH6jRIFIip6axucvG95cJajL48Taw7yJ0GO+Hw
	gJFoJDCnkCNcnKp5NOa0z48oEpLJtnDt79j7nkSU8mICBCoPqJKasd5r1rud+5Xu
	oBHcKfCeqKkDMq7il6ZmdEEZJUqCn3NcZNg/8v71Ved1Ygp+PwBthb3da0Dqxwew
	YmEfwW0CcyY9BS66h/AWJr5MFRJfC52aqrrYQIH7aKMz/C3mknPlQ5fKxWbYGXdG
	PglOsv0qD9CVEl9gchhayv0gajhugcaChv1XRt9DNQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794793281; d=invisiblethingslab.com;
	mf=PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:iC6c0OsvdO+11B9EPgUAxfHJOeYwLo17S/uPBUg+aePpnJd
	3WuHWTSC28/nwFUzCtHzWgCyUSYiHxSnNuRLRZ6lVC0QKDMUQHdVldiIo0nyX4/p
	OV/aA4d2zoR0WsNv2LG1G6dBly4KPm+3oJvYr0Avo09qokHgRM7hq3XymFl+979c
	hwTRladuZ2M3LGHMzX60W+OCwjIhgwMA6mzi4Yb5ORPpKMMZ59/fGd+zWamypa8h
	UvEtPo2zbmTrrooAYGoSxWkEMCOdc+bmU9Ie+wCWCtqugkESCYn3dTd29l+Ai5Wl
	K0RVMDFxBPofDWIoqXml08KT2NYMpLzZrxAYdAw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:1SN0rHg403pKCKsUFESmzOqF79XzvvfZI36a3dIYBaA=:bH6VIesJ7bVxyymOjmyQ7IrGjgD+izqj4Tp/ckiFZ5g=;
X-ME-Sender: <xms:QF_6ap9z4uQ5irEsv2tVkOOoAcRoAKFwshkxMHyCwOz4KRVIpSOGnw>
    <xme:QF_6akO0TcZXPEnlwmZhyWsVYEOmrImyMbKELaV6b0uoPuKV6S8LFReghkrWyp4fp
    HD7yKtEZgxb1rBb9Qnwclp3XnsbxZgvjAj346efhBwu3JmlBg>
X-ME-Received: <xmr:QF_6alD9tx8NIwTYfo_XSCIbzGPvbzvjhZ3SmbvyMMM-jN-vv3VDP9JP8QsCYVyQVh32wbxP6tUJSgnJkD_pZBcef1DQRYm6fyLMJEsSoh6G1jAzru8>
X-ME-Proxy-Cause: dmFkZTFNbkdMvfZHqjlYQozYGzdt7rSOGQNYP1BQwzD/cpQdO5+gf4Yq8+qcS0xBb0L3dM
    NbVkdu/hPof9+k62Fjz0g7KxH2E0+2qj4/C/doFky029rxbABdrQQCJzh0ernbGcVqpEud
    oTVzeYHrCYT33e6yma2QVVkfY2I6OLD0Ib6f+6AWQskWsl9Mxai6/5P8eCKYh7hM0i4HAx
    gr7Kd9rI3H3hgSNMYj/o5WPfOptHxrKqKL6nREb8pOA64TUbvU0xPL8+qrVLjDNXstRzvy
    jnDMdJEWG1qqBVH9VnebaLkJTZcb9yZDICztpgiK/F3GWSkQVSIEkvg+uS2G0Q4Ci8e7TD
    ZQIlLXMl7fzDV2WCnD87Jdh5YbZ28/yYgrfhJ00DMbPl37RILpSvEv/mPylGFqaginuWjG
    CaBJ2rEvK+AxRYvRwfohPjJKPTLEtBOSLlxLlRyNPXMFFIDyuCTHMtNMUspWvna+zVWPx7
    zlo4x/xHqFzHXYPDN/rpIiXubPmuS7docN0SrZ9KWu6gJfQ9ZlK1WwEL4XGFOy2ThNC9Xw
    Jj/JFULs2qHnmAfcOrxUWVMn33xYOQ8+5lAXzvW5Cr2ZvArLee8IWMVLbsZAtKyJ9rxY06
    QxnRrdEt+Isdv5znplP8LrxCu6OCE78f4qXv0uQV4jZHCXwwS1SGcXZ1naTg
X-ME-Proxy: <xmx:QF_6agMHV8Jov2DMFvq-ZKOj9i8o9jWIBvo9XUaUyInj8TeNcqNA1w>
    <xmx:QF_6akeRDHrMwDIad-3aVA-KECXs4aFflgPSrtCBJNE9RUiTWB2v2A>
    <xmx:QF_6ap6YGV-NdvN8nsiy9OsnxsSqzmCMkNEtf5alCw4UomTLYRgQmg>
    <xmx:QF_6auI8I_pzNr_1HNK3j4k0DEa3diRESo81hSG5H-3BQVIACs9GZw>
    <xmx:QV_6ahEZh1ULQt4CLBabekzUb8IRQLWbms34R1b1Nvh4d_WoxdXiXnM7>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Nov 2026 20:41:18 -0500 (EST)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>,
	Prathyushi Nangia <prathyushi.nangia@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] x86/CPU/AMD: fix booting on Xen PV domU
Date: Mon, 16 Nov 2026 02:40:00 +0100
Message-ID: <20261116014057.7409-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reading the FCH_PM_S5_RESET_STATUS register doesn't make sense in a VM,
as it's about reporting last hardware reset reason and VM has no access
to it. On most hypervisors, reading it will simply return all-ones, but
unfortunately Xen PV domU is (again) special and trying to read not
allowed MMIO space results in a panic:

    1 of 1 multicall(s) failed: cpu 1
      call  1: op=1 arg=[ffff88801851b010] result=-22
    BUG: unable to handle page fault for address: ffffc9004002d3c0
    #PF: supervisor read access in kernel mode
    #PF: error_code(0x0000) - not-present page
    PGD 18f1b067 P4D 18f1b067 PUD 3e8f067 PMD 3e90067 PTE 0
    Oops: Oops: 0000 [#1] SMP NOPTI
    CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W           6.18.62-1.qubes.28.fc41.x86_64 #1 PREEMPT(full)
    Tainted: [W]=WARN
    RIP: e030:ioread32+0x32/0x60
    Code: ff 03 00 77 25 48 81 ff 00 00 01 00 76 08 89 fa ed e9 72 04 8c 00 8b 05 cc 62 88 01 85 c0 75 11 b8 ff ff ff ff e9 5e 04 8c 00 <8b> 07 e9 57 04 8c 00 83 e8 01 48 89 fe 48 c7 c2 67 db 14 82 48 c7
    RSP: e02b:ffffc9004000be00 EFLAGS: 00010292
    RAX: 43fa5d3f578e48f3 RBX: 928a59081d78a1d7 RCX: 00000000fed803c3
    RDX: 00000000039fffff RSI: 00000000fed803c0 RDI: ffffc9004002d3c0
    RBP: ffffc9004000be38 R08: 0000000000000000 R09: 00000000000fed80
    R10: 00000000000fed80 R11: 0720072007200720 R12: ffff888005118800
    R13: ffffc9004002d3c0 R14: 000000000000017a R15: ffffffff832a78cc
    FS:  0000000000000000(0000) GS:ffff888094f59000(0000) knlGS:0000000000000000
    CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: ffffc9004002d3c0 CR3: 000000000242c000 CR4: 0000000000050660
    Call Trace:
     <TASK>
     print_s5_reset_status_mmio+0x75/0x1c0
     ? __pfx_print_s5_reset_status_mmio+0x10/0x10
     do_one_initcall+0x5a/0x310
     do_initcalls+0x1ef/0x240
     kernel_init_freeable+0x18a/0x210
     ? __pfx_kernel_init+0x10/0x10
     kernel_init+0x1a/0x140
     ret_from_fork+0x158/0x170
     ? __pfx_kernel_init+0x10/0x10
     ret_from_fork_asm+0x1a/0x30
     </TASK>
    Modules linked in:
    CR2: ffffc9004002d3c0

Fix this by skipping the read when running in a VM, except Xen dom0
(which technically is a VM, but does have full access to the hardware).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 arch/x86/kernel/cpu/amd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 15286b71e9bf..fe3fe545608e 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -26,6 +26,7 @@
 #include <asm/resctrl.h>
 #include <asm/msr.h>
 #include <asm/sev.h>
+#include <xen/xen.h>
 
 #ifdef CONFIG_X86_64
 # include <asm/mmconfig.h>
@@ -1370,6 +1371,10 @@ static __init int print_s5_reset_status_mmio(void)
 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
 		return 0;
 
+	if (cpu_feature_enabled(X86_FEATURE_HYPERVISOR) &&
+	    !xen_initial_domain())
+		return 0;
+
 	addr = ioremap(FCH_PM_BASE + FCH_PM_S5_RESET_STATUS, sizeof(value));
 	if (!addr)
 		return 0;
-- 
2.56.0

