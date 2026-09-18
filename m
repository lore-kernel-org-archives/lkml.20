Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D6251FCBB;
	Fri, 18 Sep 2026 20:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789763647; cv=none; b=MUE6JH0C2/kpseSlomPh43gwZZek3gMdfBiDnz2DdazfFU4fLD1DcUFwUPxHU4h6+LuKC7KRvQRvL7BYnUSzlKzIpILQU2Qww1RyKVEJgBLsi59pWdSub6EZtyJwv/W6sWuet8Xf8CHmuG1FtUwOkXDhfawxRwBSFA3rZ2eVrhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789763647; c=relaxed/simple;
	bh=cBKQONdshAJXM6/gb+YgGSbqiMy75fyyKnNMeQ/Be5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ik5wy/sMfgPiQa7uRuOs2OsFIoMNXg3rwlSsgNyCQZtYO2BtiqoDg2GncZ8slxUg2a7OQtu/WYZKVOLtMKo46Bx7f6CJR7+XV2yhpgazeDliMDti9eoJallgC+iE4OtysYQ/zmJnKCJ4G4ZWVIjpMeGtwaaC3qJux5XrpBtzPw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZyVvVuS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZyVvVuS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CEC1F000FF;
	Fri, 18 Sep 2026 20:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789763646;
	bh=EU4D9e7ez7H8tffRc2UKHpYD4iiRbdWWwGGar/naEgM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BZyVvVuSq1vV3LixrKU/8CIzcqHuFS4LroaQ3R7w1/o4SDus5cGFnOVp3z6Uu6ovv
	 2f3IvRMGPqVZlyL1jZ9+frjB3jfsjkjXAB/bG/R26R+juiZC2+kTOKHKckXNdetdol
	 I27e+vplcOuhmZzvnIFhpnlPZlunM5ZKGUVe4q/zeeng+CbxGIv9vujvzNfM08Kg5m
	 FLBYHBj3SMbRh60ijCgZpwBz6tZgrb5PiysoYafdluLwVF0Ue5hoXsgbRAwCvbtwmB
	 jxm2S7QcH8NM+1YJJ2ArsitUbS3RgCsX67sllT+2ppOJAezNvErWit8cg1PdOVUe9z
	 KRAzH2LL1DLwg==
Message-ID: <96294c65-171e-48e4-9938-9f321b4c5e6c@kernel.org>
Date: Fri, 18 Sep 2026 21:34:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] Correctly use TX macro v9.4 for SC7280 / Kodiak
To: Luca Weiss <luca.weiss@fairphone.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/26/26 4:29 PM, Luca Weiss wrote:
> As a bit of a note where I'm coming from, I'm working on microphone
> bringup for qcm6490-fairphone-fp5 where so far we've been using
> qcom,sm8450-lpass-tx-macro to get the correct control names. I've tried
> reverting to sc7280-lpass-tx-macro, updating audio-routing in dts and
> UCM to the v9.0 names and it does seem that microphone (AMIC1) is
> working with that, but I'm not particularly happy about leaving the
> wrong control names everywhere, so I'm happy to try and untangle this
> situation.
Are you referring to the enum values that go into "TX SMIC MUX" mixer
control?

if this is the problem, i think we could use values instead of enum in
your setup. They do endup in the same register.

However I do acknowledge the issue.

pl let me know your thoughts.

> 
> I'm also not sure where this v9.x actually comes from, maybe I'm lacking
> some documentation, downstream kernel only refers to Bolero v1.x and
> v2.x so these seems to be a completely different versioning system.
Am not sure how we ended up using lpass versions instead of codec
version in tx, this is a redundant to codec version. I want to clean
that up at somepoint.

--srini

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

