Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792565264;
	b=LQ5eJKwDqs21/lW+zwSsnI8EOeadDv94iePKeLxN9qZ4RjQkzpqQyg4lZgBJ8fS+S8J8
	 cB+pwG6ZGCE5qf7JGsCF7ZTX3mVI9pCg19ytpSU+RItf/HDl5YXZVlwduFXW8B/eLxOv2
	 HEMCbRPnqAI+pjmofCy+fQ6avR5VGRuJnBAMg2gdKRKqt+N15H+RsfQ/hqa7fs13TwpzQ
	 iVEnoVK618Q6Xd45jkUMCi61E68ph9pV2zg//uSTy7+2FAySI44swl+Br0iLJMv/ahSSt
	 /plK023fu67dv4YeUxuiQ8qWxliY/KbsAXTG8c7YXqVd04zEemfZ6Ya33n/lCt8rpcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565264;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=J2QUxryvompTVtSyl52IAT6bK9uiUb6secAYqYEW/kQ=;
	b=NT9Ww+DxQTEeVFKMe9Bd8xLV9ZDEmrC/Ab+552ZNBUo7rIZsLt6w77i37etv1OAyRQvH
	 xpTgxKSh0WB1T7YsX+VeHvDns81Qrk7caJ6BeinKh/n/fxbJWkpmwO3hYCBA966YAA+Xm
	 //wgZu4jRVBcPctfgWGiBTL+CWF5/c9ZNgh1eu8kERBOuDrWF+mvZlV8+lSIdKLs1jn2g
	 2nOjVilBrGvXE3QRNuBlVSC98pD+4nAFRczoH1yCIaj7oxLsq96MDcT/LnvgOeSyMta6q
	 lilEwvPO59pmwl3VhATw4iVUvcCknmXpP9d1PzcxAv+tcj1a6LiYCzrBriiQ/OCkqWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mrVzm9MF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238AD606A321;
	Wed, 21 Oct 2026 06:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mrVzm9MF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A0931F000C9;
	Wed, 21 Oct 2026 06:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792565263;
	bh=J2QUxryvompTVtSyl52IAT6bK9uiUb6secAYqYEW/kQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mrVzm9MFGFimFINNISMYo1QOQlFOZOHJLNYUA0Ka6mdPoPyt6/0zWWBHByeKfkY9K
	 xdVLNIhhpQKIb816St+Or0b/VaRnzbjXCtB99Jlg1V1q2N+Voc3XCu6kDsWO5JTcsz
	 dB4/WTBf520e/Qupx0LrMq7cgVO40BS83A3yeCZIacmnVDhCwydiwhNz6VX4fRQ0wz
	 A29wHbIyZUVD2IYqE35lCaq/6vRn6YWZBsPog7KoYTmXfGz7uGLajzmO63XPsSiEDG
	 NtzoIyJfvS1FKzW9JXXkd9m1AHTiYVZ44y5mwt58dTWpyVaGRXCAuImj8gAgx0y+Fw
	 +PpVqcgJauyag==
Message-ID: <24f76150-83b3-4cf9-a1f4-995f703e7902@kernel.org>
Date: Wed, 21 Oct 2026 08:47:39 +0200
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
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
To: Eric Biggers <ebiggers@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel@vger.kernel.org
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <20261020-brown-potoo-of-relaxation-3e9a72@lemur>
 <f6d6d8d2-03ca-498d-b5d2-578aece560d9@infradead.org>
 <7f3bab90-c32d-484b-b493-974cf33bb30c@kernel.org>
 <20261021064456.GB31908@sol>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261021064456.GB31908@sol>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/10/2026 08:44, Eric Biggers wrote:
>>> (for linux-next-20261020:)
>>> base-commit: 053966c344dbd346e71305f530e91ea77916189f
>>> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>
>> According to commit msg which claims that without base information "nor
>> can they be accepted. "
> 
> I actually wrote:
> 
>     Many patches still don't include base tree information and can't be
>     applied.  Such patches can't be properly reviewed or tested, nor can
>     they be accepted. 
> 
> So it's about patches that can't be applied due to lack of base tree
> information (due to the obvious guess not working).  Not merely the lack
> of such information by itself.
> 

I have troubles in such case understanding that part of your commit msg.
I maintain a few different trees, accept patches there and send pull
requests to a few different upstream maintainers. I never had any
problem with applying a patch due to missing base. IOW, having there a
base tree information would not solve anything in "applied" or
"accepted" part.

Best regards,
Krzysztof
