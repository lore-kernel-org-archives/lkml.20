Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990103F58FF;
	Fri, 11 Sep 2026 02:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093566; cv=none; b=W6xjLu05A658nctssOXLquvZmy74tYEBMWnZ0+HJXiU10zokX6iDJTYTOMAwknvaiRV4uUMl9uqdrQ3FIpf3oolZGje1THCt4k5IzT2EwLJmN/vJoOUN9MvRP1+lsJTHAxwb36u0rEQYQlfNKQl6XNFl4budqd/HHKlEGrg4u5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093566; c=relaxed/simple;
	bh=OAIRA/hJv4sH7k3GirRH3xuIyglwcKG7vI3jfolaNOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NR2VEPjgfYJtlGt09dkIVSvxLgaLLp5zjnsqw9PEOaOI3DzRCeW6Bf80o/MMkbKf7yGofQZlVY5+9kvaiUqBO8CCbmnT2Bssv7apG5fX675ostua6bqu35XmHpFdnxz98kzVzRbamd7dPg63zM9aNr6YtJtCLZB1V7u2SzvJo50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZN/3rJUc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZN/3rJUc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15701F00898;
	Fri, 11 Sep 2026 02:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789093565;
	bh=2vQ0nADTCPvv2XDXYbR+jf3PCA0vVJ2xAZC43GvwC8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZN/3rJUca34r1Si7oCWa6Z3iQ557S58D2/FZSnV+lqEr9fvvuvid4COfYyRKGKtXM
	 v95F868O6G1sT+JUx7ZtsZ9xHhUODpzemRnUst9q+7DVNPUnVcZcSZiXHg3OwcJ1kH
	 a7B9FLZQDMt0Ul6jswYmXdGfu/et/tKCTnxNBQd8k/6pfz+Nd+YqtRf0HeO0+9OZ2p
	 iZ1JrxXaKBB1MUnONopXzj0C+LSsclIW1gD9k8GQFBqfeuqhGRwgBxcIBMQjQeCAee
	 lYsZMrxtl0mWZjrUXa5fKjPDGad8wM6KJmseVAxYt3GtSi1yUTC4vW1azJ1PdYsp13
	 Squ7CYn4Qxidw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop redundant qcom-rpmpd.h includes
Date: Thu, 10 Sep 2026 21:25:42 -0500
Message-ID: <178909353854.920241.15673335628733040783.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826085323.539860-1-shengchao.guo@oss.qualcomm.com>
References: <20260826085323.539860-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 26 Aug 2026 16:53:23 +0800, Shawn Guo wrote:
> qcom-rpmpd.h already includes qcom,rpmhpd.h via its own #include
> directive, so any DTS file including both headers carries a redundant
> include.  All affected files only reference RPMH_* constants (defined
> in qcom,rpmhpd.h) and none use RPMPD_* constants, so drop the
> superfluous qcom-rpmpd.h includes.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: Drop redundant qcom-rpmpd.h includes
      commit: 0d58a5fcedb65c2e68c61e41e8c93f401c9ca995

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
