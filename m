Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE45361972;
	Thu, 10 Sep 2026 07:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026545; cv=none; b=ATz5M8rmpAbMZe2rxtjTa9anschSjeoOB+3CXNh3DZGsZK9rneLYQ+wiNqqgfW4I0T/e/h9+s1RVRsVRSTY5E1YcHiSwxvRljIgCfd2bys/gCSM02F7hEEdD1jvHAWT8QMQoLWb5ddnVfJxr1EilyqGdbu6KWat/TFdXasRovXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026545; c=relaxed/simple;
	bh=7JtvCqsOfFPonlKgm/Z3W2w8gLgdzcGiuHsEIw16bzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GeER1C1NBiuCO0tmgkgD18fIPPW1klp2WOElyVYfU8uz5rZvyf44uUmQbzhjchTsmBAPtedtyI3sKjzGA6xpkRkWKLPjkZKtLq5m2doBCISQNcWo1OylI2ARFJSNeDaA7MTEeZZD8keoADpRlsXGjaAgE/UQrJFPnW2nRfWPzgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrZrurBw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrZrurBw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C2B1F00898;
	Thu, 10 Sep 2026 07:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789026539;
	bh=MyMUVs+6MvVdb4cJP5EesoKBdbo55iy7aTWW/UgAw90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NrZrurBwpPge5JaquD5kfpba6PnYYwsS86zhBnu5YkyDUETvjQNVGMKXF3RXjeSM2
	 V3FaX+HbrcIU0zXvsrR+a899kTVHXPLZc2i3xoMgbWdAi86ROlkx0DWcnfkJgs054j
	 woQJWfBeVVQkV5DV7HpG6T+nvAnaaBxaln5oIqWohRneyBOLfN/1ux1878PtT8ihvE
	 axbaOpqnbaoacIZIxuMi7sGR9d+oLwJCZ2OoxofpCEv7UdIMKtoUJNLuwle9O/clNy
	 g4KbeSF7/etsCVvntQ3opfMZLqosiFVzRcj34qsJFL14ScsmqLPScdjWAxVlmgnX6R
	 ociAiBjgKRYpA==
Date: Thu, 10 Sep 2026 09:48:51 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>, Wenbin Yao <wenbin.yao@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: qmp: Fix alignment in pcs-v8_50 register
 header
Message-ID: <posfu7z7ijluj3go5mgyrb7xsvyoepuslj434eiotvo6fvoyrq@wqel2ccgd7xd>
References: <20260910011500.659353-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910011500.659353-1-shengchao.guo@oss.qualcomm.com>

On Thu, Sep 10, 2026 at 09:15:00AM +0800, Shawn Guo wrote:
> Fix up the whitespace so all offsets align. No functional change.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
