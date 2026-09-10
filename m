Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B173DEFFE;
	Thu, 10 Sep 2026 08:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030583; cv=none; b=FtzbDTuyoUHpel0ihOsCfxWEPkptyflCt6a7hK2LCfpjGd/rQA+wiUn9HaQAR/1Xc8WRvXPbx55O4RXK0E1a5SCTp32Ykh2OdRsJ+ckW9FKyUg5qq4hT5wB4vxK6IqItoWTWVkv4CDTxofXK/wKvrk/6Ji4RAOSE2KgtT+rZVTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030583; c=relaxed/simple;
	bh=ErnYMO45L72M+lD7UuWWvAzkNup1Q/Qe0IaAqIsIUEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWA/VbDLdIPfbmuYqRFSl2rCrNxBytZC8n4AtAWIhp68wZNXBE7EV9nJ7ObS2Vg5AECrjPQ9UUYftyiPlJFXDZ5os3PMCmdYG3R28UZrbSwrZOXTJXNaPoq6vXfKgpQD1yl5fhdw+JhWtB0nabTOkqQhVJi1/FFdYcnThyH1Ndc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHHiysqD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHHiysqD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5901F00893;
	Thu, 10 Sep 2026 08:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789030582;
	bh=9w26yMMKHPQou+sJyGtFmR/+EEA5Vn8koezm5blCU0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bHHiysqDgBRrO3xOvn/3NlJJBdR1CTIFbx/wLG3DBkcvoWCSjxo2fVlzyY+F8jrVl
	 q17woT+IS7Ipnh++PfCSAPHZO0zcaLw5Mimk9NGQPODcdb+rxWO2Np/5xW+jrFLQN1
	 x1qSaO0dlwO8H3oRFet2+vQ3M+TDhYjpWC8FD8tpFjlNhi2d4DNKSKfQRhmYRuE2pP
	 ZpjNZXlC0gVSereV2grToWF/+fQuU6UJIpgVtzot01mrGLTwz1OsY2MdijH+8KB5sE
	 3uyNYu1jed/hnbvqPRYw+c2DvINYD9Z3w6KfY8iAoUfboy3XrbMDRE/pMsxF+TFg/4
	 SsCyAUgwW8lBg==
Date: Thu, 10 Sep 2026 10:56:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dinguyen@kernel.org
Subject: Re: [PATCH v3 3/3] Add socfpga devicetree for Draeger's M48 board.
Message-ID: <20260910-cocky-meek-pheasant-ea75bf@quoll>
References: <20260909111513.2259643-1-petko.manolov@konsulko.com>
 <20260909111513.2259643-4-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909111513.2259643-4-petko.manolov@konsulko.com>

On Wed, Sep 09, 2026 at 02:15:11PM +0300, Petko Manolov wrote:
> +
> +	aliases {
> +		/* this allow the ethaddr uboot environmnet variable contents
> +		 * to be added to the gmac0 device tree blob.
> +		 */
> +		ethernet0 = &gmac0;
> +	};
> +
> +	soc {
> +		gpio3: gpio@ff202000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0xff202000 0x20>;
> +			status = "okay";

Where was it disabled? Drop.

Best regards,
Krzysztof

