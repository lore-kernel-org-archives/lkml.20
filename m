Received: from arkamax.eu (128-116-240-228.dyn.eolo.it [128.116.240.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645014AA3F4
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.116.240.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406024; cv=none; b=TK4qVB2ZYD6fRuCYMSLq3kU77uL4oZ1ylUfCrV+L1Doh5CV7mylG55hlN5O3pdOrHUiSHeXz1E3Xtwye8rDBSaBvpKezb7HT9v64RhmKByxVDFTfnJU+ykr22pbNExqRRSNDS2BFye5uK3wMJ2c9nwtJ4ZixcwiFwmWMk1Jfsfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406024; c=relaxed/simple;
	bh=fH5+pyqS19kg8fahTGU24ILZEIcgl731ctrI3o40LaM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=T0L0uxkE2QSF/EcB7veCiNrCiKx3e2K1St1lLDyz7DTeKrQcvS5NjZbnKp0Mx07o6ge+Gbdysl8tpNeYXgZzJGHpzqfmO95o1+zz2ukv4l1EpaDw5ofi4bZwx5M9cnzF0C9/D0rwxt4u6mNc02Cz5sNGjG0mvMDkswswd/wIHCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu; spf=pass smtp.mailfrom=arkamax.eu; dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b=jzmmzP7K; arc=none smtp.client-ip=128.116.240.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b="jzmmzP7K"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=mail1; bh=fH5+pyqS19kg8f
	ahTGU24ILZEIcgl731ctrI3o40LaM=; h=in-reply-to:references:to:from:
	subject:cc:date; d=arkamax.eu; b=jzmmzP7KDDxbg5bohm67/+z1iP4LKrkEf3ydY
	azquM006oH1PgmTKfWR0pZGbIG2OoeecMbuwsTS5gH7ArOzNyCOfM2hR7/P64K0SKJ9OH6
	LGVGzOgFmSxHBJUfWmeKvTXxB11MfJ8Y3T46RSybvNGriYAITG+kkl+6OHZJ42jDi2IeMn
	0ZBlOCpIaV2bl209h5yPRd0F8uvEJLfTFRdcLljMTadLLRU5Nqc5avIC75RgCRz+1LiQ76
	iHf/LHPQAAkfQJva/i4ZC9cVYIugzCZu8imR7+8tKT4qHdIqyLi7hdaqLaKHY7uAV2VwIR
	IFXSaRcuhZGR3soFrSvdMgiIw==
Received: from localhost (128-116-240-228.dyn.eolo.it [128.116.240.228])
	by arkamax.eu (OpenSMTPD) with ESMTPSA id 9ef07066 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 19 Oct 2026 12:33:33 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 12:33:32 +0200
Message-Id: <DM8QWISGYBCZ.FC52WMOJDZDF@arkamax.eu>
Cc: <linux-nvme@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: nvme-pci: nvme.quirks= on the kernel command line hangs early
 boot when nvme-pci is built in
From: "Maurizio Lombardi" <mlombard@arkamax.eu>
To: =?utf-8?q?Ram=C3=B3n_Jes=C3=BAs_Miranda?= <ramonjesusmiranda@gmail.com>,
 "Keith Busch" <kbusch@kernel.org>, "Jens Axboe" <axboe@kernel.dk>,
 "Christoph Hellwig" <hch@lst.de>, "Sagi Grimberg" <sagi@grimberg.me>
X-Mailer: aerc 0.22.0
References: <20261018155426.1299676-1-ramonjesusmiranda@gmail.com>
In-Reply-To: <20261018155426.1299676-1-ramonjesusmiranda@gmail.com>

On Sun Oct 18, 2026 at 5:54 PM CEST, Ram=C3=B3n Jes=C3=BAs Miranda wrote:
> Hi,
>
> Passing nvme.quirks=3DVID:DID:QUIRKS on the kernel command line with
> CONFIG_BLK_DEV_NVME=3Dy hangs the kernel immediately, before any console
> output, on arm64 (Microsoft Surface Pro 11, X1E80100, 7.2.8).
>
> As far as I can tell, quirks_param_set() runs during parse_args() for
> built-in modules, i.e. before memory management is initialised, and it
> allocates there. As a module (nvme.quirks=3D handled at module load) it
> works.
>
> Removing the parameter boots normally. I have not checked other
> architectures.
>

Hello, USB also allocates memory in that callback... but there is
a small difference...

Could you please test the following patch? (Compile-tested only)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 77317e5d00f9..6699c7da4b5a 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -243,7 +243,7 @@ static struct kparam_string quirks_param_string =3D {
        .string =3D quirks_param,
 };

-module_param_cb(quirks, &quirks_param_ops, &quirks_param_string, 0444);
+device_param_cb(quirks, &quirks_param_ops, &quirks_param_string, 0444);
 MODULE_PARM_DESC(quirks, "Enable/disable NVMe quirks by specifying "
                                                "quirks=3DVID:DID:quirk_nam=
es");


Thanks,
Maurizio
