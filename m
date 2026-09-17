Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F933471268
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789629782; cv=none; b=CitbvF5nFqa4hUkjCIEssr3hNcOBNPAeTE40CicINNTSjoj8JkTg0P4Q+4EHyNcdetfvtGVRo5zZpOOrfCuak3+XxQ671bsOjQPMCbnt8qGWOzpQD6e7UnnVUKKbpN29wmc4hsIuLd5g53xAGctbdcPGW9Yg71h8XsdM1pj6Swo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789629782; c=relaxed/simple;
	bh=aQqaid2E2NB9g4VCUS5cfIYyCTmnvaOMIjd/VhE9wNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KO7w9bfdSQuZAdCkxiunzmfSDBDJRmEzZmyeoc7SGnMRJ+3cz4vF2toBrKaJm2tCUOfO/j1SLe2Xog29eD+z4whYsL8BpglgmJrXXhOb2FNymgx4esHh7IAoJZg5gZQoFsmvd51JTf7eLxYq/UeweAjf3yjwcCxIul7CJ19NhTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=Nd4sRUBP; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="Nd4sRUBP"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so2395325e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1789629777; x=1790234577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jtER79YEfUdewNdGI8bNbynmacCVTSf1eVDUEcusWmw=;
        b=Nd4sRUBPQk1MLundjYB3WXjGRE03xtvQQ2zVMCXZnBjvMNHJkDrMxtWad8V9b8xx7m
         P4JTwRhT8dXVar/WW6Irh11LL61AFg17WWU6ytIHxvuTxkSDBNi4RXw/88/dYt4Cqtuz
         PFkRUrpCCCqcVho4OUCw5sxlmvpQUBQPHJR3EIxUDfRfaJAjCkDaNjAyi/0q476bFxsb
         CcwNcRV6//pYtuBkCCVRTYF0N8ZGlAvBMiZjj2y7IGRZv/KmdFG3QPGmfp3LjavjhASe
         R9WMamDVJVKcMlwfwGqvZAcbf95GcG3wPd92KxTxdSW8+nKT7sy3By5+MepMjpsAeWYo
         XLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789629777; x=1790234577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtER79YEfUdewNdGI8bNbynmacCVTSf1eVDUEcusWmw=;
        b=YIPq6dJxazG5M+53ZsakQKvTCFcFKIGTCH2Gfvhd2ikZbZVCpnOgCF579tFXnDRlT0
         in/AT2oty8T9gyje39FdONMd/QmPLLI6IgmHodAPjygIUUh+QklXR6cZMzdhSw5Islt4
         G6VdNqG5iWKBjM+aPJX0pqmT9yn0G0tbgqnDwNb6sI3ybouGAAJvKHg12aav744AC+LC
         5I9t2R7GAYWpaAFnNyhvUbacBPcdLR1QATdATNpIv2dzfax+NX2PxTDG4twiKCK6Srts
         GJb+MJar6pCyyC4fIMuW2AGS6AKHTvwWqVIw88QqGO1zCyNxJbFnwo2w0SFfLQd3GLf6
         D43A==
X-Forwarded-Encrypted: i=1; AKwUvBy01xW5fAvjYaKBTsiAywV/wcyCye6bUHfID1nx0deYtIMWcUPDdXxJVuJ7npeoBwGuq/MkzokbRNSCH5Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lnGp9Igc8iSzQGgLCYVRBmyvbrbIJSgwxG1La+YXQQZbej0M+N
	Md5lkex7ZLfJfFiPNV7xCHPF2snQJPHSacaZhxxNro3iVICy3YVZ+XOSrNKBFXXI+uQ=
X-Gm-Gg: AYBFou0tiO06RwgrJIcQlF8CXevheWHnr4G/EdrzswDySxyGRnQqNKxQO6UZ57pEY5O
	u0i2Va+1rQ+r7AKbp3U2ABa1vTPApQ6qHkj+mZ9elRAYgEIVfRqIKmtgFTaeMzRj9R5k9qOagSb
	POYA0u3HICBMugVL+X6+ZAedNE9yD0ZhvlfPEnpgAAg7Xdqk4IBITflErUrcldYcq9phtN3Y3f7
	rJaVZ/LPIOzcVvLGnJo+/qVjbSwYMLIt5mgAGjx3Bqu73aseknTJFZZjQ5OOsWSIxeQ3u72nJBu
	eb+OBv6MO8lUBfLXVjWaFtqucAeDsgb9s1qeXdp03S3bBdtiz0vamVNJqLl6H5Nb2CQZZzje0gD
	gQu95ywaNkXAz32LxvCRz4OKwoIiGAbtZh1HycgB81pJvF7o3UABI0h0ea8JV2qB86L9uPO8OQd
	jwgVR1VO8FKYE5zmSlkiEbeuQ0Gc6PF0Yulajf2wlfbNbz8GL09SMUUJm+uhFrCPAoViNQjX2fo
	8J1ukMmiW03isU=
X-Received: by 2002:a05:600c:3547:b0:49c:fa20:cbfb with SMTP id 5b1f17b1804b1-49eb73253demr61340245e9.18.1789629777083;
        Thu, 17 Sep 2026 00:22:57 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd32c5e1sm76754145e9.5.2026.09.17.00.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 00:22:56 -0700 (PDT)
Message-ID: <d9481d22-5355-45da-81e0-a066260e568b@ursulin.net>
Date: Thu, 17 Sep 2026 08:22:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/sched: Protect entity->last_scheduled with
 spinlock
To: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260910075942.2000338-2-phasta@kernel.org>
 <20260910075942.2000338-5-phasta@kernel.org>
 <f186f871-064a-4f45-8987-fe9f2fb3fa1c@ursulin.net>
 <47731da478e8801dc9823ecf286e941020e30963.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <47731da478e8801dc9823ecf286e941020e30963.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 16/09/2026 13:54, Philipp Stanner wrote:
> On Fri, 2026-09-11 at 09:17 +0100, Tvrtko Ursulin wrote:
>> Also, to repeat what I said before, I benchmarked this a bit under
>> extreme circumstances (4x non vsynced vkgears) and did not find a
>> regression in fps.
> 
> Does that mean you give this an official Tested-by: …
> ?

Not sure if it was the same version I tested back then so best I re-test 
it quickly once you post the rebase. I was actually planning to review 
it once sashiko is happy and Christian at least acks it, which he now did.

Regards,

Tvrtko

>> Here you can compact with the idiomatic:
>>
>>    prev = dma_fence_get(entity->last_scheduled);
> 
> Good idea, will do.
> 
> Thx,
> P.

