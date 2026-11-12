Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794441671;
	b=0clkdCyZCDg0QIXRNPjoq2oi8kEz3q5gEBFLAi68ewXbrBfaSdg7yFGsnT0zyoTExrs5
	 E4pXDcvI1RwiG3Rcwa6dI717xnNWyCCRhT3yPhyT1YoFPU820h/8z1kvjTugkFbwSxiWy
	 kU+EVjiEVBekpmyGHhbVBVMprytooq0wCmr3bYxj7DKiHpx9mW32lF0jcRDI1UkuJ+cFe
	 FPqUmdAZO/HLQU6/61cKbGeGAt0JM9qjud9NJZLZjJffqXW1K8PT4SnYmj+lnygjmwpUp
	 ru+Jhr70q72ZCkujMnxhx8c+x0saBG7dZq9ZWKINiD5EJsaHwIx3Hp8B6ilZ923yjSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794441671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=BGxV5GaAPR9OQc9tbH3qdasAzMttEnvIDguQ3NY5O90=;
	b=peQ43ysAWGkkIAJoKxFsrioONTXh29scvECOEvVr/qlc1hHQ9jCz3i6e6nzkRvdnOmjX
	 hsw6SuIhvO7HF/4qyrwPsvcKcZ5AVwwWtpsQNIOfpPc4s2I6OExK2FlWkpHyZvzN2C3Y0
	 k0oxyXJVgmE4Z4SotAcRDvFSFxD6WziU3+mXL82SV66Q+U9tEfRb3BUoA0RWNPh7R2YUq
	 6tQrT3hSPVcc7JLwwYjlgGkbpvOtT4F2QR5T/ie0YqR8wOIapGuvgA3SO/GbOLVMfunbE
	 wioDwUwJZWObxWhbSxfUuH+HqzCetea0NXZgwMv3Du7ie8aBxs9TLU+Sw6+WCFb88+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QoMKgKL3;
	arc=none smtp.remote-ip=74.125.225.71
