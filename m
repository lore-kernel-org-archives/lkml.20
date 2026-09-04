Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C2B41D228
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521743; cv=none; b=WU7S5lG5NdzfG6SCRPuHe2LBXM80el8Dyk2kL24kjxzcDwFdgID8LiHgCJi8dIdBpTbMOQahDAM70wYhlIwoBYbbscOve7Mgjtn4HFyCL/J+sz3zblelgC8C/XrbqHx3ff8E1AdF1xbulbJJNyLwcqRVhTVNesFmbMwgR711x5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521743; c=relaxed/simple;
	bh=Fv300f+y5FSwKFcamvZrKqxC/MaizcG3LQJp4R+3//0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VU9vjvEpuhUSEGbeLYgf65HVAdB4sIKI69aNufKUYT158v7fG0KZX3fNtA2QdlfEKOxi2rxwaYx8AiYZ1MW11RLe/POmVkwA++pH0OxyqClkr+cZFMG3e309+PhIJmg6VvM+/Kpb+1qyVacXiTpIsRKp+pfJHccY4oYTUJUI2xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFBRjMo7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFBRjMo7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0891F00A3D;
	Fri,  4 Sep 2026 11:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788521740;
	bh=IcDA25eI9y2B2WpTSeIhx/DUa2mm+Vv6g2Bub0WswK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HFBRjMo7FH0t6qu3NNi5JZq1lN5r3Iur+LHpZVKTr6CGT2pXSVX2hq/YGV1pIsAeV
	 5dd3n5g5/Zz49iuCCac9P4ufMnWZtBxdyTjt4duMYCb5tYIKIId1eJIL+A3E1L/3Y+
	 Uom/bgW31pM7ugrdaBgFvdZPBsZJr3M0sE6EdQrNdZ7grDDL5EQurgKJy8OQw2bPjk
	 PrAKWoLV9hY9extljzBXYTfuccFgrUYwfM12jzFoud1wA0VFjOzntrneD5x0vp5Qe2
	 pnWNs51XSnU/s18atA0ylBZSdDih+zVjSObhw9hyrQmGJ0k5h71q1DGVSlLfHgwubs
	 0qmY3Xr9oGHnA==
Date: Fri, 4 Sep 2026 12:35:35 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH 4/5] mm: fix typo "mergable" in comment
Message-ID: <apqs_3dd0oXh2zUo@gremlin>
References: <20260904104854.25272-1-hemanth.selam@gmail.com>
 <20260904104854.25272-5-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904104854.25272-5-hemanth.selam@gmail.com>

On Fri, Sep 04, 2026 at 04:18:49PM +0530, Hemanth Selam wrote:
> Correct "mergable" to "mergeable", reported by scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Only touches comments, no
> code changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  include/linux/mm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index dd09c438fa23..5c856b78ddc2 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -587,7 +587,7 @@ enum {
>  #define VMA_ACCESS_FLAGS mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT)
>
>  /*
> - * Special vmas that are non-mergable, non-mlock()able.
> + * Special vmas that are non-mergeable, non-mlock()able.
>   */
>
>  #define VMA_SPECIAL_FLAGS mk_vma_flags(VMA_IO_BIT, VMA_DONTEXPAND_BIT, \
> --
> 2.48.1
>

--
Cheers, Lorenzo
