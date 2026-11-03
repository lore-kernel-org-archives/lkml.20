Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744079;
	b=RP3F5ELbOjAiRWAWnVSGXmejJYbDILZ3yOqqcVt04MSdVK0NK86MmL67QVQK6Yw4fXIc
	 oK7UAn5cdul19iWsgaQcZPNmlP63DJ5iuPAW5hlDzk4TGvpDgRsgN5SUE04EY0IJBndiR
	 2tMA7g6+wUqPdOtfiDvI1W2CJYgkQQafLInJoEgxJbPlWObJHxSL/FHx96iWGeI1M5D9F
	 k+mASWXE0EsLLnHDLsOlGhVQDQLMLYxAqD8V1VXlQ9KV7+VneJTdJS4fszzMVCYldHJDc
	 z8hf3hl8wTibPWxiK7/wAVBJPGHdEV7XVQcovZmzkkAX7x9be8T0GoX1lGjsDGyZ3eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=0whMpu3SwCyyOwYZZQpnCeH3x7hbfijj32FSntRg5eg=;
	b=hqeCPpEwk2mzCtMkqWTcI7tCh/SjAishUBa7x/5aWF54Vgx1G/KK5mYfnQJ28N1kQQMN
	 TFXxTWzhWhYfAE7B1qSIdkzmlCxnPeHggidU5COgH1dXl4Sgy+RlgqG9kKW10XZyoJpMF
	 g65cNUC4Ym13YchtgWvo4/JfIm/ImbGfojvXDip68PZdShOElOXPZXgzzkdIxHSVDB6jC
	 nfxXBDIoIAHPf7XhFg94EGvD5uvnzt4N9XqZ28ntSSjJmeui9uqGn8zz6ksL3pdO8t+dV
	 85B4i6+DdH0CE0U5CLjDwV2tBk1KmYb20ryXgYmfXAby189STMo4YYnYvVp3PWqkXRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=S+wRv2wK;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE419606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE419606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=S+wRv2wK
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5430f70c827so60851cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793744077; x=1794348877; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0whMpu3SwCyyOwYZZQpnCeH3x7hbfijj32FSntRg5eg=;
        b=S+wRv2wK1q+ylMssFA8QEQJbCrILnVnOTvEbUvFi2wtCpN2XJC/RHGpvN6sCyZjVMl
         gcojuE3280oN1+PAwH+r10TvObtAUJhCxnHEarRySD29DR1V/P06L98L7at8YnclsVQd
         UbDY8pG7lEXqe5/rb9EADlFAzzW1qe2F/EXr6AQDjGUS01HfEKW3TFpVHaNyjAGzPJ9r
         5BCzQf0BrggGkIQ4hWOOKKJlW3oJ5k5FYg9xPKmwP0ohO7Wj1oMZVE7eugD6AVsNQZ3W
         w1WVO0hYf1RNuiSzYTdiYB2/IRjqSsjHrQQNMMU33RRrJEmNPQEI0/P6Q1w1SDBPiXrw
         Eukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744077; x=1794348877;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0whMpu3SwCyyOwYZZQpnCeH3x7hbfijj32FSntRg5eg=;
        b=Av5DV2zwJczt9n/VOiStyjLJL21oEK5soNxok5elraUCYvK9q16Ss280NOy8RKLpau
         gUHiVS78DedZdk7qqEweCVEk9kMtZykqiuvBNzI2gq+KkmMF7q11n9KQWAb8vVmzfmb2
         vcRD2bxE1G+v6cidHG9gW0aVpXF6ogJKIgsRldaF3A3DqrmXh7i7FipsEIxJczdmpLgw
         ynxncZjcv4+IF4inFX0OGHEeKGuMcqHP7Rq0VK1FMCdnY5cLzW6yj/oqg5gm+jOLF/so
         L9Y97WebLuiL/SVqZ4rBD0P7zqgrrz5uzHe09fsw3w3c2Wa2G/oLTKLL1mOrQoc8mKyD
         AriA==
X-Forwarded-Encrypted: i=1; AKwUvBzhajmn3ZyF1YhGxtHhvISF3jTTNCOP5DXs+EiAq8cqOT/RyadXr3ex7a182AZ0moSRgL/a8oFH/vWsFnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T5sDnJ977FPQycXhzMCqApNMS3YZQdnl8Ib5pywGfnoNAroUX
	GOOA74tY9Ifspt3iF93cHR+sJ53dYHmXb+CS+Ay+7MJfcKnASmMoELldBKvyWhCj9cY=
