Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490A4448BAB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805379; cv=none; b=HH7AnjiiH1tWlXcpLPRvne+OMmqYBGvAlfFDc80AnXGToprC71Csx503nhGqeY98i2FJpmJYzfHoTpPSnItxPajT1xLAyqWERL+1q2nqCX0oAqOcWMChAF82CAg2q1q2veoXlGDOxIS1rprSZPh0dySCG39klkl9ir2/vmz2GP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805379; c=relaxed/simple;
	bh=KV4/MIaxjxvl/mfkomvVLh4IYnI2BQ2FQLL4/zF1OZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRie5FVd9hqx4LK0DYtZ5n5RCdHd046nMaXNU6h670wxlp7la0kOHjv5aggz4w0mTeYxS1I7WsRjOHedXDaGtDh/R6cNeMGVbX6dwgk7iblKxN1UdWNr2PvticerAum/PHvF23ic4B1bJ0XHJgvjgdj4H6H0YgIpKmOcpjh3Z90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NcBMTxOo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NcBMTxOo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A60271F0089D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791805376;
	bh=5fWTotOXdxMB1fdZYWBlyYnTKfDeGXR3zegL+SWwZxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NcBMTxOoNuN5lMbRYeObWkI4+/y2kgoHlB7Cy4rp0Azh0kcaI9DlYseknut9ojBAU
	 b3b+hzx2eZ+TGppR60MByPoStKkFu1PBoWWVihPv0aLHfC3cjG95vfNlByb6eXhrUi
	 7++f4fyTeyG9kC26PtTaCgj41aVC2SBT80DZ+76RGl+tp4TxDynKF8NRaBeKgjs1AK
	 0Ig9kkm6ukfAQLn+/U7lAw6hDk4rhkYmzifLjfPgjvEM8qfFd1ohID1YUe5f6FVQwO
	 1eNCn105cPJXQnnuhT4AhSHGqMTT4n9FB/Jh5HWzvETSCuLKa35Pm3GoMGWYriOoE1
	 vNZ50XIQcx1hA==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 2FE4F198003A;
	Mon, 12 Oct 2026 07:42:54 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 12 Oct 2026 07:42:55 -0400
X-ME-Sender: <xms:vcfMaiCvTyfdTem2aCTdRR2fQHh2fmWWdWpclGh4Qo3RbfV5Aw2ncQ>
    <xme:vcfMakEgVtzACRrXXG_gkXwYahjFz0QAWdf7uVopJYporAN_8br61BK5kSPd4rYMC
    DY59tasWZP6s0MDkqMmW6QFcrS_WjILdf25lEs2ZdxGifw56N9-wQgb>
X-ME-Received: <xmr:vcfMalMsPWZnoZA4jTaxTIr0EZ-0X8nTssFkoAaw0OKOh1237etfFdXFla8>
X-ME-Proxy-Cause: dmFkZTFn0qRlGtejrvSmFoeFSa9WhtjXZQ5i4Fb9PhPmjj4k3K+OZ0pehOpB/bFOKjg4jc
    CfFj88JdJguPIbqmtpkWLW99EuflPx74ldu3tiD9XSu7qCMOi7iygh2zECXFc8XAtIoy8x
    QPQsWQmGbCBXCpZo652nD2bZ/plxf/uJYOQQyqHfgItaDIwapusOqgZ3W2uDwHMxTzKYzg
    qZQLzD5GIiFrxdVPpGcRAq2itikQkPfQhvekCLb1KmYgI/VQpTpri7tgpKupHPsEBaurff
    e9fuWvjPnSUBcO6kERYEjyVFV+F/YGaG2syeF1kyEuCsmU5h7DjwIx6yGwDgJ/X0o0j/Sb
    iZFfVIAZ4m5cH4Upaz2ppy/PyTIlciXuKLzPDwF772Sd1Sw3TNCTkOAQe1ctBQYZMb4eZB
    31N6lUTYY/vr+Uyc/MggZ4yOB+XE6Q2Qf8GaWHJBWlbbj6bsr7wJKSuN2L59o7jSra2yI1
    u9W4/wkajjVLUgFr7OpqPEoZ10FV+fnSd69sl7MMUDvkcBMxXYyKbTBO1d0qv3X9S8JEP0
    yLGZq0IkRTvIWePOmV1iaP30F7Gwe3EaimqEX2FQxoi+SscqXMfSYxdb+AZ6lulfl796xt
    Es1zntiFChjaraJ7k/TfIlB7SOCE6fg3wDlYesdgVuf8wkWHzsoKvzOfaesw
