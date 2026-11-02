Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608577;
	b=ONVJX3KLAAgPzvCuWg/OQ0trckdE68GLT8GHB977JKjSPFKxxsaKYilCLtINI0cbFG/w
	 s8UpbvEEDmFjrpBbXIYZ3N/QQOVUMQZxKgr/6yifKipFWh/bPoqs9TjHWDQSsgJ7tGXfQ
	 aMImQUPtTGddYtPgDE+Y5Sqa3qxrYgaMlBeck1wzYyV7abw2PtwyPuzbkZRdEyvUq/Yog
	 6RZk6DBhyhJ/zNgQL0I0tPDRvL6zKmFIn2mzutsBjyycTtSnyg1SfsbsWko99NQ/MkH5M
	 0Kx9ITnanthDCh8HJYk1bffxL7TCEovwyf2nVajdjdiYBhZumgO4XZVU0fdarMmU1Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608577;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=71To1F+Ha52gfiOXVzuzWJ0D7FrFND/yLtAE+8lZwmk=;
	b=211Enf5Q36IIgGfGygIrrss4++jimbob33MMu4lCuZOAvTXPI6l9UEOf4SgFYr/mwBaq
	 lRc9QZKiofLkI1lsFYeTEB6lS9W/reWXyoJ5Da1PNqd4+Ly4kyrtU1o5acg0Qz5cOYLuM
	 YqgK6MMtBBhW91bluklQj+OPYRZHYZ5HZxW/z0WkSwO5JYrcICjuAX7J1auLDz9DcTBwX
	 aXFu0YhN3C9+E99/NZVtayhvDnfS7S0yt3BT39kQkxmisUnkjY0AR5UO9UDkzjMojY88a
	 TfqKE8+HX0wBuEEDlil6/EdRTBtX6d3WvqLZV1hSger9X3VcXRY9jrakTNuycGkuReA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hN2KP4pN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E914B606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hN2KP4pN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698601F00919;
	Mon,  2 Nov 2026 08:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793608576;
	bh=71To1F+Ha52gfiOXVzuzWJ0D7FrFND/yLtAE+8lZwmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hN2KP4pNFL2p90V8j3d/hLfQeX2QZzb9dkQfAat0qfzSTf5GYlqtJ1PzjKS3P2zkJ
	 RrjjMqw+iYfqFbInhZ3OrlHp5yEbrrPc+3VPUCVPVwd4Y77RXJWajAGWelPr76iq/X
	 j1acplbF3c8IQ5DGD30RFStFv7VTdoX+KHqeGgwbXJYgXaEen+icaidGQPc/upEpxg
	 QzHtvAqKv5xIeq01p4QdTNiIBlicUcI9sypwrt2z3DX8n04rS9oYy77b8b1NTVwBW+
	 H3n7kH9vKsu9goozvQPdw88H+cmY5p22CzQdSDTZ+7JEX2eFYcQr2pCjOPcyuiyy/J
	 iaAlGW95UJnlA==
Date: Mon, 2 Nov 2026 10:36:09 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Greg Thelen <gthelen@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Evangelos Petrongonas <epetron@amazon.de>,
	kexec@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kho: check fdt_phys in is_kho_boot()
Message-ID: <auhLedAuD32WNcXW@kernel.org>
References: <20261023054518.3258350-1-gthelen@google.com>
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
In-Reply-To: <20261023054518.3258350-1-gthelen@google.com>

Hi,

On Thu, Oct 22, 2026 at 10:45:18PM -0700, Greg Thelen wrote:
> During arm64 setup_arch(), efi_init() -> reserve_regions() calls
> is_kho_boot() before arm64_memblock_init() initializes memstart_addr.
> At this point memstart_addr still holds its initial sentinel value (-1).
> 
> When booting via kexec with KHO enabled, kho_populate() sets
> kho_in.fdt_phys from the /chosen FDT node. Calling is_kho_boot() ->
> kho_get_fdt() invokes phys_to_virt(kho_in.fdt_phys), which evaluates
> PHYS_OFFSET and triggers VM_BUG_ON(memstart_addr & 1) on arm64 kernels
> built with CONFIG_DEBUG_VM=y:

Can't see the forest for the trees ;-)

Can you please translate the gist of the issue from LLMish to English?
 
>   kernel BUG at ./arch/arm64/include/asm/memory.h:377!
>   Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
>   Call trace:
>    is_kho_boot+0x2c/0x38 (P)
>    efi_init+0x94/0xf8
>    setup_arch+0xf0/0x240
>    start_kernel+0x84/0x490
>    __primary_switched+0x88/0x98
> 
> Check kho_in.fdt_phys directly in is_kho_boot() instead of calling
> kho_get_fdt() so that early boot callers do not invoke phys_to_virt()
> before the linear map offset is initialized.
> 
> Fixes: d6d511639185 ("kexec: introduce is_kho_boot()")
> Assisted-by: Gemini:gemini-3.8-flash
> Signed-off-by: Greg Thelen <gthelen@google.com>
> ---
>  kernel/liveupdate/kexec_handover.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 7c4d86daf86d..d81baa38497f 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -1630,7 +1630,7 @@ EXPORT_SYMBOL_GPL(kho_restore_free);
>   */
>  bool is_kho_boot(void)
>  {
> -	return !!kho_get_fdt();
> +	return !!kho_in.fdt_phys;
>  }
>  EXPORT_SYMBOL_GPL(is_kho_boot);
>  
> -- 
> 2.56.0.257.gf7497c7d27-goog
> 

-- 
Sincerely yours,
Mike.
