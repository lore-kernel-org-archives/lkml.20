Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0D547606D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092126; cv=none; b=q2AWSWRI1kuEZAcG7kXylulAL2JOr4TkqGiPlTimiEr6g8XQASzkbZYab3wh6GCtClPywZcqpHKtQSeKKF2KAXuZPZP64Nz/sHMymL96nhL2y9VdFuOneEVVLa5kVWdo2lLh7LOklDy35vMAr+kfQexFiJmO2/NaCRk0uaeF/UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092126; c=relaxed/simple;
	bh=X39RIv25b3bYLzGX3nJBQeZQTXxsGWcMfKL+H6FOhQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQHbBHe2QaCWKfo8O8TZMJ7l95vNrctOn/eXhgvFyRtD3WK7OHmnbp+7taWSOk8B+GzbogsduECNwVh9edaiYPodg9TY/nhMZl/yMRG/QQna5WPCWu/Oc6bnDLBv9qrbjTtJ0gUdVS55s0nolkrz4pe+0MFJ+M+w+JbaRL8F1cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OrmjBn4D; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OrmjBn4D"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-70059e4dab6so528803eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792092123; x=1792696923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgdX2zDefc4wSeOQxvDkXIDVDbH9LUXjTZ+Al6mQkaE=;
        b=OrmjBn4DdEu3oYJ+UNEnK9yQtYG8KtxoFCJeyfKzkArkA/atKqnkQ6AYySpMfr/Woe
         sz5/DeGaUjtRR4Le/m0fYtEKTOSULKuFRVA9liBDH9aSlpFejDLgpgoZN/tcynvdsJTM
         zNerKLHJ8gwfTBoa/XcJteshj1vfJXmGu4JSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092123; x=1792696923;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgdX2zDefc4wSeOQxvDkXIDVDbH9LUXjTZ+Al6mQkaE=;
        b=A/pjU4G3LKcSkw48DqQWAT70FwyM0auQqEjSjl2dfiT83Rkw9u5jRNfImv6w+QPxqv
         9RK1zy3EgrIR0wBTyWDIEgR+YV3Rn8B92Xj93KGREhGSIuDTAjTb9u+aub4n6is8ETYk
         TrMgjMcB+1d5j6fPZiEHz/VQ6dxdP+RgxUu2aDz59tyUEhgPhYL7LNM1T6Th3Itlvmww
         CY6BQtv5uDD6UBDPCjiOPSPJDdCgedikFDFCmmnVj0a1lnB9erkbDP42xVnP8j1N8+L1
         aSyz2MEvr+cKQOgHkeIio4l/uU+CXjRrGWEDSsuS/Byn+X2QfB/E3UU5nicx8k/ivCzu
         cLxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzS06FG6LTeeSZj+ok8dp61S0uFICgEWMpWhgy0xUIn0QXc1DGuBTXXNqGw3syzfq6sdhyPs56gfSlUn4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxc+hqzG7N60fnkKbr9QNsSZIvm9rFmmKR6KCmZJdDNPgxaG3E
	GXNkGkuLTWeRvhCLFvHgJYI3atq810982ya6frVFUnwaycr2VP3Kac4YdnSwQNBRCiHFT1W28Md
	Ce0CA8eQ=
X-Gm-Gg: AYBFou0Eduq+q4KNZPj7tdMxuGC2MjfTTCIaaBWSrKAXmOiwX1iJvtmH22Z+WmuZOMF
	EegMk2k6J3+YYAC+DBctLG09ZagejWai+G/TO+cB99Qo9u1Xh8OxUheCtOkcM/+kY7dUZ6cbT1o
	faHZ3s0LOFqXd74WV80EWy0CLetTMqaLdZUVoxPyJkmCBZpth4PjOfmOb4L51YaQIUgBE1xokLx
	exl56O95YePBV1HmVtrTgwfF+VVjryG4V8+Cl6y+1qkS/pdXgMzaOR7+nlypo4oqSkwO1ZDPea+
	X3GXoDg56fO1e3aO92oLhg2soHFb9SfAQO9Vf9+Tn7uNET3cxEECl0oA06poZfWqljdbpCnZ4GO
	CP3M8N6gdHhwaeq8boBq+oaPrbHUzVhIDvxIR2UqIjijYEX40oRGv0AGWBCXqnY8PYE5gHV1lOU
	+Hg5ekGFcJWXjwAI2DZMGMV8ujds/qEhqAe38o1CxmrUgp4be6dRaC9XH0f8FkbOlqugB093wn/
	nzUzcOx
X-Received: by 2002:a4a:ee17:0:b0:6d7:ee8f:50ea with SMTP id 006d021491bc7-6ef10097af2mr13590593eaf.48.1792092122623;
        Thu, 15 Oct 2026 12:22:02 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7018e73fa0asm153146eaf.3.2026.10.15.12.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 12:22:01 -0700 (PDT)
Message-ID: <d7550cd1-e0fe-4e85-8a93-c2bf4c789e59@linuxfoundation.org>
Date: Thu, 15 Oct 2026 13:21:53 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] selftests: keep the build status from wrapping to
 success
To: Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?=
 <rbm@suse.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261014200115.1363363-1-sashal@kernel.org>
 <20261014200115.1363363-2-sashal@kernel.org>
 <f64e8221-cedb-4b4e-aed4-a87ac23c26cf@sirena.org.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <f64e8221-cedb-4b4e-aed4-a87ac23c26cf@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/26 12:00, Mark Brown wrote:
> On Wed, Oct 14, 2026 at 04:01:09PM -0400, Sasha Levin wrote:
> 
>> Record a successful target instead of multiplying statuses. The rules
>> still fail only when no target succeeds, and FORCE_TARGETS still stops
>> at the first failure.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>

Thank you both. Applied to kselftest next for 7.4-rc1

thanks,
-- Shuah
