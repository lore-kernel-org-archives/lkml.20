Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305265;
	b=Ot1omEg2yc3Ipty2fIsGa6KiIuLMD3jGdkd7vNv6zGwycxkRBYV5S0wsb930U74hEc5L
	 vz/JaUPCMyE47au6tikj+E/aq7shoxCY93I5hl20A/1TyIY8qW507FFGLurVblsiTEHbi
	 kk2IB5/I2n47isUz/siyCNjcF+wt4ZoQHLbOLY9rdBEeWN3Fky84Tm/L7nzOji/Zh0J2b
	 3u87UtYmjEg4qSU8RDsIqv25VSKHTmOXaBcUt0fo+FzLyszwVkwUbVZHPATu6YDT8kmaz
	 B06rnaWAJq1wIalktN0eVuywZIl+b1OswVgyqdDZp6kN0OiuMV3n/6SldYMR8VhFQIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=xGsK3yBvD3dY+fIGOvU+/f6W2zSWjZOAbooLra3Z8sU=;
	b=nnNcf9+QjMwfJDNiFPap1yhFYadKicsvhdiWYDLh4eF/y3XV2O8wDveWtD0zgNRw1MSg
	 U+cdvBzwD/n+H+EJ4g+lnUnbQ1j/oKH/njjhQrIzqNG5UnLcYhYDgijaFM32E1mH8NmIN
	 MXxL/ZhkoII/Pa0PiedSBM9ahw6Pc8ZOpsv2z7umORWjYw4qfxLnhOKO8S4M64wnxcPw5
	 CafZ83XHo/yDSngHQQg5afUx6WS0UsS7369GnBq1WG/q51LPOXhDzzpltIpAHvvky+a7J
	 scqGhYUpfLz28hSv2Va++515SdIOl3FrJAnMu7/gA18YLVt4cQQCUlOjcWIpcCvf1jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Iyaj4DMw;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5217560A6F63
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5217560A6F63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Iyaj4DMw
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so22352605e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794305264; x=1794910064; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xGsK3yBvD3dY+fIGOvU+/f6W2zSWjZOAbooLra3Z8sU=;
        b=Iyaj4DMww955eKJ8tI2muNnEoDOwC/Dvdv/6WPddBYN1yqjqLDLhFPG2LDHmpyWsIT
         VPHj1bwo3tqgVz+m/yoRrbPPEcvKhRp9/yILZLW4VALAnf06yJabG2QZMl3588hdjaOp
         MgCnY0cfals2/aYN8C7XXT47mHqM2IJzY0iQG+Xq1BY7ujJJNjSH50ZtqecBAysdYMfT
         +V0tgoOx5xSQ7+cTKocpuT/Nd4Z+CToD784d58xCPrgM0ofS+3WBr3JY7fDJ9ChDMqii
         T8PqsujolX7VgGO7X8j9KholUtMjUzI3nR1qlFHrT/b3e1gNd4sC6BwUSOWH4LL6rxUA
         2SRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794305264; x=1794910064;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGsK3yBvD3dY+fIGOvU+/f6W2zSWjZOAbooLra3Z8sU=;
        b=CWgZG+kA7W9EngR3v0vTxacXpN8iNZO1YOLglgyPba43l8nytxhre9M3lqydYyeyQs
         4kdM5VtBb9fR2Ss4SiAYNDQktnZ24pYs8tQOiQV3NZyg8BQQQkD+aRfjv4yFKUtcjau+
         yk4efgrxYtvtFuw6//5wk4xLRHOS6g77YSAvFwj4mfX6YjinYC0CgmDIhHTE3YrNoWac
         Hjj6MI4ADFl0AbM3S+mreOgd4/Ch7fw+T1XuGMXuAED7VqjstTXmj47WKztNL9Ov6oOY
         2rGdu9+r2zKqVzKfe12B490n0cbpoW6MSSYFst/CUgZTpxLkzqKZENXiTnhcIAXCCiPe
         0s3Q==
