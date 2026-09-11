Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC6A3EFD21;
	Fri, 11 Sep 2026 02:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093563; cv=none; b=HbnULrApmrgFWH4T2+SZ4yIFOep8gIovBsxqM2KnIYp2mvrRxLlKc9hIQ1KWbdMsD0ppYbim5zPeSs+udvIN5JNqEc15L+eALAhoRDMi7Eebl5M9tSGtPWzrJUoDj6Fjkxgksv0sBo0qHzyNmFcCD6hvnhyy4o+IBTx1NbGUvaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093563; c=relaxed/simple;
	bh=s5dbZPM4dhlBZ2Kd/HSVcMxXVBqIO71o8aHk4ra8/ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U76DiMTg2xgdsFr6puMACp4ULUQf/Iqx+2x7wfgFfib7AHMz7KACV0DIcZUhOPyy0G2iMo1qYNFJPRus/Q65c1SrLyfzPjtt747aK7ttCuGJ6m9P3EowaX/BRDrZ85nOC6wFqX14PTuGz3Sp5oEcMpsIeyy+lPbGSzUQI0JQNgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETeJFJXs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETeJFJXs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374351F00893;
	Fri, 11 Sep 2026 02:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789093561;
	bh=9W5MMWSrx6vH0nXH2gneLeOm4A6SMd07kHAGzx4rcw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ETeJFJXsX78P7upxxdbpt/HnPX0o6z9xHLLT5dKCDw1UXqS+9d2oX6u/aY6ADB4qP
	 7aQnMy+PWF2OSP3rSY0PEEhfErLFEpXh9qRT5bhhpKHfTdNUMHHa66l1Jlto1eLI5A
	 3mQNS/3V+qdAA8o0HgT6aJtKVReyFZ5kjUrvsmJ/7T3Nf/0ooIrcGsyASa6NzxE/66
	 OFW3Ht8C7XwKB9ppHm+iKrWnBRlsDxVWcLcS3qsUvHa7/7LwPBXsb18FyTOMj/mlLf
	 OcBzr2fNMTO8ZnQxMauA0B0aqnpHeiszaqV/KBvg0lqJul6ssL0/9NQR9BgDz8BRhL
	 e6gSL6VAJEbjw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: Drop NOP override
Date: Thu, 10 Sep 2026 21:25:38 -0500
Message-ID: <178909353844.920241.8714672832874657458.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907-topic-medion_touchup-v1-1-10267ae55aae@oss.qualcomm.com>
References: <20260907-topic-medion_touchup-v1-1-10267ae55aae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 07 Sep 2026 11:01:17 +0200, Konrad Dybcio wrote:
> Commit d12cd85a4ff4 ("arm64: dts: qcom: hamoa: Add sound DAI prefixes
> for DP") took care of adding the prefixes for all Hamoa devices, drop
> the unnecessary override.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: Drop NOP override
      commit: abc13fc5ee7f94af0ce982fc4e0a628d859b2614

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
