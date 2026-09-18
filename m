Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A159230EF9A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719299; cv=none; b=rckAFR9URDJWWZB8HbEa3Y+9eIYRUJCIf09yTua2mBuZVYxgeqAflzKXtWNMgGWFVYbm9KnBPrImI+a/Xxuh7wV/QbTxtegZlMwRzDOI7+/BzxW2/n99PLXSx9vecjwZMu3er4ROnMXCBQwnT3/cFNWQnIiSWBRjSoY6gInAeMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719299; c=relaxed/simple;
	bh=Ngr8AagYwaxW71vhvgn5Mb92qZ17mxaOQs4+i2uYYc0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=BzodVMKMMZDl1J6BRPjdBCQdaPXLhCe97HhjUCVxp5RaPK+vcrZRYrVAl+Vh6joHMkdaDPkGpoJk+kA8q118BuPqIUz5Zsu+2tou7TfFZQ3lvpWD44AGsgojXttGC71wcLlgRX1T/whB9jPIsbWfRgd7/JzR3N9EDS8WxbUSCgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZaSsy0p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZaSsy0p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B43621F000FF;
	Fri, 18 Sep 2026 08:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789719298;
	bh=zF70PE6QQJD2s8u0qvOoLDL0ITeIbLKxMYBe7iHMpIE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=gZaSsy0pUYgOW1sr+6F/yDW6T6FAfl+U+li+4D4fnGsDnXLPgHqvI+10PpdmxHtVP
	 zyV5FQzX2UqPD3zDkIXUrAQd5DdiQH+yJNZ/T3eq8l91Yf8GMsH9I8yFnJjqvLXZ4c
	 KOwj5gyEww0Yo2nCYccsHP570Pxn6mk0EvnKIKLuNkK1uu/KO5pWOxDTWFjDCvSL6b
	 06U4HDR0pE2eGCYj8DoSCKLH6+W5WtKzioa/hsj/unvPHRAs95qStpLyd7kHVO8mWL
	 sVj5WF+jpsVbjaT4trxqVs5coIp9CZuYC223iHYw3vzb4tPR/kwCWCGwR0s0OCHSgd
	 8rZMeofLNEoVg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 40EAE1980066;
	Fri, 18 Sep 2026 04:14:56 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 18 Sep 2026 04:14:56 -0400
X-ME-Sender: <xms:_vKsauJk1xCAj7C1qSQs5iNgXPga62rFaS1whR-SExVC9bZIiSfDCA>
    <xme:_vKsag_UP4hwnAmRj2nQtht4UzbzJhnGKZNwg0n5ehpjJdb11px4gV1PEtKO-4ccp
    7GScAHQoTWK5chpO5GzLFXP5JNham2LCQUTGAN5CaBA92ghSTPiXJyQ>
X-ME-Proxy-Cause: dmFkZTEbNZpuY3utY9XXGgHM73jjpwxhStZuuOzGjcJkZsLSYcfmqzPU2EChhi73DlKOmO
    WUGFfqXpHgWWdlIxftXDbrLA24qVehaCedUvlYekIeoUktXvSC1RYX9TpuWj8oRdClAJN5
    QBb7moSn8tk2VXOW25aVAPW7usXlyciXzLTE13hCrbHdvfwP9S8ICeHD/1USI6mFGwMp3Q
    1G1HTfP31ZEQM5GAWvF89JEBLP9qz+KCfNC1U2DgpbSIyYwRG+YT0xn2SGGoecJzJdz+f0
    JSpX08g00Pc2KsItzgd1LPvq7LzcbFU5mw9xFshB5TvyOe/vM0+WX36mTC9bz8seHtKXkB
    IvcYlFbBlqXtL/qbBKZx6zO7ScbKNxS5EfO+o7nkdMJ0Oxnkn487PwXF+gUl2a6afA5yki
    XjjWwfAfQPoD7C3mpvmNbTbUcycPZt3H7cob7Q9P5HgFoFvEsdYzy/3oI8tLIfEn/JaGQ3
    e8UzH6bsftDkGFDgws0Rvy8/SjAd8+gqg8pUJOKIsVPiZhabuCfRVivu52OXTuSFGeB8Gy
    Gv4ycro/NzBREK2pvrQJjeUCuRkeFXKgrM77ouuBwf74b9apBmh1R0KMQIXcWOnGtquKMu
    SCAy2l+T0Dn6pjbpmNKvX343z2tB93x9YifzWojhISL5ZtVI2oCHDJxydi2w
