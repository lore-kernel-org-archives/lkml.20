Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A9C202F71
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790054834; cv=none; b=XiHbXpPTWQoosyq+dNJjvW26plah6+VTrqBYchtpwNBuypKXwlL00opS50JQGWdYU+7XsIh7KDWU5vLFk5UPaOOoS4mhoQm1jYuy6lkgUesXAq8rD/rzQ25vAQyfxlNb9TAnrWznq285XlP6sw0NxXIawmx7dqd/oo7dulhLFzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790054834; c=relaxed/simple;
	bh=K5IIm+APc4jympK0qEjgHtsW6H8PpwZR1cTQjS5Fgpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhwmEgz9w+RViEt2UTOj9QFLsMR8OUsAsd8iMwAwn6QvWmfj9s8tdGJHKgOBB/tresjF3I3phMQP64H1LpBa8CAImBUxdYJX3ECEUgPGTP8n0ea48UMiGg5mABYAvXRSBNcmHZLc8qhWLq3MgjlmSa1kQXrzNxDN5tWUSzl5rgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=MHhtvQ/k; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MHhtvQ/k"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C15EA40E01C9;
	Tue, 22 Sep 2026 05:27:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bP2jk45YfsSk; Tue, 22 Sep 2026 05:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790054819; bh=qOuM0qw78jV5zIJNqnzmCzJozkbA4TbDq7iK4HvjKS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHhtvQ/kzJJdFhj/Q7bDYoEAdcCTkvgtlHQSgQ0iuT3vKOQ6An4jC5xkIai4s+Grd
	 4k1WHdj6bcOZVzat+PkxR0txLMJ2jP+wcsAMhde/rxY7cC2BIFi2ojp8dlGvHCBwX/
	 dirlpTRG4osGjh5Fp8Dv4/ZhkG1yNaXBusq7uu33I91Pj6D+GpFabuD5aGs6Plvz2+
	 YjodTskBb6Y1Vw+Wwcda3gDS10QqER/PbTMT5WkRjoKy/eWAUx2SqymakDIurrX6Se
	 /jz+ZQ1OOUnSvgbT75P2t2aW8tPfFubqqRGTtZrvMLJWuNJ2n3gP2Gi6XP42C8ulv9
	 cap4jtXxpGHb3QtMOmKk+8+UNlo7d7ytVjX9ywjbk6BxmV/GnPegrMVnhWQsg4o54m
	 FtV56fDdrrd7Ws/CxRS49nokVUwwTJbV0K5m3kdStV7fIF285sbe1zidfkCCSg2cWD
	 3BTjWhmYM0KAoA52vOMsZwluBnYbk40FnoJ4C8pbnUjtAbzufQsXelZWhtD6Zi05uy
	 /Tk2u40gR7DG84Jz5MYD/ZLh5pIxRvfVNAF5dcw7i2y74ivsROGu5y14m2E9nbc2xr
	 43J294QBjorus8ZttOG5ezSA9D2XEadMuV8XFGsNZnI8DwKVJLd4S4pNyNG5oNV6SY
	 rMhMR8CA8NF2c7OrK/gd8uRA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4C15140E0173;
	Tue, 22 Sep 2026 05:26:48 +0000 (UTC)
Date: Mon, 21 Sep 2026 22:26:44 -0700
From: Borislav Petkov <bp@alien8.de>
To: Robert Richter <rrichter@amd.com>
Cc: "Naveen N Rao (AMD)" <naveen@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Bharata B Rao <bharata@amd.com>,
	Manali Shukla <manali.shukla@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH RESEND v4 1/3] perf/amd/ibs: Limit the max EILVT register
 count for AMD family 0x10
Message-ID: <20260922052644.GAarIRlC8y3-LTM9LB@fat_crate.local>
References: <cover.1788425679.git.naveen@kernel.org>
 <b98bf368f4c0e2af51ab8f9dbe3acaf11ebfee40.1788425679.git.naveen@kernel.org>
 <20260919034035.GDaq4EM5Z41kzGVw1i@fat_crate.local>
 <arD2XOBh5SQnKjof@rric.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <arD2XOBh5SQnKjof@rric.localdomain>

On Mon, Sep 21, 2026 at 11:18:20AM +0200, Robert Richter wrote:
> > What is this "fixing"?
> 
> Nothing to do as long APIC_EILVT_NR_MAX does not change.
> 
> It shouldn't be sent as a standalone patch. Instead, embed it in a
> broader change to keep it in that context.

Aha, it looks like patch 3 is the candidate for that.

:)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
