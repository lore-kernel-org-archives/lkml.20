Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EEC43498B;
	Thu,  1 Oct 2026 05:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832989; cv=none; b=ciaAf+F8mJae75/szzkoSHx18uKVq/UpYhvy+c+8zLg+baXbhClwtUCgn9p5uimdrmpepnKtXqOCK/TQj5hnMVBu8TL3qYbzM4+v4en9EbY/S8I8sf+HT9TXyC611aEHQO5lIjmvpxcj5zTYtCBTM5dD7DKQciIB/U3sKz2UN4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832989; c=relaxed/simple;
	bh=ASdaN2clb1YF14M1GqaEa+GHElHwaWXI9/tgO24M8pM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLYPelzlFArWfFABhASRTN2tUYx8QQX2ZhvqEvDg58dvzRFHaL7dyi59P37qJzCGhNNjgd/ZHLiZmNNAM7TTj+qnLci16xF0/5G5Kpb7MXBoG+LmWsVB/kzlaxpDILa8yn5AupQ1rcOnC8CNNxZECD6yhVeNjE5SD9THm96+rpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=adaosqML; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="adaosqML"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03EC81F000FF;
	Thu,  1 Oct 2026 05:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790832988;
	bh=0zd8+lKttm78z4L+ooc6EYQgXG2k+ZJfGDrIK6Reg4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=adaosqMLS7JiN2S2jwxP7F7kg+esAoJOGQnSBwYnhcJFzmvSXHX+oNrOQ22hkT+GL
	 typqDp+U8TZ6a/nP2wph24E2veJ0183FB1XLrH35N63A8KQeY6JuOe+9TBa+6mp++e
	 6CMtLH4GS1bJ9eTSfnLZq7FvLwkHAr53+b5ASghwSrvq/HnJ/8dJlpLXL2G1xy8I1r
	 BhO+OiKBUfI4NuOnnKDu99s0n3Vs4+ARYSIwEBgdPHYwEFUICwIhGykREqKSgLCypZ
	 6is0PDIB7ozBTY2fM2cUN7zCoLQ1PbLy0ZuyAoznlD5Hov3SKj4tcVCZMN3YcrFFmJ
	 q+PMEqExoIvxA==
Message-ID: <85ce7089-1d6c-4862-b88a-b47e078f74f2@kernel.org>
Date: Thu, 1 Oct 2026 07:36:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: riscv: thead: add Milk-V Meles
To: Drew Fustini <fustini@kernel.org>, Han Gao <rabenda.cn@gmail.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
 <20260929-rv-meles-v1-1-effdd14a76e8@iscas.ac.cn>
 <20260930-bulky-miraculous-rattlesnake-b58357@quoll>
 <CAAT7Ki90CLoWwauNDShNFt4LS+3+nC-6tV1UqwAJP=KD0E56pQ@mail.gmail.com>
 <ar1AlKUs9gwTDWWR@thelio>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <ar1AlKUs9gwTDWWR@thelio>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/09/2026 19:02, Drew Fustini wrote:
> On Wed, Sep 30, 2026 at 10:37:28PM +0800, Han Gao wrote:
>> On Wed, Sep 30, 2026 at 7:51 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> On Tue, Sep 29, 2026 at 06:22:45PM +0800, Han Gao wrote:
>>>> Document the Milk-V Meles board compatible with the TH1520 fallback.
>>>>
>>>> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
>>>> ---
>>>>  Documentation/devicetree/bindings/riscv/thead.yaml | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
>>>> index 301912dcd290e60f816d380152591106de9415b4..5361021b8dcc9897803a5915665c6bb83309fe53 100644
>>>> --- a/Documentation/devicetree/bindings/riscv/thead.yaml
>>>> +++ b/Documentation/devicetree/bindings/riscv/thead.yaml
>>>> @@ -21,6 +21,10 @@ properties:
>>>>          items:
>>>>            - const: beagle,beaglev-ahead
>>>>            - const: thead,th1520
>>>> +      - description: Milk-V Meles single board computer
>>>> +        items:
>>>> +          - const: milkv,meles
>>>
>>> Why isn't this enum with the previous entry?
>>
>> Merging will result in the loss of SBC manufacturer information.
>> Milk-V is an independent manufacturer.
>>
>> Thanks,
>> Han
> 
> I think the feedback is that BeagleV Ahead and Milk-V Meles have the
> same pattern and it could be changed to:
> 
>       - description: TH1520 single board computers
>         items:
>           - enum:
>               - beagle,beaglev-ahead
>               - milkv,meles
>           - const: thead,th1520
> 
> Is that right, Krzysztof?

Yes, that's easier to maintain pattern. Entry per single  board means 3
redundant lines and a lot of bloat. Only one or two SoCs follow such
approach.

Best regards,
Krzysztof
