Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA7A35200D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788488172; cv=none; b=AlYSA9cYGF2liEpimrpc6gDZ4mphLwqr32Pu8FnsRQUG7UMWfvp5VX8wXZGSUtjRqH0uvibrotDiiBQEg0N6yENCeb1TFvO2Eq4x96d5c48LTx+j6DQF9Prm76IeRPVWkyce1QFtzbUsGS7acnXlHy5V2g3Wik5wLOC9V0Eq1eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788488172; c=relaxed/simple;
	bh=X4fv8+aS8W6q3MPEpxrIlEHqhFg7IcuyV/G3xU3ZHTQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=enBYQ8JiO1soLOCeCG9StGj0ygPVMR3pQc+6NcLgpe48hvwQenJk+3WlUBmLNP6eCrv2GAi2CfSEBx1sufDEWpc3IhNXYFCV0fvzHF/56UHh0Z2Q5ebwcaE9nUk8LwJZaIG/IUfCVDeKT+5XQEIaVBh80Sodm3BMDJts4Y2Aur4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QorHhvvi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QorHhvvi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804E61F000E9;
	Fri,  4 Sep 2026 02:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788488170;
	bh=+uOjma6qbQXyrn/wv3REYNOrxR5VeJUIcYohXLMkdqE=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=QorHhvvikgtlSaiiHTTFK3bAbSfAlGeOM/+b24us9fnvQNew/NiWWj40lYuTSThdD
	 N+Y4s0CAjeLaHGk1ZTFNmUIzZ4GN/IoF0pszooMdBYRCJBZz8dJccZU6nC5wVtbYuq
	 4et0Wepe6Vib4FWR8tAjgVIy5FPB90eTZ1FxpeTFjMmh+dwcZoCkLd2xgOXAMiArVZ
	 jEQjbSxCHdxZR3gM9fQcFugrcgMzDIuTlYfgNF8pYQyfWF6r4tbeSfcGgFr+z4sNvB
	 J2C9XfnD/g3TvuqdZ0GKX5aIPg5Q6HbRme4Rujzhoug/7MkhKztlJJhGKn1h0c+6Gx
	 8cVii0hhR+/+g==
Message-ID: <1004a0bc-2321-45dd-aed5-e2d35133cd8f@kernel.org>
Date: Fri, 4 Sep 2026 10:16:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 08/11] f2fs: parameterize sector conversion macros
To: Kelvin Zhang <zhangxp1998@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1788479509.git.zhangxp1998@gmail.com>
 <534c0147c80d739938e90cc9f1c349fc9ae3f6fd.1788479509.git.zhangxp1998@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <534c0147c80d739938e90cc9f1c349fc9ae3f6fd.1788479509.git.zhangxp1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 07:56, Kelvin Zhang wrote:
> Sector-to-block and block-to-sector conversion helpers previously
> assumed a fixed sector count per block derived from 4KB pages.
> 
> Parameterize F2FS_LOG_SECTORS_PER_BLOCK, SECTOR_FROM_BLOCK, and
> SECTOR_TO_BLOCK with struct f2fs_sb_info *sbi, using
> sbi->log_sectors_per_block.
> 
> Update all call sites across metadata I/O, data mapping, discard
> operations, and zoned block device reporting.
> 
> Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
