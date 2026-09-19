Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50257353A77;
	Sat, 19 Sep 2026 06:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789800256; cv=none; b=do/UjQ0yRa6fTEpoUxgqYsrCfrsknALow3vuXBf2C3NaM/1I6UAe3NfebAaJZKvcD0uLYmZxM/62vEQC5nXr92m1cw6Qw9mI1UncIV9gJHkljZYdG5r5x8bnkeECK7QLnQSkJeJUg71OLW1v7b383sN7UzOvpRt2I+C5w2iySoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789800256; c=relaxed/simple;
	bh=tRpnn7B1S8yUXwP3RW0Gao8BTXc54a3NBWvxda/4zBs=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=P5vZbQCtEnFoQLm3AMX2Tn3/xVPDn4DdCKWFqZfnQ6b74HHqvU0OstbVzmyHkZaMmEfqhsp13eGRsiVZ5E/2uipw4/IVXuqlcsqLTAbo6vn3NukWz4I3t3D3E5MsR7i7CNcpixrbHxV6ObcFlHLk5Cg0qkpsd5ZUJ9VWXLU0/DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D35f+li7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D35f+li7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861481F00898;
	Sat, 19 Sep 2026 06:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789800254;
	bh=s5Qf08rt7RhnDk+oG0hFeCpzPo8CK967UbgB5K8XD5U=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=D35f+li74dURxuhVPekKJvoii6+Z8p38wN1TmC/IFORM2omMtmhxkiCAXFxXF53+X
	 R/tez1hdfk238RpQ7huO8foyqK1XTxNs5gXypf+QqxOgzKHz/kbMEfomHPApt8jC1O
	 onlca6ahew51RVqnOKZgx2UuJDYtNAu8OQB/o0uSoGMqUgmAWuZ/S/55Qj6exIrzmQ
	 TxAaWugPvB4hjWGLwCiGRP3FBinHn4SACIY2s8D6wKIIavhnnzNhKu/kxfcrqvDI8+
	 4NEPMJtyaM26icyA+Km55eHS/bwmiRQsch1KgfIAldWxvFVnI/IAvBvtJKJGK/yyLB
	 0h8q7TIi75Vlg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829193920.107498-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829193920.107498-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: cavium: thunder-88xx: Replace spaces
 indentation with tabs
Message-Id: <178980025326.89886.9207732049793115663.b4-ty@b4>
Date: Sat, 19 Sep 2026 08:44:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Sat, 29 Aug 2026 21:39:21 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").

Applied, thanks!

[1/1] arm64: dts: cavium: thunder-88xx: Replace spaces indentation with tabs
      https://git.kernel.org/krzk/linux-dt/c/1f6101ae9560c381bb6e3b4322b51d784a648019

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

