Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313171;
	b=XyIavIClI2QBqPEwLVX8G+ttahqQBbvVIDSL/imUydw2uGBSxNzy1UpvVE7Nh6BWBxL/
	 cJY2k//TfzsFybJlUo11BOJrTSjaD6sLz8gLY/ZMZyFDHifHSrTFKNW1mBslbL5fldHs8
	 iMVaG8rgCHgZvQlxdrw4mAunw2QpQ8ENQzcIX7lAEXQq8Z28S0rMVqtPQWbcYo4zEKhcV
	 +Th6efhxQzdyEfRd6pyLkM1XTc4SgxtWgR/PuaNNW4O4hIyGoch9deoyKQBEs1UoxtZZ8
	 dDvqhgoMPcLz0tnr/xhWUiKvcLd6LWjHBPC0Ha33mNKfLs/ZTI6Zxsrf4s+h8riRc6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type;
	bh=yXt9f0OhTGqOlSUzrOWZtQolrNkkgqL54IxnAL6Q9F4=;
	b=Tp8/rkfr/+hfDiG2kcFYZPe3bPHUapMY416cwPklC0pvnog65R9JAcKz/b9zojyOhR7M
	 jMJY53QC4l4aizyaSFnZfeImDvKZoob9fUIGXHc8FCjO8IbqjaXXsd/wx8/WLwv8R0h46
	 S8C+5ZpZbYT3XGdtPQj2TTw0UlBekOUY+h8YVVzBsNdr+4R+GBMewZ6uk2QL8Q0w+7qVM
	 Vjqh8Htk9K79vNpjyCLxdsrz4/WTlsLGIZt42Oi5QZ75C8v9Pir5NJAoA6IfeAw0Wq92p
	 thvWdZFEKjXSVDZVtdicPyBL1RuCvuGeJX1LXFx9lNj7anSA8+pFlOwHEhLYf1Ks7/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mwng6FcH;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E620606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E620606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mwng6FcH
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so17964795e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794313169; x=1794917969; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:content-language:references:cc
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yXt9f0OhTGqOlSUzrOWZtQolrNkkgqL54IxnAL6Q9F4=;
        b=Mwng6FcHPa1fIQhzl4EaTI2RfQxfhrXeLy9P/oJMNJ7RYOQ4DEdGtlGYiPtc5D2XFa
         GR/tFyoRdpChmdioH53keADiBALB3ODOdp1diOXMDTZuKfhTG6Zw5zL3oEtR0tj2LhPI
         nUb+Hqy1J1dIFj6l6obVEQWDQHfjQf4rCQAqJLOLohSw267toc4dAxW+OxbOy2Vdlszs
         uaqYfuClbgxJQvAlb2QeD5w39CvgxKLd8dHqyAkLthWaciVxoNRenGRgHILPPVskLclZ
         PWPYSIqFuRjB1C8gkDRIQ77gn9i9oThJwCIJ9oFEoammrXQjbcbDQlprmz6TmD+NjFNZ
         EQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313169; x=1794917969;
        h=content-type:in-reply-to:autocrypt:content-language:references:cc
         :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXt9f0OhTGqOlSUzrOWZtQolrNkkgqL54IxnAL6Q9F4=;
        b=YhodiZfQ/4R66/eGZiEm7qSMYg/3XjJs+0rrh7Osgak9rm+8h2HiJXyK/eX3G1UbGZ
         FduUK6aRvYrYwxio/fLYGAgOcrZZMl8idWAxwATZo9+O1sZcWHWTxxYEUBZdgBHpE/59
         VhOgNCaILLfxyNFe8LKrZ6klq0fR7kEGrvIUoLpfOGRXkguGxOp4yltuTa9Ouow6yao0
         OTrUl1NQH9ETJ7SYEDj67xViwvt1Q0heMeVzNChqQBTQkMrS3Z4/dbx3UkpXLTqlCH8Q
         ThjXJQXldphTLKRdBkyL8QVw7m9wBAprTHM7MqkGP5Z1Fej8RtRTio1bzzGLej+MGfMW
         7xMA==
