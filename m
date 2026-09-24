Received: from mail-wr2-f17.google.com (mail-wr2-f17.google.com [74.125.225.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1BC1F7916
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790226619; cv=none; b=rLuat7j0kRgEr2DzHB1pQyRAX/HZw8AJKont5slZVu2oSA4B+zNMndHqDyA0F+9oSv0n7mtnVmbytiIvvtrM0nTv3tpZm+bMzhRPe2SnonMPQTV+5+hhlaxqjpbnzuyQX389KajdeDbpEOCVN/fCw4lPCYRmWplw05wdINVPHic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790226619; c=relaxed/simple;
	bh=EzS/SIPwNhc8n/arMuSg3yPaF0nMCEdu+ba1kwNXnUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gfk4loJp6jiYiFJCK5+bAPNFngIm+PRD+YmZx1ZSiy7+2IT/A70SnFDCGxifQB6R+Z+fbhFkxeLp1XmE1+NVOX5WTMgyD5DsjNiAH46AApCIpZDAa64kJp2SbL+5MHsrFMOlvD2KjVTN/AdOS7frX2OG9eISLzUKtkhQ6jjW60Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GarNdsd4; arc=none smtp.client-ip=74.125.225.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GarNdsd4"
Received: by mail-wr2-f17.google.com with SMTP id ffacd0b85a97d-484366874b0so1005253f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790226616; x=1790831416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Uje1jfPOPcmIbWgJBz3Sa+j8/FJrZMoBTZpzcUyL9A=;
        b=GarNdsd4YM/6Mx5OlEHwwDQaeMSCwe9vysuTgoBD9Beqt3ib6j5AsggcJTc8BZXinr
         zqQwJw6UqN1XkgpNCYRAh9qRIAb24dgH/n6L/Z/DtZgmqMXKVPws85PbAi6wCnrrt+QR
         d3aePaVobImfynaJu29O6/V5tHmWPPbryU/u009lq6GLnnlGQvrNpN0O0Wk5yF1HNXOT
         pfYzjoiU7sMo/Y8xc93h3cUC+DNYg2lbSqCxjYx1kQ6MtSDZPL9df++0jOsN/+xL0UlK
         32Apo5iyMAUmsBfpQgsJxgKLn+Oaw3mbaU8iPrjgsLA2Rgvejs4hCTJqmyrVBokrdQEQ
         Z1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790226616; x=1790831416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Uje1jfPOPcmIbWgJBz3Sa+j8/FJrZMoBTZpzcUyL9A=;
        b=QkDf44eCiKXq/tyaDjTENZDBHuH+r61FBNhpMIT/FfpvzE1Xj9tEMIQc3DayHHNnye
         i+i5U60f5tuZyDDD3zQfqA2ISH3dozsShFyKu5VheK3T2v/oIV+ZlqXkNICjqzNN/fRA
         yyoqa0aMLr1Aq/3qTK9hSNsTH0WsqbbkJFB6+R9UhLcJZ0Fpxh7b2aN2xIMHKkpFtaej
         Na5DVxY52cW0uZ0gjZ6eWvhQ0j1NC0JDpcecAM46pQGXS+knuZ4i4XxokGgmnMiRAHHj
         hOrCTGFHPa+4nfpuN57wafUesABXJWia0KvFYHGEg/ogVofwWNV8koAkv6PKRuOqG9Gz
         jmVA==
X-Forwarded-Encrypted: i=1; AKwUvByJXevxoT1O6QzrVY3lITJY/IlLqbFwpSPwShDJBAq9HHdMPHeoXQQzmgWyePmBKxsf8mrhpM2OaoI6OwA=@vger.kernel.org
X-Gm-Message-State: AFuF++kI8e+25e5cUJB4RP5AGcOwr4qN3zk+MGGvveE5XuN3uiS5WElh
	SHc8VoO5Ft/CoskpLdz514gciMq6/1Vof/UxyhJT4t0URBLwqUmXNexj
X-Gm-Gg: AYBFou2JP8slN1W+DzHY+wCvR05tq46TNDOzE1JWPicnM4sEJO8O65sN8jTFcuIZgTC
	qqqVnVMjMY1sKgoJPqytGlA1vtVzzBL4AyoSHmMinaDgV4s54ycd9raEs2R7mfjxwusWD8VjtkQ
	UdELNcPAl4YbiVxOXaE8JCiFeZc7b5ArpfxtKhhf4ub27qo7ggrcgGNm8J61oBZUmhHefwiDudv
	uzP/jlgIQLzxPr7D6G+5H1GAxpcE+c38ZtNl+vGiiNroIsz/2QuXQrl2h4r270juKGlYhEbO8WX
	OwqSRsOG5m5V7Q2WD/hL6g//6Cn2WZyIN0Hnr5ScFT0X5A23YDcQEvUB2IxCjk7fhkOsuZZVksY
	OQEMIruhxut/hs+z6pcODL7YiC6D25QD8CQURjpVk50TmmVxSF5DwqyrbFQMbIkb7FbFl1HCYNc
	EAggOdQd7ewfMHihyIs7UODGSrx/Lq29goMOdg5QoPJbOywSqO1DsgVps6T6tUQnq+T3ziIOjUE
	ksjNuIa0+yM+A80zObdoFx8SWCaJIuJwyZ2XvW47NS5xTpx2XeakJpY4lWuxyF1HsW4Rzo=
X-Received: by 2002:a5d:5f52:0:b0:487:232c:a9fb with SMTP id ffacd0b85a97d-4887166daacmr2047188f8f.12.1790226615925;
        Wed, 23 Sep 2026 22:10:15 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c417sm10993394f8f.18.2026.09.23.22.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 22:10:15 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Toshi Kani <toshi.kani@hpe.com>,
	linux-mm@kvack.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/mm: Drop the page allocation from pud_free_pmd_page()
Date: Thu, 24 Sep 2026 10:10:11 +0500
Message-ID: <20260924051011.21237-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e1f8a64a-e4b5-4c1b-b83d-50425a7621a4@intel.com>
References: <e1f8a64a-e4b5-4c1b-b83d-50425a7621a4@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/23/26 16:07, Dave Hansen wrote:
> There are a few things we need to figure out like having
> pmd_free_pte_page() return 'int' when it doesn't ever fail, the
> comments, and the reverse Christmas tree.

One data point for the return value: the x86-PAE pmd_free_pte_page()
does fail.  It returns pmd_none(*pmd), and vmap_try_huge_pmd() relies
on that to keep ioremap() from replacing an existing PTE table there
(the comment above it is about the sync'd PMD entries).  Huge PMD vmap
is enabled on PAE whenever the CPU has PSE.

pud_free_pmd_page() has no such case: the PUD level is 64-bit only on
x86, and with v2 applied the x86-64 version, like the arm64, riscv and
powerpc ones, always returns 1.

> I'll dig into it a bit tomorrow and see what I come up with.

Thanks.  This box reaches pud_free_pmd_page() on every boot I have
checked, so I can run whatever you come up with through the same
boot-time kprobe and reproducer check.
