Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0636D316199
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 07:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791012955; cv=none; b=jf56ysnn/X35oKcRXBjPY/hCqKtd6lMQfJlhvLOhXdqIZvIQPA5JSvgp6osCQ70OoqXoXaMX2mHmDuFJq+MOV0lJwKJzyGqiEg2tANCNZxgSghh94MpmXchaNZM4XyYkW3TJrn3IlCp76rV9RB2WY0HbVAJJwCmq4CSoUHIsDgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791012955; c=relaxed/simple;
	bh=aACJsUQID3jzy/T9jOKLnqOKzu2P7VUf3rZ2kobrLwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ScZ2HKD6sAZ+bwg4EFhhnaKwi9IrfGZ7nqMzL5VSDdDUVUYeiaeLoBo4Z0vx4/EWuw8dcogpnMNJ2BTSM8w4TwE1ZVlrlV1Uw5wH84gwjKvPdBW4HbXAPKOQ8iLht0jaiI+YOMoCM3h/vJGLUc/wOu+YLpa4DaDWtbhw+dadGWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuSqPlG2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuSqPlG2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B591F0089B;
	Sat,  3 Oct 2026 07:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791012953;
	bh=JFPOBU+P6ZZb4SCiluBbDmaGyRTWTJXi4hi93ytzIPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OuSqPlG2cg1hKygLYSI8va59uM7xCTKh9l5yIwpsd6kif0nV24Hd0hp75TdCmztzT
	 GInBgJi0hBta0500J9FGWq1yihGbAFQZfoXV9iKh7jD22cRJLtpEcQM1noSEOlGWM4
	 Am+yt5rFwEWgqYVwWQ33gVeVEtpZU4+kycrmBsquHF1S7+1sg1VZcVC33grUmYHyYw
	 TKBiWHKIy9IYuMMABhhMebZF//GA897ynfBTpNmPvnSJLH+O9XCPzjr+T1hhDEXXIX
	 Vyg47z4n19JGz0NetMfF99FACWEyPMmNJxtU+Z04DrOQZzlbDcxcGnuzG96SWBjert
	 Zmtj/Sa2hkD4A==
Date: Sat, 3 Oct 2026 09:35:49 +0200
From: Thorsten Blum <blum@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] powerpc/boot: Drop unused min_t()/max_t() helpers
Message-ID: <asCwVazUjoGp6Bjh@kernel.org>
References: <20260828130622.576064-3-blum@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828130622.576064-3-blum@kernel.org>

On Fri, Aug 28, 2026 at 03:06:22PM +0200, Thorsten Blum wrote:
> Commit c762c69e106f ("powerpc/boot: Add support for XZ compression")
> added min_t() and max_t() to support XZ in the boot wrapper. However,
> since commit 9f121705503a ("lib/xz: replace min_t with min") XZ no
> longer depends on these helpers. Remove them from the boot wrapper.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
> Changes in v2:
> - Mention the commit that removed XZ's dependency on min_t(), fixing the
>   build failure seen with v1
> - v1: https://lore.kernel.org/r/20260525091839.817778-3-thorsten.blum@linux.dev/
> ---
>  arch/powerpc/boot/types.h | 3 ---
>  1 file changed, 3 deletions(-)

Gentle ping?

Thanks,
Thorsten
