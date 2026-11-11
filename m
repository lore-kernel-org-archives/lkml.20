Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421165;
	b=EepffsI2IvzjFEMKCHHDsACNwdaTBRaAa5VzmBi/n4FgE+LYy2WGBfeOji9kHcerx8DV
	 iUV7NCmtw8XVpK7xBR+tbSVPfodmu0KP2NmSzx1z5Y8UwZzZ6sOFOjaKvjKztAXhM6VnO
	 PjZVbMgGO9MS2OjnoTb5U5jODDQfUOkfTQR3Hnqe4LBEaAMg2YhJTJN5eNr2yTiXeCn/U
	 4zePLCpteE9dTwLuGmPG8/CF7xl/rkakbjH6vYxLOFnWLYcJFW8tmg/NCl711nvAejjH1
	 IZQHG5U/7Tjhy69DYYICF8wN32WvyVJ4Ipe3y3tMmj+XNYAkXEig+CZK3MEDTGlwLnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421165;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=0VkFnlU5Rj6nySQpJ1gIhelXgCqyEjkU1BN0UomWRMI=;
	b=x0P0Mxglt0C650vNNc1zc8zS7Hk+eKsLryJuw8pmEd8BB2tvLrvRpi0zGJhnNYDK0btd
	 9om3dBv1ebuPz85CQRpeO+Yap+/Qyag156HVC1ZgXbZVRqjQ28BOFITXetpLaqHEjmSKQ
	 aPI2W2mrLIXaYfbYw3OljBMGcTGjZlsG3hVdhK/pcJISpIQW25DlElR6R3uuXo4Niog8M
	 tFAEcsp9ouKfkNLwj/3KVwlDXRZHu0PDfFvQTd5iSCEm/rOsPVmvzvL6M0cuzZwb6J3+P
	 mhSzIREBfSAQbevhv3/3OQHuGni7zM+MxdHj4ctZ97LEbluq7NztlHZ+fYxeY4U7blQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QvsiqHRZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD592606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QvsiqHRZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA8B1F00A05;
	Wed, 11 Nov 2026 18:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794421165;
	bh=0VkFnlU5Rj6nySQpJ1gIhelXgCqyEjkU1BN0UomWRMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QvsiqHRZM0sPCMYIyadU02BIYp2HAqeQm21PntYiP+XoMJICNCuTXgt/FcRvn1fVv
	 ruG0c3ZFbBnrwHdy+He2OOQSXFaq4jaY8RxQcjGQv2mk8YNQjcth0N1xAgDqkM3Hwa
	 niCjLQ2cCcZQ8TA0JvLnIyHYwl8N+e3jLTK+Cm7/oc/1vi+6IL8CkQlLFk6mernr/6
	 jpUpuDKrWG7lCqun0PGJOx8JA8sQSaEbf9GBU4fuxbYuxwFiFJiKafyzRSwUdITQDi
	 OoZiSrfAUzwzPOsP7ZNF3++uqTynLfygxtlEsoy9apLO2W+0EcqCAx962lvd04BUHi
	 6DvTVKNaVaPVQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id EB373198003A;
	Wed, 11 Nov 2026 13:19:19 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 11 Nov 2026 13:19:22 -0500
X-ME-Sender: <xms:p7H0av9yud3dpQs1mMNUgwEYWpUh8e1v6EcPx9zA2fZYRfzSnxklRA>
    <xme:p7H0arpRvCm1Kl_2A_x_3P6iq-pgB3T0knP8mSqO666ZrqdYmJ2DBEFndk5cXsW6-
    wK5zuRmHheJlU5Cm-w6wvL-yyXT2jtYgsAiY1-PgdARVGZ7gR0zdUey>
X-ME-Received: <xmr:p7H0aokGFapjNYuBV7Zk6llyKufyPnii3hBGGrX-IqLibJpn4MiWqFVcsXs>
X-ME-Proxy-Cause: dmFkZTFaGIUger22E9+Whej9EVz+9RCoWhrYp/8hSFDkEMm6K6U83lELZxgVRd6w0CR4o3
    9qQwBalNIVqehQ7MNyWZuGLI2br4Tp5W8JQGq2eaCU1mRuFQnMh4D8+9xTCHrW87kGbTS1
    rYWm4+xNIqIzccbpS4xbEKHnkRbmcvlSf3JQIDBcH2MNtty5FJYD+JWhN/UxG2g9++jy+D
    aTZnzewnpPl2oK2zIJf9OP9V/GJq6T5Kgr019DNcqkQeoyqg6mCkQ4dUp2OekkiFnynKBF
    z9/fMY8RszWodzfggPPNQo26zL8g4qe+ZPKfDvb9tpgZa96GvwYuMOCHrHOq3u3AyIPzUH
    MeYG6aqwOskiYasRqrqJfTMzIusqfHu0CCee+Tja7Ff/XUncCEwy+JV0hPdVcrlREhQmIM
    fHQV2u2cdycOandjitjfwmuxMsoWVdfnYeXXZSmKUBtoZ1xuL9WRHu6Vby1bE8tTOS+Qdj
    6+UsY1kCqId+7fUqw2HzjbKZwt0tc+6HgEexjFEkke6Fij+BB8jUqAhDutyLfqW9uq9c+h
    PT3ysgaQ1ehtj/KipPioqaQ5P0cMFkhZ0X7hSPW+incJpr1evujKjL2WGmcl82WyYpXTwv
    DbkB7i09IpbkFeFUXvA5fvuuMY4NPpKwTpXGnu4w5WIr46fklDUNguuyiMuw