X-ME-Proxy: <xmx:APOsamwZ6EeCxlXMNmsdfFGsn-lHBkVod5UMUU9nmKQk8ekHA56oiw>
    <xmx:APOsagHpWRVS3SCknLK9hES_gvNws8PdFGmjFB875jOLwdH_okf__w>
    <xmx:APOsaixRzDbygvDRwJoe-2IsjAUQ6YVHQAdVF1jqlXtFuuwAMQCViQ>
    <xmx:APOsaptlEjEabJn3fhPdklh9VT5Q06lYUKpdIdM1s_mj9lHIFRNQTg>
    <xmx:APOsan2Y7QjOtTbv4aDi9q4GRHJQYGQxeYLo-R4DHVbLIHViJJsoQ6HW>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id DC859F80080; Fri, 18 Sep 2026 04:14:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 10:14:34 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Melody Wang" <huibo.wang@amd.com>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 "Tom Lendacky" <thomas.lendacky@amd.com>
Message-Id: <90950a0f-5954-447c-bea1-0ae225e0ba73@app.fastmail.com>
In-Reply-To: <b0927c73-9171-40e2-9d1a-3dcb2da1c839@amd.com>
References: <cover.1789345277.git.huibo.wang@amd.com>
 <d0b15a9b5f6e2199ff48bb77e9396044fa96dfb2.1789345277.git.huibo.wang@amd.com>
 <8e4b05a5-61e7-4015-ab72-1e55156e1772@app.fastmail.com>
 <3f4e75ed-9a4b-448c-adb4-5e2e8bae8b11@amd.com>
 <e624a245-e699-40d5-9948-aa77da5c44e1@app.fastmail.com>
 <b0927c73-9171-40e2-9d1a-3dcb2da1c839@amd.com>
Subject: Re: [PATCH v2 6/8] x86/sev: Register the guest with the SVSM APIC protocol
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, 16 Sep 2026, at 20:45, Melody Wang wrote:
> Hi Ard,
>
> On 9/15/26 12:44 AM, Ard Biesheuvel wrote:
>> So please add it to the EFI stub, and code it against the boot services
>> (efi_err() for error messages, efi_exit() when aborting and returning to
>> the firmware, etc). Implementing this in a hybrid manner seems entirely
>> unnecessary.
>
> I moved sev_prepare() into the EFI stub, and I wrote a wrapper for 
> registering Alternate Injection in the EFI stub but kept the code in 
> compressed, otherwise I have to export early_is_sevsnp_guest(), 
> boot_svsm_caa_pa, and svsm_call_msr_protocol() so that it builds.
>

early_is_sevsnp_guest() needs to be exported anyway, as I am doing in [0]

> How about this below:
>
> This is in the stub:
>
> static bool sev_prepare(void)
> {
>          u64 unsupported;
>
>          unsupported = snp_get_unsupported_features(sev_get_status());
>          if (unsupported) {
>                  efi_err("Unsupported SEV-SNP features detected: 0x%llx\n",
>                          unsupported);
>                  return true;
>          }
>
>          register_alternate_injection();
>
>          return false;
> }
>
> and the stub calls this function:
>
> +void register_alternate_injection(void)
> +{
> +       if (early_is_sevsnp_guest() && snp_vmpl) {
> +               struct svsm_call call = {};
> +               int ret;
> +
> +               if (!(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
> +                       return;
> +
> +               call.caa = (struct svsm_ca *)boot_svsm_caa_pa;
> +               call.rax = SVSM_APIC_CALL(SVSM_APIC_CONFIG_EMULATION);
> +               call.rcx = SVSM_AI_REGISTER;
> +
> +               ret = svsm_call_msr_protocol(&call);
> +               if (ret)
> +                       sev_es_terminate(SEV_TERM_SET_LINUX, 
> GHCB_TERM_ALT_INJ_FAIL);
> +       }
> +}
>
> which is kept in sev.c to avoid cross-dependencies.
>

Yes, that seems fine. The important thing is that the SEV support
code that is shared between the EFI stub, the legacy decompressor
and the kernel proper has no dependencies on the underlying
execution context, e.g., EFI boot services or decompressor APIs.

> I can send it as patches too if it is easier to review this way.
>

Naturally.

[0] https://lore.kernel.org/all/20260914183745.37538-5-ardb@kernel.org/
