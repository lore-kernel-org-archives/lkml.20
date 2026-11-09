Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227455;
	b=yaYq2yd9rtL0ElInTZw6BoctFEks4F5q6lEqSm7+IRBzWUzJjltva5IKMerknPcFkTI9
	 RgeDNBhooj1cm6dNhJ9sODxMsRr4g21Kd4qx34bZ+QF4iSUKy4MvbO6502dDIg+ik+0sc
	 mSOv+9rargjtm3u8SEOCZg1ATbsSMavEJsogYdOAwuxT52s+vT00D1bhMOft8tPbxatoQ
	 khigOKBnzuRUWcWzhTt3XbfSa4Ujdog3Eoaj+7gBMLQ93YA7et06yv8P2k+zhV9G0BqSQ
	 JWlORbfEkW1JrfewPPI0m2nhaZ5ftV+iMM1ItTA/ccc81jG7AK9h6tDBaIZEG9qqTGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=GQFncqVueaFrQl85+04mTmZiBnBccR7JgnqJBrw51EM=;
	b=b0tzUAtvSXhmOcIYJawTsE4wExJOdb80HrzbxKwJVGGntL6jAMaX1GTxmFaXAJNt09h4
	 ItbQrXnBnadY5x9rXxJmRp8JIhOENVEwfsAz1GrLB3piCATPDuGMMqIAdFkEPxtb0bJg6
	 Kvv6rqFmnkvlJPx+9JT3L3b8gKAZePaEui8PxsZVY7ytBbfDaH8OzHcJWhuZIn6oE1Kb1
	 4vMMzmf5pmpQB0gyMuFIXUyhckHVt6/fabIzNWAdZq2+GkG4OR8zeWb0vLbzeBfAtpZ6x
	 xLsUPueMAF0yNnW/WEzaXJrOBYWYdfxwBUnLzJ5Op7t23f/B8nawnagiUnIAeLvl4mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y58Dbjcn;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03379606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03379606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y58Dbjcn
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c10dc41270so643939e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794227452; x=1794832252; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GQFncqVueaFrQl85+04mTmZiBnBccR7JgnqJBrw51EM=;
        b=Y58DbjcnkyPQ1CZRralTMZTIGZBHupsTH/Og90s0MQFBmBQYwYdDQ7GQnuN0UWK+Df
         zL1rszlu1x9PSyXNo7wZHtrTF0m4lfuq1Ni1lvH7SAA+eEKiCSSjrFd/u+uIw/vwLALH
         sDdKpfomvP+ZwGpfyz1gP9S8x15+nQ8MmIVOl6gU/Wv0XQAC9FpewRQivFm4Nuk1M6NC
         8L+KDCMHsM7MUnd8w08/FeT6DEoouBOfI+sq5029haSyZwdqcPYlWaplHFbiD1mQCMMl
         tkt2v39ZU9yuV1j97WoskoirDA1lHKrBZsKMsDDt+NSnSaOh6s34fjijnid4W2ajqUnC
         Vleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227452; x=1794832252;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQFncqVueaFrQl85+04mTmZiBnBccR7JgnqJBrw51EM=;
        b=Nam8v6FjxUWSOyEP4jAlEjrGp3UhU4o5i9qNY23nyxrOVu0bhMlvPSuBRMQiYealET
         bnDDaojjVNh05memq7hP9xa6qOM465C6AucTjCBDMCFRS3n9SxoJsOXjBqrqW5jfxceE
         kxkazlv4PG+WS2Qe7ldkPUZdp8EFIRbSXAsVZm06DytJRJ9xb5+kG+Dt8qVB9Zw2l/UJ
         O798jYuDmWv8Vf6Z89Mq+1mrIbyEv8w/lcP8bphsY/GO+zjmpsydZxz52CvJGDXZOZqa
         Rdo1iHPJ/49nN6t/qPFNVqRjKeoyfkZ9Ak5qi9wIw32iKxoT19N+XrtXxwpZwkxGPUFj
         maXw==
