Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794091346;
	b=CICHYpjjtAcUyPsCtuQibrzGSJH+jg3y1nJcuAfu3PbVKvT9HbzRUUbOW61cgBX0TsmH
	 meoEg8F5RDe2fQxR9LVfyVyxa58MbrgRo3YLne0T5OM/mPsXis3pN+cMoZAS94J8fk4xR
	 vDyo0CX9WWqR1NBWcbPT0PSdJYc1n5hqOVFX6AbDmCgVEFB9Z93Oy+6idl3hIcPxHP1+G
	 i6yPnBEO+yu/JrtvqMud+AMDIYaD1DnNBhZrCZiP8+3eG1l3leGSFc88cIIdPgweHmzXg
	 KwdFOte3Xj9t0XP+Pbt6Tx4nOWODWrJkjy4XE5XsxZLEGYF08WegDk9Byz1yZBtCboQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794091346;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xFgpOeXIhWE4x1O0Mu4ZGy/Nw4WbClkm6HsJcdNwT+A=;
	b=qXekon2e5EXJnYliwSNNPOOXh7xjB/5w8iY+LvHdqzlchn1Cx20KLrnHQrVhtCIR52k0
	 MLuX3zPPIJkWJPQ64Y02SGGu7T9Top93+i/W6ZeRqoxGV5+Y0zotxFMgIfBN9Tjsx/RTF
	 6ux4NhCt1BheFsgbaXlSIpSsuhE+ahs1pRkNhAkIaw/FDwlU96Xt433oDTsJx+B+0zyHm
	 mqmX7M47QSNauKE0tYn/MdvMcemiiww6PtOLImbaImQMYhnjpD86yr76X8NN+8E60T3QX
	 tgSyVW4DfeJWSO742lGrruLuPfatcu3Od8tB1NyZNnwhKZOa9jDH1zY5dhoAfqf7NAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lr6VX3aI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C18606A326;
	Sat,  7 Nov 2026 22:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lr6VX3aI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0904A1F0089F;
	Sat,  7 Nov 2026 22:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794091345;
	bh=xFgpOeXIhWE4x1O0Mu4ZGy/Nw4WbClkm6HsJcdNwT+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lr6VX3aIKAkiZddAWqS8pV015LkPa8GXTxKUW7KAqMyOsjAauvuuoEijtfedO0dxi
	 /G+QtmVoCH4tXfKy05k7PClFBhNKZgskEWrsrp5rlF9GMHEHsvVPKdCARiLcnzkloh
	 ve7ys7z9J/3x9bHJluwP2bkqgFwSRsVIa5DBitC4IKl9fVb8B618op80Ka/POHwpqG
	 6GCUsOdhl3sxt4sUzrylP1o5xzKVeMyFWCIQQhCwKsSHqO4GcOAZtuoXSA+XcsmYTt
	 gY/vBVFy4Ri7SqLPXXDtZrEd/PaiqdO4gbhPIR1jSzLJdgjcqeegkdUiiqk5Lt7mnT
	 Y2pTNJbks5bbA==
Date: Sat, 7 Nov 2026 16:42:19 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, kernel@collabora.com, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Use DP AltMode defines
Message-ID: <au-pMBoYrUn89Zhy@zenbook>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
 <20261017-dp-altmode-dt-defines-v2-4-7ab3d93553dd@collabora.com>
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
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-4-7ab3d93553dd@collabora.com>

On Sat, Oct 17, 2026 at 09:59:33PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 8 ++++++--
>  arch/arm64/boot/dts/qcom/sm8150-hdk.dts  | 9 +++++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index d6af679abe1a..d21b94e872ce 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -1508,8 +1508,12 @@ PDO_FIXED_USB_COMM |
>  
>  		altmodes {
>  			displayport {
> -				svid = /bits/ 16 <0xff01>;
> -				vdo = <0x00001c46>;
> +				svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
> +				vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
> +					      DP_CAP_UHBR_13_5_UNSUPPORTED,
> +					      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> +					      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> +					      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
>  			};
>  		};
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> index cdced5c848d3..3d83dd305954 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> @@ -581,8 +581,13 @@ PDO_FIXED_USB_COMM |
>  
>  		altmodes {
>  			displayport {
> -				svid = /bits/ 16 <0xff01>;
> -				vdo = <0x00001c46>;
> +				svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
> +				vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
> +					      DP_CAP_UHBR_13_5_UNSUPPORTED,
> +					      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> +					      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> +					      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
> +
>  			};
>  		};
>  
> 
> -- 
> 2.53.0
> 
