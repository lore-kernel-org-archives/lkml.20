Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905689;
	b=LsaipirFNEZcN6XBdlL0ogr7uR07t02b3iBNCKlEwIoJ0JR5rrdoxuERmIwbj79D4Acx
	 rlI7ounGhGDCMV9vvPzOtmX/y0o1rqq2H2AtkWbMq5rkmuzogPO9gYfM5nDO/sTInahlW
	 3rqRPcsM7SsVPWjSCw3zcThkxMSwg2k5oS0GY/07h26B5rLu0EUpBTpAujVYBwPdiudjd
	 xzlFUpN5PfauTZKhikejIhDDUR5Cg0MpIf/It0HmuMyd8E5LFfE3RWbAHq7DYk0lmsHk0
	 wanzwx3VdQnp4ZAc+gyai5v3V5bg5hjhKKbzjnOZJxkQB6+GF33+bkI9Q8Gv6/NjRrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905689;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vxdLiFwyc8Gq60+I63AKVENYnHNqRL/u4NGrOjiglIg=;
	b=ksRmjBybszMf+yekYErucCYI+Tr5fIatie3Tjg+1dm2iW1DYOwZdJG94lT6UKeVYjGAn
	 kYSAk3GOYV5LsrU5ozEmmRz0Uk9ZIFRIM3wR9TlwJI+tfE6kbGPRrU1SK427lNBDq9I2G
	 nJNNe0S7k4V9vaxZP8dRkvE0e4g9pt0Tn7kz7q1yma1zM6CMKGoVjR3IlOeRsFJNGhnCM
	 kRP3rCifwvNfw0FZWh8OhFhb8BDENLAsO3FV6EZ5ces5w02egtQFT72T/nwGM3O/uj+Na
	 x/fqAbhVkfIPJ5mDzgKQ8CLjIZd01vdGFK/T9+L8T2kZ5S134M9OFGL2QjjUtEQe7lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jWcplbQU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E336606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jWcplbQU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053511F000C4;
	Tue, 17 Nov 2026 08:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794905689;
	bh=vxdLiFwyc8Gq60+I63AKVENYnHNqRL/u4NGrOjiglIg=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=jWcplbQUGYXrrjDlyJCjObuv0TgOqBMact6wNqHDMporBfYd84WfVYgSXdUNXbpYQ
	 4JRp1zFFE4cjV1MSU3UcMqlfuqOdyg6Ehco5ddifykcvi/6vcIqxIm/DL+fUOm/Awh
	 LttYHokqH8cZ0XO2kqnZjTqs7d5WNxEqwlX3ayYyaUGVZJOmSydCGUz/EzRcQ94FL7
	 qcX7y2RysznTTfmNvd055slPQLngZ7NC9jowYr+I1dpesUCSjG0c/vLmDHjLU+tcwS
	 72PM1eVR4+yhi3TDDJ9Hd13ZAiNfESeij/Rv5QX+lCoqIseRVd5X1LFFyeY64vJ3R2
	 te6oC8WBBhjng==
Message-ID: <fe0a193f-6225-4e9a-b831-1d7a806d8d55@kernel.org>
Date: Tue, 17 Nov 2026 16:54:46 +0800
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
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2 05/20] f2fs: convert inode dirty page
 counters to dirty block counters
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-6-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-6-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> The per-inode dirty counter is compared against block based thresholds
> such as min_fsync_blocks and BLKS_PER_SEG, and it already holds blocks:
> its helpers take page counts and convert them. Rename it to
> dirty_blocks and make the helpers take block counts, and convert to
> pages where a counter is compared with page based values. The
> conversions are no-ops when the block size equals PAGE_SIZE.
> 
> The callers that account one block for a folio are left as they are,
> which is still correct when the block size equals PAGE_SIZE. Later
> patches convert them.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
