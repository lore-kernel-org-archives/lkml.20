Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586236;
	b=Wh7wrPKeDfnglxWNcE1yU5iHw4/9G/+8YGyGBQCYAI687Dp+sYLlgOcS9mvaWJmyHQ9T
	 zVK9sTXIWOZ/mj3pW0fJYp2rO0FLNCOKmcUCvJUgMcgmjf31EEICRV5OecGV4MnW1fv9f
	 wem5K8qF5KQDr3qsJYm9gwjbLZNZ7kxglRtEzIJ6NRpgNyGW69tByt3JDez+GwtKXaZH5
	 7JDe6pu0iDm0pqD2CdHWideqPTYoD+b69y1SdiMGlPgrFhdyABMZjENaWqvjy96DaNhvN
	 7yqK3ZPpwBjH8URQ7QmrL9jEmktnBHNEiqPfO6pqLD9PiDZDswJECCISwn8A13QgbSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586236;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gz5AWrOwF+eMYz6dvsxu4Bgg5u11ePYMcl7sZ0k9G5Y=;
	b=YD0/zJgiN5wVXi0nIe4Dd10kXijF85gz4mzPlk7PqCSic+55nlxbcRnTgIN3rzQJkq6o
	 mXrCtunfJEWIMmhUwWUNOyDLBWeLC2eHwLGyjZKiDwrakZYQjB+gVBTB6/S4PBAawJ8Xd
	 mQbhP2J3aSfSRAsT+dCsVz1sqXf0u8XbM4YW2HiIAI/JusOQpZNCcO2VyNU/pRL6w2YS7
	 84r3LN3RR4roU3/i994v4IxN4j7jZIPdZEKFnBhDvnZOxH4B5Vs/o5aBm6bsMGS4T1vo6
	 ApYE46dJ2mDFshC251qTlEEpW+uMVceH/JqPZ3QNxRlqK/Ou9jwXMO2sA/Sw2Aisewg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SsNY7HU0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8E1606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SsNY7HU0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16551F0093A;
	Mon,  2 Nov 2026 02:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793586235;
	bh=gz5AWrOwF+eMYz6dvsxu4Bgg5u11ePYMcl7sZ0k9G5Y=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=SsNY7HU0g6zxYpVGBwA2RrD+kUjJSjedeTfWV27RiqyxDiW2TGOTnc+F7+loO/Cgu
	 keOOTlI3tLPuIVeqU/Q+xUgpYB4DugV4PuVSvYjDErDzxVVJQSw1KbcysRddt0rq6V
	 UVB3uf0Qfu9TLIRN8ZdE1p19ItDYHbt7003PjBAR+cX1PG/RXsF8vFPgjMycD4Webw
	 nw6y9oQlNshWxPBE/oglSb5Z2B+ynuExcAOiqAgCXcozmK62/pi5dm8OQ90B7EP7cN
	 VX1WuJq7iGxSjpSfOq2p6L2ID6rF7vZ2991Beo9KTDu63WS5H52ivmIhq1fwBz28sU
	 xbcToWKGaY8ww==
Message-ID: <abdfe196-e847-4f11-8d1e-b53bc565a078@kernel.org>
Date: Mon, 2 Nov 2026 10:23:52 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] f2fs: report sub-block project quotas in statfs
To: Hungyu Lin <dennylin0707@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261101230552.55034-1-dennylin0707@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261101230552.55034-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 07:05, Hungyu Lin wrote:
> f2fs_statfs_project() converts the selected block quota from bytes to
> filesystem blocks before checking whether a limit is set. A nonzero
> limit smaller than one filesystem block therefore becomes zero and
> skips the project block statistics.
> 
> For example, on a filesystem with 4 KiB blocks, setquota accepts a
> 1 KiB project hard limit, but df on the project-inherit directory
> reports the filesystem-wide capacity and free space instead of zero
> whole blocks. Quota enforcement still rejects a write that requires
> another data block.
> 
> Check the byte limit before converting it to blocks. This distinguishes
> a sub-block limit from an unlimited quota while retaining the existing
> rounding and free-space calculations.
> 

Cc: stable@vger.kernel.org

> Fixes: ddc34e328d06 ("f2fs: introduce f2fs_statfs_project")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
