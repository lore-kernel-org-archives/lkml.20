Received: from mail-ed2-f16.google.com (mail-ed2-f16.google.com [74.125.228.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54B75592FE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083679; cv=none; b=GEU9/6KQPIF7rnErL/WhQSrASXubNvXqOJ/nsSU3qPBb6f3Kjkb9ArFN/Av9l2e3b/WlzxGCQ3lPUMuEo0dRRjzCkuB0kPEfJ8k12kttlW+dMJPdH92Vg7X57I9qHTxE6vvHq9nKWyl6AdPtvMt1UAQwXtIoM22RqnMnpVyHqjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083679; c=relaxed/simple;
	bh=WNeHYd3Vnw/6tw0XEiAyUXhCqoTIxF2ktmooC2skdD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0HR9Xibf4adz5uS/OSBbeIae9pI8o3TMD97OAOzdcMoaxFrPFO6a6ulVcy2S/3kXVBivDJ0ZWrZPitB3U5IWDeRrm5+YeCMoMkWAvZPrvW3aTinWWvUD80aoC5UZUaHHn7fx5vyUhy45h9C0KWCuYG/fSqjuSTdH/Z4kfEK9nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=OVILplIw; arc=none smtp.client-ip=74.125.228.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="OVILplIw"
Received: by mail-ed2-f16.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso7030398a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1790083676; x=1790688476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YIyBTYTKojaf4BmHidMuZkB2sDxpT30TjkIMwtTPhw=;
        b=OVILplIwJvSmlfdN3F/ncf4ZOUcyG+L6fBdA9UquALyCo+GE1VKFN1RNKlAIST9WVO
         yhARqo0w+BCjSXaHpO26Qx9t1clb3dnGvG9OSDbRADeXylqW1QdKl6D8kDbEvVzWuvLo
         KaMFe+lvIF3vfDhQ4XuD/AMPnXuSPThAjShc8ocAELZrXFUhg5JfwZvUu+asvl8NdeY4
         ToOVvgQ9im9I+5RcW+tn7STSWB+g7x3FsDKk/IeBGo0PuEfjcGXPCcBvTP2Crw7QoC3J
         TF5P4T1kVOOn00bAOtcS4IxpnZcRikFYOjTSXWZPK5HfAK+eaWhBHKpy2RogKblgxe+3
         t1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083676; x=1790688476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YIyBTYTKojaf4BmHidMuZkB2sDxpT30TjkIMwtTPhw=;
        b=L/JvOGIR/ZPzp4jgIx3ajvn9SM6iPsTVEWrPAiItd7Jq7lESVysyHYPsthk4r5y5jp
         g7xEserFUf9Fghv/oeIt5EcUh/kz0qTU+XuwgRFuHliQegE6hdRkNQHheRbo6SzZt69M
         6Wjvg31IyDk3EHKNsuHHWz/JoTEhySvFJ1c8mPIEExSCEJ0SORVa1hZCsoboBWaI9Fef
         l1suFJVwNDYC666q2pShzuLOClEMBGqSmxODa8cXJ3TPzo4I6e6UB5dlygdPzbnba/rN
         M4LFq/84/b+ANOD5I+VRlK/17fbEAdbgNvtiFBFGlB/vCny8tMm+coLaWNxE7/WbcK8f
         tfug==
X-Forwarded-Encrypted: i=1; AKwUvBzS65t3+NEmYh8uEZd9Xm4Rl/LsTqxfNRUt7fP5JNTi07LDOOkevon4XDqCvGqQEAxUJliY/Qmhaf8Ft2c=@vger.kernel.org
X-Gm-Message-State: AFuF++kGjnxY5Mw9x+Ta8NoF/VY/RcrfLUqz7tlbHdxf1vXhw0Xl0vm/
	NSG5sztAZViAPguzlP57ZrgIQxLgMpr+Juv5msP1DRAVq8kSHA/lsUjFJtHnAx/nqAs=
X-Gm-Gg: AYBFou2b5EiiHVxDoDLC65XzzGBHPfoTEvlQlE3rWUe3Lk9eUlXB8M626qvZe8uTz+J
	LG0rZVfSweGqx5Y43jQDusG8CdVHnx7xSZX8hdziBKzbYN+ScJKdl2TNQBBJ67h9FsLxLiWHPcJ
	Ph/4OuO0BlOAVaDmyLDZ/yqOGPPJWDv86VkBSB8+r/5PCvqJEV6Q9Pf9AzUYtCJNZtiHslvI6An
	nGZYk7GX1aQY9nId5Dpow6tnZkBevtb5hT9HiKGImrt7aD8NHhkqu+2o5FHFrwRknGdvj6CvUBA
	ISMvlriCpFy6fpd5sfNTB9PqsSCnXPsfzGC+T0WhSfETroUmHCK0hOWZ2xBE7wx2IfIKaEIU/8D
	knOjjHvc7j0u35F2Vk5XWpI3+uwGdjAi3c004yGAbwHdu40e2gkb1TG9PRwf+ihxe7RzZcDm5Fk
	SClaDw+lFKbvYH1gkWwhiJH5ATIgPOa/sdy5NAN8ASYxVo+egbzggEQKTQxz1MV+dPVg7xInLrr
	dJWTL914nP9iZmsW5laYczf+lvKTS+JAMH8PPpwbf1U7xmoh7dxwJ9gYkI+PQ==
X-Received: by 2002:a17:907:948f:b0:c26:1648:a060 with SMTP id a640c23a62f3a-c2a15e0fdddmr1199501866b.27.1790083675881;
        Tue, 22 Sep 2026 06:27:55 -0700 (PDT)
Received: from ?IPV6:2a01:599:842:c46f:7b1d:31f2:7a17:2f4c? ([2a01:599:842:c46f:7b1d:31f2:7a17:2f4c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c54f249sm85420466b.21.2026.09.22.06.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:27:55 -0700 (PDT)
Message-ID: <968796d6-811d-434a-a230-f05da451252c@9elements.com>
Date: Tue, 22 Sep 2026 15:27:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
 support
To: Prasanth <prasanth.padarthi10@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com,
 billy_tsai@aspeedtech.com, andrew@lunn.ch, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
 <8cb38ff6-1210-4c5a-b0bc-b0b50dd2b9aa@9elements.com>
 <CAMFFDGjJcmpaQYHe=F+jpstbdk9-uXPKkBxLkJqAJRiyyTkBvg@mail.gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <CAMFFDGjJcmpaQYHe=F+jpstbdk9-uXPKkBxLkJqAJRiyyTkBvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 3:26 PM, Prasanth wrote:
> Hi Tan,
> 
> Thank you for catching these issues.
> 
> You're correct about the defconfig. I used `aspeed_g5_defconfig` for
> the DTB build and incorrectly reported it as validation for the
> AST2600. I'll rebuild using the appropriate AST2600 configuration and
> correct the statement in the next revision.
> 
> I'll also carry forward Andrew's Reviewed-by trailer for the unchanged
> MAC0 and MDIO nodes, preserving the scope of his review.

Andrew has already resent the trailer, so no need to send another 
revision for that.

Tan

