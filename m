Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169489;
	b=dJW6PPwtF2Ntwdy0vRYaRLPfC7SgVrnb4GqQPlm/nLAqFFiVHygt3kjUkU8hD0KUh9kC
	 L5STrPmNJsWx6RGiqDNITnpxbNiIT7FMymNW4/s3DcyXRXEyB5alNerxlTEOqCus8ZR9m
	 qF9RnvLMDBBcWj+lWBJ34sMO+ZkK2CXZGEDdwBmr3sktqgZaz2b/Mtb8lKBhbVRxtaE8F
	 eFUxhIyhnGYWW/u3KO8OiUsB6i/z6SpIzyI5d6UmDgPihcALDYAdYVNbEX6YKhY9dRbIU
	 87+PtH9QeWVRZgYol7gTdVo99mWhob3LRApKwbbPafB60fKJMhwCg97ZyjujuvG1lAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169489;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=w8uhzyRaGWUhsMu8IuTgrC6/zzS19CC2AK16twSCOAg=;
	b=Pm+Zmbpad1TRZUWJhub1JOqSvmqgrP6US5gLh2iHwfjBRnsfJDXpL3vttHHLruOkOfub
	 NlHk5M+DXvJqLXhnqgRn1TPnMAkZi4kvcrpI8/LF0q9uDpLh1R7CWuutbc4bol5a+psg8
	 QY0BSxaO2UZnS52QDOyY8rji13y8MiNHV0jLkXnHHmcSkv7Lz+yG5Q//UrQT0XlQT36Nl
	 pXDSIfTMooqAzvZEPdYakgA0mPt8kgon2bErN632OLzUMbDiyHioOrwx50ANGNK2Bz3ow
	 1YX7eMGgKNMiGViAAR/GtfO913tnmfFVfn/aC+ZXDNSABEtltRW6H+NpEZ4qJ6wQoTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lD8Bvp4H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DA3607F90E;
	Sun,  8 Nov 2026 20:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lD8Bvp4H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B221F008A3;
	Sun,  8 Nov 2026 20:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169489;
	bh=w8uhzyRaGWUhsMu8IuTgrC6/zzS19CC2AK16twSCOAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lD8Bvp4HeheZMCP413Pe9fuF9EGPm7XGR6yMIO97W0wdUIbtBEvloNBUTpPmqQskE
	 GSx6IlzJX4eQFxKyzwHBvaWWYrQs1xVIY1au0V/sQjTBnjjeT7kn4Cmctk7s37Lhnj
	 828flgL2ifSzdrQ0GbhskoYKqYUgAIxq2KIhFnZ6M4zermnF9J69vlgO8lXIKhklMS
	 nkeqqaWF+XhMyfPN+gMmyLlva0NYbmwnXigoqToFgAenXi+ZuVEU5rbdfG3+hW8Wwe
	 MeSR2gidg/P4uty7aLxhSGETwMg5IsxmcwEB+8HfrKpsnv/4zOFD7wuVc8Vot9ibaZ
	 2e7BqntL1gehA==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: Re: (subset) [PATCH 0/4] arm64: dts: qcom: Add support for Mahua QCB
Date: Sun,  8 Nov 2026 14:21:17 -0600
Message-ID: <179416929487.628393.4140437529266261587.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
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


On Tue, 27 Oct 2026 17:19:51 +0530, Sivansh Gupta wrote:
> Add initial device tree support for the Mahua QCB. The QCB (Qualcomm
> Compute Board) is a board built on the Qualcomm Mahua SoC. Mahua is a
> 12 core derivative of the Glymur SoC.
> 
> Unlike the CRD, the QCB is suitable for compute workloads,
> power measurements and oscilloscope-based hardware validation.
> 
> [...]

Applied, thanks!

[2/4] firmware: qcom: scm: Allow QSEECOM on the Mahua QCB
      commit: 82868a465851cc47ccf483efca2f54f0257e6328

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
