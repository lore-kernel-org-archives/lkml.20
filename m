Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81EA347500
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787813189; cv=none; b=THnGXUc0GyyAtyGerAEdrc/Cf5hpPFzeHoQMtxEkhBZE1gWWX1JLYMcGXgHCCSaYiqqAda6lb1OAqZTXn3y+9CRg7+6NLDkrV4IiNaGFHitU9LTfVwSImnE9ApskTqca9Ia5tI8nwHFqJxlQf8+vBCbVnuXCEVBazhId1LXNT8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787813189; c=relaxed/simple;
	bh=bvEdIDV321eSADdnQ8ztmfCM2U1c4qMlvzOABS1YmBM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aQx7GiNO8g92WOytcxjYhHhASZzisMtM2Pljbi9C/m2S8m+BC0KOQSNDiOq6KQiJ2xaBQ+vzuQ4XZT1+oY+Kie2F2P5/Fe3csLgByLNj2xAwyJNmykid4paC88uJ5DsmeGLTR75PdNDFq+CmxMQrAGrqQRO0qTn95aDs1Ccj+28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/IQaFtj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/IQaFtj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8091E1F000E9;
	Thu, 27 Aug 2026 06:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787813188;
	bh=4NgYDT5Y9vB6g5RuCxqn4JmXHRINoMhuAr9KCYvyhwU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=K/IQaFtjVdvQ5kPDQq/bh4L54z1EuhXrjmVWdFqH5FeGn6xV+6IahnEd6bFVrYA25
	 TShFcxY3EtdeEuVJGIgkxg12Fkzc+HQT1vcYnUgCcFqsuHeEi64BZiBVkkJ7RiPcUc
	 E6ttpPyl3VtBfRUEajkc8gPhqYw/fAMqBZQSR4NP+fLnCfgm1EgYAW1aBBkVuWLzXo
	 +aLqGt0OSi2eoAdkLWe5R5a5OTrR8AylaTIIuILtB0QpcevDfqzKIkAxHnjrmB+4Xz
	 ojOP2GN4SYaAUpe1u4vt/F27tNLIf9lCwTiX8nVGZFmcZe6dVMC43YgJ+srlm+7y7e
	 /weU2LKoitvvQ==
Message-ID: <a343cdfa-ee3c-4427-97da-bcb9ebfbada0@kernel.org>
Date: Thu, 27 Aug 2026 14:46:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH v3 05/12] f2fs: cache: use meta cache
To: Daeho Jeong <daeho43@gmail.com>
References: <20260825130126.2078627-1-chao@kernel.org>
 <20260825130126.2078627-6-chao@kernel.org>
 <CACOAw_xP6eTBE-p2EaHr=C4TggxViYs+axz+8sW6dPw81qbWNg@mail.gmail.com>
 <ae411946-e035-4933-878d-721566c95093@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ae411946-e035-4933-878d-721566c95093@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/27/26 10:26, Chao Yu wrote:
> On 8/27/26 04:22, Daeho Jeong wrote:>>> +       memcpy(cache_address(tentry), cache_address(sentry), PAGE_SIZE);
>>
>> Use sbi->blocksize or F2FS_BLKSIZE instead?
> 
> Sure, I thought about that before, but considering we have supported
> PAGE_SIZE != sbi->blocksize yet, I didn't touch that.
> 
> If you want, let me change here.
Seems my change is not inconsistent for several places, let me change to
use sbi->blocksize here.

Thanks,
