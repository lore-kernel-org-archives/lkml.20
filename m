Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478519;
	b=PAuM04g0ZBffqSHIgQsdC3GkYGpfHuTrhSKal52XVF31C9aGssI9v0Q/bvVw1AkKbAXR
	 3z2z2xtEnSICUUbAuzXQSaNVjPt0RyyBjsRsUWipHR9DEt8uQzatpC9q3wB4oj13ZoEXd
	 DuE/+Smci+8sCfU3rjvNny0IrcSo/SYOox91W0t2l4h4SvwJHIrhbor1AFxnj4tQI0zbg
	 a89tJ4PV3PGJMQP/fBFBW7ECt+95ojnzqLVhymGjfBjR7qPdaJyAJ5DeW8J+Lk9ByVnFx
	 6VHHa6DpXfQvR9J98py1ZYsR3dx9eJdEP5rBs+ZomweIPY8iK9fOq1dvlCyxqTP6rUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=/1Q/PUELyNwj2qbyBRmSt0cgWWpENEFwGaSV2JeSfBc=;
	b=KGh6YGWcyb1BMRwlglMnhzgMfAbAhC312IY4c0hGJ4yqXTdfNRYxqIwQGwXQqFkZig7y
	 WhMzbg374Hv27m84rRi/XG2/cc3YdqBESMVTzaTHj7Ajh+o7ol1Bs/RaEJqAxoxtzdlRO
	 g+7ZeLG/6uae8//kdMwNhnnYIY8VBzuDUwPqUzYIejSUHf8qbOkLnNYe7NkT8nAw2qUtR
	 YODQ4/8MTwNo3CUfZV6RnroFXsD0bwSwM3/fi3//gNQt9h595iILqgTBiEskaQpAX5e2c
	 F2e6ZLpqH1/Ozj/nBmyWkqcml60O1EokjJwxQ5zzdIMxDvY7EtvLPz5bO64lYq7U3ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o28cZZr9;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723CA606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 723CA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o28cZZr9
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so43006195e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794478518; x=1795083318; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/1Q/PUELyNwj2qbyBRmSt0cgWWpENEFwGaSV2JeSfBc=;
        b=o28cZZr9g9jpgYFv2IkAdXN/FB30Ic2Om9QMaoI9ptc/Dkeq/fsb+ikjytptwp0jTM
         q7tA+X/K+O3Pk/FuYrVXthU4TrnP+3E5EnIejJqCn4boNKG0biOUA1GBrf8AzQRzIKH0
         xnKEjzYujKDlA1FV+NPcLYP2vrl1DKhmkwduP1Uc4aMXEHNihvTgDDQGppuRJ/4052qn
         GF6GrrWInW2v27loCh6kOUH4RlNMIHanQVUhdsRRlLvWW2afxHB5CbP39iByEX29auVe
         ex756m+6QLhIlcsHJjwFiCK1RJWKoo3OtKPZstJAJp43gXOtrqW5njw0txhEY1AupJGt
         V9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478518; x=1795083318;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1Q/PUELyNwj2qbyBRmSt0cgWWpENEFwGaSV2JeSfBc=;
        b=LjNPTUepvqExxvN6++ptIOy3uVUk4RmbDknJTWrz3am+9CMD76VkJ7UU+jGscjlIvq
         rw0sjvVBazpTpxVGviE5L4wsqjOxxq9dU8I+Lpb6H4UeupzxajKmpO/UK4AS3hseMS0z
         PmjjnMENjcuUmQ9fug9Cs4FE/WL8oEkklXqoPWMIforI6F5TAaAT+H4eXBFoWe/FZiLN
         29mQi/3zYSWkJtUX3JuYwfOP6zqeVVIB/vKG0AZHawKJY6ZIU3IJSZxfi3bFVnSy0xjR
         D7W9gFnP2mfA86dKxyw8+/tyqIjEs6HEDQJZb9zQlmxNXP1pOkn1bz4aMkvBm/ZGekzD
         CQLQ==
