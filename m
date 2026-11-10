Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285315;
	b=DR9KCJb/xzSoEsFLBUk6BaNldDCAriz28R+ebDr5O2d1i8yFcfMXXVro87tYWbULQoKS
	 u3pWW9TGX3oqkCnPcIP+xxHW5lWtpxm/x9g5igBtg04R/lOm6L+McZFHqjQ7WbVZ7nNCS
	 oNsHTihXJGybyELZS6azGcxMafQGWTlVr+jiNHEAro7qOOf7xTAXUCCnCmRcrATc9rfAv
	 E3lA/kGi2i/1zypyUEbn9Fj+G3yrG8QOaSBGSjLqcTIa1oaFmzmerlOglp84zRqYFhOBY
	 SKmDgyX2CBhrWGacuKSsgyfINxzuJxQOxAPVM6D2kzYJIWhnxvfXFw6FFr32/61mXLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285315;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Y+y+dw/7F9ePtYFx0DkrH6qgsrA6IQQMbAKMyMiMpck=;
	b=4XfDLfhqdzaoH6rZTgqc5/ZW+odsecuGpldIPW7iSnlZ4QvbZ6g/L5+iOIVYNPzuDs4q
	 MR+may369tNXoNgFiY2UdWsoTJsl2bSV+iqNXt0zcKzPNcpNE7WjoKNQwDwhRgxS0qsyf
	 huAdnDZ7ma/OTEaYsCrIzGxNH4RF7t3iR43kDF8JUmH9ZN3MCO0mXWntoezPL7mf9A5FP
	 PWoUABCf8LEzAG64J+voq7IkSy6NEIIiG431/XxkXDYimNX08HZS7EhcWHhlx5k0jMlP2
	 n0huG5T7zCX6brYxb5IfQdN6c9CH3tgybWgSVByOqosEEkwAXJGk3edKzIsSyryO9oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QAjRDM1Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937B260A2616;
	Tue, 10 Nov 2026 04:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QAjRDM1Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3191F008A5;
	Tue, 10 Nov 2026 04:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285315;
	bh=Y+y+dw/7F9ePtYFx0DkrH6qgsrA6IQQMbAKMyMiMpck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QAjRDM1ZQ2uWIew7HTdjExTJeN/CQ5VzvY2lLry0aYesvqxZN4eGLnI2ymJ47oigj
	 uGxSlGoMC+sTxCG0iZynv9ln2vK+KjGPrPcWlItocyqzPt6FJGFLBM/Hf3GBh9G4Ng
	 KxSTblbJsnTIk97+AYmHSzgxkTebV2Lxo1dVF5sIOwNYdU7RwoLjYmowzUsA8KXwlP
	 nQ6V7CN1z7t2YIgBkiPrn/wvYf9g2dwoO6C0maVNxVPYxRdLol9+N8x/C4rvQvm8n8
	 olaincQ2UPhkVscKMh+YauAiVUgkeT4+dm9Drp3qW5ZLA10NRUudu+rRkxRevTQJA9
	 1N76Z/QSgjj1A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Sajna <sajattack@postmarketos.org>
Cc: David Heidelberg <david@ixit.cz>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-lg: Enable NFC
Date: Mon,  9 Nov 2026 22:34:56 -0600
Message-ID: <179428529344.1061455.14898677998626512432.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906-sdm845-lg-judy-nfc-v2-1-63aeb7b1a5f6@postmarketos.org>
References: <20260906-sdm845-lg-judy-nfc-v2-1-63aeb7b1a5f6@postmarketos.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 06 Sep 2026 14:11:08 -0700, Paul Sajna wrote:
> Add the i2c and tlmm nodes to support the NXP PN547 NFC chip
> 
> Downstream dtsi for reference:
> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judyln_lao_com/sdm845-judyln_lao_com-nfc.dtsi

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-lg: Enable NFC
      commit: b115248511aedffd43b82e1cae196c6836fcfe83

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
