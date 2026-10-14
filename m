Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91A4262D0B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791953213; cv=none; b=eDG/ov0q2QBDOrd1/O210Ukk0D9tO1CbA2qmGsKmgfoLUZIV2JO00eVl1g+2Q8sB08Mvb9teovAzWRF7MRBRlEtdQs6SU2LgrDNCNogUJr43PhxGPOQjVtQWXlTOcXImXrL07hxM9Txq4E8qxYoBUegPQ+cVmsGD27UjrJAg3LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791953213; c=relaxed/simple;
	bh=ax/hhnguRxE1fjlz/PvFhM8Gpmq37OUwqa8+4w053z0=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=afrgjAwZAVdHah7wa28oYkoHp2k8MyxlpW0U3Mr/cmzUQQxmrJ3HOi0s6VPRVhKM7wbuvsf2Qy2h6zsaV7RQj/VBobw3M1RgmXxHyYPhf3h8qXvxTQrPJdMzoyZqg/btl47w9zuxGlJPXmyS0/UDnn+ultd8VMXonUb4mMzteLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0nVGai/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0nVGai/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541A41F000FF;
	Wed, 14 Oct 2026 04:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791953212;
	bh=kXD2GjwhdrNaOacUYXGcDRg2qS2dsXZ26SXag0ScQEQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=U0nVGai/btox4o7m+rnlgmn87HVj675DswCm7fGvqSQRPIqiUK1EWBlo/5NFDPmlg
	 hyud5NVORz+PcEFB+YdhUZzPi765+CJGcPhCYQxNbwcFHcQcxE2zXW+XmTkJ7mosEQ
	 mSYLMwnTvoWmzwKrtqlQMW8wctTXL0f2E1Zu/R90BIPEU/m18ZuqBPE0SDJPw1bn3N
	 +CSTlHC1fQYHqY7bQaQmtF+s9druCs94JGp91RqyWurngWRzI70zvaTL3ODSAwwB/b
	 gdhwU2/8bbyx19966uvZTjwecZSVSatYk97QZcucfk6RIcVYX71CSv9lIdpgUvJix9
	 P0RaCAXLiEPew==
Message-ID: <c8760418-a4b1-4649-bbac-ca465fd5b73b@kernel.org>
Date: Wed, 14 Oct 2026 12:46:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] f2fs: avoid unnecessary reads in f2fs_update_meta_block()
To: Seongjae Jeong <jsjlee1020@gmail.com>, jaegeuk@kernel.org
References: <20261002064853.37782-1-jsjlee1020@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261002064853.37782-1-jsjlee1020@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/2/26 14:48, Seongjae Jeong wrote:
> When the packed SSA feature is enabled, f2fs_update_meta_block()
> uses f2fs_get_meta_cache_retry(), which reads the target block from
> disk if the cache entry is not uptodate.
> 
> However, f2fs_update_meta_block() overwrites the entire filesystem
> block with memcpy(), so the existing contents are not needed.
> Partial updates to packed SSA blocks are handled separately in
> write_sum_block().
> 
> Use f2fs_grab_meta_cache() unconditionally to avoid reading blocks
> that will be fully overwritten. Also remove the error check, since
> f2fs_grab_meta_cache() retries allocation failures internally and
> does not return an error pointer.
> 
> Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
