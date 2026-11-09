Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213867;
	b=g7Z4KXuyfb2SgFLteD8g0NeqLz1/pnTL58Ohl/R5fFvQD9Ffurt5dgrVuJ0XgNAj1e5w
	 mEX00uJDi9dvW+Hd1QiGdgek5ou7yQ0pK3fhE4gZJrVBTai/3cYInuFGsjHtpNB6d5wex
	 /UFx17QKfDTe75cGh6+icPDuGWwWn1taz4dRvkNjdO4zzv9VpDWNqETLUbbWzxqdMHxCy
	 j2HsvHmPs1S6bzPZb8AufNs+peljs7Brg+Q3rlE5adlynmB7phNhCfFHQwxgPFH2KLjBw
	 eyIUx0YrTiA6xt4Fdk7/AiQgVCF1EituebT+Dxg5aWkrtMBfWgrYfjNDJ6d4uFaOBLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=nONbKxpuEMSIygsHlA4QWrRW3DVRFl0YZx+k/yyrPvg=;
	b=z+rlXMeIRMc3maSkAG8Vy3AgNpPUkwct9w1eaCTjOOpn+DnKFJ3Kk+DBmPxixW9n/zRJ
	 ALQgW/CTcjHuJyv7wbvJSyTgtKIl9eyiGYEQ5AsPEI/1puSSt2pHvNiQPHArlFTOwvPGK
	 1uAjpaCBCnMuwUQsBpiZOi+9l7Qr9aeBr/SqqolXStRkXzF4ccHd4COqf2dLM7Be95uOt
	 IpCTCbnjtR+4+u3iErNHBr08WykcVj4lD4GJahmk1/cYesgn0wyZQq2hfFUgX0Qkt/7MH
	 C5lDVQ7wl7DkqUsGAdLNagRoUGIBP58zR2J0pgBbP4SalmrT6W5ijN71M5suJmVrFow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ASZbmu2Y;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A24606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5A24606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ASZbmu2Y
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e3b22e971so273971f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794213865; x=1794818665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nONbKxpuEMSIygsHlA4QWrRW3DVRFl0YZx+k/yyrPvg=;
        b=ASZbmu2YCiXCe/l7N9uYGOlrzmDqdXQ41S5SgZ0zQtP6IoF3pabLOub9aWYCBYy5Gl
         kobRY7TDG2+MCJDciqK5HOeMrnPx9I4QAeUicsa/qMshDi2wHF80EXxOke2qj91MRC+k
         QHt4xuWu+mUt/IhpjVn6a+FtyVDKilEpAs/cNSQlIxwRSFgI4rd+dFKDGS8V2DJexdNB
         bP4vXE+cdrFDW9MqugkIQIcNjUsH9vHfJQJl3cnUXxFl4jYE5uY0V+nPEUEGnbtURk0a
         z8Dbr2h7fXKnPZWdU2ISxbiHhyTXfb/3+YUcIwSZkM6Ysk5vj8zORj2usq5o+pZ9lTfD
         SSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213865; x=1794818665;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nONbKxpuEMSIygsHlA4QWrRW3DVRFl0YZx+k/yyrPvg=;
        b=gcnQUNpELzzmYqiBa+2c6PWl2Ozzn89FznyTIZY4x4vBkEeyEGQr1V5oZjuErM47hE
         mqB19K91fjwHPOLyQXAcM21/Dgkaj9YjQ3KFyazpjddLDiggtiI6gztOjdaDpBScds8D
         nReLuGQ1cwi1vS+HvjAubne17dnjfwtD3kSjZ4GM4f05fX3ozmomQX+KIka2B8/Jo7N6
         5IuYS81VCXGljxhngWYuLY/AEbYalwut/fH04xoCjTWJ5Nv0VI/SKDCMxfzYfkX4RBAK
         LrR94qphduLoA4tmP5fwL6nk/MA02Ob6lwtcHXJ0E2pjre6bn0eOtBVjwiVctOVd4Kxh
         RkDA==
X-Forwarded-Encrypted: i=1; AL+hErEXR7AI6UISSL9RKKIb93zQMG48jUfcsztL0ZWzRY4msZa4JtG8ML/v5DoZhKj497N1iQC4NgyonnUDZKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vyFl7JZNm5pEIyHygoPhHvlSwOA9dOyTyYYY6vzJmgnwGg1A4
	j2noNFX9qTu/PkTm5PmTjOsTMQ6fsTbjFv7oC3T247vbLUHip5biQGlKD1ckt6XblK8=
