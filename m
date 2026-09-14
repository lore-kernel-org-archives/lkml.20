Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B6949DB80
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416294; cv=none; b=UT/Nh7YDy6+aUUXdCMZy4ouTqxm3WZaz9KfyJTM6gnl+FMn6xBbLQ0yevvjnJorlADLRe5lWdgFNKyDRjkxq5JeDsU6i9z9WpoXHH3RB7sh7OrPVBpDTWmwuqjbWfUGVhYODY+EDoU5e0T8mzAYERPuBz7rqVyi2IAYhjR8ZNYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416294; c=relaxed/simple;
	bh=ErYITKcJxDoMsV0VqDPeQpRgOvQfuVozbFtYnk7vZiU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YRk6ByZmy2iiWjb+h+zx3iOEY5U+56DtUaSbEV1/kF+FWE72Mcp6Fdie6czTTMafJ9SVQh+x8K7cDKrnuDBydIea6sQpDaBh0KX9ffq7fVUv79//HMJXS7BEcBoyzKqh1cuMwgh0r3y8E7wOEK4255p5urtg80gQgUe6FPLWUCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBUE5ct8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBUE5ct8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717431F00893;
	Mon, 14 Sep 2026 20:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789416291;
	bh=v4KUWbILeePOarO8rQimXyKut1t+TlxUptv4A1TtiJg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=gBUE5ct8ZmdI+YqImZsuYlKm6SxX5TvXFwvqz3PTDg8CRq3rRWTcOxdOtFLcrpFky
	 /pFMe14ZGcTL4SsATkseFrQMINkzZ/2b/EF6aXUwXswOqLCvLGZMvattMxFydTwu6r
	 gv6bzT+xiLMUsGSDKjQWzw3JxPyqpRgdE6U8ixIhXzK+K5wuF5UwHT6z7eCs7afesO
	 p4N9N2WDanS5PVHg137kOpTOM2NoY/RU3ZybBYmcdOy92EfW2SGgeG+BjEMd7e06UA
	 RqKHzg1xRt7x0/w0rQbYee0p+OTwfS91TfFYwLXiweEPZTOl3LmdTrK8AolxcWGs03
	 RSrKwrVzgS3jA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 87F37198004A;
	Mon, 14 Sep 2026 16:04:49 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Mon, 14 Sep 2026 16:04:49 -0400
X-ME-Sender: <xms:YFOoagQH00Zlp61Ua-F6f-Db1AeRDp05--6sjAwfEl2oJR8rbpL1kQ>
    <xme:YFOoaoloZovv3wkR1zHJ2-SreafW9nlEANMt5v2S01qG9YUg8E_PXuA9lxS8anJSz
    kJzFQHRH0BasTIUDE6T5qcfZwH_HtB9BkyuGni_CQIwt0UoRaGncZ45OQ>
X-ME-Proxy-Cause: dmFkZTESoSO3bkLsfEH4A8M32QOGWSruwXp7UGnaw2j89vCrqxY7fSwKRvtDkugq2dp3kG
    tetxOuuiuAHQQJQzDbY9UaMTxmjRolrKndXBEZneX6d1h20fLxPIGiADRqLowAtFi3iiwh
    xKUOetKplnu3XQ8VJDf9WCDSHLnm6dsw0C/kFD9ZGnPjZHDkhHRzuQO6snjwG1ODvjkQGH
    BUqhV5pWZ/ZRVg68YBO1folrqjBsDdvbNQTtNzL2zbmD7iEUmyOz2gAiqvryNI3YIQBWKF
    WPAt9dNmR5u4jmXf8nScxGIrysMZVN8tFt/XM+d4JcvpRbmYhn/MNbWIBAr1SigiCLipWr
    NMbA7CgEZ7ubg+wbnGw7GxpGMjf2txu5ITc5zXipLLQGH/SXAvtRrMicl5wFn3/F8R9y+7
    c1nkRsdoWCiulSAE2yypG/8IhvW6jStcCTo1QjZn8zKXADOxB0E3GjVSOWHOU72UuDDDpu
    rNGQdPoRxmDX0JOJr7IybTTAwQ1d7u3cKylQmOU348Au/J9BWye7p5cTBOBPET6kuS+Qbi
    9BvEq4FcWKBZ9QLe0SJWq1juqFsTNY75C5V1INb0SHBkgVx7YqK4rrBnvZcAeV+5fswV0a
    Ejk7GRWkmoyP56S76ZM2tbqqxSVxuomoBLvUANg1hz6K9urCyUBL6xg6yp7Q
X-ME-Proxy: <xmx:YVOoam7m4NM5RsxPGKwaTeOm5__lFR1uEd3Iykj8Y0z4cVVjqAsQ5w>
    <xmx:YVOoatv-UPCQor3g1GLVXR5uyVBI45kXh_63Beyj54A5f9zvs2avGA>
    <xmx:YVOoav56mqC3RrOPMhqRvrwHOvcKmkczrRGJtwi5o02aAShoArPQZw>
    <xmx:YVOoagXgBCGoHAd6UzeQQY0h3i3l1kcUbuqO0lIrsxL343wpJrA44g>
    <xmx:YVOoap_z3tK_6Kv_5htx3DIpZ0uYrh9SH5W8r1_-bVibxXlZog88KvQ6>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3F83FF8007D; Mon, 14 Sep 2026 16:04:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 22:04:27 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Melody Wang" <huibo.wang@amd.com>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 "Tom Lendacky" <thomas.lendacky@amd.com>
