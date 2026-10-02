Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583AA476060
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934429; cv=none; b=dN7/EUTdHwJTRMn0wO2W4aptsqVwljkKMzZJhYy40K+cCU47/u0LGIIU90uLO3ACQiUU56Ym/jfeAOWPxpk8KjEjwRhp1anTBiwXk8z0hT6S+/q3TvhN5DHkuwgxdTtrEpNlNGCN/bjA2ilPG1DSnelhTOXT9s3fyR1r6bpzOCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934429; c=relaxed/simple;
	bh=Krjma0QKAJ+bYUvzosW5mEzEcXpEpjRoTj1OLX8/vRE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XsxsJrh10pU0ThHNkXPQ8isjWrj+mJMF+KftZW7UNMissFScO/O3I6GTy7KpS8LlfWG8dQQd24W/sGzLxMSgPjpWl/ZttpdVosC0cTjCq0oVIH4XCwKUdHfxckbzHs9vFOoiim5hcn52Uiy4xqlWk1pvd9dK3Y1QUqKhXy1uMEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VbnpxGQx; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VbnpxGQx"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1d00daaaso12930536a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790934425; x=1791539225; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Jor1YYncnNOJsKXGkp3Jw5Ao4TyGjg+p1mv4bnb0LLE=;
        b=VbnpxGQxthomNStRl2vElqr5jg4AFNbM4vPvRJwzmZP4WCNtaehXRjRhf8VEeTSeYe
         Tvrttg4NPdDz5Yk2XpX/ZbPtQhrOCpbYjggpz2n+mykkQiB3pzANTNvfTYWJ9aIvIw3f
         SL9X0XyNXfdghWYro3lBAY1UCQrjJDcEs/E0/Pp+IjiNsGfN9owhIVI30pdDAr6EfnDI
         sNjN8ybbq1j+S4nvwbwJ+HWajfPqPTfJgk9FCiC5O6CIudcMSRvI8/aSie4qJOSk4Sbi
         1HPqHo/Laqr21lWCcBfhLwn5fvNesYBCQc5cdhGH41Z6kQAlTWDeA/vPFwVjJo/HGm20
         fmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934425; x=1791539225;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jor1YYncnNOJsKXGkp3Jw5Ao4TyGjg+p1mv4bnb0LLE=;
        b=QRhG581i1ZNe4L8I+y/WUq+Y58jIGIV2YNiRGGiC1ltBVgzUpzyXCGgTQKrH5iMxUc
         KkNUyWbw5FdiDhTV9LMLBifu3hy+N6qiMfK1BdpTorvD08mblcPBbg1Txmairo8ytqSO
         EEBOcXWUsY41z77XiYknFxEsrVt0yjbSaIYAvUXGD5jlQDmnqMkHQKz6fRQ2Pwxt7QXc
         iy06riw/ZYNOEfQAnEET4Vma+jFfDq+5QQWjmjcQYxggtpVhdGYoV/RgkH0Vaqi6GYU3
         YGLd8fsAUZjPrm9zBkrFS58V2qhlOFc1v2eRjv/MxtvlbR0hsYbnvdQBXJgqFfMc/i3s
         xxjw==
X-Forwarded-Encrypted: i=1; AKwUvBy0u9BHevHxf+USryHPl23VEAgw0dcWeMAZhG6RSlHygp7sY68iiKnDqpJRJNmxyzIQFF/4bzVjdXV+K1s=@vger.kernel.org
X-Gm-Message-State: AFuF++n3Row1TfUszNPPKx2os8Nzvv9NxAFpSinN0J5cn9ByjpyhD38e
	0FBsOHP0gWgNxuc6icJlscn1xKe5OeFdJ+IfP0hJXTaWxPKZs2q7ednp1ryH1qAUsts=
