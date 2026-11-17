Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919881;
	b=B/uboSA+TWHp/0m1CWEhN+z7a3UeGz/txMj99g9nfB9Sj07nNwKHVhAG5KVDtVHDrjYE
	 5c0ysMvaBPNQxyJeof3ONeMKGu+cMf+ZH9N0pY9jugcVfu0bx12qJ4xKq0hgsin9+xrw9
	 gXCOAzmdIIkhPfeEFDfh8chdBv3XRq+wfi+oqHaC6suqg4CEz2LcD5u4dJmzYC9m6dlUg
	 g8Als/Hxg9lieIkiUDXP+MpthnZQh9IPDvyvWyXMiSdbn1qd1mqfA26dr4cmoME3r0uWP
	 4hghm6SxSLc32lRKDSV/tPIMzf4QxjLNomi7ZMr2wJV5G32vEJcLjgbJIFPjMsj1OKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919881;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=AunZlTmFqRUvkgpDIQ0BwDlzDcego4W6mpMBmkXYiRc=;
	b=mP4aO0Gzg048hb820gbdh4sKokI34B25K+OY+Dip/7YwN6Z9RA44qT1G2XZ1o2V2lNhH
	 OdMlNNB5CylUxPxwLXiITE939h6xCzotPAfoSv9mG6q6xPF6EPtW82kanRnzSVsGDzVPc
	 gizb/KqHBPM65FdZgOOAByXXYXm581udj1KQsexgWbbDVzrMuhMgC1R0OauHDAK4+wNt0
	 +qflIFrQLushSN2rH+hZJyJ63mQdRepOCa6he97qFwbTQu78no7F+oo3pjrk+1lfTS6ZK
	 3UmnSnmfjh1IC78u/3k2KPIb9AXNzuz+GWTNWQNBF4/UCenHwAhffB3SHWmhykiG1Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l466RdzF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92366606A894;
	Tue, 17 Nov 2026 12:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l466RdzF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5431F000C4;
	Tue, 17 Nov 2026 12:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794919881;
	bh=AunZlTmFqRUvkgpDIQ0BwDlzDcego4W6mpMBmkXYiRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=l466RdzFCP56bJ2OgrWBqgegMLQqnBvWZsX076mDg4ckijYkpTDN8qXfLeBdhCcsA
	 C420sOET1ohmffKb2ufw3OhOysGpl/RTT2aJFZ9OXGpB6KeOcWP/BsqjDeoypixiuD
	 3H5Ntv61uvhO1xhOFciwJNbOHsxX+BxeLFO7hutYhO0yMrdzp9Vp/PgRHBxWW+iZqj
	 1ejCBSZI9oTew1CoW3Wa3FM59+9NVAYpT0NilZoG1u8/3az5sQ/HGy9NkmOyLNuCw2
	 fSupoxA6S5SMJ9O5+BssHUi7yLWpskY3fbUAQ3OuL686y0v8EqcWsfJtUGzzfMDMJN
	 xyR6wWVNkFeUw==
Message-ID: <324baf32-6cf7-40d6-adcf-d709ff2a1950@kernel.org>
Date: Tue, 17 Nov 2026 13:51:14 +0100
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
Subject: Re: [PATCH v2 05/22] dt-bindings: thunderbolt: Add Apple
 USB4/Thunderbolt NHI
To: "Rob Herring (Arm)" <robh@kernel.org>, Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Philipp Zabel <p.zabel@pengutronix.de>,
 Neal Gompa <neal@gompa.dev>, Konrad Dybcio <konradybcio@kernel.org>,
 devicetree@vger.kernel.org, Joshua Peisach <jpeisach@ubuntu.com>,
 asahi@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
 Mika Westerberg <westeri@kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-5-1f80085f93fb@kernel.org>
 <178968425120.4102150.11013505530489451162.robh@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <178968425120.4102150.11013505530489451162.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/09/2026 00:30, Rob Herring (Arm) wrote:
> 
> On Sun, 06 Sep 2026 20:36:28 +0200, Sven Peter wrote:
>> The Native Host Interface (NHI) provides the TX and RX rings used by the
>> software connection manager on Apple Silicon SoCs.
>>
>> The NHI is part of the ACIO host router and is exposed to the main SoC
>> bus while the ACIO co-processor is running.
>>
>> T6000 and T6020 use one DART stream for the TX and RX control rings and
>> one shared by all other rings, which are used for XDomain connections.
>> This likely improves the isolation of those host-to-host connections.
>>
>> The M3 generation uses a slightly insane set of 24 IOMMU entries. These
>> are probably one DART stream for each TX and RX ring.
>>
>> Signed-off-by: Sven Peter <sven@kernel.org>
>> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
>> ---
>>  .../bindings/thunderbolt/apple,t8103-usb4-nhi.yaml | 151 +++++++++++++++++++++
>>  MAINTAINERS                                        |   2 +
>>  2 files changed, 153 insertions(+)
>>
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 

We might need to revoke the reviews. The implementation here adds
undocumented and unapproved ABI - aliases.

Best regards,
Krzysztof
