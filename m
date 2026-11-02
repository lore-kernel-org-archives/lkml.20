Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624575;
	b=YfLeQlnA6xJPCiLf9e2EN5hmsUPW5oycbVw6M+2B1NAY5qH7ulk1iH1/1ARfXaxR2Lgs
	 ETS+iZsLc4W6Zd4kcFSRj8g75OgdNx3L2hyrlkevtYLjLSSWkTVXyY5wameY2xlNk6O8B
	 W/nBsX9Sub4cgTZWiNQL5VUVUrpiEEnfIuSgH1IdXJEPhqvIodDgDo8sOqyirZ8xd/h89
	 foB62Y/7Nr/WkN2F2OISfmphRC4Nj+s659OsII1klDaFXVaiBPIUbUylYWiTpBihYTkfg
	 2Z9efxwQSBB/cbdvwJD2gXwtjq+PVd8LfhPJwohzA7vlUjgqg2oPZUGLaESIibQJ7Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=1AR7rILZGDV9YggC4V+uwn0ccUkeTqbk+KFpZe6CZK4=;
	b=A9P/VLqBYZsKTdLEYtlA1pmwLUPusrErrRpAhkmIylXkPTnxtHcBUpCi1ffBeWPn+Z+n
	 7I8ZoSYjIQ9qSPI8IWlDKULqrC18XlHl02oy9qTzcqb/VJLyzV/pO32irPxjKm+lIxEW9
	 NLlKLchzBq798pa/Qr/qbb31JHl9VSgxqvXm0uO1H7reNna/Lnx8N77zvcgLgXIpWLAiS
	 gO0eC0/a4AUQOj/i6PsIOU29kAxUiRM/OcP6gbAmmxCxXKf+3nnnWqdO5unhzEF8aAbmC
	 CqeuORt+HLqhhqK2dwsxuUiSGHUqzk7Z179cuzGn42PvNfVEcixkTYMipmW4kBWyyYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LTs3XWrG;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A1860A2614
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A1860A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LTs3XWrG
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so25843395e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793624573; x=1794229373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AR7rILZGDV9YggC4V+uwn0ccUkeTqbk+KFpZe6CZK4=;
        b=LTs3XWrGn3gXsRcDMl9c9I4D5DoCCCt9ytN4LN0WM4eqwNa6fwRCC/sjyll/ZgSxP2
         u/YyIVwD0pyWg+4tx3qhu5t0qOu+Op5SBH3wgaLAgC20KsdWDpkF/xNp37uxEK8ke5XB
         obxrl9UlsNiU0MwhpxHzVICcnkHag9dFsg+TwMeUk/QFbaw1W/YnfDk/Y1MNMJgiBFWV
         dBN61YBWeIjZ/lTVNBr96yL90WpkQdVBBkNzcbM9QygU7on0mTxOtLi+Eq4nlkLsk5Q2
         0ugY0ztQHT6p6y4V4AngBuUGIpQ+va9Gnm25NXFMzP5Ghx2MOeAeFIDq6D+Y3SLUdTX7
         HJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624573; x=1794229373;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AR7rILZGDV9YggC4V+uwn0ccUkeTqbk+KFpZe6CZK4=;
        b=EhvJnVqV278pXCC88PKJo36B2dT1pSn0ZYs4ifOZSjiNOBLKo6NxpHvyT3xZu1rbYi
         C6OlenSg29N/UgafsmQiSdcD852moV1IIpyWMf2Fo1LZJ+7XrfezKXLZt0Zpi+PljbYO
         lk80a4oEjroefoE3ZiHWgpfrghfFrZ8Ba7vpTAE7g8YjurSjpNawSnmyW0uhrcrH4hqv
         HnzOvGS7C3aA+eY9RF+7B/UkXExJFs5KVazE++gvnC1mmtQa5OUG+xzjatsaJMD1rvUN
         K1OCMGOfnco0eG5sZgTh+GMw7npzoKrHwf4x8AcI/ZWG0F0Ek/F/qKiz1wtgrruKoUyX
         rq7A==
X-Forwarded-Encrypted: i=1; AKwUvBw0h0G9tsuUPvgJ2jk4iA3ueqdl1rPsFao9pQA+vPtIIoOcTFj5t82Y4bQfC+pJWky3ND12Fx848QvB/o0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL5+bz8cyDPs0SXC2pd4RnTZC+iN620JVhhPT/oXbbZ+9jd7d4
	+x2nvE4FklihmuC6CjgB5kvjapJmjyFneeoHfmeQuAPGOvS+rDMZO6Rnc9sBeeyKMNQ=