X-Gm-Gg: AYBFou0zTqVBWQkJ+wE89iUNfI5oaOOTi9qzdhLxFtV8mFelTJFTDHPBNefxuQcXzPI
	Qzo8QYt33YcYTXi2sRANWE1ojabCoVZHqkUZH+x/BJ/F1VhW3CVb5/VIwxQyy22aDfaZBlLhzaJ
	KhY02Lq9VUsbPiEsIsz6g5oX2kDvzyvCxL8vjYrF836SGz0fSrjnKHhdLWA+vIXZIfNCcwvDpGy
	6m3Q/Bw2QNKNHPWIF+i0zoY7ZYNVHmb3NBR+WakL0ooo7ZemOnA3ByRGNaA/mrsZWH17f4BQnsf
	QYNmr1/sPSrH9rlR2b4pt3BgwD57jMsNCnDmoiYD5H4oDGFucgooDuqNKdWJf3QsNSsms4gwf+h
	ZY+Va5cfB+fflWxWZC8JHeHCcgWGDMBImqH1oyQx9EpX3vQVYXPEPTWhXAxUfrlbLKeIJIL6/4q
	AhFOICp0mSabrlSHsfhmBxhtQzIXlTBMoXDR3SVju4lXCDR7Wqgwj0qFz0rlB2HzIpiDstFh9t+
	/0=
X-Received: by 2002:a17:907:96a0:b0:c26:3566:5b47 with SMTP id a640c23a62f3a-c2e4ad55c07mr164424466b.12.1790934425112;
        Fri, 02 Oct 2026 02:47:05 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf8f224sm69272866b.65.2026.10.02.02.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:47:04 -0700 (PDT)
Message-ID: <5618038736ad8674c35ef3ba1a34f98782b4d7fa.camel@linaro.org>
Subject: Re: [PATCH 1/3] usb: typec: tcpm: only call get_current_limit() for
 cc=Rp-def
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Badhri Jagan Sridharan <badhri@google.com>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, RD Babiera
	 <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Fri, 02 Oct 2026 10:48:49 +0100
In-Reply-To: <20261001-max77759-icl-typec-v1-1-99ada1f65ced@google.com>
References: <20261001-max77759-icl-typec-v1-0-99ada1f65ced@google.com>
	 <20261001-max77759-icl-typec-v1-1-99ada1f65ced@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Amit,

On Thu, 2026-10-01 at 22:51 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> tcpm_get_current_limit() folds the default label into the
> TYPEC_CC_RP_DEF case, so tcpc_dev::get_current_limit() is also called
> for CC states that do not advertise Rp, such as TYPEC_CC_OPEN,
> TYPEC_CC_RA and TYPEC_CC_RD. Its kerneldoc has always scoped it to
> cc=3DRp-def:
>=20
> =C2=A0 @get_current_limit:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Optional; called b=
y the tcpm core when configured as a snk
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and cc=3DRp-def. T=
his allows the tcpm to provide a fallback
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current-limit dete=
ction method for the cc=3DRp-def case.
>=20
> A chip driver has nothing to interpret in the other states. Therefore,
> split the cases and report 0 when CC is not an Rp.
>=20
> Assisted-by: LLM
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
> =C2=A0drivers/usb/typec/tcpm/tcpm.c | 7 +++----
> =C2=A01 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index 2d6b14aa20856..2e7371ada8642 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1268,7 +1268,7 @@ static int tcpm_set_vconn(struct tcpm_port *port, b=
ool enable)
> =C2=A0static u32 tcpm_get_current_limit(struct tcpm_port *port)
> =C2=A0{
> =C2=A0	enum typec_cc_status cc;
> -	u32 limit;
> +	u32 limit =3D 0;

Greedy init is usually not recommended, as it prevents the compiler from
warning about use of a variable without initialising a useful value.

Cheers,
Andre'

> =C2=A0
> =C2=A0	cc =3D port->polarity ? port->cc2 : port->cc1;
> =C2=A0	switch (cc) {
> @@ -1279,11 +1279,10 @@ static u32 tcpm_get_current_limit(struct tcpm_por=
t *port)
> =C2=A0		limit =3D 3000;
> =C2=A0		break;
> =C2=A0	case TYPEC_CC_RP_DEF:
> -	default:
> =C2=A0		if (port->tcpc->get_current_limit)
> =C2=A0			limit =3D port->tcpc->get_current_limit(port->tcpc);
> -		else
> -			limit =3D 0;
> +		break;
> +	default:
> =C2=A0		break;
> =C2=A0	}
> =C2=A0
