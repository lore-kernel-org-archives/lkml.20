Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011911;
	b=Mf6btLN0hG5VRH6K3+qxST1GuBIzP5n4eBKG8FuCChGRIo7DQPVZTH301IPw0xdnl5/R
	 Lf4ltxWSIEz4tkGVrIvuINOLXSOy9/yCFLOXDlfTVVtpd5kRaiRF86NltLmSlMaGXASwN
	 rkrlMheHWDoxMwddB3aNQz9BfZOoGUbaXyV7Q+ij1yaCFNMRKDJIHCBjxdFRwtvmZg1OB
	 BDixQ9sLyi6AxlDv+WOPjGeuHvq9KNK70dnkXBmvqI2CkB3OsOxcLNWAPP9t6CmG1aV6N
	 u3xPfaZOhXGhmDLKJX3JSaz54d7RWAZFy3xpF07seLNI+hjupxcZClXYoPEcgD1av+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EBf3Sy+5DcnC0QRUJ+VDMuCVNHbnBlvEfTw0fhN6JSU=;
	b=4Rv/Th1JO9PInqmRgcgFCv94uiIAxfuZGI9zI+CDmuuAoj5GP8TdSiPbWwUcZy68uKpy
	 dqZ0OVF7cBGQgo71k2qbu2XGd3KESwNxFxW9YWNAAOjwMkJuP25xsRqBDfSMbddU+TJxU
	 w325TvC2c1/bsuO/om9IiRRNYP5+CJhREZqz5cNjhiLqdOgZZmVzEanYcb2MRA8k56vtV
	 QGrUHStKhl5VVzG5bV3jLqbTv5h5XwYyYxs4iQW05sHdbciJ9KZxGfNjC8tF6T0PKb3mt
	 lUryvgEdKvecX8elrVhxj0XF/E7xvazlcYgBjbOYyGeYf4ypRwNP0/I3ybVKTsg6T+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XzVAHkr4;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2268D606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2268D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XzVAHkr4
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1423994f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793011909; x=1793616709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EBf3Sy+5DcnC0QRUJ+VDMuCVNHbnBlvEfTw0fhN6JSU=;
        b=XzVAHkr4KWhp4SR2WwzWQxCcMQaShtXQTlQewihtNNAK1hZbhAGGWkFVNIWtDj5tBg
         /gD5ANjWnHbwfvhif89hJqLigAQUenx1D+8TiKsF1DHrhMImwKFR6pYxmgg6erew40sf
         aI/3V8zvt2t1A5d5wSFIBBoz8mzW+ZGPW8iUitC+gOiNnGDHSYsesinfxorfPqqzsURJ
         OsAm2v3Iib9vHikarRa3/4A09l9F81lyojFEgbR7Ym83DdBlp+HCylhTV6PUEdzCSPWP
         mhR7EbbrdhAWzLqKssx3G8ny9998zK4hW8qpOIR9ljdEPGITQhnR7z4rK1YfPLG9dHMV
         alyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793011909; x=1793616709;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EBf3Sy+5DcnC0QRUJ+VDMuCVNHbnBlvEfTw0fhN6JSU=;
        b=wIVB2WhlmalhzSAkvdu3qK5bnHQzR6bR1SRzgZ4X/S+DerA8S5ujcdyhQI3E7oCEvD
         B6Wlsq+nHhm6Fnx/Gt++5Vt+4BkMv16tyNVkhQ77cElYog/uoDA3zp3EpHur6WVaqeV4
         ohG9RRgPT1ciQuIYrBBWefi5DmUfJ8myKrhcImpZi3uQHCwnpYaoXX7utw1aNkw7i7a6
         0wY5QXEUFUPk05DA9puM5H3pX3zdw8DxQKb3Mzk6QmrKcJARnFipgMP1QForPN0Ia9jo
         L7PuvHMvMq5zD4MCkehP+7q8QRpHONJ4GtBkNCxz9CZRfzX7gBYJXHrlSTrDxVtB1w8r
         ArBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpa2Rd86uZMwN1rwo01hZcRMDcuOyNf2fbHNrrpeF5jFNu0ud7Fdv6V43AmoRJziHLSPJsKJAuq/VL+44=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/siA+oXW+78nS3uu9FITOKjpwW1/9voh+LQZXEYHOWJV5iMri
	jJ33rWDZHwEm3vwexMCPlOKqsh6Ay4c9K6i3cLix0rBk4ILs+drnDBdD