X-Forwarded-Encrypted: i=1; AL+hErHLit5SZEteExUmX/DDmdLdCh0tf2aoMm2ib18BWyIoJywgwhXAsiPnqBHf+CRQDD4a4UhUt1TJwHi3kUA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/53hyYoAg0H6MtjHWKGqxKy2FBl9tqrsAp+TJ254R9YjZTJrP
	21T+dZzDdFtSpKVZbCrD2/tPtQkEpu6SzdwbLnovYEYhKdvo5bGkYJX6GlHCHMjpixM=
X-Gm-Gg: AYBFou1c0TvLVLmxxgj6SKTXuStxZ/foXVz/EaGVptAcMEXOBvAA40RpXFZeH/XNAet
	QRBy89KVZaFNxegC8bnpB6BNjOKclDeozQk59DaL5Wzuzo/Wv+Hn/MgmFWnC/hx1JTH7axvsm74
	hfmqk+hdF/Hz+48Ch0DcbVIAEhKQLAkZ9gZDrvAeM3jzixa2NmFPdIbdbk047hJmVEwe0E8XRp7
	srjI3SmgKlemapYaBppJKScLgb3GRscCFJslfhKb8EsvS5HHw3q+tEHcqDMC3C4ig3X5KW641r4
	sDkFTJNXpVhP0uCWTNuH6b07D9jrzocPRXQe+4P/FaYpfS7Rs2Pf31mOiOxWNpvW/QDCu5qXHxS
	wvA4MZfs0x3164WOpdGqe+lqXyLT8j9apcL+It7nk7PNyxwFs8r/DfuIwB9YxPQ/BEuiQMR//53
	JvCzaTsSiOUjZ+M1sorwIqsLylfDoBrMLvRlyJfqpQW2xGGLO6kUxTx1kWYubbOpcCFp+Wv3gad
	FlHLrPLnPCUdjiE6bYNjKaJJLliUJ5C2eu8i5SkSKyb4wqsJKVOwIWJYp2bkSgBJS1plgnLj1KI
	PwazCwt97PfEDao0ClxwsRLmZD/gX2Mjht9H/V+vzQUHzZe2yYqetEcU8HjtKieB7h5oleEtFgR
	gXKlqdet0iEy5il6Pki2So43ER+OMZ8I=
X-Received: by 2002:a05:600c:500d:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4ba0233cbf4mr41095235e9.6.1794313169273;
        Tue, 10 Nov 2026 04:19:29 -0800 (PST)
Received: from ?IPV6:2001:818:dc1d:c500:21cd:8ec9:48da:59ee? ([2001:818:dc1d:c500:21cd:8ec9:48da:59ee])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2f09sm70848775e9.4.2026.11.10.04.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:19:27 -0800 (PST)
Message-ID: <5cdc7ef0-e18f-4afc-96b2-ee4e92bc29ee@gmail.com>
Date: Tue, 10 Nov 2026 12:19:26 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: Disable async suspend for AMD rev 0x62 ACP and HD
 Audio
From: Diogo Sousa <diogogsousa@gmail.com>
To: Mario Limonciello <superm1@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 David Glushkov <david.glushkov@sntiq.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261016135042.44914-1-diogogsousa@gmail.com>
 <d8a95ffc-d4ab-4c45-9d6d-53c49e3137aa@kernel.org>
 <b0591ad8-cfe8-4a47-9e53-ef304c04485a@gmail.com>
Content-Language: en-US
Autocrypt: addr=diogogsousa@gmail.com; keydata=
 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
 hq9XZVX1eRVA
In-Reply-To: <b0591ad8-cfe8-4a47-9e53-ef304c04485a@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KnRqjVH1a0oVYKtDg6ax6tOG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KnRqjVH1a0oVYKtDg6ax6tOG
Content-Type: multipart/mixed; boundary="------------kXM7oS8iaGLMrKAcsxJSmxi0";
 protected-headers="v1"; hp="clear"
