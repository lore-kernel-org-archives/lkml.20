Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E550D48A8A7;
	Mon, 31 Aug 2026 17:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198851; cv=none; b=GVhEXQiD6IkYEBzpSSQINQm5BKAkIAQJXysT4KlaSNlfG3CzRtU3XMMLRCoEI3BdhdmF8BWtTajofYyv5t4tWbxwmKk/EVIrVbr31qG4SSJ+Aj/RmzBmuyktyxYlDZOpnucWj4HS8KDPRI5IkQ+ZvUVqSO+iI4xrHL/gdIj6tCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198851; c=relaxed/simple;
	bh=y325OmXH56bFDPY0esHYFMJgRu+3sLSzqiodi5pX2hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kbxu+dfGwTh3JbZyB/1NbhN/bPogGBJ79+SvI5SbzxGqoRpO+yYUyLILuYF3gQ7PPPECGoYdZ7ZkdEdB9MZltJjwhDLgCBahJPbLODPjoA+cDYq7B3s6NyeYH+gG3q5pzPgDa/+m7VZweHyikQUDgdIH8WO1juZbhvMaV1NRsIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvO9DWW6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvO9DWW6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3237D1F00ACA;
	Mon, 31 Aug 2026 17:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198849;
	bh=B8FcrYXoqnVvTwjORIvK7AW+pS8jJNQkl0TMw09fzwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HvO9DWW6bmS9s5n2GFmBYwXWtRGDHZVeBpk+oL8cNghb0NrRk1k4TXtMHl5tihQOY
	 URoKyrzMbmWDCM4QlHwD7Hyy6Cj3aQBdpuJDNYljQ90+I8PT9sNqAnamUNqhJ6qRDx
	 /79F8ku2yxNfbmaEIiWwjmK8FK6lfSSeIYEMQV5qP1ZsYW0eKyn38s7MIdb7t0ZKqE
	 L1CVvdaG1CSZPe9eIlsfbYcz9ZrHQCmLSfWOSQFAb2mC/kUDJRXEDkFgDezJEG7uiC
	 42Um4CLPUVmyJU46qhSGhTL4riuJnR8crQX1auQzMCpKmtbUKndZL4uQrjF8KRNPu+
	 H6A9BvjYOZeiA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3] soc: qcom: llcc: Update the SCT table for IPQ5424
Date: Mon, 31 Aug 2026 12:53:37 -0500
Message-ID: <178819882997.1411250.16401704788552603182.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819-ipq5424_llcc_updates-v3-1-42b48451481d@oss.qualcomm.com>
References: <20260819-ipq5424_llcc_updates-v3-1-42b48451481d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Aug 2026 21:53:27 +0530, Kathiravan Thirumoorthy wrote:
> Update the IPQ5424 LLCC slice configuration table to give the PPE
> and Wi-Fi datapaths dedicated slices.
> 
> Assign slice IDs 1 and 5 to the PPE RX descriptor and RX fill use cases,
> slice IDs 6 and 7 to the Wi-Fi radios connected over PCIe, and slice ID
> 2 to the CPU subsystem. Adjust the corresponding capacities, priorities,
> and way masks for these consumers.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: llcc: Update the SCT table for IPQ5424
      commit: 57bf822e3c692e1f204d3d8674967344e7e05549

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
