Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648417;
	b=spidJJ6H+MNmrZsUVqFlZ4sJDger3vPzmvATqm19pg2DJnILUelEPayG4gWQxOzoEokw
	 IsZ8ZKQ8QbapdKl8IYcbQzggY+EZDC4QZwusRujK+kQz3jReYXSOyUJyU9ne9I+7Pvnld
	 EyfMUq+cfc6NytpkLi3eIc+8wvWGIzLkMfzMTryiz68vwqvaz0rZgUQNhhQdl5e20Hh4K
	 L2D26R1hPyxcIhaOD7Khj4L2DiRJ26+yg+8fRGVzaxXWer0SZrsJWd3ZWBWLV1lI6EfSn
	 DyQfh478shft8Ikxmn/niDPBkvjelvAN5iZeb5pJ73WPR4kotUVX0fvQMaC/GF1zcSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648417;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=zcQxJ2MKNJlnoqlvpsdMkMWFchNJxAPyGsFmqT4MTY0=;
	b=mrN0Tl8hk3dlArQM7TZ+l8EKcP2CaXZtEttUEwWWPRG83M6CRIdwFiUUxRC4VpRSQhM/
	 JZAU6GwXtYbPKzLg0y9uIxURbsGk90bG80hQsw9ArT1zbsD1KXlm7UHx4b7/eiYa2sL5b
	 KpY06oO9HsN+qTrJ8wd8pa7BGss12hpAKqS2KCbKsCIQB/eaXtwG9pUa/EFBMcMRFERhW
	 ufhnNDMPugg0d73v26/tk8nlRTM2cB9CEMPlUdYEOz8O2ymjsXBwAIpa3PNJN2IWnlQiU
	 PQ5Srmap9j7lJTnmV2ifnzBXPDOhVoB8lnn7l77wo+RsLk6mfCVIrkqeRR1nVh0ktgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dStpRgps;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE902606A331;
	Sat, 14 Nov 2026 09:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dStpRgps
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B8A1F000C4;
	Sat, 14 Nov 2026 09:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794648417;
	bh=zcQxJ2MKNJlnoqlvpsdMkMWFchNJxAPyGsFmqT4MTY0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dStpRgpsedWmh98AjBH9rNJyY5OK/oGWWitYc3v8hTpBy1I5YS7K0352eSE/sO1yO
	 HLQ91/zpV3K6d/01wBCZW6cQnRkV3duSJswM3DN7UhUT0Ocfs6BoeMoxNLjU9nEkv3
	 JTmuS1iz0Rht2o26UFKlRPrNDDilurDtKi7nPylP/NRMgv8Jw5abECuZKGkBu8/SYd
	 iIYTGZtqcoBOCkn5lnPe4/kWGAzF7qQH2RQfSuBYbYVy4tfRhVqWJHPGAERkcuPTNR
	 Pb3cg6bl9bbWC+JOpFk6QONm4UuOzh0O6OHyUE3U7PlAJ8ATNgImjWmEvO2hSSReML
	 5bP3c1VS8YQYA==
Message-ID: <de187a23-ab35-4a18-824b-88879f9563ba@kernel.org>
Date: Sat, 14 Nov 2026 10:26:54 +0100
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
Subject: Re: [GIT PULL] memory: fixes: driver fixes for v7.4
To: soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
References: <20261113073632.34241-2-krzk@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261113073632.34241-2-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/11/2026 08:36, Krzysztof Kozlowski wrote:
> Hi Arnd and SoC folks,
> 
> A few less and more important fixes.  Sashiko as usually exaggerates and calls
> some of these "Critical" but exploitation likely requires already root
> privileges, e.g. through device unbind.  Cannot rule out chaining
> vulnerabilities these days, thus sending these as fixes.
> 
> Best regards,
> Krzysztof
> 

I forgot, there will be a conflict here with Linus' tree.
Resolution from linux-next should be corrected a bit:

- 	fsl_ifc_ctrl_dev = devm_kzalloc_obj(&dev->dev, *fsl_ifc_ctrl_dev);
- 	if (!fsl_ifc_ctrl_dev)
 -	ctrl = devm_kzalloc(&dev->dev, sizeof(*ctrl), GFP_KERNEL);
++	ctrl = devm_kzalloc_obj(&dev->dev, *ctrl);
+ 	if (!ctrl)
  		return -ENOMEM;

Best regards,
Krzysztof
