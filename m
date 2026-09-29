Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8DC3EC810;
	Tue, 29 Sep 2026 03:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651751; cv=none; b=JHBSHE6FQhQD6n/5mgS2/6AvimNZN3g2OIfbQPY0DhgWxm/2eiRCV629cAVSBlnmOijz3lCYYpEu5HnNs9Yu12AnpiXyG3IzH+/Sq2sM3VPfv8cIIEqyPZ7aP38Y+nviH0yPd5s2x2qldbyfN8ZfsokESSQAnBKYwRjmZ8q1NxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651751; c=relaxed/simple;
	bh=JvIk8cGWvFYlUdnU1mzs5gNGzb+vemyTsGs1/mYNUTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mw/PEbAFnUiNAEaVIVKuyggzQ+jwtZwJSUpzPMtlpaVGSbCoKDp/VN3sHC+0YHcO5RghTIPcLfzfI64C3zVIpi+AX8boevNPUGL93Izy6T4iiVlNrdvNRM6KGTXnzW2LXaXivPb17UoY8qS2xhEY0gPYKG4oYRM7CCS789ylltg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EEHHFuAu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EEHHFuAu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FB21F0089B;
	Tue, 29 Sep 2026 03:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651746;
	bh=E37Lm/6ycJKqFZ/gqmGthLRMJOnLdjFVZQMCvSelV+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EEHHFuAuAr2WGu/9iSzkc3zL9lJUgoInj62fWmPubn2p+VOFe4dC9z/Jr51k5SiU6
	 G5C2TD6gSgFv/94j/dazJ7R0AEkUl74KTjntPguqCmUtCvqvqK/CxacN67og8Mvu0A
	 of2eHhWp6yMqGI/HKuY8q+NUiQ41n0WIPYQJMfH4HahsxIFIjQMpUTzYX++3b/T3Fh
	 qu3OBR5QVynlkqCTc7hPLy6J4JhVdPxnHc5eUKOEH/45RtXv0F1uIb2b1oxVGf59ZD
	 ve7GKDVhXtAXRNERK5YsjCtK3PzfaqIb6mf7ouADbOx+Yt5cvtvPnIA4JSkqcVXvGi
	 m6p7DT4zQhlwQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v7 0/5] arm64: dts: qcom: Add Kalambo SoC and CRD
Date: Mon, 28 Sep 2026 22:14:44 -0500
Message-ID: <179065170979.2673486.6848499438612886113.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
References: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 09 Sep 2026 00:18:13 -0700, Gopikrishna Garmidi wrote:
> Qualcomm Kalambo SoC is derived from Mahua SoC with CPU cluster 0
> removed,leaving only cluster 1 present.
> 
> This series documents the board compatibles and adds the SoC and
> Compute Reference Device (CRD) device trees. It also adds the Kalambo
> compatible to the UBWC configuration table and allowlists the Kalambo
> CRD for QSEECOM to enable access to efivars.
> 
> [...]

Applied, thanks!

[5/5] soc: qcom: ubwc: Add Kalambo UBWC config
      commit: d9df37ba39ea32f834800103d1a3e62ced8525b8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
