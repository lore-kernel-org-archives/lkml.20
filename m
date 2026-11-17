Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905617;
	b=hQN9uwjRDj/IqZPCnDdGnp4zQA1QQOcMd6AwcQ2WjZlsoiEkhW3Ard0ZKWL5irqwFtXa
	 KAqOLApvfwlMiOqDhxU3FRdhYoHd9rvFPzuoJ/LXP500XXGrhHCk7ffcSZWMU8RVYKqKx
	 MR9xbZnDmd9hgFdCDwQcrG9ipMstsMoLGjSd9M29wMMe+zba49ljt1HdaGKSHgj+WFajk
	 nnrDpFD3m/eKZ6nZCVCzq49fL1hKq/YzngMQP2IW3mlWbplu+ZtF5K6U8R/T1/9G07QTI
	 yBtxAG5K+JSX3GwlKLydFqeCX5gtitWC08HWgZCNcykCuQlDzDTYdVqsNmEuPszcePw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905617;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MftBNpktnSoHTLOmINdSqknygeCyoEnFPuRaamj6H9s=;
	b=iMEOke+NitHEMsOkHDzwYotmVq7IZJaTdCLQbJxrqm6yhpFa4Iak5VgTYsk/j0t7/Te+
	 b/oVp34tg+IhGODvohZ2kRAAA4eX2AuTdriKnkqV6qD+JJ3yrSdgcDVH0ulwl0c4cQwoX
	 U8ANiAHE2HzDTTBZ5smamA53ihaBsAVmvIfrkHfqKLKueoJIz+d34kEdlLMiqa4v4v+xD
	 tLOAo1e7XtFGFb+PuEgnIMc25ie88TGzXYn1a3OY+D9d8qF3p8NPwSlJ50w2HjyWVTSo+
	 dhDkRzVpZv+Sa2hopZT7Cv2skd95pJtTl+Uc4psyYayt4wStBrUTbMXO8OGGovmuOhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=es9T6PVy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8694D606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=es9T6PVy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4546B1F000C4;
	Tue, 17 Nov 2026 08:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794905617;
	bh=MftBNpktnSoHTLOmINdSqknygeCyoEnFPuRaamj6H9s=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=es9T6PVyNsMXDbdKe5FRNjGteCT4yL3FV1PWNol64kqfvd0ndnTIn4z82MSOeklP5
	 xackAc4xEhKgvmC6Dk93GDbCX05IiPntQgHhfX+Ou/ddEo4a4s11k8GSl6qnfJE7+K
	 9FvS2oqY0UGx6TD5I+VggDMhQfp8xw3PawjnTe+7qp97qG/GauGaIzxlByVXBfaDZb
	 vdqQBIAO6HsDxQy8ier0QnudxUWKA/HQFgSYi9Yhga/XBwj4WCJ3bFyZEeXhPHhyYJ
	 VrHec/UW70UwMqw2J2FuMTgYrjH8YS/l8KNw7U3gzEYsuJaCKM0Je1DTDkZxyE7CXo
	 ynrkl2IRed/uw==
Message-ID: <98904a3a-4a34-4e87-8e17-df1a5d385c35@kernel.org>
Date: Tue, 17 Nov 2026 16:53:34 +0800
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
Subject: Re: [f2fs-dev] [PATCH v2 01/20] f2fs: use block-based index and size
 calculations in more paths
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-2-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-2-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Several paths still convert between file offsets and block indices with
> PAGE_SHIFT or PAGE_SIZE, assuming that a page holds exactly one
> filesystem block. Use the F2FS_BLK_* helpers there so that they stay
> correct when the block size is smaller than PAGE_SIZE.
> 
> No functional change when the block size equals PAGE_SIZE, except on
> 32-bit architectures: __complete_revoke_list() now computes the
> truncation offset and __clone_blkaddrs() the new i_size in 64 bits, so
> that they no longer overflow beyond 4GB.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
