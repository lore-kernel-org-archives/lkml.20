Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022BC448CE0;
	Thu, 17 Sep 2026 06:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628180; cv=none; b=sTcCs4eFhh2BAJbbUI3IazZyTd4LGdI9ZMJmNYt9bIuCI2S6+zL6g85XWORHg2pzGyk5yl6UCnL8HcMtwvcFL9rW+0r/U+uteyiR7puxmPXP+If5FosMo/yKK1IxFxrKEMFQqHPTs3xMuTK5Qj/l5ai995fXHrKNHMhP4YcJkG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628180; c=relaxed/simple;
	bh=HkFyXU3GrMDWZj6lwB6sbWO20HmdluEGTiSCcMBCJNo=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=jBv5nulsuhRK6DSymGujbN9MvtQQVQEZQ0yofTJGWG2sPeYKhspuZACJn6XJqXWtim127Siri/l8yuAQM89c+mjxBkxXlqeb/0xbpUQ3IYg6rhnUvWxjZ9V0jRUiqG7FdY59QAU4dQTpINROn+iwoXsuIGSdfbzOPQwLzVt7LBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=PqGbtwEU; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="PqGbtwEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789628168; bh=j1Fc/4Xsm/exGsgjT4jGufeye/rOfxrIgfcyhzDzAv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PqGbtwEUZZ1TIzE2q2KtgcGmeDRG7GF1XifWTaxo8RyPwWmc+DnDpFiV6gDL9cMTx
	 UYW0uBNIeahEDiuhlxqerECXl16CnLdnklbh/HdhlsroSq0FMxw+WT1sY3OOEpFwVO
	 pJE8kaTfaXHvwILlruPS7+s1hiC5Rr/QM/rnU7Hg=
Received: from XJSH01426.meizu.com ([210.13.72.171])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id E0103260; Thu, 17 Sep 2026 14:56:01 +0800
X-QQ-mid: xmsmtpt1789628165tsbw3z5sx
Message-ID: <tencent_7359E1D8A4256237AB06F816324B30F3A608@qq.com>
X-QQ-XMAILINFO: M+CCxu5Z1xuSmDX1Vf8Y3UUXjh2hdOApX30dVrTbenI56A0V2HKRBcztpEorbn
	 KdHXoWD/z15JTjp5JIHGshfa0dMRK7XW7NjfacimCl4tUqdlPIpNKElcKl2UK6wfI15JyZyf0z9b
	 IwqfunUwyQQ+FWUdJKo68WGVNS6t46KQtA6DlXBhMOMJBycEMb3Q6K/isHD52BQ+ivUkrlp4Rccr
	 7TzS1EKh6cbBdqa0Lae/Ks6pMXhOFKLfiQ6dxXWUq4sbqa5a4osdj+J7kTVUxTHdzLcO0Jhh5aOX
	 +bX1jX5PTiHC5Qkob+j+5G1t+p0yi0sGkJMEE47v+uAVyw2WhQVekrvUbXNfSSvDm8n8gupM4fpw
	 0bMI5GrRwRjXboBvbBXxzo/VIzJFbdsswsuzNdyjgM7Didz5gkxjXQoRwwS0fsXKesMefN46HwEL
	 L3L8T7SgAyyO28PSg/Y5CrC+elV4BSL/SI7ibbzdgf5w3fcA0NtcmxV6FeBwHS8lmdZ3FvP9AguO
	 pYloSwZ/pLE/piKcio2VvM0Ha3CdCYV9N+jaC3pHmGo5ozZJq8V4xZLopwtKpTSlHwKJVmxTFi21
	 JZJleZnl7GB44WWJ/pYUK/AVgoqVMn6LKaJn7zFw5MDAO7sEflggbReT2NlR4431QPsepAfnU4aT
	 Izx7A20BsOz6BNvhQRqtKSLsQ5T4OtLevnC1DuksIuTbMeKW49xlM8v7usk47y/57gF7M+Q3upL3
	 x3LABGuUuFN6M0mbfK7qIbDmsVnzc+xyYirZQoZinIvXRgvZRPbay/fSz9ksSvdNbUWsogSZJuLL
	 eWP5q2l6kH5uI/GAW+Yd6d19YbGPebW3zRdWec9fej+ZdZ8GC7K30KIPcotkyqH02Emi2SNTUrgD
	 wUnWQ+E1IC05z3sINOpQuQuRbbxIFmYqDFXaWZD2BqFo8nHQkyxB4yvmn9xaDB4BXuzdjeZ7q8yl
	 w/SYkkvgFhiK9p7HT8BJrxZx2LHP+6dhHMs26MZPHQok9rMMzDzr47LJcEZqSugEYJsHwM5usRI3
	 oHBLAZpCUGSVMx9aIHzUETM8/BWnyIZU0EZJN38G9FFF+jSkewInoaiUWmTYhg8LDS5nFbfgFkxw
	 j2kTw5xMXQ8MJHKNqHGgafIRSOBzs5QrNDQivtt12fw8sObpkJdqonr+FqKMSQAI51rkOJC2KWjt
	 oFnoA=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Zhenghui Hao <zhenghui.hao@qq.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>
