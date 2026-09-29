Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE73502555
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687681; cv=none; b=Uv0FUsdKa8YR1QV+TG4CGHE4Tn8SV8/Kn3bc3EdoZ8+kegOD8BoMqKzBCg9+hMVhdMBePOjBGqN1EKmRhGyb78wmuKr7IKtoaMageyxOaAk5LXoI5rJJcvqZmhqalP2qq9Qr182KRpj8udUNQ3fEqmiye9O9MB2Rlm1wMbLyQCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687681; c=relaxed/simple;
	bh=GMkLmLEAVOKIZ81rd1iyOVelXg229db7GjKGa4RVqsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=JiSSUuKLucQiidW1F2MVt17O2ecCXIZofsfv/qb/GG2mdNT/oyWe4BTD98XhJCLAqI3/DUU4JGsxGcIHbs/t9zUvM2A9pk9uqXnRZxbFnSobViAfforYmtd6/llHt6CMiFGDtExegOHcROXBPTn8Mm55sSHWSmNpYD+ztxO53Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ca4pAF8w; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ca4pAF8w"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=+PzPixPMfGnAN1Vr+DWP58OHM5Slyx3vzvTQbomr2Z8=; b=ca4pAF8wQtzbyBnDZlusRuwDAV
	PjKYI9kPwsimN508jR0oG1j+BvwCrSWGZEIa8ASJyMr0jV/RxBuJyHsAmiCJtl0soUCLPCv/SJXmp
	8WseTchIFF869T5m4YQ8ZUPl50tw8urCBkdrNKjVl0ubAFlab60uHbcdF59hNbcVsaPoXQQ5GznEq
	boqT3vP+4bXYYrrB/crWfsnVFMogJwxBVthagwGidvXXolW25S9b2xD0+KVlqK4ZdaygcMElklNOe
	zBAHZrRJW++gFv2JgrxOKYXHOhyC80ZpNIkzkZ/G3128inFLDrspOTWcY5RiWSwE1W7z8JtVPnNEv
	wwaAO7+w==;
Received: from [177.172.123.214] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xBXfA-008vy5-8D; Tue, 29 Sep 2026 15:14:28 +0200
Message-ID: <4788fe15-b260-47b2-8924-606c9074f2af@igalia.com>
Date: Tue, 29 Sep 2026 10:14:27 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] futex: Handle the correct robust list at
 compat_exit_robust_list()
To: Thomas Gleixner <tglx@kernel.org>
References: <20260922005407.522060-1-andrealmeid@igalia.com>
 <87zex0ii0t.ffs@fw13>
Content-Language: en-US
Cc: dave@stgolabs.net, dvhart@infradead.org, linux-kernel@vger.kernel.org,
 mingo@redhat.com, kernel-dev@igalia.com, peterz@infradead.org
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <87zex0ii0t.ffs@fw13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Em 29/09/2026 05:22, Thomas Gleixner escreveu:
> On Mon, Sep 21 2026 at 21:54, André Almeida wrote:
>> compat_exit_robust_list(), as exit_robust_list(), should handle the robust
>> list from the task_struct from the function argument, not the current task
>> running the function.
>>
>> Fixes: 2cb5251d3d64 ("futex: Provide UABI defines for robust list entry modifiers")
> 
> It actually fixes nothing because *curr is always current.
> 
> I'd rather get rid of the argument alltogether because that's just a
> source of confusion.
> 

Ack, thanks for having a look.

> Thanks,
> 
>          tglx

