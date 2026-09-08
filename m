Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8773592214
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887560; cv=none; b=Krccultvx/uzEd2j9h7A4Fkae6QmFBgVUDhUKXP0Sxy3PGvIKjugeXaiHlIiwR4Vht47Bb4GlqGh6zzArPFJLpErc9OCBbvoThnTYoZY13UB12qntE0whypUbX9AW6xIi04IYZ8iGEm1q5Y6XdmD6w5U/j+dS7t+f4153jW/jwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887560; c=relaxed/simple;
	bh=6lmyKjg/24QLkipPzzSBUbJkMH+nJ/aPvegiHXYPXzk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=cLHpipmMMtH+ItEcRjcwQDcD2A5mr/VtoiDrGpBJbGe0Ve/GfDdcweZY9TPCuKl8YbtahaS/zfQ2teDG06rNsHG65x6+T1VCHCe1RDDutzhkk++jSiYDHb9LtUCia/pxZtB1jO4C7itM1MwiwZtTj2QzW4ZDOpysr4h5E0JIIDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNPyQigh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNPyQigh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE6E1F00A3A;
	Tue,  8 Sep 2026 17:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788887558;
	bh=LBb9ADHMqWm21+2xiuaoD6zmeHkRqVhQ1J41zISVZPo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=UNPyQighJpwB7k16N1QTtDfhRutUH5wNTLjkZOU8gxH3E5CO30yAFT24po/lVVUlo
	 RmXjr0EWxFZ7+w0qITjiFiDPfhKHCgQvPbR64MZUQ1wQu/zazrvFBbPx4Kd+ZNCt36
	 G4zPe05FDFYBGPS8iYi0qcYzDDUXNOyaSp1ECsEsKZTGBsUJGszvGchnPxpxQeeew0
	 ZjNOjVBYrtmldOYTOYPu+Ivxo2+HKeO58i9MxixJq/J6LE9059SX0iKd5sysRwiuFB
	 Gl9N8ks8THEcGLoGFxWGLSOGpF+YWuJEbQf/w3yfF9lOnXl85QiIWSY4t6dkXX/lVh
	 sFLxBZnhryXVg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 8BB72198003A;
	Tue,  8 Sep 2026 13:12:35 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 08 Sep 2026 13:12:35 -0400
X-ME-Sender: <xms:AUKgakqL4n7wutvMnvzDWLRL-kh5vN9TADPKZT2rBtmDz_ntUEnwGQ>
    <xme:AUKgaleeYP9nxumKfTpNWSy2RzDNUiHNrBNGwN57YbTRQFesC0UBjl1wbg3F4Ta_i
    pTgg3ocJLJXFvpG_Mnucp4zuD0zUO6iKthhQUKEEaRnONE-4Fr3mdU>
X-ME-Proxy-Cause: dmFkZTEpDua1X995u/upmh/8VYUEeEvtAsxNZ28jsqTO2/21LX4omQP6tTahEpbGYbXrq3
    iv7Ifl/LhyTLQXwzD22gMXOzSFq0K8sn1147GAalntI4KdbDwGWikhiiEep1ud5NR/hgH5
    x91p/v42lRLHD0z1eqLxDwgC77/XPZmVuDL+4Y9DW893uBsirabnCTEJJuNCdmOjJHBRIE
    IJpkJq7dDVGyzSOV5wVIIpm8mtJpfqK12zjE8OLIQ1eLJf7oYdb88oU/4JQaGwbQVfwmuQ
    AzO3zdZ5RwFbttDTnDxIDqhNEhlJqi0Wtd26BGSv2xNvX5+e5gXLCnPj1c6YxMFaFXlgS2
    TxNnbWQpRfNSQ742yw70sFKDgkPXdOBSFUNSxpx0jRtwrJCy64OEgSsAm/BMH6g+cP2+ug
    VkiciIeGnqzpSLdJlbVRpXyRoD9Pdf/FqcMgjHVCLVl2wpKOnMUkYtiSMRu0gli85CAIf7
    etRELk++Km2bvZoKdy6Sne2H0YUWmupH81g2Aul2m8GW7MSr9M0BV4774k0/mnFZ9Blzxd
    qL326MZwrBsTKdsljjpZP8RILWzLKml/nJ9Iv34eyr/XljuYd8+QD8wu6pHnu4wGMaMFnF
    tdAMexmGMZNsC5JW85bOAb5ho6eII7S7cygXLhsM4lGROosDq8+DKXx09Ldw
