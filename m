Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E50352016
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152571; cv=none; b=I/aayQSZXdjjLuQbBz32FvF3vJEFItvBYmUzAiOP0pjGtdut1ZdS4lAyVvYkvGI10xBUXENC3XIWkproW3h4vvqAYm6TcLMS3ibry/7LogaE0tQTdRRPLtiz6xjpAvGAOrQwRtytyij4X7GpKudQwyTBKjYP80w2J2s//2KOM+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152571; c=relaxed/simple;
	bh=+IoUalunk6EBcTh9xGk4fB9x0NW21q/3n3sKS5ELLS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=luzfjVUWCzDcS2ZxFu6WI+a5Q9si79mVFFgEbbDK2sbT+rhRZrqvo9B66Kfd2pvf78LL53nWXL3fXTShQ1xIj8RUomGR7L5ddPk/+PlQfEwrD1/LJIIiyViCom3ueeVidq94sBS38U0OYrEQl72ekJAvpPFCBg+WA+tjyCWWrlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tz0FborN; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tz0FborN"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc147d86bebso3458971a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788152570; x=1788757370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4KeYjahQ7mXCY2qiFTNky7ut0uCfsaiu5clA8xyfKA=;
        b=Tz0FborNtS0UE0FIaWkmYdb7a2kASSa5bTjGT2yg2wr78kYBwDjHCnjz00Qt07CDDQ
         kSewHDpa2uEpl6uFwwRAuySp8OVMtCHyw95WB1JQ/wGqSXUhg1uZQg87ZS37hMJIoNT7
         lc2GfwVvOxZl9TrsTC0mjr86sXLAnUi8qCqJHmg3k1CWLIWlJmYhYCl/JUK6y1G3EF/G
         6ZcUDdGvhZDKVYRd034JqusY+0UwD4QTmhINLcNKzOy2JFxnBHBFcExluRPPaxisy0Zq
         x+/h6wW0+/9GrtGGalRvZdbwWtUQ3aQetNQpUoWAvv6qSGLkmfSAV0gR+VmxIj7s6gjb
         gl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788152570; x=1788757370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4KeYjahQ7mXCY2qiFTNky7ut0uCfsaiu5clA8xyfKA=;
        b=C/6iEWVeKxdFxdc80v1fHqWj0exYfE4FZaLEHfC9ZinqzRBhRdTUWZbBsf9xY7saHu
         dnsqTDCH31pTxnwcY5l6Yq5wya/3UG1U4oxlHC3dR3iVl+YiaxHhl6qY7Sfso2k/a9Iy
         xh4qJIQNxVtiX2wjBpGQUMWI89LyVBnrjDbAqcxD0l4m+d+zVXZS78RXYXpVQ4R8yWba
         HWWaeQy0wgBzO6rO3cSBG4eiG1HbxpFGA6L077NXVjhbnu0BndtQ9vuvpXby4kxmAg+O
         AahyuiYiz3xQmwangUOmrvNa1BSik87fZ3dgFwBudNfysqanoC3iI5ARvyT19SL5WDnb
         DzOw==
X-Forwarded-Encrypted: i=1; AKwUvBz+z7i0ACJuG8Oie/J4eWK+soEJWFHdggKxUJi47Sj2FAD0Xvs3wQmEx472RmN1ZIpiAn85cEPbnTaobPc=@vger.kernel.org
X-Gm-Message-State: AFuF++lEKgWCO8gHgnIrEfZaTazmcPYL/WlXHdHashGyBA+g14yc2Dsd
	dok28PTtVh95kW54yN7ohSO/EGr0aMUPUkmOxjffVvmX6G6SMYPbqo41
X-Gm-Gg: AYBFou2GJtfshyPjU59bOX2u4EcprXEegUHmEbKSa27TCOcyjTci5zKMyLBaPpYPDFB
	TojVoflg5ovPl2qrVUzrPXgWlnSVXwj6E2OfBmd6uRpGFbcXmHYzr/oGhxN0LhlMVoZzPiG0gor
	clFsn9+GYJsWwe7ya6DOe6/ilSME8KuYJlzhYWdTqK2TMViczl/ArxT12aHP2Bkql+rjjgQilGj
	8Gn6SpChACdMXkaW8/905RpUGyHqrWGojqFhFj4zt5Jq0qTief7Xpt3+TUmDreixUe9c9JVPHvl
	7Wa8KbcxT+dYMXJ3sJSBIIN95+TFs97wAmqNHPvpYsUj/BK2r5WSmXbgi6GEcb6U7NpxZzTUZP5
	VMJ0FRvSB8Y1NIgMGcbdCeoZHyGIdMzqAv5PDptyX5y7cJ07YatA/utY998VPn0PHbKYC8zT4mj
	pwUWgAWYuHqVe8Bpckx8e+h4xGh1VZo6/E6I374L/jhlei8vn0+Zrh34Hi1HEDUnqX58Z5sxT5E
	RieZjH6FUk=
X-Received: by 2002:a17:90a:dfce:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-398da5e8899mr4849560a91.6.1788152569656;
        Sun, 30 Aug 2026 22:02:49 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc854dsm24897806c88.10.2026.08.30.22.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:02:49 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	iweiny@kernel.org,
	nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nvdimm/pmem: Release gendisk on probe failure
Date: Mon, 31 Aug 2026 10:32:41 +0530
Message-ID: <20260831050241.1303288-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260831044508.520351F000E9@smtp.kernel.org>
References: <20260831043459.1298059-1-hemanth.selam@gmail.com> <20260831044508.520351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Aug 31, 2026 at 04:45:08AM +0000, sashiko-bot@kernel.org wrote:
> This isn't a bug introduced by this patch, but I wanted to ask about the error
> handling for alloc_dax() just below this code.
>
> In pmem_attach_disk(), if alloc_dax() fails with -EOPNOTSUPP, the code
> gracefully falls back and leaves pmem->dax_dev as NULL:
[...]
> However, the write_cache sysfs attribute remains unconditionally visible as long
> as CONFIG_ARCH_HAS_PMEM_API is enabled.

I do not think the two can meet.  alloc_dax() only returns -EOPNOTSUPP for

	if (ops && cpu_dcache_is_aliasing())
		return ERR_PTR(-EOPNOTSUPP);

so pmem->dax_dev is left NULL only on architectures whose data caches are
virtually aliased: csky, m68k, parisc and sh unconditionally, arm and mips
depending on the CPU.

write_cache is visible only when CONFIG_ARCH_HAS_PMEM_API is selected, and
that is arm64, powerpc, riscv and x86_64 (X86_64 only), none of which have
aliasing data caches.  So on every architecture where alloc_dax() can hand
back -EOPNOTSUPP, dax_visible() returns 0 for write_cache and there is
nothing to read.

Happy to be shown otherwise if there is a configuration I am missing, in
which case the fix belongs in dax_visible() rather than in this patch.

Hemanth
