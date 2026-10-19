Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34F34AA1CD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403842; cv=none; b=Tt/HeZTVjnwfW9hFSsX72IU2rs7pDnRpMSrlJUd8U8Zc0Kw2SaMUY6I966MbQZ3WdleUt2kC9lPMCJqWi1xNeQb3ad2Aeigy54L5eILOJSJGQ9bYu4FaCzv3tKU8zU0mJygflf9ZJUT6yDCW9FwABA7CGPalFPtKuuBfU86hSao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403842; c=relaxed/simple;
	bh=sMURdh78wVWeFlVjXLDtuI70RZVf2zlThdd2Nb3bVQE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MeylRTazV6lNxnJHCPbxuMMVO1hmoElsBfvZosfGAvnTa7rDWegYghYT8rr3u+4rNZX87Itkf2UlQun97+2pMTZVbrqoVsXLA6YeVH7CVlivoYEE0tn5D1O/j3+2cQVK0SZ7tSCmaXerrRJzLf0fOEI97wvlSFcYcyX526yNu9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EslnrHiL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EslnrHiL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002241F000C4;
	Mon, 19 Oct 2026 09:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792403841;
	bh=WDSRk5kUjz5pRjBwSkrM+9YyUqVFCpvlTWwJQI2J3jk=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=EslnrHiL7blGfMEwu9R+A4VS7imoLLHHSCBpyDo1py3mmGGP3ZzNc4l5q6K/UiPqg
	 Gpd1V6QoQDhyzRC8XwbiFGaJWQT1sVqNSiCkP6ERa/T3DHYSfEH0Au0dty6xlPPe49
	 pAx2GLo2spdBltZdhmksmONEFf68fZC9B/28KKX9keYFQU/leMUF3huMqg5quEK05+
	 W03PWHUjpzVbg6b04BJiQuMxBUvP3K2WNGfn0Uw8TWQrDhowYj+CgS8oWQM8hU412m
	 1JaI+kOypldeR/geb4P3TAlLVJrWCz4V05U+ZQR2ISMGjryqEWsmlXR4TWBFD/+dNa
	 MXCuZgFaPiokw==
Message-ID: <4118fc18-b95e-4acc-bf0d-f808ba4f4d37@kernel.org>
Date: Mon, 19 Oct 2026 17:57:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, daeho43@gmail.com, daehojeong@google.com,
 sunqiuyang@huawei.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, qiwenjie@xiaomi.com
Subject: Re: [PATCH v4 1/2] f2fs: flush SIT journal during filesystem resize
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org
References: <cover.1792116883.git.qiwenjie@xiaomi.com>
 <7884c62cae6e4b1ad516a9ac351c2604e57d5cc5.1792116883.git.qiwenjie@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <7884c62cae6e4b1ad516a9ac351c2604e57d5cc5.1792116883.git.qiwenjie@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 13:44, Wenjie Qi wrote:
> During a filesystem resize, SBI_IS_RESIZEFS prevents new SIT entries
> from being added to the journal and forces existing entries to the SIT
> area. However, f2fs_flush_sit_entries() returns early when there are no
> new dirty sentries, leaving existing journal entries behind.
> 
> After the main area shrinks, a later checkpoint can access a journal
> entry whose segment number is outside the new geometry and trigger
> f2fs_bug_on().
> 
> Only take the zero-dirty fast path when entries may be written back to
> the journal. This lets resize drain existing entries through
> remove_sits_in_journal() even when there are no new dirty sentries.
> 

Cc: stable@kernel.org

> Fixes: 04f0b2eaa3b3 ("f2fs: ioctl for removing a range from F2FS")
> Reviewed-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