Received: from mail-wr2-f7.google.com (mail-wr2-f7.google.com [74.125.225.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AB5606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21AB5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QoMKgKL3
Received: by mail-wr2-f7.google.com with SMTP id ffacd0b85a97d-48e0c9bc8f9so1650485f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794441669; x=1795046469; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BGxV5GaAPR9OQc9tbH3qdasAzMttEnvIDguQ3NY5O90=;
        b=QoMKgKL3rV955BcfmYWa+kz1zAoJHeg5BXr1efXWWPYY0JbYXMz/cLzcDP0gHSPTR3
         MYJSo/8RE+0AeuYBp0DSZtsXSsBOlcOLDipbvXLljn0nXcgAuqQsixCAsJR+nSMFQxKW
         Bam5Otsx3UyWqOBpwU02V+n3mAd1qT6q3xG351GpJENyyXmH5O2GpZ5gvUNHCK6/Uq7e
         ifeZom2gExj16fIjIb40SJmr695Iz93fEMPDj+84NcsI0dA719pMs/D8q9D/Iuuz+QDK
         Ci6vZVyBmE+lb3mEc0Kshgw8M4HoStp1RY90uP8Xv/gnFe2rwGyftshM9FuUFQ08xcr6
         Vzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794441669; x=1795046469;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGxV5GaAPR9OQc9tbH3qdasAzMttEnvIDguQ3NY5O90=;
        b=2Uki+DzmptOIpUpxBRkZ2Kj1vObI3upB+ohEXWdchrTl02bDNoknFjmb0PYZpeE2Pi
         i2H4D2qkgxc+fQzmW3hXZAPLBP3WkiyMMHCfjio1qEPoUoDyf1+KlEzS5qlKYBRSQhRE
         zTyUjuOhNliTdPhhQIg8APV9VDVLMvnXUNWUWihYk+tiq2etxu0AIWw4uaxcff0d1vgS
         j9PkiAstvDmGuzCjFveUMXst+Cp5YI1ni1dmM0TGjv6BRmFQ5ZV9LgjFhT9EgbzUOJd8
         FhKStpAt3dJOVCqZTKv2JKwI8CTaCRP5T5ZLZs0KUxdCL2q4rKP2jcp4zHxxyj0x0/z6
         B7wA==
X-Forwarded-Encrypted: i=1; AL+hErFogMh3HSByFp3Kwoc0aH8prynwVD/0ouq8ZX2SIIAd3fZQ/ytcwUKeJ1IUsZjm28uZ2Dy8V2j91HgyHsk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZqQ5MpIjxaLAwZFC/L9wyhWbOE9fG1NJPzpZz5y189nZsmFz4
	/s8PkDyScTEwwaW76HSR54avYfJaMemok8GQASkI3sdG5c3Qq++nilF9Z8Wuzmgk9eY=
X-Gm-Gg: AYBFou0zYKgn8T7mqwfQMRTTe5nGddcx/RurbYdFznZx/XGlnBOKIoW1EF+HL41thVI
	XmWVRfZg/oQIiCST+lsOjQip1nWuazwBw35opA4SdVSoz+yjUA0Br9g4j6jObHO1XVlszDDQF2Q
	z95et3Pnr7N3+3ZxulAywz/fGF40ZB/fumdtjplGjJ6AVazW05sedhXeaUmWuF8fsINHQ4p5Tya
	EKwMc7VTIceSEfmuEXQXq8YK+FX2CzlMDGbe+u62rXsPfDxyB2GE6TjrzE0IiiR2JbVSIsr3Oq+
	0XUVjgMSaVv1ByImXMF/lnBaBarwwzdhoSrrpMKG0/t3ZDd3tSZTfwSQhDtgsaaNUxxqfU3iUsl
	QB92CWpAU6OBzhoM1FQKldaqwUz5P8g8Iwr+nr6Hotu85esrE5j7mEkGbYDV7Lg+4j6h8KoCGvl
	nI6Ksl1jBVwibBOoRv23u/PYIEWma75BY7Ku8SvNFlA7LUGBTNNYvfQroEfOczJvQd0HJ1KQdZv
	sCwq2N9jyd4kRh1mlG7tXs0ypmF9QZ3tdO/6memIiRaeAaQL3kY0pkWCxAZiCNC162vrOeilDKz
	924j558GfLPxVGOiOQguXnJ6Y4H7fsQzM5z0ov4s1/4nbQu2cuNOc9FwI/MLpNT0qcpLj3/62BF
	k/QcRWai0j4qi2JM2RDJIpPabTXLqV5CgHfBkFnYVqw==
X-Received: by 2002:a05:6000:2002:b0:48e:f10:ceb8 with SMTP id ffacd0b85a97d-499c8982645mr6741108f8f.11.1794441669255;
        Wed, 11 Nov 2026 16:01:09 -0800 (PST)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbeedsm13418776f8f.43.2026.11.11.16.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 16:01:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 01:01:07 +0100
Message-Id: <DMSSHDUVX4J2.1YGT58MPOQYD0@linaro.org>
To: "Brian Masney" <masneyb@kernel.org>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>
Cc: "Tero Kristo" <kristo@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>,
 "Brian Masney" <bmasney+clk@redhat.com>, "Jerome Brunet"
 <jbrunet+clk@baylibre.com>, "Tony Lindgren" <tony@atomide.com>, "Michael
 Turquette" <mturquette@linaro.org>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Rouven Czerwinski"
 <rouven.czerwinski@linaro.org>, <linux-omap@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] clk-816x: add sys_ck clock as sys_clkin_ck alias
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
 <20261028-patch-ektor5-dm8168-clk-v2-4-dc6bf0fabae4@linaro.org>
 <DMI44C1VHP3L.1B6WSA5BOI6BY@linaro.org>
 <179442321741.1131744.1980930320808367339.b4-reply@b4>
In-Reply-To: <179442321741.1131744.1980930320808367339.b4-reply@b4>

Hi Brian,

On Wed Nov 11, 2026 at 7:53 PM CET, Brian Masney wrote:
> Hi Ettore,
>
> On 2026-10-30 11:48:58+01:00, Ettore Chimenti wrote:
>> On Wed Oct 28, 2026 at 4:53 PM CET, Ettore Chimenti wrote:
>>=20
>> > This patch adds a new clock alias for the DM816x system, mapping
>> > 'sys_ck' to 'sys_clkin_ck'. This change is necessary because the volta=
ge
>> > management driver searches for 'sys_ck' in these systems and fails
>> > without this alias. By including 'sys_ck' as an alias for
>> > 'sys_clkin_ck', we ensure compatibility with existing drivers that may
>> > reference 'sys_ck'.
>> >
>> > Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>> > Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> > ---
>> >  drivers/clk/ti/clk-816x.c | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/drivers/clk/ti/clk-816x.c b/drivers/clk/ti/clk-816x.c
>> > index 3b8e483aec92..fe6f66fc5a05 100644
>> > --- a/drivers/clk/ti/clk-816x.c
>> > +++ b/drivers/clk/ti/clk-816x.c
>> > @@ -57,6 +57,7 @@ static struct ti_dt_clk dm816x_clks[] =3D {
>> >  	DT_CLK(NULL, "timer_sys_ck", "sys_clkin_ck"),
>> >  	DT_CLK(NULL, "timer_32k_ck", "sysclk18_ck"),
>> >  	DT_CLK(NULL, "timer_ext_ck", "tclkin_ck"),
>> > +	DT_CLK(NULL, "sys_ck", "sys_clkin_ck"),
>> >  	{ .node_name =3D NULL },
>> >  };
>>=20
>> I'll drop this patch from the series. The proposed approach from Sashiko
>> seems sound and I just sent a separate patch that implements that.
>
> Will there be a follow up to this series for the clk subsystem? I don't
> see any. I haven't gone through the other patches in this series. Or are
> just the first 3 patches here what needs to be reviewed / possibly
> merged?

Actually, I was waiting for reviews on the other patches before sending
a v3 to collect R-b's.=20

However, this patch (4/4) can be skipped reviewing. It will be dropped
as I've already sent [1] (it belongs to another subsystem, so you might
have missed it).

[1]: https://lore.kernel.org/all/20261030-patch-ektor5-dm81xx-vd-v1-1-8ba90=
608c25b@linaro.org/

>
> Brian

Thanks,
Ettore

