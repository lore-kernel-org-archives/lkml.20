Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E574472092;
	Mon, 31 Aug 2026 14:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188238; cv=none; b=NDMweFiZpDSCoT31izor1ZaF00GB7vse9Trxc8lBTUBzg75hr2vgI39FfgRB9IlWqwDHs458ZyEEt00GmD0emVfRPhK8FyHIQ+kou50+xNDml0oEoJAbQXlmuiy5FTjTyuEGUkNbZ4iKVqYiILPngUSAtYC2hMWd28lpbRsNIDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188238; c=relaxed/simple;
	bh=FZ37zQuw6LjIz2uJ6LR1FnCjpZdTcWz5811W6kjMOzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GA5wSlqSvmJedwcyo7oJApIasy9Xwl3vQXoLNTR4/6Ec5CF67VdpIH/Z07SFb2AKI4Vjlhu4PuFBFNRcQi60tvbs1tPetoen6kVkHxDj0qfSne9vgDagQwsdtNW9+joHZK7m4StTgTAAGCa/9bYAzXzXJMFh3+Q+eSFEgbibd5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C45QgKJR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C45QgKJR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77BB61F00A3D;
	Mon, 31 Aug 2026 14:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788188236;
	bh=efS67w8JBcfKepMSHIedAFFvdchsCgk3t+GdosBXlkk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C45QgKJRPwURmIpR0wBdsLOqBuE7eBc4QECh6Kk5zEuNUVUN5DmCmZSTf8L8m8+to
	 1OORzu63hPxtrHZ3pS0hpRPg94JiVJfdBYaCe8YYdsU0oqZ7GaAVz09r6dqxfUszGh
	 dmdc2xINLdjEuhyo8aTiWFhalgu7Ls9vbyvCb8XqjuCJQ/xvCqBeYJDUYCwAoRoQ0o
	 J03dDGTI0c8sOefN62BAJxf0B/E+iAiVFg8aKX/lAQZYSDF32rj8Vu6rZq9V/0Cmb0
	 st2xRYRUqdLSN918d6hU7waepIp+52cBmERetxoLuoBsaVVf2m3tJ/0XXN++Pq6ZvE
	 61ya5t0hxmoHg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Ananthu C V <ananthu.cv@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/3] X2 Elite HP EliteBook X G2q support
Date: Mon, 31 Aug 2026 09:57:09 -0500
Message-ID: <178818822455.1120617.6748433975122859175.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
References: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 29 Aug 2026 12:08:07 -0700, Jason Pettit wrote:
> This series adds initial device-tree support for the HP EliteBook X G2q 14"
> Next Gen AI PC (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite
> (Glymur) laptop.
> 
> The board was brought up and validated on real hardware. The electrical
> description (PMIC rails, PHY supplies) was verified against the live unit
> rather than copied from a Glymur CRD.
> 
> [...]

Applied, thanks!

[3/3] firmware: qcom: scm: Allow QSEECOM on HP EliteBook X G2q 14 AI
      commit: 665d237915193b06d3026da367040e4a4f3356ba

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
