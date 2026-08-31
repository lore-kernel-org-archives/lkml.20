Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195C844A72C;
	Mon, 31 Aug 2026 17:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198846; cv=none; b=EPqTBGlVSk7gpkTOvfUo/25lBcpKoOwVIu77e8UU3hh0ldUcWc/teRD4o5X8gCf6redHaL/istTL6G/SSS/h45eJwY9+/NOLxyBDUwqMOKaCBGiAGiIAIiOTHmHDXdl7C2AuhIhBFJL+jTGiBcTPJIfudhiU2+udASD6cGvLI2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198846; c=relaxed/simple;
	bh=w7Qc5odkfU7dhmCGXT5lNlxgn57jw9ryfmWU8OcPElM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=teNnb8966pRtWI93qfIMs45oRUqE/CKl/yBs8xbGdlLfSgghqtXb2TRsiOnqCNOUbs4jvWDFwt3vfFgZ2TedmqmxnYchAU5U7VSeJSWNGC3ep8IBTZ49m4MQFs+uz3lR9IrR1iixb2NP7W/Ic4FSRDmnHE1ctr1jcLvnoJBGBRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4NkHY/j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4NkHY/j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB091F00A3F;
	Mon, 31 Aug 2026 17:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198844;
	bh=7W+sz2DVY7cjpV2JikLk2hDeUrF+px4VEP8KVSWwHM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R4NkHY/jSy7kNdoGDU1E5yUQ8eyyT4K+vhkKhh3SCRpD2bk/OrKjvnPnBRQk3TtUP
	 1dSXwJrjHPauvx2nYZ1g/dK8jWiaSMKCk7WXaDc/oNU45PyKI3Jnsvt5ie3iCtdksu
	 MnU63bUIe28eVv/brC6ApYhaepEdh2xlUR7fLqY+FSe7vEjX0m5WWl7xTK4zWlbfwh
	 tJZ8TsgWH2o3qX/RWm67S3vgUE3DIHoOpokld7pUeMGjQgZ8Z22yDHOl662MVuiz9Q
	 B297QRe8VzDw7W7q6nC02QeSZ5jaQLiLf7LaAYZEVSDIbiPukGiKEbZO91CmKfVn3r
	 QXIWH1pCmWHKw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugene Lepshy <fekz115@gmail.com>,
	Vasiliy Doylov <neko@altlinux.org>,
	Achill Gilgenast <achill@achill.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Danila Tikhonov <danila@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] arm64: dts: qcom: sm7325-nothing-spacewar: Add ath11k calibration-variant
Date: Mon, 31 Aug 2026 12:53:31 -0500
Message-ID: <178819882995.1411250.2529732150000383403.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802133203.259734-1-danila@mainlining.org>
References: <20260802133203.259734-1-danila@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 02 Aug 2026 16:32:03 +0300, Danila Tikhonov wrote:
> The Nothing Phone (1) has its own calibration files for the WCN6750 used
> with the ath11k driver. Add the calibration variant name to the DTS so
> that the appropriate calibration files can be loaded from
> linux-firmware.
> 
> Nothing capitalizes its codenames, so the capitalization is intentional.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm7325-nothing-spacewar: Add ath11k calibration-variant
      commit: 5be53952fda81a465fbd5fd564b04f38b4a62243

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
