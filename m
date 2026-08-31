Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ED043B492;
	Mon, 31 Aug 2026 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184629; cv=none; b=Kwh5A3lk2MFLZGAV5kjuded9rWclSegnjDtFJ+nzqaWJeoPnxsbZiow4yuEu5czan8LvT7uUeb4GuuF3m8XXavGMlxOCYQmMrafPJ0V0KK2HL4EkZZvssPI425VYHUC4Nja9axWQSMoBs8ocklf5V0Geyv+pjlpzDcdpN6SzgbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184629; c=relaxed/simple;
	bh=vDS/E0cgutdzkcjzWHKUrPX5cNnl1R0X5Gqqe3k/v/Q=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MAYBkYwh3bsYiriVsT9cf9HJsJ6TffIJ2ROvGLFZZ5qFMkKiIn+PH/GW/8W48So5sPCpR7mlBkTYpNNsGMrt0Ko2jMln0uYiB2s+1G0rRjAXx9zZYk47fUFL883MwgGHSuU9NZ6s/SfJf24TtY7LJr6cU+qrvD7PImAv8Nv0D+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGuPY1d/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGuPY1d/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A8F1F00A3D;
	Mon, 31 Aug 2026 13:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788184627;
	bh=zpvghv+x5aUM1Thg4eRfz3/bCxhuXjjHyhBWU458Qxs=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=FGuPY1d/6GY/ERrM5QSjmFdkSpbpfGIGYaQap8DLICBfVMmEM9x7oX3wn3W5NYFj2
	 mfrl05gu1XA/n+/YCVeHI3ptSBLnsypixYuu/EuS2z0dlqxXzrSBIkEQ7zCc7Wuy5l
	 0wke59Vq30Hw5/Fw/CDDY3Tc9Em38sS87t8CMMPCPTFoCM6i3KCE3aA9l+gku3mS31
	 RgcFtV+FZzwO/BI5I3WBt7uFu2mOHSlbH19yUngQSxtnBp5u4uVHsI+pZawur4cTOZ
	 GS493ZFHXw+4nHSz9khS6q9gA8vUlXsSqCT6Akxc4o6lPW4MkoOi4K8sj8ZHnO9PgE
	 ad5DQlTyncU3g==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829194131.108039-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194131.108039-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: allwinner: sun7i-a20: Replace spaces
 indentation with tabs
Message-Id: <178818462583.248724.8146630248194463325.b4-ty@kernel.org>
Date: Mon, 31 Aug 2026 21:57:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sat, 29 Aug 2026 21:41:32 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").
> 
> 

Applied to sunxi/dt-for-7.4 in sunxi, thanks!

[1/1] ARM: dts: allwinner: sun7i-a20: Replace spaces indentation with tabs
      https://git.kernel.org/sunxi/linux/c/913f7eda9f3e

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

