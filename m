Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA8F5158B1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791918894; cv=none; b=uGi/xzL7KEYi5fnrHbMQvQG6K+ObdyX5KKxJKJcSQ1V7LKoMuUAreqEV+cS86B2zxrlPSEtFOBrxpMuMdVpoFBPBsXkq///OoDulttxSi1ct6+rG/c/ihu1erccCqKmjtv7gO/GLqh9pGhgOx1AeQUaafW6rJnzMtJCPq3TX7NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791918894; c=relaxed/simple;
	bh=iJOww51EVaCIpNYT1EFE6BJr8oIb8xMnWOy3j3QG6XI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S77PE203rXE+RfdyeJ9a+XfqdGiRlikdFZaXfCRLFLgdeUoHep7CU6Ru8jzw6MiujlhjU/tbvDiZGegnue2kW08wLMZ+TR0LDmbDjfXp7O3rshFFAUrf+uYsuHeU7dYVFsHz9Wnjf59rxJ4n4KuPm3LI97DZc+wW4B8Z+1mHYqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=KDXyGKdN; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="KDXyGKdN"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6dd059478dcso2351356eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791918891; x=1792523691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zy/lMkGQtWZpfcBRO2mkj4H1jI0LVdFjC1aISSTQ8OI=;
        b=KDXyGKdN0acMrCl3kmjyXPoHTwy09IKd2ocl+XTO4VCqoL6RiBd4Nk1r5Hv0ZlzojV
         YClSO8bDvf2rWZQkNpl9Y7NvnOcDQaPvuS9LvDZxT4VPPWF5km1RyOi37V7tXA7IdyGT
         wsB1l+yzKArqype6xtw3w0xpfeBipJEjG5Q0IkKB7LY0l8N2ML7GluCIaeds0UE3kV43
         nYHtOnaH8BFdWB8zgb9lpgmsjlj5LaBrOSZaBkxMKNsCIamKXAZwIBdf1l0mSNZWRcSW
         1XenGpgQEQtC0VXnG0K5tzFSJ8mFTykQgVuHne5KujQvpJhQrAfvaqWeEkRoFEXvwDDY
         iDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791918891; x=1792523691;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zy/lMkGQtWZpfcBRO2mkj4H1jI0LVdFjC1aISSTQ8OI=;
        b=mfeTPfDJk570CShJNxWcvMyGUok0nOB6YPuJM4zQ6DfH2RaLQ0RdQAvbF0ijxCZ6Eq
         6cHH0DpI3ISmwK+X38auWzNK6ldN2CpJc/ttUuEjsW/yVqH3KzO6jRulAGt3PuaxtgDw
         U3kdV5lXpF1nD2VJna/LOrZ0HITynERpOlIyeYqhvrjf38iwofYz2kcCEtz0j+nI3kv2
         YNingsD2RbIr3lQPhd3sP3E7zhwaL957KEbRiQm5KVFoSofFOM9lkZQqPhW2l4d3WnZN
         Z667YF1qEBhiXAemzNp0mgsKrGAZat9D4IRxXIxavI58r3GMS6aiwbWQ0MyzeWWZZsK9
         xUCw==
X-Forwarded-Encrypted: i=1; AKwUvBxmq6ZEEfkwwfv6+zjjCtuFCSiGRrytmUP4TGQBkxe/iWjnf7TA/9lCKYxz4nCH84TNu1pEhq52vUeo4C8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEdx6J6sYi9mPCesalKykD+M/9TINNp14RaRfVm+UG0fg2sHMd
	UIwkwfNMFpPOPran45i5YclmqZQ2zxmw00wOGZasxg2qKhOiPc8yH9F8a2bI4tmuhQ0=
X-Gm-Gg: AYBFou1Kh4+iGMq8qCrl0828wiXxNotkglhstDlxLwCmal0YHRuc8cIYiuPi6tWOL+i
	IQ6YMEuimll2CjMESC5nCYKGeZdKQOAINPceBZzJRjYrLPsXVOe7s7Ecgg5HgZeBtPRHDgr1qE+
	Zehs7TeIxLVfh1NdCv4FPBhihP26mkfM0Vw4UATLdXLRXhdNo6/XYafHJXFpVNusXLHoo6JlKkZ
	WtKJRZzeVFpuQoLOeP3UFUIqXwA3Be9JEwyv8AQS45ZWjUcH5cUp7B1MgBN1u6RAwYf0MRyw3ZB
	ijZyR7E8mlKRDHxCr4eH5982NiJCRZ2jQoxZ25QqrMybBw5Kgi6W9Umr8BIRNoceqNEQOUb6OH0
	v34RFrpNCJdLBfit7LK+U95fKakWFTQ4isKCRP16B+mDSOUXD9ADsDqNwPLXHLBxPIt42I3mY7h
	AAckLo0ztN5NrtnFHAcKDgJM1gQ26A9Shi772oR8qi4nyEyGvi7Qxtgmmv/az9WaG3fnhonHzqf
	8GYE2dsf125i0T6FwI/9FZ6moLgp19Q1C6CKvPn+ehgaEgvgMAxSX2BPleVVEAhlgNi
X-Received: by 2002:a05:6820:2215:b0:6f8:51f5:b9b8 with SMTP id 006d021491bc7-6f851f5e037mr4137630eaf.7.1791918891513;
        Tue, 13 Oct 2026 12:14:51 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8367ada5b6fsm6750036a34.21.2026.10.13.12.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 12:14:50 -0700 (PDT)
Message-ID: <4c9528bc-a015-46ee-9464-7d1e3bafa40e@kernel.dk>
Date: Tue, 13 Oct 2026 13:14:49 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Mark Brown <broonie@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <as5jnDJEt1iZZqZk@sirena.org.uk>
 <3ebc7573-59a0-457a-a9ae-104c56010837@kernel.dk>
 <c4818b35-67b9-4413-bd36-c17660fa6a4e@sirena.org.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <c4818b35-67b9-4413-bd36-c17660fa6a4e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 11:20 AM, Mark Brown wrote:
> On Tue, Oct 13, 2026 at 11:07:56AM -0600, Jens Axboe wrote:
>> On 10/13/26 11:00 AM, Mark Brown wrote:
> 
>>> rsrc.c:(.text+0x1a9c): undefined reference to `io_register_dmabuf'
> 
>>> Caused by commit
> 
>>>    4bb7978523289 (io_uring/rsrc: add dmabuf backed registered buffers)
> 
>>> I have used the tree from next-20261012 instead.
> 
>> This is already fixed, which sha did you pull?
> 
> I have 8ba95aa196dc8f3fb50f123f9fd32459d65a49e2.

Yeah that's outdated, e8b704b323f93c6b860b955d9f19c3a8877a163e is the
current sha since about 3h ago. Guess it just missed it.

-- 
Jens Axboe
