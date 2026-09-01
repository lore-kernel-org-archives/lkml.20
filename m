Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC7C3921CE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271679; cv=none; b=iu2P10PJjb3p7l22huS9breEixKQDfCuZTVod0FeRbIh85Mh9kgv4ndgTBtFV5IEezlsyly9qSj/YyE2zNpwSjFYiXf1Yz2WqupadXxCl59rHZm0GMRn98npyV9nKTtB1Uy5LlDBYnLkdGhUgI1lmJmE4h1fAgiNhPbduMx9XFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271679; c=relaxed/simple;
	bh=tSjfrdXLdcUvTU5aEDshkad+nAiG/0UiI4xepps565U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FYhI2n7Zz5KJX8Ud12bjRetiXTbuuxvd/6koisOiyjr0qC2xRlGqTj/Gg0Aln6bb0R1IIUJ/4+iTLEH6YBTYNiKy8HyTwp+wSgCSqv0uqw3efgr2aKGIdcDY2ikddAYZx/fzB/rLUFTqo0lZvqWCdg86sgerGDGn8s2Dc3Gb3Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpXqayWN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpXqayWN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6C51F000E9;
	Tue,  1 Sep 2026 14:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788271677;
	bh=dOFHe9qy1FZ9AF7sT7V/8hJAwDE8aQjo4Sa9CzpQyek=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SpXqayWNt+PO/X6NDg09ZCcJ7lHRUQ/2K46HBjqYSObsNhAQptkcFYcbB6YEvLbFF
	 kNK6Ci3Ls4HI8VXFRbDxa/TL7v4SKF4170GWynJ7a+Idu7Ofz+tioACRnAQlMtKrxX
	 pdEPo6Vikx4ZKHGsXA4h6RcG1vyoDFl6LAwpSdw9ghO/GBDZNNdMQPCNd0SrPCfR2C
	 soWF9BoDtgFC+7RKtccvM4lG2iWvCWV6JdHvVqUtsf+QvN9QJK2vxFlnyI5Anmhfu1
	 WiybX0lRfZSAeoFgTHjDphX/6qLBX9Z6jrgspOGZpPBxDnDSaIp5Fo1DDddItnjOjT
	 0owUZHSaKERJQ==
Message-ID: <8cb96c08-2d1e-459e-b356-c6fd97ef869e@kernel.org>
Date: Tue, 1 Sep 2026 16:07:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/nouveau: Use write-combined maps for coherent
To: webgeek1234@gmail.com
Cc: Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Faith Ekstrand <faith.ekstrand@collabora.com>
References: <20260821-tegra-coherent-wc-v2-1-2b1ddb67bf18@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260821-tegra-coherent-wc-v2-1-2b1ddb67bf18@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/22/26 6:42 AM, Aaron Kling via B4 Relay wrote:
> From: Faith Ekstrand <faith.ekstrand@collabora.com>
> 
> On Tegra devices, uncached maps traslate to device memory, causing
> unaligned accesses by userspace resulting in a SIGBUS. Instead, use
> write-combined maps to ensure proper access.
> 
> This would also affect discrete cards on any Arm device. It was
> determined that discrete cards regardless of cpu arch should use
> write-combined maps for coherent anyways. Thus this change is made for
> all gpu types.
> 
> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
Can you please provide a Fixes: tag? Also, please remember to Cc: stable if necessary.

Thanks,
Danilo
