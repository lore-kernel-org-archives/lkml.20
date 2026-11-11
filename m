Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423223;
	b=rVTK5rmxyJ8u3svy8T0ZPn4mI+aSqL6I4a8KqTsxhfI00OMvKsdFnbZcf9qH4axs1Bt0
	 uqZ+zUhw+L1WMRIelYFNIJ/3q1iYj3sEjt9ic269dUDSDDmyAaPZAboZnAWmW+HlRH+WE
	 gjnO5Pv4CiAk7QUOcfBQ79E/rYnF1zWls/H8AOXQ0W5LFbq0R0292BEqUt2+DHpZdNKZg
	 9c5pr5GKbOMpErEOkupC+a7LQVLIQoVgeZJc12GsWqP6E1+z08iV+wvLb9CWE6eRyNj/A
	 MQS0FygP4iwvzK0CyY1QRHGLTmJ7XML+/iX+jJTJ31DqdxWzJOtlKbmpl5o5ct+Z4Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423223;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=PYzsGgod1v2dvJrVFGeY0BQ+HuOlbqzOMG61uDWBRg4=;
	b=g7KxDy59GMaboVJjmSFV2afMgMR3oJAXxgtgPOpIGWtfHJOhK9u8VS+8CBxiih7UKj0/
	 4/TlRR0zeX87dcnAlra5TcJrEKqAntU6nX5K0h7R40+FLrREobRs9cLLp/VF3h2cSu0tV
	 Gnwdm5+oyvHNVV/sV2tSEVcppNfIFp3zPlMQ1eZtmMmgDJ3HFv4we6ChO9TMa205mnMRD
	 RjKSA+0P/c1z7jU6SFASAyNhegzN8NwWfZvE5TcTO2U2RN2LjfJSo/jnaFJ7wDK/ZWwFl
	 9zJogNZd7znQPif3gkCrukqhCxTcLdzZVX0aDy7BrTFvTj+M4epDlhktYZa8B/8CDbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kuufHG+P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3EF606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kuufHG+P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216531F00A07;
	Wed, 11 Nov 2026 18:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794423222;
	bh=PYzsGgod1v2dvJrVFGeY0BQ+HuOlbqzOMG61uDWBRg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kuufHG+PZt7gE5/bUwtIDSgCQyKQNoZnZNCoNyjfVvnb06r5ujSUAEeQarCPQfiIc
	 wZp4EBr4rq4cXFNltmxrf0SIaMjQ2uWMU9vpupTsy10coO1fjnoJXdfI2OATToYcax
	 o9LiayjACNwwHvtGSyMWZ6HLQfGhoxmaVtcqTacNG7gEeuA8nApxQFGRtoavID4QIJ
	 6Yx8fGtBNI6rNqFs+Mz96J983JITGWCDc5i5XQCtpGhhvciBxovheVzlsYm/Q31WQN
	 eex2bPQRDUwnvECITJWo8uGKjkc4tSfU483/Jx3tohwcOPHfU835+jhz7HXQ8/Yc78
	 FK1eFRwZVOnWA==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id CA3A4198003A;
	Wed, 11 Nov 2026 13:53:38 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 11 Nov 2026 13:53:40 -0500
X-ME-Sender: <xms:srn0ak_-aftocvvhwWq8K26WaFaTB70dZ5Kf8AAA7zrAGC9NZfJPAA>
    <xme:srn0andSnJHjOKAtahVGUVpWWcwI-R0xxszz6UxCFRla6R-kDpC6DfEXw75doH3ow
    xsAmbevugqDuJUhWL3-L5a-INtpVLscLoywoQUzznU8hU8ywz_xgVTz>
X-ME-Received: <xmr:srn0ao7W_LWkosI7Q3A2ZqQYxlu1B_thjIm0NMyjUHlCz2YhOO5EQQVjvo8>
X-ME-Proxy-Cause: dmFkZTEa1dvnx6ihvTibVGtAfbCVzvwaA0LvSEoEdkrti8I5hWXxtjO6pYb7xAtBYPXprf
    24I1jLpD1rG1ueNtQO7uHF5m0Cs2F5bIo86oBDf+1smmo5Eu06F9GBAj93UUsQfgjhfSjN
    Qov9F9ZcoPX+nbAdKEV3ue0niovWqmWzxUyLwn1Udo3iRU5q774aTYsG7Dd1DtxvXBMPjb
    31zhIFEGq1K7YkQ49uYelSH16y3gF8S0vKwZxZLVjWoYGod1m2+9ACDYXJ3mk6bofQMp54
    uJxqAU5j3HbIrd30UTRvV6lpcorhjFIL7huhuDpdoNAD8Sj8ZN9QUl2HKNwBvyKXfllKW5
    /+tDkfPISPKrmzIPgb5PIsge929BdCSHitecDptB5A8yL+CFkgQxR3MOXqd44baz+MbzXJ
    Yz1fhqvA8I7PHblTZZFFotsbmQtYGAGTExZHZ8SIQOXRXtV1IH18sSzschAv9HLc6/f134
    OaMMobfwqBkON2h/1fySfPxq2kCewuUBruhloon+eF6rEowyfpHrfEYgYEWv6CXAh6eGnQ
    v2kvbdJwCRtuy/6nO4TCikhtvfmLrr7kRA4vo/Wm5gmr58uSA11tO9Cd6EXQHtBrJcbuLJ
    IBluKQXFDBMdoL+ePqLGvJoU7Q09pc0IQCdDRfJWTlV/jCSeZTZww/KcbgAw
