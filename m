Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794242353;
	b=Yu5PFcrNR807VrI1zhy3/pHSfXe7SiCnC3G2eQdfBkns6E4/Zl6ez2S05x7AryALh0+s
	 rNT9la+78RItDlvU2kWaVofSdnYaNZmK7q5RSyWUtStIQkBZLPIabsjJzvCdEnk385PDb
	 39UhO6c/Jj/PP2SFtc1DE45HwmVuab5qEYfmo1fVj5UQW9wY+PDbatmJ2esWal94+POGa
	 r8r1O5ks7DLALtlnNI8IUrwwQlQjdn4vjBThjnHcG5dgnXXB3g5Cnhp9buAd0rHqMBqXD
	 h2pE4Vawbl1P7BHBwDFPWyl2eGysMG0kQhU5EkRnInJZXkswJLMxD+ZgC+BHGCYZSLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MNALSUguKeNo/Ez0qP/sAmD0UeGu3ljjdxeLtNNj/80=;
	b=JThVmMQ7/d4M/+RRZnN/x9a6zlH9dTNs/cTu+vomVsrddR5dGKMf5wtaslBjw0jrya6z
	 zJqZMwCjzvP+2ASofBbOcDXD2D5rxGtenBn+8M+BBbY6ZzjPpfJ8MvE5j2xtCNRe2fFdj
	 YUKLtsBINyHND20snkgsLoDYe8wkwWEHVrTgfy1I+S2/XYdAQiV9F9HpjYAJYlo7HyJD+
	 dKNZGQ8Ai82GrGojWzyQ7BA81IU0lyEiUOEEv9KIvr0XoppJkDIFtfCF8eGXRV9kZFqO3
	 yGu4quVjx+KAuPAjQbmTqVUNCkB8MRkbr9cLTzu8tTVZFHZAA6VNSUHA962kkV4Vshw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V9ccdv3k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D516606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D516606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V9ccdv3k
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5383c97c8cfso300541cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:39:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794242352; cv=none;
        d=google.com; s=arc-20260327;
        b=IefLG0kPg993xQYk6wAQvhdZeJfgMx12tqNo2YfVbjiufuAQ+lfDD+sV+PkfY0j9MX
         K+klSplpULsqJImvJub7CZq2Y9gDIpqSR1nbQ6Y6InBw2Rdh39wseU2iP1cE1VoJzPwa
         FB4uYyXdb+L6oE9dVU+HHmRhIg0xk0JIyJDnGya/Z2RiihbYOYAk1dFBFQUr5aWTu0zs
         gx/ychJQnonDxxt6CuWCNHl/cotO18dnAp5xulpaSjF4fyWni8KotusaSq9b2+I75BCW
         3KYfMqQzjeEhs8OmjggT6s9D8oGlCvkSKuvSB734OiELrbWsPaHaX05TTBVXFzuUtAxF
         GRBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MNALSUguKeNo/Ez0qP/sAmD0UeGu3ljjdxeLtNNj/80=;
        fh=2e9IHrlrZ4mJqjBvWuwT8lHqeoVakny5z9gJ2YU4M2k=;
        b=jpW/lAJXSZFV/CjQe/ZcYygLZ3sX0zzF0T6NCsdKVFCsEK4EjIZLi2Vp6CihgKG+Cf
         bdcDymHA7soqObcgAHfKqDBEV2+IuhOX48Vw87vguBZR2Z7qCHUbipQo8/UQKkWq7D+4
         BtLQHCvi784ojoosQ3v65f9N8ZC4Oa571Le8kg0U5FizJLabAxTwnDruKBvHli8ayBUG
         XtsTkuGk1+J5RObUHJS5O8g++b8EEumJw3f3SbiKRa2D0pxyHGcGA9bP13TGXa4m56Qu
         BtrOxVezneMS+DoaNpe6qddJHDj8v+leSt27ugIYeW8hX9mWi9nzBGuNaKrbrBKc6Ehg
         jpjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794242352; x=1794847152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MNALSUguKeNo/Ez0qP/sAmD0UeGu3ljjdxeLtNNj/80=;
        b=V9ccdv3kK/Lbx1Ki9SfCLupe5m4AB1kXkJnwHDXcTbTB5eivVr+DgayWNH46vmTbE3
         LAgIu6SrTtf0DK7WuYphsLXwxG8xDvpU0IdExkaAamByNth8mgXQjBnM00XZ0Dqh0YwJ
         nZtHi5UCl5R7zeQ8Igx4eFdV2oDs79h5bGJ5jtWwHM/Cn5uHcM348DGk3jx4pThKU2aU
         34NqNj7plitjbus8/7MEN87B4ZriRW6jvASOnR0aHKjYhUU5xT5XvubDw4KSVDMSRoMm
         c0bFTl06PloYMgngbUCB1SkXbW+lMUA+0O1Py2U5aEDtJ91AdWbnINpbE32ryrhk5GOo
         fbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242352; x=1794847152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MNALSUguKeNo/Ez0qP/sAmD0UeGu3ljjdxeLtNNj/80=;
        b=tn53fd/zXUURS3h2PiE4SE4imJMuh1uy3VhptFKtLQXZ+K3iTwZ/C3sHkus/06eqWA
         W5XXAe1Fum7E39XGBt+30VP7JSi0meXhZxtxtTMtEvIgn+RlhthaOmxUlh2/0VJJt0R1
         RdBeI6zq6fFnfscjC8BKt1pgG7sHmikAvmh4o5RMvg3r2+w/TZTJR5L04gV8dXWkp81U
         WQYpDT9TpC5jEAeKHFoHkPUMlBjXfWmAlCxgsvDFu/0Kym89FT9j1iITxgYFOJ00u4rj
         14w5GLZ3og2QQCS9HHK6tCQZq1KRoMs2B9kVLEsCYUaksSUuzFBs87nR/ZdrMS5p8pBT
         nqDw==
