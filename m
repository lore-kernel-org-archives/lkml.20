Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E50E3EDAB5;
	Fri, 11 Sep 2026 02:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093562; cv=none; b=ZCQhgXclxDaKYLb8z8Wah3VKV494Ggp85QD5QmBMhDxfPzNlP9Y/2mqZGyJVsCQwDf9hK23Zf3k3gjuCxb0iijBpvzHMVUe0XLjO3W0LF59shwiFDgawKfFXnT/AsNhzO3ivanJRLucqaLxY372YnWNyLdw38dX7PXTQ0V0yfPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093562; c=relaxed/simple;
	bh=QgpqnlWoSXFpvFnbCMi9nCnFfXEoDZ4FjraV7Y+PMbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C4EbShyR3ZusNKKOWbUCNniFqW2y6i7aOjQGRJ8p5Xl2DlJkME26gBNUhl2GKFlqTQhrTYor+jHJWlizhVBCzUPjUiVhLvLrS7UT/ypLOCRzG2hkyIeH2fcxe7Rr7yurkHlxE84p5KfivsfxHKei+4epLVBxmlzoKenqLwTNq4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igmIei09; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igmIei09"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAC51F000FF;
	Fri, 11 Sep 2026 02:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789093561;
	bh=t1+k49IFJFEstKIj8qihLF2TjQj0ewHRmhioFOZ6UO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=igmIei09/QawXn+IG/aJzynWM80qXqPQFSOvWbcHeBwCEzRJCECYImWA7F44pkBL4
	 WwXA6UPDfAvkHuoTkiU2uWKRKfg8SxzC95PqhGNkf+wzBHhAZxZISk7Q4d2iXs/Cu1
	 cSSax8Tj1kwZXNXdb6LbhXXMI6+MgVv3aYo+/NO9b42zJS1bXfLAzk2LqFGZ8J7C3o
	 NGTMZEXawW4/WH20Hh2hlTOSJCUEXVbZBGiuAyfH3MIwAs196QOPF2XYMCevq3Hif+
	 NJQuQ64whne8KuJCO9myqxzdlFq3+KtyTTfwW75WDBKbwbDZUmOj/cq4kmPgl7YhUL
	 /kpgxeOE3nZGw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur-asus-zenbook-a16: Fix up the mic sample rate
Date: Thu, 10 Sep 2026 21:25:37 -0500
Message-ID: <178909353831.920241.2065165115978603174.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910-topic-zenbook_mic_sampling-v1-1-2532136d5a9b@oss.qualcomm.com>
References: <20260910-topic-zenbook_mic_sampling-v1-1-2532136d5a9b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 10 Sep 2026 10:15:42 +0200, Konrad Dybcio wrote:
> Set the correct value for the hardware, matching the readout from
> Windows during audio recording.
> 
> The microphone seems to work fine either way.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: glymur-asus-zenbook-a16: Fix up the mic sample rate
      commit: 73f0a1026210c008ba4414b3181fa679096ef968

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
