Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A7D3F4DFD;
	Tue, 29 Sep 2026 03:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651802; cv=none; b=vDDjoc/P+3fMsZO8e5Eaya5HdojQG5A4l16ibT7rxIiHQQALFF1gVPRircHFNVzDUgQ+8Y9zAL2PHQPmDzevqj8ciiH1HEbAR/0QpKbGt7vagj6lJhk+JP4SbKfF81vmgkHT734VCyPG4c/4eZNeIaHt0xoTV9HEI8j/MDy5KoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651802; c=relaxed/simple;
	bh=eUaOK0NSEYoTIBkH/yA6zuAnDRfbZsBEstPfsGqm9j4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CJzIUQ8XtsSLY9+VT81utO93jnulC7htMTtvCenBFOF46irte2upj3IPNaYj/B8C3RjlPlB/p+I/QpF4EmU+bVm8bQUm7pwhfOoAk8LlgsQuh8CXlZMHz/GYJ1qZb/GPsAP32gjlFbyn+0BsqpaPdvnZ0X87xhEtWrjN99pviTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0w5Qqsr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0w5Qqsr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D95D1F00898;
	Tue, 29 Sep 2026 03:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651794;
	bh=XgbvNvziotobC+pFxO0K1JfnxxPlDUwwTZHaMBG5GEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A0w5QqsrngPWU/xK5lCt90YBpryls4+Tb6m5dGeTbIlbY+eT33CWrAXJARJ6uw+7k
	 rYrZRulnO8e2GoEvNlPr1GWfJyj8unNh7pAseZghqayB086nQjrUpQY+jxBedFbVOv
	 Vxx8Mg9D/4zct187jpQxtGrJNLdheX8h3/2JQveozSCnZj9gHsUm/jx8kttgUfWA7C
	 boWtFYu9nzi2urHyfx4CYYEKhdYHG6OWxlEWF32TgbYfLVNJQ5rP7hJ5dzwuwnBext
	 MoRGNcQ4UWg7awxu1a6HI4foF6XIB1t704C1RLZVi5gB+FyHLuChXbTuSdnm9qfsK9
	 o4KPvFUu1nIGw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
	Chenna Kesava Raju <chennak@qti.qualcomm.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Christopher Obbard <chris.obbard@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: agatti: Add memory-region for audio PD
Date: Mon, 28 Sep 2026 22:15:21 -0500
Message-ID: <179065170973.2673486.13472404694105139562.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908-agatti-audio-v4-1-b3db91d3fdec@oss.qualcomm.com>
References: <20260908-agatti-audio-v4-1-b3db91d3fdec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 08 Sep 2026 12:23:01 +0530, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.

Applied, thanks!

[1/1] arm64: dts: qcom: agatti: Add memory-region for audio PD
      commit: 3fbf3b85bf861e1f4eb32312a1e3f22ffc8e6ca1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