X-ME-Proxy: <xmx:p7H0agYz5383L1DCzJdPyodhN2Sm-P2SvProO7rDPlQRd9AMKxCbJg>
    <xmx:p7H0atvByQcHEZKk3B69pXGmrsm-IXB_JdbtRfa_ZWSg-SPqkIcxyw>
    <xmx:p7H0apqpyVGOJroUKaZjzu8GT8xJcq3-OjHAXKxk3EWVoXKbvg-G3A>
    <xmx:p7H0anmoYmCVPHxpaon6jkf7Qlj3Nw3r1F04WoXuPnJGvCfNkrq4Qg>
    <xmx:p7H0apSOe4iSB6-EOl8EVvc3EyJY6JUPhbe3gr9w92rwJ5WROeuQiodd>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Nov 2026 13:19:18 -0500 (EST)
Date: Wed, 11 Nov 2026 18:19:17 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: david.laight.linux@gmail.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, dsterba@suse.com, hpa@zytor.com, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, terrelln@fb.com, tglx@kernel.org, x86@kernel.org, 
	torvalds@linux-foundation.org, hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev, 
	kernel-team@meta.com
Subject: Re: [PATCH v3 0/2] x86/lib: Use REP MOVSB for large memcpy() on ERMS
 CPUs without FSRM
Message-ID: <avSxmZJPsrAowPcl@thinkstation>
References: <20261111132214.2979125-1-usama.arif@linux.dev>
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
In-Reply-To: <20261111132214.2979125-1-usama.arif@linux.dev>

On Wed, Nov 11, 2026 at 05:20:51AM -0800, Usama Arif wrote:
> Enable REP MOVSB for copies of 2048 bytes and larger on ERMS CPUs without
> FSRM, keeping scalar copies below that threshold. FSRM CPUs continue to use
> REP MOVSB for every size.
> 
> This series splits v2 into 2 patches.
> The first changes only the scalar register allocation: RCX holds the count
> and tail indexes, and RDX is the small-copy data temporary. The second
> adds the ERMS size check and adopts Linus's FSRM entry layout. REP MOVSB
> replaces the existing jump to memcpy_orig(), with RET remaining in
> ordinary text. ITS therefore selects return handling using the return's
> actual execution address, without aligning replacement storage. Keeping
> the count in RCX also addresses David's request to avoid reloading it on
> the ERMS path.
> 
> v2 -> v3: https://lore.kernel.org/r/20261104222806.1826508-1-usama.arif@linux.dev
> - Split the scalar RCX/RDX register swap into a preparatory patch with no
>   functional change (Kiryl Shutsemau).
> - Use REP MOVSB to replace the jump to memcpy_orig() on FSRM CPUs, keeping
>   RET in ordinary text (Kiryl Shutsemau, Linus Torvalds). Remove the ITS
>   replacement alignment, since no return is copied by alternatives now.
> 
> v1 -> v2: https://lore.kernel.org/r/20261013100442.2658311-1-usama.arif@linux.dev
> - Raise the threshold from 512 to 2048 bytes. REP MOVSB was slower than
>   the scalar loop for some misaligned copies of 512 to 640 bytes.
> - Fold memcpy_orig() into __memcpy(). With FSRM, "rep movsb; RET" now
>   replaces the 32-byte length check (David Laight, Linus Torvalds). In
>   v1, the 13-byte empty FSRM replacement became a jump that FSRM CPUs
>   took on every call (Kiryl Shutsemau).
> - Do the ERMS check after the 32-byte check, so copies below 32 bytes
>   skip it (Kiryl Shutsemau), and keep the count in RCX so REP MOVSB
>   needs no reload (David Laight).
> - Align the FSRM replacement so that its RET keeps the ITS return thunk.
> - Fix the comment that called the return value the source input.
>  
> Usama Arif (2):
>   x86/lib: Keep the scalar memcpy() count in RCX
>   x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs without FSRM
> 
>  arch/x86/lib/memcpy_64.S | 78 +++++++++++++++++++++-------------------
>  1 file changed, 42 insertions(+), 36 deletions(-)

Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
