Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189492;
	b=Tjh32pLZ1W6BnfgZ+IjLPNv1SWrR7VxUNt1thFnHqpjEbPhg8+dvgcQRhmt92ASmYUNB
	 xy+xiytZxqnYfayoAivDtPzNZnD5AuSx1DISHa4PvdkPFYCZGx9i531aJ1jz7QzkuFIYP
	 YZH+9kw7Mr5Y9eyxxszYTrRGb4RCycamHk1zrkjyOfWRpD7TL9qjPB9pNwpb4kKOpKRLd
	 4ZFVmvsHfDQ5ADO0hNkI2HnM+Nw8Ir4tPAG7LAGXXERNAq62iorc26e+5qghdxauj2Su+
	 RpC5JZD14vtzRjI5hMnXiSywA7HW84xZRcPc85MfY2JiD3LYcm5yKSs3ToO/68T4QKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189492;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=/Sn/i2Yqdfj1qNkhpvBMDK/CCc2NDCngehm2DXXeFP0=;
	b=r60IIc/mNKYtHIBmxgnVneuv+cobQ3a+30gm0IiACxwVxQleQpIqacHryhu9qs11RsFK
	 vVtee4Dukt8hBuTcD6zlEPmsHi4bBABhPZTaGU/6RR4+fqD9dhSLSij7CS6h+eRnKiLVs
	 sWWRd5e9oqOvNWyqmc7LIjVn/5Q5Ncg6gBkocpcqf2ROvZXsaGLHEk19PwAy+SJ2uGVfC
	 /WpfDsb1ZBqu5tRVoOWRxRAzKBA5+jWOv8lPVBORwr/8pWOXYCKKAZ81aCXdFQp6eOyCr
	 kTllQG0QckfRRM5QHwMu7RV13pvxPT3EADjaYfM1p6RyDpa4L1vKcY7KSoGyFoLRk9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ncz+4Vc4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B6B606A31C;
	Wed, 28 Oct 2026 12:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ncz+4Vc4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0AB1F01829;
	Wed, 28 Oct 2026 12:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793189491;
	bh=/Sn/i2Yqdfj1qNkhpvBMDK/CCc2NDCngehm2DXXeFP0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Ncz+4Vc4o97LL7FB+BTqgq7VwnYnQFGcixtodtDv1+81dOze8ByG3Yxu/PUjRZ74A
	 uzra4xVh/ElHlmPriTtAgilOUMfL1qLvhx4vUntD6sQFnkK7dw++Re5SoRmcW5jbed
	 K03++XllE2PadXgK0GLBXS06WCnAMXauGScWFbSBG2cFqbJ59RpFnXZsgFOeOTEGgI
	 MImXTrL0/aHHEWxVLCWgAbCiuKad8KiFioz7oUJHUlqpuq6XNvbpAuIFLwmqYkVoNm
	 jn7qis13Vo3QyKSgHL50Wlkj6LA5IDg1LVPTfsz9I0+NcsGUnxjorpR/KmqWYJquHC
	 mR9nMaWiq/goA==
Message-ID: <e63d7539-2347-4e95-bdd6-f8e1e899e065@kernel.org>
Date: Wed, 28 Oct 2026 13:11:26 +0100
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
Subject: Re: [PATCH] dt-bindings: regulator: add Will Semiconductor WL2868C
 PMIC
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261027051055.213301-1-xiaqinghuan@mail.ustc.edu.cn>
 <c8e6c0e7-397c-4692-a478-d9778b312886@kernel.org>
 <20261028120423.99034-1-xiaqinghuan@mail.ustc.edu.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261028120423.99034-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/10/2026 13:04, Qianhui Xu wrote:
> On Tue, Oct 27, 2026 at 07:04:55PM +0100, Krzysztof Kozlowski wrote:
>> Looks like broken patch. Please use git or b4 to generate patches.
> 
> You are right, and I found what happened.  The patch was not produced by
> git format-patch on a commit: the diffstat was typed into the commit
> message body, so the mail carried two of them - one pasted directly under
> the Signed-off-by (no blank line), and one appended by format-patch.  I
> reproduced it locally by git am'ing the sent patch onto pristine 7.3-rc7
> and reading back the resulting commit message, which contains the pasted
> stat.
> 
> The v2 I am sending right after this mail is a real commit in a pristine
> 7.3-rc7 worktree exported with git format-patch, so the body has exactly
> one diffstat.  The diff itself was never the problem - git apply --check
> passed all along, which is why my local checkpatch run did not catch it.
> 
>> Anyway, where is any user of this? Why do we want this binding?
> 
> The user is the camera stack on the Lenovo Legion Tab (TB322FC), an SM8750
> tablet.  The WL2868C sits on i2c10 at 0x2f and feeds both camera sensors:
> 
>   - rear sensor:  dovdd <- ldo7, dvdd <- ldo1, avdd <- ldo4
>   - front sensor: dovdd <- ldo7, dvdd <- ldo2, avdd <- ldo3
> 
> and ldo5 supplies the VCM actuator.  These are the *-supply references
> in the board DTS; without a binding for the PMIC they dangle, so the
> camera nodes cannot be described at all.  The regulator driver itself is a
> separate patch I will send to the regulator list - I held it back so this
> binding could be reviewed on its own, but that left the binding looking
> like it had no consumer, which is a fair objection and I have now put the
> consumer information into the commit message.
> 


Reply looks like it was generated by a poor LLM or poorly managed one.

Such poor LLM produces text difficult to read and understand, very
unnatural for upstream kernel discussion. Discussing with such LLM is an
excessive use of maintainer's resources. It also brings doubts that
actual human is involved in discussion, which, if that is true, would be
a total waste of time.

Best regards,
Krzysztof
