Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683DE466B09;
	Mon, 28 Sep 2026 11:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593251; cv=none; b=QURyilcJET0pgm5I/xlM4Zm8oOgTVCqWvD1QBdydr30EOlfJb9I3mNeNHxNZU+Yylz4dXkdgx+IooDINZpyyprtwx3FyVo23GlBucyDgei0skxvCQYa3SlR6znE721fMVkEwqB0M50sXyph7Oh5H8RM1rIKnXmKTOmHsF7uENFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593251; c=relaxed/simple;
	bh=Y3q3FbhJilAr1zN2GHb8QP7X/FWneClMaIrQ9ZwEh98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r35OPVrl4MunNSNEtFTVona90TC3BeYouA11JhNwCzpvwOicyFjNg3FBuAAgBw7xfIo93bc2MSm6s8ZuRLkaggUL/+VMCNbi8QDghmeAyDdfED68Ll/VhwQFOaM04zLRR+tpmy0i6EOFx6xodet6QiZkDTU7l92erfXMG/oRRmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uj5LeiOo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uj5LeiOo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D541F000FF;
	Mon, 28 Sep 2026 11:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790593250;
	bh=olWul0pqqWd1gtiw/b9RrWf+HDuYnQatlH9Jins6Th8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uj5LeiOoohEmKi+TT8JK/cukKFAjytwXc0AgTG8gKI2JpBvoBvctK5mwFmdJXiinW
	 Pz0uElHSxhrOxuohcceiDNMHyFH0b/vNKHSrnyWrkuPbVwYIiJ0yD4tfg8FCSLcIoG
	 yPQNAiRIZL9o3QoSbOWR4r+NJU+Lhd69p8S2DjdCzcFAsB/PDAREgoo6wS4L+G4wJF
	 Sd1F2NGfN+VeFwcFw2Eq2sqAcsMSpAybyh/U1Y3HmqI9o7JpHJeaKE4rD6w3wVY5SM
	 Qg/rbpeRYHFSwLpp8c1PPMtLfJ6SJ9//XjK9rpRG538Xei0OeDyydgpCzGSwHGUb0a
	 q3DD0cjWe2ZJw==
Date: Mon, 28 Sep 2026 13:00:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650
 compatible
Message-ID: <20260928-gentle-lemming-of-ampleness-4b4c77@quoll>
References: <20260924-ctrl-v2-1-fbedbe760375@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260924-ctrl-v2-1-fbedbe760375@oss.qualcomm.com>

On Thu, Sep 24, 2026 at 01:19:05PM +0530, Varadarajan Narayanan wrote:
> Add the qcom,ipq9650-dwc3 compatible for the two DWC3 USB controllers found
> on IPQ9650, using qcom,snps-dwc3 as the fallback compatible.
> 
> One controller is connected to a High-Speed PHY, while the other is
> connected to both High-Speed and SuperSpeed PHYs.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> Add bindings and dwc3-qcom glue driver changes for adding support to the
> two USB controllers present in IPQ9650.
> ---
> Changes in v2:
> - Rebase to top of tree
> - Drop 'usb: dwc3: qcom: Allow the glue layer to pass ref_clk to the core'.
>   This will be taken care of the by https://lore.kernel.org/linux-arm-msm/20260906-ipq-flatten-usb-v3-2-13e4e0f63123@outlook.com/
> - Add ipq9650 to existing clock constraints instead of new constraints
> - Link to v1: https://lore.kernel.org/r/20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index 9f91c8711e02..a8fbf72c6375 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -36,6 +36,7 @@ properties:
>            - qcom,ipq8064-dwc3
>            - qcom,ipq8074-dwc3
>            - qcom,ipq9574-dwc3
> +          - qcom,ipq9650-dwc3
>            - qcom,kaanapali-dwc3
>            - qcom,maili-dwc3
>            - qcom,milos-dwc3
> @@ -210,6 +211,7 @@ allOf:
>                - qcom,ipq5210-dwc3
>                - qcom,ipq5424-dwc3
>                - qcom,ipq9574-dwc3
> +              - qcom,ipq9650-dwc3

You had 6 clocks before, now only 5. Not explained in the changelog.

Best regards,
Krzysztof

