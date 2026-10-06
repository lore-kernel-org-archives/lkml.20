Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BF43B636A;
	Tue,  6 Oct 2026 21:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791320796; cv=none; b=L7RaM7ysKz/5sjFARRb1PP60ganvlEprGAUIU5Hb34euAqjHB63Z1yGmdosjC+1yt7ejK8//pOp5/TJTdZP7UheHzkYzGVCGINJyZSfqIOrLaCrMniLtBJzhyDVM+s84obi5FalYA3yeSeJqylIcwtlDYACgcTB1tSPzaXd3WNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791320796; c=relaxed/simple;
	bh=vb2y0vis5DuT0Wn6T3ZeB8bN8JFEmioWOi2HfxdECzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJzwASyc1EOv3CweDFwsLA1h6LwWe/hzalD3/mWXfbyDcWQ1XbI0ZU6niLPLJ6BY8AhFEl9IarE/xE4sG5lnJNfDIjZwm/Xe80SsteB5Y7F71hgubpCLyh5jsSat1LVSv+lprPNrGwcauMsBUlNFRnG+A7ptOjHQqqzpH1R0E64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jln5PdPE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jln5PdPE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C981F0089B;
	Tue,  6 Oct 2026 21:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791320795;
	bh=QoJ47HbX8iWpMiUcyNRN/tnSMgRW21g22e81endoZU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jln5PdPE4W9cfCmhbCpJRDmRhTJueT3Dj6Oq7kaNYCKo78XP+BMGLZAZVb2+SZLHm
	 pPDTEphegQWFcjDRRlT2EuhJqFo6yQE+WlJdEJkbPNAQLFSLmcbq4xbbRoqk1Q97LA
	 jP5RtJit4X5WPFU1T4fI+z7478l/Q59rim37rIQA=
Date: Tue, 6 Oct 2026 23:06:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pranav Desai <contact.pranavdesai@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: rtl8723bs: replace uint with explicit
 types in rtw_security.c
Message-ID: <2026100618-march-hazily-f3e7@gregkh>
References: <20261006200751.819332-1-contact.pranavdesai@gmail.com>
 <20261006200751.819332-3-contact.pranavdesai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006200751.819332-3-contact.pranavdesai@gmail.com>

On Wed, Oct 07, 2026 at 01:37:51AM +0530, Pranav Desai wrote:
> The non-standard 'uint' type was being used inconsistently for
> lengths, boolean flags, and computed values.
> 
> Replace 'uint' with explicit types based on their usage:
> - Change 'plen' to u32 in both aes_cipher and aes_decipher.
> - Change 'hdrlen' to u16 in aes_cipher to match struct pkt_attrib.
> - Change 'hdrlen' to u8 in aes_decipher to match struct rx_pkt_attrib.
> - Change 'qc_exists' and 'a4_exists' to bool as they are flags.
> - Change 'frtype' and 'frsubtype' to u8 because they are masked
>   down from 16-bit values and cannot exceed 8-bit values.
> - Change 'payload_remainder' to u8 because it is calculated as
>   (plen % 16), which guarantees a range of 0-15.
> - Change 'payload_index' to u32 because it indexes into the payload,
>   which is bounded by plen (u32).
> - Change 'num_blocks' to u32 since it is derived from 'plen' (u32).
> - Change 'len' and 'ori_len' in rtw_BIP_verify to u32 since they are
>   compute values derived from pattrib->pkt_len.
> - Change generic loop iterators (i, j) to unsigned int.
> - Update helper functions (construct_mic_iv, construct_mic_header1,
>   etc.) to match these new explicit parameter types.

Each one of these should be an individual patch, right?

thanks,

greg k-h
