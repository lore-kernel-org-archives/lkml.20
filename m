Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97280224AFA;
	Thu, 24 Sep 2026 01:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790211854; cv=none; b=B12S9oVrP3QWeacWzQIjesfKTXjXdgG1QUTONw2rN1EJyP8kAn9IOeoeswsqgonl6sE5zqIcPrsT4aKwR+C1j51PZXoC+bVt2BiK4awGy7gT1durJEz5UyrlUTwoM6j1daB7l+/EWkUBQjtEikYh8oXmnQL1kL8YoQh22rVsOUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790211854; c=relaxed/simple;
	bh=6Dywqe4lirytEgFC7BPsYjMKLPVrAWcRfi6jZER7unM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V2Cgf8T0Q43NTnyrFAnRfNfbEa37GbHB2Pgy3DMXHvD1WhkgkwZU6HCA/DwbLdSeRf0GpJkYhYIkNw9fR1l/GO1Jqc2k0xC4MWCP8fpE/rOVR3KFZwCDMyFS+dj0JvlsP8OmJnXW0ToA0gNJb10M1aKLw9M3d9CchjA9JHKRp24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJQUjYIo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJQUjYIo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6AA61F000FF;
	Thu, 24 Sep 2026 01:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790211852;
	bh=OMhD+wASsF0orVauhr2ealvb0SZsxOd7O8Ty83pXR+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aJQUjYIoUD0hh65AZhs0YuVV+bBu6c5wBW+qyXwe3vVSU99is2P1jHWCn28V1Bjau
	 UgWNrmTYLtEX2D0bnDpf4GMQ/IjM5YIVQONj6B6dibz5UxZYug2Nsrgf2Arfd4S2lr
	 LEIsU3Ru2zH13vGkQqzS2yaz1GHw4RZb4WoZUU2CM6ehcb86pIJhKhxT42BmGGr/j4
	 N6KDijYWeJYPcf91pa8wzofG3/5iMF8DcQFcZW7S6LTNJxC0o5ZeeiPM7OJxZpIwAj
	 3pDjDMEYpj7p4SizZWlcVXV3NgI30GxSL5rq89LM3MucpDh4Gp8ho6OmytfiX8KjNk
	 iZAv1+FvX7NuA==
From: Bjorn Andersson <andersson@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Date: Wed, 23 Sep 2026 20:04:06 -0500
Message-ID: <179021133117.298587.11694998328909569860.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811160835.2968717-1-mojha@qti.qualcomm.com>
References: <20260811160835.2968717-1-mojha@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 11 Aug 2026 21:38:35 +0530, Mukesh Ojha wrote:
> Document the Synopsys DWC3 USB controller found on the Hawi platform.

Applied, thanks!

[1/1] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
      commit: 681ad0a8fac47460f6d278645f335ea39d06d99d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
