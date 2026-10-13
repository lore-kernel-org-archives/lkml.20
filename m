Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2B130ACE6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791869961; cv=none; b=VcB2oxcSjsGVEOlj885NR2UBwwGl3F+uw8MFscTPov0O+dwOXXFV7SlA3zeZvXqtdRBAE9A3FO5p6h7FNaQ54nhzRCXu4YU8+bwLWN5TQKt4HfH0ltfwkyhQUthOEMfTyP5RF4juYqwwPnVcHI0k7bmKbxALsCiDIZa+p61bg2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791869961; c=relaxed/simple;
	bh=d8oz8IfjHSSPFz6zRAoFmMxFVc/XqgQmfirLnRNRlSI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d3F9jNhuBoaEe1TZ33+BDkMFGMolMlKubf5jZqeWdzevBCpPRjpaYEHsQzzwlP3UatA00rqLpSzB92Ykh2fNpve84DoLJtcd8hw5gOJJ5S6m/hpsz02GRFfqUeDBkhLjFbvQBmFIKJGkxQ6TOn+Qnqk3CArQv+N/RiFDFxc4m20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=dXDI1z/S; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="dXDI1z/S"
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8B5EE3F28A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1791869952;
	bh=d8oz8IfjHSSPFz6zRAoFmMxFVc/XqgQmfirLnRNRlSI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=dXDI1z/S0wu4AqrVPNcnQGokPvsSvhW2vbeejcazLdYYMAQ6KAH1DgvCGa4T2/HvF
	 FyWHWgI+CA4n2IYv+gfVKSZSslBEQMOcXHgavQG8L0PnI+R0Wvz97WSOVOxGV2aNtW
	 bxbWPv0KmR/pB0P0YD5a/9jfXUg5w0ygXOF4VpD3OfwzasJsOzo9kg0KEp+wCD0Kpc
	 FuxNkDjcwItRsglzs0yG0ElLQz3JwitvAtiJD/+/HHaqrbmLeZQOGfRHsyg37uT1Um
	 Priou/RWPpWkyoFWhiByzQPobZeeoLnqgne6ZtG0XYPTR5XNH72yIcaOcfr5H1vyDK
	 hZIIBbk1EYmzH5GGZj3yb9n31pJp/4aT760cAKE2vQBLzr3XhlmxJ3jt1HW42yWGwj
	 ZBmtdfXxGbjLcskoyvEZfqdMwPUFX07r+Yz82/Duhn9HGGQEer/ViCQRKkcFD33PNO
	 GQokA5+kuyM0xxD/hNSp+X7BaU+kPGH9rzzs+ms1pzcofW2Ark6yNl1ajgxuv901s3
	 x8HeUjrojfcu8wrpc2xQiiDXTO6mfzKovGFNSHot1lt0kjtEqSrzN6+UbH3SN8XWyw
	 b5idl06egy+VNKK+9mRsBvPc323a4MyHEH8xTvu4ejSasVi/WV5Uz6E9xFSil1jRbX
	 nFyvWaIa1q5YAlnODWYQd/64=
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c50ed05abso2325276f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869952; x=1792474752;
        h=content-type:mime-version:organization:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8oz8IfjHSSPFz6zRAoFmMxFVc/XqgQmfirLnRNRlSI=;
        b=Qy/X1qP0GrZOwGdOBJTgoPmOK6hbH6UIGB8JGbbFBlv55RjqEQDejNKiTwXvDcBApU
         lJy7D4RrZa/L3FGLUF769UbB9D7nNofF/6XfA1gKRTTA75DSLfTzNOolZcq+3ACjpWkV
         Co0A0Ad/2qIQSwxo5kvBwlYqoJWGfVYVTN26rDoM+cJGWku2u6dhqLXk4fwiArwtOVaL
         uAjMsBuuDky9nHVTdBmfmSU8at0JGsYwvIk7rWhLB8iQ38CcMVD0aITbhyUSY3k7cJkb
         2r2RMmzjQKjjVXvnqjU4XtcSG8DpHouKIoCvdBbq9TtdKnnc+jwI3n2OnpzCSzRcMeek
         8HYw==
X-Forwarded-Encrypted: i=1; AKwUvBxrKMj0cNOGWNM2hlxz6C+xVPGugVWizz4TdJluHbmSKFVW66w8fMGKSPiUtNsHNBw4cyiJSPimB7cn/og=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+XVhM9R9SSgGoQ0rBmB36iE4IFbdaFNiOud+gpgiDD61gbjZ0
	L98F3lxdp4UvB3gVnFJUpBAfJKURisZUmisRiDRK2C2WSjUmcZnvhi6sMoUbcf2KR9yDDPvI+Oy
	qRphpGHRHbg/trOdyFuCH0xEfKHey2/2RLuewqyTWKq+ouztvd/rkhDUQVlqIBtPIa9nbiIt85c
	w9mntB8ySb08sjOw==
