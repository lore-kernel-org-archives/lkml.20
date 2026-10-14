Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135F13AD51C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971056; cv=none; b=ktFLVZ/qcvBKfctJVeAsKO0c3A/MST2eXjqHH9gP7L4VzE4QfC2C92B82rhVeyk7alhY0YL+8OHkjjXsK51mvUSKDCRori6Zr7I+K+mLYm1VQhLclUeqGMPF50+O7YI0leDhtesQ0v4+uJZkxbbjOV7yh97NN84bJNAeCrejppE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971056; c=relaxed/simple;
	bh=JQlpRiUaOXNfdMDy+o24+jWUaR5vlVHK5OhebwrY45w=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jgU5M+s0iu9BBxyhJQB56rFBYdNjraW+r8pr9OT2pmJE67g0m9nYBbUYjivkgPr2wGDBWv5iFRNrV2OyTNsvf9I5/cgElCltk0S6UMfZFenWkXIZQfLUsxD6IYAKEX3P3+5PJT1M9r1GD7HnFj32RePxsasHiVcUrs8YPnfQ6bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BT+OgzoG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BT+OgzoG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6175F1F0089F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971054;
	bh=RibJr+lkK5w34aXVUZqBACmNuB3QmP95yMnwX8HmFKQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=BT+OgzoGfyq8uQEYFqZcC6K8t/Rjzu0eu1MklLKXCmRIOrGiWB25ETHSbC0+eSFqk
	 80wfFOpQ+VuAZCGfoqeGQ0FMC+oYARK1dsSgOzkePlYk3C4uQMrX8eULLXa8D+pCHe
	 /DVi4EX6LDMbyyfa/fmOUFylNJtXgbk5R+X3knOlC81p8QIcqRf0RFuAQ/mchIoKC3
	 z+psg12xLMggnQXvmScMKersFpdgHbJmpSXD80CR07XzIQsBacJxk8/Lir05MH/LRE
	 oP9998w9gEkdowPDK2JOjHnbOcdUYx/OA9/nqS15t9h8yaMdP3GxBi4+33Yo0Z6KrJ
	 e/SgiXlmRV0Jg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id D13AC198003A;
	Wed, 14 Oct 2026 05:44:12 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 14 Oct 2026 05:44:12 -0400
X-ME-Sender: <xms:607PajM0wqOjIhGz2rAOrLL01EoYD--AXQqdku797tWpvWAMt0U98Q>
    <xme:607PaozfKGksLOlCwjvVRPUtU6EmbS-pE8j7RQC3LX-PZrHM4Lc3fWi9UUWYxRPI5
    KF_wqa3BqSvFEAPhuGfUcX_Qs6ONhyoZOqCL3b8tbWNT3IgYvQEbzcV>
X-ME-Proxy-Cause: dmFkZTG4qDbjkd8V/yEC2ZTNDUkLSoqEFfjf9pDh5dVIvv11+jOBRwgedbQQEemplu4fac
    tELNld/pjUFEZA5pcjb8qJY0hIS3+mWibWQ62OlvcuItA8q2et6DzUlBlF8oilXJjOpdL+
    Fnbw6g8q9z7qEJuXNk09xt8HNPIYrmT8XGnkLX6VTuHzHG7cVSY2Dr4f/tCqbT9CKo7KCX
    9MTx4b/rVG57gPjqAeJ67MR4FRtQ8acl4ma77/G/lJbbX5T7cQRZrk/lnQrtIBHauG7Ori
    1EtMS6e2aXBFtheGtIEq6eJZjCNoh7CN6dR/ntqlcvwoWWkL7Pjyo/S+VEfajh/i42O0fL
    +o7uxWP1nacV/q3oCK94mV+G93ejAiT6seLlFerjZDzvs8eTM9Luf38k7UkpOuu8BFFWUF
    w24DwdylnGHhafWH75kAmolZcjZtahMcd8VHCHfiR8H2M00FHnyf1E0hfeI5wy3/nWLw86
    4/jlCfublcbYf+OpZIXNMa9YYSF9SUY7GovUZ7ruJTaQ9tuZwyaVuog39cjTquaPcyICXL
    Qwc1B9IqGnLGePRZposoyfEFujrsPQvfvtFlExcFU4kMitF5fU9St/qv3CTi9+gnPIJxP0
    3rqU1iv7K4lh6DOluQjMqi1AVsojcUgj8HiGMG06NFeQn6DifxYTPvkCw6yQ
X-ME-Proxy: <xmx:7E7Pai06VHF_LSDvcwDKuXk3Hmk4z2F6YkoECo4F3WT7tN6YE9temg>
    <xmx:7E7Pai5BvW3dJMMh3xEJ6b1CqYg0TOQjstQ_QojhOK_zjcqLR7zDwg>
    <xmx:7E7PalVKzWm1w3NsCD14GS_znULJcdXdXabU5q3AbzUnULUiqiV8mw>
    <xmx:7E7PahBSIwg1yYw0mwb1EHRDADKcWKSe-jzk0PWTH_4aLIpyPoktkA>
    <xmx:7E7Pak5kb0FG2fdSp8LqZnI1KiSw11LRO3cIt0FkId4ZubLY7fXQ3QSj>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 87AB6F8008E; Wed, 14 Oct 2026 05:44:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 14 Oct 2026 11:43:51 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Melody Wang" <huibo.wang@amd.com>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 "Tom Lendacky" <thomas.lendacky@amd.com>
