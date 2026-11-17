Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924566;
	b=kadcMLdRiCIhrdSRtLPCpfXU2lQgN5QHqadXOXgWjOgnAIoiz++LNS9etWo4dbbIoraH
	 4IGEDhoOgBsCz/gIczm9bJ8nE+SGiW1PSpCVd7H7EgD4m9saZK2jFmSy+pm25c2Cm6iiq
	 N6XRJLugt2tIC3Cj9vPJ5jhhbPQeuewv74bq94EyvUTXRjxSM02UasdtCU1N30CW4EgSe
	 ngdO2mTiU4nJvW9qGu/TIKL1kmVlcZk9+//a1aWkb7lLPGMsVvnuPmjpvsx9Pe+t3HfFz
	 Qp2tUPnhbLwjDd8VHqAjBl3zGEkgRUXJCngluxEij9oZcnK4m7f+b72Dy4bWCL2FT7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924566;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=SoFgxcXLFI5DRM3s4vlmxAtiDyLu72vPJYKzMNWuQhU=;
	b=EcLHkZ4tl+f/LQOXYamco4MX6YFz0UHc9U5w5nzIHBVRwdJP4dxUtf3l/2AZCzEZoD4E
	 ZNm8HdNvOoVIqjGder7w9c8zBQdj8XmPXOZrOSYFaUH/QYNdmfGHDcK3IhtbTXX7J5BCm
	 1NDw8ejUBaykVRSJK3qBlys1Xo/By199xGwX0rH2VEkY5n5jG9GfGAWkCliKwzACemTLt
	 1EJGmBKuJgURam+v0qQgFR82pl8a/mUz/PDPW//PYKkZXGaeNwUcFnxUCc7FmEGQl5UIZ
	 7h2r8AWC48AGFA7YSJXyyErZ4QuXR/4LAUEaJ1+kyQPyXXeSwPjknmfbN3tKpJMplwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Amp/AGl4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD186606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Amp/AGl4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87071F000C7;
	Tue, 17 Nov 2026 14:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924566;
	bh=SoFgxcXLFI5DRM3s4vlmxAtiDyLu72vPJYKzMNWuQhU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Amp/AGl4Ts+6YMeV2WyiFOK231Nm5VwYtzOyOkZYm7FAgXLY4QdgfRnLlDXjS4uE7
	 N5bYD88Tc6/cwU/h/TtuImvZUtD1p7P9nAbBJiNKeJX5zbXDKhtlUbwn2+wkoOIF0/
	 nm7/t4kapPpJRWeW6VoSjfB5iYgOzYt/YM5hWLL89S25CFk3ezdNfrIJDlERZxxNon
	 0q3LHpvAN0e8B/e8Q52GEQR5MTOwGlz9p1wVWXVTgYoK1F3uwQX9Jzz0casBKWiaIs
	 Ea2WBxbd0FVmetNqYfkp62cWe9MRNaRI+uIAgHWYU9bEa614zuWuJLMKMJhYk6JWaG
	 T7HAN1kkBiTTQ==
Message-ID: <57c8caad-31d0-40f7-945b-f53908b811e3@kernel.org>
Date: Tue, 17 Nov 2026 15:09:21 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 3/3] powerpc/ptdump: Show the exec flag of kernel
 mappings on e500
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
References: <cover.1794572365.git.ritesh.list@gmail.com>
 <074831f06e18d1b8cff91e7588aa7985077dd538.1794572365.git.ritesh.list@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <074831f06e18d1b8cff91e7588aa7985077dd538.1794572365.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 13/11/2026 à 13:31, Ritesh Harjani (IBM) a écrit :
> On e500, _PAGE_EXEC is made of two bits, _PAGE_BAP_SX and _PAGE_BAP_UX,
> and a kernel mapping only has _PAGE_BAP_SX (supervisor bit). The flag
> table requires all the bits of the mask to be set to print "X", so
> kernel_page_tables never shows a kernel mapping as executable:
> 
> w/o this patch:
>    0xf1015000-0xf1015fff  0x00000000         4K PTE   r          present  coherent                  accessed
> 
> Print "X" when any of the bits is set the same way it is done for
> _PAGE_READ and _PAGE_WRITE:
> 
> with this patch:
>    0xf1015000-0xf1015fff  0x00000000         4K PTE   r      X   present  coherent                  accessed
> 
> This only changes what is displayed. ptdump_check_wx() uses pte_exec()
> which already tests for either of the bits.
> 
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>



> ---
>   arch/powerpc/mm/ptdump/shared.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/mm/ptdump/shared.c b/arch/powerpc/mm/ptdump/shared.c
> index edc69da19b85..e28a41a8b1ac 100644
> --- a/arch/powerpc/mm/ptdump/shared.c
> +++ b/arch/powerpc/mm/ptdump/shared.c
> @@ -22,9 +22,9 @@ static const struct flag_info flag_array[] = {
>   		.clear	= "w",
>   	}, {
>   		.mask	= _PAGE_EXEC,
> -		.val	= _PAGE_EXEC,
> -		.set	= " X ",
> -		.clear	= "   ",
> +		.val	= 0,
> +		.set	= "   ",
> +		.clear	= " X ",
>   	}, {
>   		.mask	= _PAGE_PRESENT,
>   		.val	= _PAGE_PRESENT,
> --
> 2.39.5
> 

