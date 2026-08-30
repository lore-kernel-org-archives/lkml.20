Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4639330CD95
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123225; cv=none; b=J9QJKLVxg5fldFa8HrXOUCCx+7x+PfrUHIyZhNuV2F02SQv5eED8aibtrWitotq6HMxjOTgKgjOIc/tg4djRcOEEJDeJ0oMMSaTO7JaCnCF+reyVeG/uFd6Tdufa1iL/fbQDdrnJ/NtOTejUAU24A2RyrenU7kndV6xR9Xx7TZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123225; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C5mTTDFtrcYyLq/FvCHlOuGvjc0+DANVvNxo9+UNv6CHsvkKMMhP6V7DsE4GIOOADkpZpmnEFI9yzwK/eK62pJ7zNsb8I/+aj0FWyWNIMhqWLJUVqWm/gyIIWFzKr+x7abQUvNrdLhmcKOK2YsX16nQijLNoOcNhaQauCK7mQ8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso7077385e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 13:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123222; x=1788728022;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=dxGVU0XZC7KIZ6Cnaiafi1ROUUcUrR7FZYZVCL9Bu1Mwe4AzBp1WKpeayu1PBs4LVl
         num0N9vRPPDhalszh1/GbeaIfTLWy4hb40WsCVsjGwXMUgEzHRwWAEwjPXrL/EPTCtpT
         Jd1GhLdbrZ8Uth6+V3F9qhEM6xyZHx1bjP6sNCVXrdgpABb0uXkulC/AwNz4Gk17Xvfb
         vUrjweJQQdLO3uTNYfGDM1vcvgWfpO1pnpI8ctQeCObojLs4ptbipecE405NN2pt8Dcg
         laxGGASx/Pm85A4lr/zKniOAv6lfY2Dw3rEnFfbo+JYJjWEDlmzU0xlJdZfboJK4+cN1
         cqxg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6gcQXXajqXwcPegbNAcVLxhr9gZX2VyJU+n5AX9DYkSFjeA0iwILLS7K0pBNYm7gs0/3a6ac1zR39IoA=@vger.kernel.org
X-Gm-Message-State: AFuF++llwa+T/JKKDNYipnLbPFawQOlelO0mG7rCH/lfhNshTZZHD1Ac
	nX0HcDFujPGlkfmht7o3TB3qLlQNiBQLDhrFNmOmz/8hBKY17bnwMZKz
X-Gm-Gg: AR+sD10B43xXFeQk04I2h9ofSc3aQIbMjKFgXyXAOyOBYgjBY7n+n/LP+i7y81avhuA
	qqsFRt6SRwPq+CKnNm5wpwO7yTfEM1SD/sPfhlc4LzW5bKKAGmc2WD24me/LLXu8bcfAaTQkxFd
	uVespcgTFJpzAmql3oKJDe9ip3qJC96fnwYXHmWOUM1z3ya+HJOa5KZ39hypj++jfIiTRHNd5o5
	urh23E8/Ax+QuSq4bUfgVueIJxcCLMIuYIdyZjyil80nM5Z5aZ5spOcN8njxcHk25fQm98M/Ure
	sZH6eEShM2z5YXDWNQUqEUhjPqRajbTVkYXbuza32LciGS90sLFMNqqZcgiRTZusIjowCXa+uah
	61D+oNLqsuCVdjM49d/eglcEJEV5LXXyGyuzjxt1YpVRYemUcvumjau6AUi1qVieDx+MJHXmZmE
	NetnRyXZoj9VgkCpWaP3zSWGLEflCpbzmYDk0RKM+JuOJRJ6IRLgGp+ESX9OzTZ+8ACxJN9u4Gt
	x/potX+bTVjiqJL0ZvY/w==
X-Received: by 2002:a05:600c:1f8f:b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-49b91c44ec6mr295353325e9.11.1788123222310;
        Sun, 30 Aug 2026 13:53:42 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c9cf95sm179357275e9.1.2026.08.30.13.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 13:53:41 -0700 (PDT)
Message-ID: <e502dc95-d309-42d8-a154-6f9d1ef9a8ac@grimberg.me>
Date: Sun, 30 Aug 2026 23:53:40 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmet-auth: Synchronize timeout work during SQ teardown
To: Kazuki Hanai <hnkz.64@gmail.com>, linux-nvme@lists.infradead.org
Cc: hare@suse.de, hch@lst.de, kch@nvidia.com, axboe@kernel.dk,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260830131105.680566-1-hnkz.64@gmail.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20260830131105.680566-1-hnkz.64@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
