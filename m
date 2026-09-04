Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019693803D0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 20:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552236; cv=none; b=ReIJr14oXBQoxH5QWtWQ3/YDonUkZB7BBzfJUbF80iHsxP9uCzrx2fVzE/+itnCjhM5iHMt66Nwi8HK+gYFROrtAikd8pJJmgjUckD9aWZfXDhyEhvSZgQC6wGqPXsYT9NbGiVvY+/PriUq43dUZ70GGnr+WqovEbGnJdOb/Lvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552236; c=relaxed/simple;
	bh=B3mbXGgcUMU41mdHor14hlewxI1TjYBtrggKnKgV6iQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m60zhwPHlD4b27YnTs1UV2gIBy4G93jFvaSN8tVBfTkkTP+aQbeQ/fXMVOF6vP+s+jVKt6ZQAy6ctGtgDDAoERvpz3mlKl65iOCeul/fS4YTAGEvEMqKjhz53pcMGF/BX1Zn6kU45/65cQF1uwaApDlRA/RhsJuIHXkT0md/WR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IHCCFT4n; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aKZ4d1q6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IHCCFT4n";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aKZ4d1q6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788552232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=B3mbXGgcUMU41mdHor14hlewxI1TjYBtrggKnKgV6iQ=;
	b=IHCCFT4n+Kpn2fEJM4+Su/5yfBE5uIjVsW3xu4GsXeKi7n2V3MWj4gqhNC4f4D5ZBXasq2
	gumUGOIvxnrrr6h75Oa0EXJHKYYqvi9ykPlSdHsJ7uFzj/K3JTKcTtFNRaPu5VpyXmWl2c
	8CmVP3l0y+5qH00N1kPQgDN9RrrJk6w=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-eNnylW51MZ2d6WRQu3FnSQ-1; Fri, 04 Sep 2026 16:03:51 -0400
X-MC-Unique: eNnylW51MZ2d6WRQu3FnSQ-1
X-Mimecast-MFC-AGG-ID: eNnylW51MZ2d6WRQu3FnSQ_1788552231
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-836c8fc09cfso34084457b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 13:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788552230; x=1789157030; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B3mbXGgcUMU41mdHor14hlewxI1TjYBtrggKnKgV6iQ=;
        b=aKZ4d1q6+vxd7iG7wrLHuJwMe4cA1Kw3cHcOACOpo3Ag5WHK+1EkQFmsbMaXcvcxin
         SV2HyJ1815Sa/L0j3eZsq/UL28f2EhsfH5bQbXnjO84XNFh9hO+HoANFWsfrSMD4YyQW
         9VQ5eM5DioxcrXUw9YKjkk8YZHZ3jy9TSQHFrk/Yd0+wl29AQOAjt2Lt088cFzw0kOPI
         x7qxhx0WPzCNwUAFw8jU5Q1fCQ/prernf0QafE8YmbtF92Cz5bYjZch7ISZAi/O3T6SQ
         0SC9yv1Tnsh3WP4fdJWxTxYaVWdLWEhFN7WrG0qIK0FEj0nH7K13cg4XipACLSuIZXV/
         e1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788552230; x=1789157030;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3mbXGgcUMU41mdHor14hlewxI1TjYBtrggKnKgV6iQ=;
        b=PXsilxg9WGqXJySXbDyx94auOwodpc5Z5Aj3sVdgIrSk94bgEAotQgw7rsW0Byr80/
         4zqHvpIR+ZaHnRHT3xuZO19+Z1aTNEg7HgLTuJ31L8MWRCyKRdn/GFhcjT269g9/AqHU
         HeOR3aarC0ty3PradcbDrxLTN7kJpuP2rxFF2Yk3jzBQeAc9e9jKeWcADNZQ2Cla4h0w
         WRsrghhjq+XnoTU1+8zJWf9qKlLIyXFR3HT/ZapfTZ82c8/k/+3eu+CGysAOQd84SBa9
         a8NtPiYHTnXd9rPzEkt3Ppd1tNCflfFPljATY7OMW+fwYEhrMReLhjZ1byIq0zHanCzu
         f9Ag==
X-Forwarded-Encrypted: i=1; AKwUvBwBYU1XvoE9386gJsQ1R8VtJ3fzjcYkq12oomy59bGcahodIqgicuW3XG+8wcBrEccINrxnjkQPMShgkYw=@vger.kernel.org
X-Gm-Message-State: AFuF++kewZ1KPE5/uylI1ucoNQIglra/BVAONssIYsyzbhOVGGEhKzZ8
	X/MDQZvA9b6YDRCaN2wQsVp/GWQKckyajB7Yl2eo5KX5nrldRqzscRBqbj4gwqDWttePOvCcRMk
	RDPUtUgrZaK0jccZDcq7PHLr8ADSovj3/qpj+PpSJ97VU3/QuE/c+TthEuawpLKBfltj9D99Wsg
	==
