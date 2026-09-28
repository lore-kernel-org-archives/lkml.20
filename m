Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531E64E533E;
	Mon, 28 Sep 2026 19:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623906; cv=none; b=rkk3yvtReQLyAa6haNSGh0xfXEQHiEcf0kkpXDz6gMZMaxEoSzyYNBD+EnuA9OPcdDnvj4j+OFQw8nwtbe98x/ToO2xfrShQeuCX8szvFx5EPTkZ/JTmdI5/ttH4dw4EVSSEkDOtzfirC26FvfHCIn5Z50KOOLlqgZ40kAqA3o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623906; c=relaxed/simple;
	bh=vhPnpBi00FHE0bbSQC60YoDKpKIEUMDT8Jaqw73pjfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7PyswMem+VIQgFt09crB3p8CwOrd1b0d5pjYyVpobfqRC7L8nstb0DFqJU29cpLAKmGyALVigjQJonF1tdirfC1XXZ/LewZ7HVDv3efYb0/Ig8TMq79iIA4+gYvX4mUckLjKrifJwQFnkE2Xzi39M/CqhutlLW3uWHN4bJpc/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVvjom1U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVvjom1U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A9C1F00898;
	Mon, 28 Sep 2026 19:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790623904;
	bh=286xF3v4g4VkJV4InXRiw/By35Qg9oOY3ehPiYz153w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cVvjom1UoGrA2bqJJbCnXjnwQkYEv7k2rs1C/tSJh0FUb4zrWfpCI03kIPSJKwszr
	 mhbxpnL9SuHjuX7B6zJ6CtzDPEC6DOfxMtKCRhsRfHN8FJ65RzmrnI5WkzZMxvle3/
	 Vhe14YBeG3cI39X5zw0kSL8foaRQKzOCiQdBry4U1ATBGjNN4vHMaKbD/6yEKyqbl9
	 oDmGBmSQL012fOd3u5Zaq8Lj8dD80F0z8RQjgn+ILK5K/+Qhjy8p4z6NkAIJuwbPzr
	 fzX560Hp8ZgxT+DWp5nvUUTSQxqqBs0NTphUGPBhWSCP9c1NxsIXVOmGkeyA0PhEh3
	 sMM1eNiOSCj8w==
Date: Mon, 28 Sep 2026 14:31:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: add Lenovo ThinkPad T14s
 Gen 7 (Mahua)
Message-ID: <179062389959.407554.7248677417170944121.robh@kernel.org>
References: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918120515.595782-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918120515.595782-2-srinivas.kandagatla@oss.qualcomm.com>


On Fri, 18 Sep 2026 13:05:13 +0100, Srinivas Kandagatla wrote:
> Add lenovo,thinkpad-t14s-gen7 as a board compatible under qcom,mahua.
> The T14s Gen 7 uses the Mahua SoC (a 12-core variant of Glymur with
> cluster2 / cpu12-cpu17 fused off) rather than Glymur proper, matching
> what the platform's ACPI MADT dump reports (12 enabled + 6 disabled
> processors).
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

