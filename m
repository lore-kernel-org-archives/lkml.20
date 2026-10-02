Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E71F486E67;
	Fri,  2 Oct 2026 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942044; cv=none; b=R2YiN+4dz2aLVOaVpoEYrHee5AHywP8zZ7QEuAhsyVT4M8m/tqrwN9/N4yZqia/WbnBSrxEGKUKLoiv1DQxbt7uSUxshJRFtQlZYoGJ8lDbrKq02E5zCpL3ZjAKJSuS95hY8qCII7em66+bp+jFSPnUtRGyxKJV1Nh17Rrsjz5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942044; c=relaxed/simple;
	bh=IU2YI9zUpbX4V1rAyhfNlBqzNZ883Ddsov2BTxou4Rc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=QBuBgaCkNYsiMtQKcAvuz05W6u7oFeXsFWCQFkcyqQL0V9fj8VOdIfZgLI+B2ZS7e8kQBxchvJiKmNfVuOoeLUCSyCmpOjYpcAxK4bmxkkyibBSM5r7lYRbairr2RqvkyfgVCeUhFLDYNkYiI5/skTm8h6UJjOkFdWy67kHCm+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=E6oHFqwi; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SwKvP9di; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="E6oHFqwi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SwKvP9di"
Date: Fri, 02 Oct 2026 11:53:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790942041;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=srkmWrJZQbitnHfcuQjCjvb2HHBRwi5m5BGQYLWWZOc=;
	b=E6oHFqwieTiKF5aO1rDMvyvP0IGK3lzshWBpkd0LVEgtTYl/vOjuh4XPUARkURb0zA0dkB
	zpETbGh85zF9RgJqbKAAvvrUwurwSVP7dZe64YFOOSNMF9jjaoX/BMFPjotnSuN0e+kg8e
	hdQacwcY0aM5kswGXv84XxXvy5VNW4ihiu8aNS3U6LaBKRW+6mmhAXaVd9c9GC9zFd6z85
	DlKxB62JN0Z1+7TFlHwkvHs4ch2zzjUFpBClV/dQNP2mRg0SPG4tsm2P0xOyWN2IuDI7/6
	afFpXLqI18Zea3bTKyapxBt6dcu7p8T9B4grqwIKrlrVw62DqbP/P6n6z+IEbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790942041;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=srkmWrJZQbitnHfcuQjCjvb2HHBRwi5m5BGQYLWWZOc=;
	b=SwKvP9diJUdj0sxOuFNfbr3cgjT6s8wz60XcYDh+1Izk5AumztT9BNDlJQ1SGsCvb1vFA5
	+h4V8Jt8cGW268Aw==
From: "tip-bot2 for Peter Fang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/tdx] x86/tdx: Add a helper to query maximum Quote size
Cc: Peter Fang <peter.fang@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260930103739.2851980-6-peter.fang@intel.com>
References: <20260930103739.2851980-6-peter.fang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179094203982.3910103.2772906196728298394.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     0dc5ed13653b013ffc0b38a5e1e3f2b2674ffb09
Gitweb:        https://git.kernel.org/tip/0dc5ed13653b013ffc0b38a5e1e3f2b2674=
ffb09
Author:        Peter Fang <peter.fang@intel.com>
AuthorDate:    Wed, 30 Sep 2026 03:30:54 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 02 Oct 2026 04:38:53 -07:00

x86/tdx: Add a helper to query maximum Quote size

Newer crypto algorithms can make Quotes larger, so guests can no longer
rely on a fixed-size buffer.

The TDX module added a new ABI that reports the largest possible Quote
size via a metadata field [1]. Add a helper to query the size instead of
exposing tdg_vm_rd() directly, as it can read arbitrary metadata fields.

The reported size covers every Quote type the platform can produce,
including SGX-based Quotes.

AI was used under supervision to collect/apply feedback, review code and
workshop logs.

[1] Intel TDX Module ABI Definitions, August 2026, TD-scope metadata
    field "TD_QUOTE_MAX_SIZE"

Signed-off-by: Peter Fang <peter.fang@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by:
Link: https://patch.msgid.link/20260930103739.2851980-6-peter.fang@intel.com
---
 arch/x86/coco/tdx/tdx.c           | 16 ++++++++++++++++
 arch/x86/include/asm/shared/tdx.h |  1 +
 arch/x86/include/asm/tdx.h        |  2 ++
 3 files changed, 19 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 92c2438..02c2871 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -198,6 +198,22 @@ u64 tdx_hcall_get_quote(void *buf, size_t size)
 }
 EXPORT_SYMBOL_FOR_MODULES(tdx_hcall_get_quote, "tdx-guest");
=20
+/*
+ * Ask the TDX module what the largest Quote on the host platform might be.
+ */
+int tdx_get_max_quote_size(u64 *max_quote_size)
+{
+	u64 err;
+
+	err =3D tdg_vm_rd(TDCS_QUOTE_MAX_SIZE, max_quote_size);
+
+	/* Old modules do not support this. Tell the caller. */
+	if (err)
+		return -EINVAL;
+
+	return 0;
+}
+
 static void __noreturn tdx_panic(const char *msg)
 {
 	struct tdx_module_args args =3D {
diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/=
tdx.h
index f2cfa71..f1c5439 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -50,6 +50,7 @@
 /* TDX TD-Scope Metadata. To be used by TDG.VM.WR and TDG.VM.RD */
 #define TDCS_CONFIG_FLAGS		0x1110000300000016
 #define TDCS_TD_CTLS			0x1110000300000017
+#define TDCS_QUOTE_MAX_SIZE		0x9010000200000007
 #define TDCS_NOTIFY_ENABLES		0x9100000000000010
 #define TDCS_TOPOLOGY_ENUM_CONFIGURED	0x9100000000000019
=20
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 97bf6c8..1fcfaed 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -84,6 +84,8 @@ int tdx_mcall_extend_rtmr(u8 index, u8 *data);
=20
 u64 tdx_hcall_get_quote(void *buf, size_t size);
=20
+int tdx_get_max_quote_size(u64 *max_quote_size);
+
 void __init tdx_dump_attributes(u64 td_attr);
 void __init tdx_dump_td_ctls(u64 td_ctls);
=20