Message-Id: <81c6d97f-850e-4f51-919f-cb3a11f47962@app.fastmail.com>
In-Reply-To: 
 <5ae01ceb58a3fdf6ed9367e236d77b4a21a3363c.1791912902.git.huibo.wang@amd.com>
References: <cover.1791912902.git.huibo.wang@amd.com>
 <5ae01ceb58a3fdf6ed9367e236d77b4a21a3363c.1791912902.git.huibo.wang@amd.com>
Subject: Re: [PATCH v4 5/7] x86/sev: Register the guest with the SVSM APIC protocol
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello Melody,

On Tue, 13 Oct 2026, at 19:50, Melody Wang wrote:
> The SVSM APIC protocol supports 5 calls. SVSM_APIC_CONFIGURE_EMULATION
> (shortened to SVSM_APIC_CONFIG_EMULATION for brevity), call 1, provides
> the controls whether the guest can make use of the SVSM APIC protocol.
>
> Implement this call, and register Alternate Injection for the guest by
> default.
>
> Signed-off-by: Melody Wang <huibo.wang@amd.com>
> ---
>  arch/x86/boot/compressed/sev.h          |  2 --
>  arch/x86/include/asm/sev.h              |  2 ++
>  drivers/firmware/efi/libstub/efistub.h  | 11 ++++++++
>  drivers/firmware/efi/libstub/x86-stub.c | 34 +++++++++++++++++++++++++
>  include/linux/efi.h                     |  2 ++
>  5 files changed, 49 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/boot/compressed/sev.h b/arch/x86/boot/compressed/sev.h
> index 22637b416b46..62e50c2e71ed 100644
> --- a/arch/x86/boot/compressed/sev.h
> +++ b/arch/x86/boot/compressed/sev.h
> @@ -14,7 +14,6 @@
> 
>  void snp_accept_memory(phys_addr_t start, phys_addr_t end);
>  u64 sev_get_status(void);
> -bool early_is_sevsnp_guest(void);
> 
>  static inline u64 sev_es_rd_ghcb_msr(void)
>  {
> @@ -37,7 +36,6 @@ static inline void sev_es_wr_ghcb_msr(u64 val)
> 
>  static inline void snp_accept_memory(phys_addr_t start, phys_addr_t end) { }
>  static inline u64 sev_get_status(void) { return 0; }
> -static inline bool early_is_sevsnp_guest(void) { return false; }
> 
>  #endif
> 
> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index 93161b663d9b..13f2e8c009b4 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -471,6 +471,8 @@ static __always_inline void sev_es_nmi_complete(void)
>  extern int __init sev_es_efi_map_ghcbs_cas(pgd_t *pgd);
>  extern void sev_enable(struct boot_params *bp);
> 
> +bool early_is_sevsnp_guest(void);
> +
>  /*
>   * RMPADJUST modifies the RMP permissions of a page of a lesser-
>   * privileged (numerically higher) VMPL.
> diff --git a/drivers/firmware/efi/libstub/efistub.h 
> b/drivers/firmware/efi/libstub/efistub.h
> index fd91fc15ec81..d65cdc8f2acd 100644
> --- a/drivers/firmware/efi/libstub/efistub.h
> +++ b/drivers/firmware/efi/libstub/efistub.h
> @@ -177,6 +177,17 @@ void efi_set_u64_split(u64 data, u32 *lo, u32 *hi)
>   */
>  #define EFI_MMAP_NR_SLACK_SLOTS	32
> 
> +typedef union sev_alt_inj_register_protocol sev_alt_inj_register_protocol_t;
> +union sev_alt_inj_register_protocol {
> +	struct {
> +		efi_status_t (__efiapi * sev_register_alt_inj)
> +			(sev_alt_inj_register_protocol_t *);
> +	};
> +	struct {
> +		u32 sev_register_alt_inj;
> +	} mixed_mode;
> +};
> +
>  typedef struct efi_generic_dev_path efi_device_path_protocol_t;
> 
>  union efi_device_path_to_text_protocol {
> diff --git a/drivers/firmware/efi/libstub/x86-stub.c 
> b/drivers/firmware/efi/libstub/x86-stub.c
> index 2a1fa773d241..b6e58ade4162 100644
> --- a/drivers/firmware/efi/libstub/x86-stub.c
> +++ b/drivers/firmware/efi/libstub/x86-stub.c
> @@ -783,6 +783,36 @@ static efi_status_t exit_boot(struct boot_params 
> *boot_params, void *handle)
>  	return EFI_SUCCESS;
>  }
> 
> +/*
> + * When the guest is running at VMPL2 with Alternate Injection enabled,
> + * register Alternate Injection before ExitBootServices().
> + */
> +static int svsm_register_alt_inj(void)
> +{
> +	efi_guid_t alt_inj_proto = OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL_GUID;
> +	sev_alt_inj_register_protocol_t *proto;
> +	efi_status_t status;
> +
> +	if (early_is_sevsnp_guest() && snp_vmpl) {
> +		if (!(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
> +			return 0;
> +	}
> +

I'm struggling to follow the logic here: doesn't this attempt to locate
the protocol on non-SEV/SNP systems as well?

Wouldn't it be sufficient to do

if (!snp_vmpl ||
   !(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
       return 0;

and leave the early_is_sevsnp_guest() check alone?

