Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794603588;
	b=cHhLC+ZYhnS+rwviBV1cdROT+hlHovcV4tOWPfMfznmkXKp897CcbImbmMNjrzDFfAXn
	 1Cm75324YIMBI3QuuKTolS2A2Ouzu+QrcJGT2lHBuyFu8V3sI0HSIGSjKDVSZgLP96QQ6
	 6KValo/Q4c6xccVIxd4gS/Dyv9hZYovLZ5AablzSki/VUdZtzIXmps2ezi8l1fLV98J00
	 r7ufwc5mWvgocwVCXIBtHXdM0PD5OUrk1KaXSefCOpbqZ07aN2GyZyxNr2SB6Bugfa01/
	 cGM+BkVh0LVtsQDyl2kIDviJ/1pK6yED+zr+1ja2I521VJSchDU9JFvsJcJBMKFXJpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PVwzuTDO0V0WU4xCPVDAbIib6qSF19SkXsHbfwUAYmM=;
	b=T2+GFIGMWJAq6KfwKWTRnIMJ75Z9DKTWA3xu9N7NpvEc+n02qHpCcxKvxDBufSavTJtr
	 pmZY8qPOZqHzLHLcCpmjnfLUNj6a+wl9sZKw24T70nNsQ8zsEK17uOb0rmmxDXDRHFoiJ
	 /3lotf1dwd9H+2gcFJ1aHhvb1Sv8CWUG9qSqJpDmgRvE8r2RlXU0owuAvXL/yUOSaoF+G
	 Ya+CeOMMrTvl7mi+JPNRjCq1wowE9EMKAAJp4v443BTxqGGdIe2ggdYVWf/z0f/96tbCo
	 I+fIQXSMa69iZB5+cADdFlezOS2OnuXR0MAZZtO27/PwIvlyoBQ81EUAO4XI0NT87RA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hOHmc9+K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E57606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2E57606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hOHmc9+K
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b791a4b732so42a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:59:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794603586; cv=none;
        d=google.com; s=arc-20260327;
        b=WRdpGb1EjiTLESRtfNpeYs02VHQPqYv82ySdGE89w+WxTSxjkDkRKD/VUz+0LAsulW
         hFF5+cSm9VhMCd+kUa4WFvXQsqfwu7aSol63KSIVY88BR+lsqw1GqfBW2+bfDNgWf2Gu
         pWj0e6m+4jwXCAZ6sKVQPfFazKmmeNUh7hTn+tZsZSD58W+LRJRsR1nghO6DvwvVtbw8
         Yc2lYMbu/O2w8TJ53pHIycSzEQodvjFGnA87qrTnYHdel+gyB+ivggMTIqKG1EQ3MrsT
         9XnNXACsuGD6cmFTz0apxEBw5IRbsixNUvk1PY4Sr+H7lf3uLx0b+ijg5d0Pa/31UXGy
         50Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PVwzuTDO0V0WU4xCPVDAbIib6qSF19SkXsHbfwUAYmM=;
        fh=L+CLo7RZsbIK4mF457jlesxuwyb/fKPrhJyljf+BTaI=;
        b=qPCuK7ylNdAbMZMRVE8qaA2ESHAfcw0ZB+Ky/0J5109AohpG335VUH0hpSWLSS8nVE
         liOZQuI4H4985MG03+j0066SssJTIYTPufFV8pkelysNtBHdDAsbGWVxg65qQ8p05iGL
         80l2TJHBgJkIZV8iTTOTgQL5LxUJ4sCxeT6fvbHGPf0w9XXGKRsYGxGSyz4YN9VNjIsH
         ZI9tfiePvmHMb6tEIzQA1cW4LNnk1BO7+y62GSmsiGxUDNpogrzs4Xu5t5fHGBrTa870
         NVZTq4NNbzwig5y6piASthH7MiH93dWO2EtkmN/QjxUJmISosBHLGO9mEt2K15V1uS6O
         ipyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794603586; x=1795208386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PVwzuTDO0V0WU4xCPVDAbIib6qSF19SkXsHbfwUAYmM=;
        b=hOHmc9+KqPvBvnJdzC/LRFJah8sA7xdxNc8h8aP+VpumV1tSIp+CrQkmF/B3ENgKqT
         xqA8FZCKCxhZVE3144qByWZmwp4c9sZD4pz3fnAPj+B/NX3XdhTX5m1e2BL2bBw18K8O
         kIcW4nDplJInC3Wdj+jWDTvUhBa5AiVJK7dGrVx0O1aXvW1X0aO9do7o5rMcAo/ilQ1H
         TiB6OYxRQUj/XS4nz145PP9Y3Z9Hqjg4WqFirv0SoTCxSpE9e/ARdy3zKdeOkaJpxrUJ
         uhSiEls3TlYRkLP7l5x/S888JM695ZzodpQJBMoEuVhQcbJ+lMF/xNC8H24ij7YXxH+G
         Na7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794603586; x=1795208386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVwzuTDO0V0WU4xCPVDAbIib6qSF19SkXsHbfwUAYmM=;
        b=wh69nbu2K3H8nZ2laYWEozvOfB1KMzLtm4o4YijNbh+3r2UR/FiHiyx+yZgRfG6MXN
         t9P1MqlusGFei8gXwnqSM9awEJSMPuzod/AqV/ytckaWRUhDz3t4VVOBglgbsPmj0XtK
         D+b1G4RHbKdGbHCqqb16WRRbzd4Co6kuRK4mFP6hDBg6TPXki4iZKrpauZ5P/uuw9568
         uNlqbKVFPJWVLher1JJIMTp9hkPWloZ9epa6pJkyf+cvaBYp4LwKhFjjXYNV+otShL3e
         fbFo1SJ3nh5fuq12qXvvQTf3MI24JnqrhDBqiaGCg2371z/90uwZ3mol0PujJU+UKu1U
         32yA==
