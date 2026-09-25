Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81A5417BD2;
	Fri, 25 Sep 2026 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328529; cv=none; b=ByMNSCXU8YCl61PJwaJEsnn8NZcTWmHu/eBlnBM810qIZgVT0zeiyxr4gyIH6igt0X5umPaCuQNhnp08yU2m4eBUZacAH35QcQC9GWSXxn8u7uFSZPpYCarPeyBTnkYXo6FOOGLolo588guYLo6ieBAyi/Bkl5MZkiwfcBdaT84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328529; c=relaxed/simple;
	bh=MHClR7nqHKyWm9iSFvamccKGqA4TJvuzZ/o/ZNPFu2k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qDxbULaB07Ag8kJDouSKUAm2NHoTBgv1UV5ohDFfU+xcCzM8p7OYGPF7tnmdt3TnH/Hvw3CKJsfBDg/9GZEgI3m8hDAnhGWaIfkhIRTAuor4xIH+tBF4CC2XxKtJPNtUVlA263ow34Cb3wY/e7f01pOX4SGJXL85yYiFsen/UBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZZpe+pR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZZpe+pR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1501F000FF;
	Fri, 25 Sep 2026 09:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790328528;
	bh=EuJGWkpXSYlH4/nExaO4wmdFmhs86yjzJujwn/r5LN4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PZZpe+pRtOhzf51kELKVxVnSghvvA5TLDv3EQ0h9zdO0b6McG0hrQXcU0DkKxp900
	 aFo4VyFwligjjXuQLTDOQzJX106wmNFwltgNtfi2cTy83X//71Wava5W3wva+f0skz
	 rMnavEMeBm5bHPg5+46PKwGLF4AEsQqwSpgMcMqSkk5bNPCqMUa9uqmdtYjVhj6nGq
	 k2iKIG5JvyjfWVe8iKMGddiNNTL5IQu8/CkTVgMAdmgxVee5HqUX5RaOI1/aAdhsa3
	 RZ1oXTAJ6pxDhnQ1ETDCXH0jBD1eHPIWh/rIGpjj2ozpqBBlWegCga7SRckwkupmYj
	 Ug3rG8+z2lwug==
From: Srinivas Kandagatla <srini@kernel.org>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mukesh.savaliya@oss.qualcomm.com
In-Reply-To: <20260925-slim-disable-stream-support-v3-1-cdc8171f27a2@oss.qualcomm.com>
References: <20260925-slim-disable-stream-support-v3-1-cdc8171f27a2@oss.qualcomm.com>
Subject: Re: [PATCH v3] slimbus: qcom-ngd-ctrl: Implement disable_stream
 callback
Message-Id: <179032852740.276001.1069659396094345904.b4-ty@kernel.org>
Date: Fri, 25 Sep 2026 10:28:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 25 Sep 2026 14:52:49 +0530, Viken Dadhaniya wrote:
> Switching a channel to a new frequency without first disabling the stream
> causes the channel to be re-enabled without a clean shutdown, leading to a
> crash on the DSP subsystem.
> 
> Implement qcom_slim_ngd_disable_stream() so clients can properly close a
> channel before switching to a new frequency.
> 
> [...]

Applied, thanks!

[1/1] slimbus: qcom-ngd-ctrl: Implement disable_stream callback
      commit: 82d873c864b033af83f2b8f34da025d08e4e886d

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