X-ME-Proxy: <xmx:vcfMatjQFQjc-IVZxdZ4cE5-hFIHubHuhTKKObbzygU9Ar7Fufwr7w>
    <xmx:vcfMat2DXfYPfXaonnXMgbz3s-Vi81Z6ACIeaYvXhefLJI0rG1bjNA>
    <xmx:vcfMainxi_-dOAJaCK-CPUte-gUH7vf4OvjXjOWBrorEj3RJP8Y-pw>
    <xmx:vcfMakugCN_SAuzCPpkm2rMPrc8Ejya-VdNzHNydIrRZCZnAQfTG1w>
    <xmx:vcfMaq3tOVcze-ZHetV07OyuAo6JoFtnASWa1IaiJElqJg26r4-kWT4z>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Oct 2026 07:42:53 -0400 (EDT)
Date: Mon, 12 Oct 2026 12:42:52 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Dmitry Voytik <voytikd@gmail.com>
Cc: Chao Gao <chao.gao@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, linux-coco@lists.linux.dev, x86@kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coco/tdx-host: add Kconfig description
Message-ID: <aszHlWi_aLIh8r9F@thinkstation>
References: <20261003223237.513456-1-voytikd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003223237.513456-1-voytikd@gmail.com>

On Sun, Oct 04, 2026 at 12:32:37AM +0200, Dmitry Voytik wrote:
> Fix the issue when the driver always gets compiled as a module.
> How to reproduce the issue:
> 	make mrproper
> 	make defconfig
> 
> 	./scripts/config \
> 	  -e CMA \
> 	  -e ALLOC \
> 	  -e KVM \
> 	  -e KVM_INTEL \
> 	  -e KVM_INTEL_TDX \
> 	  -e INTEL_TDX_HOST \
> 	  -e TDX_HOST_SERVICES \
> 	  --refresh
> 	make olddefconfig
> 	make mod2yesconfig
> 	grep '=m$' .config
> 
> 	returns only this driver as module:
> 	  CONFIG_TDX_HOST_SERVICES=m
> 
> "make menuconfig" doesn't let switch from =m to =y either.
> 
> Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> ---
>  drivers/virt/coco/tdx-host/Kconfig | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virt/coco/tdx-host/Kconfig b/drivers/virt/coco/tdx-host/Kconfig
> index 57d0c01a4357..5a13ec6f51e8 100644
> --- a/drivers/virt/coco/tdx-host/Kconfig
> +++ b/drivers/virt/coco/tdx-host/Kconfig
> @@ -1,6 +1,10 @@
>  config TDX_HOST_SERVICES
> -	tristate
> +	tristate "TDX host user interface driver"
>  	depends on INTEL_TDX_HOST
>  	select FW_LOADER
>  	select FW_UPLOAD
>  	default m
> +	help
> +	  See INTEL_TDX_HOST for details.
> +
> +	  If unsure, say N.

I would rather keep it hidden and make it follow KVM_INTEL instead:

config TDX_HOST_SERVICES
        tristate
        depends on INTEL_TDX_HOST
        select FW_LOADER
        select FW_UPLOAD
        default KVM_INTEL

INTEL_TDX_HOST depends on KVM_INTEL, so this gives =m with kvm-intel as a
module and =y with it built in, which covers your mod2yesconfig case.

Does it work for you?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