Message-Id: <db8bceb5-b72a-4742-aa44-9cf21a8c95b8@app.fastmail.com>
In-Reply-To: 
 <8b651e078329193ef458757696ea54a314519427.1789345277.git.huibo.wang@amd.com>
References: <cover.1789345277.git.huibo.wang@amd.com>
 <8b651e078329193ef458757696ea54a314519427.1789345277.git.huibo.wang@amd.com>
Subject: Re: [PATCH v2 5/8] x86/sev: Add a function to contain all SEV-specific setup
 operations
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Mon, 14 Sep 2026, at 02:57, Melody Wang wrote:
> To make the code clean in the boot phase, add a sev_prepare() wrapper
> which contains early SEV-specific checks in order to have all that code
> in a single place.
>
> No functional changes.
>
> Signed-off-by: Melody Wang <huibo.wang@amd.com>
> ---
>  arch/x86/boot/compressed/sev.c          | 11 +++++++++++
>  arch/x86/include/asm/sev.h              |  3 +++
>  drivers/firmware/efi/libstub/x86-stub.c | 17 +++--------------
>  3 files changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
> index fc2029746c50..c935a97f72e9 100644
> --- a/arch/x86/boot/compressed/sev.c
> +++ b/arch/x86/boot/compressed/sev.c
> @@ -511,3 +511,14 @@ bool early_is_sevsnp_guest(void)
>  	}
>  	return true;
>  }
> +
> +bool sev_prepare(void)
> +{
> +	u64 unsupported = snp_get_unsupported_features(sev_get_status());
> +	if (unsupported) {
> +		error("Unsupported SEV-SNP features detected\n");

The EFI stub will call this while running under the boot services, so
error() should not be used here.

Also, error() never returns - it is the decompressor's pseudo-panic()
so whatever you return to will never execute.


> +		return true;
> +	}
> +
> +	return false;
> +}
> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index 3cb6c5d6a6e0..95f9a5084c45 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -605,6 +605,8 @@ static inline void sev_evict_cache(void *va, int npages)
>  	}
>  }
> 
> +bool sev_prepare(void);
> +
>  #else	/* !CONFIG_AMD_MEM_ENCRYPT */
> 
>  #define snp_vmpl 0
> @@ -652,6 +654,7 @@ static inline enum es_result savic_register_gpa(u64 
> gpa) { return ES_UNSUPPORTED
>  static inline enum es_result savic_unregister_gpa(u64 *gpa) { return 
> ES_UNSUPPORTED; }
>  static inline void sev_apic_ghcb_msr_write(u32 reg, u64 value) { }
>  static inline u64 sev_apic_ghcb_msr_read(u32 reg) { return 0; }
> +static inline bool sev_prepare(void) { return false; }
> 
>  #endif	/* CONFIG_AMD_MEM_ENCRYPT */
> 
> diff --git a/drivers/firmware/efi/libstub/x86-stub.c 
> b/drivers/firmware/efi/libstub/x86-stub.c
> index cef32e2c82d8..fae3a7dfb8b3 100644
> --- a/drivers/firmware/efi/libstub/x86-stub.c
> +++ b/drivers/firmware/efi/libstub/x86-stub.c
> @@ -783,19 +783,6 @@ static efi_status_t exit_boot(struct boot_params 
> *boot_params, void *handle)
>  	return EFI_SUCCESS;
>  }
> 
> -static bool have_unsupported_snp_features(void)
> -{
> -	u64 unsupported;
> -
> -	unsupported = snp_get_unsupported_features(sev_get_status());
> -	if (unsupported) {
> -		efi_err("Unsupported SEV-SNP features detected: 0x%llx\n",
> -			unsupported);
> -		return true;
> -	}
> -	return false;
> -}
> -
>  static void efi_get_seed(void *seed, int size)
>  {
>  	efi_get_random_bytes(size, seed);
> @@ -919,6 +906,7 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
>  	unsigned long kernel_entry;
>  	struct setup_header *hdr;
>  	efi_status_t status;
> +	bool err;
> 
>  	efi_system_table = sys_table_arg;
>  	/* Check if we were booted by the EFI firmware */
> @@ -933,7 +921,8 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
> 
>  	hdr = &boot_params->hdr;
> 
> -	if (have_unsupported_snp_features())
> +	err = sev_prepare();
> +	if (err)
>  		efi_exit(handle, EFI_UNSUPPORTED);
> 
>  	if (IS_ENABLED(CONFIG_EFI_DXE_MEM_ATTRIBUTES)) {
> -- 
> 2.43.0
