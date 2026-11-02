Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638956;
	b=I0czWOION9pqy/R8lROHTg1FrIVXuMd/yOegZ9zIYZAEfu400e7k+15aZ+CMSsBmzosT
	 g7YB0CJfA1Si8xszklG8R7RynWYK+KMJ1glj9sQ8FsNm7v03sHNIBa4rZlFjiGa8/7XFj
	 qgYJmrKGf4zZBEGKk0blSn7zVCG5o3rNA7JIYPt6Ohy1EwXr3R2upibseA2zjpH3cLlsP
	 FY2Mb/Grn/wkftIgx/6ap982mLPTR0ixQq9OtrNZ6YX/BUZUvBnCDrmCWmXzOF3UH6nj0
	 wfevSHPWvR0CYp+CXQkZwOgOIlApA/r0yzmeM5D5Io1NnzekSJKP3ABY9DrWSgP9BqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638956;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fChVJAgmC6ioNqkjw3LYzHuFTEgzIJSopv7Pb/P8Fjk=;
	b=YDkNFRhEG2CIO+EGTX4S6r0xUFk6SyNSIsVsijctjuF3BQNX2gvaK5GxFCAF4Zd7qLA5
	 jMjux5qO4Hh/zpQn6VXeRfjOHhJAvngLNntWcYftYp0w/lgt/DcLuOBVVP3AYaeynYka6
	 1jNe+342zGhn37in9y4rIT4hV1rXgkhC6ThWq3XSPskWcIiMqcL4UGKmfGH0p9EFuG42m
	 35uSSheIJYKd5zmUtAHajDSC7EdqFWdxd+eTZ2NgzzjSd6rP3s+5r7rljZUafVTADcc+j
	 P5y6D2eGC7cnyZlH/uk/CWnBBoBHGJ8OxSjSOgBCbbDq7jSr6dVra47sNHvFizLjm7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Rn5s9j9l;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F79606C3D1
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59F79606C3D1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Rn5s9j9l
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67AE416F3;
	Mon,  2 Nov 2026 09:02:31 -0800 (PST)
Received: from [10.57.58.9] (unknown [10.57.58.9])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 679C23F59E;
	Mon,  2 Nov 2026 09:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793638954; bh=EAEGPCUEjp9DZayF0ozcFHCgquqk3FNBZ41Ra9Fk05c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rn5s9j9ls5bKvEVDBXCKJuqjXnnZU6XbwHCxBXXUyo00zD3F0BGCuzcwfA74GX8zR
	 bxDdTRMru51skMIObZ/cJ+dQPCVMXFZ8Qn4nLo/1g3qDrxKlYEEhVroxn+eFVMOgjD
	 ExB9/ip8YgfNgluxtu7nCRRltVHb9CgcNsI3Ylk0=
Message-ID: <b43d7467-e6a2-42db-b6dd-bc58996e9d81@arm.com>
Date: Mon, 2 Nov 2026 17:02:30 +0000
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
Subject: Re: [PATCH v2] drm/panthor: Add more reviewers
To: Liviu Dudau <liviu.dudau@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Akash Goel <akash.goel@arm.com>,
 Karunika Choo <karunika.choo@arm.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>,
 Florent Tomasin <florent.tomasin@arm.com>,
 Daniel Stone <daniels@collabora.com>
References: <20261030144305.666845-1-liviu.dudau@arm.com>
 <20261030144805.667158-1-liviu.dudau@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20261030144805.667158-1-liviu.dudau@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/10/2026 14:48, Liviu Dudau wrote:
> We now have more people that can do reviews and contribute patches
> to Panthor, so add their names to the list.
> 
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>

Acked-by: Steven Price <steven.price@arm.com>

> 
> ---
> v2: Forgot to add Chris Diamand to the list, fixed.
> ---
>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 89ea35a35c680..ef92c462a8381 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2321,6 +2321,10 @@ ARM MALI PANTHOR DRM DRIVER
>  M:	Boris Brezillon <boris.brezillon@collabora.com>
>  M:	Steven Price <steven.price@arm.com>
>  M:	Liviu Dudau <liviu.dudau@arm.com>
> +R:	Akash Goel <akash.goel@arm.com>
> +R:	Karunika Choo <karunika.choo@arm.com>
> +R:	Lukas Zapolskas <lukas.zapolskas@arm.com>
> +R:	Chris Diamand <chris.diamand@arm.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