X-Gm-Gg: AYBFou3xx86JuYp0eywQWlH6XNgi836Q9khtRjKtBwWejnRHg9zqLHeWFG2McBpG5jA
	UPNTFm/7jtl+KrALvFWrEY7wcjgns+FTtHOOYF3wUp6gmtUmBy5j31B+Adetqpb+Bi09B9VSs6i
	DWiQx7rr2jG4QVQaqlxcS/lBkXgdj6wjbujBpVhZgWqts4eTzJqzRQuySTx14YLegp4ie+NGHpR
	kUoBIT+PmU05wPN6tNgIHzaI3RNGmXnehFqvkYk5Ro5K/fDMtonYPykDLaW5zn6WaJZVU0jysSd
	PdOZ0Of+dujiuIEZnHOzLvm0/RwmN1cZO4p6wIOC1zrwLLUszy89w+Hy3CKxC8kNGk5Jfsm5Jdi
	s/8chpEdnwIPLZVTwp5cPHglD/uSqMMPTPed9MQs6gOuABmguU8Ix
X-Received: by 2002:a05:6000:288c:b0:487:73c:3f9 with SMTP id ffacd0b85a97d-48dbaae3908mr17887119f8f.22.1791869951962;
        Mon, 12 Oct 2026 22:39:11 -0700 (PDT)
X-Received: by 2002:a05:6000:288c:b0:487:73c:3f9 with SMTP id ffacd0b85a97d-48dbaae3908mr17887087f8f.22.1791869951510;
        Mon, 12 Oct 2026 22:39:11 -0700 (PDT)
Received: from smeagol.fritz.box ([81.221.225.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm2977480f8f.36.2026.10.12.22.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:39:10 -0700 (PDT)
Date: Tue, 13 Oct 2026 07:38:56 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hp-elitebook-ultra-g1q: Drop
 omnibook-x14.dts include
Message-ID: <20261013073856.40fc2cec@smeagol.fritz.box>
In-Reply-To: <3hc574blvlfxelyvrki27dc3pjabf36vc3jh7muiisz7cjuvbd@qv5cjqvao6he>
References: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-0-9702f7c6f9a0@canonical.com>
	<20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-2-9702f7c6f9a0@canonical.com>
	<3hc574blvlfxelyvrki27dc3pjabf36vc3jh7muiisz7cjuvbd@qv5cjqvao6he>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b42gS_4XJSJ/_VJQENvUI3y";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/b42gS_4XJSJ/_VJQENvUI3y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Oct 2026 22:11:56 +0300
Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:

> On 26-10-08 20:34:46, Juerg Haefliger via B4 Relay wrote:
> > From: Juerg Haefliger <juerg.haefliger@canonical.com>
> >=20
> > The EliteBook Ultra G1q is a different product from the OmniBook X14 th=
at
> > happens to reuse the same mainboard, not a variant of it. As such, it
> > should not be a child of x1e80100-hp-omnibook-x14 but rather a sibling.
> > Include the shared base platform dtsi to match the other OmniBook X14s.
> >=20
> > Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com> =20
>=20
> You are also enabling the some remoteprocs, so please mention that in
> the commit message.

Done, v2 is on the list.

> With that fixed:
>=20
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Thanks for the review!

...Juerg

--Sig_/b42gS_4XJSJ/_VJQENvUI3y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmrNw/AACgkQD9OLCQum
Qrd9PQ/7BXmdRIOviHrj93ggZaLcFp1mBuCNCM20n21ieNbBOxsGpDgBvApeONYf
huyp/oFfZ+xgQzludVksZREOEq7CexdstRC+/OWK7gL/mv4djo5GNDQA3RTq/CX6
RdJIujt9sPbzPDe4PVenoKDEdSTMrvrsK9ET2S/Hd5lioV5adzZruoxbNybac/ms
g1iU6yTqi3zZihE1CqdDL0JNtMtJTu1gawnqFEUtd/zg6QQIX8A5bLzdWubWugXv
NF1zGvv0tgDedAbd1UIAftsig0UOTMOeHzU+CKgfT6s6bPXi55F/V2P5hcVGkEt8
FU2KSj+ZuKY1L8D+sLIqfQ8g9rgHOp23kdW9UBQJ3oxCwuKidtY6+lrp958zq+6a
zL6ujyRJd4tkcA2pgAmY4/QKe75sVVkkvSev96RdR4TFBPdJqfSN4JE6jDv1txYf
AeM9q1KQlSxi307dO5uvPXGIasTbp8Qe5YGd6CvdvGhzCLu0Ronjv4E1oRpj7ENy
lMcyPxdYcdMuTpGFBQlrWGYM9YcDZbj56p7Go2KqAn7+zw93vsKAuDVpvoy1E8gw
JO1hR5oYvJTzCvP7b8/3pMFq8sQ3uCNH+H0yJrmJKBhzaYfxblP1PINgipH6C9/Y
K6Rs5tR1Lddrbz4rVm01vO09QoZ8lJkyvAYmrZ6u8AcN09gSm98=
=AR0I
-----END PGP SIGNATURE-----

--Sig_/b42gS_4XJSJ/_VJQENvUI3y--
