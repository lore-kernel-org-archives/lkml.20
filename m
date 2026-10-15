Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB70855C30F;
	Thu, 15 Oct 2026 20:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792097033; cv=none; b=KEcjE9CWogGJUGY447X0JPIAxkiNUFUpN/t/Ik8N0uU8E6v5owh28PM8+wA6sHo1vTLrrDaikQIYFHlSEslOSksexY1U7l0kaDTCjWpmfTRGq0zfmwLMWPaHfhneofuqKNWFpe1pY7mX+hKMgPBhPEW2HinMJWvVvdjtAjMjMtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792097033; c=relaxed/simple;
	bh=bp48/nXI3VT9joC4pzu9nHQiQHo6HUOQ/XvTD2Vz+rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0CrlrUR4py0hYdBspg2Uv/PvaTlXkYWA5hmklqsy5eEY/sJoecDv5rVod82m58RKaEAvxyuxq+eUS4spqRZexjcS7UzsA0zB/sF0d7LaAvnl85u4TNtFe+WW9Mz/9F/8w0m7IkQjNYwau+oBDutfUt9aI6cUtYc/54e8Oo5cYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LmcbkzEq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmcbkzEq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D22E1F000C4;
	Thu, 15 Oct 2026 20:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792097031;
	bh=HBkm/61/EqIpH2oS9MHilspE6Gu+5NfHfDwVSSYw1NA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LmcbkzEqiyCDgq751BP7IQFxcNcXexfsf99f9W8NkOUuv8yanKR2dAmQAZbtqxwEo
	 4+uKihP0NuWcQpPtmQMP4FKPEvwI9+qN9eUxQQHnwdJuUnSmti1F939rLhJL52gdrN
	 u2Es8PjBJsx5QGGXx7R6DcK8qoFjPEB8OaIo+BOa/f6qxjApESfUpGsSUymOcX/8+D
	 nGZYEQvHdqSp0VE+5rpa4og4dgnrleHdmvCb9Mn6eamCep2HJj5P3Szpc5/t0xWcCu
	 gm6DZVZVJIjek2yum5xvuWwBBp1ckvR78lbk7c8rTWcZQkxCFxFJsDxE344OhpKQd9
	 KAMpwlWD4NZUA==
Date: Thu, 15 Oct 2026 15:43:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: William Bright <william.bright@imd-tec.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Depeng Shao <quic_depengs@quicinc.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: media: qcom,sm8550-camss: Add the
 CSI TPG regions
Message-ID: <179209702874.3156607.3998388608459603613.robh@kernel.org>
References: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
 <20261015-sm8550-camss-tpg-v3-1-00fe06a3c557@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-sm8550-camss-tpg-v3-1-00fe06a3c557@imd-tec.com>


On Thu, 15 Oct 2026 10:49:30 +0100, William Bright wrote:
> SM8550 has three CSI test pattern generators next to the CSIPHYs.
> Allow their register regions as optional trailing entries.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>  .../devicetree/bindings/media/qcom,sm8550-camss.yaml    | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

