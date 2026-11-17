Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877507;
	b=cvCtlP2M/CUhAXwCCMt0+Vlx4AnhVv0MC/xmmr0zK+3rQQ96UIjs87CccjaYhv9TesQ4
	 uSNMQBLNFhGuOfguyfV3z/0v5OfOK71aQnVivudpR1etBJKqbgd5Aj0aOOTVtS2ILWzfN
	 SwyaDoVjFulK76lMA9+bLgi69MjXw/AmkLCZR4vOORtacJbCzGfdpWMhl+EZ+qW6z8w2D
	 enTtjmGuZiEHCcXN23RXZ4jFOAjX734sfJE1MzxTES5nFJa+MiXVKU4Da2kaugw5mq+Cw
	 6g+dequazim7Z3vVQXeGDKrfMQ2bpc48H5RRyKo90Lv1KQpFFfoPZRbF+b2QGBjVRgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877507;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=bAKWIAVqDT3AcQkpi2qynUpaTpqH3SIx5CGznaLOzLM=;
	b=IzHloWCTFCX4wcJJTKTuD7l5vHD1MPtY+wa1sFeM9CIenYBCasPGg4WFcqrCINVNMMhl
	 bCE2QID/HGNvJTn9udCeOX6LmhJg3yFH2qRgIt6ATvsGxYEPYBD2MxEk2SPbVPDUsQxyG
	 07V9xXPuUHlEhyo4hA1uWT9TXxGjFmyVPUqZuR1idH0YjBJuogQ4XK0M8OqBALfED5C5b
	 6T2OOIwBFCsQid01fl3VpEO6Ke54YXlPsau6lLU7hAQs+OhMECQCkR/u7ijQOVHGgqnEc
	 mOY1ebsJJHBAK/gvkvV18oNtyP6gK+6gpEdPQA5EDb1T7g+y80Da1jA/5skphs5Ix3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MCxGRqoo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ECA606A323;
	Tue, 17 Nov 2026 01:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MCxGRqoo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093AE1F000CC;
	Tue, 17 Nov 2026 01:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877507;
	bh=bAKWIAVqDT3AcQkpi2qynUpaTpqH3SIx5CGznaLOzLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MCxGRqooq5Vy3Ft5sWW1NSrM9EcCDMvHyt8pPFxyp+1L0mzZa3rsXD+y39F99+6pa
	 8BxF5yirjGiIZl3NneUN4/LVEqzcQ/TfXbKdeQdXmnGMz0JMX9Y3GqEQaFfOs0kLYT
	 KbgkIxA3RmnHAoDYRucY2UQud3C01BXrua6w7gt6UYpv2Se6RRAl+NZNz/Wk2nSUqr
	 c/erAXbs3V8IdJfBEW66qczkMIa9faoWu87SK0t0Ml8NtQRySZ/H6XCBnmuNlZ0HGn
	 zaBxrKC4QLQS6MoyzKGeF+NmC8n1ifqnIRLRqxkXjhWY1BbKg4BECOIJ5MLdef0KMA
	 w3e06CVN9OT3w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Ling Xu <quic_lxu5@quicinc.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Remove secure FastRPC context bank
Date: Mon, 16 Nov 2026 19:04:43 -0600
Message-ID: <179487749347.432567.13609391802226605329.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111-lemanscb10-v1-1-7164700b7be6@oss.qualcomm.com>
References: <20261111-lemanscb10-v1-1-7164700b7be6@oss.qualcomm.com>
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


On Wed, 11 Nov 2026 22:18:32 +0530, Ekansh Gupta wrote:
> FastRPC context bank 10 is reserved for the secure PD feature available
> in downstream. The secure PD feature is not supported upstream and the
> context bank must not be used by any other PD.
> 
> Using this context bank for a non-secure PD results in an SMMU
> non-secure global fault.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: lemans: Remove secure FastRPC context bank
      commit: 38281f5b033a639c4e92bd699d14d42d0d79e7fa

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
