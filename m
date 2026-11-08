Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169429;
	b=YS18eDqWlLQ4fGQZHv6SLI7dbg0c37k7yY5aeUdl4l4TOr3L/PMGTZTZZ5TvlVWYB7YH
	 rGBPNiAy8GXtOpfH2/g9lzeR8numtI9ChYB+qowH8mC3GxemSpud5sUTmVnEfJAPSEGkD
	 1G2aSrPmTKryVwUxz+Qaa+Xbzor56V2evxWJkfNL9VqHOH4Pspa5cemmPc9vcvZUSGmHu
	 LJl5Viv+mQEeG81M+xaY6U/65jl5tZjG2c6CokNVmiiRVKif1/DE1CwcRsLyNFND+/OZk
	 1Ez0qVFSMM0YjhhhdHp9xhvokmhvPGO+Kl1ABhu7WRpitSYZigvHoutfg2wfqonYY0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169429;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=i0ZLjJo/UfIz3f09M0iovuRDq8GoCb76iB0KMLGuC6s=;
	b=ABm/vet0wQx7Jk6KFFDSoBj3QDL/7gBOKoBFcsXLWetRejWBBKzCGrILXDm6gAss+d/7
	 xmBFM5SLkltNkspK1ibU8wPPYpYP/Y0biVn53T5aONZby9jF0MK/RVz5JYwgLyrOjo4Tu
	 AlRtsnw0IR8mkFSA8RedUNm5OEN5Sc1YdRKbEaZjmyu72YcE/46lXMOXY232NEC7R4iKh
	 qqurHrAMpdZSySRCnak+NCskQtXRbTzbFGNN3HkxdNKMRV/yroFiYaVztGI5gZeO7gPpH
	 3GTSJNwLe9ildn5JR1a6WZtMhJ/H1otKVewIYqfqmrMTyM2V/HhB0uWh22fHmWsPVsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahWlRXzo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F866074684;
	Sun,  8 Nov 2026 20:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahWlRXzo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E2D1F008AB;
	Sun,  8 Nov 2026 20:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169428;
	bh=i0ZLjJo/UfIz3f09M0iovuRDq8GoCb76iB0KMLGuC6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ahWlRXzodFcAI9X50iZq/FgVLt6m1TBlVHBbk7o008LC0kr359j92wR7PdugRnvxt
	 2LiIZPwqqBEBUiy+QJvgYmmc9hhEf72enEvrCXJ9qaqYV2DH5GnXkbAkmu1Plstb9R
	 kjJwAXNDayncqvnTyVpH7MJwty4MEz9fziqioV7rGjIU8mmHMrONgai94Hv1xJEUFo
	 45wIH+8j5fzVIj6WaMGMmHn5VaoFAeyW78/61+mWqwwqvVNyXEbt2eb4J5w2xrN41o
	 1xb1eztu4d3V2zxhrngaQ1mtR4/95x2AOvyBWw7kq5thTjMjryn7RGoaFbS+fiWI6/
	 SeuALJ9xsLaGQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5] ARM/arm64: defconfig: Drop redundant Qualcomm interconnect entries
Date: Sun,  8 Nov 2026 14:20:30 -0600
Message-ID: <179416929565.628393.5609774813055347117.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104-interconnect-qcom-clean-arm64-v5-1-395baa0c0bdd@oss.qualcomm.com>
References: <20261104-interconnect-qcom-clean-arm64-v5-1-395baa0c0bdd@oss.qualcomm.com>
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


On Wed, 04 Nov 2026 15:46:20 +0100, Krzysztof Kozlowski wrote:
> Drop all drivers from defconfig which have defaults in Kconfig.

Applied, thanks!

[1/1] ARM/arm64: defconfig: Drop redundant Qualcomm interconnect entries
      commit: f3f0178e6d6a625ec9522f194420de99934bcb60

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
