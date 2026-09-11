Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F663E558A;
	Fri, 11 Sep 2026 02:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093557; cv=none; b=PI4nsWs2jS02ReVP4I/vQc9Yg8ers5sScE8OJHV1OogUCnRZEaZhthI+dNqqFxFmYtJ4jpk1ub5cn+V3JUZUbnRyLZVjfZHo38Me5sLa3TRlR0WSUZUuWcKCqm1wnZH+UoFarwOZHeG7bgZlI/U7Khr8F9jQEuZ2Nw/sNAJsbzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093557; c=relaxed/simple;
	bh=hp6OodtAUynjdx2g2HrN246zD4YtZ7S4F50wKUCVXQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r9iLv/pN105WQwCUmuZSkC8sJlxgiPC31e6Pj1RkeNPsfQcGzMy5XET6jvSO54a1U6l0O0jEFKQs53+V3zx/aPcvOXoJ5RrKuXS0sABs6+UiA8hZCrXnxqzUZyIi4tOZAIE+yCXdBBj6byOM4SupGN0pcLr9UgKyPuT9AAyWBjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNqwHD5f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNqwHD5f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AA01F000FF;
	Fri, 11 Sep 2026 02:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789093555;
	bh=TnzuPTd+YESZsW0yH9tFq86T6YmiGggM3uEO1KMk/dk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JNqwHD5fASycc4OzcI+Y21zu53QCUt1b0WaqpmM331doh/2pEhT+uD75fnFsMTavf
	 KH9AF6HIrbMF0HcLNtxurYiDz6bbcOscz1nKNYTYrW18nWCoHzum3pjXq6jmhG7j8Q
	 +C6XYLZ/+AMSgrOlaieQb3Tt8zbpeoyUIleii+0g1Cqj5yW5rxOWi6hWqujylpGTTO
	 ZEtOyu8xH/y029ds/QFTn7CWKpBrpGoOmpWcD5iQHeOywZkCHiMEwzbAfq1CxU0+cL
	 6iKho8zPp1RSYxOzcbj0esghW2t60s5XSJpx4065C6uPUsUA5UlHCU2+fJN/mx56p+
	 8BiffHulhOz/w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/3] arm64: dts: qcom: eliza: Add CDSP support and enable it on MTP and CQS SoM
Date: Thu, 10 Sep 2026 21:25:33 -0500
Message-ID: <178909353845.920241.40613868733771348.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904-dts-qcom-eliza-add-cdsp-v6-0-d4f38936902e@oss.qualcomm.com>
References: <20260904-dts-qcom-eliza-add-cdsp-v6-0-d4f38936902e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 04 Sep 2026 15:21:39 +0300, Abel Vesa wrote:
> Describe the CDSP node, the glink-edge and the related SMP2P, then enable
> the CDSP on both the MTP and CQS SoM.
> 
> FastRPC node will be sent later on, along with the ADSP related one.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: eliza: Describe the CDSP remoteproc
      commit: 2f8e44a9360f20b2f0442f5d001b14c3acdd796b
[2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
      commit: 43c3561193b39e8b13aeabf459376631045c31ae
[3/3] arm64: dts: qcom: eliza-cqs-som: Enable CDSP remoteproc
      commit: e3ad048765a681a3ac97e8aae92398e678475cdf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
