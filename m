Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99534E50D1
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410769; cv=none; b=EOix7sg3ggwfTVCbW3q8lNH9c61J/li/NABibh4Z+CfiulIcqbnwgjneXE4ReSLtRViRGFmsCbCTekY8tMTwerEAAhdKOekExFfKBJ1rf1399QPDDe2d49EkJnwB8gTkf3SYVOZ2/D2VDFrCzHc7lQ5uWDTnMiT2h9fg5k5MdZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410769; c=relaxed/simple;
	bh=Uzb4bzoXMKylCRTCeL2lmM6T+/mg0vJPMov9Rmks3qE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qZx3XYIBK0yuPgexgnyIqUme/Lb73fRTKeTQQaxHrlsINtcqjkQW5BdKLaSc1eZN9rKb2uCpYXDdHZm80CX6zKf/KHhwdfcpoKOWmwHrvZkvX3XLrhlkm7fGiza9RM9A/h2Qji58MklvuByWtydmdNL29YAxXmtVgGYE1HRy3dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfIg3BJs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfIg3BJs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374801F000C4;
	Mon, 19 Oct 2026 11:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792410768;
	bh=KpX9ATZMQwAwGmffhR7W9Exlbrhcs96ouUDOfF+OaLU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=VfIg3BJstJ4Y+4iRjf3Ckm0Q9ImVsW9+aR6ZO7TwOxJufIqWjJyEbxMpdZ9IKOKwj
	 WM5Wetzdwjr+VBbgVkUXlULNc9qgm3Pv8ZKXvCnS/Cnze/JNHElb1kRvHTPH5w4UzI
	 iO3+dlOWTna03plOfGp+8SIv63/0ovOYvekEeUX7+ZINaT15wrDua2VorTqkHmGNDT
	 mAQQ75ZfXYcqKjbNaG8gD77RCEGX8Vfq6SjrQ5oIWRLOSa+yzeVL3jnwqMokGfVob4
	 etNy8GEM6MJHftctjOXkBwFUv91gRka1FH59FyadhggbtwF8Brp6J9WX+y6kvOvaLB
	 UfquaeUYmP9LA==
Message-ID: <36220ef3-5b00-4aa1-ad11-60b10857a886@kernel.org>
Date: Mon, 19 Oct 2026 19:52:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Nanzhe Zhao <zhaonanzhe@xiaomi.com>, Juan Yescas <jyescas@google.com>,
 Daeho Jeong <daehojeong@google.com>, Dev Jain <Dev.Jain@arm.com>,
 David Hildenbrand <David.Hildenbrand@arm.com>, linux-kernel@vger.kernel.org,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Pengfei Li <lipengfei28@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v5 10/16] f2fs: support partial uptodate large folio read
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
 <20261014064445.2835813-11-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261014064445.2835813-11-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/26 14:44, Nanzhe Zhao wrote:
> +static void f2fs_truncate_read_extent(struct inode *inode, struct folio *folio,
> +				      pgoff_t offset, block_t block_nr,
> +				      unsigned int *len_blks)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct f2fs_folio_state *ffs;
> +	unsigned int next, end;
> +
> +	if (!f2fs_folio_has_ffs(folio) || *len_blks <= 1)

For newly allocated large folio which doesn't have ffs, we should still update
*len_blks before return?

Thanks,
