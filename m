Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE08E386424
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413079; cv=none; b=isVpryaGsElCgJHKUzwamzx6FM8L12AvaL55tMQ8UEOwvJp2LCI4YOQdoc7bMFeUjOIrHs9n7+egxam7eYxBUt144JzyvY4bAT+4k5wLe4EVpBBEh9cqXSwUe6M9hizKGNZiaPlLX+83DIlGT2CL/5mQzKCiuI/HiOSyXJN2wbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413079; c=relaxed/simple;
	bh=0a04xuGfZEnN8UMPNsBOdE49AQHMmpI2tutaj6KALUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igvS58HucpbRGRCr/Oolz64GK3K/T5diNEnAcnnUcwo62AU0dvlKglu3jruA4tK3pnWOkNFboVDPYNFz//s1xuBvYtBa/Dhpuzjr3bZiISD0Vc3c4UZo1Z+pTVtTqdQAzIkKn17Tg3cC0kMyX+Uq8pyubxNvgNgPXA3qGm1EU9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g869To07; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g869To07"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c96c92c0980so1300666a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788413077; x=1789017877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pSlJB3l1ic1Ak7Bmpv9oySIlyoLmdFz3JH+5LO86wZ8=;
        b=g869To079KWOT6EU6WbVxNF0upyN0Kh/UlDhBTfVCciExc3Z+dZZvVrMf4x/NE314o
         7+YU7Fbaiwq2J5qO0cZoVqAWRRUpQ0fTu59otr55qLv+Kdaqj6VrfVi4D5EXpU6OlEXM
         Kq3r2r5NiSkUaZX4gtcqglgMi7BwZgUDEzA4ldERSHzu8enPBatdFCGv7lDN35HPjoFt
         Zlnek4p98gPG3Nnd+kFrv9EPF6Kopj9X2eKjrIFirusdIHco7HZNO5xnZ58TpTORHaFU
         YXEI/SpeLShQwfllk2ERr4lmDo85kF4BQIPfdmlDZIamYFEj6wY3lhfENLztsEL9OBaZ
         SU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788413077; x=1789017877;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSlJB3l1ic1Ak7Bmpv9oySIlyoLmdFz3JH+5LO86wZ8=;
        b=ZoEwB6zuF/zNfawJOjKWzFcOxpPP8Yh9Fu6XZf6bYcAnHOyukkV+XhlSjhx67RVk4A
         oA7hkHww0Kb1PLvNgZ+SwJCgzgQanGZKseO/XE23G+K+yTcGpC9mYt1eOeQq/UbrM72U
         GhP/dwujklOxeBvLCmB6PSH9uTSTOT2b+KkTLVhqCL7+VM2kfJx8l/tnzoI+c/GezNwH
         IDZS/c3S709gWJQoJw0bc4S2QpSaxKS+knS91aJPW/CfVT80seHtRuw4nZztxT+ilKgl
         4Hif4EziuOOx8K3WktfIVzxPah3y+s9DbCrMXq1R64GxWWNUlZzSkjlCIDtdrPDQauvY
         GbZw==
X-Forwarded-Encrypted: i=1; AKwUvBye7lLbGAL4A/Z5rTu4jeEzIAIuP3VsVrKFoe6tM76SYeYzGFt4LUpg6IaecB/KTP2PYFvaEVTHFy3xrsk=@vger.kernel.org
X-Gm-Message-State: AFuF++lVJY16s/duwo0ao+LTadh8gNazfYSgR77lVMTH3ww8fIBbJUKO
	NY2FOiBpR1ejUI2qaiw/B5dca68rNs6VquK74SGXJgqxDxNT2dn8269I
X-Gm-Gg: AYBFou3FHyfSebaP7ex5LmHu4zIjPPUAYi3AfSpiEy3XM6oIiPUbkdQcVcwGVQKON/i
	6HXWpNtD+npWJ5UsLPnkt79xRaLo8toTheyY8COlHKuTe1FlRp7e0SO6pXkciHQYtAyH3CpLPfA
	0zqCXkgKYDn7boD9sR97IsK+bjFm+P5wYVtzKaYqkyUF0N0DWgI0Ga/fE7D42wGNs7Eko07Qrh8
	1qXWqvxDNjlbUmBRdPiEK+2QWRp6KAReoW1VM7dYl7cC25YQ1DmYpI2f/UMSBwj0yq8qWTO/9+u
	eTwB1jUDsNnc9VI2d9SCoPPmSdrlcSEZXisumtjbhH6BhnpK4WUf4o99Y8rGON9B26z69P/Pt32
	AETa+7j4574EoK/uO0kCdzZ3BINC5GMV2kXpvmmdNDDDa5axSPv6E2F43BK8/UFkP0Bl8WDKsFc
	WEE0hr3HvOl9OliEhSFbAHFhEm0dMntGLozJ9nl0s3Mu74GQv3QpCCD7On+2+LbENpx0ohgFgh4
	/I=
