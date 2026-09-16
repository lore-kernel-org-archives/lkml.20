Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0410548032B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559749; cv=none; b=mY7B8MHZWGH6eNbCJhoCIRabMeojwxhvWbFtaSF+kMyPfTtV5iDrU9ZduAIhZz9FoPyARSoMtosjxLD312xjHVNgzwWkPKUtf7bPmY7D6UgZTrQtFxqkd4e9xwCYtnyyb7EGa5jHhDcdz2GovYOFN04OrQB8u22a6/6cOexqxqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559749; c=relaxed/simple;
	bh=EGujdtkucRlzCktcgIrv2QUfsfMXufpxt+YZg3/pBvU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eUQuQiBDwPp/yeQUMOqn6Crbp7JDWuuDsNXMghW4ZXbd+qOB/8V2aQNurif0oM9rbo2cu8gtsXbNEBtdC2e0EZMfbbUL/Q0UWg4EpHbaeTBTqIDIjPqp/odg6bqt3weurJCI3BGNYsNPsQJdi1GtO3w+863rH5TeSwbxPaoWqLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=mkhC8Ema; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="mkhC8Ema"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id ACA04CC9D1;
	Wed, 16 Sep 2026 14:55:36 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro ACA04CC9D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789559737;
	bh=sHrJeYZYmuCF3lqgBNfvnvYInrmmDHQPjt/UXE1A0tc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=mkhC8EmapLI/+JRSkp4eQfp/dNBhHrrbfM/36WOpcjTQ+tizqZTpEFXut0IpC0uKu
	 3mKLIjmdPBu5dX7znLjYj5S6pgATpSP08RNC+llHK/2u0I5G7IynMY1m3A34K9WhML
	 A6pJwU39gqqIAOmLhWylgiVSc8SiKbAZn6mQ7pcqBT626zwDmSm2Tk1I7F1FaQRlxm
	 rwVet+Zo/EDrwjb9vZ8EQX7rHoINqnRUxlaiJeoLGaV6ZtyZTG+AvHz1Kxip/UqtPO
	 0JSkGyFUReEJHRvLbcikGYiMBHH5taj29sDktQzvWYjGs4dhTE79VyuWqeWHsrFGK2
	 0Hm5kDnUNb/Bw==
Message-ID: <73bbcf3214f618280139d3e8736dce9f242df66b.camel@rendec.net>
Subject: Re: [PATCH] irqchip/qcom-pdc: Fix kernel config dependency
From: Radu Rendec <radu@rendec.net>
To: Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>,  Sneh Mankad <sneh.mankad@oss.qualcomm.com>, Maulik Shah
 <maulik.shah@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,  kernel test robot	 <lkp@intel.com>
Date: Wed, 16 Sep 2026 07:55:34 -0400
In-Reply-To: <20260915-topic-pdc_fixup-v1-1-0f7f7de924de@oss.qualcomm.com>
References: <20260915-topic-pdc_fixup-v1-1-0f7f7de924de@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-09-15 at 21:13 +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> The commit mentioned below added qcom_scm_io_writel()/is_available()
> calls without updating the Kconfig. Fix that.
>=20
> Fixes: ad01c2b2f291 ("irqchip/qcom-pdc: Configure PDC to pass through mod=
e")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: http://patch.msgid.link/202609160249.tiuDbEzF-lkp@intel.com
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> =C2=A0drivers/irqchip/Kconfig | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index a8f8c423b795..5213cefc1077 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -524,6 +524,7 @@ config QCOM_PDC
> =C2=A0	tristate "Qualcomm PDC"
> =C2=A0	depends on ARCH_QCOM || COMPILE_TEST
> =C2=A0	select IRQ_DOMAIN_HIERARCHY
> +	select QCOM_SCM
> =C2=A0	default ARCH_QCOM
> =C2=A0	help
> =C2=A0	=C2=A0 Power Domain Controller driver to manage and configure wake=
up
>=20
> ---
> base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
> change-id: 20260915-topic-pdc_fixup-c1064e0b0f03

Reviewed-by: Radu Rendec <radu@rendec.net>