X-Forwarded-Encrypted: i=1; AL+hErGOc+j8OSVGD6U2l5bFAPF5OWCTKmnGh8D8MMVG5mpXJ90FsTBOw7qR3PgOVNEbs+aw79Y3fasDpm5kI6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/s9jMlWWtWr35hobnedHueJu/iaPz/HA3mziWO2Kln+a43xu0Y
	OlFgL/hvUhQjmH/hc/kWjs+dIA+YTT60CnpybLxNsI3i7i8X3EwKDbPJd89oDs78MqPBfr7b2BM
	GxB45ESI=
X-Gm-Gg: AYBFou0D2UzCwL4KgU8yUOazlj9dpi+tzu1KEty1uhBSNCLBHsoC+YlQdmZwcDUBA2l
	fTaqynORbTXv+on9OUzBCenQnkKfufuNiyn9yv8TSIcxbF5pgnwGWozmdsf7RMD+sl5dcCeZ7Fi
	/9/ZbhvdnVjuw8LzHPpvtayZ6+E15QDtMhQqNnF2GStHfZE7OBJqKl3PziOeUCB1rIAZmsJ/bae
	8y/VptJPjStGZT0EFaDxPG/JBmRxp4gtVh4B0lbU0YhCi8zZVWuSBSMPbusyHAZ9npntMbzGad/
	Ea8R84VLsHo16EYKHkkbExc2a6BA6ZHFvUo/KndZvxhUH9sS4Ae/mn639YMLbpjTT5X7sgfgBzN
	bLK399KQGDW0Pa/keTWXFqQKc1YyCWusDvYNoChBZv2KBcQyGfsNRaj0WUGDAwI7uR0znIlGuqU
	kcEcwsuGxb5X8FiRzyi8vybK885ujAWw8p4PnlHPJ50I7obHQPTt60Z7DLU9v6ON9xOPB8zjvXq
	4Gex9saqA2QwEV68Z6YTVm6PBx1AJnHrqYvTLGcCbbMwFFUuFi6aZ0Rn3MG86V/BVVkpEW6DbVf
	YxclDsTRCdPfN3Qy5IMGh0uTbLJQJU6NHF7hiFPQwItOhnbilv2fEiA1PmGPlnZU52diHeaopjG
	zJIwHLElTHLdnVWtI5GzURvuam4cjRyjqtelFOzFVnKuJR/uK7AS53fP/ev9uqAL2aI5XNHfR