Subject: [PATCH 2/2] hugetlb: report cmdline parameters recorded too late
Date: Thu, 17 Sep 2026 14:55:57 +0800
X-OQ-MSGID: <20260917065600.564083-3-zhenghui.hao@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917065600.564083-1-zhenghui.hao@qq.com>
References: <20260917062837.558251-1-zhenghui.hao@qq.com>
 <20260917065600.564083-1-zhenghui.hao@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hugetlb command line parameters are recorded by the early_param()
handlers registered through hugetlb_early_param() and consumed later by
hugetlb_parse_params(), which is called from hugetlb_bootmem_alloc().

Since commit d49004c5f0c1 ("arch, mm: consolidate initialization of nodes,
zones and memory map") that consumer runs from mm_core_init_early(),
which is called before the generic parse_early_param() in start_kernel().

On architectures that do not call parse_early_param() from setup_arch(),
such as parisc, the parameters are recorded only after they have been
consumed, so they are dropped without any diagnostics: do_early_param()
stays quiet because the handlers return 0, and obsolete_checksetup()
treats early parameters as already handled.

Warn in that case instead of dropping the parameter silently.
Returning non-zero from the wrapper would also work, but it makes
do_early_param() print "Malformed early option", which points at the
command line instead of at the ordering problem, so print an accurate
message and return 0.

The check cannot produce false positives: the wrappers are reachable
only from do_early_param(), and hugetlb_parse_params() is called exactly
once, so once hugetlb_cmdline_consumed is set, any further recording is
by construction too late to be honored.

Not tested on parisc hardware.

Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Signed-off-by: Zhenghui Hao <zhenghui.hao@qq.com>
---
 mm/hugetlb.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 4f6f58bf3db6..bda8af614a70 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -91,12 +91,24 @@ static char hstate_cmdline_buf[COMMAND_LINE_SIZE] __initdata;
 static int hstate_cmdline_index __initdata;
 static struct hugetlb_cmdline hugetlb_params[HUGE_MAX_CMDLINE_ARGS] __initdata;
 static int hugetlb_param_index __initdata;
+/*
+ * Set once hugetlb_bootmem_alloc() has consumed the recorded parameters.
+ * A parameter recorded after that point can never be honored, so report it
+ * instead of dropping it silently.  This happens if an architecture calls
+ * parse_early_param() only after mm_core_init_early().
+ */
+static bool hugetlb_cmdline_consumed __initdata;
 static __init int hugetlb_add_param(char *s, int (*setup)(char *val));
 static __init void hugetlb_parse_params(void);
 
 #define hugetlb_early_param(str, func) \
 static __init int func##args(char *s) \
 { \
+	if (hugetlb_cmdline_consumed) { \
+		pr_warn("HugeTLB: %s=%s recorded too late to be honored, ignoring\n", \
+			str, s ?: ""); \
+		return 0; \
+	} \
 	return hugetlb_add_param(s, func); \
 } \
 early_param(str, func##args)
@@ -4491,6 +4503,8 @@ void __init hugetlb_bootmem_alloc(void)
 		INIT_LIST_HEAD(&huge_boot_pages[i]);
 
 	hugetlb_parse_params();
+	/* Anything recorded from here on can no longer be honored. */
+	hugetlb_cmdline_consumed = true;
 
 	for_each_hstate(h) {
 		h->next_nid_to_alloc = first_online_node;
-- 
2.53.0

