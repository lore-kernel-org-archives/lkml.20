Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376DD340417
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788174042; cv=none; b=ZJpIkvMRjI3XyT1peKajuL37PfkpdSx1D81bKFqMp4/jtUAgs5w6SHJtvM44/qHdNHL8Cxmz/r4bp1idBinHsXu+82tsNJ+um5wzkkKUcwjHPPNqgL0TusEf7UCIqW8+lFSucwdtCvcTgv4HLBpHrlZ5paXILEAwB+F/KL4oiGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788174042; c=relaxed/simple;
	bh=qLSDHmt0uiYBxN+JEkYuUN9wyR36Mq074xndRfuUSEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4ZqVzerv2xivJxkyOuj2WR76EH5tT4wWN7OuA+7sowCRnHUw0RaDviRY8LU4xlVKvFT8Mw8XVX9ctJ7tpV5Dh4I5O5A21248HWxyuT4L/skw2hqVju5GmKbqEAoaFrXDbvoboynlWz2ac9lsjZH6W63TGInfGZZ7+wN5bWc0c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rs4apWVe; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rs4apWVe"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b5e1340faeso3053708e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788174039; x=1788778839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SDQLGo2eBys2v5fSX9hMlquDuFbTQ/zAGUSHKc6b0N4=;
        b=Rs4apWVex3BlW6GpElQW9ji8J1JBjEhWZ6LH+hCJpRxTvxsFzjbenEyQDicMQZ58ZD
         Se/uVU635dheuiCwf4yqxZSMztvOaItRZxgA+LGd66m1mgBnLVVG7HNUhvBAoqrAMcBp
         8KKhkWEjO1hUT4f9e0iH2PV5FPUEYxMRLyNKknjoBget/G5Gv8XaemCbVC8H64QMh991
         GNKZ9rVDx6muB1p7+MgwySqaRuGSv3arsDDF2I1rvKXAVZtdm6jL5HEUigupeNbgQed1
         f2utOk6sKj3y+g9fc3OXBft7WESPxQRGL/DlZ6yB024dWo0Pvdho2wMY6BD05l48we3r
         1hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788174039; x=1788778839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SDQLGo2eBys2v5fSX9hMlquDuFbTQ/zAGUSHKc6b0N4=;
        b=YaRrYAXV3e/2L0FCB98UM5qOR013KNvcVxofiaLJHK6WIIpwmjYaB3a8XFeosrthoR
         qV6eFtUkCeqovv5sEnYa6KiFBgUcehmGFTo+penXviBjBVdB4E9w6nOAZjIpXgrm1Vwk
         5GwciKV3K+n0CPd/yZLkxfrJumA08WqeFcT/RtJm1+xyWa0LwoL/WJmj3dNMKV/ZgieJ
         HGEqXb5OIKqpz1asl2oTheR21bO4mPxIhDP+Kw54i3Ro11J1Kl794MpORXb+zxzPj2c3
         TWxOgvC982IrHJm0Dokh04Vyv0/f3GfY89XtBP1mAXKUv8oU/HQ195Td+Y1vwikC4s5E
         M69A==
X-Forwarded-Encrypted: i=1; AKwUvByRW9UUN6RM8JcH6//CIAfPvn0ImzU6XXsEJbsK0ZCMEFFmA5YfYYzpWwdLib+kWU3oZl3OHJmtCmhiarU=@vger.kernel.org
X-Gm-Message-State: AFuF++nGXprB+CG7osNnXit9BO8OqdIzdvlHzPgux93uI43HoCHY5uLV
	kAdfgKnd8X5lO8QbTwbixQFNCj+lOdROd6bvHGcFZ6geHGjlydZ5QqDR
