Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497079;
	b=HuEvXNv2fucCHwGCP/Cxptiq2sHXJXCPULlio4JBzLicV6vcWMKlWFVc7E2SfiMq4Qdz
	 pHTKtoK2RxJ2Y2q3pgIgDoXgvKPz6grun3Z+jCSVVRHVBoqY9/wBZk6kI/hAV8jJIaOFs
	 ewFsUJV+A+sNAcIkN9RKjjVBYnt7YFGV2+Z7aNFBA+lX9sctKB6MZRp2m51VVH16yJ877
	 +yPM8AlmKLbrUfgZyzq47aD0UmRAxnwSMHBkkvaJMXNfHOG/zrZ/GrAU5ki/qwllGOfTK
	 87Y4T4FmLOUL9YISTOsXkftbPrOITR1cDxbj0xqArkVNd34Djd3WMTINJluzG4goF0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497079;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=v+poDdCMqQMdpLhxPUAROlDMmt9p0JT0iZceQMYjtOE=;
	b=ZGDwPl7j7xFjoBFl7hpKGQU4wZ/BHYcyXVgWnj9hB/aUAFTofFy5KG13jUfk9I9Fg78F
	 4FUIU0m5MyZT6P4SGWEzLc6tEUEoKJ36dOWkVvqpivbm5alu2g2hbFvrxrzuNnx77JKu6
	 0EbxPRUD0ycYVEqIW4aUNRCB5qXr+YVZFJ4wjQY0xAQZyW/PswE6kCsjCYuYalbZzarB7
	 F/Jxzb+oUiAXrXUkGwUzdEjU4ccDaaZrC+xO9vU1LwP05p34FLiUwQJCnFyiMMxUDzMin
	 1xx/HiQHTfElaymtb55vSkxnXjGcyt3YhQxazVyvR77nEaWjLpylWoHhmwzo02Z0bIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X5Q+GuNf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0CE606A31A;
	Tue, 20 Oct 2026 11:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X5Q+GuNf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6841F000C5;
	Tue, 20 Oct 2026 11:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792497079;
	bh=v+poDdCMqQMdpLhxPUAROlDMmt9p0JT0iZceQMYjtOE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=X5Q+GuNflO7uInKcvLeh4NoPPJJ11XgkvXO4nd/e7DAbskiV/bprsQqHBb/C/kimw
	 dfl7V8D1T0Uv69T7fLhL12TIjZvI8xAPHA6kKAzkaKI9ZbmoAiygGbLCbQjYBSGoRr
	 9n1OKlm2hrn7MDyrzAZUyOAFccJik+5LFSH/YGy2UFdc/mGA5Q4GKPqqQffR3UG7DX
	 LjJzFauFsvEnlMHXmUtcZT9uwLZJGVNMMIOtWIvzw7GFJXT+nRAIba/utUt0I6arCA
	 miF1RIBrI02DrpoYgs0P2Tx2r8SLa4EBxOxGbRxZkoTFRcfOZymY1A1vEUflFwWvhE
	 JhynWPB5l0zbw==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sriram Dash <quic_sriramd@quicinc.com>,
 Shazad Hussain <quic_shazhuss@quicinc.com>
Subject: Re: [PATCH v6 2/2] phy: qcom: qmp-usb: Add support for SA8255P
In-Reply-To: <179216560275.106618.16177081518764116321.b4-reply@b4>
References: <20261002-phy-qcom-qmp-usb-8255-v6-0-bb7dfc5636b4@kernel.org>
 <20261002-phy-qcom-qmp-usb-8255-v6-2-bb7dfc5636b4@kernel.org>
 <179216560275.106618.16177081518764116321.b4-reply@b4>
Date: Tue, 20 Oct 2026 13:51:17 +0200
Message-ID: <xhkdb5wyw4mkq.fsf@mkorpers-koolstof.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Oct 16, 2026 at 21:16, Manivannan Sadhasivam <mani@kernel.org> wrote:

> On 2026-10-02 11:39 +0200, Mattijs Korpershoek wrote:
>> From: Sriram Dash <quic_sriramd@quicinc.com>
>> 
>> The Qualcomm automotive SA8255p SoC relies on firmware to configure
>> platform resources, including clocks, interconnects and TLMM.
>> The driver requests resources operations over SCMI using power protocols.
>> 
>> The SCMI power protocol enables or disables resources like clocks,
>> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
>> such as resume/suspend, to control power on/off.
>> 
>> Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
>> whereas power domain "transfer" controls clocks and interconnects.
>> 
>> In this variant, two disjoint sets of resources are modeled against
>> the power domain suppliers which can be turned on/off to achieve modeled
>> device states. Two modeled low power states d1 and d3 are supported.
>> 
>> transition: d0 <--> d3  :: both core and transfer suppliers
>> transition: d0 <--> d1  :: only transfer supplier
>> 
>> Signed-off-by: Sriram Dash <quic_sriramd@quicinc.com>
>> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
>
> Same comment as the other series.

Yes, thank you. I'll work on the other series and once we have something
that's good there I'll create a v7 here.

Thanks
Mattijs

>
> - Mani