X-Gm-Gg: AYBFou1z4xa423X80ZADqqBZ/QaEL2Va9fG+qN5YPeaAN/89ZFB1wEQQJitYYpajAFX
	SOQ46uldL8xiH0uOywf9Aji46VLPKBmA5BYzlkXflA4h7qCRWoP3773iUnmhMElchhlqtPmEEOX
	ny9IFoK9FZX30i2MdpiuKmVqPYVvXJ5EnNjRBoW6B8SbXYz/C1vf5WLQ/F7A1GgAWvdMDd6iZJS
	VCmrxlva+70vPSLHcj9ss898DJtRkiDwqCQN0D37s/rci9q+2WiEXf1n7/R0b4YfrzHbS9CFYG1
	FY2fefrkNG2bWkkaN7weGzsWlX9Y5Brs3KUDmGPKCZOb/YLQ6uOX8b5WTIqC0FTe1vwERVj9vJj
	CeqdPLpThyigSpoksZPMm05CfQacHFf2TutdEUT9X+KEeYoyTCS5UbcypS9PLK4C5c8A9lkNfoE
	eZ1PjPrU3mjsmICtY8+Y2ee7xoyc5vgCiKL1OAxx3YasrYmk1PnKVD3UGCsYpC19MPKpridS0oV
	7T/1kGovHmFf5s+2AxrWF0mq75JLXpXpHcGzeeUC0xkxF4lxFXjOgIRSSq6LqJATFtRAhQXqUHB
	uxNJ4BWcU2Po6Nz9elQuy3Qo1Q/zqvx/H0SJSH7qd93gZLZTp0JZd40=
X-Received: by 2002:a05:6000:2999:20b0:488:8ab9:f74c with SMTP id ffacd0b85a97d-48e3eb2b9a3mr8914050f8f.3.1793011909237;
        Mon, 26 Oct 2026 03:51:49 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3c32sm16077045f8f.47.2026.10.26.03.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:51:48 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:51:47 +0100
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Andrew LaMarche <andrewjlamarche@gmail.com>, linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2] dt-bindings: wireless: ath12k: allow calibration
 variant for WCN7850
Message-ID: <xrszqxg7ketpbjtafssgyjdgygwuhqx7p2ln3phrabcinrqn7c@vor67puwvmyd>
References: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>

On Mon, Sep 07, 2026 at 04:17:20PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> qcom,calibration-variant is the generic Qualcomm Wi-Fi DT property for
> selecting board-specific calibration data when the device identity alone
> is ambiguous.
> 
> Commit 06cca100ad08 ("wifi: ath12k: support calibration-variant from
> device tree") implemented support for this property in the ath12k
> driver.
> 
> WCN7850 can be used in systems where the PCI device ID and machine
> compatible are identical across product variants, or across regions with
> different regulations. For regulatory changes, the hardware description
> does not change, but the vendor-provided calibration data can differ. In
> that case neither the PCI identity nor the machine compatible can
> identify the required data, so DT needs an explicit calibration variant.
> 
> The ath10k, ath11k and ath12k WSI bindings already allow this generic
> property for the same class of board-data selection. Allow it for
> WCN7850 PCIe devices as well.
> 
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
> Changes in v2:
> - Rebased
> - Updated commit message
> - Link to v1: https://lore.kernel.org/r/20260701-ath12k-calibration-variant-v1-1-d3eddaabf026@toradex.com
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> index dc68dd59988f..cf3e1fd99c12 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> @@ -54,6 +54,12 @@ properties:
>    vddpcie1p8-supply:
>      description: VDD_PCIE_1P8 supply regulator handle
>  
> +  qcom,calibration-variant:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      String to uniquely identify variant of the calibration data for designs
> +      with colliding bus and device ids
> +
>  required:
>    - compatible
>    - reg
> 
> ---
> base-commit: 1d8e73163ef933624341075f576e2f36ef9133f7
> change-id: 20260701-ath12k-calibration-variant-b7850f7ffd7c
> 
> Best regards,
> -- 
> Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 

Hi,

Just a friendly ping on this since this since 06cca100ad08 ("wifi:
ath12k: support calibration-variant from device tree") has been in the
tree for a while now.

Kind regards,
Ernest

