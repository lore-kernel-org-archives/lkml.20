Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775961;
	b=w6ExXJLauOntY+YdlIpO09z2rwzseUheDEqKZN78H1Vuxot5flvgPWXw+8CaLpc+gXRr
	 H1nDHg57ea4yGg0J3oiJ0J58Z//7HuPAFDcYYwkQEsvXn6pN7f//oVUEpLe+WGmQbXZOC
	 P4Ot5n0xzlSpC5Rie6tOyRUppaQuEzq4HsHIh35n6YFHSbgRZG/wfBq3eiJuPVg/hRBz1
	 9dC5QBL6YmQc26KwNSs3PXFBg4da9JcsS0N67B5LcdR9kZdDj7JmQayQhx6ezDEaz3btc
	 bjX7AhW8fcGvP1iG/v1JSMI/zWfGyRHBq/pLc4tQjsEnzSCWLPEqxewnbrvQSRY3Ocw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775961;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=iCry58Hu1bv8DzSjqRIxh17FqFhYo6FkXUsOocnB8WA=;
	b=axDnBpnHsFyj7rTtdmI6Dl/XV1c6tkdh9iWXbfpImqtW71oMufHSqIYbE6hk4bkQ0LL8
	 22wxjwVtqEzMn2z/sAyqNIGWpWNsN5EyRcYiggIB3AZ775Ny9aMoy6RH2vxJgFTKabe+O
	 DynFAnsbHu6J48Pkdkvjk1hYybPSexHMiTOO4Ql8ZbtoE2mGy4Zg8w6tVX1O/mJbH5gVO
	 1FUhr19Xzpj7W2cDdAdW233T5MEY0mJDCkEenoFQTIxGS4rsPja1CYoK7BHL1Laq+9ecA
	 rE+Oxj9GhKQ8Ai73f62yUXdAuycL+QBRz+v5NfulxWi+/PW59/o31WrnggwSZEo7EoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fN1qfjeW;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ha3nzJxw;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A58606CA03
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A58606CA03
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fN1qfjeW;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ha3nzJxw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792775960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iCry58Hu1bv8DzSjqRIxh17FqFhYo6FkXUsOocnB8WA=;
	b=fN1qfjeWnhTZkg+IDCFpXMPmhguEJTFWcpv0Y8DAATYDYzV+pB9Y9EpjP303dVRNpXpYrY
	Bcnw82fRJoGGd3SgqT8P9m8dptaKjuWckt7Xei57GQxZCf1aQI/BO7R8JXVM7CD4j5kiJK
	u1IreD0nzttcTGgi7rkr6GLRLGxlGpE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-HIZ9dBHrODGePn4rQXi_OA-1; Fri, 23 Oct 2026 13:19:12 -0400
X-MC-Unique: HIZ9dBHrODGePn4rQXi_OA-1
X-Mimecast-MFC-AGG-ID: HIZ9dBHrODGePn4rQXi_OA_1792775952
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so210253985a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792775952; x=1793380752; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iCry58Hu1bv8DzSjqRIxh17FqFhYo6FkXUsOocnB8WA=;
        b=ha3nzJxwQoH3CSlaqkntmB6SRBjFRfpGenUDoIayMG/A6KjUC3Ab0TxWPZfmgSmrrL
         odibZVu76nVGryIsuft4BagzaQQo/IZavUKiYKqQBwL1e8cRQo1feeD9hSJmFO2Azj9p
         vShzt76BoJ67xkTAnUPEvy6uae5BxOpLXy9rbj0qZ9PQIazb8M+BBFvTb0QhgzNJGvkY
         1txuKIz+IXvfqUymftpqdwHQ4/+T20QgFLx0G86wi7xTCVCS8Hgletuwkkt1+k8FLixB
         0HvScooDtnZAWfvhRaeihqTyG/eoH/icMkDhR1IBtVhEgcTcoY8Vr1WBZjy2I74ti95R
         NmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775952; x=1793380752;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCry58Hu1bv8DzSjqRIxh17FqFhYo6FkXUsOocnB8WA=;
        b=iP/NrzQnQMIT96icKzt6z4mxba7hhKiU7aBENlFviscGkKbkGL7+tHCaGaWSyPvNsU
         /hB5GhRY3mWR5vQtTGWjrEfOXcc//AtJfu8sVjZ3UFmJRUYSVbLOlilY7gwt6kaxGDLb
         AQ4goHlxz/rSXSqmNsFw/zvbMhySde7Vy/kgRhcFCls+tR/lA+qcX7ZKV5qszSMPFE5I
         FnEAeCzatgIyYsw5xQz6QcNAF/qt78YSz8ExoXVDRhm0y+uI9HTaAMvI4/ft6sl6IL2O
         t3w9Uz6MsemcrC7QyeglwACEXopFYhTzUcP9eUKGBq8+o9pmARQp27z6oP0y0Y2kRb9T
         tVPg==
