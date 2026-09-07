Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41C1370D5E;
	Mon,  7 Sep 2026 07:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766610; cv=none; b=tEdWmvJ2k/hY2A6NMLFX6nOYpJNI0B6OKpEg3qogiz4Sek6JShWJcCF8jxJbt3UkMlegQ/hYyO8v5dw1ZnpVGbCJAHQxNoyne5Dc0IgpJyXQZA1ipwO1yUt1hlPbXxBybbALriYTrwciCOi35oBYWVZmtH4Dt4K4CGZOtZXeBhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766610; c=relaxed/simple;
	bh=YvYUhssY1yYJK61u+hgnCgQtuifCkpWq4ikowUg0S5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQKZ3QcbtMg0wgfYHMMSXuUI4UWkFBO7WhoOOOXlfsKeimcMilMuTA9CSZYHmeEbe0s7NgTL5/tF/UtkOcNF73sLnTl8WHeUHcALhUE4AGX53E17Pa+7ocT7i/eVMM9gMQS/t/eEGkdN9I4E+m4GM6yuTu+sFq9gOAjaE5PzM7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bb72CyuQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bb72CyuQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327501F00A3A;
	Mon,  7 Sep 2026 07:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788766608;
	bh=S7HSpF7aGp/FOekX/pqWW1JEQZaqfktH5lFRWunbB2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bb72CyuQ8VvjOYQ/ZS3dD+OT9UE54q/VJ26tdp1foHrFASt2yJCTJk5ygFgir+XP8
	 I9RAfn2ttfb6C9vRy+pysbV71bfa8fQWg0/5d9y9EOpZYG6Ji1FEpe1kB0IYBsn8dC
	 ITlDXDtvwS+3Z+HebupwQ2FMGKbmzU3xMgfIQzWYJ6/wBmcVDXTr/CgHX7MDHyJB//
	 WuijP8w+PhmFxPbkUsuxoO84l9JqXOZLsriFR1Zn6Baz9VVQ+IDPWC0WlxlCxGz50D
	 I1NY1b0AIBzCqFqNNdoDVk4RGIGUDC4j1ppuSmhiBUTGA8F4rKckbBrz4MhRKLn6KF
	 GruW0AoXmgw/Q==
Date: Mon, 7 Sep 2026 09:36:38 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: vkoul@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH V2] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP
 UFS PHY compatible for Maili
Message-ID: <dgnhn7ucgbgzpcxpn7eemimso3muzjenog46imica67potnxf3@trntdld7iw2u>
References: <20260814070112.1676300-1-nitin.rawat@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260814070112.1676300-1-nitin.rawat@oss.qualcomm.com>

On Fri, Aug 14, 2026 at 12:31:12PM +0530, Nitin Rawat wrote:
> Document the QMP UFS PHY compatible for Qualcomm Maili to support
> physical layer functionality for UFS found on the SoC. Use fallback to
> indicate the compatibility of the QMP UFS PHY on the Maili with that on
> the Hawi.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>

Authorship is still wrong. If Jingyi wrote the patch, then 'Authorship' should
belong to Jingyi. Otherwise, if Nitin is the author, then there should be a
Co-developed-by tag for Jingyi for co-development of the patch.

For the patch content though,

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
