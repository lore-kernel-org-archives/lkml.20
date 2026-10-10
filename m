Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CF83AEB35
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791644829; cv=none; b=Yu1M6K12dNw53n2zsL1evzY6VK8jhAyiZCweTa/b5C8qf9qEFjJhAytYWygbYV4kdGRLqmN1s59rryolkRAREaHt9Ow5Mn16xIVA7jI/Qx/3W3ZPatT62bMOq8MI1NqjtuahL60KqzoaCF4clcq484Yoju6lbjSCRwCiFo2LeLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791644829; c=relaxed/simple;
	bh=/b1Vcj7w40bsAmKhOSi3kSUq/xNeq13MvQWcDEUImrc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JSaHcMQ+vWlkzy+EBgNUx7vxZuBrfGMi/NyH5AzzKqoTCjb/ecEtwkhiP9c8Bou59Oaa0nnkrTR1XINhLblqB7qkkPQTxSJ6XBGLWwSASuUn6w0zO+c74um7eM2QpVSTNhykfLEfsqkhTO4T809aOTxyCdd3nBP9SmyhRD1xN7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=jDFbn2F0; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="jDFbn2F0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1791644822; x=1791904022;
	bh=/b1Vcj7w40bsAmKhOSi3kSUq/xNeq13MvQWcDEUImrc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jDFbn2F0sUYoNcuxCaqoPmCJlaEF1uXdTkSR1mUxLxk7LC22BIEz9AeUIsQy6dHux
	 5qPm7OotNuGYu2u+ZrMvcMqWhaQZlJzfU01GYsRo+dUfkhvVnvqGvJe6ksE1MEGejs
	 5Wy0CS2IpOwWJEd+jDCzF8LtF/1XzlGzLdiiPeL3ATAMWLWfzD+o3y4Dga2ISkdmlJ
	 48tW0CzjlWQZOSGqPQf/qQQmP+0rOmlQi/9A8O7CKpxAXM/oDQbrMfEKKO9kB/zPjN
	 LdRXLMxVcMflfBJ7Lu98veCu7e+yQ+OoKgcaZMKrmXkbb9rqRKzS4YXG8ue1FD1A/k
	 6UNSc27HXinNg==
Date: Sat, 10 Oct 2026 15:06:59 +0000
To: Stephan Gerhold <stephan.gerhold@linaro.org>
From: Alex R <alex@ironrobin.net>
Cc: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] platform: arm64: Add Lenovo ThinkPad X13s EC driver
Message-ID: <1dfc1b67-3bcd-409f-9a9a-d9061abe76c9@ironrobin.net>
In-Reply-To: <asNZw4mFy_xOmCVD@linaro.org>
References: <20261002154231.31376-1-alex@ironrobin.net> <20261002154231.31376-3-alex@ironrobin.net> <asNZw4mFy_xOmCVD@linaro.org>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: 8175722ec708fc249ed3657dccd9f24220f59fb0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 10/5/26 3:03 AM, Stephan Gerhold wrote:
> I'm mostly just curious, is the input/hotkey functionality in the T14s
> EC driver not relevant for the X13s or did you omit it because you don't
> need it and/or to keep the initial driver more simple? It seems to be
> present in the X13s ACPI similar to the T14s.

The X13s does have EC-generated hotkey events similar to the T14s.
I left the input functionality out intentionally to keep the initial
driver focused on keyboard-backlight control and power management.

I've identified several X13s event codes in the ACPI DSDT, including
the programmable F12 key and call-control keys. I think it makes sense
to add input support as a follow-up once the event mappings and
expected behavior have been verified on hardware.

Thanks,
Alex