X-Forwarded-Encrypted: i=1; AL+hErEaQXUPU8H7jGao3vC4sAET6nS15+qcHio8wUm21IbPzpRK2n2MkdXhMVDkNX+Yxh2r0fparq7gJjeVRjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9UejM5qLWWAxbmwiXdCfO7VWASCo6GeN/bFKbGmnNB0d3dgvq
	DcTBExU5SXNBhHN0o+kDdsi9F9IAxsP9Sdi25bg8ir0G27E+/XjhpHqq
X-Gm-Gg: AYBFou1sP6NyjLQcOat1L+SDuQYoFW8NSElkyJCRNhkzgnLxZkQ5nl3kNansvTSQgRe
	J/OeFVWwhEFX0wLVr3AzKw+rJKDtVZ1HMYvutqBgEukCzOh5Udw3sphd4titFKSpzKoSsg6o+bD
	/TNTRgbXWiO3IDF0jw2c9x0UiX4u0XhdTqjHBDhs6I1iflrBYhL9zk/QluOESu2sqHjyQn5TbhG
	rDZSlepv/eIeGyTKFzytEex46JuU6ObsvQzANcZAGAtTwVIXqzvEYlP/S6DAWUvQsqrXiMQRRAD
	ficCyVb1n1bjx1FP7Q6Rz1/ApLsetW5gsuql9qw5Zi/50/ezrYCRtX6zMuxuIM2ustbPGsJoWgH
	1dNT7ajw8CljYFTe//LaToZiaSqEwvFkXxJQE0Q0fi37fTD6+fJBNRT3wQhUDetB7Gtv6q+/kEi
	IBG72DZ0cUQYLld3U57LNJ0PEtMGXVM6w4B1D3ZtkDCeDxSqMxrKj+KnKmdA1sYImMGi3LHmlxU
	PBe0zVwZ8F2KJs39GV/09ppnBqxAlqE7n2xIbDlLIYcpPuoyqhtpKlw2pQbP+8D7hSv/d8uC/E7
	i8YRS2HxGN+vIs7gzZiVG56WRUc+XBMwteL68u64xf27MPWXuNU=
X-Received: by 2002:a05:600d:2:b0:4bb:52bd:a3c7 with SMTP id 5b1f17b1804b1-4bb52bda3e9mr9993475e9.6.1794478517767;
        Thu, 12 Nov 2026 02:15:17 -0800 (PST)
Received: from smtpclient.apple ([217.111.110.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm66747305e9.10.2026.11.12.02.15.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 02:15:17 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH ipsec v2 4/7] xfrm: prevent AES-GCM nonce reuse after
 early GSO
From: Usman Malik <usmalik90@gmail.com>
In-Reply-To: <20261108142652.1330952-5-Jeremy.Jean@oss.cyber.gouv.fr>
Date: Thu, 12 Nov 2026 11:15:06 +0100
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>,
 Boris Pismenny <borisp@nvidia.com>,
 Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Tariq Toukan <tariqt@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>,
 netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <7A2301CE-C145-4CB2-81CA-4A2BACBA8430@gmail.com>
References: <20261108142652.1330952-1-Jeremy.Jean@oss.cyber.gouv.fr>
 <20261108142652.1330952-5-Jeremy.Jean@oss.cyber.gouv.fr>
To: =?utf-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
X-Mailer: Apple Mail (2.3901.200.71.1.16)

On Sun, 8 Nov 2026 14:26:49 +0000, Jeremy Jean wrote:
> With software ESP offload, xfrm_output() attaches a secpath before
> calling xfrm_output_gso() for an encapsulated GSO packet, but
> skb_gso_segment() leaves the splitted skbs sharing the same secpath,
> including xo->seq.

I tested v1 of this patch and posted the results in the v1 thread:
=
https://lore.kernel.org/netdev/20260930144523.435271-6-Jeremy.Jean@oss.cyb=
er.gouv.fr/T/

In v2 only the commit message and the code comment changed, the code
is the same, so the results hold.

Tested-by: Usman Malik <usmanmalik@engineer.com>

