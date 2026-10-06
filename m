Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828182D837C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 01:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791248954; cv=pass; b=NdqVmvA0jBT42l1/ndUkkr+PxTTOI4gQC90ojUg/sPohTAf9z3B0kExlfFEFe5O3+cu0/MHwMR5ubYedARcZ5DZjpZ/mqbgGNV/y7xYRQ3iGMCuDlP33qVfMaXohhptRBAZYJNT6+L0tdjQHmxcVZPJne1PNvrnQEJqMZHivWhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791248954; c=relaxed/simple;
	bh=FQPZMOJ4kPISPNG5soX6XJknF05kL4vWkbTpQ6PZ6YE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qp3tpysTtXTEelrAUPQeyRzsnkrLW8xviLYdupZKppA2QTNjQm96auS3vG04VHchHZU2dn0F1OF19ZmrubRsPF78LlT/fewCey8e4uEKGZE+T3RWv76U+wtdlRNk04ED3ETroFJk2uMV+068c8RnCXQh+LbYZrwttqN2g3F52fE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gD1zBwY6; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gD1zBwY6"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5bcc6500a7dso879042e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 18:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791248950; cv=none;
        d=google.com; s=arc-20260327;
        b=byGFApgerMFbkx9uuzwehJzJbCg/xKq+q99wTiPoTIR8iBzQ4bnBksrQKlBlfJvH2W
         Egg47nD4fqD4EsUH+TAvtTPBdzh9nrpopOETpS8sA7qBsaHEbQGWn8vwG+4+43j9Cvkz
         +X7ltt5fBcAbEsxYaHp2hlNALkOV1sZZ8A9U3S6HvHaY6eywb8k067DBhT0/IOQVm3MB
         lCtSB3lmps+rSX26trkreir0C7ew3cHc/zR3M0z2VUDU0lZLCPjNM/jq4jxnkxB0Q//9
         jx/kpMP61fN3YZDFl1m6ZKoeWLDV/FHGkV9FPrikoFALOMIuC1+cLdGnIaq05PIwtml0
         QPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kkoJa2a5Pb+V2YqC92sylMEECtxCIMpFTVrO4IIataM=;
        fh=190epMhe4/hcwvd9qdbSvTSXvbrKkwrC6RBvFOHIYxo=;
        b=JjSdigrIVmYS6NFbZdlguQGzxsEcEzXR4B6ry9VhPBPmTbwYxCoXOz7icpgIKMoN4p
         qOY8Ulypy+8zqypS06pqSROXQYlZGvaM47mx8fuGMy2CGBNJ00BmVvebDYvty89t/K0d
         uotVphG3yPf45yreEwAmNkvXx2rp0GdW3ij4gx04o6l30CEBbiBXCZbIsP9YRwB+DzzH
         +6cS3E4/HFhzJUFXXKeOCvhyusfj282ZNqhYayJn4qYsTCluqbyKUS5kor4sVfQX9XkL
         g03h4iUHWyWGX0pqwSq+5SZDTbWm9XBmSMdBtTGtCIW8SF7hb9/Z41Rd7DFd++FA1V0h
         2FMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791248950; x=1791853750; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kkoJa2a5Pb+V2YqC92sylMEECtxCIMpFTVrO4IIataM=;
        b=gD1zBwY63aneQEdRWI9O2+XhnWcnhenMpHkzDzfmr+2Q0LFpCQWs1J5ADzGW0KIPCt
         TOVS/UekxLDmL8+mKDkGKcZoayDRSgPcaYe3huif6OIc4UFMTbeo/s7sE6I0e5mM7VJP
         MLbb856XtAlNuVJ37tpT385z3EfGY9bqI7JBkRjVo2EQYN2brSintBa7xGik1bXmKiMV
         Hj4jG50TAT6qRMV/bAcLy5cDg15aUa8iM0fI3YSrYZKXwKa/2D5HUZuiACWPFyS+n20W
         QrSiwLGMTbXOqMLQ8na9nYcMRMPtLKzWDcZg15qjiZLozv4DR73uHJZy62lPzFmgxDja
         3w2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791248950; x=1791853750;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kkoJa2a5Pb+V2YqC92sylMEECtxCIMpFTVrO4IIataM=;
        b=izlD8m5SCdsqqbZ2dlbCyKx64LrU9rlhFfEYmYG28daGSs6qjc1mbaspPhlz/jg/QI
         DRounuHwFpqa40SEBznz4zWnJFclhb3nxHJ5+62GMu544gs+gVLniNLGyYYorIKH/jGO
         F0AcNVKfYzk/gT8od7GOVkrs+qx9nyfTHIR2OonishW4rD/mAO/waLhDUDSNAwA/92eK
         yKcpblv2L4Hyoil6Cg/539lTev2UaZAB5T5s1fkezRXOIfjXfABBxfrjZj8QWs5ZS357
         HGV4VUJeCCE0tmw5OvSJa/4ytqUYimsDVWBZS18AVWb5CZCJtZSiAg5QqyUfKtj5ln5A
         tjrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwi+nW9KNb3WnaKGWdsONsbu2SrAdI8fYmiAasxF5BqPRs6b38/MfBYAI9ZiQ2gRagmCl1I3mXhA4tHJAA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJ6xEzbpkJAbgEHV9hAlXtc0D7Kkb+0gs/ePHllBEOVlYEq4G7
	YXV0/DXa/FjJOqc7prMOZjsvYuGIcRTGDTPp+cnVhjFwuWl1CvG5VKH0WAWzKv7Gn99ZyOrU06+
	xSanhN9dyzl+JPJR1ki4BVZhi6qBB89k=
