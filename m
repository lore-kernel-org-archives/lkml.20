Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA1B42F70D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633952; cv=none; b=NJK+RlY5TaCopDAlmmUvCtEv0aW4OIhxD/UXgRwxzVoXjMhVo1Jwa4FZnqEj5j4fkBIHA+f4r/GjdKOMF/tuc4jdWJqMpDjyyvXtf3Oro/zZcl0KwYGD+qJbLfNS8URJOUUEw1T/hcLzc30X9LTZR7JpjlSRVXZqPDGnhA5XyC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633952; c=relaxed/simple;
	bh=65AShQ5ldFApGIBmNLQQIsomvdAPPliVgNAnZ4Crszw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=f+4EQplxvemkPyTl3AOCLc9IN6aVu2+B26ZxSDG85P3Q1KJhi7nqJCelTUF3R4CgJXZeOiBlayKdmHfoRopW314iz+S69rdQRiMiRBwxGW39wHekeBMG76LayX3Wbw4rbVDBYNv2GF0Rgpg5DwXmuoAK5bNTNIfIDUnLo3EbDSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+qT4kPc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+qT4kPc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9EB41F00893;
	Thu, 17 Sep 2026 08:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633941;
	bh=05pJoln1a10A1DllC3Ah/Keu8JtQ4zxJ0Ujs73gNB+Q=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=J+qT4kPcBENvVcB2efTiKikJh+McCp2rQZ0mT7G0jw5WqbN+k2QS+sy9q9m0EJAnL
	 7/UAxqX0CJO/4jZFhayHWAMLv+buTqDztCazoftPbVg0+EhLXHMYe9Oel4d7ohPHT2
	 LkzzNsY8DyoHBkoxfSlUFMOObomLHlbhpNykwJ82Jf2mr6lWWrQyjBDzZ+X39J0ExM
	 VwlzJFjSYz6RTzUR5R4VZFK2f5lcXXUC37WHk04yX4Np6s7DX0J2PW8/ySoUiclgAW
	 X1uLaq9SjVr/wOaT7vqe5zjoCwG6n6LZtRWql4zZZMw6ilHPdsbCBwfG0XkZxfh9Ov
	 tXtGCQ6ajSrMQ==
Message-ID: <d189820a-151e-454c-a04a-e9d3217c13d5@kernel.org>
Date: Thu, 17 Sep 2026 16:32:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Juan Yescas <jyescas@google.com>, Dev Jain <Dev.Jain@arm.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Pengfei Li <lipengfei28@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v2 10/14] f2fs: handle partial truncate of large folio
 dirty subpages
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com>
 <20260915041909.2903887-11-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260915041909.2903887-11-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/26 12:19, Nanzhe Zhao wrote:
> @@ -3545,6 +3573,14 @@ static int f2fs_write_single_data_folio(struct folio *folio, int *submitted,
>  
>  		fio.old_blkaddr = dn.data_blkaddr;
>  
> +		/* This page is already truncated */
> +		if (fio.old_blkaddr == NULL_ADDR) {
> +			ffs_clear_subrange_uptodate(folio,
> +					i << PAGE_SHIFT, PAGE_SIZE);

(unsigned long long)i << PAGE_SHIFT

Thanks,
