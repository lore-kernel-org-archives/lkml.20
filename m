Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B46E440A08
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787838853; cv=none; b=epHUiV4KAi3/fWBz9bqD+HcjTVVCNRqIP69xsTeytNBuCeEhtPtbifDyrq+/T5noP1UiERLmfJyR8xFsxh3xXEr1q6sddfbPSDLH13ITcBJZ0aGNwlYax7oUSFrOd9iaS7+H2zoJKQMW4gQ1dD1i2ZhOX8eHmbJ1PMlZdoiXIHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787838853; c=relaxed/simple;
	bh=rWfd5/uJ5kBo6WJGlskG3tntoc37IMd3ji7UZYIgyR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UIzGTezLMXrAZdQkmWSvhfckOeM16HGTqbbm0ZoFCVyY4A19R/Ric2EuRi6sChQUK5ynrC66itWujqYMqaEOkYdnRbtAjSHdP9WozXWvQyletZObhGvY1uygjU+CnliRSNKGtHVLrjqyJPjEe8WWFRXICvaji556x4bh2e4r0o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=pXUzBDvE; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="pXUzBDvE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=rWfd5/uJ5kBo6WJGlskG3tntoc37IMd3ji7UZYIgyR8=; b=pXUzBDvEJRH2f1EWdSQVLIRPD0
	st02wJxpl1rJYqoYPw3CMLo+Fl6YPud3datM6GryS3PIFiX9JDkxm7vyVKCrzihH785halA13rKcE
	PTYnbuZIdWtycOfiSlFoqJS+OsCVWKQWD/2mXNbsJcnP900fCotQqRw78QseyYPdwLuCFLocWl9XR
	t1m/VMl8J2s7/pUoSzxMmYjM6TXt9Tj7awsN0vnz4ZBAphh1rBt8hAkjZ+g+SYyUumBnT1xHjSDIZ
	yip6AcM5B6C1XByK2mkGoM0Ihm1BVgPeT0j6RrYB7I4ZT/Wfyes2a/gKSVJUoEpmfRB19mCgE3WGz
	SEGjWgdA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Srinivas Kandagatla <srini@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Stefan Kerkmann <s.kerkmann@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] nvmem: rockchip-otp: convert to runtime PM
Date: Thu, 27 Aug 2026 15:54:06 +0200
Message-ID: <2048906.PYKUYFuaPT@phil>
In-Reply-To:
 <20260819-rockchip-nvmem-pmruntime-v1-1-01f1acf80dba@pengutronix.de>
References:
 <20260819-rockchip-nvmem-pmruntime-v1-1-01f1acf80dba@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 19. August 2026, 14:33:45 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Sascha Hauer:
> From: Stefan Kerkmann <s.kerkmann@pengutronix.de>
>=20
> The driver enables the OTP clocks inside rockchip_otp_read() and drops
> them again before returning, so the controller is only alive for the
> duration of a nvmem read issued by Linux.
>=20
> On RK3588 that is not sufficient. Part of the OTP array is readable only
> from the secure world, and OP-TEE reads it through this same controller.
> Its clocks are in the normal world's CRU and are plain gates, so an SMC
> into OP-TEE hits a clock-gated controller unless Linux turns them on
> first. OP-TEE cannot do that without a CRU driver of its own, which
> would put both worlds on the same gate registers.
>=20
> Move the clock handling into runtime PM callbacks. A consumer can then
> take a DL_FLAG_PM_RUNTIME device link on the OTP and hold a reference
> for as long as it needs the controller, without knowing anything about
> its clock list. DEFINE_RUNTIME_DEV_PM_OPS() supplies the system sleep
> callbacks too, so holding one does not keep the clocks on over suspend.
>=20
> Enabling the clocks is now the callbacks' job alone, hence the dependency
> on PM: with CONFIG_PM=3Dn they never run and a read would go out to a gat=
ed
> controller. Reads are otherwise unchanged.
>=20
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
> The driver enables the OTP clocks inside rockchip_otp_read() and drops
> them again before returning, so the controller is only alive for the
> duration of a nvmem read issued by Linux.

your commit message got duplicated here.


Heiko


