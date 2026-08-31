Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D536548C41F;
	Mon, 31 Aug 2026 17:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198853; cv=none; b=Q6o1iaeTE+DxjQVmIt2a7p1rSJSjTl2YVSZZlOkHFikiPrKXAMwA/Ox2trDfBN5wfAdFpJl5EU9osxDYhjXGKj5SuOa125/IfFOk72eD+aZqDoqrwIGyqydpACC0TOx3KuMPbVmugjtgSI2QI3eVs/LmWCVv39sfVQOaP/TjM/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198853; c=relaxed/simple;
	bh=/ueHNqLR4UJCXRbTYAZBzOzuZY0pxGFUc5jn/sYKTVo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bFGiarJPXzjLFSjLk82HfzDdi1yk4xfdsZVb1VckkPid42yKyyGBgEScpJiM7Q7BPOXIRDseWc5K7LaZx4+XZ0ui5kHsYWVxQY3BFy05U2U2jS+uGmkk4DrlEqeDPUJAQZu/bIpP28Y0jjuE2bddLv2rREPjp8rMvQ5q7Xhwq6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Znv6/U5z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Znv6/U5z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1541F00ACA;
	Mon, 31 Aug 2026 17:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198851;
	bh=0HVJEoxA8LBhxU/e8FakaSbpBwrUQeFVjKExtuLt8rw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Znv6/U5z6VzBoulp32N7swhMu1LM1XULUB5H+9UJb7QVVFrKZS4Or/LFb5qWXndE1
	 JVq+p7jLsqzqgn9D/BZW+y1mW98N6oRmBGYA6rBhSK5BBUzdDWDHomYx22JfK/dO/r
	 pP9+NWkeACLewl3GV9draSQmSxWn47GDgj+/1ppn352AzKKZZ7ziXHU4a/cS+ahqgl
	 DfiGV1j+WP/2eOQ8JSCcn5vB/WUPnwGUJao43ermNX1dYa137ev5daX72EdVTHERvC
	 0hVmLCGIYfTKlKViEOEsQ5LkUQRN+yiNk+ksjZShFD9uKq5eT3z0Mx7HT0nxMM5ZwI
	 srAem5i8f7dVg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: Drop redundant status=okay
Date: Mon, 31 Aug 2026 12:53:40 -0500
Message-ID: <178819882980.1411250.4209639959173164972.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827215001.34184-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260827215001.34184-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Aug 2026 23:50:02 +0200, Krzysztof Kozlowski wrote:
> New nodes does not need to set the status as "okay", so drop one from
> fuel gauge.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-oneplus: Drop redundant status=okay
      commit: 9b2bd56577a068f864114e3944ea5fb2b0b22ae5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
