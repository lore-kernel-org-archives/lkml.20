Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794570125;
	b=MMIprvhj8MjLerNQGzmXTTy348B0KU7rDOge0SJHoz564oevK94FnDohjWJh5rorBhQd
	 d7JOIH3EjHL/Pm20cIG6COLwnkXAxBOs1domktPRqPloRxP3nbj+Jt4IqG3gFITOAyGd2
	 xET0Stmso8v6kMFdgB3TfxL1Umwg07+WO/f7DZbAl0VRpQLR8gCh6nlO0elhb/hLPRTNl
	 SJ+RLMcVi4qdBLXYDCLCxIb16k3ay75uswZVOkz6/wk+XfWqEeDwhyrm+/4AVB53KLbuo
	 1qKXOPpAoVIfgI/conD8PHEVejsE2dHcfREi5zW9xL6PpLf0cdnvnKMFbO/Zf3hGkaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794570125;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=STOZHgORR56mup7ACptT8lJgK+KGUY1txL6Q1NiE85U=;
	b=kZPGRI1o5aw9046nVlwHxoy0VcclgJDr3AMx47oJGxsyErOKYSXCexoWiXnAF2iYEWLn
	 DOAa4vrtjO631nKcAqjgKJntnF5v4KLZDVsy6SVWKjZ3f+TdtSZMzxBuXoGy3pK6OhMIn
	 M8QY+mm9c9xl99YGVxtV8wAye4MaeZtuJy2FlOmHC3ZMq9qhlY+ONUqoqJ/iN4D1tqvic
	 fMWZ9enT3WVBWtVIY9uuUUeV0bQl0cfyI56P5AJ+KKqaV7SJZNgJWl5omDFd/1ddpXwg5
	 HL1hcQSvLfNsnxCYqMT7LECS3fhs0zIBoIcCJPQiLR6V3eSnP3EG3bWyQhg5lR9n5Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GZ9qwXyE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4EF606A323;
	Fri, 13 Nov 2026 11:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GZ9qwXyE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF181F000C4;
	Fri, 13 Nov 2026 11:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794570124;
	bh=STOZHgORR56mup7ACptT8lJgK+KGUY1txL6Q1NiE85U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GZ9qwXyEdUFYupkuUoe7hVmocRKsdQShR+YS5IZ/zmhT/VQTw3t5f4PjRjH6pChJv
	 r3HIQVcF2YHOw8YjF9ukQVdO9nSR5ohfLCscCS1sowtMhYr4Pmr4OgeG+SBvmpCnUu
	 9jJVxZxNeCEtQJfqgPcdIjmj7uoC8SwoPAyedrpiwQn7DCAAWKhdC4RC+ZbaOE9PaJ
	 UBVhilZP4muAbzLlqQyYtmqbRPAzAfWb3paxB0ttLU9NsT6N182ov+BDJAeCZOBeGG
	 d3JugP6S/boeO5Ltag9n91YQg9nnMEe9MP3jN9syHsm9zHWqxhtJtnCcp7YTWtmgAO
	 uLfQU47BNiyHQ==
Date: Fri, 13 Nov 2026 12:42:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: Add MSM8996 SAW3 compatible
Message-ID: <20261113-inventive-diamond-wren-a8a0ae@quoll>
References: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
 <45da00b9-c7f5-4c4a-a310-00c2ba94cf6e@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <45da00b9-c7f5-4c4a-a310-00c2ba94cf6e@oss.qualcomm.com>

On Fri, Nov 13, 2026 at 08:52:08AM +0100, Konrad Dybcio wrote:
> On 11/12/26 9:26 PM, Rob Herring (Arm) wrote:
> > 'syscon' nodes are required to have specific compatibles, but the 
> > MSM8996 SAW3 nodes are lacking one. This series adds one.
> > 
> > The binding should be applied with the dts changes to avoid new 
> > warnings.
> > 
> > Rob
> 
> I know this has been a thorn in our side for a long long time.
> 
> I believe +Dmitry had recently come up with some patches to describe
> it "properly" - are they any different from this series, Dmitry?

Let's get existing warnings fixed finally...

Best regards,
Krzysztof

