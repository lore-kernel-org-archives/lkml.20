Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1625C44F57D;
	Mon, 12 Oct 2026 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795400; cv=none; b=jXt9Vl0ZFBtYTtEnUyHrhTj9Qg0kOUxoNdf8uuZmzKAWauha7XDaUfnvTaPjGakpJBlRahc8W4C6F1gVhq4IIMA3NBskbvZzX4z4ZqoSIQ1ZlnVvYNLZcO8sR5pK9OcwNmzJTnvqqCm8YFDodrWjEku3q/GQjcYU31tdC7j4sTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795400; c=relaxed/simple;
	bh=dU3gGNqlfG/A64bwgJRjp5SHsS3ut+7zaOZ6QqyaqLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6OQn37tLvPqakNKt+AhBg50ZECLxYlwdusyX28uCWkWbEz9OGjVB3kgA8dWXHEA4Z+o3WKC7/CC8JEaGyw5d6ye/ifueecY+XIK7VUZrAXxkwI+9cU1RDsJUQcOMmF82QD2FxEUpCAslW+41dby2yO+l95ChQJuYnzA1jKAXi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJNqtxYo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJNqtxYo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E9A1F0089C;
	Mon, 12 Oct 2026 08:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791795398;
	bh=yXkpRTnck3boGQh7HjuUKZsKT5Kfh+CkB6JYtA7jYIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HJNqtxYoQ2J60dQyKxU3PJnjlZsC3eX9iH7dgEOgteno/0nn2ZjVi+cmYRWiLfQeP
	 pBxeHRLrDRLDA3rFaRCWWVsFMdB2wUWw/MU3SQ/wF06uQk+pcCBc/ebMISaAYWkf7J
	 s9rhNR0nBGFtWShPtD/wwdDSCUz/+RK7FTzb5+XZlDQCazqYOKNdcY9+Xip2bJKOKd
	 2h5LeKAVFUMw4pOOknPKkY6urwyO+2y9Osrvv8bIYJAMk45pHK8ROsiFesmPdOsN2K
	 xi2qBi9pIJisk6j42Q6gkih6/G7KBzzSXkmtJi+zzBEWtn9KvRSmTmDORZh3R1rRb5
	 zO7fOtNF7JyXg==
Date: Mon, 12 Oct 2026 14:26:29 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Iskren Chernev <me@iskren.info>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/5] phy: qcom-qusb2: Remove _SHIFT defines
Message-ID: <asygtAS5-iID3tob@debian>
References: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
 <20260903-topic-8996_61x5_qusb2phy-v2-3-4c3f980a4560@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260903-topic-8996_61x5_qusb2phy-v2-3-4c3f980a4560@oss.qualcomm.com>

On Thu, Sep 03, 2026 at 04:25:30PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> These are unnecessary as they may be inferred from the mask. Drop them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
