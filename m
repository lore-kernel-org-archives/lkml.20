Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877519;
	b=Md3fCSKT9avp72Wy+mVkjpA9prjZvflyiQoqUe6xN4MdjGeFvOt3hpKCDMto/WW0fAMq
	 U0y24I6gmHHqnkLrdJlz0Nh1i/4Fd6JJnSIqD0ZwQh7yMHLSJd1PBnBm7Qn7+bNdhGRJl
	 7s1kF6Fv/BrNI51KEQ6/jzdZ2PTRGagwIc1ZetcNd/n0fERSMQ/HwBYb617hTmmCNFZek
	 4MDK2jvygMouP7anOeCfiEzTxa70xCHJiBNS8OPvXi582Rkkg3Ks7szg22Y4i6derhH6F
	 LHpz38vstcC8LaHdltwUOM5TgwOt3jnlc4d2mitsyNI+EYi7e7m1jUpVa2w5qnexR0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877519;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dzbohmIAJ5H/eQ/hR64LwPbLV1TV2nHgnrkXo5UDSbU=;
	b=gSPnfh4oGgv12osJMoq7v4jBillr6u3RuE+rdzQcz50Fh4lVn2rgwcx9ikwKc/gfi8az
	 Qb2sIup1CqO62G9bNoWGb9WuHacJCCrEGGJtPu0XzcaRVsEabAnod/+ZT+dSmU0wRgR4e
	 NZ0AJDmkNZwKBO4NkJtLEzHhWQ+dvfHcjAZfHDrfyzA6vvnxO1kKikW+beJvRPYg+oYOR
	 CnEsLexMAcrbCPio6yMrqIZW0DKRivYCcGLPQ22RHheO0BQz2eLwbbyPOxR0F3tE6UHOY
	 e2zKETqq8zn88YSMsC92+Z6/pD7jtQeHxG310xORw2p934KATDHC9Cgw2ZFUaDUQKGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VE4hRI64;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2EC606A331;
	Tue, 17 Nov 2026 01:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VE4hRI64
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E541F000C4;
	Tue, 17 Nov 2026 01:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877518;
	bh=dzbohmIAJ5H/eQ/hR64LwPbLV1TV2nHgnrkXo5UDSbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VE4hRI64bXQX06/eHSHWbNkeefBPhGnE3xSZrHwMUKCFuqZsyLfz1zBIKeLcDeauv
	 50QhsJ7wRMIRUYEmnmTEHTOUF6acbCYs5/hhwyecXlzZAGcY0cnVhxA16RG6CSj54q
	 8TcQYN5mHofPSoJoQ3FtUUyTfp9Jj09s4JuyAEQnx+gIimvXh4J4Qh+PI9GfzxcnpG
	 zewBbUvy2dxuFFr2EIqMh7xuLKmFX7six7VyKpPWfGV+86sdzl8sITk149qal8wVOP
	 kPlpFYqPI/R+Ef/oZ73eaQr4Q0BXJO3EezDl/vDLGD1mVfsNTsnjRMbIo+ruXbCVWP
	 KxTz9p53ZQjKg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Enable Iris
Date: Mon, 16 Nov 2026 19:04:49 -0600
Message-ID: <179487749340.432567.2387680298357856590.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113-fp6-iris-v1-1-5496b6d99911@fairphone.com>
References: <20261113-fp6-iris-v1-1-5496b6d99911@fairphone.com>
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


On Fri, 13 Nov 2026 15:52:23 +0100, Luca Weiss wrote:
> Configure the firmware-name and enable Iris so that hardware-accelerated
> video decoding & encoding works.

Applied, thanks!

[1/1] arm64: dts: qcom: milos-fairphone-fp6: Enable Iris
      commit: 311cdb1e0597f848359da8be1c63b4cc97c65e94

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
