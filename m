Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886104;
	b=WVblXBI6U087MCfm/MEG/DlI2gWnHu9dclvIX6ismcEMMAV5WIBG7f6JcTF80weUJYLA
	 vQ3uyLJQUysRImA2hwP23x9B3S6IsER9RzxJqnhnFTjPoRD68U6zsVCo1sZUv0xoKnZQd
	 RojUU+5KRmd3Ngh4ZI/QubGAcHKORlDph7on/1P4dsjIBFP69GEF4LL2cWuySu6SIQIzv
	 bZvo1CHuU0x8ZpKRPFUXLw9+OsIXWxqmbYi9Aznkp6RiCN5FOxgJQ9nik33jDATWs1ZLR
	 y4Pqpt4WUI0+g8C/v4KhcQvxDac+sb0yYMYQHN/BxK/XNdDL/RZRad3lLryAbxxVJLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5/GsPw6ysr3Xvdnr+TigErWLMubZI7BxQjWx0TCjmMM=;
	b=aC/d9YhhcctBsw+ssF53PDOogheLgF26uF0btrHUiD3qd3MEAA+j4wgTDZ1fT6SvgyiQ
	 MJoIfUWCNEbkcg37YwikjKJNyHajYNFI6Oi4b2in/Cu2d4pxIPHyWDL19a/kzhOnE27h6
	 miVG69CXcpHDVE+6tFpG0BIqCr0W+sSagDEAuav7cIIF+VEPAGfMBRYuEFjnp+yWa/nYk
	 /V3m7VayP/cywcLba7fPjeoV7/3VlwhPE/X/3W3ooFtfS7yA8Eons6rK7VsSa2hWU6USu
	 Hpe0CQr1M2CIiCeP1m/ur6EaLA+9BleLpUU9D3ZZ8xa1cCsgoa4mc95lU3yS7iHJVaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Hr+5+VmY;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A41606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74A41606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Hr+5+VmY
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df4f540ebso992538f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793886102; x=1794490902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5/GsPw6ysr3Xvdnr+TigErWLMubZI7BxQjWx0TCjmMM=;
        b=Hr+5+VmYwlvXWWmnx8xC/o+Rk/3DN396WTfJJ8axuTDipMHcCljTfd+46AhY27xyRg
         J2mE6RVfiV8B/7RU6gn19BfadVmWzZ3Mevy0z6BaIGpLpl2V0gOTASpf8XtBcwWxMCfi
         XLCwkK2KbrcObYOwNpnuvF+9DTBaU/KVxNRv0dS/2nDkvsU8s3CMCT9QAcydehJW/trv
         GsAVZ6erkHBKsboC3h3/KYS3DmC0HM6JbwdFQKw7FFjiSmA/Py8r5SERm/klEONZ44C2
         o9qCkFk8bKIXH1DxDa5GqqUaCO0FCLW/ZkpGYck1lzoEVfK5gYw6O1tcIv7C4qX8s7E1
         aESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886102; x=1794490902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/GsPw6ysr3Xvdnr+TigErWLMubZI7BxQjWx0TCjmMM=;
        b=xoJnqpuvJasBaW/nQxEwUIWOSWU4RCSF0FVa4Y5mXw2RGAidKadbzmsS2LASy40Kja
         etRTZGjZOtSjnOFG4Mw05i23vKOazvu7wH/262PPDomgwLL5gbGndvTE3cKuBFTcjmMF
         P9Xlwbg1shbvNqDwmTqK0FJ7cwaXmA63Kfcq0rHJqe8NNp89ZwOrtlXNaGm+rZtVbi/4
         JL4FFJCE1f1N5966VOOihH7IHTsgwOnLb38jSqFNpVb533Ic6rwmmQl8QZni1njj5uKE
         J+9U69TI7Usm6hz/PfRmWQIndYEvOtUNgxxizNyulL99YuijmmX2vJ9XWRYLejrUplV2
         v39A==
X-Forwarded-Encrypted: i=1; AKwUvBzFjU7pJzARtSN8C9olKj8Tbcz5fDafQmryfDGBO5EBPxyYP9J+XEJMbaKLoHl1wno8jEaYl1w4EYVtnws=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+9knaeVwVkZtNWQ7n8ptR9+2SfRCXuK75s5kwO2a2cUC7hMKc
	yUIxAWM7RaLIN075RuxdGhuF7fsC10rrUKsF2JSn0vK1a9WbvrRIV+Cteu6yIStug1w=