X-Forwarded-Encrypted: i=1; AKwUvBz8n8syYT3kMiGJ1Vireeyj5BlY1Y0LaJdkbhINaQDpMScYXhSgJBwoBekA5yPbHrWIX6u5g27x9l3RZls=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWgloDK7fx3yxTWGsfK9oteXpix7poSfXKQI6PCAzaxsbxrWa0
	TAgd0yzTzWckC0qeZl1d2JGk+esktKH1QSuwzrv/d1NEbyFqgqZfOmgjLvv9BPmPbu/SJZp/Q8L
	rCNUJ6z9EcTKtvy1W6DyOznR1CB9qyKf8qBIlCORE6aj1oeGMVCjMAy8haXaIG/Fgkg==
X-Gm-Gg: AYBFou05+0S0CF+HxQ58qMA9FSyWs6VkQ/rO7bRiVAADWh/dskUGDd1EEsHUltKERrf
	R4sRuq05W/MaRkLVV7nxvjF/giAGFAfrwSKHGoBzZl7BEceaxig3IKkzHI6+2xjMwIRA2HjIBFi
	xHdhM28ATYYAjc02kBB5ttJRpwzjikTZnqnHNFq0vT9/bjaYrZIxC0/IpGIisbAxmttPp1ySSvs
	FO2nC50oDUxIzjqsXUOoWtMXKtD15l7z3sXolKKgMjb7s2CKHt3rNSGoZbc2Z3k4N2fguO+C8uX
	sdfGuGS599rvnj+V+2UXC5y+rPwqXcGQVSFKoqbjqWiZgry88bSiPOc7KleUW7Q8bgKwJg8=
X-Received: by 2002:a05:620a:1a05:b0:93f:2b23:4820 with SMTP id af79cd13be357-93f6f7bd38emr559077285a.48.1792775951985;
        Fri, 23 Oct 2026 10:19:11 -0700 (PDT)
X-Received: by 2002:a05:620a:1a05:b0:93f:2b23:4820 with SMTP id af79cd13be357-93f6f7bd38emr559072085a.48.1792775951481;
        Fri, 23 Oct 2026 10:19:11 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9404722f226sm70474385a.9.2026.10.23.10.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:19:10 -0700 (PDT)
Message-ID: <939ee9cdaa3a561f5910fde2e4efacc8c92fd39b.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Clear fence channel in no-signaling path
From: lyude@redhat.com
To: =?UTF-8?Q?=EA=B9=80=EB=B2=94=EC=84=9D?= <dilddream31@gmail.com>, 
	nouveau@lists.freedesktop.org
Cc: dakr@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Fri, 23 Oct 2026 13:19:10 -0400
In-Reply-To: <CAGC3ukSVk=N4ttd3hwnXXXppHchwroJmySPAFP65Vt+uP0COOw@mail.gmail.com>
References: <20260928081450.19340-1-dilddream31@gmail.com>
	 <CAGC3ukQ7gX97E7pG0Oy8H0cnmQzoA1038io+VhrBogPB3y9dDQ@mail.gmail.com>
	 <CAGC3ukSVk=N4ttd3hwnXXXppHchwroJmySPAFP65Vt+uP0COOw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-10-15 at 19:40 +0900, =EA=B9=80=EB=B2=94=EC=84=9D wrote:
> Gentle Ping.
>=20
> There has been some related discussion here:
> https://lore.kernel.org/r/1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordeaux=
.fr
>=20
> The patch has also been independently tested, with no reproduction of
> the issue reported so far.
>=20
> Apologies if you received this twice. My previous message was
> rejected
> by the mailing list due to HTML formatting.


It's no problem, I'm going to try to get back to reviewing stuff asap -
currently I'm in the middle of moving however so I've got to focus on
higher priority stuff at work at the moment. So it might take me 2 or 3
weeks before I can start reviewing stuff again
>=20
>=20
> Thanks.
>=20
>=20
> 2026=EB=85=84 10=EC=9B=94 15=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 6:10=
, =EA=B9=80=EB=B2=94=EC=84=9D <dilddream31@gmail.com>=EB=8B=98=EC=9D=B4 =EC=
=9E=91=EC=84=B1:
> >=20
> > Gentle Ping.
> >=20
> > There has been some related discussion here:
> > https://lore.kernel.org/r/1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordea=
ux.fr
> >=20
> > The patch has also been independently tested, with no reproduction
> > of the issue reported so far.
> >=20
> >=20
> > Thanks.

