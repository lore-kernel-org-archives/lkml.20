Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169395;
	b=QfogC9AwiwHhCkWQv0eLXqsQNkW7blhZG0UobeyLo3poun2iEbmV42jRBBoqA+Q6MoGl
	 yn+f49yyX4zvXpqyTDjxaWV/EZIY1iA0bgBa5WsXFaghJFE3/mzCEhWWDTjeoyLxOP0ri
	 9lHijt8W4yQxFgx4eK6T8XQCFW1QhDe+Dq6g8a9cwOCdRPZJpx4N2dWrrCvsD+BwEPtvP
	 /Fg+pwf/rN8F0nl9xPbM1KkeF9Z3w1VezzRNhWpL11uvz7qfxu0gyHmTv/MGAcvLujhmG
	 Wf+hq/xDmOQZc/uY4/ZU3oqrIXJkNCONOLyMOte8lu+fiuTVDsQwG/ySxgJNN1ZSZkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169395;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9coBeaa1a2tcCZf4rJ/VAAs3WKuWv+I2GdA5wSwDE3k=;
	b=f+BX4n70QYfxIgfkArN+0SJHT3C1RNWTKlq1vKuolXZB+aoX7om7hJy0f0kaiuSy/5Nt
	 emMBIsPwT/ZmoBu56vBNfgkXRHX987COeO+hM4fYniMoQzPXO3OekKvqpWGParKH6DWN9
	 FN7/Tnvv9NH39PrW3d31HFwn3sjMtK0KWNLEtMWjynTMtfopmkfipuhB+MGdfXF8p+wIk
	 Jh8xM9HrlyhfDdXD5Jd2Lzl7SA1QRZ7aD2PnI403E7JWDJYQ+HQstHoe/C+hiJzKa+8Y9
	 wuabZiAKoAbGE8M5/DPrZJVXAcexPXj77VFjafEEQGIAfYmZ4qDGo5Ww8u8ZA39Sthg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lYO5zkuv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC920606F8DE;
	Sun,  8 Nov 2026 20:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lYO5zkuv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397521F00904;
	Sun,  8 Nov 2026 20:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169394;
	bh=9coBeaa1a2tcCZf4rJ/VAAs3WKuWv+I2GdA5wSwDE3k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lYO5zkuvXYn5P2oqqOZjynaBhZ1q8b9Vnv+4u4Y8CUjrR1aoe4Pk8l37mhHJmGmEX
	 jfL6ZHGkNRgO3AP/uac/ptTlFbrZ1eCdgPfvry6wK/t03hdm3tqfKayqQ/RzPxPWKM
	 C0ikSLe9iZYz8YQco2OkY4Azesy4zfpfQ15MbeMRagkwrsl7CDoxyi7eOJSZftI3gi
	 9RfGgwuN+UmtgN2Oly3n90baB9h0zzJpUmkc4NPIyP4OLucoWZpbLMTwZ1ffBr7kpY
	 3onxMypbw5mKwnKcf+WbKg5f0lLYVHDaXdv0fJlbiPL42EpScQbnSK2dbmMS2V/Ow/
	 mBq3OcGhA2CPw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xin Liu <xin.liu@oss.qualcomm.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Nikita Travkin <nikita@trvn.ru>,
	Birk Skyum <birk.skyum@pm.me>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1: split PAS remoteproc iommus out of x1-el2
Date: Sun,  8 Nov 2026 14:20:02 -0600
Message-ID: <179416929249.628393.6579898779701344795.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914-x1-el2-unfuck-v1-1-00d8bc35a635@oldschoolsolutions.biz>
References: <20260914-x1-el2-unfuck-v1-1-00d8bc35a635@oldschoolsolutions.biz>
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


On Mon, 14 Sep 2026 21:42:21 +0200, Jens Glathe wrote:
> The shared x1-el2 overlay currently attaches apps_smmu streams to
> remoteproc_adsp/cdsp so Linux can program those SIDs when PAS is
> used to authenticate and reset the DSPs.
> 
> That is wrong for the common WoA EL2 path (slbounce + shipping
> UEFI). There the DSPs are already running from the bootloader and
> the SMMU probe path leaves their SIDs in bypass. Describing iommus
> on the remoteproc nodes replaces that bypass with a translated
> context that is never set up, and boot dies in an SMMU fault storm
> on SID 0x1000 before userspace.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1: split PAS remoteproc iommus out of x1-el2
      commit: 8ba94ea5c00168124ba0c96523ecdabcde652e0f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
