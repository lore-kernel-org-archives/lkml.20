Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788601;
	b=snoilXcJiGPrMS+tn5nThry4Pyh0YcMZXb2kQAHK/l227k66Qoon/d+Oous54Jmbzt74
	 0oOBs89fQUBpl07RBVeiPs/aTLGy7O4xG//5bMttLSiOUpzBN/DXs4kyS4We5PzVg0C2G
	 jdkl9079mcTV9M+oOxLiNc/qAG3V/GvKQMwfv5YJ+T6O8Vlmw5Bu3tmnclC0pkv8Xa3NA
	 WopJGga7NVh79b1RIpQp+MbKN4Cm0+qLOFvP+EWuGKY8fv2Ev3aviGTXfwGRTK4CQE/vW
	 3mcjIA86YN5u/8wEoJcPjpykANq3F952wr/nc/yCK70XGkLgj4Two2ylHOpkMuf00Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788601;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7xs051A0b1SAUv+rE0HjsXwijD7VREHWOEbFF1iPWaE=;
	b=zEglmUEiWfpWjiIUxT/FlGbNxP+SmO/xf/c9vIvPiF3XJwL3xiuK0RWJNo+dqNJnUp8u
	 hs4h3J2P7yEb46rrEsA/mpQLKLhZ21DEnQ3bpK6tSOtgFpg6ZfzFS/yxUX/syRnHgilCR
	 dKrG0uYbZjmTS6dHMpNAUhfb947eJRmgbrktNPu6U5sblTrZ+lJVMfn6BuNsUqYYmLSOY
	 s/DmqZRriYuvmZ3pFf0MkEp1uE8gTGVxOhClIXNWF0Va+tbGzDtIxVNOusRSMc2lzpyI5
	 Ej1aQU78O8JH+5MxLqIzhC3qWf7WFzl/gHUnTSQzfWftQGGHOoBXlWpxgFcogKBsEoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=moiGF31v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 0F876606A31B;
	Wed,  4 Nov 2026 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=moiGF31v
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id AF44D1F0093A;
	Wed,  4 Nov 2026 10:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793788600;
	bh=7xs051A0b1SAUv+rE0HjsXwijD7VREHWOEbFF1iPWaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=moiGF31vVwpXcWU7P8yz82pqeIdvcyqE5bcOAiFaMdvkIWGEZxJeqs1WdJTltenqi
	 PvMEKKYEgt1w4P1SfwOJ3vrzVRCqLeF4+CevFyMZg9NtW46b5O7dSp9c9qUtWMnTne
	 xjxcMDVS6De0tGEnb/8FEBbmt+nhjiwUuU/sCXFsWhUsehHiZHa0Nh1qT2p39vBj6B
	 q7QrbllExErywEG0oaqsrKslMbJJr4cEKpQVb5By6N4Ya6C3JX+/lBz/8GZHRwmJHn
	 qhcI/1LeMyWwmbv2aOiM9L5ho3OsXUBYPY95LA//bRE8kBEy7bdO1Z2cKP62XQvFnC
	 iQNTr9ftb3Waw==
Date: Wed, 4 Nov 2026 11:36:36 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/2] arm64: dts: qcom: nord: Add ADC-TM thermistor
 channels
Message-ID: <tfi4pafzpumndendstaiaokq2edfsuiyrctxtzl5oufwqweuek@ckyouxst4kqf>
References: <20261103135445.2049110-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103135445.2049110-1-shengchao.guo@oss.qualcomm.com>

On Tue, Nov 03, 2026 at 09:54:43PM +0800, Shawn Guo wrote:
> Add the three board thermistors wired to PMAU0102 (Kai_MV) AMUX pins on
> Nord Ride and RRD: SDRAM3 (Kai E AMUX1), SDRAM1 (Kai I AMUX1)
> and UFS (Kai I AMUX2).
> 

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
