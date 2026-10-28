Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182219;
	b=XWpuXFQqAhTM1t8943TLZdMLGA62FnpCWVzbZydlToEXyMbQt047hucs8fnsxFDMPJpm
	 vVt/4OpRkAM19B5WwTnPfKzmWNtMWeLWgIbbNGAuKh0VcqmkXWovUidqGXNxiGoKPprIv
	 N1FDr7WKbhk/fVnVUHrmYWKdSGzVAp8G+rzbb0gPuUOw1WSQEk4dm9WvOQonArHC+3yXh
	 L1QPXcGT6bYPUHYfRRx420c2Ph2UJBk+jJ3OWrQKjvIDptwCs0+qh/Glw/zw7+U+KhlQW
	 n9RljD/UzTtGMm3afgUAG7/+UYzUF5r7VYCBf7DWg5HkpQM0F8rLPPCyhCRqYrkcKoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182219;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=cKELuaD9Ie6Wnn1CxU2GmM1KmGGgirgeDOIpmC2cCUg=;
	b=m4IQAjAkHv37dS/LWIA6zX8E1MALY22bnseLfUvPBh4Qb/DaKn2k95jngUwTyQ4+3OSH
	 bc8u2rC137zgKZ2jMAT/2U+UU+gdb5qeVAjqgdVWrSQu9E23/WyzXAisFza2iZDZGMyQL
	 4hsr2MjOUJKCZBDazc5CGZywpfdWWAnlCSBbYUpW/0YaaUqWCjf9cvWAh+EMdGe9xJeD2
	 aiT/jTZnVfU73Q9Tkkc/Y+4/5bsFs/lVvC7EU4GwjVExMQy9E9juQGyOpdTaqfpBGahq7
	 fuRcy57bLPWogGyUU3gRcjX6QDMnq4hhIwVwK2UECPTXS7CRQvNqmRn4Mjq0UVn50wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bMuVOyhS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A68606A31A;
	Wed, 28 Oct 2026 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bMuVOyhS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF891F01825;
	Wed, 28 Oct 2026 10:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793182218;
	bh=cKELuaD9Ie6Wnn1CxU2GmM1KmGGgirgeDOIpmC2cCUg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bMuVOyhSp4DaG0p3XbSvBAUGlFW7FWYjyLvjCDT4Xx3iwiztXSf6V2NJ8enAFMjDY
	 vmXeSS0wNfHN9p+6dcY9f7LEdjtnXIfLNVKjJnIivwsJ4LkQYCefzwVBP9yQUOurcF
	 Pnjitvl1v2JT980gnK6FtSxxZhiGtS9sk+gQoWSeyY8IMDLBJMLv2mAtV3CqMpJhOu
	 3E1dAzgJYROc6CB1dQJTZGaeQYwpTwkpqYIUGyTKhnJgOStf2Pox6kZdd2GaGCPldO
	 73E7jCp8dJm70kK2SfTpeoZAJN83ym77/qD0rrQJNttz9AUUboQsRxp54i2VzammUC
	 ZJFaxG36O8xNw==
Message-ID: <8e05a28e-7881-4bf5-98c7-c5ccf4e22735@kernel.org>
Date: Wed, 28 Oct 2026 12:10:14 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] media: camss: add SM8750 support
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: 'Bryan O'Donoghue' <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Qianhui.

On 10/28/26 11:29, Qianhui Xu wrote:
> This series adds camera capture support for the Qualcomm SM8750 SoC
> (camera subsystem block with three full and two lite CSIDs, six CSIPHY,

for CSIPHYs you shall use the new MIPI CSI2 PHY driver unavoidably, see
drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c, as a reference see the
recently published SM8450 CAMSS support:

   https://lore.kernel.org/linux-arm-msm/20261026224957.1115370-1-vz@kernel.org

> three full and two lite VFEs and three CSITPGs).  It was developed on a
> Lenovo TB322FC (Y700 Gen4 tablet) and both of its sensors (rear s5kjns,
> front gc08a8) capture at full resolution and 30 fps with it, through
> libcamera.
> 
> The block is close to the SM8650 one, but the capture interrupts move from
> the VFE to the CSID: the VFE of this generation has no useful interrupt
> sources, and the CSID reports RDI buffer done, register update completion
> and CAMIF start-of-frame per CSI2 stream.  That drives the two structural
> changes in the series:
> 

-- 
Best wishes,
Vladimir
