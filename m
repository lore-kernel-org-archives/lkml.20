Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F8935AC1C;
	Mon, 12 Oct 2026 23:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791847594; cv=none; b=bEwz3yhg5KcZ40WbMP7lq0zwObrZIpTWe4Hz/T5Gn8I46SGKPXOEo6tcaStk6JF0P5rimq0T82uheT0gR4OKHU0yqnIPtnvP1SxMxrYV3Njd0E7tomWR21ksCUEyNpManYn8VhdY2//d6m9d2FD/LHR3VEV4lPlVG9P8hOlE91E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791847594; c=relaxed/simple;
	bh=CFP4aMNI2bgpYnMs8TabKyKWiaNn/Tmv6D9ZgpJC2Io=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Zt0gTPcWLhv43S91kV6ZoJV1Nh/RKKLs7OF7T8lMf5l1YIk818fh21itLdqEElRshlKCTSLGqHBQgAQB/KOK9arm0YfDGXHc7yWxDxSSzIBYhRzgL0rIPfTZFlQ4M9GwvhOlO+nunPiTuqg/T3xVvuTld14IUdTjV2Gar0t9jvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JAxh+F2A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAxh+F2A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9ABD1F0089B;
	Mon, 12 Oct 2026 23:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791847592;
	bh=Z2oSTbM4zUcpYMcqO/5/tHZYwS6dFdbbOC1MdPLdirg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=JAxh+F2AukERQbbncuqU+qjuDmbdx7O/LNm+WzxrSs8NojOIMnh2LTxdt/eIjj7AU
	 JFoQujP/NR9y9ENDlL0jR3DF03W2sGnTPVu1og3htry3TGoBKQa+xtJuq/NltWXT7U
	 QiJWpcLuPjWwB2J0r8TgyI2y8m0SH4TgGAx1v9HK/yOwWmWU4N2YLUMr8iSiFTUNo4
	 Q3oG0ZVTExQ5k/1WrzOAlrQLoVfQfNcN/8uwYHdTUCw07/Z9hZ6wxZyxKowdvOu5/K
	 GbRlnCWCX6A7C/qq7Nh64or4CwUuHapOKdop35XGCwhUtp9l+5TJZDAXt7ZVRifVoS
	 S2n9NASxwaVtQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/3] media: i2c: dw9719: Update DW9800K driver
From: bod@kernel.org
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20260914-b4-dw9800k_cleanup-v2-2-6553273aaa33@fairphone.com>
References: <20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com>
 <20260914-b4-dw9800k_cleanup-v2-2-6553273aaa33@fairphone.com>
Date: Tue, 13 Oct 2026 00:26:27 +0100
Message-Id: <179184758746.1635143.1022569720918218811.b4-reply@b4>
X-Mailer: b4 0.17-dev-e5aa4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4370; i=bod@kernel.org;
 h=from:subject:message-id; bh=CFP4aMNI2bgpYnMs8TabKyKWiaNn/Tmv6D9ZgpJC2Io=;
 b=owEBbAKT/ZANAwAKASJxO7Ohjcg6AcsmYgBqzWyjdwwWy+9VQceeQqJ3cMcWaUfh3Tk5B4O/e
 p1sLFsHhPGJAjIEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCas1sowAKCRAicTuzoY3I
 OsGiD/ioa1OoVrs66OIRi+B/GV887AKeug8FyrMyxBrbn3GmS1yUeJNPUQzhJLCVquaeRuS1zxo
 dMT4X9l7booBjvui0sc4ZJmYbsOyOITkI6RRK0hUqRZQfRz5r1DPMdzv3BNkdw//1OtlrUcVXF1
 AUXYPTBlooIfpkp8ExYXmDPStqJdP8nEwP+/VAjZEfhvWmfwpOfPy56RsnLEQ9pR5l6nPBc0ykF
 cKsn6JhwJA3zJGGNrWqtgF6k74zopXAwWIUKGvYHrYJnqGCp+lDHFl3lEZWf0MSWCKyCOfPVlUS
 +pwoH/CY4MB99AiZP33xbc0NZo6Wke8UztBavqT7BuCBOPjuoNnrq6/HvyjXON2UoLvsLtDNVgE
 bdbSAeRDtsqdKpsT2h/b9bnxud/ywdmLNtKTQ7NkFmlPcJZ2TinylzON7MYK/E4p77iRq/AXEoi
 7rtB+GAYbcA3wtQz2ag63TLuDD2RC0qePwQyO9+shZrejKR3+F4uFRYhN80kqgWJ1cBiNJDaRWB
 cd692hoKsH2w2zIC9hRV+D/+wvmrlOJ09eC38FKguhxm9TvHjLyu5nPiTg5xsQW6MiOT5qR6jFi
 HkZPUbu9AmRAMMppf8Uf7k5fEusJRVQaFZ9+M0xQbs0gOObBlkLlzUActiU7BDn0DUfzL6d9uGl
 3kEMfxc90e3iN
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-09-14 12:25 +0200, Griffin Kroah-Hartman wrote:
> The previous DW9800K driver code was created without access to a
> datasheet for the part, now that we have one we can clean up some
> misunderstandings and add some features for further expandability.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

