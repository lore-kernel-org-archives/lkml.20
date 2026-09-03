Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4CE4756AE;
	Thu,  3 Sep 2026 17:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456062; cv=none; b=DyBgAK73Ul2lEis8BSXXYOMiR3ZNL4XApPp6lgqH//pEgM56FBVlWFAoHsylAzUxh8XfD7ce/1wo97CZtPzGqWzyJQssqgNL9x6fhsemxReBqSFxkEtiPVOJhzzGmBhfjqDhaMjh0QpjAKCApri1zaeJ1Q/CN9c5MslWdj5f5Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456062; c=relaxed/simple;
	bh=RPVp3Eok60CQ1y9I6+e/qr0D/ikjVRNrKGdqAoLvPSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jtOHAmfKIjr8oYRWN8Y2dQIPMATFsfIGnyq4w9WrGuhBiEPGHOvNSRTRlR3kQOiExAML+fZaJUXeGIxAg5LM7rnB8E3TmjZ6wxw9GI/ANk+jey6yiJZM8QA/iGRVags95SwFeFcd4U6xiGUSvSng9KqHn3DltesWSnCgowPGfto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIwVm6Kh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIwVm6Kh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A055A1F000E9;
	Thu,  3 Sep 2026 17:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788456061;
	bh=1k6tuW/ciBVSbQl8Vf5+DPG1iOAOT47ZYsjcU2xrPhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dIwVm6Kh5nMEMmjm+xv5qaKThGOjH0dF7u38lS+0/WTbzZObJx2TjzKeZ9ppf2BC6
	 /trftdjjtc0zwIuTyP4V4Ab0dodsXpB6R9Qpnms0x2wts+vIIelxk07z1dkgOErihf
	 2RyIa87dFmSnL5hxQCgfgOVuqJyoAchgRiZcZq/ygAV5WSwjbOQCCmYLohXnoCgBpB
	 70lw6ZaFY9xhMd0yImVXIqhKSn2bnUtfwso0RRrf/oUR2m8ms5+6VkDzjeHcs+aOPJ
	 yuZoxZsAm5jRQB++BzCFxtFlGD3VaObDtuaJ9Hl2eGJKlfe5zgONX5lLHHN0qwCzRt
	 vifjn+CQ+eMfg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dale Whinham <daleyo@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: x1-denali: Add volume up/down GPIO keys
Date: Thu,  3 Sep 2026 12:20:33 -0500
Message-ID: <178845603576.348193.14415336391400939499.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902-surface-pro-11-volume-buttons-v3-1-9d41987bcd75@gmail.com>
References: <20260902-surface-pro-11-volume-buttons-v3-1-9d41987bcd75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 02 Sep 2026 20:07:16 +0100, Dale Whinham wrote:
> Configure gpio6 and gpio8 as volume up and volume down respectively, to
> enable the volume rocker located at the top of the screen.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1-denali: Add volume up/down GPIO keys
      commit: ea0ab3a7847a8c6710923e806f91de9d82b99aa8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
