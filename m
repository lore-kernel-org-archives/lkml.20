Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A5F433BC0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499877; cv=none; b=qHmsgq03J3J15yRvHCGmOKa01ANzPbOwQt9t9SFliWO48Kd0Bl4+B9ZHAoVVuIaTAuioo24tklgCtc1IGuh22PggZjoKvEIBo8Epy7x+vSN4NgxJ95uO34mqT9BMqZMGbQUUpq4TJUhn7bBeSPKpleQaEFWlUsPeyzpiwrshR2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499877; c=relaxed/simple;
	bh=puphIDN6Txu2UgZfXjoi+84d6eP+qKhkJ6b+R2XKjho=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dEOEe6r+VUrwyNrsEeFqAw/GxBDNa1rjZfc1XlZfuAd8klSK6W/oSgsYqN3v+gr8Qs3XdECtkoH6cJcqzxERtTHQGwAxXL5qqkzQ/TVC+hH2PP2MSiWLE/kE6KOWgeM6wRYjU5i6+IX757X9Qp4tVDwqB/25kLieNfNJWOMBjyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3gOOjVa; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3gOOjVa"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb767cc7fso698241cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789499874; x=1790104674; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6Vw/Gc5jnT+eYof+b4N2iMEbssMWUevRjmxXML0NG0A=;
        b=O3gOOjVao2g7nDqQjE6h3dmDO3ciiTv5mTJPSV9UM0iJVFXUPPT4My4NIO+8uzTIZe
         edfB61BuJ/9aw/Rk8TP0s+QWqguplCI+RcdI/2Xjd10TTTBWPI8NEVxTey+iEx10eMhy
         2g1kYQOFUZoKoyBsGlLY93LFrZkq6nxq21S3103AnXlmdzaSu050BZ0YZW7NTETJU2Zw
         n1HCI0ULKqHs1y4+HsJQfhdCMzqrR7v/PujPH4vVWG4SQyySogtpzWPMZom+NdfJ0vmG
         07WYxdrGuQ7OAHa4HIi8DidyVEnBBBcTJuvPiwqpAqkj+KBYV2sv9b6y8mHqgThH9X+1
         9q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499874; x=1790104674;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Vw/Gc5jnT+eYof+b4N2iMEbssMWUevRjmxXML0NG0A=;
        b=KhBMnD41YL/DnlQIumrqcZ+uCiS1O3cODvZZi6uI9quMKJi4Qy6qUd8mSNwOBzTHZp
         xlB8By1sMgaTG7ot7M4fqhs/FcaUCjZsKE5lnPupot2rb4rfAoPxmyBY5OOlQCqCoJXn
         wfxVWbAOllAE4qkPzEvjKX4JDohXv2848LLX4sLmBB2iWKean0Klthr4ii8fCRS1O8SK
         7LcksTwxF7ZUpwnnEskCnjClyaKhQRqtNUELKVWwz4UtLEwWC1P3v9obYkZPePGjyZ56
         se/nLPefiXq6V3mMSqTzIlzNceXm1P4pqNaB71MT6nyq96xtMhw5ociRBeoD7ce71vlv
         MkNg==
X-Forwarded-Encrypted: i=1; AKwUvByb32wzXKP1MQRegqi0X0HVQFIuqC2c1FWnCUuO5+zpda6TMcNVQ6pgH55TczbDaZ6q1Li3+HJvF53Em1c=@vger.kernel.org
X-Gm-Message-State: AFuF++mThuBC3vzCMU0IHHNBaghk/BWtFWb9VPwQG5CTYT0irS4lMcKX
	z482ZJoGAsOA6FcjePv2ShSJYdNDvlnMQ4O4cmQrnE7oeey5GNn//I+v
X-Gm-Gg: AYBFou0qroPS7/1wgkMTORLrVOb4XA/gQCd67DlUOPd/T9mRGQ4c+iGnyvnTrdFFZ5g
	a1wX4TVIoWFxozGJnMVW8yzy8KwZdqq7jDwp1XzGNb35GEzbb/LUMhz+URxGsRFqVKKmbWw4uOj
	wdRQZTk4QX89ENl2+SqSQh8ab9qWMGg3CSkzQOMraE99NqDshQcC9RbJBN01ZiAhNhLaxBZ1cn0
	97+HgcQc/w7CzxZU6eJPWHdRtDQZcYHpjD+MfbgbWgG9p4SjjZVB3Q9BqWmA45Qi86G+YoSYSfz
	WjyJ7Ss7Ex7RwpsCO8e1kcfJj7UvrRp+yM45f88VXc6EOuVq2v/9Z8+RPnUA+yibEW3IXHniai1
	sVYIT2J68fAHsHwEFUZodEuqU2y3T8SsfnRNzsLvdNw/jqEM5qGHdcuOoRvMOekB1s6dtpPTthS
	5LPCeBWSUAEJcHyz20E0bDAdQ8oPHhPM3j5VnB4/EnTrrH2l8GUfHq3N7wdOvo8Me2e1fA2R6/0
	MLg