X-Gm-Gg: AYBFou12Ulg5wgN8ZiPU6oiwtqG5ZRMfMibLpJgVREafSXyxQrzYZFS0IQES3ZCzkMY
	O/cHXeXpVVf61r7MTsB5LLtsOxwFgj2hxJszEJ4S7q8PmejNDQ4/sNMBESZzMyohaXBM7Hq1bjP
	zEkrX0ESeKV5ul7KrndI+Bj2p1rh5t644JF93JRcHUUX0RhpU04xehQAJrByahGVDHMOwyT/cU7
	3iwATWQOqruqvuqiQI/mJn4WIPve1efZglOcJN+ORPWFlnqyr5ST4M/4QKg4aB7F8rtQblortgI
	W73Af4G9HSa0PvAcpfbKzdaUlw9OacvWQMBCnOn9cv4lwUws7lktYd17k/n/+/0irU0Vz55Hxir
	1HJFcO7rJw/7n6wCBEpvJgZOowU3ytaiASRAwKa2akSns7eznQ4X1yZ/b5qse+hLh1FMXba58LX
	ak2net0XPSugafcPIrh6cgSFVj29PxdS29bB9BPgy5ATCPPsnzRA+p6NsBxAbPfyyo8v5pyz+ij
	EQBc5WOTL/V/760u15n9gQKtLqgZy0FXSM8p2CkHJQL7smFntkLhjmiMqpofDfDdoRZb2SFc3YY
	A2yowt+Q0WUnMZ8w2x6rcCudi1lNcovS1ejtzoNnqFSPlQMlI6ww7a9kvfZazdXxA4cfCnrPrUg
	sYz1w8gumIvqRBI2PYP5IjumJqUw=
X-Received: by 2002:a05:600c:8116:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4ac182dc29cmr217548785e9.15.1793624572606;
        Mon, 02 Nov 2026 05:02:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf396dfdbsm272796905e9.1.2026.11.02.05.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:02:52 -0800 (PST)
Message-ID: <adee1031-71bf-4b35-a45f-2f7827f1028a@linaro.org>
Date: Mon, 2 Nov 2026 14:02:51 +0100
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
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 5/5] drm/panel: raydium-rm68200: Use lowercase hex
 literals
To: Hsieh Hung-En <hungen3108@gmail.com>, dianders@chromium.org,
 jesszhan0024@gmail.com
