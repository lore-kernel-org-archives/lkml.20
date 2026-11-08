Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169465;
	b=fnv4qN97Dx+HCyZFfC/WuXs+ftDLGVOBHOVtwvyHNZSIJIv4LnCzsOcW6Jto469oAVb6
	 V835sQvbcbK17IETi4dcH8SPpNK9n0TbdMYsVhNJN7LJc36dXimLObwJv7nCf0shGELQJ
	 DAQlpA3szg56iire5RyB7UkwPYuk9j59N40nrFLEky1/nIa5bdjJzHyJCj35p+/fYhJqv
	 puA1cMWz0NDEx1trtKFGMU4ydMfpp7oaY2x6PecDpn5reXg9x7OFELw7X65+IDgjuv2v5
	 oSNmOE6QAr3u5VkVfmGFUtkbGT0poXZNq6Z1mpqXFAed1FzS+Cb0ixIfvxtLseQpx1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169465;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=n6N/bEIXZaIV4f0J7zo3jGCxDzx9d7Kua/mIE+rUuQM=;
	b=jqTH1VdlkA4boVh5PpjvtGLWpyMD8wrcDcjtpsN5YXVlbK2moazcp7NAiqf6N61Alrhg
	 Q1k+zOJPqkTEZYr/lGnhSNUObULcFVeYcDWpMSPgkkJzLZ34j0CchomRGUlkij+N3dXcZ
	 6LKt/jSElbTMXb0kho1tB4JR3WB1/fCJFYfFKAs65lhSXaZV3kl8jFnlf0uaG2W7AKq8m
	 3RbXj8p+qv+y6YDoBbXGGvslp9QP5NQnJxpeeULltwNd3ISdR5qkogEjs0qNRUfeMV6x4
	 xDDK6APKcd03/SZNsi7PH8zItx2wPnwKWUIfgYpUsfffr1sd2JFsO969GULTkviKCZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RINOYv1z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A40A607A740;
	Sun,  8 Nov 2026 20:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RINOYv1z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE221F0089F;
	Sun,  8 Nov 2026 20:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169465;
	bh=n6N/bEIXZaIV4f0J7zo3jGCxDzx9d7Kua/mIE+rUuQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RINOYv1zllflqLC3+st0ZOZO/1q/ZIIccySWqxG2ya19WZnrHSQPLUQZJO5/UeX4l
	 0X00gyIGkwiLE7XjC/sq/VcvXxZ7iSDKcP5re542tW+K5e0m0aUwmcXBuvTNic53+a
	 CqcfJET1fUr1ii1S3HdkJu7QYy+nVR+7yhrPRN8dMQFh+FKD5Qqhjs44TL0AiZfvc2
	 nSC6FYFiQvE+0OpRJqgKiE4i1fGqDxE+ykjldZmxJWtTTAnNagA28YHeUrNIUsLdcI
	 GD0yIKiV7xfCltsEo1fg0GO55lsyitKpzGmGw+AudGkN53MhEG8rx+p2PsstHCLZAG
	 uSWYthLus4W+A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/3] arm64: dts: qcom: allow SM[456]50 HDK board to play audio via I2S
Date: Sun,  8 Nov 2026 14:20:59 -0600
Message-ID: <179416929474.628393.2029895802703743256.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026-topic-sm8x50-next-hdk-i2s-v6-0-0bd654b8388d@linaro.org>
References: <20261026-topic-sm8x50-next-hdk-i2s-v6-0-0bd654b8388d@linaro.org>
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


On Mon, 26 Oct 2026 10:50:35 +0100, Neil Armstrong wrote:
> Following [1], this adds the necessary settings to setup
> the I2S link to the HDMI bridge to allow audio playback.
> 
> All dependencies are merged v7.3-rc1
> 
> [1] https://lore.kernel.org/all/20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
      commit: c6675cb43fccfdcef1bc64c771c576195ed269d6
[2/3] arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
      commit: 84feb53ed8a80aa274b030f37e602db03611c304
[3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI
      commit: 51b94c0b3d65b3f8b6d1ca9489bcf26e21a59f07

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