X-Received: by 2002:a05:622a:164d:b0:51c:6b6:9d0b with SMTP id d75a77b69052e-53126101887mr35935981cf.2.1789499873957;
        Tue, 15 Sep 2026 12:17:53 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be915d5sm6224706d6.26.2026.09.15.12.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 12:17:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Sep 2026 15:17:52 -0400
Message-Id: <DLG4RGGCZ776.1UU67KP7TWDAH@gmail.com>
Cc: <edumazet@google.com>, <ncardwell@google.com>, <kuniyu@google.com>,
 <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <willemb@google.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net 1/2] net: psp: avoid conflicts with skb->decrypted
 and sk_validate_xmit_skb()
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260910-psp-ktls-fix-v1-1-e3f30aaeca4e@gmail.com>
 <178917294180.219967.2431474539892551274@kernel.org>
In-Reply-To: <178917294180.219967.2431474539892551274@kernel.org>

On Fri Sep 11, 2026 at 8:29 PM EDT, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> - [Medium] The new mutual-exclusion gate keys off
>   `sk->sk_validate_xmit_skb`, a function pointer that is inherited=E2=80=
=A6
>
> --
>
> net: psp: avoid conflicts with skb->decrypted and sk_validate_xmit_skb()
>
> This adds a mutual exclusion gate so that a socket cannot carry both PSP
> state and a TCP ULP, since the two conflict over skb->decrypted and
> sk->sk_validate_xmit_skb(). The gate is applied in __tcp_set_ulp() and in
> psp_sock_assoc_set_rx().
>
>> diff --git a/include/net/sock.h b/include/net/sock.h
>> index 51185222aac29..ba5e5092f192c 100644
>> --- a/include/net/sock.h
>> +++ b/include/net/sock.h
>> @@ -2312,6 +2312,17 @@ static inline void sk_gso_disable(struct sock *sk=
)
>>  	sk->sk_route_caps &=3D ~NETIF_F_GSO_MASK;
>>  }
>> =20
>> +static inline bool sk_has_validate_xmit_skb(const struct sock *sk)
>> +{
>> +#ifdef CONFIG_SOCK_VALIDATE_XMIT
>> +	return !!sk->sk_validate_xmit_skb;
>> +#else
>> +	return false;
>> +#endif
>> +}
>
> [Severity: Medium]
> Is sk_validate_xmit_skb a reliable indicator of live per-socket state her=
e?
> The field sits after sk_dontcopy_end in struct sock, so sock_copy() copie=
s
> it verbatim into a cloned socket, and neither sk_clone() nor
> inet_csk_clone_lock() resets it.  By contrast, sk_clone() does explicitly
> clear the PSP association:
>
> net/core/sock.c:sk_clone() {
> 	sock_copy(newsk, sk);
> 	...
> #if IS_ENABLED(CONFIG_INET_PSP)
> 	RCU_INIT_POINTER(newsk->psp_assoc, NULL);
> #endif
>
> So a socket accepted from a listener that had PSP Tx state installed ends=
 up
> with sk_validate_xmit_skb =3D=3D psp_validate_xmit while psp_assoc =3D=3D=
 NULL, and
> sk_has_validate_xmit_skb() then reports true for a child that has neither=
 a
> PSP association nor a ULP.
>

Sorry, I started a response based on viewing this report in the clashiko
web app, but then realized after I had sent it that I had received the
report in email form. For the record my response is here:
https://lore.kernel.org/netdev/DLCXDVPGGC8M.11EBKPBY2KNVP@gmail.com/

So, is this a blocker to merge this as is? I could drop the check on
sk->sk_validtate_xmit_sbk to appease sashiko, but in my opinion this
makes the patch worse. My ultimate goal is to defeature psp assoc
operations on non TCP_ESTABLISHED sockets in a way similar to tls ulp.
