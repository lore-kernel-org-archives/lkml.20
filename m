Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F1B451071;
	Fri,  2 Oct 2026 08:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930811; cv=none; b=GKIY9+RKlDJePs7w4iNUL7KOGLnGz6J3nAC6+jIUkVLEoS3wVv8/ITXn6OWYHLOpn3CZZtywRo4O1aPN1X+Rc2BtBIJ9+hVSU8Ed/0WOOrXA4L6QeEEqvfxxbVVM5UFl3mkgeln7WzRpjhT3+tYPs9fT6s3EYPm7olh9kK5LX68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930811; c=relaxed/simple;
	bh=4cxItA1YaQDoj9wzcC3uRMinaiz3iX6dgK706mJIcJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tnq0EDXxh2r8nQacJ3fPwn5XCkK3U0vfR2W5PN0N0UXoJmIDu6kmHhZk4mAKfIO6HJhe8ubYcmKiwUrHIQPzpSFnplUs1IkDF7f9aNzUCuxe1+fj3GQ5Hk3ApbbKbKhyvk3hmzvQWb+lS5PR3BxCW3H4JTECfgdLjBhl+A143Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWcglMps; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWcglMps"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D441F00893;
	Fri,  2 Oct 2026 08:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790930804;
	bh=WAUTxiATtF4LQzyyt2YJaAoHBzp/Mg2dRyQDUo1iqHo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OWcglMpsdRA9gC30DVrcpRYyJ9gTrdzlT2QF5H2hQWUfON6cVY30MssXcF+667BHv
	 NWMyx4MhJNEv/GEkAGTlgyADTPv/CUU0vAq+hcRip+ewD4ZtshUvS8cqa8uArGSBRp
	 /VpnfHvWyUPPb8YQl1m4vOhV1lgz76H7wqxpwHrb02QXl/OIbYY440P3Do5mKFOdeW
	 dJmzrog4KRod6G5KbJEK2DIWkV2SBlJunCrlpfoHYmRhmQtx9Avh3uqgE61sPqAQBS
	 q/sKepGGb+TZ9N3ZvavLhnbe7rSNc8PZywtLYS+36vNw9agMh7GFG/PV0N1N5tlRwN
	 NmXjg6aChmaig==
Message-ID: <c60ae061-45fe-483d-a849-3c50cce9d905@kernel.org>
Date: Fri, 2 Oct 2026 09:46:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the phy-next tree with the v4l-dvb
 tree
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
References: <ar5wFFE64tWhmCKg@sirena.org.uk>
 <52ef6837-7183-402d-acc6-8ca15c7e27ca@kernel.org>
 <R_JowhWK8-JOUEfwj3vRPt6MM1N9P4dM6Qt0CkmG2uL5UVFnQb6G319HQPt94cGPJhsaV-LDm7R9XIF0SuJkAQ==@protonmail.internalid>
 <ar9Vm-VPzqhtC8SQ@parshuram>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <ar9Vm-VPzqhtC8SQ@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2026 07:56, Vinod Koul wrote:
> On 02-10-26, 07:33, Krzysztof Kozlowski wrote:
>> On 01/10/2026 16:37, Mark Brown wrote:
>>> Hi all,
>>>
>>> Today's linux-next merge of the phy-next tree got a conflict in:
>>>
>>>    Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>>
>>> between commits:
>>>
>>>    42b96f94929c9 ("dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema")
>>>    a93b9de71466f ("dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Glymur compatible")
>>>
>>> from the v4l-dvb tree and commit:
>>
>> Why were these taken via v4l/media tree?
> 
> This is even worse. Immutable branch was provided, so people can pull.
> Looks like folks cherry-picked instead. They need to fix it...
> 
>>
>>>
>>>    3b0140f37d25b ("dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema")
>>>
>>> from the phy-next tree.
>>>
>>
>>
>> Best regards,
>> Krzysztof
> 
> --
> ~Vinod

Hmm I did a git merge on your provided branch.. I did a subsequent 
rebase on linux-media/next though so that rewrote the git history. I 
should have rebased, merged and then cherry-picked what was go to into 
linux-media.

That's completely my error, I forgot to isolate the merge when rebasing.

If its OK with you I'll ask Mauro to take the version version in 
linux-media ?

---
bod