X-ME-Proxy: <xmx:srn0arNHmzBFe3B9B3P8wD-cROYNj2sGs8hOw2vUJmlY8AS5fx-mnA>
    <xmx:srn0ap6gtlXiXhN_ZM-G2c6YvVBX9kUZnK057PGCDKvtTxYDWa-nzA>
    <xmx:srn0aiyXdfFaPmoch8ftg6YGvgjFF_AqNkeGlnNtzn6gWBnt42vdNA>
    <xmx:srn0apT2TmtgD1k2Hmwu6CuitIyMt2U8pPR-YEjqE3MgU5tOthX16w>
    <xmx:srn0aq9HYBlk66VetoipOqdJluzifyRP37eZ989HEGwcufebdttc91ol>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Nov 2026 13:53:37 -0500 (EST)
Date: Wed, 11 Nov 2026 18:53:36 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Tal Zussman <tz2294@columbia.edu>, n3rd <18670333770@163.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "ljs@kernel.org" <ljs@kernel.org>, 
	"ziy@nvidia.com" <ziy@nvidia.com>, Mike Rapoport <rppt@kernel.org>, 
	"peterx@redhat.com" <peterx@redhat.com>, "security@kernel.org" <security@kernel.org>, 
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: Re: [SECURITY] mm: khugepaged collapse_file() drops RWP PTE markers
Message-ID: <avS5QcRj85yAm9ll@thinkstation>
References: <606cae9e.bbec5.1a1c54f4f9f.Coremail.18670333770@163.com>
 <60541e98-b1f0-4f92-a155-8a29c0bb17dc@kernel.org>
 <44abb8ef-7711-4ad0-be9f-ca47206892a3@columbia.edu>
 <856cdf21-7982-475a-b244-a7ceff4eb6aa@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <856cdf21-7982-475a-b244-a7ceff4eb6aa@kernel.org>

On Wed, Nov 11, 2026 at 08:29:50AM +0100, David Hildenbrand (Arm) wrote:
> On 11/11/26 04:19, Tal Zussman wrote:
> > On 11/10/26 6:55 AM, David Hildenbrand (Arm) wrote:
> >> On 11/10/26 12:54, n3rd wrote:
> >>>
> >>> Hello,
> >>>
> >>> I am reporting a security bug in the Linux kernel.
> >>
> >> Stop sending uffd problems as security bugs. STOP IT NOW.
> >>
> >> Tal has a long list of uffd-related fixes he is about to send out. CCing him.
> >>
> > So this issue was originally on my list and I had a fix for it... but it was
> > REALLY ugly and a band-aid, so I dropped it.
> 
> Yeah, RWP is a mess.
> 
> > 
> > I think the real solution is to just add actual markers for RWP and solve
> > all of these issues at once... but that should be a separate series from my
> > batch of fixes (which I'll be sending shortly). Is there a reason RWP
> > markers weren't done in the first place that I'm missing?
> 
> Let's ask kiryl: why is it ok to drop RWP PTE bits during swapout, zap, collapse
> etc?
> 
> https://kernel.org/doc/html/latest/admin-guide/mm/userfaultfd.html?utm_source=chatgpt.com
> 
> states "Unlike WP (which persists via PTE_MARKER_UFFD_WP), there is no
> persistent RWP marker today. The user needs to re-arm the range with
> UFFDIO_RWPROTECT after any operation that explicitly frees PTEs."
> 
> But requiring the user to re-arm is rather questionable design if the kernel can
> just zap these page table entries.

There is no need to re-arm. 

Once the PTE is zapped, the next access faults, and userfaultfd already
has a mode for that fault: MINOR if the page is still in the page cache
or in swap, MISSING if it is gone. Register the range with RWP|MINOR and
the first access after collapse, shmem reclaim or MADV_DONTNEED arrives
as a minor fault. The monitor counts it as an access and resolves it
with UFFDIO_CONTINUE.

That is why there is no RWP marker: MINOR already covers it. WP needs a
marker because MINOR would trap reads as well, and a WP user does not
want those.

Anon has no MINOR mode, so there the bit stays wherever the page
survives: it is carried on swap and migration entries, and anon
collapse bails on uffd PTEs with SCAN_PTE_UFFD. MADV_DONTNEED frees the
page, so the next access is a MISSING fault.

The report registers RWP alone. That is the only setup where the access
after collapse goes unreported.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
