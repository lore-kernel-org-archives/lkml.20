Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F153806DD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272095; cv=none; b=NXvetrVwLNv+1k7ZgidCblmW9jeMONTtQDif0u5+Yu5PDh0DWzeUHTd58URDjOS+Qh6du1vSSchQDQ2fkt+kURzfijf/RD1cv2fqmwreZNF+EirU2d9rr3pixy/izl71WXx8CcQ8onRMl8zGGOZ2WBuhHI5VrrnHnukDZxfG+es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272095; c=relaxed/simple;
	bh=mGorVDEsqZ6CDH0m9kPjvMVydzcXHoJYz112Cns8slE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DigRnGtJY4xuElsOi/8r/9noLk2tOWraDy9PP5VDarmhaF4/VoTFIq4e5qJIE9Z6n8Lmcm/GaVu4IR5NXtqb4u2eLbpJX7pmgzzn0YsiY4EbR8EjzzkTUp5w7oFVzbScmF2JPH31UnIKmkTd4CeGI+c/PW1bAQo3luWXQ/pCsGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hg2YUaCA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hg2YUaCA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB54A1F000E9;
	Tue,  1 Sep 2026 14:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788272093;
	bh=4Gb3WPV9LaelPCjepC04UpYbhG+UktuLZ6/ZSgNr05M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hg2YUaCA1Q0xDASG4x9lRNt+MsEywtRuU0O5mM/znE982OmDNT9hp6IdPFQ0OHe1b
	 J+F+xmDHSV6O55BRVyhfe7iG9H4u+fSr9inrD/j1FTwRRRJ1Cod5cnpHT6Z2PRMWRo
	 WZA56ZlYvlRa0ro4tcRCBIObhZVSYa4+TLBzV6GygyXWd2ZbZZ/9H/h5sN/5VaTuuQ
	 2av5PO5yUHg6Iz2yVbzr0CD7E5N68MTW35+722SM7OjpYDPaXnFHUMT22byEEzeSlq
	 dPOBFldXrH5/WUnTWB84WM1op9zUBb8YUxaEURqZEelADzI55X0Vtcpun7GoHofMKz
	 30LmAfCwNFFig==