X-Forwarded-Encrypted: i=1; AL+hErFJ/reDO2d9BZAJthsj6BgfnE5N1w2ke2IjqAy797b18PAJCZpgYnYwKhrqP20mpRWRIKZQNs9vHxxW5/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r3F5v+TokMG7qrD0XsiRCkFRH4RxluWg43Dhkwbgdjd7fwkvB
	VJ+/NDLr9ZClIXvDhQNrSqxWfLwVs6oBS2pJiI9GaQw03vdsTq3Fav9yRNvrjkyBAUiU0c5huBo
	RPy9ct91QmS88zHNf8kLGUeuKd+5fT3Wc/dh7dgBt
X-Gm-Gg: AYBFou3t+HBo23zLbz+DapGr4wlqGtV4nXKQI7Av9QIGkYnVTHQdnSh4b0NIaAjzlvj
	m0XumIQRriUkv0xSf5kOqsPi5zvEDLb9hdLcP+IFuPJOs3d+AsZNuG+9DgSdCE6+fJDV2Zg2KPM
	+BnWBJL1oVOBDTxigQAbrWCAEklRogAUKH4x+9btVi2mRqCsANepP7av8S2m3cH4MFVosHApoY/
	q5+ATzbVgYUJJSyJB7tZI2/XdMA5LNq/ByPbzYAAzXPZwNzxtG0RTv34dpiRrmkNcroxfIlvDq4
	ru/+vAV80zHrrQz30wciirNuCzBgwlUqtXrJQKKlvHs4nwVUTUUi8suFboe8x+gCP6/oUE5KMO1
	tDdoT7lcNGg8O9Bih6vqg9TlMOc/Oec+vw/dHY7FPuMB0ZjuRhnRfUQYzl5xeXE/cRus=
X-Received: by 2002:a05:622a:2b4b:b0:532:8423:1e78 with SMTP id
 d75a77b69052e-55519d553afmr66891cf.10.1794242351337; Mon, 09 Nov 2026
 08:39:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109080126.417161-1-irogers@google.com> <20261109080126.417161-2-irogers@google.com>
 <179423587020.3133545.6594248101575070050.robh@kernel.org>
In-Reply-To: <179423587020.3133545.6594248101575070050.robh@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Nov 2026 08:38:59 -0800
X-Gm-Features: AclHuK8feNx1zDrXSRA0wP-1jAG_C3k6aMQ0LXM4MGvjXYCUb91zzoIWLHYo0TA
Message-ID: <CAP-5=fVDVds_q7NjAcapJw4pUx2psF2c9AsaKZC7nJbcOHOJ-A@mail.gmail.com>
Subject: Re: [PATCH v19 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI
 PMU definition
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Mark Rutland <mark.rutland@arm.com>, 
	Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 6:51=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Mon, 09 Nov 2026 00:01:24 -0800, Ian Rogers wrote:
> > Add device tree bindings for the Broadcom Raspberry Pi AXI PMU block
> > found on BCM2835, BCM2711, and BCM2712 SoCs.
> >
> > The hardware exposes two MMIO register blocks: the primary monitor
> > evaluates the System fabric and the secondary monitor evaluates the
> > VideoCore VPU fabric.
> >
> > Co-developed-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 44 +++++++++++++++++++
> >  MAINTAINERS                                   |  7 +++
> >  2 files changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835=
-axiperf.yaml
> >
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Thanks Rob, and I appreciate the testing.

Ian