X-Received: by 2002:a05:600c:3e15:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4ba02307c34mr31970825e9.4.1794305263593;
        Tue, 10 Nov 2026 02:07:43 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1? (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de. [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a6b0sm58365255e9.5.2026.11.10.02.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 02:07:43 -0800 (PST)
Message-ID: <26ba4ecc-0a97-45a5-b39a-d7f1fb9b33a5@suse.com>
Date: Tue, 10 Nov 2026 11:07:42 +0100
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
Subject: Re: [PATCH v2 1/2] xen: don't allow gnttab_dma_[alloc|free]_pages()
 in PV guest
To: Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20261110095605.369848-1-jgross@suse.com>
 <20261110095605.369848-2-jgross@suse.com>
 <b17bbf33-1b4a-4491-b9dd-4ca1bad1876f@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <b17bbf33-1b4a-4491-b9dd-4ca1bad1876f@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TtuF7cHMmXscsrdnH1gYPpJ2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TtuF7cHMmXscsrdnH1gYPpJ2
Content-Type: multipart/mixed; boundary="------------qgsximp9r0ts5B0VjZR4a75R";
 protected-headers="v1"; hp="clear"
Message-ID: <26ba4ecc-0a97-45a5-b39a-d7f1fb9b33a5@suse.com>
Date: Tue, 10 Nov 2026 11:07:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen: don't allow gnttab_dma_[alloc|free]_pages()
 in PV guest
To: Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20261110095605.369848-1-jgross@suse.com>
 <20261110095605.369848-2-jgross@suse.com>
 <b17bbf33-1b4a-4491-b9dd-4ca1bad1876f@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <b17bbf33-1b4a-4491-b9dd-4ca1bad1876f@citrix.com>

--------------qgsximp9r0ts5B0VjZR4a75R
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMTEuMjYgMTA6NTksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDEwLzExLzIw
MjYgOTo1NiBhbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IFRvZGF5IGdudHRhYl9kbWFf
YWxsb2NfcGFnZXMoKSBvciBnbnR0YWJfZG1hX2ZyZWVfcGFnZXMgYXJlIG5ldmVyDQo+PiBj
YWxsZWQgd2hlbiBydW5uaW5nIGFzIGEgUFYgZ3Vlc3QsIGJ1dCB0aGlzIGhvbGRzIGZvciBp
bi10cmVlIGNhbGxlcnMNCj4+IG9ubHkuDQo+Pg0KPj4gQmFpbCBvdXQgZWFybHkgd2hlbiBi
ZWluZyBjYWxsZWQgaW4gUFYgbW9kZSBpbiBvcmRlciB0byBlbnN1cmUgbm8gb3V0DQo+PiBv
ZiB0cmVlIG1vZHVsZSBvciBmdXR1cmUgdXNlIGNhc2VzIGFyZSB2aW9sYXRpbmcgdGhpcyBh
c3N1bXB0aW9uLg0KPj4NCj4+IFRoaXMgZW5hYmxlcyB0byBzYWZlbHkgcmVtb3ZlIFBWLW9u
bHkgY29kZSBmcm9tIGJvdGggZnVuY3Rpb25zLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL3hl
bi9ncmFudC10YWJsZS5jIHwgMTEgKysrKysrLS0tLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYyBiL2RyaXZlcnMveGVuL2dyYW50LXRhYmxlLmMN
Cj4+IGluZGV4IDYwNGM0ZWVhNTkzMC4uNTZhNDk3OTg3OTQyIDEwMDY0NA0KPj4gLS0tIGEv
ZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYw0KPj4gKysrIGIvZHJpdmVycy94ZW4vZ3JhbnQt
dGFibGUuYw0KPj4gQEAgLTEwNjMsNiArMTA2Myw5IEBAIGludCBnbnR0YWJfZG1hX2FsbG9j
X3BhZ2VzKHN0cnVjdCBnbnR0YWJfZG1hX2FsbG9jX2FyZ3MgKmFyZ3MpDQo+PiAgIAlzaXpl
X3Qgc2l6ZTsNCj4+ICAgCWludCBpLCByZXQ7DQo+PiAgIA0KPj4gKwlpZiAoV0FSTl9PTih4
ZW5fcHZfZG9tYWluKCkpKQ0KPj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+IA0KPiBUaGlzIHdp
bGwgZ2V0IHZlcnkgc3BhbW15IGlmIGhpdC7CoCBXQVJOX09OX09OQ0UoKSA/DQpJJ2QgcmF0
aGVyIGhhdmUgaXQgc3BhbW15IHRoYW4gYnVyaWVkIHNvbWV3aGVyZSBpbiB0aGUgbG9ncy4N
Cg0KQWRkaXRpb25hbGx5IEkgZXhwZWN0IGFueSBpbGxlZ2FsIHVzZXIgZ2l2aW5nIHVwIHF1
aXRlIGZhc3QgaWYgbm8gYWxsb2NhdGlvbg0KYXQgYWxsIGZvciBETUEgaXMgd29ya2luZy4g
Oi0pDQoNCg0KSnVlcmdlbg0K

--------------qgsximp9r0ts5B0VjZR4a75R--

--------------TtuF7cHMmXscsrdnH1gYPpJ2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmry7O4FAwAAAAAACgkQsN6d1ii/Ey/T
Cwf/Tb+AVxXrbuvFoZ0LYX4wsA3Zp7tmM72RVwUDR+7DnfAt9KWN7r0YaiD7SN8dlzZzFDQHnexJ
C/Ah4ryCfnlmtmcoCtTfTZKaEvbimlVMzmn/M+iEmjv152ygYU3Nzw/tXfeTlY+KALnG7PVCNShe
vOicu3gwkfRBWMPDhOSI/vj3FwaBQCEHrpBHY0+LzbXgdC6ArqPuw5IRUrN71HxlWY/vrcZfi0E0
iqDQmIEgj/flGZUquXjqw8pC/ROC4oq+QQblPVhBq7wMwndPZsMGUUhECM5SJc+xeFrkexKL85q+
JK2yTy119TuUrfl3cBZGtRUAgPtwRPyhek26+HH3qw==
=tx1f
-----END PGP SIGNATURE-----

--------------TtuF7cHMmXscsrdnH1gYPpJ2--