X-Forwarded-Encrypted: i=1; AL+hErFAAhA4Qbwb6eaayq0MGPfI6wMAufHa9jdTx5OvHv1vPCIaLKoVW/Fcbd+/poEmVb4cS1hRl72XSPkwhPg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/e7x02d5tDVfhrdx31UGma6n6Yb73hBR5Z0VNVfukU7smAvJfs
	ItjVxfy8aj2sHEHLmV0dTa3zDl4ZeUayE4YsFEJT13kLpFLUBSAk1/PHiBgZpw==
X-Gm-Gg: AYBFou2aiiXeV9aZF6w0HNQkSIRlZ/ObkBwwW4W5dUeohBedA0YUxQWG7qXE4BSlFgH
	4P1Uu/Lm9VOWLTkDGI50UGVY0dcgJCLnvUTUlgmNvnpN6adZiBMtYuO2ghwAbSpd6UvFSwrnOZr
	ULlfPJ+NTis4fKt/GygQXGRn6oHlGyjyzDg9i9/zfDxStl1s/n92f/KfmidazDlmEJbNwduPXgw
	Kqc9JPDO/B6g+CU3e4SKrs5pX3aGr59eBXfE6eBqU5oB4XgMt5S9NXu/JwdxF1xwPXaG9xmI87D
	vHiamnwKGzelkkeNvxiUZFCndScTGvt5+MHwb9BHHNGu48YnrzmOxzix4Wpshe0S14QQnVZb4wf
	gZEkemQZbOks40rfVNwBINn9zef68/vU/L3RwgojiOp1SQGt5eVaYWqNdnFm+KeegaDXm0TjNdK
	xGA4FuKolUF9yzF8+NkQrobi/+vSuz5GdcvSwZA2jub4k8Ry5/7cILK/M/knleOVsAUXH3NX0lW
	XI8+E2wycLjUXcirCZWgGTMmgP4ugqFvQbXpgSQNURbxzgCXQRbA101HN5yvy64J2y8xBMB+KuI
	9oUHT9Cv939ItCaUeAb1nh0OiNgLTbZw3fi/76c36rRCjVXgS3AXofk=
X-Received: by 2002:a05:6512:3e04:b0:5bf:d6b6:888d with SMTP id 2adb3069b0e04-5c14c00dd3fmr1236728e87.18.1794227451715;
        Mon, 09 Nov 2026 04:30:51 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b7fc086sm849084e87.23.2026.11.09.04.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 04:30:50 -0800 (PST)
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
Date: Mon, 09 Nov 2026 07:30:45 -0500
Message-Id: <DMQOJPJ4AT7P.3DUQ9O213TZBI@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <rdunlap@infradead.org>, <donald.hunter@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/5] psp: support rx rekey operation
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261106-psp-v3-1-a8dd38f5a727@gmail.com>
 <179408516544.994134.848767943937829488@kernel.org>
In-Reply-To: <179408516544.994134.848767943937829488@kernel.org>

