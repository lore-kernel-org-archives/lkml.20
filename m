Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF62F4FE2E8;
	Thu,  1 Oct 2026 14:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865568; cv=none; b=kMowZwAwxmqtG1SKq8eZCN3hAcoC+AaRXplZ7QuoaXEWPXL0p8khXaabFJa9d5Q9r1QE1nXCAIzqZnK0PvBf5DjUS2iDIW0NX1PeNA8H2wt4EmaHrt+XfLc5mzahq6Hxc7zL0FLZlVMYTE1wcwMnzOfDOrnmJTmPgka6DYy8R1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865568; c=relaxed/simple;
	bh=rUM3wC4tDDrakaFjYHcAEk/tUsELTspOeKctPsUvX/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e9gTTmLgPrs39So4k5iEgQxUBx3bJPCo1FRy7hTSOMhhcrUJ4c4BvdImHPMM83Q9qIjS6XAP8mJ//hdnanSTeGNnqgLMfimdkBtqpsul/kYANwgb4j5jNJ+aN3yQIHSCjQ0tXFrO2g93L5lX7+MyPAlOxj8q/6SR0Jg0lKscsBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DablRgPd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DablRgPd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F6C1F00898;
	Thu,  1 Oct 2026 14:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865560;
	bh=mfiqrkld6dn6vxRgosiYT98OC/Afq+50xeR9Xc9YeHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DablRgPd7zL9804pv2WtJL8rmzCrx8E+HMzC8RSrR2L3z0llLoE+tcObW3InuZu8B
	 qnhKvnNLmEhvTumw6Q5uMKgVB1Wxp7b35faSumG/BmjxOtWqOst18ny3ra4BHXlgxo
	 Bn2ccEpicESi+MwjF9g83o3jIECv8BU+0XXMTcuu1nB4YkCM7BVcuMORsh67PBkyDF
	 cjuwYIpz4+eC1ZI+6rcCYOoOAjT3Gw2TNdqXyYq0VVvaV8BpiAzMmL0CT8axVGSCjB
	 O+ZWj9gYdgIqkIk7qNgBW1I+OLQo5OhsKkV8FKWD25LemyCkUyRstlP/bsOUVY2ph3
	 Umwa4HctkbcAw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Monish Chunara <monish.chunara@oss.qualcomm.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Xueyao An <xueyao.an@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra: fix sdhc interrupts property
Date: Thu,  1 Oct 2026 09:39:05 -0500
Message-ID: <179086553026.3495936.18230506066464740779.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929104127.3156764-1-arnd@kernel.org>
References: <20260929104127.3156764-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 29 Sep 2026 12:41:12 +0200, Arnd Bergmann wrote:
> The gicv3 on this chip uses a 4-cell interrupt specifier, which
> includes the affinity, but the newly added mmc node uses the
> 3-cell format:
> 
> arch/arm64/boot/dts/qcom/shikra.dtsi:4151.4-27: Warning (interrupts_property): /soc@0/mmc@4784000:#interrupt-cells: size is (24), expected multiple of 16
> 
> Add a zero affinity, same as for the other I/O devices on this chip.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: shikra: fix sdhc interrupts property
      commit: 7ee8eb0ebeef2e7bbf2ec8ebc43bf43f2a10a1d7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
