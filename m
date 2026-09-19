Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B64F368D40
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 03:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789789266; cv=none; b=udm6/AIi6it4ZddWSYm7xrup3RxBiZf18gXK79R681T2ydfJYnR7KIFQMkpTfeKags60t+fob4X8rcaP+Zy8eorAqM/WNcpUjv5QhurlsBX2ILzXoT8MeqYDuYcdnV3SOnA/jIhHMujEfjWN4fQvGSvx5PqPcxls+riaXANSxGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789789266; c=relaxed/simple;
	bh=V5auvF0wDhj1xG/C2ULNfcgAP0vtIWzoMY87R2/u4is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DAuTt+4uB2XfjaTUIHtkdVt+xD1V2gRsO/J53OwzVSrQrbv+zDR0XEoVKnaH+Di+XAYd17IdXZFUXmjikzk3WbRXfxtwpYvLjmEvPow+HDqApRWX1GmKXPvakIhvtiuj7rfUnysleM2yoY5MNgoXClpGFkbRZ3CFopYLE0GPM0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=jxdQjQH1; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="jxdQjQH1"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9D31140E01DD;
	Sat, 19 Sep 2026 03:41:01 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RNrp2A5wLxfN; Sat, 19 Sep 2026 03:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789789250; bh=kMvNqYKd+0lYpFeqnp5H/IUOqJ2O49tv4alh/7MFz/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jxdQjQH1haDdDStB7xK5pHzSpVL31wq1t/DawmYU0HRU2ghN1LSrkkt3KmbQh8gs4
	 bDjs6Chm/xWj9bJrDDnNAD6kktTc7BUAGsVFLXNofWuSE/VMh5i/+iVnUwF36nKbXV
	 aMuUwj/wHimRZx8wfGxgaz98AzKVT0kQaDR8+Pn8uvyiQTc23RcCzAdwx1cH/kdA7g
	 8P10JlbLpVYHUcjDedBKfWRFjGz69MDeaLG3HognIpGDWci1Yqc3Yb3b8qyjOAEojZ
	 liH/fh4G388BBkXopLWgR12PXtY1jvZAOUEt0OK5izIRjfjL7PAMEKneh1FDTkCis+
	 4spIrCx5EoiqNlxE1iQ0cpH8jb2XrAVEOHzmkfYa4OUDquBu0o8KQmlPR0s1Zzz44a
	 XlsrD1TAVScTSCCJ6Ad2sTRW0moZby2RUfJl/rluW7L9/u81+fznttyjYbS4UPiyAi
	 nW+r45JMigas863PBhOz6df7cVOyrEG71nwAQcP2WUDW5PzvhkurGvX3+DJV9DYPdi
	 MjFQYHy559thcs+wTq9NOC93m9wQ69rCNHQgIoezJbQtuYt1gI8Uq10139KWH5exGl
	 bj4ijoZD9UEvwnQiDPPnywzNNBh8Fkc1AcI/hjF8pjIWGGeJehhC+W1n7iAtM3mii6
	 f1EU8wT0i2n91G0ogHsmiHwc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 36FF840E015B;
	Sat, 19 Sep 2026 03:40:39 +0000 (UTC)
Date: Fri, 18 Sep 2026 20:40:35 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Naveen N Rao (AMD)" <naveen@kernel.org>,
	Robert Richter <rrichter@amd.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Bharata B Rao <bharata@amd.com>,
	Manali Shukla <manali.shukla@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH RESEND v4 1/3] perf/amd/ibs: Limit the max EILVT register
 count for AMD family 0x10
Message-ID: <20260919034035.GDaq4EM5Z41kzGVw1i@fat_crate.local>
References: <cover.1788425679.git.naveen@kernel.org>
 <b98bf368f4c0e2af51ab8f9dbe3acaf11ebfee40.1788425679.git.naveen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b98bf368f4c0e2af51ab8f9dbe3acaf11ebfee40.1788425679.git.naveen@kernel.org>

On Thu, Sep 03, 2026 at 02:58:39PM +0530, Naveen N Rao (AMD) wrote:
> For AMD family 0x10, EILVT offsets are not assigned by BIOS and is
> instead assigned by picking the next available EILVT offset.  Use the
> maximum EILVT count for family 0x10 (APIC_EILVT_NR_AMD_10H) rather than
> an arbitrary maximum EILVT count when looking for the next available
> EILVT offset.

Huh?

#define         APIC_EILVT_NR_MAX       APIC_EILVT_NR_AMD_10H

What is this "fixing"?

Also,

+ Robert

who happens to know something about that code. Don't forget to use git
annotate, do some git archeology and CC the relevant people on patches.

Leaving in the rest for him.

> Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
> Tested-by: Manali Shukla <manali.shukla@amd.com>
> ---
>  arch/x86/events/amd/ibs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
> index 3531f9c23b8c..555912ac520f 100644
> --- a/arch/x86/events/amd/ibs.c
> +++ b/arch/x86/events/amd/ibs.c
> @@ -1839,13 +1839,13 @@ static void force_ibs_eilvt_setup(void)
>  
>  	preempt_disable();
>  	/* find the next free available EILVT entry, skip offset 0 */
> -	for (offset = 1; offset < APIC_EILVT_NR_MAX; offset++) {
> +	for (offset = 1; offset < APIC_EILVT_NR_AMD_10H; offset++) {
>  		if (get_eilvt(offset))
>  			break;
>  	}
>  	preempt_enable();
>  
> -	if (offset == APIC_EILVT_NR_MAX) {
> +	if (offset == APIC_EILVT_NR_AMD_10H) {
>  		pr_debug("No EILVT entry available\n");
>  		return;
>  	}
> -- 
> 2.55.0
> 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