X-Gm-Gg: AYBFou2sTCHs1pUiEvfcEJuI4wFFgvmWAz4uEZ6w4wsuXcBJML8dsrVW0x2VMBQOCiq
	yQ+Miprgg0SU6QIkACPgsYKUAMJ/QYB0+qvwQDSdoKq9MTHfvqEJ5Tkjnwt3qCrs3FFnQ69919f
	I6i/Qbgp8FiqgysQ5/h5CMolLdrmbDCr9Dn3m4W8qtPOIjeKYyY2OUD8LiNClERjzAxOpoxsL4+
	08ofxweBe9PXrO9xTTCiwubezwDld9WVLRyAQO8zbIFmULif/QUzRHZGlUcfADXdhYwvru98vRr
	78hieHtQlpL3343wz1sPFoGjoykLp2ZGgJOIYNf+GzfJlXWoQJzYQFJA2S1+YO/ImPSmnttugWN
	OPCXbwk60bAA=
X-Received: by 2002:a05:6512:2523:b0:5bc:b091:e78d with SMTP id
 2adb3069b0e04-5bcb091e7e6mr4148625e87.37.1791248950470; Mon, 05 Oct 2026
 18:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930112842.21323-1-sigefriedhyy@gmail.com>
 <20260930112842.21323-5-sigefriedhyy@gmail.com> <20261005164946.25da19c2@kernel.org>
In-Reply-To: <20261005164946.25da19c2@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Tue, 6 Oct 2026 10:09:00 +0900
X-Gm-Features: AclHuK-bztab4w1lM2DovGlyn5DZ8ZhMm-bLH4zjSTjG2-Wv3eC_T9ovpy0ACZk
Message-ID: <CA+7S2v+XZjnzxpucTBAaKqLp8FtF92cyHBbrQF8G5D3uT3r8Hg@mail.gmail.com>
Subject: Re: [PATCH net-next v9 4/6] net: add AF_PACKET multicast dumps
To: Jakub Kicinski <kuba@kernel.org>
Cc: Ajay Singh <ajay.kathat@microchip.com>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Kees Cook <kees@kernel.org>, Kory Maincent <kory.maincent@bootlin.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
	Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > + err = dev_mc_fill_addr(skb, dev, ha, NETLINK_CB(cb->skb).portid,
> > +       cb->nlh->nlmsg_seq, flags, netnsid);
> > + if (err < 0)
> > + break;
> > + nl_dump_check_consistent(cb, nlmsg_hdr(skb));
>
> Why are you checking this on every iteration?

Right, we don't need to check it on every iteration, I will fix it in v10.

> The changes still lack polish IMO.

I will go over the series again for v10. If you have something
specific in mind, a pointer would help.