Message-ID: <de71308a-52a9-4e3f-be35-3e1951e34a99@kernel.org>
Date: Tue, 1 Sep 2026 16:14:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmpressure: remove window size TODO
Content-Language: en-US
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260831-remove-vmpressure-todo-v1-1-498515e59cdf@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 xsFNBFZdmxYBEADsw/SiUSjB0dM+vSh95UkgcHjzEVBlby/Fg+g42O7LAEkCYXi/vvq31JTB
 KxRWDHX0R2tgpFDXHnzZcQywawu8eSq0LxzxFNYMvtB7sV1pxYwej2qx9B75qW2plBs+7+YB
 87tMFA+u+L4Z5xAzIimfLD5EKC56kJ1CsXlM8S/LHcmdD9Ctkn3trYDNnat0eoAcfPIP2OZ+
 9oe9IF/R28zmh0ifLXyJQQz5ofdj4bPf8ecEW0rhcqHfTD8k4yK0xxt3xW+6Exqp9n9bydiy
 tcSAw/TahjW6yrA+6JhSBv1v2tIm+itQc073zjSX8OFL51qQVzRFr7H2UQG33lw2QrvHRXqD
 Ot7ViKam7v0Ho9wEWiQOOZlHItOOXFphWb2yq3nzrKe45oWoSgkxKb97MVsQ+q2SYjJRBBH4
 8qKhphADYxkIP6yut/eaj9ImvRUZZRi0DTc8xfnvHGTjKbJzC2xpFcY0DQbZzuwsIZ8OPJCc
 LM4S7mT25NE5kUTG/TKQCk922vRdGVMoLA7dIQrgXnRXtyT61sg8PG4wcfOnuWf8577aXP1x
 6mzw3/jh3F+oSBHb/GcLC7mvWreJifUL2gEdssGfXhGWBo6zLS3qhgtwjay0Jl+kza1lo+Cv
 BB2T79D4WGdDuVa4eOrQ02TxqGN7G0Biz5ZLRSFzQSQwLn8fbwARAQABzSNWbGFzdGltaWwg
 QmFia2EgPHZiYWJrYUBrZXJuZWwub3JnPsLBsAQTAQoAWhYhBKlA1DSZLC6OmRA9UCJPp+fM
 gqZkBQJqFFy6GxSAAAAAAAQADm1hbnUyLDIuNSsxLjEyLDIsMgIbAwUJGtCBUAULCQgHAwUV
 CgkICwUWAgMBAAIeBQIXgAAKCRAiT6fnzIKmZJIUEADFx/tREzUImHrEwVHeSvDFmA7tJysI
 UVrlvrM09E7GIuzphzv7jYmo8n3ANpCczLEVr4G0syYQdTigaZgv3+FQDIIzhKih1IHhu1Ei
 XHlywNWKnQxxQEUNi5Mwx43wQz5XVw9F1A7gtKBKNtfogO511hAbrzagrYajyQacEJ/+sfhZ
 9Da8ltHIXD8pcYaHUfQgEusCgmEd9+KrUwrTbckFKmYq5chuE6yJ4J0EmWknL096jIE6CnzF
 FRslQ3B1UKDjxVsm1ZHfir5NeWszLkTvGFsddFaWTgh8UycESG6VQzKXjjewXu2pG7YQYRpj
 QKm1W5X2TkwWkXRBZTmfmbhxIUMh3+zf5wQ463rSmDN/8v81tdqBtAW6rH/kzg1GvkaTHXn0
 507yEHFzBksk2viAuIxxr7km8+/KARYLIdGtx30EG8cKzAUZOK6WqxtNCsXUJNrVE8CWrCaD
 icoNu7Fs1c5hmPHdSTnU48ce67449DdnO4neLSNhRiGlMHJgfJUmgrxu/hcYeOZ3haWmEQ2w
 uW1Mh01OHi8QZHCEyAbABrPs9GUgccc/4eYXX9hIgxfSkYzn8f+8NuIFPWl/0uTvjgqU29FQ
 SbzOLxHq9439Ox40G5mS5eZXRGxITYR+6TXvRGI6P/264jvflnr/pDGUttaikU+0W+1uxgKH
 cmYbEc7ATQRbGTU1AQgAn0H6UrFiWcovkh6EXVcl+SeqyO6JHOPm+e9Wu0Vw+VIUvXZVUVVQ
 La1PQDUi6j00ChlcR66g9/V0sPIcSutacPKfdKYOBvzd4rlhL8rfrdEsQw5ApZxrA8kYZVMh
 FmBRKAa6wos25moTlMKpCWzTH84+WO5+ziCTsTUZASAToz3RdunTD+vQcHj0GqNTPAHK63sf
 bAB2I0BslZkXkY1RLb/YhuA6E7JyEd2pilZOrIuBGl/5q2qSakgnAVFWFBR/DO27JuAksYnq
 +aH8vI0xGvwn75KqSk4UzAkDzWSmO4ZHuahKtQgZNsMYV+PGayRBX9b9zbldzopoLBdqHc4n
 jQARAQABwsF8BBgBCgAmAhsMFiEEqUDUNJksLo6ZED1QIk+n58yCpmQFAmfIHFQFCRYU6J8A
 CgkQIk+n58yCpmS2PA//bqN1LfcotmArgElsa+0EGZSQlYgK48pm8WAeTXTngudP9IJ4SuKY
 HR5RNjHcBeqN+Me0zxRqYzRb8nGanHEkDyf4Im8DQM8d6vbyU+FcPmG4skud4kgS1zMHnlVd
 SXfSIwKC/hKgdHG8aBV7545Lz9X6Iohea+94wneD0aw/hqF+QWewGZhWJriWAZtvEkzNjQOi
 4U9F/trLten/x7bpphDSnDMKJtITbtzATT1Dq7o7VpIUK1nCTQALMuMjKCdi8OdU/+V+R3O4
 0PXWvX8qrvqYapVbZ+9KqT74FsuB0Ya9uXwgBF2Q6cRuETZk5vqaqKxzqoQZCO8AOz/58j6O
 2RHNy/mZEN+7tJ5Tsq42zVJ4jxsT8b9YplavCMsnBgDeRWhcbYhCyttoL7nYISyWg4kQYZ/P
 wIV3OuNv2f8iKYsxNsRuClOAF82+gvqOy1/1pprFjy8uo2pkoOrb63aOP3vO5VHnRKgra6dq
 NcaZ+c6J4H+nEJGi2SkHAUJz5oBzuThvPudLvPA/SK8sKoM01IRxSihev/S/5WLazXB1PGem
 OCbvzC1IjWJJraxiDJ5IygokapUa2RP7+WBR22skQ3SSl6G107QgWKSyTOGWEaRmV53vxQLV
 jXuCmzSSasTL60zq5yGrT4/DYQVSNEUiUbG4pYekxJujNeEDkUlky0Y=
In-Reply-To: <20260831-remove-vmpressure-todo-v1-1-498515e59cdf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/31/26 15:42, Lorenzo Stoakes (ARM) wrote:
> There has been a steady stream of patches that have been submitted by
> newcomers to core mm 'fixing' this TODO, with all but the original having
> very likely been generated by LLMs.
> 
> It appears that TODOs to LLMs are like red rags to a bull.
> 
> In addition, TODOs in code often bitrot and are distracting - those who
> understand the code know what could be improved in future.
> 
> Therefore remove the TODO.
> 
> The work required to actually fix this TODO requires somebody who both has
> understanding of the code and significant real-world data to back their
> changes.
> 
> Such a person doesn't require a TODO prompt to implement this change, so
> nothing of value is being lost here.
> 
> Link: https://lore.kernel.org/all/20260831130316.448-1-tahasezer.is@gmail.com/
> Link: https://lore.kernel.org/linux-mm/20260724054305.516126-1-cui.tao@linux.dev/
> Link: https://lore.kernel.org/linux-mm/20260715143646.15828-1-gaikwad.dcg@gmail.com/
> Link: https://lore.kernel.org/all/20260227221555.29969-1-mcq@disroot.org/
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

> ---
>  mm/vmpressure.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/mm/vmpressure.c b/mm/vmpressure.c
> index 9629240d77ad..3de99fef3928 100644
> --- a/mm/vmpressure.c
> +++ b/mm/vmpressure.c
> @@ -30,9 +30,6 @@
>   *
>   * As the vmscan reclaimer logic works with chunks which are multiple of
>   * SWAP_CLUSTER_MAX, it makes sense to use it for the window size as well.
> - *
> - * TODO: Make the window size depend on machine size, as we do for vmstat
> - * thresholds. Currently we set it to 512 pages (2MB for 4KB pages).
>   */
>  const unsigned long vmpressure_win = SWAP_CLUSTER_MAX * 16;
>  
> 
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260831-remove-vmpressure-todo-2d764f42059a
> 
> Cheers,

