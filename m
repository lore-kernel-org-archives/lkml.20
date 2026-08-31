Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662D4361952
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218572; cv=none; b=g2sCJLLvYY+aj+t9zgpyvIZtTGNB0e82F15jotLIG7VdgME72BQexyzrkAaiYw53JAAauPGcRgOPgP3MGp70ekNDBX0pM3QAj0MceHvLtQKPuqZeKVOZPLGwCmDq1R6y2gv1JYeWI7TSkkiZNLF9LFZ3sWG0xVlLe5FWT25JlPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218572; c=relaxed/simple;
	bh=kq1XWTxBrM/pSLTFGGQ4NqX577GZds5EsJ55vjAFX1k=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VRsFkORpEZ+MOfvj/sbaZ3z2xtoGqyRbs8KLirAXRb6opR2qiF8IuTO7lbwufnJWuhTUBOP/eZfMSFNR7pzqAjhDQByvgvq+vYMrEaSBILS4/pT4yd++3ak+ajVWx6wcIYfed4WErZ4cqJlyP+1DujB4Dt8c8xX4jVQUEPTZcNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DlrcnXPj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DlrcnXPj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16721F000E9;
	Mon, 31 Aug 2026 23:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788218571;
	bh=b0crU32oQYq0He/VQq4cZn+2RrawFTTcSZI7lulAOgw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=DlrcnXPjxBRgnRKdrAXyXDxZT99KhqASelhOnznvAClT5n2WSFgOnbGtjc585Zxs+
	 hljNLydLacoDEZjONP+MPd27sZsYF0SNxV3OcJhexqhzgWRpjMJaMqvuy4b71Lt86U
	 g3+YX98mElq/o0YYM/ao6bRwfgdUnsudopbZVRsrGURONa3K/WfMV7ztLOe/27dHND
	 Ot+tu66uRyFj3+yg0srgf0cTlDy/gIoWQ1CICSBChWss+iscObJB+Qu3UCEZGf/++p
	 S6cIr4T6L8sQ+sWj3W3QiTAhKowN73rTSmyGkTVgZbauKW5JFAs5WvbJQGQX9qkqu0
	 w1x51S8mj0lpQ==
Message-ID: <9134210e-8ce6-4b74-bc25-af024aabeb75@kernel.org>
Date: Tue, 1 Sep 2026 07:22:46 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] f2fs: avoid underflow when counting free NIDs
To: Xinping Zhang <zhangxp1998@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <CAH=xXfFVAwQ3r_NdUDtmXhtg6Lw8kDWoNTzGL5oy4mwHMsJLJw@mail.gmail.com>
 <CAH=xXfG2Hzc-kNAPqEUsTJ4hwrQ-gYEnFrXHGxL7qpYpggkLUQ@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAH=xXfG2Hzc-kNAPqEUsTJ4hwrQ-gYEnFrXHGxL7qpYpggkLUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Kelvin,

This patch was wrapped, please resend it as well.

On 8/27/26 05:39, Xinping Zhang wrote:
> __count_free_nids() subtracts the retention threshold before checking
> whether the cached count exceeds it. The operands are unsigned, so a
> smaller cache wraps before the result is assigned to long.
> 
> The PAGE_SIZE-derived threshold happens to make this an unsigned long
> subtraction, whose wrapped result becomes negative when converted to
> long by supported toolchains. Do not rely on operand width or
> unsigned-to-signed conversion. Compare values before subtracting.
> 
> Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
> ---
>   fs/f2fs/shrinker.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> index 4f6bf5926de4..1fd0ee4f89a9 100644
> --- a/fs/f2fs/shrinker.c
> +++ b/fs/f2fs/shrinker.c
> @@ -23,9 +23,10 @@ static unsigned long __count_nat_entries(struct
> f2fs_sb_info *sbi)
> 
>   static unsigned long __count_free_nids(struct f2fs_sb_info *sbi)
>   {
> -	long count = NM_I(sbi)->nid_cnt[FREE_NID] - MAX_FREE_NIDS;
> +	unsigned long count = NM_I(sbi)->nid_cnt[FREE_NID];
> +	unsigned long max = MAX_FREE_NIDS;
> 
> -	return count > 0 ? count : 0;
> +	return count > max ? count - max : 0;
>   }
> 
>   static unsigned long __count_extent_cache(struct f2fs_sb_info *sbi,

