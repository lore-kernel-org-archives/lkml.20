Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169326;
	b=ss1Bq2h1QTHVsW/n3nGV9SbCxor7z52OvprDJLegrr2aftOEokpLuJAuvgz+mZ4Yw+Lr
	 cwZXndBkKYL5EDDtvl75YhwfIBzWOlXQJhE5Jk6r4Ah5CNrZCXS2H+KKar8iwCbFclbwh
	 eejQaSztfiROLtiHgR3vmmLb+zGneLVTEt3vwZGLcZMS95jEh6ByYCyjg21wlA+aO1mNC
	 exjtE+Vzz1I+p7FNmC0poHLbxkTu4PJhndfUuIb5q6sfQnyxnFuK3vQWNcP/M082q8/wG
	 /sfVcDGERJm9tQjyKWVQ4hdHNm5R0RA7t8r2ECODj9YzBAlaiVxvMpQHtWEYXAiINQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169326;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mwPcELJuPrKicFBZ34kVMln8Od0cvI/WknXDh37Can0=;
	b=QLhyFq3MbtHnTegk1UKQXGEDaqm8bvltLSYxn++cPfJv3Uxj8eFLVKM5hWU79V0phEZ6
	 6nQiQDr5xZc8NvDOX9M1HuSduzB1gJBtUj9a9kedWe0l0LFFzr6R7qLIMlMQUzMo/cha+
	 ALXJSTaYqOa0sEMk54Bu8rUj4JLXORTFbyOzOlfMhjEHrEYs97qikcsEm6WWRlQ59/9Qo
	 H5YXOru1+2SAU2GwiPyS4d6Jw8defq2i3ljFfJAgIjgisDZlvwLtD+BL/6IJs/U8/KBkB
	 bso9q7z6MfWVMHuetaAiMyr3rVolEJqvp9BF3yJt6DLTZ0Z/04EaF0o7hdtfA3p8fpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C1wqCBMm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F56606EE80;
	Sun,  8 Nov 2026 20:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C1wqCBMm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65961F008BE;
	Sun,  8 Nov 2026 20:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169325;
	bh=mwPcELJuPrKicFBZ34kVMln8Od0cvI/WknXDh37Can0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C1wqCBMmz0blxaEqQtJUT71VK046K0H+hpmXTasiWHpizHVbS7BXInXJOk8dwnP4q
	 O1CiSUFiwSkv54CYC2UsJJeZ7juWRoSUf+uRBCOcOlZ+EbQwRTT//HgfnBwjIhsb41
	 wpubpKJ0+L7t7DFHg/eQfQpuEVzFEkx5zK3ZmQx5rN2STDeO1vMNUDYid36CcJP+S6
	 oFeOPNGUCT5Gi/X4urd77hqoP+N9JhsZs0h5kToZtBg3pn3JbdcO7O5gzZfVaa2MK+
	 7cmhSFvqNX4WBiujaLfJRyQjNQqwqv8FVuASeX16MPkK29ED4AlE9NlB8dg41Kx9Q0
	 oVb1Gamfv0aOw==
From: Bjorn Andersson <andersson@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexander Koskovich <akoskovich@pm.me>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v5] arm64: dts: qcom: milos: Add Iris VPU v2.0
Date: Sun,  8 Nov 2026 14:19:20 -0600
Message-ID: <179416929431.628393.15882123652566440237.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-milos-iris-v5-1-2b3181876b2f@pm.me>
References: <20261019-milos-iris-v5-1-2b3181876b2f@pm.me>
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


On Mon, 19 Oct 2026 14:18:04 +0000, Alexander Koskovich wrote:
> Add devicetree nodes for the Iris codec (VPU 2.0) found on the Milos
> platform.

Applied, thanks!

[1/1] arm64: dts: qcom: milos: Add Iris VPU v2.0
      commit: 404c82d89e42b28d2e61156c0f3d363d634e4499

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
