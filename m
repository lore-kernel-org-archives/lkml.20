Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD5B3F105B;
	Fri, 11 Sep 2026 02:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093564; cv=none; b=q2+BRR+mVfd6H7ImpaIzaCsI3RtFJE5MHrqYYGxdPfLrqVEpRv5bwXrAfUIIhMHgg0ep0gQVsLTKaGxoEAuLsyIcEZtrG5yql7QsygyRwbRU/TSfU6Ueoa7tg6fsRYY1kIxDmRqg2zM/6oOdhsv13hmLy70dsS6XuzHKnszcFjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093564; c=relaxed/simple;
	bh=aEnyVZ503oKK0GclRjfd0ZbVHxTBe5mGbzG095GM/rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oz2YKS1MerkMWZd0X54YNbzxS/6vdjD8MDpaUVjRv+O2h4NE1gOHIh9M1Jn7RhSXNXzUEOIhd8w7xW0k0AHp+sZnhvmiNj/ElVogEAmw3xaGnnRab0Jo6ii6rABlk+va41ld3Tf19BzWqFhriCB3vAA+RJwqT3Irg8nkG/Cic+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frtR3+Cu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frtR3+Cu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 150F31F00898;
	Fri, 11 Sep 2026 02:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789093562;
	bh=G+7tbsW8GhE8Dl3WQ6Y24WskdmuX6RT7fYcuY2w71k4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=frtR3+CuF+2CyZjh0ovDxpsb0yeESoUcaVrx14ZbvfOKDatMksLU1VI98WD4FoLc7
	 eljQYTGnBavAQs6zP5QCNzPjLZyBtFI0FfZpbGYiFUTEmLQV4esYIAzpCS5HAuVwKA
	 js1SttPVw5Colna9PH2c9HXNWFA5MCeGqidMXbsBOQONN2N/geuCe4OOiNZCfxwm+T
	 di5bnETLtre0RsCWD7TE9uTVT/XoxKNesPLd4bwT86CXuaxjcojLziyXvPrm3/7/oK
	 KXeAFxg5tdy60yVfM3v8nTrNkzUan0GJDyU5kORw79lbyKCwUyS0Fua+qy1mmE0Ny3
	 W8j0X0ngyCY9Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Disable PMK8350 PON
Date: Thu, 10 Sep 2026 21:25:39 -0500
Message-ID: <178909353851.920241.10380182243705071206.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901-fp4-pmk8350-pon-v1-1-e05937e9c860@fairphone.com>
References: <20260901-fp4-pmk8350-pon-v1-1-e05937e9c860@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 01 Sep 2026 11:06:13 +0200, Luca Weiss wrote:
> Two PMICs on this phone have a PON block, the PM6350 and PMK8350. Only
> one should be enabled at one time, so disable PMK8350 PON and keep the
> PM6350 PON.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm7225-fairphone-fp4: Disable PMK8350 PON
      commit: 5c088a33e3a9bb236c475b7230df275fc1e51eda

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