X-Gm-Gg: AYBFou21zON4CeU3Fsip2tLpCFf9hCnLGmQjKaCIQKOAwTKdOZRk9UM5Vq42/+hN6sy
	VWiAVIYdStXnhND/eXwU1BnPaOZzgwVo0szAlFURAVMsD4kc3zny6nTRwTRBS/kyPSkr3KLVbDH
	dhyGnavDTe2yGT7/+63TxapDVgYplhb6qYzmfcMsH+bUzr3qNqKoj5ELcSJdgYJsJMC2fKEpeRO
	G0jUCN4ejm7ouai+shSs8b74knFp+4yTkxWLzsovxQ4D2oZ35LEHFswyzRSoNzvPJ7MnK1+y9JF
	dgkoon8TqzuidwNtvN1YtlHf5ZYFPy2k3OfSNjLR69ryGQHlElXREvy/br3kk262nlVe4URKP18
	qdfvcnJC2DY4SvRg8pkB0tQvU6AIPl8Pz2Hc0UYrvl37wYI7yUjGMzdvpD2LlMcWQenlH2E/VbC
	dv11fKyQWRbX/LyQTz1p0ePUVH0qheiS9bh0ZHX+Nrovzu6Eg1CfSEb/yKGnSm4k4u2Ses8mS+y
	bgYNlX+TD+KifYGJdkHbfHtpRGXtuIoHSCIhAFg68ZKzFHde60f/zZfbQ1GI7U0HUvP6fdyKPF/
	iXdmB6bwg+WEnaLwAzU71bQh0Ox6XfgtXzOh5GDYxta45U/t
X-Received: by 2002:a05:6000:25c3:b0:48b:451:4f19 with SMTP id ffacd0b85a97d-48e6e5182bemr39618525f8f.51.1793886101892;
        Thu, 05 Nov 2026 05:41:41 -0800 (PST)
Received: from localhost ([194.213.108.8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48fea1811c4sm10123361f8f.3.2026.11.05.05.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:41:41 -0800 (PST)
Date: Thu, 5 Nov 2026 14:41:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Message-ID: <auyGiW91Ir0JcuxG@monoceros>
References: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
 <50647b7d731fa54fdc3e2869f02de2096acdcff2.1793879714.git.u.kleine-koenig@baylibre.com>
 <sashiko-outbox-198999@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cwyxkko7vmbusv5v"
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-198999@kernel.org>


--cwyxkko7vmbusv5v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
MIME-Version: 1.0

Hello,

On Thu, Nov 05, 2026 at 12:10:05PM +0000, sashiko-bot@kernel.org wrote:
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 00019b1895e6e..e750a127cbc4a 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -75,6 +75,7 @@ enum rsc_handling_status {
> >   * @detach:	detach from a device, leaving it powered up
> >   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
> >   * @da_to_va:	optional platform hook to perform address translations
> > + * @memcpy_tova:optional platform hook to copy data into remote memory=
 range
> >   * @parse_fw:	parse firmware to extract information (e.g. resource tab=
le)
> >   * @handle_rsc:	optional platform hook to handle vendor resources. Sho=
uld return
> >   *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
> > @@ -99,6 +100,9 @@ struct rproc_ops {
> >  	int (*detach)(struct rproc *rproc);
> >  	void (*kick)(struct rproc *rproc, int vqid);
> >  	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_=
iomem);
> > +	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src,
> > +			   size_t filesz, size_t memsz);
>=20
> [Severity: Low]
> This isn't a bug, but is memcpy_tova the best name for this callback in
> struct rproc_ops?
>=20
> Across the remoteproc subsystem (such as in struct rproc_mem_entry and
> ops->da_to_va), da denotes a remote processor device address while va den=
otes
> a kernel virtual address. Since rproc_elf_load_segments() passes the
> untranslated device address da directly to this callback (including for
> devices where remote memory is not mapped into CPU virtual address space =
at
> all), calling it memcpy_tova seems somewhat misleading.
>=20
> In addition, when rproc->ops->memcpy_tova is provided,
> rproc_elf_load_segments() skips both the filesz copy and the trailing
> memsz - filesz zeroing step. Should the kernel-doc comment for @memcpy_to=
va in
> include/linux/remoteproc.h document that implementations must copy filesz
> bytes to da and zero-fill the remaining memsz - filesz bytes when
> memsz > filesz?

That's a valid concern. Maybe `populate_segment` would be a better name?
I considered being more verbose in the kdoc entry, but all the other
entries are very sparse, too, so didn't want to add a 5 line comment for
the new callback among all the one-liners. But I can if you tell me your
preferences.

Best regards
Uwe

--cwyxkko7vmbusv5v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsh4YACgkQj4D7WH0S
/k4IJggAu4L1Wed3i0W4vuPU7pAQ2mQJvf3FezMAeGDQffUtpvt+zlonpWqYwV7r
HK8tL4z8k28POxQlGKhkCLJS0JLSFnZpN2S0YQ7Kh2gQyzfxq6sUkwUkHKGNtYSX
0kI4wqKgdURieKMj4hFmGKeX9o/yXSX3F9W+uF+FwTl78oOZAK6YWgoZLjSbiagt
M40PJrmpoCTPln1ZcWc66RLVoA9IBR8TELu2VNA536pV3RSAGaCbHHmECAQMrBMY
IfGrXrxhI7fCIhMC5OT/hBBRB140ekbyW0PC1kdVqu1iT4j1WI7f+2wMV3e5ba2D
Yl1Q7lDlQ/qxjmKRlfF1oyzKWeAl8Q==
=axH4
-----END PGP SIGNATURE-----

--cwyxkko7vmbusv5v--
