Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0663D47B3;
	Tue,  8 Sep 2026 21:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788902803; cv=none; b=h/hC+rmPpaNL1iM7hIGtCl+ztvSPZXd/guDCw1IWdbXumFiXinO/iChvd4eIEX2JlVWXyUBe8u9eAAPvA0b5i/YiDdTFzLbBUyx+eOJSc8APzy56cCeLuJAqLMFsQifWWwrl8D1U4ECyBt+Z5asHQ9WkHZruNjsEJBsuUG+0J3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788902803; c=relaxed/simple;
	bh=4PVYGusGLrzTFvksEghppu5/LFnN1vclC/DX4Dp7Xos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TFBV8+LQIW+dnNHpjZxWwjg7j0zawLU2HixG60SXWYHUeXiPNebagHoi/qIoxpzHmGVA9VT11DyvGunc2j9RHDvcpRYMPNHjp79PZpa/GZZf2WDcszj9tVc8ABGY+LNowuUamV2lsNqsEh88xiaNHvwUlF7Oo8mStS5bSLbvDLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XcifVot1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XcifVot1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA531F00A3A;
	Tue,  8 Sep 2026 21:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788902801;
	bh=r7oXq7kQmvGrmahMesk9V21u+Tvbyn0bdt0fECmuQw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XcifVot1V0tarr2602NXXFI0SYUsusVKlimRqu/6B+nq9jSyBxoCgQZxbenS1BFJt
	 thOcBOQhQkxPfXMMIxX+xk2sdEZOb5eHcB7pv3uL2D7uxEqs5FghpFH+lySBTlrBYz
	 6y35N/UAgBk/WSrIxc38+I0Wly+UW/hGDc0ghe7Bb8qCFf5LIc4lz17hXwKXQ5q5OT
	 L5nEBNyInARoqc8Wf6ZUi98/kg8waQmgeu5SLfSacZsp4IpXMCKXCBAexL1dOKzslu
	 jPZ5kLnBmde7mVwRpLxM+wx+3SFWoNTGOhKdoiEIpO6iwBTEGGTZa5mPg72F8JKret
	 3bcB1oyG/qcyA==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <docular.xu@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Drop guest properties from M-level IMSIC
Date: Tue,  8 Sep 2026 21:26:36 +0000
Message-ID: <178890272613.280426.9372174994457180272.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729-k3-mimsic-fix-v1-1-368c0aec04b9@pigmoral.tech>
References: <20260729-k3-mimsic-fix-v1-1-368c0aec04b9@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 Jul 2026 00:40:15 +0800, Junhui Liu wrote:
> The mimsic node describes the machine-level IMSIC, whose MMIO region is
> 0x10000 (64 KiB) for all 8 harts. However, the node also specifies
> riscv,guest-index-bits = <6>, and per the AIA specification the
> per-hart stride is 2^(guest-index-bits + 12) bytes when guest interrupt
> files exist, i.e. 2^(6 + 12) = 256 KiB per hart and 2 MiB for all 8
> harts. The described region cannot hold even a single hart's files, so
> the node contradicts itself. OpenSBI enforces exactly this constraint in
> imsic_data_check() and rejects the node with -EINVAL, preventing the
> M-level IMSIC from initializing:
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: k3: Drop guest properties from M-level IMSIC
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=01e2f07c44fc46180bdb10e70506f8acf44a53dd

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