Message-ID: <5cdc7ef0-e18f-4afc-96b2-ee4e92bc29ee@gmail.com>
Date: Tue, 10 Nov 2026 12:19:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: Disable async suspend for AMD rev 0x62 ACP and HD
 Audio
From: Diogo Sousa <diogogsousa@gmail.com>
To: Mario Limonciello <superm1@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 David Glushkov <david.glushkov@sntiq.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261016135042.44914-1-diogogsousa@gmail.com>
 <d8a95ffc-d4ab-4c45-9d6d-53c49e3137aa@kernel.org>
 <b0591ad8-cfe8-4a47-9e53-ef304c04485a@gmail.com>
Content-Language: en-US
Autocrypt: addr=diogogsousa@gmail.com; keydata=
 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
 hq9XZVX1eRVA
In-Reply-To: <b0591ad8-cfe8-4a47-9e53-ef304c04485a@gmail.com>

--------------kXM7oS8iaGLMrKAcsxJSmxi0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQmpvcm4gYW5kIE1hcmlvLA0KDQpmcmllbmRseSBwaW5nIG9uIHRoaXMgb25lLiBJJ20g
YWxyZWFkeSBvbiB0aGUgbGF0ZXN0IEJJT1MgZm9yIHRoaXMgbGFwdG9wIChHNjE0RlIuMzE3
KS4gTWFyaW8sIGlzIHRoZXJlIGFueXRoaW5nIGVsc2UgeW91J2QgbGlrZSBtZSB0byBjaGVj
az8NCg0KVGhlIENhY2h5T1MgaXNzdWUgaW4gdGhlIGBMaW5rOmAgdGFnIGhhcyBtb3JlIHJl
cG9ydHMgb2YgdGhlIHNhbWUgcmVncmVzc2lvbiBvbiBNRUNIUkVWTyBhbmQgQVNVUyBUVUYg
bGFwdG9wcy4NCg0KQ2hlZXJzLA0KRGlvZ28NCg0K

--------------kXM7oS8iaGLMrKAcsxJSmxi0--

--------------KnRqjVH1a0oVYKtDg6ax6tOG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE85oHCWXU2i7ehQp93pPwU2yxodUFAmrzC84FAwAAAAAACgkQ3pPwU2yxodVO
iw/+LVQKqZrJsUnZfQzoLPGx5v36hlXJR6E0qK8B2gg563WWPbffI7coLh7n6rm/8VOKzsHl1wnt
Gdz2n1DW8ldd7710lK+FWxtefoC0WgipwocxM0rGnenbMpA8FE5M1cFECQe/YfGjFB9YfZ+UGW8c
pAc4qur1P1oWYlsaucKX6M1HGHAMgXYhY5Mf+TbMEYNbFwPWAylAuTOgirKVbBnrf9I8mtMSrX7p
W+aieL3RIA7eOhOEtNLDobPfIWWHypYuLLD+YqrZFcnbd+/0R9ZR++zFzHWaZLOqE7kFsumQ98NN
kw/pP4YH2K3+7qkhzqk4uoDfP3+xJi4QeHYofjkDZWs+WhjjUswQWt6Od5+414NuBj+kw7fyEc8k
fezi4sfBGaK27GSO6wQm5ASxmEm4/OqLq1MGcBc0xTr0ARJtQfAgcJAiABeAtB75Bo58hjVQI0mm
YOcMyVu/El2zBhaa95j0N3c/d1Fji3yWWCC3NUO8AFMP4+A12tIIfTfewtDHAGrfcK5cMxR2yBfl
L1gLGCN4leKXMYTCBFk2J+jlkQQ4mtrk1C0QLOmAxMtav2mh+yjJG1BS3ifnoYUUHqEFGEEGr0J4
ciO2lnoflVPIx9WL3YzEL7Ay7iCY3gwBZUkqi8QkOB3doINtqsT20OpNJoD+x/AicRMfmRT6/GNi
x9Y=
=FYmn
-----END PGP SIGNATURE-----

--------------KnRqjVH1a0oVYKtDg6ax6tOG--
