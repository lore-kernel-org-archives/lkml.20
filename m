Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169472;
	b=gNg4TmQd1yxGjhFgTIiIz7EXjLy5pKVc28Lku8RXxDW4j6/Ohk/Ni+Yqn4Xda3P50gWx
	 2mkZeFWW8sbGC49YlHCHP0LyCW3qzpQuDuZROEZcJ4nBq9JhyrIIWejOsC5Tmv7ZlR5o7
	 IbzGVgHsKZ9Rg64zZpA336uNAGY7H9cF4jxLRDKB47DdzOmr4uo+RNUadgHXDvnD00J7p
	 DbtwNp/Th0U8dKx793Xs4Exyt7uS9o4eUvWxbrWX7g0QR8ElbgqPgHppBXtTcTfYUvS/r
	 1MLrdKKDuzaHsM2S4fJFPgp+AlWpJDgJ8u9POf0ek1qCKEjvoAnGMa+ZqI5U5xq/7Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169472;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1qj5y87MsXlthtvZZz8XPLqswZ+P7fk/lt42PqGvom8=;
	b=v3hhyGFj/DKokbZdcyxVNvR2rVh+Ywhd0LXFSCa7JTmVJS4ps461itxA+C1iqntXEAxS
	 0K9uVahw6uBQFpr5X4wEX6tRFAmTPLkNizukWztdIcGMhtlCA/hBT1ouXSQjdrAAHBa6i
	 o5ftYh/FtXOdWRJB+lCkn8ToX1ifg8IDsoPV9P6kgbUwPXUe76HpCWx2kemkPR1wx2nt3
	 iRxIDpVUVHGy8uc8Yq2KENxASqT2uhUnTcnk1pz7ov6OtO2/+Kp2VWG5e/kq6cEtHLXYM
	 /QlA7hCufzErYu8xjYlcdWkoy08e6pTJA3h7tPKkzLajT/WfOMxvA7EZTB3oEgIeB3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qd4h5e5N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818C5607C5C0;
	Sun,  8 Nov 2026 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qd4h5e5N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901AD1F008BF;
	Sun,  8 Nov 2026 20:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169472;
	bh=1qj5y87MsXlthtvZZz8XPLqswZ+P7fk/lt42PqGvom8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qd4h5e5Nu4wcvRZs0U8ziIXcQyLPVqXRbzN0kDAbpXNFr6M9iZPVvWCEiwyH/97PS
	 guhL44mxVarxRPmq76fSaR4JW8ORP8Mz5fmFLEHONo22GUSYfiJ3Z2SHWQyW0zZ2ID
	 aaKpPee8a1kaJXORQ/eqFK6PbrRSKpfCM1xxsxHcm75XlX+EuHOnu89IICLu4H2wH5
	 Aaex8mWRb0FjvAZUvMnGpKK0OyOuMZwRUSqi8xT58anzpTZ6+P0IAU8VnAx8gMNaQ0
	 1otXIKFLQjy4r6s/d6+tcTpFOWPYgvsuv9YSNhfPNPK/2hshdZCERHPggNyu4+JJp1
	 1RE89s9df2J8A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
	Jack Pham <jack.pham@oss.qualcomm.com>,
	Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/4] arm64: dts: qcom: Set snps,resume-hs-terminations for M31 eUSB2 PHY platforms
Date: Sun,  8 Nov 2026 14:21:04 -0600
Message-ID: <179416929418.628393.5000758873214058787.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
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


On Sun, 18 Oct 2026 19:15:43 -0700, Peter Chen wrote:
> The DWC3 controllers on Qualcomm SoCs paired with the M31 eUSB2 PHY
> need GUCTL1[10] (RESUME_OPMODE_HS_HOST) set for host-mode USB2 L2/L1
> resume, as required by the HPG. Without it, a USB2 HS device cannot be
> reset after it is runtime resumed: PORTSC.PR never clears
> (PORTSC = 0xe11) and the hub driver fails with
> "port_wait_reset: err = -16".
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: hawi: Set snps,resume-hs-terminations for USB controller
      commit: 3c7371a907cff175fe316fce61e875e3f8db0897

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
