Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AD247F773
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790034756; cv=pass; b=Bx6XZKpo5cRxxlDQjAMK7l9FYPapZGm3e10z/LsoLq8CWO9KexaFqJ3tZzlj8oftfgFjFMamp0kjHoUDmDNonPbXXi7LvBw7u8Q+18bHkgCJb3I7QylXZqNZLyZ/xTYmdNTgWd9XfMfKqq3COA9O+fuvIb1knd8JiTwUhpgAeLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790034756; c=relaxed/simple;
	bh=nzpQT5SxsdB/xegC8rYZLk7oxk3ddENzDmbUKGnvfVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJ1XeNFkvqXGGTpT0KPQXEEev9FJswI1PDF+hlCBpUJPCGWzw8icnah3YsSui9YWOjYS4AqecBAhkKuG5nboUDRxqwZWBQsADTvfBSPKxTt0aEMOe/bxUa2U+mxJb9XtG1E3OE4EStNcAJw5XjQy8qJ7IErdSXq2WocSElBkVlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AmP0OyWW; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AmP0OyWW"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-486e1a044c5so2498870f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790034750; cv=none;
        d=google.com; s=arc-20260327;
        b=o2//4GXm/+5XDyEwIf2yNcDwPDCL7OSk6qID71pMYZrz5s+qjKZ3vnkv2V8bq63rkS
         eh32BMY83wzckgSSUPqbreaMKSwmp0F9ZUp2eyqGczms6sdSfcSHrILX3r+c72aEwjJt
         fqkBgWUN82otyrhR4I3Pu+DrSSlH2r4iH86WMLkejO3nclUb2JhZQxQusNb/CDU1HjfM
         HiutTnX9SyxtNXIB1R9lCTNna4kfcQwQ9Krba5Nj5CK25f61NVIngBdYPLJYADoj/W4+
         yq35sirMramBLFqbytBj7F1YI5Z0skwpykWRlqDUiwNWV8kEQG89RWMjE2hB1Vrs42IC
         TrtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nzpQT5SxsdB/xegC8rYZLk7oxk3ddENzDmbUKGnvfVw=;
        fh=3dYpPK3Ro9LFJt6UeA07OnhzgfOybQT+9SyffsdCKkU=;
        b=UTZGrVQD2Vy25X5sIuGKVbUxfuBtiIaiQHJTD5WPpHzXtQOIOg5GMN8NxgSjJ5LFQI
         SrDS6fnOhvWkUT1en8LRX4rLhfA51/GAUbEUHJ7nJO3EEzUFxQ3K1qy8dW3XrxfQoBB7
         uMZAmtr5KgAkiwWNSBCbTWCoAWODtNmPrWkTiTCqeZFpvR/WeQu+FKXx5LfAnrFVtmka
         Nj9KaeKES7IS7RnXfOuHE/YiY0E1tcagW6x0TEnVcOFR7396z7fpxKDe0RwkRsf8Jj+H
         hOlD+dbI+KU1D0fRk0/uxgjSCWEXt3OypigQNQdtuW7KHvBQH0KomDXjMLv0WGWanqQb
         lBFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790034750; x=1790639550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nzpQT5SxsdB/xegC8rYZLk7oxk3ddENzDmbUKGnvfVw=;
        b=AmP0OyWWxgWWBkREgD75gXRVUal/Zz5e7aP9gzyLaaMKHhltPEE8qe9lDgqvFC8MHX
         Qt4VduenHBLXejvpCk5THEw7iU3JlLUVpXkLU4eMM/CSAczrBbn8/Av/2ejUAmLzPtUa
         no5DzExMjBlNSeENmpjc05eN0BQZApvyRJOPx7jT79v1EwyNbxUKHqV835q9LySg1g0c
         753vtI1dvNvB+aBqorRgiLtEfMBz6TrXcazCq7pMNcZ/5fMQKCEfROgb0v5uiLgvy8A0
         GO1EfeQWBBWmPD/7PnsIoOaRh8Z/BKLLMaL1MMgw4i//RK7MGmA2eDGYTShxIyOOxLiJ
         uxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790034750; x=1790639550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzpQT5SxsdB/xegC8rYZLk7oxk3ddENzDmbUKGnvfVw=;
        b=B4uZy8nPQtyW5GBlkkhKkXa1SOaNk06Xqz99SwWE/n9sYdzGnmLnGTTwn3KY0oLOKT
         qJrRSQ0yUjVPgj7/FCTC9jnLC13Ze5lTByrv1IkOAf/1mkKaVY1yo9RWvinwpmb5AXcf
         H3mvImTD5Tle+I38g6hgYO5nTTg6CO1I9YxzmAYWbMiIS3g+jgs4fovVTk0U4rz1hJNF
         /g0uvC7w2PBkrBsxp9Fj2DN5CXy1ofzVwS5rOLeSgODivi/ryrBluOShar2EC7vbfhoC
         Kbh4AJysUN/qSEvebyRdTV4xuI3oBDVDJnz5IhcRVp+jTyythjQ/1A+4fzuSjQHkihIx
         9WtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAaCOOS3vhV8krjUCDC3yTTcznIy2FaG9q07rqBojT/DQOM60gbBYwKcMVRWGT8sE6BLLkkIhERNiJafU=@vger.kernel.org