X-ME-Proxy: <xmx:A0KgajPw9DTNq1MbtWKndEJHIC0n8X8ae82hlbJT7DzT8hjgABquOg>
    <xmx:A0KgavhUyncxIWXps2OoWKMY9ITkUew1eOiVMmid6UaRuEqHkEfVKA>
    <xmx:A0KgahiUp3RpJHTpZ4SnBAqYZjOLxH-PuO20DfUTnal_a6rrt9loUg>
    <xmx:A0KgauJvhrtXs4d4Kwy39RBG6iH7aX-IheYbMQCwZ9vu7hZMIG7XPg>
    <xmx:A0Kgagm9s4o7EniipLfoGBj6dFjP-wMYrU4A-UppdNDWdqF_Q_0MEKfh>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 11361F8007D; Tue,  8 Sep 2026 13:12:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 08 Sep 2026 19:12:12 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Will Deacon" <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Arnd Bergmann" <arnd@arndb.de>,
 "Eric Biggers" <ebiggers@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Alexei Starovoitov" <ast@kernel.org>, "Oliver Upton" <oupton@kernel.org>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, "Marc Zyngier" <maz@kernel.org>
Message-Id: <ea76bef9-c346-41a6-9276-a5eb8cea3776@app.fastmail.com>
In-Reply-To: <20260907163726.17104-8-will@kernel.org>
References: <20260907163726.17104-1-will@kernel.org>
 <20260907163726.17104-8-will@kernel.org>
Subject: Re: [PATCH v2 07/14] arm64: head: Force little-endian early during boot
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Will,

On Mon, 7 Sep 2026, at 18:37, Will Deacon wrote:
> Commit 2ced0f30a426 ("arm64: head: Switch endianness before populating
> the ID map") configured SCTLR_ELx.EE at boot according to the endianness
> of the kernel in case the bootloader had entered the image in the wrong
> endianness. Additionally, if the MMU was enabled in such a case, logic
> was added to turn it back off to prevent the hardware walker from
> misinterpreting the idmap page-table.
>
> Given that the MMU is only expected to be enabled when booting EFI, EFI
> only supports little-endian and arm64 kernels cannot be built as
> big-endian images, we can rip out this handling and simply force
> SCTLR_ELx.EE to 0 (little-endian).
>
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/head.S | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
>
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index 8951ce693552..d5c1ea0c5b3c 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -138,29 +138,11 @@ SYM_CODE_START_LOCAL(record_mmu_state)
>  	b.ne	0f
>  	mrs	x19, sctlr_el2
>  0:
> -	tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f
> +	bic	x19, x19, #SCTLR_ELx_EE		// Force little-endian

This bic has no effect here: the 'and' below clears it anyway, but x19
is not written back to SCTLR.

When I suggested this, I missed that SCTLR.EE still needs to be cleared
before populating the ID map, regardless of whether we enter with the
MMU and caches enabled.

IOW, we need to retain the SCTLR writeback logic below. The only thing
we can drop is the clearing of the M bit and the invocations of
pre_disable_mmu_workaround. But we might as well keep that.

Apologies for the bad suggestion.



>  	tst	x19, #SCTLR_ELx_C		// Z := (C == 0)
>  	and	x19, x19, #SCTLR_ELx_M		// isolate M bit
>  	csel	x19, xzr, x19, eq		// clear x19 if Z
>  	ret
> -
> -	/*
> -	 * Set the correct endianness early so all memory accesses issued
> -	 * before init_kernel_el() occur in the correct byte order. Note that
> -	 * this means the MMU must be disabled, or the active ID map will end
> -	 * up getting interpreted with the wrong byte order.
> -	 */
> -1:	eor	x19, x19, #SCTLR_ELx_EE
> -	bic	x19, x19, #SCTLR_ELx_M
> -	b.ne	2f
> -	pre_disable_mmu_workaround
> -	msr	sctlr_el2, x19
> -	b	3f
> -2:	pre_disable_mmu_workaround
> -	msr	sctlr_el1, x19
> -3:	isb
> -	mov	x19, xzr
> -	ret
>  SYM_CODE_END(record_mmu_state)
> 
>  /*
> -- 
> 2.55.0.979.g7e5102b832-goog
