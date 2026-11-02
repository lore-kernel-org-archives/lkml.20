Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793654904;
	b=XOAJH7C3jXufriuYguvwOwkiKxkKjPlsP9lW2cjtqC1guTmQiEUYmazu9yrpFvUKfScp
	 j6SUsaUQmB61L70YEC1Mh8DhA8uSOG5jE6VutcsgkMceoc+nRb4LlI9npkw9G5L2TgK1I
	 miFrvoMmv8TQZmu4NXGaUsGRrcwdmmS7iL7Q6+4dMy74Assqpbfj3UMfrxenHcckFl4vF
	 /zzB1jZOCh9AACwF+lzkASc9X0oaZ0iDuuNdLLS9M1Luxu86JW7K1iF5NAX9BUrrcqgY4
	 peABlJCUCqsBSi4mJMdGHaUcIvbgV2qpfjyaQwKWWRhMrRWGFxJxg8VEmKU3H823vyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=37I37kxjnkpufv60nnFSmrcC2M8I5JiI7AMLkywezlY=;
	b=IePeApvAk7tSELOjnN21chT9vzm3cpnRvDH0s7olH62OaN8KhM4lapcbsr24y4BJVvHT
	 qO0JeIFsIjBjA12N2Hlo7U6dfIse/l42xzNZCl9USEF/jOAjl8IkLWtoUYSGdljJF33rx
	 81pkXafM29FjWEey7usVZl6QnDsi8hHc1NPs2vhvD1EvYxbY+L4j9jQpgN6lBzXabOvuq
	 0Yy94ucWk49mhP2QkJAHK1Sp7mQvAZElcTEZ30y4X1GAvnC5Zs/VZQbck6pDmo1c4pfTk
	 vdXvxyvJ+IsrtlE/Fw5KVwEwXrhP+iOuCAqxLue067mq06/w6wqvpSGXYF3ebdDK2RQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=YGUDwrm4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC31C606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC31C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=YGUDwrm4
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c43373ae89aso531188666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:28:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793654902; cv=none;
        d=google.com; s=arc-20260327;
        b=k0F39RF62Hs7GQLXdGLFQKuRH8Fx905IMUpkuNQILAsxmxXAp4p6TsZs5cEcHfAn19
         sttqnQYEmy/9o/TomOilm3/doSsxQGYN1dTpId+47F/iQXuCojci2DD22H8lcvlfjQAQ
         hDcnLTWQXS1uK7AIH7hyg9fI2O2+kwr76VmiNeFO1SR+IP9ugIU/NCWwkBZMdqGB9yt9
         asdGjhsunCZQF3Ke9LwyUH8BfObLXwUOvKR2kK/wWnS9o6tb9NAz9G1m3vlwuQfFd1K8
         dBs8NJCnaKVGqbRUwy0QDBhF3V73uAY0rZNBlfx8MBTzER1UZotGLOI/8imA/DNQBSan
         DBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=37I37kxjnkpufv60nnFSmrcC2M8I5JiI7AMLkywezlY=;
        fh=nfsxTDgNx45WaiSdOfJB34qbQKZt7TrCgGJkAXsll7o=;
        b=WlcvCkNY1etmzq/+5Y0U7pfopawlUl2NRqDUwRtI0YzkYf1Cm1Z/YOJyBIJorgaHNh
         b5q1itMxMzOTqAASB2ZdlPrGoOqPu6vCZrrMuamyXmp4Wd06FW7Gn3JW88jTmGcuT5eQ
         C0sfrfYlM9+aCZ077X1AgmXtucj1FINsil+r1GTu9AKYLHffutnnPtNQWbQMDTbVU5C9
         BuBwV+cIKF8nMKgsRZkA/NiUnrB1Cu7GU6AZcwycpX0hn+zJqxoxa4t47nu7PQdx/KmF
         aBdSqq9+EFxiX3RvwviP23VyBmYt5s5Z1TAzNx5Ja7a2RFwaAGfjjbIa3sUhnG6XBaht
         nX2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1793654902; x=1794259702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=37I37kxjnkpufv60nnFSmrcC2M8I5JiI7AMLkywezlY=;
        b=YGUDwrm4caqQiyVq1i9Nlg7kypsuHhbEdhFqMYOUXfQ4x4ZCwo+SK1/z2fXrUSo4v6
         iIeLT6Tdc1RQlZWPp3vjNV3k7EPIqX2I5e6U7zE9RtNU9XaNw/SOb2DwNtGXNeYZ8a3W
         JTtzEldhuLQ4GjgXnRM3VuxEhfU3BodEo6iiLA5ImTPflK0PyO6zvI/wBjlasONFZ2YM
         JyFHbbMNWO0sG8Re7Jvy6tuJMdhQ+Zp4EVh6L16IAPlda2f8OBZCqbZizkfFBuQi9rLP
         VmIK5OT0/sxP80xZ+bmbBhXYsos01PTS55mJaPdOl+QxZegxioZVbEq65g9svGPs3k/w
         WPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654902; x=1794259702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37I37kxjnkpufv60nnFSmrcC2M8I5JiI7AMLkywezlY=;
        b=isBaTMUHpKmtt1hfStooanJo4LY8j6p1jEH6RmInpcSGxMh5hoZiJTM4DzDpMyEzVH
         7feGOIGT63XHeeIlqCUE/uzMgF4Ndd4613+jFqrcN2wDNg9mosAPRD51AcMjuQUP37gN
         rXG0Y71rWRyQBd18am4G7spa7MbrQ/hEhM6YDqfNdZwOccv7OFYOjUX2T6UqLoU8i6+d
         g1jTMfBorktfByD3zeauOU79fJb5aRsvmjFMRLmFxRGuareMzrNxUxPHT5WHWV7LJMtk
         u9DbMvlWkNbeOF4i/LHwh/BPvhVagwy6UNOCQ6lRW9auPJc5TOTRn/OYgUI6/cjQGu07
         wnhw==
