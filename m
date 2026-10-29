Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260950;
	b=i//SC1hqwQeQs5p0hc6+R2y8/pMr/eQdjAwaMakNsv7dzrL5/PAn3zfY+6PZO4BkPSyi
	 i3BA3tPt6QxZb/+VxH4oIEzRgdtRUouqQ+lC2fZEXAvT6QimltASKdzJeonopp59VV4Oa
	 NZ3h9Vq5tSW0xXmMecwrUtI+0jtwilqokAgoJTNRKe44nRAV467zmuK8Vl2YtptbgN6Dt
	 aAPZ0t9NLx5VZW+NKVgCOZgR0mN25+SV5DurqKNrBiOjRNRi2bowYB0AcMG3bxd97ZPXN
	 2X69JbPqwWsRR3/76RlacsSEzkY6xPguKsVnybBpVGCNm23THx2ObFxQNABVB1c1ttQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260950;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=k7wnMyNHyOO5DHA2rACA7tUOQeKfNwQiXkD2gNMyU+g=;
	b=eZOIuLhio2Rq1J9Au11197Uisp+oiA+NZcsBfJnsVMUx+TesciRtfF0eIptK5Y1Oee9T
	 V02pUgUBX91Uk9qtaira/TLCKu8WThY/HP9cqE5W3qGqgJ0wCLReg2lGr1+m85Bur5ZTe
	 VJdfsqi34UWHsAVKeInPPPwL+HNoWXpqXyvD6aMDll0lY+Ct+HACN/Ua0fLJTB6oysc0W
	 6KrxuhY4aj1TzC3SWa8FhGpzLiBUxTo3q8lCFF2U9hD+7hvvHz+ItvWam4qufdWPiTDA6
	 hSViRTz3avoWnGFjeMxLOYtgEYjIpVATjafAmG/1lc4UUAUM5J7wxdLKTR/5TSIzplA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RnKH9UKN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30895606A31C;
	Thu, 29 Oct 2026 08:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RnKH9UKN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055A11F01825;
	Thu, 29 Oct 2026 08:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793260949;
	bh=k7wnMyNHyOO5DHA2rACA7tUOQeKfNwQiXkD2gNMyU+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RnKH9UKNWqvCzAIGT0QRRw1j2UvUkKw9PrY7/7VT7sEar/AGSgrRU8rBFG17owYb7
	 UEZGWkhOcV9mJ3T/wKHfVuHePeenQ3ZVs5sBlhUqJS8hq1KYG0VoDdjJFiOkrEQM7k
	 ibkZUgisXHZD5naK2Ih2AMmzEp0pXMc1vvPfnfxOkDqZ1eWyRBdjCL5PXl7G9qiqjj
	 fhGndGPOAAx+d/gyhmBY1dfixGdl1ENmarFTiW5igjJS7qPJIsAyNSgulA+59uibT5
	 b2Z1RKUi9yoo946/gCg9DL+j6FVRJCeBlNzmUGSNlewFJPv191XTn6rssOObQUi9Fj
	 rytuKHkjTvWTw==
Date: Thu, 29 Oct 2026 09:02:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	Sriram Dash <sriram.dash@oss.qualcomm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/7] dt-bindings: usb: Add qcom,sa8255p-dwc3 for
 firmware-managed resources
Message-ID: <20261029-stereotyped-lime-hamster-5ede06@quoll>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <3d056785e2168de7fdc238d274d3d993e0f52464.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3d056785e2168de7fdc238d274d3d993e0f52464.1793212717.git.faisal.hassan@oss.qualcomm.com>

On Thu, Oct 29, 2026 at 12:29:33AM +0530, Faisal Hassan wrote:
> On Qualcomm automotive SoC sa8255p, platform resources like clocks,
> interconnects, resets, regulators and GDSC are abstracted and managed
> collectively by firmware.
> 
> Add a new binding file for firmware-managed USB controllers where
> access to these resources is exposed as two power domains:
> - Power domain: Controls power supply (GDSC) to the USB controller
> - Bus domain: Controls clocks and interconnects for data transfer
> 
> The binding makes power-domains and power-domain-names properties mandatory
> for firmware-managed platforms. Clocks and interconnects are managed by
> firmware through these power domains and are therefore not described.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 114 ++++++++++++++++++
>  1 file changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

