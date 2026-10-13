Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B4633937B;
	Tue, 13 Oct 2026 11:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889698; cv=none; b=uzG42ZWWYvr/e8lOqUoSYucNBkrdQos+cRezddEAvjFuxuo/hfMbtOR9/z0r5P9ms9jB2v7PpzxTmNClgu7UJAfLY9BM+0LBu5C8wQYuP7ACdhmcPxxVGW2swDjAmQztgAnmhourvwo9pVpTL9NC7NizWnxFf6e6A+9NnhAmMI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889698; c=relaxed/simple;
	bh=j+gOKRcJTrk8BWXM+L0316UgFJz2wp9dXMreBIJwKVo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=dS8xH+IiHhU5bLE9gRxizAsNdoTItC8T8N6opkdDSVwsM98PHaMUJqyiZ1375WY/2RB09NOvCgmWEXwiNJvwjUecAuqiB2Au1NT4xIZoIWxMHMWpWVDqLTE5Pg86COHGgTpPMT90NPh0miHhXO09k17oQTchMW3FQKYATFTDwns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLjcUONd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLjcUONd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560F01F000FF;
	Tue, 13 Oct 2026 11:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791889697;
	bh=J/sUuhyzTxrY8FFNK+3YtQBSKLiJIQChUPG48daSVds=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=gLjcUONdnrzHfJ1jMm6JKAaVVl1WW6sC2CVBJdCCeBPwUYEzQaqJKfslTmEIOYn6h
	 BARNhiMu8r2XxRxJ62Rhj6S1RWnOZngf8PCjbTf86HwlkGOSVzCyiFZHIPc2O5j4O6
	 100V8+A/wmcZCx7t7g1+i+C1lgfSKSPV2y/bnyXq64tS9h4rwLLHuXVsj/FiVoME6q
	 Yd9F1kzO8sNkdiJopsBEPMGRSwB6p4qSDaBU2Yzuc1MjlmlK3H7shcd/IikXNyaWPg
	 ShSrWPDR1C4vq9J41y9zm1O3XzsOQw5u1lRXrq6wxI3a74dqHsracns28qA7v2pC3Y
	 QtKKGgZnnYWIg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC 1/4] media: qcom: camss: Enable the IFE pixel path
 on SM8550
From: bod@kernel.org
To: William Bright <william.bright@imd-tec.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261013-sm8550-camss-ife-v1-1-d50de00077b7@imd-tec.com>
References: <20261013-sm8550-camss-ife-v1-0-d50de00077b7@imd-tec.com>
 <20261013-sm8550-camss-ife-v1-1-d50de00077b7@imd-tec.com>
Date: Tue, 13 Oct 2026 12:08:12 +0100
Message-Id: <179188969247.1758911.4287853532642992337.b4-reply@b4>
X-Mailer: b4 0.17-dev-e5aa4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2404; i=bod@kernel.org;
 h=from:subject:message-id; bh=j+gOKRcJTrk8BWXM+L0316UgFJz2wp9dXMreBIJwKVo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqzhEcgYcXkSmLA2sItSdZ2RNNJ1u2LbPggmVVe
 PMBPMXgeh+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCas4RHAAKCRAicTuzoY3I
 OiXJEACclUrkwe03dB5G2odB0L9xVfE2D80TdNp9B03H9PCBY0u3m2/JgAuXgCctkvnTQQz83go
 iEPhd6VJKmzuLKIhnFUMSY7vPfao/o5G3obJvpAoV1BTbgT1nKhp49PhIdAE8UhJSIgjwCzIcg9
 tN9uG71XPTS1Jy4xc2uVXxPu8o1HhmnWJnkUf0SMFIc2bZuTVcaQrw+uJMNM++8cfpAhfM8LwDZ
 e+tSUhM2HDThXgFekY+q0P95qhwcsdZBxUU9b3QLZPhPn5ACtKv0w2Bu3+HpUVqXQdPmBP84kkE
 fTzIxEeVmCk3wdPp0kPvclp0aZJGSvf+GpJWCiuEfAo7DK4IPBG9HiVriyn/5GKD0jYlP2ImMBW
 DPbdwerEDy47av+NuOXp3YScW+9trjB9VdjTiyhsePnxLcSVnNcqeWRyw3go4ZqKGAxFYIngjVf
 dwW+RCfoseT7xpkmEpiwmMK0hGgs3WZ/cqycq4s4uk2hOaBfdh5Ibvnb+thl3sCD8dRbyjSOY9L
 rkNcc7a8X5yw+dRsM4CyjgzJW5XkDY/nmml8X+LIT31lmlLei6aOXzGNe/gD8z727eQwzvoHUaz
 N7BG5ERhBVoe+wMqtdcoxQDPa0E4f/IcQdz+9+5Kaf1AsmvdKBT67178VeObFPK74gEamXG7dTk
 JKaFuZpfQaxPGVw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-10-13 09:44 +0100, William Bright wrote:
> SM8550 IFE 780 shares the write master layout, pixel pipe and two
> pixels per clock with the SM8650 IFE 880. Give the full IFEs a PIX
> line with the PIX formats and treat SM8550 like SM8650 in the pixel
> path helpers.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c |  6 ++++--
>  drivers/media/platform/qcom/camss/camss.c     | 12 ++++++------
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 4f50a362e185..930e6cdf7e0a 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1389,12 +1389,13 @@ static bool vfe_check_clock_levels(struct camss_clock *clock)
>   * vfe_pix_ppc - Pixels the pixel path consumes per VFE clock
>   * @vfe: VFE device
>   *
> - * The VFE 4.x and TFE pixel paths take one pixel per clock, the SM8650 IFE
> - * pixel path two.
> + * The VFE 4.x and TFE pixel paths take one pixel per clock, the SM8550 and
> + * SM8650 IFE pixel paths two.
>   */
>  static u32 vfe_pix_ppc(struct vfe_device *vfe)
>  {
>  	switch (vfe->camss->res->version) {
> +	case CAMSS_8550:
>  	case CAMSS_8650:
>  		return 2;
>  	default:
> @@ -2580,6 +2581,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
>  static bool vfe_pix_line_based(struct vfe_device *vfe)
>  {
>  	switch (vfe->camss->res->version) {
> +	case CAMSS_8550:
>  	case CAMSS_8650:
>  		return false;
>  	default:

eek I'm suddenly realising the way this should work is default on, with the
special-cases off.

:)

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index beafbbc77329..98d9d63838d6 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3561,13 +3561,13 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
>  		.reg = { "vfe0" },
>  		.interrupt = { "vfe0" },
>  		.vfe = {
> -			.line_num = 3,
> +			.line_num = 4,

In any enabling for 8550 this would come last as you'd only switch on the
last PIX line when you had all of the relevant infrastructure in-place.
---
bod