X-Gm-Gg: AYBFou3ShYADD8418vmYDJ9ycGAQdIS2s6WzsgetLo2qTnjHg5U/1QskQ4Spvyv3QdB
	p3UhEr3RrsMVp3JnHZpnlfg2rbGujwI6g7Ljy02u4D/N+UxHyvqV0AU6ReC1gVUKxrbtKKslg2c
	ALrEGs1pBf5dQBmzPDmSaSrq9sD731GCsOs2AcLUROv1Ocy+DH5zoskJ7hXcfdL9xzZyBdKHvIW
	KXIIjBfts48RvsT3xyAS66Y8pb7lMo8zbOL4znp3O2HtlmxHb7hioVkP77f7jdoMUqTzawcYlfP
	Y2wqxKzf4m9iHUF/ifTkLgHj/EdAabFqoaCrhvUfKjN7aJ34ugNMBYyRp05Xbx0LoZYAkSbzTEt
	7mzGT42qNpLadrQivwSXoes53gvtIN5YC6YX1lZZaMgU4NgSoeuNTDvpQPJfGaiCvDxipQd8d3z
	fQl0dYl54nbkzCzt5qSXuAgmrP3dduSR+3CFtq+k07d6BIU2giQK1HOwmdAYpTKwAGq0extEPPa
	xaMuFlYbnAxdTwnci6WWO7PWdXKrETzisCBPakysVG+Ld7qWCyBXXh+R2vrP8mYy0BqwmoGevcu
	ijRqarj8H5TyAdugEsNYKOwx1yE/fQD5qnp2WcuWbO47b+1jayZhueKdD8IsdiQGyTDYIv75p/S
	L8zWnG0U=
X-Received: by 2002:a05:6000:4287:b0:490:369b:f50e with SMTP id ffacd0b85a97d-49582e8e536mr6741411f8f.19.1794213864879;
        Mon, 09 Nov 2026 00:44:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6762:47bb:1e06:ff70? ([2a01:e0a:106d:1080:6762:47bb:1e06:ff70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4974b7645cesm1840521f8f.32.2026.11.09.00.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:44:24 -0800 (PST)
Message-ID: <14a650ed-e409-402d-b278-5af4c6c0d6dd@linaro.org>
Date: Mon, 9 Nov 2026 09:44:23 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: mark the Ethernet
 PHY as a wakeup source
To: iav@iav.lv, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261109-hc4-phy-wakeup-v1-1-d98784ecac88@iav.lv>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261109-hc4-phy-wakeup-v1-1-d98784ecac88@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/9/26 01:57, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The RTL8211F interrupt is wired to GPIOZ_14 and described in the PHY
> node, but the node does not declare that it can wake the board. Without
> wakeup-source the Realtek driver does not make the PHY wakeup capable,
> so phylink leaves Wake-on-LAN to the MAC, and a magic packet does not
> wake the board from s2idle.
> 
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Tested on ODROID-HC4 with Linux 7.4-rc1 and the U-Boot and .config of
> Armbian: s2idle, Wake-on-LAN set with ethtool after the link is up. With
> this change a magic packet woke the board 5 of 5 times, in 8 s, with
> pm_wakeup_irq pointing at the PHY. Without it, 0 of 2: the RTC alarm
> woke the board.
> 
> The test DTB had two other changes: the RTC alarm interrupt [1] and PCIe
> disabled. With PCIe enabled the board did not resume 2 of 2. In the one
> console capture resume starts when the packet is sent, then a hard LOCKUP
> and a panic follow while pci_pm_resume_noirq() of the root port runs;
> pci-meson has no system PM. So on the HC4 with its stock DT this property
> alone does not give working Wake-on-LAN yet.
> 
> Not tested on ODROID-C4, which shares this node.
> 
> [1] https://lore.kernel.org/r/20261019-hc4-rtc-alarm-irq-v1-1-078fc79e596f@iav.lv
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> index e6f02d738a21..9a4684dfbde3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> @@ -277,6 +277,7 @@ external_phy: ethernet-phy@0 {
>   		interrupt-parent = <&gpio_intc>;
>   		/* MAC_INTR on GPIOZ_14 */
>   		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
> +		wakeup-source;
>   	};
>   };
>   
> 
> ---
> base-commit: 81e55899e134541583a4e611ff750e1868671c67
> change-id: 20261109-hc4-phy-wakeup-9c15ebaa311e
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
