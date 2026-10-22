Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792643310;
	b=oVRQrKlZ7OeP8mtQovA5F1QQa4VRggyPK6JMlMj8vk+J5jQ5VmIC3Bnhn1Ve+ewv+lhy
	 b+pFk8vEAzc6mrANRVOOtHAcGHW/grv2RQ/psleqNWNuDFr+8NRc9+DC9JIUQaTxFDNkh
	 +lhOF/BlgtlPjmezQQ7CKhq0yP2ofE43KRQHFUWv+zBtRp7+rbe8G9dgK4oFkmJqzlOpg
	 Et8cdIX8yFHEuw9AAg21BTSJ695ejFMiBqVa3T1t+52qBOZ/Ah5INGrw/ALlPPQnUQREJ
	 eylI4gde84y1kui8VVxb4DMrXytlcY/6RIO73h2IJw0Ob8O7rzyv3zGd7j8pvRjbQaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792643310;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JihyxIzLjvnXhxbKdnsU8Kp0oaWDTKIRNra+zU/7tSE=;
	b=QDilRfa0sr30D6UDSb/GmmyL3n3JYBF/xun8I5tFdimplGWkDlcPT+/mrnXTPVsKdHi/
	 mqMq0MTvxCOcjXJbBiEbh04f1BLOR5upbf8FtJ8L8bvgcsz6MMpy75dSCR76xkoiuUsov
	 xZpnY4joQZvnAWMgkSYNX/Ccw3xRicLDYyuo1djfBADC90c910eQm0rQUQZ6OvbYP9FhI
	 kknej2I7v34vCHJMr80mEGbayBZYRoUORaMMxjn7d5oMw3n//VvYbEjZn3KMVVjHdeA9k
	 6M86SzEcNoGlxnXhEVwvTpIkK06Yx0G88zGh65SAjHQQhQl9fltDdLDooUR+X15DATg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A304E606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9321F000C2
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792643305;
	bh=JihyxIzLjvnXhxbKdnsU8Kp0oaWDTKIRNra+zU/7tSE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ljBHlRojo3Otbiewv8zIxqKrtp+tyJy+dT3Q9UQPMZUb6zSUsX/Yo08tMWxN5LTXD
	 Tz2p3AZhCzZ3wHGMDBIcFTnOp07xH+5ha5T4dhwyjwcvisl3WFQvwBMdZ6OZUR2TAf
	 EKMUdp1kCx2pBODspRVidavxNid0ij+bEN3whm/8Pg5Z6FHAdGxwULmSYHjmX3RXBM
	 Vn5I8x2v3adYZPUnXpvJYtve/ZnSh07QQBZof/+C4biLSOJE3TS6M+ksAlz29NiCb9
	 JlAiKNxK8KuuxTEhZg6gWqIK5DeFIshf/hkdemLqYIwvFCf04gNWMrLLStpsFXvxl5
	 moZzaBr/3LYLQ==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6dd7070699eso999023eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:28:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxcUSGnPuu/r/kDKDrI6TzqIWalKB3ORW7G87mFTKrxklaTNf5BE0xlAgRaCrPSkrVD0Ir9jLa8V2rnpkQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgs3VVqtVkYIkSMcmKutdIFTSoZU+z7F/OdWl/eExPyjL88SRj
	ladktr+YCXaWIK2HuUeK/A6AVQVz/KZelI3v4bAIIAMV6Wx0dHqHOauV4QWkdiHQqhkp8vBd2yu
	TlcXeEFOfrlQIkmmXt0GSGJnb8rxUPqM=
X-Received: by 2002:a05:6820:4cc3:b0:6c3:19de:d1ef with SMTP id
 006d021491bc7-709400b7315mr2549029eaf.20.1792643304627; Wed, 21 Oct 2026
 21:28:24 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <BYAPR01MB3830CECF5D0871064C59BA0280662@BYAPR01MB3830.prod.exchangelabs.com>
In-Reply-To: <BYAPR01MB3830CECF5D0871064C59BA0280662@BYAPR01MB3830.prod.exchangelabs.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 22 Oct 2026 06:28:13 +0200
X-Gmail-Original-Message-ID: <CAL4WiipTihtytPEPj5cSY+=t9NwRwRTfUQ_efCSWPT7nQ=0K0Q@mail.gmail.com>
X-Gm-Features: AclHuK_x9x-dpxJb47_Ejll7cdrs3Kd_pJ6JEFAwdGO0NJ9AJEIeXNJiDE4pBUg
Message-ID: <CAL4WiipTihtytPEPj5cSY+=t9NwRwRTfUQ_efCSWPT7nQ=0K0Q@mail.gmail.com>
Subject: Re: ZDI-CAN-33367: New Vulnerability Report
To: "zdi-disclosures@trendmicro.com" <zdi-disclosures@trendmicro.com>
Cc: "security@kernel.org" <security@kernel.org>, 
	"maintainer:NETWORKING [GENERAL" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, "open list:NETWORKING [GENERAL" <netdev@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 21 oct. 2026 =C3=A0 23:47, zdi-disclosures@trendmicro.com
<zdi-disclosures@trendmicro.com> a =C3=A9crit :
>
> ZDI-CAN-33367: Linux Kernel skbuff skb_zerocopy Improper Ownership Manage=
ment Local Privilege Escalation Vulnerability
>
> -- CVSS -----------------------------------------
>
> 7.8: AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H
>
> -- ABSTRACT -------------------------------------
>
> Trend Micro's Zero Day Initiative has identified a vulnerability affectin=
g the following products:
> Linux - Kernel
>
> -- VULNERABILITY DETAILS ------------------------
> * Version Tested:7.3-rc1
> * Platform Tested:debian trixie
>

I had to cut this report. Way too long, I could not see a patch in it.

We were fortunate to receive a report with a patch from another source
one week ago. Patch will be available soon.
