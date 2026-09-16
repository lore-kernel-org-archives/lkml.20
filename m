Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29DE3D7D80
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558316; cv=none; b=bp7j7a+R/xRMYaff2y+UD7TH2Kz4+cAfolMcmR664SCIA82XjyXk9FjKWUZicjxyI0gAjdA/mASBpbplGulrPSGFBFSrpavN+5TX3OO+8+/yMxOsI1Fssr7OZKYSt0Qb1YJGcaVq8KdOetCGZ9WBvHtIj5THq4bSSoJ3SNDkkGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558316; c=relaxed/simple;
	bh=S+u6wUH8RiptVAK7GQUPXBebrCVjWh4x4wUA2Er4lX4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r23kK5QbvybdZGaHsMuTAGlGTXBjtY4XMc9ZnfyMnXnrmZ1rzksqqiuXZnJUqCN0gaweQ4n1aP4Uc/jQXVlU7nc3my3HEsjJNdXS+ZpVO/TaoHSzObjg2pzZL1uJiAI24/QnAq5UvjqmAj3jAeQg8ZAGlRUxBkmBOzDmn0HXk2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=ChdxBR16; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="ChdxBR16"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 22C93CC9D1;
	Wed, 16 Sep 2026 14:31:29 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 22C93CC9D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789558291;
	bh=MN0X+IRbqzIj1VbDzEUt0hOl0UpK0iS6L2nbKTTZPpM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ChdxBR16gxjZ+PtwX1XmtgzWKL4zxpOKwm69kf1IRaz8AjpDR7APvJ48yth6ySgud
	 jeIWA33ooS7Ar7QE0Hj6ucNbKiRg8Uk0am6K60XYsmAP0gd/gA1ES3fTtHEfSmRKM+
	 iNG3w97GLqf2nlSwCbTfDjlsUXuDQB5LnrQeMLj/Ym64ZQPFypK4axJ6vWrDnAveKY
	 OhE+RUnaxc13+NT2Tu9n+C7qLiOvlO72fUx59USmquylE+ReDDmzi9uza3d0rKu7/6
	 OwZz0vVko1fb2RiFw1VFJjcHp/vEtpPDYzmFdV+1adeM0OG57YbxLDXRtFdDfROKxn
	 BGs8MFUGMka8A==
Message-ID: <c9bdd274a1f4b407bc3138bf0d973e3cede7e2c1.camel@rendec.net>
Subject: Re: [PATCH] irqchip/gic-v3: Fix typo in eoimode1 comment
From: Radu Rendec <radu@rendec.net>
To: Xiaonan Chen <chenxiaonan101@qq.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner
	 <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 16 Sep 2026 07:31:27 -0400
In-Reply-To: <tencent_FC9BD4844FBADF31F931DC723D8F4C3E1808@qq.com>
References: <tencent_FC9BD4844FBADF31F931DC723D8F4C3E1808@qq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-09-15 at 17:02 +0800, Xiaonan Chen wrote:
> Drop the duplicated word in the gic_eoimode1_eoi_irq() comment.
>=20
> Signed-off-by: Xiaonan Chen <chenxiaonan101@qq.com>
> ---
> =C2=A0drivers/irqchip/irq-gic-v3.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index 6e1fa5b247fc..69ca208eeee6 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -687,7 +687,7 @@ static void gic_eoimode1_eoi_irq(struct irq_data *d)
> =C2=A0{
> =C2=A0	/*
> =C2=A0	 * No need to deactivate an LPI, or an interrupt that
> -	 * is is getting forwarded to a vcpu.
> +	 * is getting forwarded to a vcpu.
> =C2=A0	 */
> =C2=A0	if (irqd_to_hwirq(d) >=3D 8192 || irqd_is_forwarded_to_vcpu(d))
> =C2=A0		return;

Reviewed-by: Radu Rendec <radu@rendec.net>
