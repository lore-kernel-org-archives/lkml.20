Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B743318EFF;
	Mon, 12 Oct 2026 08:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793240; cv=none; b=lKD8ITMmw/5o6lKanZBvojZCUpSQojKcm27gpyoyevRcVnk0SVXFFJz70OJyERus+3Ly/8XhCG614lSbSb1jSTe7JloGFDm7qA2iL2XXWn58Ao6PQL7oJNlkg9yxCrbCjLTfqYR7pebNAvMUu7WHdHjq2TrtN7wSwYhjZlPtJG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793240; c=relaxed/simple;
	bh=NdBmE+arUhCUQk4s6QlgkHgrLxuewrAeF7CdR10Du2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdPXLleNDAA4z5pGmhZdShDgoK62tb7XdvALjdL2X1kO5IPqdjaXXUVhH9dM6yz5RZaBQnOpn8WD7znHsNAihRMFIhPM63JCYeKb4PMG+9QQtYKlZqWLO5OAq3PHoa9ks9i95kM/IMet4oXQCshaleSTeTxRzmwb8Vd2QsJyrAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4fh06Mq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4fh06Mq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9264C1F0089B;
	Mon, 12 Oct 2026 08:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791793238;
	bh=wtGjqMDW3CpJJHF3B6yMKEQikZ5WiODedxSJ3vWP+Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U4fh06Mq/+mxOG6tt+/NDp78ofjUvBWDu046poy6x3BmTg75VA7S8MjzqHihIBkVM
	 4hAb3HFhpe52IMCpdnpRJqVse9mvInxxic+HP7ro2H4JcaLdlfZhoQB37ozQtFG1+Z
	 K8FYeNjalhTx0PPdK9DhiOMwywXZTTtLOn+I4YPjMlpRjqbol0whdfyy+caAqc1Lg4
	 3RyCvC3l5AItlLbCiIf3SkbI8M2hOWjUeFq417+QiWBBGLuZpQgnWLlUJ4qwv7JHY+
	 nDPjIJ8/+aw6DnxRIcMjrKdqZkTNkfLIUFENaG8TDfxrR9L8IwT2n8m8BPUS4zJ31+
	 x8KSR7qy0TLWw==
Date: Mon, 12 Oct 2026 13:50:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, Andy Gross <agross@codeaurora.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 07/10] phy: qcom-ipq806x-usb: parse the tx-deamp-3_5db
 property as documented
Message-ID: <asyYLiGuhLFnyvwJ@debian>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-7-1a47e1185524@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810-msm8974-usb3-v1-7-1a47e1185524@oss.qualcomm.com>

On Mon, Aug 10, 2026 at 02:42:37PM +0300, Dmitry Baryshkov wrote:
> The driver reads the transmit de-emphasis override from
> qcom,tx-deamp_3_5db while the binding documents qcom,tx-deamp-3_5db,
> so a device tree following the binding is silently ignored and the
> default is used instead. No in-tree device tree uses either spelling.
> 
> Parse the property under its documented name.
> 
> Fixes: ef19b117b834 ("phy: qualcomm: add qcom ipq806x dwc usb phy driver")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