X-Received: by 2002:a17:90a:c106:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-39aedf1a98dmr16024181a91.7.1788413076702;
        Wed, 02 Sep 2026 22:24:36 -0700 (PDT)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae62a54f6sm2738544a91.1.2026.09.02.22.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:24:36 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:24:27 +0800
From: Vernon Yang <vernon2gm@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, david@kernel.org, hpa@zytor.com, rmclure@linux.ibm.com, 
	andrew+kernel@donnellan.id.au, pasha.tatashin@soleen.com, kas@kernel.org, tj@kernel.org, 
	rppt@kernel.org, rick.p.edgecombe@intel.com, yu-cheng.yu@intel.com, 
	orsonpeters@gmail.com, linux-kernel@vger.kernel.org, x86@kernel.org, linux-mm@kvack.org, 
	Vernon Yang <yanglincheng@kylinos.cn>, stable@vger.kernel.org
Subject: Re: [PATCH] x86/mm: Fix pmd_modify() dropping the dirty bit
Message-ID: <94ada6d8-4513-4aea-bde8-98fc589e2b6c@gmail.com>
References: <20260903031608.1194238-1-vernon2gm@gmail.com>
 <20260902211036.8184c6e5535669bd73c71fd0@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902211036.8184c6e5535669bd73c71fd0@linux-foundation.org>

On Wed, Sep 02, 2026 at 09:10:36PM -0700, Andrew Morton wrote:
> On Thu,  3 Sep 2026 11:16:08 +0800 Vernon Yang <vernon2gm@gmail.com> wrote:
>
> > From: Vernon Yang <yanglincheng@kylinos.cn>
> >
> > pmd_modify() masks the old value with (_HPAGE_CHG_MASK & ~_PAGE_DIRTY),
> > silently discarding the hardware dirty bit.  The subsequent
> > pmd_mksaveddirty() call is supposed to transfer _PAGE_DIRTY into
> > _PAGE_SAVED_DIRTY when write-protecting, but the dirty bit was already
> > stripped from the value, so there is nothing left to transfer.
> >
> > Contrast with pte_modify(), which keeps _PAGE_DIRTY_BITS in its mask,
> > and pud_modify(), which keeps _HPAGE_CHG_MASK untouched: pmd_modify()
> > is the odd one out.  Any pmd_modify() on a writable, dirty PMD loses
> > the dirty state.
> >
> > One visible consequence is data loss with MADV_FREE on PMD-mapped THP:
> >
> >     memset(buf, 0x5A, size);          // PMD-mapped THP, PMD dirty
> >     madvise(buf, size, MADV_FREE);    // PMD cleaned but left writable,
> >                                       // folio marked lazyfree
> >     memset(buf, 0x5A, size);          // hardware sets _PAGE_DIRTY again
> >     mprotect(buf, size, PROT_READ);   // pmd_modify() drops the dirty bit
> >     mprotect(buf, size, PROT_READ|PROT_WRITE);
> >     // ... memory pressure ...
> >
> > Reclaim (e.g. under memcg pressure) then finds the lazyfree folio with
> > no dirty bit set anywhere and frees it in
> > __discard_anon_folio_pmd_locked(), even though the data was rewritten
> > after MADV_FREE; subsequent reads fault in fresh zero pages.  NUMA
> > hinting alone can trigger the same loss, as do_huge_pmd_numa_page()
> > restores the PMD through pmd_modify() as well.
> >
> > PMD-mapped file THPs are affected too: mprotect()/NUMA hinting dropping
> > the dirty bit means rewritten data is never written back.
> >
> > Fix it by keeping _PAGE_DIRTY in the preserved mask, exactly like
> > pte_modify() and pud_modify() do.  The existing
> > pmd_mksaveddirty()/pmd_clear_saveddirty() pair then performs the
> > hardware-dirty <-> saved-dirty transition based on the write bit,
> > preserving the shadow-stack encoding rules.
>
> Yeah, this is exactly what I came up with, using chatgpt.
>
> > Closes: https://lore.kernel.org/r/CAJxLxMUGu1-L+O_nAONOwOXnS=cNbNApCWqdthRjd76LThtSPg@mail.gmail.com/
>
> We definitely want a Reported-by: Orson here.  He obviously did a ton
> of work on this, and it's the least we can do to thank him.  I'll add it.

Yeah, I missed adding Reported-by: Orson, Sorry. Thank you for adding
it.

--
Cheers,
Vernon
