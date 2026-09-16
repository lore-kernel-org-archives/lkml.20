Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D1143E9F4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543258; cv=none; b=mR8S0nfMy0PhiYS5/vyo1HDYH72BJ7FBZjmQdjixJOzgDmZu76SJ1lbVEQDSx3yYWO+K51XvbPCQT01E/H+gY5n8StftIIL+z16NfKte228lN2CsvZNVdN1ZIeoIOlYQmN4BRGcqiDNAWaKl68JcV6qiU5aoFJcW0h++5CI/oaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543258; c=relaxed/simple;
	bh=eD+nxRY1CwIOH39+maW8jESaVEmI0XcBor2jO0WtG+M=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=RyLfuRf7+s2FCxSLEyYSYOy8KIPx8xPqP2Bu1T7VWuZGtxKs3T4A26f/fPjrFh7f7+jsuVmBYpVEg+RxjyTm+n6ZktbJH1tysUl3IeG4BULIxtt2FV7EU5z7k0KNb0j7E6tzNrFkq+XIwsQoLTVKSXntqLGWiIkSGJWOXIPFLfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=X7Y3BoXa; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="X7Y3BoXa"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a985fba28bso815350a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1789543238; x=1790148038; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nWJSFNcW4hlXNASCl6/vvabpgGkrwyVE57+WcgHtvAI=;
        b=X7Y3BoXaV0Q+1CBFOsjowevCBIMGXJq9bDE8uh8A8owKTnYEeulyBGszKqed1qlHS9
         MK59LwpuDAZxX7LS6Y1xVPf/2Wo1Zzt6y4XexPmIg076y8oyJQdJtFebp/POIItd0E9r
         2jsf64QegznmGXD7n+/aPakQnOvmyodB5w0B9zPAkPEnG8ebFSPK7/xfDNJwtWZmsF/h
         dysSSP0JDgxgx3h5ZFq/rTyAXwQ0RnRpClisnm10NRHQ+RGVWTgvVeSHPEf7RrlCKbKM
         lBS0OCL/jvX5oercNe9x6uIzoYMvY4aDnnrDb79HeHbxw9Rk4t3kyv7jEZpC0LyUqGQS
         xI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789543238; x=1790148038;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWJSFNcW4hlXNASCl6/vvabpgGkrwyVE57+WcgHtvAI=;
        b=adNVMu2GOR1yyCDNWve04ok7nKJfn3hwtRUe0fBSFwEQkXAUIpergAYP/YFgEz4zT7
         ZPp8txm3QoczmNIHCq5nmsQcCRxgSMDP/UawdSDfmdWKfR2WaWbe/hHt5PxUm9rjzgDD
         PQsVbxZihOZhU+1FBvQTq3+vEzCXuwgYgzEshsEjNJek4NfHO1YCKkTg/gsrWSytqKyc
         6boZ865BH9MeIqLlOXQnDELtyKfe3Z1PDCR0qfZ+sbWQwwGRF+i8PtEUAClNRAcovDjQ
         r1gpsr2W+QTaCESbJXcMqjT46FqT3lrVmIZ77yPhx6GZmMorXIeiztRzu9iv9KdgVaoc
         MKNA==
X-Forwarded-Encrypted: i=1; AKwUvBywyw3FC2kgfNwkZpCNoKlrQxN786G2wJjCFeIYoEUKFT+TNcdod2t4utf9FsHzNPYbtI9jhi7HllsV70w=@vger.kernel.org
X-Gm-Message-State: AFuF++krT5Pz3iH47u+7EijeYIYj6yomtJksN+tY3UTccd3sS9QEAFxV
	TplhmS8oBUOaOKIXjixJ1pBq2L3GW0H9+hVfJVGCa6JoQ5bEivXbmhi6TspPGfBtca8=
