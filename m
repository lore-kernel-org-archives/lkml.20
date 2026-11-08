Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169481;
	b=2D6XL8UG0fAk8gb71cCjXxb0hYpm6BOsqHHC/o04PJjbKovTiRZqdIbIXG2Lz7X5XMSB
	 tVxqiIIDvmhZ0cSml4PyWzj9+sBuBCur5N5nc6nCYn2AC4yfeBg0ztOF/YfkoSbZlSVGe
	 zgWSandHhgWWm5Xe97QBrtw3vcYK0/Yl7y9mXL9SBytFexGqeJE4YTihcBYHhHwFzU3qK
	 fTtr8e2q59DDsMZ/wwGRBdUTJbKkhDeAxD9V/MwJ/QMG+XhokixWaFuVwXYjAntAfI1DL
	 doIQEHt00EtpUaDxXINzLqIvbIjUm0xBhIqziXPAKSOxX5+Y77nX8SRwc18VHiYBjdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169481;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=O7hlAbfoXMWo8ls0Hzjqu9/SqcS/k+aHJqi0nIPwCF4=;
	b=3nsUaOqLt6SHpQBDxI0RrtwUIyN3AXNmmFFgmpRPxlvLvLvuj7248onMfD1Cxt0g/hR2
	 LIhOQ07rufG5BzTp873MasNURbfDAIS/tivtjUnSdTqRy5NE1VhkhaSFSzKa3KzRDO8Z1
	 hSc4Ps9Vx3GcGm5AN0Yc4rJt6rBxDlJ1V6jhPlJS/LogqEZ3RbsQb5+2BJGxWxja1OkP8
	 vLESLHL6eCE3Vp4qr6cU5bSg7nj7urMN6rc3pPHTuvKu89gY6dLNXWvAsEe1LaSjISHfF
	 DeA0O5i4R762ZAuEn8RYFh/bZtXI8+lO+zNuGi9iY9cVIXtB0bc5xbKoXIU4nU8uuWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=elHQVnEm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53E8607E49C;
	Sun,  8 Nov 2026 20:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=elHQVnEm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58EE11F008A1;
	Sun,  8 Nov 2026 20:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169481;
	bh=O7hlAbfoXMWo8ls0Hzjqu9/SqcS/k+aHJqi0nIPwCF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=elHQVnEmPD/DaaExD+FliiO6OyYW7cBbS0UGyDBxy997EYWb9R+B43QEslsxIKTiP
	 OLzgB9qXNLE45eU4Q/nAhYj6qpaYbbVImcoxljoJcfY8VuMnmdIzcdkXJYuvDoE5ZM
	 iSKr/9RO1K71gW4SM65KnePjbt6gqc5WVM1zbtLSok8SIsdk/2AiUrlbGYSA8NeqFs
	 rRmGtqqktk8AUh0OpB677+6WyxV1VZjjHiTH4OLLqIZMQifcJFMk539YYZCoTPlHVQ
	 8SMwpOXL2l8UPTe9Q5bce6UtZamChWRdLJuwZuqwGJ/MzRgh138NJxTjmgIXEh3LYH
	 7P9+Oi+cuPYRA==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
	Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/6] arm64: dts: qcom: Introduce SA8255P as Lemans family SoC
Date: Sun,  8 Nov 2026 14:21:11 -0600
Message-ID: <179416929532.628393.8073843162038778455.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
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


On Sat, 31 Oct 2026 21:10:36 +0800, Shawn Guo wrote:
> While the patchset [1] supports SA8255P as a standalone SoC, this series
> offers an alternative by introducing SA8255P as a Lemans family SoC.
> 
> Lemans family has two variants: Embedded variant (IQ9/SA8775P) where
> platform resources like clocks, regulators, interconnects etc. are
> managed by HLOS, and GearVM variant (SA8255P) where they are managed by
> a VM acting as SCMI server.  All Lemans family SoCs actually share the
> same hardware configurations like memory maps, interrupts, DMAs, etc.
> 
> [...]

Applied, thanks!

[5/6] dt-bindings: arm: qcom: add SA8255p Ride board
      commit: 8f1791c25b66388a2ddd2dc0b84aae08fe77dce6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
