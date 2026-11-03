Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793730991;
	b=FVdeSGegZJWWF1nG3l5FX5r1KN4hq3Eiz1qoRVY6kbWOLPILx70Ci+B/AFNBwVBredFD
	 mUr3ZEyT2KlE0UH2apA++m+dEXQtuo/QMIkCcZTx0qMp4NGY2smxge4aO/9B8h/VJYJT/
	 gmRoT6fnjylYjk4uuRE9oiM2wy0Gz15/MuT/uZ/WMTs7dy50TqwsXZSpc+IMmb6jkRK3k
	 dbTzLLTtfAn0iQfkLoK5YZCpJMOtGgAuADp/dB2DumttoKcBHhDAUB0c+oGOysEL0fCih
	 6iGnbOOPoE3y2LB7cWZ5OaQrl/XiQLm51Y2Q3Sm/JTc/z4I6ZkdG6jcegRZ+1aMX2TA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730991;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=j01sPplkCpeqYoQ1XyPHZ4w2xiW/+AulZEOKO4lkg9A=;
	b=HhXKFOs7LlsDjOh4RcoDvbcX26svLNyBBSV/GGYUCXPh24vZUVehZdaIV0PW1GqlePv1
	 M9Zw5F8NQoDUkaqbh/PJbIScW4DWPs/KW7ObXAUXjB8py0DLozFc0w3qhZPXLw8Pbhsd8
	 6u45IkhdX0Ext4gSZG+NeCddfg8uREY8l/GVuwQGU5Dq3oTBQXFhf1r+iVzMCfHGeEwzx
	 R8I7tYnnxsXAt9QjB2t9Gno6/tZe29YlNu0bN47fuCFRG6jEIiX9T00xjY7bnlM770ENo
	 2/HltsH3QEBIny7a5lZStVS2DfWaAhrxuRy7BERNujp6aQRg7qJhdMMhyKLxrViq73A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DuRrYOC1;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Rh7PXIZ7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062C7606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 062C7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DuRrYOC1;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Rh7PXIZ7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793730990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j01sPplkCpeqYoQ1XyPHZ4w2xiW/+AulZEOKO4lkg9A=;
	b=DuRrYOC1dngAPxnW+wVbTdNu2r7WtChZ71vj8fbMlt29KuG9frdcPG++14zj0NTu5WTeTi
	pWkX1MO++ohdy61mrElr3ezID2znh/oPZz5s422XDf85VKi1vJ3PKDpiiZdWVCFgMr+JgC
	q/6Vqb55/fzqVXZ+CpTFzcbBE57GK3o=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-Vu7AUWfAO0-pyUs_snjHgQ-1; Tue, 03 Nov 2026 13:36:28 -0500
X-MC-Unique: Vu7AUWfAO0-pyUs_snjHgQ-1
X-Mimecast-MFC-AGG-ID: Vu7AUWfAO0-pyUs_snjHgQ_1793730987
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3acd4c7120eso10487831fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:36:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793730987; cv=none;
        d=google.com; s=arc-20260327;
        b=CC3eY1/O1wHdj6xmKQnthApwi26PPEGwSbeDb3tC3sFlShEI9V9kk3fvpzuHIiFVg2
         8R/NmkxFvcVbqI7+RTdcSxCM2EUulTU5uygnsoFulLweclKSDTW1FF1YISH140WoM0Qp
         ewU3915f3PueHD4aFS7tzM0Mk5yreIFFdrHk+lqXFa2GQLtBKbMZbBic6/2KWzNr592s
         P3AZ6K7IoU2UZKTW6KuN7R6Ny97EF07y+J9AkZLfCxZogoosG3jrhVGmQESV1sHBl/Ch
         BGb2HGLydwwKabhyCSZlqxH6tpxsLMzCdie/VkxHX5RN6rxa9zu3nZZSNWyHFEgVAeBq
         beoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j01sPplkCpeqYoQ1XyPHZ4w2xiW/+AulZEOKO4lkg9A=;
        fh=fM32tKAARaC+w1nCLJHwZxblrfTLSyHq0eBi0frSKM8=;
        b=Trsz4Hng+yWXU/1rfWe40Qcnk0RhiCycWh7twGwnaRw/faxCxgVtReJwV38AheOlgM
         ygx8ljZc6fXD+b8rxfl1RGjyYkdUWqpKWhAjgqD6UHrOCyZD4rDPFqLRBoXU01TRCcnU
         konpePC1JscWaPiXM/ouR4rmU19T4jQd2LSGp2CfhBxp6ZLk+0aFYkJrANxFhCL9r3s/
         zOlsF8PJhzwvZ5h4DjOhfoPptkX1xI3YVb0+o4dQq2kizKUBYGf/jAvB/OMuMTh746LH
         BYC+6uIMYSSLocbSUEabJSiXv+hlbAFHNMMqxsFc9pk0z50XWiGDhLDiIHHiqcq883QD
         fcpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793730987; x=1794335787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j01sPplkCpeqYoQ1XyPHZ4w2xiW/+AulZEOKO4lkg9A=;
        b=Rh7PXIZ734uzcAk1ghkz/oF//TUWNxVSO7PnfLA/prSeJ+d7td65UScIuZx93maOii
         Egaf2wlL8laL/y/TZmMgiBSsKzICpeqrj5SDbteFPKfecqPO7+jeb+/JuhDtACwPZTFl
         RdHqqQV8svyxSaBYb19UeqHfuQQhyXzY8Do7sdQEnMJZKOMnqO02eKLNGUBpnYyPWvJS
         jsn3Tm5U/ECL/05esCIDWLpA7/9lSWxWNEhlQSueowcKx1VOy61GtfLc+XWXOT9vIeJv
         G6oqEx7A3jtxAW3Ca9m1x5zgtrL1z38GnI4xms8nNMMLMtAn90gK/d63sgPhUOr8thDI
         u8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730987; x=1794335787;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j01sPplkCpeqYoQ1XyPHZ4w2xiW/+AulZEOKO4lkg9A=;
        b=jGXRs2kVLfjvvcfr7DCu5PZOcIefINLv1SNsDbNdCUTbfXJZFC3M6pZRBa+n1rjkxG
         R/5hv7MkuxsAWfjDQk4vk1hsEdG9FiW9ELRfHLcZMOjrD7azPouGix9/T4LLsdxJrXFv
         Yb4/ZHH3vshj5DZGLyV/9CrMuybyeDIyR62egGt8NfvTPlXGlsbFRLOpX48YopF3m9ul
         pA0D91sMgSJQrK7u7ln1EmfOYPE412JjCi+x2K59PZIL6C94fXLWo/YQ6lA0FrGj1w5O
         +KL8kAY7fK7J4r/2OEwAW4C1xR3fQV0YHkU8jpIg5dge10eZj8e2VY5xPvClt5Bs4mcf
         5ULw==