On Sat Nov 7, 2026 at 3:59 PM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] There is an unannotated data race on the new
>   psp_assoc::prev_generation field.
>
> --
>
> psp: support rx rekey operation
>
> This commit lets an established PSP socket rekey its Rx direction. It
> does this by creating a new psp_assoc that copies the existing Tx state,
> and it records the previous Rx SPI and generation as a fallback.
> psp_pse_matches_pas() now accepts packets that match either the current
> or the previous Rx SPI/generation, and psp_assocs_key_rotated()
> invalidates prev_generation as needed.
>
>> diff --git a/include/net/psp/functions.h b/include/net/psp/functions.h
>> index 410adb6718c16..5a7a518b9579b 100644
>> --- a/include/net/psp/functions.h
>> +++ b/include/net/psp/functions.h
>> @@ -77,10 +77,12 @@ psp_is_allowed_nondata(struct sk_buff *skb, struct p=
sp_assoc *pas)
>>  static inline bool
>>  psp_pse_matches_pas(struct psp_skb_ext *pse, struct psp_assoc *pas)
>>  {
>> -	return pse && pas->rx.spi =3D=3D pse->spi &&
>> -	       pas->generation =3D=3D pse->generation &&
>> -	       pas->version =3D=3D pse->version &&
>> -	       pas->dev_id =3D=3D pse->dev_id;
>> +	return pse && pas->version =3D=3D pse->version &&
>> +	       pas->dev_id =3D=3D pse->dev_id &&
>> +	       ((pas->rx.spi =3D=3D pse->spi &&
>> +		 pas->generation =3D=3D pse->generation) ||
>> +		(pas->prev_spi && pas->prev_spi =3D=3D pse->spi &&
>> +		 pas->prev_generation =3D=3D pse->generation));
>>  }
>
> [ ... ]
>
>> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
>> index f2cba3fa3a235..c1e38845f08c3 100644
>> --- a/net/psp/psp_sock.c
>> +++ b/net/psp/psp_sock.c
>
> [ ... ]
>
>> @@ -302,8 +333,21 @@ void psp_assocs_key_rotated(struct psp_dev *psd)
>>  	 */
>>  	list_for_each_entry_safe(pas, next, &psd->prev_assocs, assocs_list) {
>>  		pas->generation |=3D ~PSP_GEN_VALID_MASK;
>> +		pas->prev_generation |=3D ~PSP_GEN_VALID_MASK;
>>  		psd->stats.stales++;
>>  	}
>> +
>> +	/* Don't allow SPI from two generations ago to alias one from the
>> +	 * current generation. Rx rekeying under the same device key generatio=
n
>> +	 * is currently permitted, so skip if the previous SPI is from just on=
e
>> +	 * generation ago.
>> +	 */
>> +	list_for_each_entry(pas, &psd->active_assocs, assocs_list) {
>> +		if ((pas->rx.spi ^ pas->prev_spi) &
>> +		    cpu_to_be32(PSP_SPI_KEY_PHASE))
>> +			pas->prev_generation |=3D ~PSP_GEN_VALID_MASK;
>> +	}
>
> [Severity: Low]
> Will KCSAN report a data race on pas->prev_generation here?
>
> psp_assocs_key_rotated() updates prev_generation with a plain
> read-modify-write while holding only psd->lock. That happens both for
> the prev_assocs entries and in the new active_assocs loop. Both lists
> hold assocs that are still attached to sockets and can still receive
> traffic.
>
> On the Rx side, psp_pse_matches_pas() reads prev_spi and prev_generation
> with plain loads and does not take psd->lock:
>
> tcp_v4_do_rcv() / tcp_v6_do_rcv()
>   psp_sk_rx_policy_check()
>     __psp_sk_rx_policy_check()
>       psp_pse_matches_pas()
>
> psp_twsk_rx_policy_check() reaches the same check under RCU.
>
> This means a key-rotate running while a rekeyed socket is receiving PSP
> traffic gives a plain write racing with a plain read. The writer and
> reader hold no lock in common.
>
> Since the field is a u8, it can't tear. A racing packet would either
> match the old prev_generation or be dropped against the invalidated one,
> so there doesn't seem to be a functional problem. The existing
> pas->generation update already follows the same unannotated pattern.
>
> Would it make sense to use WRITE_ONCE() for these stores in
> psp_assocs_key_rotated() and READ_ONCE() for the loads in
> psp_pse_matches_pas()? The later patches in this series don't appear to
> add those annotations.
>
>>  	list_splice_init(&psd->prev_assocs, &psd->stale_assocs);
>>  	list_splice_init(&psd->active_assocs, &psd->prev_assocs);

This was a preexisting issue. I didn't want to move the exsiting
read/write pair to READ/WRITE ONCE as part of this patch. I prefer to
change all of them in a follow up. Also, as the bot notes, the field is
a u8, so tearing isn't possible.
