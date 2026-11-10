Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285308;
	b=uuzwsTsrTaAzzn6g5WyV0AoIkQumkDP+S4bYkvAzKEao++CoSo0tyBQa9nPfuH7e2zqc
	 tmnX8aKNmgX9q5qzE6a5wFBlPXylJ4vBkJTyFxvVvW0GHXkF6KrpAkN8rrlahNv4UOifH
	 HrD6CJKytVPfs5Aj+UPyLttbubtVIj3q9QKcKPkmLJjsDlzBg5w8wZWaIj7Q3TptsstEf
	 a6UzgzsoXaupaaEle6yvMyCgetOrQZOjZE5kyllucGKxYiicbzm/BK3e0EszuyapjsRqX
	 Q8HiDVTchvMsprihEvNVidkjNPatPMmeCv4CcFz2K+STH5eVmL0RvuMG1fM1iBG99JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285308;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=vbM8nZRkwc09Hr5cJTczruOvSiNp4wubHnQjZZkSht8=;
	b=ua8gDME7A6C4t4z/XRQu0KvROB9lmGxfWVsqlUTKNmw2fJ1P2XnWgZ0ZOh5F0VqyltW6
	 QdchFn8maqohVmFJwdtYPcHRg0s3gD6EfOxbpWvuefwTAI7xSTyx5VnNFiRd/EL2i5tcV
	 8u6KRVJOiGgtE2hbQ+EH87ax3amEDsMcojA2k+vV+BJYeEB/Ht2tJumcN04oR5Wj7iE06
	 k25Caaue8JpMAo/mxI99xmoHPnQi2AretSLk4WSBzMhzxhB+3QYWkci6KVHHIf4X5bPYV
	 189dLQnfbxntHIeZCtJkeF119uhAv5WeAiD5hbe5CYzER2Ep9gN9m9idXvPi0+wkA8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=keF0rvAX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52995606A8A0;
	Tue, 10 Nov 2026 04:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=keF0rvAX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD351F008A4;
	Tue, 10 Nov 2026 04:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285307;
	bh=vbM8nZRkwc09Hr5cJTczruOvSiNp4wubHnQjZZkSht8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=keF0rvAX9lluPRCCDd/OzJP3+JcPsF/4NjlDrmQIDfaSEcEs9swJgqeuU6n7oxPhE
	 dcm4/FeZp/2Zb4j5ZJx931yTqtkJujdpdcP2NEJCnR5Uq4s1dmesxuyghJT9L729TO
	 hKW3CuLCSw8KYrsrsTw2btxBLZ60E4I0u9kYV0c+ard9S2/BhPbNmsFxD+wrrlDbcK
	 vM9LkzrwAs4bagcElRNFlYCaYYs+DzfA3wkfdAbAMB1JmaMkwfZRTVcE3fTbwQjo2h
	 +0MPJuDsm95908b9+hPSYFgZD97obnAIwBBnVRhnAFQW12rB4KnKPNgVy+D2ZKwVMY
	 zEUxnim+uRqvw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Cristian Cozzolino <cristian_ci@protonmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8953-flipkart-rimob: Fix panel compatible
Date: Mon,  9 Nov 2026 22:34:48 -0600
Message-ID: <179428529336.1061455.5768991661894005156.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818-topic-more_dt_warn_fixes-v1-1-609d283502cb@oss.qualcomm.com>
References: <20260818-topic-more_dt_warn_fixes-v1-1-609d283502cb@oss.qualcomm.com>
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


On Tue, 18 Aug 2026 16:18:10 +0200, Konrad Dybcio wrote:
> During the review process, the bindings have changed, but the DT has
> not been updated to match. Fix it to prevent a "compatible too short"
> DT warning.

Applied, thanks!

[1/1] arm64: dts: qcom: msm8953-flipkart-rimob: Fix panel compatible
      commit: 718a3890dbafdd1d1fd2b648f0fa2da488fdda09

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
