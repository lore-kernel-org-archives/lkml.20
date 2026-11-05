Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904168;
	b=BzOBYIJpJ4Tf7RDyYOLyRRlt93243VlQ4rkjEXCXpSeGrXMCPDG2WedHDHk5pYy7eoyP
	 PjYsGn++dX2cVpJ/oWteGrXxaSPFNVZXDjuPiHfuvbMUNSTOjEpbhlQL4g3umqH4vGg5e
	 0LibKmJLn2liLVTk/XetM8iPmS3PFoswk35UAvp/uU37rtZlwXjVAiaGXZxdZgArpqlAB
	 nz1Tjk79wIUe1fHkR3tSCVsCgGAWwfB8c5PYcnRP7D5dBrOEk2JoR9XrHoeMtzGCVtj+r
	 508+2oLUIkt23zMCjJSMR8u6L7WZFsOz5Qs3lmH29B+A2UExQdYow7kUEJdQbKcxinA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904168;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=GRNGObKHI3lnA3yeJz++OADSyBlXSs934ZgQwntZ4Ns=;
	b=fKjR63u+Y5PT33d7/BfsH5Ilbp6l+BQTZBRe0qOMVnYqm6X8WzmPjANY52mM4xOw6yMH
	 bUbh4nOohJdlRhYxdQ4/w8gkmsrOBCaKxX8CIMuM+t27q0EW6UMNIYm0DTbYjWAHlkf9D
	 YlELKCO7wQzH2O4yPFUFHoNv1oZ5Psal6lZaT/DAhpf+NiR2KZOteuQrP3U5H6bS0sOjh
	 93KkghxLf7791OucdJqzvc3ym+Ip+fsQrxRld7HOG0Cs3L2/wrPY6rUC9CqePpQ45UqFd
	 4lWo2QeW6UjMc7KjIOPvZAgfK7hkB5gvkLpjXAAdaACa0v+7A+Qsk7KYeMw1/qjSkdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dV6ULbux;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C559606D810;
	Thu,  5 Nov 2026 18:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dV6ULbux
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85051F000C1;
	Thu,  5 Nov 2026 18:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793904168;
	bh=GRNGObKHI3lnA3yeJz++OADSyBlXSs934ZgQwntZ4Ns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dV6ULbuxdTCuH5vO6pjckyW7fXvXauFmAzuA3z1i6VAae+f393/VU+Oi6KdgkRnRd
	 L3+Wo7DaV57yVOn8X4PDej0IBLfenaWitK5JsgxmU+F4WUsOhI0CaQbXWXfP7O1Gzi
	 A/QPrm9xJzY1ILQP7uv7VRQ+a2yfXdy/1C5vLfjMHGs33KGSSBR64R28+YvE/mJqFl
	 XHZTHZ+0xG2yn4ru9o07p6ZzOC+5RIV/NUgQX+XLwy/EeUxfcgFNeC9rw7e5ve52hg
	 ZkgsPqSbWUi01zGAjV7fCFk1+rA0Viab8lxNa3p7qyOlzSzPlnoQjw0oUbkFgTTWuP
	 VEmSlMYU/Z1mg==
From: Conor Dooley <conor@kernel.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Yao Zi <me@ziyao.cc>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Han Gao <rabenda.cn@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/2] riscv: dts: sifive: Add the missing FU740 CLINT
Date: Thu,  5 Nov 2026 18:42:37 +0000
Message-ID: <179390412800.1478853.10812616929498115582.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101-b4-sifive-fu740-clint-v1-0-b4821199a733@iscas.ac.cn>
References: <20261101-b4-sifive-fu740-clint-v1-0-b4821199a733@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=465; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=K3IQubwUk2vgWcXnLJFAQXa+kWhgi/GPRVetmK83/eA=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlvzsleu/9894Lbwol/Q+TOcVkcieJxWnAw6RHDlQVuO Vumv3lzvqOUhUGMi0FWTJEl8XZfi9T6Py47nHvewsxhZQIZwsDFKQATyfjA8D8xhKu1PvevlxL7 lYu3F+iJ6jOzLrrB7P6bX+yJ+wzX+yWMDC1H1pxe/Le4iL///nyj9kOy8RGSFh7RNctOzTx+aEN KKRMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Sun, 01 Nov 2026 21:35:30 +0800, Han Gao wrote:
> coreboot and U-Boot already describe the FU740 CLINT for OpenSBI.
> Add the missing node to the Linux device tree and document its
> compatible.

Applied to riscv-dt-for-next, thanks!

[1/2] dt-bindings: timer: add the FU740 CLINT
      https://git.kernel.org/conor/c/c567dab56912
[2/2] riscv: dts: sifive: describe the FU740 CLINT
      https://git.kernel.org/conor/c/076ecbd42c0e

Thanks,
Conor.