X-Forwarded-Encrypted: i=1; AL+hErFdZyusEtrhta9yFXtbyXoaWpy0I1NE2HrmQ1euFzSbTcG2c/SZnsYxvG03szbclRnxxa3NCm8WsO+oPMU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mO0IkZ18fad2wn+d8ZCz2nPE776ACaFs8uEPfa6p3BNvgGmR3
	2hedhL8zAQZR/KX+xR2yXioyPGj+/QCprSYzPK8fejiUmLhwItKBgbS4b3OrfxexMpW8OHDnwbX
	3xebdpav4+Ije1Bb/nQRVyxQqHRu7dKQHG/dmARFn
X-Gm-Gg: AYBFou3ivjgIqm0stpOR3Vcd327QziNIedplrYXksjt8E7dP1aHfoYfvh1B3/UveFye
	q0ScNSLgK8qmJrOFztQTXy3JztSbLEFsdgb6EYj78p/jSBzNUtBPxhhdihkx7/3fAAqym920nhM
	VtfQXxcMv1dZ98ARFhlTAIGr1Ry8DG1aayzLrurudbS//x9f+eszRsEU7xyGqGjwzfFnukXhV0A
	vxjHZnc9Wq5PBgJE9Xy7IeyE7Y21iEsH/YGkWwH8EBAFElMJ18l8qSx/wxJqbZ41+iN17zP+s6y
	SXUGzr5zcLUFNnD4lGJrIaNxfM3ptAbSj9p2a4+psbu/q1Za3D/26czMRpzBO+HKoe5QcjrBLRd
	jvvLS9+wB19F+huw8M08MjbgZnyhwCpKIe+qsWtZGj5IxnkwJxaKRTcKMDDm4Rue+CBk=
X-Received: by 2002:a05:6402:a209:20b0:6b5:70a4:c77c with SMTP id
 4fb4d7f45d1cf-6b7e4cf7859mr4733a12.11.1794603585731; Fri, 13 Nov 2026
 12:59:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113101109.3227815-1-arnd@kernel.org>
In-Reply-To: <20261113101109.3227815-1-arnd@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Nov 2026 12:59:34 -0800
X-Gm-Features: AclHuK_bY7C_IwYzZFeSLAm6EvkuqLy8iUU-z8m05Hb5atej3z-uqwQYYqikjoc
Message-ID: <CAHS8izMEpOGj4bZYPHJW+WTnSYwimw6oZAK+B7JVPkrmf75a2g@mail.gmail.com>
Subject: Re: [PATCH] net: kunit: move struct net_devmem_dmabuf_binding off stack
To: Arnd Bergmann <arnd@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Arnd Bergmann <arnd@arndb.de>, Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Wang Zhan <wang.zhan@smartx.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:11=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The net_devmem_dmabuf_binding structure is really way too big to
> live on the stack, and causes warnings on my randconfig build machine
> with a reasonable per-function limit:
>
> net/core/net_test.c: In function 'netmem_ref_test_tcp_devmem_recv':
> net/core/net_test.c:1720:1: error: the frame size of 1744 bytes is larger=
 than 1536 bytes [-Werror=3Dframe-larger-than=3D]
>  1720 | }
>       | ^
> net/core/net_test.c: In function 'netmem_ref_test_skb_segment':
> net/core/net_test.c:1477:1: error: the frame size of 1584 bytes is larger=
 than 1536 bytes [-Werror=3Dframe-larger-than=3D]
>
> Since the binding object is never used concurrently in multiple tests,
> avoid this by just having a global copy of it and reinitializing it
> for every user.
>
> Fixes: 2285346afc99 ("net: kunit: test netmem, page_pool, and skb frag re=
fcounting")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I don't particularly like this workaround, as global variables are
> always hacky like this. If anyone has a better idea to avoid the
> last stack structure, let's do that instead.
>
> Without the patch, I run into this every few randconfig builds,
> which did not happen on linux-next before the merge window.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


kunit_kzalloc() may work, but it requires `s/binding\./binding->/`
across the test cases. Either way is fine by me, this minimal fix
works well too:

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
