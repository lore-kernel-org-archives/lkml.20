Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803861;
	b=AaIwMhXuSUoi3YKnBDYJyUWS6toBOpUyFn7Al8/C7+6xJVbxeb/PjyAjG7pVmvaXNvuJ
	 u3GYoDepYsfw77UWbPAKaeWddsihX+vN0jGM8frRv7eQaYH86RC/j98YX0AmLvyt+hGeF
	 IIxwrF2TYpBGcAmMMm3A2N3Sv2r7xh8XWHufXDwFAAXZEt5tT5/qjALDSOFodVhsUK3rf
	 7Njbm4zN6M7c2QmnQHZHYEjJjbJgJ0BsrqxftkBxt1z5HnknHscVfULpVRPuEE186REXV
	 vPfVcqRJXf+3HBUqTwdi4JmLwhN3EBBwW/g26eVpXTXIYBhsh3DPZX3CZ2V3HN30wOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803861;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=g2SUEvaP3SXotUZW0JgcqYRSFVg3QDyCA6RclhZ6jU8=;
	b=Ocm+TI4C50E0ryQlW65x9HOOHKu30T5sYo9miPTmPJfETGwLmjRv2x2ceo1lZc9oHxG2
	 V1jhBvSxp0Ja6H0kVRxX3CoCW9h35QQNa+pSOmX8m8RqiVPSVGlisCinCP2LD6BpSSgPt
	 Z3P4yK1BJK9PwVl4xAqB/IsToLqSqfO3raDZ6qcGLquf5+CG12o1BKSATb8XAX6KmKk6p
	 slIgQg11FdozJPCAER+/hjtPJeBveewftisdrRBzxLsh/giOqEi/xSrx8rGDsUOHuyLFT
	 yAG5omjEX7AxFsxsglyuPcvgnO2CbWgc53gK2UOCqst6yXNMhtNsCFhoDf6C0IULGNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mbYxSOtq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CB7606A332;
	Wed,  4 Nov 2026 14:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mbYxSOtq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4F81F00A17;
	Wed,  4 Nov 2026 14:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793803861;
	bh=g2SUEvaP3SXotUZW0JgcqYRSFVg3QDyCA6RclhZ6jU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mbYxSOtqacxogTJ1hQ5hI5ktbiOvRXFfAeh4wY+5fuV1xWSShWvVzubW3yD39GcfR
	 rRAMM+w2j0JJmC0x0BxhXe/ThR8+qn3f0qF9A24LSLX5y0KurigoRSXkCSe4bAIkjd
	 vbyhQh8li1yTdDalBWUjVLUTJtvd9+nIvnMdno+FyaDLNaAfATauir/O4X4ey4w+GS
	 5KG8n3BKIIqLzasUdUUok+bzJmgAImHdTOiJIgCqvIkSSZ2qdFTHOZMMgnsQ9jffQg
	 GKUEB3FTgMf5/Y81x6iud/PdSEgMccFEeX3i/2XnBnGtJF14SmrdbGOPVGqRmjf0Su
	 MtPjn/Cgv0qrg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH 2/2] arm64: dts: mediatek: Correct white-space style
Date: Wed,  4 Nov 2026 15:50:43 +0100
Message-ID: <179380380618.180018.7896148513810825073.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801210230.383532-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210230.383532-4-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=573; i=krzk@kernel.org; h=from:subject:message-id; bh=BjSKvKBqIobtiaqSh/IRJbN5M62UkGlZsyhzr1CyR74=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq60ZExfV+JXQEvhhyqjYr6PYdNf+BtGljRM/yT a5JRDHFxJ6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCautGRAAKCRDBN2bmhouD 13aND/40fYFvUPaDNgA89KoubKrhjvlBh44Svcn71TSEdMaWPio5GXHqtqqPWWAYxyIe6uGW/oc Ai/XToGaTMgWIYn/AmczwfRGVWSVvNd2w6o0tl6vPgkEIsE0bAq2RgtdjYU0E4Xi2GqbbMf26q3 KZBAVTFuEfhwT0UtRND79MCr4HlUD385bs1tmviGydazQT9A9Co41hLJEoqDR2940Mxuhk1cRPo /Z6Ia/E/bWePokbhsJkj1EyYFxL43n7PSVfbuJNdkwulRPm4Y+Lhw7Brbbeq9sEsu3LFZrixmCd m7fHBewpdxd47IDZzyx85+TOXvZJIIsmJ5uEgsa8H2OULXPQXYdg3QYli3qYHpBi9/22wq9d0Ee CtOMvvW3FhUFkozlvfKiz4fxaGG6O2U5QjtfX/QW+0ijmrInaM02hLYkRa2OpiZb3JrcSJiuwSU bYzyp6rJc5SY91Vl5A7Afh1Q2Fq7kGKwAlxXmMIOBZQ+L4JR7yfGJj1aZDFwqSbfwnfO9S3Gr0z TfqGaKigK+XcTQWa0D/3QoOtH7MFH9Gy7FU9YVGSWaAQc9JUGfPbm+/PgnNhp3dJGVr7UCO+Dod ASbMK6CdVK3oZhCZDMSxRSPwlA6Xr15+GsKwoN2A1TOZCD4LOCi+8hc1e6BmWEa1Aa3C44vfjsv C7reDVd+7j+f6G
 A==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Sat, 01 Aug 2026 23:02:32 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.

This is waiting for three months without feedback, so just picked it up.

Applied, thanks!

[2/2] arm64: dts: mediatek: Correct white-space style
      https://git.kernel.org/krzk/linux-dt/c/30c1d0c701b4b9cdc161606a21184261f9ed2517

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