Cc: jagan@amarulasolutions.com, osama.abdelkader@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
References: <20261102043215.990351-1-hungen3108@gmail.com>
 <20261102043215.990351-6-hungen3108@gmail.com>
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
In-Reply-To: <20261102043215.990351-6-hungen3108@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 05:32, Hsieh Hung-En wrote:
> Convert hexadecimal literals in the RM68200 register definitions and
> initialization sequence to lowercase for consistency with the
> preferred formatting convention.
> 
> This is a formatting-only change. Register addresses and command
> data remain unchanged.
> 
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
> ---
> 
> Notes:
>      Changes in v2:
>      - Add a separate patch to convert hexadecimal literals to lowercase,
>        as suggested by Doug, keeping the _multi() conversion focused on
>        functional changes.
>      
>      Validation:
>      - Compared all 65 modified source lines after normalizing only the
>        hexadecimal digits in literals. No other differences were found.
>      - Confirmed that no uppercase hexadecimal literals remain.
>      - Built the driver before and after the change using the same
>        configuration. The .text, .rodata, .rodata.str1.8 and .data sections
>        were byte-for-byte identical.
>      - The build completed with W=1 and no warnings or errors.
>        checkpatch reported no issues.
> 
>   drivers/gpu/drm/panel/panel-raydium-rm68200.c | 132 +++++++++---------
>   1 file changed, 66 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> index 8ce89f09540c..df99b6837057 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> @@ -18,7 +18,7 @@
>   #include <drm/drm_panel.h>
>   
>   /*** Manufacturer Command Set ***/
> -#define MCS_CMD_MODE_SW		0xFE /* CMD Mode Switch */
> +#define MCS_CMD_MODE_SW		0xfe /* CMD Mode Switch */
>   #define MCS_CMD1_UCS		0x00 /* User Command Set (UCS = CMD1) */
>   #define MCS_CMD2_P0		0x01 /* Manufacture Command Set Page0 (CMD2 P0) */
>   #define MCS_CMD2_P1		0x02 /* Manufacture Command Set Page1 (CMD2 P1) */
> @@ -28,44 +28,44 @@
>   /* CMD2 P0 commands (Display Options and Power) */
>   #define MCS_STBCTR		0x12 /* TE1 Output Setting Zig-Zag Connection */
>   #define MCS_SGOPCTR		0x16 /* Source Bias Current */
> -#define MCS_SDCTR		0x1A /* Source Output Delay Time */
> -#define MCS_INVCTR		0x1B /* Inversion Type */
> +#define MCS_SDCTR		0x1a /* Source Output Delay Time */
> +#define MCS_INVCTR		0x1b /* Inversion Type */
>   #define MCS_EXT_PWR_IC		0x24 /* External PWR IC Control */
>   #define MCS_SETAVDD		0x27 /* PFM Control for AVDD Output */
>   #define MCS_SETAVEE		0x29 /* PFM Control for AVEE Output */
> -#define MCS_BT2CTR		0x2B /* DDVDL Charge Pump Control */
> -#define MCS_BT3CTR		0x2F /* VGH Charge Pump Control */
> +#define MCS_BT2CTR		0x2b /* DDVDL Charge Pump Control */
> +#define MCS_BT3CTR		0x2f /* VGH Charge Pump Control */
>   #define MCS_BT4CTR		0x34 /* VGL Charge Pump Control */
>   #define MCS_VCMCTR		0x46 /* VCOM Output Level Control */
>   #define MCS_SETVGN		0x52 /* VG M/S N Control */
>   #define MCS_SETVGP		0x54 /* VG M/S P Control */
> -#define MCS_SW_CTRL		0x5F /* Interface Control for PFM and MIPI */
> +#define MCS_SW_CTRL		0x5f /* Interface Control for PFM and MIPI */
>   
>   /* CMD2 P2 commands (GOA Timing Control) - no description in datasheet */
>   #define GOA_VSTV1		0x00
>   #define GOA_VSTV2		0x07
> -#define GOA_VCLK1		0x0E
> +#define GOA_VCLK1		0x0e
>   #define GOA_VCLK2		0x17
>   #define GOA_VCLK_OPT1		0x20
> -#define GOA_BICLK1		0x2A
> +#define GOA_BICLK1		0x2a
>   #define GOA_BICLK2		0x37
>   #define GOA_BICLK3		0x44
> -#define GOA_BICLK4		0x4F
> -#define GOA_BICLK_OPT1		0x5B
> +#define GOA_BICLK4		0x4f
> +#define GOA_BICLK_OPT1		0x5b
>   #define GOA_BICLK_OPT2		0x60
> -#define MCS_GOA_GPO1		0x6D
> +#define MCS_GOA_GPO1		0x6d
>   #define MCS_GOA_GPO2		0x71
>   #define MCS_GOA_EQ		0x74
> -#define MCS_GOA_CLK_GALLON	0x7C
> -#define MCS_GOA_FS_SEL0		0x7E
> +#define MCS_GOA_CLK_GALLON	0x7c
> +#define MCS_GOA_FS_SEL0		0x7e
>   #define MCS_GOA_FS_SEL1		0x87
>   #define MCS_GOA_FS_SEL2		0x91
> -#define MCS_GOA_FS_SEL3		0x9B
> -#define MCS_GOA_BS_SEL0		0xAC
> -#define MCS_GOA_BS_SEL1		0xB5
> -#define MCS_GOA_BS_SEL2		0xBF
> -#define MCS_GOA_BS_SEL3		0xC9
> -#define MCS_GOA_BS_SEL4		0xD3
> +#define MCS_GOA_FS_SEL3		0x9b
> +#define MCS_GOA_BS_SEL0		0xac
> +#define MCS_GOA_BS_SEL1		0xb5
> +#define MCS_GOA_BS_SEL2		0xbf
> +#define MCS_GOA_BS_SEL3		0xc9
> +#define MCS_GOA_BS_SEL4		0xd3
>   
>   /* CMD2 P3 commands (Gamma) */
>   #define MCS_GAMMA_VP		0x60 /* Gamma VP1~VP16 */
> @@ -119,41 +119,41 @@ static void rm68200_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
>   {
>   	/* Enter CMD2 with page 0 */
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, MCS_CMD2_P0);
> -	dcs_write_cmd_seq(dsi_ctx, MCS_EXT_PWR_IC, 0xC0, 0x53, 0x00);
> -	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BT2CTR, 0xE5);
> -	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETAVDD, 0x0A);
> -	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETAVEE, 0x0A);
> +	dcs_write_cmd_seq(dsi_ctx, MCS_EXT_PWR_IC, 0xc0, 0x53, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BT2CTR, 0xe5);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETAVDD, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETAVEE, 0x0a);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SGOPCTR, 0x52);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BT3CTR, 0x53);
> -	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BT4CTR, 0x5A);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BT4CTR, 0x5a);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_INVCTR, 0x00);
> -	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_STBCTR, 0x0A);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_STBCTR, 0x0a);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SDCTR, 0x06);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_VCMCTR, 0x56);
> -	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETVGN, 0xA0, 0x00);
> -	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETVGP, 0xA0, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETVGN, 0xa0, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETVGP, 0xa0, 0x00);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SW_CTRL, 0x11); /* 2 data lanes, see doc */
>   
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, MCS_CMD2_P2);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_VSTV1, 0x05);
> -	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x02, 0x0B);
> -	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x03, 0x0F);
> -	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x04, 0x7D, 0x00, 0x50);
> -	dcs_write_cmd_seq(dsi_ctx, GOA_VSTV2, 0x05, 0x16, 0x0D, 0x11, 0x7D, 0x00,
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x02, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x03, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x04, 0x7d, 0x00, 0x50);
> +	dcs_write_cmd_seq(dsi_ctx, GOA_VSTV2, 0x05, 0x16, 0x0d, 0x11, 0x7d, 0x00,
>   			  0x50);
> -	dcs_write_cmd_seq(dsi_ctx, GOA_VCLK1, 0x07, 0x08, 0x01, 0x02, 0x00, 0x7D,
> +	dcs_write_cmd_seq(dsi_ctx, GOA_VCLK1, 0x07, 0x08, 0x01, 0x02, 0x00, 0x7d,
>   			  0x00, 0x85, 0x08);
> -	dcs_write_cmd_seq(dsi_ctx, GOA_VCLK2, 0x03, 0x04, 0x05, 0x06, 0x00, 0x7D,
> +	dcs_write_cmd_seq(dsi_ctx, GOA_VCLK2, 0x03, 0x04, 0x05, 0x06, 0x00, 0x7d,
>   			  0x00, 0x85, 0x08);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_VCLK_OPT1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>   				     0x00, 0x00, 0x00, 0x00);
>   	dcs_write_cmd_seq(dsi_ctx, GOA_BICLK1, 0x07, 0x08);
> -	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x2D, 0x01);
> -	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x2F, 0x02, 0x00, 0x40, 0x05, 0x08, 0x54, 0x7D,
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x2d, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x2f, 0x02, 0x00, 0x40, 0x05, 0x08, 0x54, 0x7d,
>   				     0x00);
>   	dcs_write_cmd_seq(dsi_ctx, GOA_BICLK2, 0x03, 0x04, 0x05, 0x06, 0x00);
> -	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3D, 0x40);
> -	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3F, 0x05, 0x08, 0x54, 0x7D, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3d, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3f, 0x05, 0x08, 0x54, 0x7d, 0x00);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_BICLK3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>   				     0x00, 0x00, 0x00, 0x00, 0x00);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_BICLK4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> @@ -167,38 +167,38 @@ static void rm68200_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_GOA_EQ, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
>   				     0x00, 0x00);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_GOA_CLK_GALLON, 0x00, 0x00);
> -	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL0, 0xBF, 0x02, 0x06, 0x14, 0x10,
> -			  0x16, 0x12, 0x08, 0x3F);
> -	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL1, 0x3F, 0x3F, 0x3F, 0x3F, 0x0C,
> -			  0x0A, 0x0E, 0x3F, 0x3F, 0x00);
> -	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL2, 0x04, 0x3F, 0x3F, 0x3F, 0x3F,
> -			  0x05, 0x01, 0x3F, 0x3F, 0x0F);
> -	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL3, 0x0B, 0x0D, 0x3F, 0x3F, 0x3F,
> -			  0x3F);
> -	dcs_write_cmd_seq(dsi_ctx, 0xA2, 0x3F, 0x09, 0x13, 0x17, 0x11, 0x15);
> -	dcs_write_cmd_seq(dsi_ctx, 0xA9, 0x07, 0x03, 0x3F);
> -	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL0, 0x3F, 0x05, 0x01, 0x17, 0x13,
> -			  0x15, 0x11, 0x0F, 0x3F);
> -	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL1, 0x3F, 0x3F, 0x3F, 0x3F, 0x0B,
> -			  0x0D, 0x09, 0x3F, 0x3F, 0x07);
> -	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL2, 0x03, 0x3F, 0x3F, 0x3F, 0x3F,
> -			  0x02, 0x06, 0x3F, 0x3F, 0x08);
> -	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL3, 0x0C, 0x0A, 0x3F, 0x3F, 0x3F,
> -			  0x3F, 0x3F, 0x0E, 0x10, 0x14);
> -	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL4, 0x12, 0x16, 0x00, 0x04, 0x3F);
> -	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xDC, 0x02);
> -	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xDE, 0x12);
> -
> -	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, 0x0E); /* No documentation */
> +	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL0, 0xbf, 0x02, 0x06, 0x14, 0x10,
> +			  0x16, 0x12, 0x08, 0x3f);
> +	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL1, 0x3f, 0x3f, 0x3f, 0x3f, 0x0c,
> +			  0x0a, 0x0e, 0x3f, 0x3f, 0x00);
> +	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL2, 0x04, 0x3f, 0x3f, 0x3f, 0x3f,
> +			  0x05, 0x01, 0x3f, 0x3f, 0x0f);
> +	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL3, 0x0b, 0x0d, 0x3f, 0x3f, 0x3f,
> +			  0x3f);
> +	dcs_write_cmd_seq(dsi_ctx, 0xa2, 0x3f, 0x09, 0x13, 0x17, 0x11, 0x15);
> +	dcs_write_cmd_seq(dsi_ctx, 0xa9, 0x07, 0x03, 0x3f);
> +	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL0, 0x3f, 0x05, 0x01, 0x17, 0x13,
> +			  0x15, 0x11, 0x0f, 0x3f);
> +	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL1, 0x3f, 0x3f, 0x3f, 0x3f, 0x0b,
> +			  0x0d, 0x09, 0x3f, 0x3f, 0x07);
> +	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL2, 0x03, 0x3f, 0x3f, 0x3f, 0x3f,
> +			  0x02, 0x06, 0x3f, 0x3f, 0x08);
> +	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL3, 0x0c, 0x0a, 0x3f, 0x3f, 0x3f,
> +			  0x3f, 0x3f, 0x0e, 0x10, 0x14);
> +	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL4, 0x12, 0x16, 0x00, 0x04, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdc, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xde, 0x12);
> +
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, 0x0e); /* No documentation */
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x01, 0x75);
>   
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, MCS_CMD2_P3);
> -	dcs_write_cmd_seq(dsi_ctx, MCS_GAMMA_VP, 0x00, 0x0C, 0x12, 0x0E, 0x06,
> -			  0x12, 0x0E, 0x0B, 0x15, 0x0B, 0x10, 0x07, 0x0F,
> -			  0x12, 0x0C, 0x00);
> -	dcs_write_cmd_seq(dsi_ctx, MCS_GAMMA_VN, 0x00, 0x0C, 0x12, 0x0E, 0x06,
> -			  0x12, 0x0E, 0x0B, 0x15, 0x0B, 0x10, 0x07, 0x0F,
> -			  0x12, 0x0C, 0x00);
> +	dcs_write_cmd_seq(dsi_ctx, MCS_GAMMA_VP, 0x00, 0x0c, 0x12, 0x0e, 0x06,
> +			  0x12, 0x0e, 0x0b, 0x15, 0x0b, 0x10, 0x07, 0x0f,
> +			  0x12, 0x0c, 0x00);
> +	dcs_write_cmd_seq(dsi_ctx, MCS_GAMMA_VN, 0x00, 0x0c, 0x12, 0x0e, 0x06,
> +			  0x12, 0x0e, 0x0b, 0x15, 0x0b, 0x10, 0x07, 0x0f,
> +			  0x12, 0x0c, 0x00);
>   
>   	/* Exit CMD2 */
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, MCS_CMD1_UCS);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
