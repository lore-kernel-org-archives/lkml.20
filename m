Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DED401A2E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764351; cv=none; b=lWOJaGTrkiik9YSNB2Cv4Tj73HD0Ep+8SXha/PAjY87mNvPhiPJyEasB/xXZJGz2yQySNMIMwkfVSWp2uT+D1bnvG1aVroMOUPM8wrPL2XLumjAhvcPkJZMq3AXi8pdZHrozIUEFS70tHJJQU98vatJeFuN33e4AP0tEvOl12AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764351; c=relaxed/simple;
	bh=9zQHx3Q/e1xaNELKEcjXglfYr3FVtIKioxI69LAasJo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UAfC8+GOU3SVZoxqLtGwNiM99Dxdnyjb4yha06mGbTmmF7MdXDZ6qog4wet6w0DdOPW8QyIcY9EgxlUJ+9F1pn7C3Snh0Fb1Ka1nLYCCR/TVWcxaIY4S22bcH4U2UnQfBeYP2paf1SKoBIU4Jjg+sucyqpZXrJr5o4qKfKZTRYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObPhtTfy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObPhtTfy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12E11F00A3A;
	Mon,  7 Sep 2026 06:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788764350;
	bh=oilWt90wydTedVxkBRKlV4xDKcIB7LoMgooBU5GgjTs=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=ObPhtTfytR0Nvy1rYaB37Es5H/ySzmAcs4G46u3RejRUY3b3BgTIRRxv8d3++bgRl
	 0NG6S7fkvuYbuioMwEMhrVqiJcrtRwU2KlxDPqNgVGpuocIAKUHM1LD1J1QKHsbDbM
	 o10mmWDXIY6p/G+J5ZPD+q5NloRv52UWCOp2xnciOZ9RfFgnkrYKODG1XmgGaNaIPT
	 KlG45zHEizEWwt0nYmI8hAomiB8/jj+L/E73Tsr+qMsNRZly9qko+KqSo5+UpfzAtb
	 kS/boguWqup7lSPDZxDZQOOr+DqctKCAbKStD3f3jcMR2x5e/0I4/B//eXc1ZDWd8i
	 iSuRpVLAjHeAg==
Message-ID: <5d42ad8a-20df-4995-a59d-826caab89d5f@kernel.org>
Date: Mon, 7 Sep 2026 14:59:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH 05/14] f2fs: support large folio writeback
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
References: <12ab1762-e635-42d6-ab0b-e3358e3b32c2@kernel.org>
 <20260907035120.2183257-1-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260907035120.2183257-1-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/7/26 11:51, Nanzhe Zhao wrote:
> On Thu, 27 Aug 2026 19:17:33 +0800, Chao Yu wrote:
>> We should not relocate dec_page_count() above f2fs_in_warm_node_list() to
>> avoid racing bugs.
> 
> Thanks for the review, I'll restore the order like this:
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> @@ f2fs_write_end_bio()
> -		if (f2fs_folio_has_ffs(folio)) {
> -			struct f2fs_folio_state *ffs =
> -				(struct f2fs_folio_state *)folio->private;
> -
> -			finished = atomic_sub_and_test(nr_pages,
> -					&ffs->write_pages_pending);
> -		}
> -
> -		while (nr_pages--)
> -			dec_page_count(sbi, type);
> -
>   		if (f2fs_in_warm_node_list(folio))
>   			f2fs_del_fsync_node_entry(sbi, folio);
> 
> +		if (f2fs_folio_has_ffs(folio)) {
> +			struct f2fs_folio_state *ffs =
> +				(struct f2fs_folio_state *)folio->private;
> +
> +			finished = atomic_sub_and_test(nr_pages,
> +					&ffs->write_pages_pending);
> +		}
> +
> +		while (nr_pages--)
> +			dec_page_count(sbi, type);
> +
>   		/*
>   		 * we should access sbi before folio_end_writeback() to
>   		 * avoid racing w/ kill_f2fs_super()
>   		 */
>   		 ...
>   		if (finished) {
>   			folio_clear_f2fs_gcing(folio);
>   			folio_end_writeback(folio);
>   		}
> 
> Does this look good to you?

It's fine to me.

Thanks,
