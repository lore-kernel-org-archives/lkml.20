Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BAC3F4847;
	Fri, 11 Sep 2026 02:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093565; cv=none; b=Rm2BUP3uz5oIPKP6flNKyYUu5WOXZWS1acw2tGnr4q5bOGRVw7C5JVwz4dZSlCGwq/0+1pGUiOsYIRizWzW4h0THmS3NXKkYbengMvzpk5PW91pWkMguDvZwNczuX/dyGcRu2q3gu+XTiB2hU81t4mhuoAL7YaUgwmdAJH06zRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093565; c=relaxed/simple;
	bh=ZXv5cbn5DgnPtogVHQt3B2ZTeVD2M3jK6lpmFf0T1/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UCtAdu1JcYn5nFx2w70/O67oP+MnP2TEW+Zbbr6M7riOQ8q474vPotnkowiYptuN2fCgkut9VrKdKsoiri98YjmA9fX8mhZyFCprwZAbh7dMZii1pJHvw5iVuC5eWWWVH+dwe4TWSEy66jLZXFDNDHf5kBYQo7q0ik5JMNoPTm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZYQsfJj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZYQsfJj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4B21F00893;
	Fri, 11 Sep 2026 02:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789093564;
	bh=HbZ33zxH9ucCamvXpFqiLzNKK20/3EJ1hZHwExtKU6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CZYQsfJjnU3tv2xoosz403+6rcUf8ucWTLLW7PuJhs5RO8fVvNQqyUehDFmnq0LZf
	 CH67HFr5VioXZS9KgmrVgi5jUiYaaAFx13N4xseAltS5rBe16tUkiLiAGT+bF5GfHW
	 BarCUTdaUdmyB8osPl1bzBvPMgYh+ivZlCCeBuah4vECZ9y4JUZGr0RqDc2rUvB6n8
	 SXTu90v/fouh8jwU1nkf/7p6oJOUjeSS3eFc+oV0TtJ1CWTCM0NKOUPLRP27/NL8v0
	 PspuPkJFoUApGjMJaKby4oNXE05ArhOvvxtk6CFZh5gxkqkhmUCv8+3b9rq22QGxrY
	 X/zjGrycyKoLw==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop deprecated qcom,bus-id from SPMI nodes
Date: Thu, 10 Sep 2026 21:25:41 -0500
Message-ID: <178909353853.920241.4295114764028514099.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260830122633.203250-1-shengchao.guo@oss.qualcomm.com>
References: <20260830122633.203250-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 30 Aug 2026 20:26:33 +0800, Shawn Guo wrote:
> The qcom,bus-id property was deprecated by commit 345fbbca3f76
> ("dt-bindings: spmi: Deprecate qcom,bus-id"). The property is not
> referenced anywhere in the spmi-pmic-arb driver, so the value has
> no effect at all.
> 
> Drop it from the remaining users to avoid spreading.  No functional
> change intended.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: Drop deprecated qcom,bus-id from SPMI nodes
      commit: 0ba1e23cf0a92e36c5e99232dabd4be3bbea0618

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
