Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962833;
	b=SwqJjhhAhZe81I6UteV3sCREsibyqfOZsPk8N8QE0bSl5Z3eesdsQINyrb5sSINbs8NH
	 2y3OfEsoEy+aZYs5I+eMFLwNKW9HD3UBsriUJ66f6l1SsFlfXdER5MvIcoknBGq8pIG9m
	 0hB5ZKpFUVgz+IOHIGsYif2LdaPRjTvjqGb0Q0ZUahyUwGpLl687+dvmP7GaiyPLMaihz
	 1bL+RX0BfQk8g/vt1kq+wb4O4vTkf4OeUdpdeA6YcbvrPkLaDZQwPztrDKVHDeQJwebLj
	 SoMmiuC5KW2IDSI8u+wHWR3dg3Nj84nQzCvY20N3p0CYwK4geVeOL9YuxKQ6Xc4ic/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962833;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=c6ZP+n4jTxODTuXEkRNjigB7pFafrPalf2+5uOxtheI=;
	b=RgB6xcxFPj6RvzIpKTO3y8qaaSz1Zf24WnKrAx7gj4Lg/4mwrdXFRWsQeWr+NXIkb44B
	 xpl+gKm7HP5aNDYImCRmemTMD0jy1jrVEy6kBxnAxm16Mh9Q9+nEhcKOaxF/2lOwFSxvU
	 pgJ8PBP6YK9JzxUtCX/Wl8VqzEfo1BGcZdLB7ANAjz86RwPf5tSWGxd9ieO77UDF5N2HR
	 M/Y/bpE9fZU73xrNV7avex0Si6Mc3cFsKCJIfjd5SfoKy0i+spXnX9c2Mjl/b87p0nm2m
	 Px1O8Ui0LeJUpS6WjG85fH1WXCgehEuSX8Ol5vb5tX5w2/2XN6SNTaC5IUnYJKxwWkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mv24GXNn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1FF606A326;
	Fri,  6 Nov 2026 11:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mv24GXNn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7077A1F008A5;
	Fri,  6 Nov 2026 11:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962833;
	bh=c6ZP+n4jTxODTuXEkRNjigB7pFafrPalf2+5uOxtheI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Mv24GXNnYV8YQMLVWD1oPUYuwmDlI8kaswjcHMtv1s385+Lo1+75ZfyeCy9x/wr6L
	 NhcC5C0RKSB70s9tQvJ0Qr8aWOsLVxYjE+dlhDZtTH7TNuSOJA5CwXEmch+eii0euR
	 iF+qDBf+WZdlvoyV57a8ckoOcr3Xfm4Dv3T/46nsG1/eHSXqeYtQnLmF5ufm1md7jm
	 J5vOP+7sstc4jmNLD2Wr6VHx7OPd+BbdzW9bgTItU1ScB+1Fv025D2oU9QLGIqnv8t
	 6A3Jtr4lFTUDWYpHnv4GHN613uAi9KnWTiOQ3CWM48o1YdF/JS1hmws2alFRFlZDMQ
	 Smve/rQyxo+KA==
Message-ID: <13a16c37-90f1-43e6-a50c-80c8ad8a2168@kernel.org>
Date: Fri, 6 Nov 2026 12:00:26 +0100
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
Subject: Re: [PATCH v4 1/3] dt-bindings: nvmem: add STM32MPX TAMP backup
 registers
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Simeon Marijon <simeon.marijon@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com>
 <20261104-upstream_nvram_reworked-v4-1-144024496a44@foss.st.com>
 <20261106-truthful-humorous-centipede-bc21ab@quoll>
 <f8a1dacf-f701-4d04-b837-906504d6afa8@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <f8a1dacf-f701-4d04-b837-906504d6afa8@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2026 11:33, Patrice CHOTARD wrote:
> 
> 
> On 11/6/26 11:16, Krzysztof Kozlowski wrote:
>> On Wed, Nov 04, 2026 at 04:20:08PM +0100, Patrice Chotard wrote:
>>> +      nvmem-layout {
>>> +        compatible = "fixed-layout";
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +
>>> +        /* Data cells */
>>> +        wakeup_sec: tamp-bkp@0 {
>>> +            reg = <0x0 0x4>;
>>> +        };
>>> +        boot_mode: tamp-bkp@50 {
>>> +            /*see boot mode selection feature*/
>>> +            reg = <0x50 0x4>;
>>
>> Mixed up indentation. Please also run scripts/dtc/dt-check-style and fix
>> obvious issues.
> 
> Hi Krzysztof
> 
> scripts/dtc/dt-check-style  doesn't return any errors.

Yes, bindings should adhere to strict mode, see line ~40 in DT
submitting patches doc. Srtict mode would complain:

Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml:50:
example 0 [indent-consistent] indent mismatch (expected depth 3 * '  ')


Best regards,
Krzysztof
