Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED27455636;
	Mon, 31 Aug 2026 17:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198847; cv=none; b=BM0yXEt+pDMEK86JzpCK66jCAYgj6vZJH2i+XPYXDmURkF3wVPe1Uv39+fEBYk9NcwrSx5TEbCyeKFBB0Z+f4/UJvZmg0WtTB37gA5T/x0qawDWEmoN3DkR554pIcLccqTMAIS20DQAACtrz6j9/DlXJCqTswSeZaUCRgj/y0uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198847; c=relaxed/simple;
	bh=Fff09j9x7cLgjE65+taZ/w2XnpxCs7qqT4VfoDNOiWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HRDQGVAnUDklHA9ZVrO6nt3O9hi8/nX0iVVMwS3kPFYj6Gi1uis5MG6K4mgFayBq48PGEGgYZ7pvg4SIHq32V1u9G92nUhSRQkvIKj3RsvTb/loeDatGRyt5xMhSfay+yYsgxTCY25xfl+h3Xxg0sTKO8hrApAuKgg2OqlQ0Pc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xhqb1lSu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xhqb1lSu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 784991F00A3D;
	Mon, 31 Aug 2026 17:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198846;
	bh=gomQlLulf6sfwYK52Z3XzNywzZ9bpMtZuFoG3PO2fcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Xhqb1lSuJV6S5BZ2p7MHSySsmphN6pD81FhJIkI9km+7QK1CEa/uifbgrWQubP3qv
	 v6PFbaxDSD86JovkoidLAozz5bUcd7tcT/Ixfc7PdR9+d4+gAILfGUZ/hHVLfq61OB
	 lDU0t+CrGsJjIMax9TruTq48BUybr2xsDNSjD3yHKFZ0S0AZfQpa+XaVNHhTAFZW4a
	 bJ0vwqZe0dYI6k/fTEFOfaSg6xBvkHn7JbtSwIeVbljkDvxzSFVm9Tq8dIUgZJLcg2
	 GlysuD+wO74L9i4jyNUeODbzK2tws8Zn68eec0FHY9eaPZ+4KAnX/Te4x0E7CWDwFl
	 KcMWk94CiiOCw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Greg Ociepka <greg@ferrisoft.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add missing USB clock, power and bandwidth votes
Date: Mon, 31 Aug 2026 12:53:33 -0500
Message-ID: <178819882986.1411250.14850856788064355579.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812083522.774711-1-greg@ferrisoft.com>
References: <20260812083522.774711-1-greg@ferrisoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Aug 2026 10:35:22 +0200, Greg Ociepka wrote:
> The four USB3 controller nodes on Glymur (usb_0, usb_1, usb_2, usb_mp)
> are missing three property groups that Glymur's own usb_hs node at
> a200000 already carries, and that Hamoa (x1e80100) carries on all five
> of its USB controllers:
> 
>   - assigned-clocks / assigned-clock-rates
>   - required-opps
>   - interconnects / interconnect-names
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: Add missing USB clock, power and bandwidth votes
      commit: 0f8d35f04a126fb17134728ec441a177a35babb5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
