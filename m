Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169398;
	b=eAOxobsVg9ulA9fX1bHRKSPf4mSjTLN563TedWuWVAdYF525SSZnmkTYLee8tLgXCIhB
	 L9/KfUDWSXwr5y4Bxukco5SBl3AxwYQ8ikAOHtMkEHhxcg0vEO3Ps/zTq2cf4RnBa735b
	 jxoUp4PqyijFqAEcijO/3eWo9c1622JAeva9jB9xStUk2DaQXwmvow1V3ntJNPr3mqdM1
	 mD23ssSVplDV8fC+dI1K+XtoBOJAiAiU2YlKulq3fs5dKll4hH73N7UgDjqPXMoQ0TmO5
	 xzRpmPnEZogz9oJuO8moCl6Bm//mXnUNErC4EpDKeCy9nNzIq6o4zT/CEf5t9T8YmGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169398;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=trLoVpa1IJp6gbRN3PMqct+Cbkr/MlbXtMdCic/eb94=;
	b=h/5GDzbSVX7VO1JzXoDQ0qHZhId5KFmnP0oVEQyo2CxP2CDTYhoQkvn0be5HnqxDw1Fn
	 snH7nh9A+ZYIDAStx5ctsok7lJPmgcrACjiBI4Pq1nc31A2ZMDsEbIVmnpWCxhxFdgkH7
	 C1RUUCIS9xJmK53HVBjw+qoYJ2uUfUBHbU2dzgtUpA6kPW0PybP5nP6GHIPDLR5o4D5nS
	 APTjtlIOigahswD7Asq9KCFk76UA4uwDBcQQkenODGYJHneD0baNptX8PguiYSkhK+d9W
	 tAKCmt2RJ85HpiVsW1/pRIXq+Ewv8dLqb5cNNM/5PRQLjnMZuCIdzu7kPtdnHQHkQ0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mj1B++OS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2076070285;
	Sun,  8 Nov 2026 20:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mj1B++OS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2C81F008BF;
	Sun,  8 Nov 2026 20:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169398;
	bh=trLoVpa1IJp6gbRN3PMqct+Cbkr/MlbXtMdCic/eb94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mj1B++OSuOLyV6qcz91uo5LR8HDrWCZUl3ob+GZvLLA/3bcn3+u28vMoOpPR/7qg+
	 KLfUymu6N5VI9KXBpWsy+xSVHjDRa6F1WoK9YH4jAFOkvP/971y+gGFJIHrNLQQ2JH
	 3GZ7VXlGIR60JDMsh2167lzpB5P0VAtwzfnU/wnqvFPXjjldPQNJVUqBb/4xS3c4QZ
	 DEYcrjToZQlNERlb8sZHokkWRlPK12zmrZ3opd9dNwa9UAn3wFMBT2+8OIoqYCh0sG
	 TL1QLgA4S0Ks1D3oOs3xO0LzYbCJ/aYbHNnqiln7BIAydP3H0CxzQh63bTrEEYyxW9
	 0L2Z5ZQFNiH/A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark tpdm_dcc device as failed
Date: Sun,  8 Nov 2026 14:20:05 -0600
Message-ID: <179416929334.628393.15121064053629630718.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008-remove_tpdm_dcc_device-v1-1-48574c6ae6c2@oss.qualcomm.com>
References: <20261008-remove_tpdm_dcc_device-v1-1-48574c6ae6c2@oss.qualcomm.com>
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


On Thu, 08 Oct 2026 14:08:05 +0800, Jie Gan wrote:
> The tpdm_dcc device cannot work properly on secure devices because its
> required clock cannot be enabled due to a hardware issue. Mark the
> node with status = "fail" to reflect this.

Applied, thanks!

[1/1] arm64: dts: qcom: shikra: Mark tpdm_dcc device as failed
      commit: 7ec63c6b88a88076a2faf59713d0126b542a9f0d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
