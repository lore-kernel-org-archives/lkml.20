Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169400;
	b=uK2mt7g/DLCSLK6WNRf3170C/Xph1BT/5Nz84x1st7IhyHHMZgPUzuFqEr2UxMRZfY4t
	 NrR/FKbq2TXqrMQwhryw5DPDB7tLNU5c7dlI4SXueof8E7xts6K8gxH8x171XLg5sMLvu
	 C0b8FuLdZSpiu9nGPUz6aKyuRI1qmaSfScwe7jIEmp6AIEobrJTvUNbDVzDsK3cnbd1TU
	 B8si0k1u1e+h2L7QRwZ99R8K2+vYzTg43VXygNMSSgbppLYcteLo1vhuzWaXQtBWBb9xb
	 H7dFGjf0ISwsIPm3OqX590HKdsWtpBtPqt+rUkThPpW5V3AFo9y9KONcZZFJ90LKvpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169400;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UUCrpHhjrlYYj7VLfA9hzonxMBrh4PQG7azlK603Yok=;
	b=IzdOCvv0l3H8DGWrQgMUYqXjaZph3LQZ9FJD06K9tNPZvo86LfuWpJd/WFKTlPV72E6s
	 HXaU22p85TFAmsjTEafzVuZ8nyaelXhs8fn+qhC1u1Z7Q6q/6T4w6iiTtn+vE0nwOafID
	 ypa7U4Q4bc7CMN6iAzm1Ze/mQg2o2VgFU5SIn26Y/uO6nAcXj/zg5zTK3g7yRg5oZAvkM
	 ISKwdzbceG5CkBQ62hpZvSGiXv5Z23SvxDObmnWxYqNaBX0JVMrXEBoCYAjwrRaO91CI8
	 qUQLAauXikhYmKQIy/6o23Fep1/rSmPwtJL7+hE+XEqEiOEimWZtaTZ4Hu1yGAbKJeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yvzn23wn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CEF6070298;
	Sun,  8 Nov 2026 20:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yvzn23wn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C251F00903;
	Sun,  8 Nov 2026 20:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169399;
	bh=UUCrpHhjrlYYj7VLfA9hzonxMBrh4PQG7azlK603Yok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Yvzn23wnpCpGWF8fT2v5N2GeNfVlM1kAXdIiHD9aa+B4IR64L9Y91AWw+V2uLxWCI
	 624eKtILmbOX5Na90g0bq7Hj1EPHyxPO69Z00wIXczs9CJ7aoIAWxOn7Ddy9UOjAJJ
	 zXJjd4iRx4Q7gk7WkzgOzhJ6/lMHuuunzoFsLKxLF4VDLshWEu5mH7Bm1s2Em+DryT
	 xu94X3CeYg3yfZFoGYWqShlH8zbYcdJu/uts+RF9FWR33EmFbJ9Sy2yZs4SDvLwHQ0
	 bPiiIquKzeCNzNsWAPW8p2in4cXeiQr4vCje2Dot2hyELaTiQ11RX7y5p/rqRVLaP7
	 2JXBmY0fNZutA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Switch CPU ETMs to MMIO-based probing
Date: Sun,  8 Nov 2026 14:20:06 -0600
Message-ID: <179416929421.628393.13790074133955645755.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-fix-etm-probe-issue-on-shikra-v2-1-b2eaed0fffaf@oss.qualcomm.com>
References: <20261019-fix-etm-probe-issue-on-shikra-v2-1-b2eaed0fffaf@oss.qualcomm.com>
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


On Mon, 19 Oct 2026 14:58:34 +0800, Jie Gan wrote:
> The etm0-etm3 nodes are declared with "arm,coresight-etm4x-sysreg"
> but do not implement self-hosted system-register trace access on
> this SoC: ID_AA64DFR0_EL1.TraceVer reads as 0 on the affected CPUs,
> so etm4_init_sysreg_access() correctly reports the access mechanism
> as unavailable and the ETMv4 driver fails to probe with -EINVAL.
> 
> The CPU ETMs have a memory-mapped aperture, so switch each node to
> the standard "arm,coresight-etm4x", "arm,primecell" compatible with
> its MMIO reg range.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: shikra: Switch CPU ETMs to MMIO-based probing
      commit: c23d8ce90e1d27d88b9e4fc15721a3f3d6827b51

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
