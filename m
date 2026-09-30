Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F288A4756CC;
	Wed, 30 Sep 2026 10:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764489; cv=none; b=WzGFw852y36BR43+p+ZXPTjK7kqLOEz4rnoDfI7/n4wqaWIU7fSpvt2ANy1/AkiL/JERD5+vmuay3k71us/cGrJHzeKlGFolmSZW1kAnl8cnFM94baEtYNlRSZDKD+B4BeUzGBbXieIoMH7SxO9LtklQvY4xoGOiW9jP1TSyoOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764489; c=relaxed/simple;
	bh=9gh5LzinjiXuHnf0v3lIoIpge2zdOj9QQCt2WLUj7sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLnB60R403kVHxTkOR32ZNMuqLp/shaMviggHaqqmXWsyixKhaEFtY0TgJNy7Ieqjpe83NBklYWCbOd7keaFu8UPySpywU5T2vl6a4E49csW2fiuRJkD9TRh8G9qwBtsdDHYBp79rxRgJ6xU6iqzRMe8QsnC4W8iJgqaeRk2r2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eqs1P5Zm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eqs1P5Zm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A671F000FF;
	Wed, 30 Sep 2026 10:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790764487;
	bh=MK828ISuJkI15uMct+0uQ/hrOR+sjobVw+aOebqILII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Eqs1P5Zmp+e2oKfeptfWqWOrk9J3CdUnv66gyurS1ab3Fj5rN7RS32nv2KBHVqWI9
	 4mYPESjJN88bxndW2SBj9ZOO4Lfl1nhC7vwl7CxW1gUHobwlTD0ygRe3ba3jwS9HZD
	 thHJZMH0XWdfk0xS1Lquu6E2xIZcxznpvrr2rxq83OOC564NEDk06ttT9kKcLCTnlW
	 MO36t3qLjaNtthl0Y3m/WgcH3hLR81HVo8qvH6V9vnFiaZd4O8DGUShjO39wU1g3/v
	 Yp6rmtjGEKwTNZhHcN4zo8bSYhyLJ+XfU9ytYCrZi0Bxz4+X/EZ/9DZRXynedjMNBi
	 5exqFF9ECrJYQ==
Date: Wed, 30 Sep 2026 12:34:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com, 
	Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v17 02/11] media: dt-bindings: Add CAMSS device for
 Kaanapali
Message-ID: <20260930-woodoo-crayfish-of-renovation-d6d343@quoll>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-2-dcf3fd37f76c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928-kaanapali-camss-v17-2-dcf3fd37f76c@oss.qualcomm.com>

On Mon, Sep 28, 2026 at 11:00:28PM -0700, Hangxiang Ma wrote:
> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
> platform.
> 
> The Kaanapali platform provides:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Feedback from Sashiko looks reasonable and I do not see it being
responded to. Dropping from DT Patchwork.

Best regards,
Krzysztof

