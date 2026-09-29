Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717493DEAC8;
	Tue, 29 Sep 2026 03:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651744; cv=none; b=N74etBMI0VmgfTqb7zP5mpU1LFThwPj4iE6bWgHV19oqPUS2e4oxxk0m7QnIPHMnd2QIlrGBXMs8OIDe835P3wGPxnlKDww68mQ5RSqludekQYKD6uEwQ/7aApdxnTCb/wL2AN3XxGk0vFC4Zm5QvCH3rEFIHAH6CSyQlhTKquU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651744; c=relaxed/simple;
	bh=bFSuYNwR3G/0W7djHhgnYGHo6ISphshupMBMRMaCdD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XDNANV9vH1GaLn0dfBOq+JtFkgnHnGlk3+c66qBDCo+M1bsKmoafnu+MYH7Wjx8PoxMHxmcuimRdGGOhhjTY7UXgbiF4tJz7RBL5AuLzJ/Mj3iaT3Bgw4E/t5oIk8/MUflCUJcHS4Z+/v+hjYQmKL1B8kt2KN0exAp8BxYB5ThQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISw9xsgn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISw9xsgn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C221F000FF;
	Tue, 29 Sep 2026 03:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651738;
	bh=8P5jpZcMRFAnu97jtalgkjIPZffR4aM2l4z7sq4DtkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ISw9xsgngWhezQDsXOrw9O0gpZJkmuwew87heJfkGNKSIEqgTDBqgXM8mziDjnEb8
	 nARAKQXN2QVSKMnHSs+5N5NhgHBO0I673diNmiVKX5ohVl6xeikxJTWQfQh15h5qJx
	 uqmJGVs9Fim7uI4b9Dku/gXbIPfKHi70imMql6ClJHKiWUY1ce4/AqCaL6/6yUQFBO
	 R8P2exqkGXDObD0bjAaeq9Em2yb/59pN5vvMU4EDzWZafCVjOz7Nke68Jz43KEUVxB
	 5EECTsHysoF+OXrgpie/yLVWy0broa0bdU8sCe7/XAoF4Y/x+ZO3h2i6VQJD2Jussb
	 3jsimrMJZeqjA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcus Ramberg <marcus@means.no>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sdm845-oneplus: Be more explicit touchsreen description
Date: Mon, 28 Sep 2026 22:14:39 -0500
Message-ID: <179065170950.2673486.5540009427451815477.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819-oneplus-ts-quirk-v1-0-0cdbcea195a2@ixit.cz>
References: <20260819-oneplus-ts-quirk-v1-0-0cdbcea195a2@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Aug 2026 15:56:38 +0200, David Heidelberg wrote:
> Useful for aftermarket touchscreens, which don't fully comply with the
> standards.

Applied, thanks!

[1/2] arm64: dts: qcom: sdm845-oneplus: Move touchscreen y-axis to the right place
      commit: d4c3b99c2fd062253af9cdc6bae26bba98afca1e
[2/2] arm64: dts: qcom: sdm845-oneplus: Define touchscreen in the detail
      commit: 33bacf8b8e69aa27c0e12892911709a549b00093

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
