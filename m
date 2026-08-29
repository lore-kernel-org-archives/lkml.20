Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39094372B3C
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 20:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788034222; cv=none; b=AlyV336/2+KkCZ6JnpvvJAeIBWGmZ9ZeLmWQ3ndJbUNSBjD6tNh/ZlXieWOI23lXsoOVK0W0Vk12kvGwKi7ecT1YXxRAA3PXFZ0K2QDTrny2FyWtDn2whlG2+cUrRsAc1L1kKbuq85d5tGLBCgltQGOpzrVuN4xKPaPYuTgwqII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788034222; c=relaxed/simple;
	bh=SQbSqnb7ybAoJPODuIGfpqHtOcQFCSe2mzQjPCWu3nU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U2UMb+j/027mRcGrViVfsWTWzQOSMGO480EnEfkxUsBbWbLf/JErT0Ep+QPztkPyE6EP3AIZb+qpW2g/tqzlN+AniOqwtt/iTGTg0lLnHzgGFKzOCOFrHrAhTebQiqtvI0gXgo3/PlhLZ2CCrHcxiIQ1VEMQQWmPQF0Qm2epKQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=aK3zuHTb; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="aK3zuHTb"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 449E9C33D3;
	Sat, 29 Aug 2026 23:10:16 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 449E9C33D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788034217;
	bh=ZqxY1D+fzC3+wDVQotEIAuDf7u8tvsnBtIziyWtCx0M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=aK3zuHTbhpNWq6uHwc7UtKDWf+dJE5LH64VqksnEnWXlWXtIOLB8PxwHJrv2tmVpQ
	 Imk+iBKtnnSppkyZ6dF8vkTsbdkBA06p16GIYzXGA5iWeEqVKMqRHwdX565jo/DToi
	 0rG7JAuheSc8IdLW60MNCLpxhwlvfo2SXTzESjx9JU4oqzMocGt52e2TcJG9dXMxPh
	 vEqZB7Rw1rCrjetLrjMq+U0Ou3KneOxpIybU+148cJVZXh2WJrIp2AppsIl1YrpgiP
	 /uKYGtCD7lct2Oa3EzCs3k5rgbmYE/rn5WNorewYEnphduIEf57aYqaCW5bVwcSuGa
	 JFWRo+GW28Ydw==
Message-ID: <1778ce7c2880eb5eb719932b5273776a57eea481.camel@rendec.net>
Subject: Re: [PATCH] irqchip/sifive-plic: Avoid signed shift in interrupt
 enable mask
From: Radu Rendec <radu@rendec.net>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Thomas Gleixner <tglx@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Samuel Holland
 <samuel.holland@sifive.com>,  Charles Mirabile <cmirabil@redhat.com>, Lucas
 Zampieri <lzampier@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Sat, 29 Aug 2026 16:10:14 -0400
In-Reply-To: <20260825151000.1-plic-bit31-caplitmus-rv@iscas.ac.cn>
References: <20260825151000.1-plic-bit31-caplitmus-rv@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-08-25 at 15:33 +0800, Pengpeng Hou wrote:
> __plic_toggle() builds a 32-bit enable-register mask from the hardware
> interrupt number. A valid interrupt whose low five bits are 31 evaluates
> 1 << 31, which shifts a signed int into its sign bit and is undefined
> behavior.
>=20
> Use BIT(), matching the equivalent mask construction in plic_irq_eoi().
>=20
> Fixes: 14ff9e54dd14 ("irqchip/sifive-plic: Cache the interrupt enable sta=
te")

Thanks for the patch! The patch itself looks good but the Fixes tag
above does not correctly identify the commit that introduced the
problematic line. Ironically, that's one of the few lines in that
function that were *not* modified in that commit.

Please use "git blame" to find the right commit, and resend the patch
with a correct Fixes tag.

> Assisted-by: Codex:gpt-5
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> =C2=A0drivers/irqchip/irq-sifive-plic.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifi=
ve-plic.c
> index 5b0dac104814..d3d4187b96ab 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -108,6 +108,6 @@ static int plic_irq_set_type(struct irq_data *d, unsi=
gned int type);
> =C2=A0static void __plic_toggle(struct plic_handler *handler, int hwirq, =
int enable)
> =C2=A0{
> =C2=A0	u32 __iomem *base =3D handler->enable_base;
> -	u32 hwirq_mask =3D 1 << (hwirq % 32);
> +	u32 hwirq_mask =3D BIT(hwirq % 32);
> =C2=A0	int group =3D hwirq / 32;
> =C2=A0	u32 value;

--=20
Regards,
Radu