X-Gm-Gg: AYBFou2Tmfz27wsmWDFJGOuwf7SJoMxuOQ9FpQ3r9Hia+YjKERfJ2BPow680lBpmI2K
	zuV/YRGnyabVN1oGy/gn67TvMELa4YQQUTQfMpoVDDHtixQ2T6/504ubZqoX6eW/NSHsby3FCBx
	B2/X3+qPIUo73lyCudueomY0STtzGDuzHBfihf7FllQkpq00C/INexe6yenWNihBfRAMIdRIM/r
	dspRpQROmj1LZ+ltYIkOp6fhTJXxIY2GpgLDVLqzwHsEyMjZhmkSgF4kcLGiN7yjn3lTNwtx2bI
	nUfVgMKNAi+7HnjkYt+8Ues6sbisY7NdpWY1DxDEFXb+cXyfqTYWXM1CKLqmV6llmfuQJBfwJlE
	Wc9I4lcbancCklO4oAw4kP9wnLyP466u99YOWo0FgAEjA+ZBX4wdQog4KY1d/dwgtNY3FltHqWi
	vlknX6IS5zMrh0wfD0VUFRIxJeHE9FlojDEVb8UQxIUKruJ0ExC+LCYA2Gzyh2SPf5VLpDodzIH
	e1cuVamDCli7obm9f0QPyNe7uKXILRgIO7QdqicJ24VCrKXX8vJcb4C/nVPzcgBoYSr
X-Received: by 2002:a05:6402:428b:b0:6aa:e95:9bee with SMTP id 4fb4d7f45d1cf-6aa2245919bmr897766a12.31.1789543238126;
        Wed, 16 Sep 2026 00:20:38 -0700 (PDT)
Received: from smtpclient.apple (83.10.8.214.ipv4.supernova.orange.pl. [83.10.8.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d2406d6sm932760a12.12.2026.09.16.00.20.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 00:20:36 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH net] openvswitch: reject a negative transport length in
 the IPv6 L4 checksum update
From: Norbert Szetei <norbert@doyensec.com>
In-Reply-To: <CANn89iJbs9n=kmt1putx=izvr3w17U4g6RDoDzdh4NWz+7uRaw@mail.gmail.com>
Date: Wed, 16 Sep 2026 09:20:24 +0200
Cc: Ilya Maximets <i.maximets@ovn.org>,
 netdev@vger.kernel.org,
 Aaron Conole <aconole@redhat.com>,
 Eelco Chaudron <echaudro@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 dev@openvswitch.org,
 linux-kernel@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F6067C60-18DB-4E6C-AA80-B6F68006234E@doyensec.com>
References: <114FAFBD-F7BC-46AE-AF9F-0D15124F130E@doyensec.com>
 <de0fd2e5-8509-406c-9f92-cb644c42229d@ovn.org>
 <CANn89iJbs9n=kmt1putx=izvr3w17U4g6RDoDzdh4NWz+7uRaw@mail.gmail.com>
To: Eric Dumazet <edumazet@google.com>
X-Mailer: Apple Mail (2.3864.700.51.1.1)

On Sep 15, 2026, at 23:40, Eric Dumazet <edumazet@google.com> wrote:
>=20
> On Tue, Sep 15, 2026 at 2:13=E2=80=AFPM Ilya Maximets =
<i.maximets@ovn.org> wrote:
>>=20
>>=20
>> Hi, Norbert.
>>=20
>> This looks like something that needs to be fixed in the =
ipv6_find_hdr().
>> IMO, this function should not return an offset that doesn't exist in =
the
>> packet, i.e. we should not be able to find what's not in there.
>>=20
>> CC: David and Ido.
>>=20
>> In general, we should be able to trust the skb_transport_offset(),
>> otherwise there could be other issues all over the place, not only in
>> openvswitch.
>=20
> Totally agree.
> We keep receiving defensive code instead of finding and fixing the
> root causes :/
>=20
> Fix ipv6_find_hdr() in net/ipv6/exthdrs_core.c
>=20
> if (skb->len - start < hdrlen)
>    return -EBADMSG;

Thanks Ilya & Eric, and sorry for the defensive fix. I suspected
ipv6_find_hdr() was the real problem, but I could only reproduce it=20
through openvswitch here, so fixing the caller I had evidence for=20
seemed like the smaller change. I'll send a v2 for ipv6_find_hdr()=20
later.

N.=
