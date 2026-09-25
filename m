Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC10A47799D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790373278; cv=none; b=Wsd65a26cjC8EQSdIOzD4lXkYy8w+3ToXrq6JJtWKYTDMMY+o9UBUyGDo5p3Tp9XTj6SX5U1/PZZectlF/ApfXJ7eOI0Lfyis7GQ11l8HVzo6iFD7NiWM0yQe1pgJdp9levvt+AUyIs1JKJIzuYTAQBUs8RD/hdhAOLGcuEInhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790373278; c=relaxed/simple;
	bh=dh5D3G836DUj2lo2Ng6i8fYgw0FVBnlELE3fvOwftbE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XFP9EP70mNVQOJzSCGedWuSmDuIie6H0z4jn6Wc8DKbuRuCzHkBCuBb9+DSl7vDW/py9T/8V1uJPLoiEcdUzR1EJJ0VO/hCSe0BDG/bqR5rH3+utj8A6zVO9oxQ1FKVu+39hSBRfTISNk2y/41PdEHkN9LbCX6LsA9gGAxKoVfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=RfY4ixGe; arc=none smtp.client-ip=109.224.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="RfY4ixGe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1790373265; x=1790632465;
	bh=ErF7CfE2J2KkQtLXok6mhVam2RRVJtrfwuAWVpvttw8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=RfY4ixGeeqbIgW6Ps5HNNRwWQZQqaalQsPRQOqylEjHFYYveDPqWbsT3BbT2PCukC
	 dgMI/3XcBWhOAnpvkdY46YmmULKBza51EHpecGYZ96jOdFTuvdWlpmpzQe14+izML+
	 Keb+IrMyQWfxHVVeJTcvux4IPv/mnp+iDZARYNgj0jbo9hGFNXn+ZWTQy55dzw0aGh
	 7Sxfr3NzuHM3XDdsvkyHWVC91/6Gws0ZiFLUWMDJOM2nOX/2Iwvha9cUv2VrzcPRh7
	 y5VrRbPg2MgTzdkinVz4pUIDfcmxhgiSnuvU5YRokqid/CUanlQrznSOiD6144W2J2
	 hsBABMSZnHIzg==
Date: Fri, 25 Sep 2026 21:54:20 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Clover <alex@ironrobin.net>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Lenovo ThinkPad X13s embedded controller support
Message-ID: <20260925215358.33417-1-alex@ironrobin.net>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: 5c58b5ca42a24e4d87b2ec8efb1ab51cb726a9f6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add support for the embedded controller found in the Lenovo ThinkPad X13s.

The X13s EC uses an I2C command transport similar to the ThinkPad T14s EC,
but its event, keyboard backlight, and power-management interfaces differ
enough to warrant a separate driver.

The EC event interrupt is provided by GPIO103. GPIO176 is a separate
host-controlled power-state signal used during low-power transitions. The
driver follows the EC command and GPIO sequencing described by the X13s
ACPI DSDT and defers EC event queries during suspend until the I2C
controller is available again on resume.

This initial series provides EC transport and power-management support,
wake handling, and keyboard-backlight control. Other EC events have been
left for follow-up work rather than exposing unverified input mappings.

This follows earlier X13s EC work by Konrad Dybcio and Steev Klimaszewski.

Development was assisted by an LLM, including analysis of the decompiled
X13s ACPI DSDT and review of the resulting implementation. The resulting
behavior was verified against the hardware.

This series is based on Linux v7.3-rc4.

The series has been tested on a Lenovo ThinkPad X13s, including keyboard
backlight control and firmware-driven brightness changes, s2idle
suspend/resume, keyboard-backlight state restoration, and wake from EC
events.

The binding passes dt_binding_check. The X13s DTB has also been validated
against the binding, and the driver builds cleanly with W=3D1.

Clover (3):
  dt-bindings: embedded-controller: Add Lenovo ThinkPad X13s EC
  platform: arm64: Add Lenovo ThinkPad X13s EC driver
  arm64: dts: qcom: sc8280xp-x13s: Add embedded controller

