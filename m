Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCFC51C328;
	Thu,  1 Oct 2026 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865574; cv=none; b=lJmYGWPeHdHN3Q23gTj8EwtgyxKO0t7gRUwkaUV3C9pMEI4JQRmWx65faH8Ve2kXBhbqKU1HRfilDpjHDagPFH3xkyDFdV3mZl4sq6Vyca84r7cOGfNMaWediiauSUS2jAsGf5tm5Qcpe0KXNbAJgpkf+AP6bwauwunq4s4OD0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865574; c=relaxed/simple;
	bh=9vBFUd8M6zI34Kpn5c0aL91Hg8EhvhtHZwGIJr9hYLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IqP3DWFyWRlfefPKPeMXX4NOhbJoJwV2hbhQcQYodqS06gttRhM6xBHdcBS2ABQI6RSpPJ3n/ozmxbmh4EdqdFew9sFmZN70QRK1iakgyQ3gvTVQwDhEZGWo2XXRx8ymKyd99LHv5D4Sw1mUzB1i3hpBaRyVFL/mzcBhadjiKgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtPdiJvU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtPdiJvU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A571F0089A;
	Thu,  1 Oct 2026 14:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865567;
	bh=aGFAakV0B/iNu46jfepqHVTck0LyjDf8OEyz0GQkda4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EtPdiJvU8URXvwy17URxMTTNScRr9mVDcixJhQIBIV5UX4fTjAd1MmeGM3eeSfNSc
	 XAOT5MAzf+QA2XIDWGfqAgTpghptqORF27a7QshNWGxLldiTfHlJeqcuMoZUfMGmgW
	 e2jqja378Tlmom9LNCPUYO7ozk6kSVe9pjTtbRSooVhVVhianLX4gSzfUk70RSx2SN
	 8RVM4S3MKZbohP0XPzmmUyWtefqpmHqZhoA/cDfNpUmfCAoJUjFABJutKVuUVuAyTb
	 PookHC+++8+rteqq2Y57Tw1an7XOWMdDiMii4Wq6PsuvMKyMVBMK52qsZ7kAXd7es6
	 83QV3h4sNsEKA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Somesh Dey <somesh.dey@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: geni-se: Drop unused icc_ddr parameter from geni_icc_get()
Date: Thu,  1 Oct 2026 09:39:10 -0500
Message-ID: <179086553018.3495936.16355331956537124406.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930-icc-ddr-param-remove-v1-1-61223714c9bc@oss.qualcomm.com>
References: <20260930-icc-ddr-param-remove-v1-1-61223714c9bc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 30 Sep 2026 13:31:54 +0530, Somesh Dey wrote:
> geni_icc_get() takes an icc_ddr string argument but never uses it: the
> DDR interconnect path is looked up with the "qup-memory" string literal
> directly, and the sole caller passes that same literal. The parameter
> carries no information.
> 
> Drop the icc_ddr parameter and update the prototype and call site
> accordingly.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: geni-se: Drop unused icc_ddr parameter from geni_icc_get()
      commit: f99164e89f0a96157feaa10603a4feb6e4053519

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
