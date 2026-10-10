Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329D52E7F39
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791675875; cv=none; b=aHadKWVgFK/9lcaDEiQjqOo77W+2LfIYrS3Y0piBDcL716WjntS5SXEU7gVVNLVC4Anz8FK+m6nAAFq+5I1vFod1d6ctIn6IaJNIAe1fGWW5yc1izfJ4gnX8yDz43KYyMZL6qCS4bKV0lOJ3t0YDtmBj3JQrHTXgsTz7Ubwfn08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791675875; c=relaxed/simple;
	bh=RejeptxEW9aw4nD40diWLzDMFh9O0A8MjN90Z/aWzPw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UDH5rH7HWcwstN76AIIf7K711jRhm6Akw37Dd9a33gHGefjKZpc4YOswxqbQpaz5J0bToYI9whqKkMHdcWGn/JEC7WNcz5u9Kw8Phz46OGL/cSjTAdWqRsHl1lkvupVROOAnm5QyU9ZniyrF3dj5gKvtU1nMbvHh15xI9YT8u8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXLQ/Jp8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXLQ/Jp8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E181F000FF;
	Sat, 10 Oct 2026 23:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791675873;
	bh=eeRFFWYz3sJFveuLFv6B8qZclKQNU1SgYyPsR1Nr5ro=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=IXLQ/Jp8w9X6Z47qQisiQ7S4MYxB/bdFsz5yyg3fAAX+aCMKlqucqz8lkb3+bJVv1
	 HTaijcfrWyaj8fv5twf60mcdnJpM3wOVybjcBz6SpnCWq7rRDCltSRrd7hzy4zwJ2M
	 41aQ5xZUfdB8jA+L/jqqk3yPkHiCDWh9SOhrMzsbFqhrVEthIaDkxAWGG6iTJWdlC8
	 Wtt54yB4oo94OHtd26q/aNiZZc9iMAf1vxEQ1w3K9j2vb6HpERzckWfrzNMnAS1yMU
	 /hYUFO6Cf14zj1Sdk1LwSgaEHD6lqMyLdJl616Hk4N/zF5+guJHJk7RYwXM/hsB/QY
	 kumnqpPi9szpw==
Message-ID: <0b7f00ae-29ca-48e4-83f8-eec0213e3535@kernel.org>
Date: Sun, 11 Oct 2026 07:44:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: erofs: add dev branch to git tree entry
To: xiang@kernel.org
References: <20261010070623.1766952-1-chao@kernel.org>
 <asqt-vM6LOPyqz_p@XiangdeMacBook-Pro.local>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <asqt-vM6LOPyqz_p@XiangdeMacBook-Pro.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/26 05:28, Gao Xiang wrote:
> On Sat, Oct 10, 2026 at 03:06:23PM +0800, Chao Yu wrote:
>> From: Chao Yu <chao@kernel.org>
>>
>> The EROFS entry lists the git tree without a branch, so tools that
>> derive a baseline from MAINTAINERS, e.g. sashiko, fall back to the
>> remote HEAD, which points to master. master only moves at -rc1, so
>> series developed against the dev branch fail to apply there.
>>
>> Name the dev branch explicitly, where erofs patches are queued.
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> Acked-by: Gao Xiang <xiang@kernel.org>
> 
> 
> Hi Chao,
> 
> BTW, could we request sashiko folks adding erofs mailing list
> to their review list as well?
> 
> Since some patch could not Cc LKML or fsdevel, but I guess
> we need them to be reviewed by sashiko too.

Xiang,

Agreed, let me submit a patch for erofs.

Note that by default it's mute (it won't reply review comment back to anyone), so
author or reviewer needs to check comments from sashiko in its UI (https://sashiko.dev/),
but we can change the config if we want to receive review email from sashiko.

Thanks,

> 
> Thanks,
> Gao Xiang