X-Gm-Gg: AYBFou3W2EJlMvRuP2RmOhUNEOOLYGb+IXONRQct3olluNJVwwlt25y5g5M9ivIuHs5
	VFOLIQyNTGdL7YNjwA/GETw9cJQds365L5oTC9rpoadHfZLaHlDksiQfP70X48ZiG6rPQ9v0Lm5
	ipFjbzxdB6s9KkYGTAZlBWtBXL93libuPH7SOyN6oQXl06IMhWeNXGXwviMOktIG8pXviqsbfH6
	I/X89gcYgvhJwj0gZ4WDR7fzgU/nQAq3Pe9VG6zwjx+EaQQY9W32TShIqlFss2NRm6rRBcoEQt0
	aq+Adce1yFbh9mJsBmMleJDWw5MbMkxCD3YzZ9sjdaolcuoE8pw01jiTo7Nw7U6HkaO+iPqYjgU
	y5kdPAb7G3mph+nY54scQnugtS5n/gUwtX0D0E0he15Fg//W4Kv5zc8C/ORQ0BpQ/II358/b5Aq
	jpYeWxZu3BzGpKAX0iMhYGjuOjhR3JjFng7PSwrsotBcm+dM4MR8gLYpYjTItG1JfQ7ZSuaWGJI
	vIcvqyZ/3s8w5JCKr3bixbb5dQZ8oc+TTLQbUBA06gGpO6WZSk0QjfdHq34vlh3/lCaeCnuzY+9
	gbTjIaMJbhbg4qEUkmnjoQoRU/DnjEKCCI/m90LnybLFOVQPlutl49nbmgQAAZXu41bv+iOhMcc
	u
X-Received: by 2002:a05:622a:58f:b0:532:b3ce:f38 with SMTP id d75a77b69052e-542b3e691femr241721551cf.4.1793744076882;
        Tue, 03 Nov 2026 14:14:36 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:bf53::5ac? ([2606:6d00:11:bf53::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b1086db63sm7077331cf.11.2026.11.03.14.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:14:36 -0800 (PST)
Message-ID: <3d6f4b59b49112b4c93fed08f7a85601458dc9b7.camel@ndufresne.ca>
Subject: Re: [PATCH 4/5] media: iris: Preserve timestamps on error buffers
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Xilin Wu
 <sophon@radxa.com>,  Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,  Abhinav Kumar
 <abhinav.kumar@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans
 Verkuil	 <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dragon@radxa.com, Chris Obbard	
 <chris.obbard@oss.qualcomm.com>, Deepak Sikri <sikrid@qti.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Loic Minier
 <loic.minier@oss.qualcomm.com>, Jason Pettit	
 <jason.pettit@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:14:33 -0500
In-Reply-To: <fcdc09bb-7f70-443c-942c-81f50a695aee@linaro.org>
References: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
	 <9YPKYT3Qcls0jbUWdxOqIWNLjQSGexDoWWE3PUBiJS3UpxTN9rFeicV5aeaeTDyrXqw8emy9LBK0hkxmeEqthw==@protonmail.internalid>
	 <20261029-iris-va-fixes-v1-4-44a2783f782b@radxa.com>
	 <fcdc09bb-7f70-443c-942c-81f50a695aee@linaro.org>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-WL5Tl81B56C34oK9WNj2"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-WL5Tl81B56C34oK9WNj2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 03 novembre 2026 =C3=A0 22:57 +0100, Bryan O'Donoghue a =C3=A9crit=
=C2=A0:
> On 29/10/2026 04:58, Xilin Wu wrote:
> > Clearing timestamps on error buffers prevents clients such as libva-v4l=
2
> > from identifying the failed picture and can cause synchronization timeo=
uts.
> >=20
> > Preserve the firmware-provided timestamp when returning an error buffer=
.
> >=20
> > Fixes: b791dcfcba3a ("media: iris: Add handling for corrupt and drop fr=
ames")
> > Signed-off-by: Xilin Wu <sophon@radxa.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_buffer.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/m=
edia/platform/qcom/iris/iris_buffer.c
> > index eb8de60c1177..f790483d13d4 100644
> > --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> > +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> > @@ -899,7 +899,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, st=
ruct iris_buffer *buf)
> >   	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
> >   		state =3D VB2_BUF_STATE_ERROR;
> >   		vb2_set_plane_payload(vb2, 0, 0);
> > -		vb2->timestamp =3D 0;
> > +		/* Allow userspace to associate the error with the input frame. */
> > +		vb2->timestamp =3D buf->timestamp;
> >   		v4l2_m2m_buf_done(vbuf, state);
> >   		return 0;
> >   	}
> >=20
> > --
> > 2.56.0
> >=20
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

I'm generally ok with the change, not that I think libva-v4l2 is a good ide=
a,
but we should not intentionally make userspace life difficult. Userspace sh=
ould
not though assume that every OUTPUT buffer in error will generate an CAPTUR=
E
buffer with error and copied timestamp, this would be completely off spec.

Nicolas

--=-WL5Tl81B56C34oK9WNj2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaupcyQAKCRDZQZRRKWBy
9Ka1AP0R8nbzNuhXJb3kDXY4TjuPqdCINWuaAR03XI+T3+Rj4wEA8JM/izovKNbb
aWez0IzFR/4tzcgFC0vw+v6Xqr69dgA=
=gql0
-----END PGP SIGNATURE-----

--=-WL5Tl81B56C34oK9WNj2--