X-Forwarded-Encrypted: i=1; AKwUvByE/qdMFaZK76EU2RoCrwuJ29Z+sEifKzkqa9+6chAV5MIQ5Rg2/P6DZcyjQw/HbZ5Ar7RD/zxyekVl3vo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rT5iJkwtYPFVkQvisPU8gNKjXg4NOwvVvR3YYsBL3+TO1N17x
	/UMRQuhg3YRTm24xzy/7aWttrpyqQPc72IXzDlsyD2i7nkdngVZrB4cctJ0VDktm9ZOQdZ8gxxz
	VmReKpXxNcyi3BAHvzzO3UrcJ/l21QJw20Bl6EHj0vXcfKeXG4chCkF3lhaubfaT3TaQVlDxvKX
	L9ce+TUbNU6rkog3RVCjuMuHNULfVQMe9rGluR2kvf
X-Gm-Gg: AYBFou2rJFwouiVH2azC9iZe26Oq2Os76sN+j9FnJRVwiQVS5uvMZtMEqTcSUI9iimZ
	/eX56I1U3l+9MXTGzf9S8WoIf03uhscl0I2kKIpGWZNG8FjJgtngT9HChxt5iGnZ7CPGJna2uvZ
	SGS+4V6xFonna1B1zKHoelJqdg7t/0BfV1g8R80Nhpfjqk7RfnU6nI+V5p
X-Received: by 2002:a2e:a883:0:b0:3ac:4ce6:8b7e with SMTP id 38308e7fff4ca-3acb7b4dcf4mr36387071fa.26.1793730987138;
        Tue, 03 Nov 2026 10:36:27 -0800 (PST)
X-Received: by 2002:a2e:a883:0:b0:3ac:4ce6:8b7e with SMTP id
 38308e7fff4ca-3acb7b4dcf4mr36387021fa.26.1793730986742; Tue, 03 Nov 2026
 10:36:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260818140746.1913226-2-Jeremy.Jean@oss.cyber.gouv.fr>
 <CAK-6q+g8ZFFWRZfhW5AsKM3_LcxBei_RdBfxgSdsa=x8=7b+jA@mail.gmail.com> <868a092d4d27c0f8999057916b1de4da@oss.cyber.gouv.fr>
In-Reply-To: <868a092d4d27c0f8999057916b1de4da@oss.cyber.gouv.fr>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 3 Nov 2026 13:36:15 -0500
X-Gm-Features: AclHuK9184TyvecLrVXGuMPslSGYXWlRccRhA098qg00_x4VCfICGj5GbqjeGHA
Message-ID: <CAK-6q+jPTQ1BXP5NKdFXSwPjXVimgg11oFBzvW-T787azxWnag@mail.gmail.com>
Subject: Re: [PATCH] dlm: reject wrapped messages with oversized inner lengths
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <jeremy.jean@oss.cyber.gouv.fr>
Cc: David Teigland <teigland@redhat.com>, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 3, 2026 at 1:13=E2=80=AFPM J=C3=A9r=C3=A9my Jean
<jeremy.jean@oss.cyber.gouv.fr> wrote:
...
>
> Hello,
>
> Has anyone had time to check or process this further?
> Current commit on master still has the issue.
>

I don't know what happened. I will resend them on Friday and ensure
this is applied to dlm/next [0] soon.

Sorry.

- Alex

[0] https://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git/=
log/?h=3Dnext