1. Be more explicit about which misunderstandings and features you mean.
2. Generally speaking for each thing you might write in the commit log
   a) Misunderstanding X
   b) Thing fixed y

   I'd recommend making those standalone patches.
3. Since you appear to be describing Fixes: here you should
   c) Have a Fixes: tag
   d) Cc: stable@vger.kernel.org

>  drivers/media/i2c/dw9719.c | 71 ++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 62 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
> index 3b7ba88fd67c044ef9005a0aac6a5d26ab939a90..982be59b9ee17a12e8c25ab790ccb8351454c91c 100644
> --- a/drivers/media/i2c/dw9719.c
> +++ b/drivers/media/i2c/dw9719.c
> @@ -68,9 +68,18 @@
>  #define DW9761_VCM_PRELOAD		CCI_REG8(8)
>  #define DW9761_DEFAULT_VCM_PRELOAD	0x73
>  
> -#define DW9800K_DEFAULT_SAC		1
> +#define DW9800K_ID			0xEB
> +#define DW9800K_DEFAULT_SAC		3
>  #define DW9800K_MODE_SAC_SHIFT		6
> -#define DW9800K_DEFAULT_VCM_FREQ		0x10
> +
> +#define DW9800K_RESONANCE		CCI_REG8(7)
> +
> +#define DW9800K_DEFAULT_DIV		0x01
> +#define DW9800K_DIV_SHIFT		6
> +#define DW9800K_DIV_LOW_SHIFT		2
> +
> +#define DW9800K_DEFAULT_SACT		0x20
> +
>  
>  #define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
>  
> @@ -90,6 +99,8 @@ struct dw9719_device {
>  	u32 mode_low_bits;
>  	u32 sac_mode;
>  	u32 vcm_freq;
> +	u32 div;
> +	u32 sac_time;
>  
>  	struct dw9719_v4l2_ctrls {
>  		struct v4l2_ctrl_handler handler;
> @@ -140,10 +151,6 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
>  			dw9719->sac_mode = DW9718S_DEFAULT_SAC;
>  			dw9719->vcm_freq = DW9718S_DEFAULT_VCM_FREQ;
>  			goto props;
> -		case DW9800K:
> -			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
> -			dw9719->vcm_freq = DW9800K_DEFAULT_VCM_FREQ;
> -			goto props;

As an example this change should be argued on its merits - you need to lead
your reviewers to water and then see how they'd like to drink.

>  		default:
>  			break;
>  		}
> @@ -165,6 +172,12 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
>  			dw9719->sac_mode = DW9761_DEFAULT_SAC;
>  			dw9719->vcm_freq = DW9761_DEFAULT_VCM_FREQ;
>  			break;
> +		case DW9800K_ID:
> +			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
> +			dw9719->vcm_freq = DW9719_DEFAULT_VCM_FREQ;
> +			dw9719->div = DW9800K_DEFAULT_DIV;
> +			dw9719->sac_time = DW9800K_DEFAULT_SACT;
> +			break;
>  		default:
>  			dev_err(dw9719->dev,
>  				"Error unknown device id 0x%02llx\n", val);
> @@ -185,14 +198,54 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
>  		/* Optional indication of VCM prescale */
>  		device_property_read_u32(dw9719->dev, "dongwoon,vcm-prescale",
>  					 &dw9719->vcm_freq);
> +
> +		/* Optional indication of clock pre-scale select */
> +		device_property_read_u32(dw9719->dev, "dongwoon,clock-presc",
> +					 &dw9719->div);
> +
> +		/* Optional indication of SAC timing */
> +		device_property_read_u32(dw9719->dev, "dongwoon,timing-control",
> +					 &dw9719->sac_time);
>  	}
>  
>  	switch (dw9719->model) {
>  	case DW9800K:
> -		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
> +		int ring, sac;
> +
> +		/*
> +		 * Enable ringing for SAC3-SAC5
> +		 *
> +		 * sac_mode	reg	Mode
> +		 * ===========================
> +		 *	0	0X	Direct
> +		 *	1	1X	LSC
> +		 *	2	00	SAC2
> +		 *	3	01	SAC3
> +		 *	4	10	SAC4
> +		 *	5	11	SAC5
> +		 */
> +		switch (dw9719->sac_mode) {
> +		case 0:
> +			ring = 0;
> +			sac = 0;
> +			break;
> +		case 1:
> +			ring = 0;
> +			sac = 2;
> +			break;
> +		default:
> +			ring = DW9719_ENABLE_RINGING;
> +			sac = dw9719->sac_mode - 2;
> +			break;
> +		}

For example what is ringing - a patch should cover "enable ringing it does
thing X" and then the code should be a straight-forward reading of thing X,
matching the commit log.
---
bod