X-Gm-Gg: AYBFou1/U4UoW2TDI5LeiJLIKv9cznpmtLyKedlHPA+lgyHzTPRtLjkwgSeRrb60v4X
	+X+2HCDHgW3gES8w0DQ9CdxbulQe0nvks82P1/eb+fiWLD4xzb5RwkHT7cEdbUJdRnPc7zsZeG+
	C5zt4i9lHd9iKlVenkDoOq6KuezuK4+z6zH2XqhVyfz/Ih9IYNQmImpX5tRX+BYej7A4ylIlBVw
	ia5RNPbzfwy0QDkstl4UMLi7dMLM6XOJIO0LnffqU/A1rwfkYGujfl0jUYcWWtC0vIk8rfFHXHn
	ZcFl8Esmrzlu1ROcO8xFT58/CoOKrY+VVoaxKEFAtJ71AjG3IqCDPF7/aCxx3zIbCHlTgumNiup
	WLtdkd9L58lKNk0BzGXxtwXBJOE/iLm///R3n3s5nH0nOzzCOjawh/Dfxs2cu0PQtlzhRuIGo+x
	XbGDo0y+v9qkqVTV3lctRSww==
X-Received: by 2002:a05:690e:43da:b0:66f:c1bc:4017 with SMTP id 956f58d0204a3-66fc1bc48f8mr902100d50.68.1788552230313;
        Fri, 04 Sep 2026 13:03:50 -0700 (PDT)
X-Received: by 2002:a05:690e:43da:b0:66f:c1bc:4017 with SMTP id 956f58d0204a3-66fc1bc48f8mr902075d50.68.1788552229718;
        Fri, 04 Sep 2026 13:03:49 -0700 (PDT)
Received: from chaithco-thinkpadp16vgen1.rmtusco.csb (184-96-189-144.hlrn.qwest.net. [184.96.189.144])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040647592sm28398006d6.13.2026.09.04.13.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 13:03:48 -0700 (PDT)
Message-ID: <667d8fa9bf7b0e129cc86c66966a221038d7bc86.camel@redhat.com>
Subject: Re: [PATCH] watchdog: Differentiate scenarios when watchdog is
 closed
From: "chaithco@redhat.com" <chaithco@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 04 Sep 2026 14:03:46 -0600
In-Reply-To: <1c15e728-cafc-43c3-87d8-981a2682d441@roeck-us.net>
References: <20260901214251.760184-1-chaithco@redhat.com>
	 <1c15e728-cafc-43c3-87d8-981a2682d441@roeck-us.net>
Autocrypt: addr=chaithco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEapCVehYJKwYBBAHaRw8BAQdAORXHCioh8sg4JScf3G8JrmX1nUt+teTWsqlbk67dr
 va0NkNoYXJsZXMgSGFpdGhjb2NrIChXb3JrIEdQRyBLZXkpIDxjaGFpdGhjb0ByZWRoYXQuY29tPo
 iTBBMWCgA7FiEEoln/+dhdP2hiiZGQ86/NNaAhFjYFAmqQlXoCGwMFCwkIBwICIgIGFQoJCAsCBBY
 CAwECHgcCF4AACgkQ86/NNaAhFjbm1gEA9t0Iaxr6IkGONOjD7eB10PjTYyDGVd4QdJYPohP8xRsA
 /0OETJIGSr5rxRqG23AGUdlnUfzFlgm3QuyfNpGHcv0C
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-WByAc/hJFcOuzza19si6"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-WByAc/hJFcOuzza19si6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-09-01 at 16:02 -0700, Guenter Roeck wrote:
>=20
> Applied, but please version your patches in the future.
>=20
Ah thank you so much for the feedback! I am a fair bit newer to
contributing upstream; I presumed (erroneously) adding the versioning
after --- was sufficient. I will make sure to add the version number to
the commit message in the future as well!

--=-WByAc/hJFcOuzza19si6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSiWf/52F0/aGKJkZDzr801oCEWNgUCapskIgAKCRDzr801oCEW
Nsx+AQD5YpCe/jGsd9liJwhzqeCLgrsPtjkX9wSLiUmJxrsYGwEAzljO0vv89nGP
eB8SPwY6hunIwWvi31fIccz/45cFrwc=
=ynrZ
-----END PGP SIGNATURE-----

--=-WByAc/hJFcOuzza19si6--

