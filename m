Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FBE391E52;
	Tue, 13 Oct 2026 11:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890314; cv=none; b=Wsj7iYxsAR+wzWFDFEQFT3qyDYnVatpYjkPwXy96k+6zoKmyCvHHXJZbkfS4YPOcq1jwoW1x2mxL65Q2y/hV9H2oF2yqDcjwOeeqSEovAsg8gAT2G1uUYSJ4Dy41RTHcObEL9ocflMLJG+piHW5xZokAZ+8k3kIXkswXgUckdkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890314; c=relaxed/simple;
	bh=DcBfeFIONJupW+U8hEsuvCFyKnKuG8HwUQ2olWfu4Fc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=QyyoJS9Ej2d2YhlZKqKoJZpB8RJPxwLy/0CacB8ic+3MAq3ZettC9aPs2NFUVU3VD7UiDOog6mqUULz0S3UIPJw2EjSykZOMOD1CiuQ2l8WC6T8bGbqHYfww0j5TJ9niDhlxY22xze1f73wJDRBN6KcgCyZTBpUAZeiE3wpw29I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGU3wXVH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGU3wXVH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB191F00893;
	Tue, 13 Oct 2026 11:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791890313;
	bh=DlCzukLsBDjDUNtLYcjRcHJarU0StsmdSStKFi1Po3o=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SGU3wXVHKgRapOSLuGxUjdGo/peuw0KHZGI/se8spXwaU9pjK6M+L2PXLoKtSyoYd
	 X2adODwDT/jVmXcRWpRRm35akVgR9CNgsK05FcPSywY41RR/BCtbKlSQl4wgouMJnW
	 hbmmyjvJdRzCwpcUY1f6Eu5b9efWgx14HlXgxD7zCgE+fS3653V6HzlMbWNK/dCaKU
	 Lk1zIYkolECk3vIsGe3yf11v2LocdQSAElDXlyFfYfRaamP+EbhCdRN9Xig+eYavJ8
	 S9w8XEDnBa6GY7OdzmXmKk3MdfRLhbXvr1JXqUk3GIkLLr22Upj9FvSVWwwbQ31eTe
	 LvOFQeOlBWwOQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC 4/4] media: qcom: camss: vfe: Add the IFE 780 pixel
 pipe description
From: bod@kernel.org
To: William Bright <william.bright@imd-tec.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261013-sm8550-camss-ife-v1-4-d50de00077b7@imd-tec.com>
References: <20261013-sm8550-camss-ife-v1-0-d50de00077b7@imd-tec.com>
 <20261013-sm8550-camss-ife-v1-4-d50de00077b7@imd-tec.com>
Date: Tue, 13 Oct 2026 12:18:29 +0100
Message-Id: <179189030941.1758911.5674595862976052561.b4-reply@b4>
X-Mailer: b4 0.17-dev-e5aa4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596; i=bod@kernel.org;
 h=from:subject:message-id; bh=DcBfeFIONJupW+U8hEsuvCFyKnKuG8HwUQ2olWfu4Fc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqzhOF4YbnLoV+eBtQiEJRO5vvA+UvTGc5MnSMd
 CZxGYOuO12JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCas4ThQAKCRAicTuzoY3I
 OhyVEAC4eI1dLHxMC/5iLMUjV7e28FwUHQY7eqRLMaXnnhd5XkmE9EweNh1bnjwGTnwHnFSTZ2d
 IryxjEpwNujlzz5GKV1aNZRBuE7JnWl72XxZPc824iEWL0xSjH8VsN6+bAQ6Lq74e106KTqPgR2
 y7gP4j2e1D7tL2VF+IHKVQr3Uo1XyRlIa1K1GM0HF/TTYneWKla66yMySK1NTYucsvQFBG2tyEa
 ee6XlOlQXBSDVqYmdMPwGXNLA+9of4SqLPxL1c6HHembMVibgLea8vNM+7v0/lfL62hGNsffNYo
 2We9r/2xZ07RiVZFO5XZx0XV5oNmUueAJvPMtBkJvxEF2GzGI7Kcz/V3eyZBdtTMaVvnB0AhlNK
 QN+FlwQKXPivtTc8GftTz6eLLQsz13PYnzMHUphAgymzOgGsKtL7wS/H1ySw1mwcLb3Y7K/VsEI
 5TG791M4X9cEXuM03CaJ3IrEGeY4QEZikZecYlbdBgIN6zW1gfgHZ9SVmT0QSW3KUjxSfBTGt6w
 Bs6mR+Kkm8duCak1j/UDX61+lT9sdIh0TX6AToBu9HVe09d1+Dm7iG3222ABxEavLCqPopuH5ht
 kZjSfbth1lsvxowhFtofHnwM8mIVpdltZARKO5LEErhBm3NI14ftjeYnfiogbPluhlMHxl0tLCe
 gxFAaVsY6BrAbRg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-10-13 09:44 +0100, William Bright wrote:
> The IFE 780 WB gain registers only take bits 31:17. A Q10 gain there
> reaches full scale at 1.0, while the 0x1000 used on the IFE 880 reads
> back as zero and every frame comes out black.
> 
> Its demosaic also leaks red and blue into green whenever green sits on
> a black level pedestal. With AR1335 colour bars magenta comes out white
> and red and blue pick up half scale green. Subtracting the black level
> in demux + BLS fixes it.
> 
> Describe both and use the description on SM8550.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe-780.c    | 3 +++
>  drivers/media/platform/qcom/camss/camss-vfe-880-pp.c | 6 ++++++
>  drivers/media/platform/qcom/camss/camss-vfe-880-pp.h | 1 +
>  3 files changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
> index 032786c4ed74..63fee6ab64fe 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
> @@ -238,6 +238,9 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
>   */
>  static const struct vfe_pp_desc *vfe_pp_desc(struct vfe_device *vfe)
>  {
> +	if (vfe->camss->res->version == CAMSS_8550)
> +		return &vfe_pp_desc_780;
> +
>  	return &vfe_pp_desc_880;
>  }

Thanks for this RFC its a good feed-in for V1.

I will try to cherry-pick/incorporate this in the V1.
---
bod