X-Gm-Message-State: AFuF++nPopgq7pbOce9U+imZyb38lJNWgXx/EoUkdxcce7DJNiOnbDdf
	haAjIw0qo5XJeI119Jpo5BT7zh77H430cJ8nXjoZ/vTeTa4lpd6w/WCmWebZoDYYaeIQHllDdXQ
	/GLgL5qofOWlxTWFYfqn7p/rr40pUuNl700kfK/7C
X-Gm-Gg: AYBFou3ITDaiZyNhm18XwiuvrecB3COrgYBBcoC+6ItkvMJG9z+vPC8xK35xl8paID+
	La927+8yCk8u7o+CVASMtDyuk8cv69TDVmyE2211cQwcODYqHtQFMQbY0k7YAlBtSelihFTVbX1
	bnBdRBoSvNaDw8DOORq2PM+gnW+UQ9Qd27YB9imQ7HyMWjn1hngGuqt74wOBlJFz5gldIBgqHzk
	4fnRm+CdHR+dnV7IRhH+qyZZvvobLfSkLfG+5s28oPJFdS9fUtPYWIlny3R9xDtRtE6cn59nKCM
	LYg+8yNKVoPdn3zjTlY61GODWwImfNgt8SU9vwwRJSr2popgWOYlaWLAZx8lt9nigdnV9NBvUMi
	uqf9YrxuN
X-Received: by 2002:a05:6000:610:b0:485:8c16:5ef1 with SMTP id
 ffacd0b85a97d-4871e36d0c0mr19371848f8f.43.1790034749762; Mon, 21 Sep 2026
 16:52:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917204209.97699-1-mhun512@gmail.com>
In-Reply-To: <20260917204209.97699-1-mhun512@gmail.com>
From: Jameson Thies <jthies@google.com>
Date: Mon, 21 Sep 2026 16:52:17 -0700
X-Gm-Features: AcwNN1XmQChc3wF9M46vgBU40k-YCjqTLZqTMWXlA9L7AxR5iUA5AqwBC1HrUWo
Message-ID: <CAMFSARfQfOVJ7McNDfJC4uRRhmgyh0iS3T6L4Rzyc_gxTTg=qw@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Stop altmode work before
 unregistering ports
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Andrei Kuchynski <akuchynski@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 1:42=E2=80=AFPM Myeonghun Pak <mhun512@gmail.com> w=
rote:
>
> DisplayPort and Thunderbolt port altmodes queue work to deliver VDM
> responses to their partners. Port teardown only cancels port_work and
> then unregisters the partner and port altmodes, leaving the separate
> altmode work able to access released altmode data.
>
> Disable and drain each port altmode's work before unregistering the
> partner altmodes. Disabling also prevents a partner callback from
> requeueing the work while its driver is being removed. Use the common
> port teardown path so probe error handling is covered as well.
>
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
>
> Fixes: dbb3fc0ffa95 ("platform/chrome: cros_ec_typec: Displayport support=
")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Reviewed-by: Jameson Thies <jthies@google.com>

- Jameson