X-Forwarded-Encrypted: i=1; AKwUvBykWMPWGyErdNRmTHJhbYbSkQRZbf8KwD45SWbb0g+k0eeA9p3FrBez2y7h/rYiMEo8u+/ioOHBdMatUFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VD53yoC8HuIy6ZuJUJlQLsZl6iHveJpbHcQDxnVmn1bFgnD8Z
	QP5COqYbFpS74IzWxUvgISzSEsOOuYjCywBpORd73DqfcDxgSvLfTe3RcaPSm5KiLLhXS4Mu+M4
	Ru+3bhU8xPmJwJv+BCqc1s5u9Z3/1unr+BHWTwy+dcg==
X-Gm-Gg: AYBFou1/iT8THT024VWxLREFMCeJyIlKuPtXMYUynLtb/iaRMKJPZZBbrQXUQ3yb5Ms
	DUWbR+iKCRikWXNZFXDVJIj/JMI7bxLP/xzg4kxkwf0KSf/AmNQhyunyAKsRC9ZG613YnJ3YjTT
	eHe3BoHGB9sFUf3nVx6V/6DPQlFT8RxQB6663LE/h70hsDCIykBMkSU46/SGkzP2UW10kDk1x7q
	lnnJYriKTGgA6QlEu8n7TVFlFrZdogARrnYz36aK7xEi9AfVjkCXGonXMF8d3DyswnwO8SwLWXE
	Uw1BM0cLGWe0CCVtqF3yYfmGlJLu7LlwFKoIIjI6lm2+zsFg0g93IlKLi/79bSZ0odrRyWzgJUe
	nQq6GE48rT+BHRlMNr1GzqSgiOZA+d16L0qFgDGZtn3LKIRhM3QpLzrS6z973eR/OF2cY80JO6d
	ci3yZa9/3l+XY=
X-Received: by 2002:a17:906:99c9:b0:c2d:c247:5400 with SMTP id
 a640c23a62f3a-c4ca7b405c5mr892947966b.27.1793654902069; Mon, 02 Nov 2026
 13:28:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260902124026.1774575-1-max.kellermann@ionos.com>
 <CAOJNxRJ9rUZ4JRwcqEtOPu97D3NNsjwV1mniM6LdNytRYiA54w@mail.gmail.com> <CAOi1vP-yKSeBwA=269uACaXmmfX+Bpjwk_x_uJNOtRtohH=ybQ@mail.gmail.com>
In-Reply-To: <CAOi1vP-yKSeBwA=269uACaXmmfX+Bpjwk_x_uJNOtRtohH=ybQ@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 2 Nov 2026 22:28:09 +0100
X-Gm-Features: AclHuK8Fp7ROZ027fzJ_D30OkjRV4Gj_9sSayx7R-Ne65Fcxlkky1UZTTEAAqpQ
Message-ID: <CAKPOu+9=4MUMvZt80T+Kxt_+B3MEpWUTZRnW=LJShBJyNTw79Q@mail.gmail.com>
Subject: Re: [PATCH] ceph: acquire caps for read_folio requests without an rw context
To: Ilya Dryomov <idryomov@gmail.com>
Cc: Xiubo Li <xiubo.li@clyso.com>, amarkuze@redhat.com, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 10:01=E2=80=AFPM Ilya Dryomov <idryomov@gmail.com> w=
rote:
> Did you get a chance to follow up on Xiubo's comments?  Particularly on
> whether the data corruption aspect is indeed gone with EROFS switching
> away from read_mapping_folio() in the upcoming release:

No, I didn't take the time to verify Xiubo's reply, and since this
data corruption bug never occurred again with my fix (and I had
stopped submitting Ceph kclient patches), I had no urgent reason to
revisit it.

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