X-Gm-Gg: AYBFou3gnrvuLwVAvXrFcdqpbLfZxCYzCLbJU+pAWE0zKRs4Dze+NZt7jD596ivN+j3
	u0NsJBEeaLQ+je35DzyAgKbJOFmHhu2vwqpEFBD8gW4z8LLdBSsRJH6GIoIvSAf1wvterC6TCNB
	en9k7PnCVwEd7G0CB8FHRJWbV1bFblbySS1fqt2R+5PPn0/5+ZoPIjyk4dM9JYifweQbSldlS/4
	pZZBj19LdAxGlhKzLuCOw2Ompx0S7DJWbevVMcF2C0pDSZlgTYxrbGr/ezLcPBXRt5qETkt1tZt
	sjh/pnHqqVXYg/8uIPbOzedHzWlXrScObnWNADZrAs8e+JfGeBeFpidP82bv80jhF/xXPF52IJ4
	cwEm8al893EVK+BYNqmXE+ZxrLW4bybNqhQ3byB5DZ1BGFy6VQ6XoOvVwNnUgLk28jfexzes78r
	OGsbvCFvB0+oWzNgZklrx2d/BL/hjztPVYn3+P0Eeh1mAaD4ZvxD7BZo8oDmOatlSWQq9Rm39z1
	o4aEbmJJ6h4XxFGIWJUq1oli3LGNWDXlP6+H8si6BtMdYsASaON1jnmM7fJtykbaCf/PAi4ckge
	DA1FSS3YP+KAsQFFsdUb+EB/AXMF9D3I/fvw38jp5N43o0kY7NGaoppbTUO0C3N/JlKol1az8YI
	=
X-Received: by 2002:a05:6512:2355:b0:5b5:f946:513c with SMTP id 2adb3069b0e04-5b5f94653e5mr1425845e87.17.1788174038781;
        Mon, 31 Aug 2026 04:00:38 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-acb9-0201-68d0-34d2-ad1a-175a.310.pool.telefonica.de. [2a02:3100:acb9:201:68d0:34d2:ad1a:175a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5b65sm2175666e87.16.2026.08.31.04.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:00:37 -0700 (PDT)
Date: Mon, 31 Aug 2026 13:00:34 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	stable@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.6.y] arm64: mm: clear extra idmap level before use
Message-ID: <apVbNN_gtowKWVhR@gmail.com>
References: <20260831054247.33352-1-kmehltretter@gmail.com>
 <2026083125-upbeat-series-9565@gregkh>
 <7f744f2a-409b-454f-bdb9-fccb5031640d@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f744f2a-409b-454f-bdb9-fccb5031640d@app.fastmail.com>

On Mon, Aug 31, 2026 at 08:15:52AM +0100, Ard Biesheuvel wrote:
> 
> 
> On Mon, 31 Aug 2026, at 07:54, Greg Kroah-Hartman wrote:
> > On Mon, Aug 31, 2026 at 07:42:47AM +0200, Karl Mehltretter wrote:
> >> The 6.6.y adaptation of commit 0e9df1c905d8 ("arm64: mm: Don't remap
> >> pgtables for allocate vs populate") removes the clearing performed by
> >> early_pgtable_alloc().  Its replacement clears allocations made by the
> >> generic page-table walkers, but 6.6's create_idmap() still allocates an
> >> extra root level directly when a sub-48-bit VA kernel is loaded
> >> sufficiently high in physical memory.
> >> 
> >> memblock_phys_alloc_range() does not zero the returned memory.  The direct
> >> caller therefore publishes an uncleared root page and passes it to
> >> __create_pgd_mapping().  A stale nonzero entry can trip the bad-descriptor
> >> BUG_ON or be followed as a page-table descriptor, preventing the kernel
> >> from booting.
> >> 
> >> Clear the direct allocation through its linear alias before publishing it.
> >> init_clear_pgtable() also supplies the barrier required before the table
> >> descriptor becomes visible.
> >> 
> >> Mainline is not affected because commit e6128a8e523c ("arm64: mm: Use
> >> 48-bit virtual addressing for the permanent ID map") removed the dynamic
> >> extra level before page-table initialization moved out of the allocator.
> >
> > Why can't we take that change instead?
> >
> 
> Nope. That relies on a massive refactoring of the arm64 startup code.
> 
> Can we just revert 0e9df1c905d8 (aka 54322d95309d) instead?
> 

Yes, that fixes the issue too.

The commit was patch 3/3 of the following speedup series:

https://lore.kernel.org/r/20240412131908.433043-1-ryan.roberts@arm.com

Patches 1 and 2 accounted for most of the speedup.

I'll wait a bit to give the others a chance to comment.

I can send the revert as v2, or my original patch as v2 with the
missing "Assisted-by: LLM" and "Signed-off-by:" trailers.

Thanks,
Karl
