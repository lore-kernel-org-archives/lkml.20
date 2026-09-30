Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F92443E28
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797356; cv=none; b=j6aNd9T+xLR5jVYpp7zsYGl6lGUleij+TtgaVmWF3oizPz5XAcsdg/ppeRHAfEOFNiPbM4Kya+0apdJxi5Rb1y8sPrerCUl2F5v6FI6HjsJn0y2tySCBcNmp7jZWfjXPtHQ4QAGJkgNN7x5St3hky6obyIybwYlQffNFNpDf6kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797356; c=relaxed/simple;
	bh=QxtSTGhwCX6CKg+Oh32WaP1Ug/MbDCdWPIf4AE6WQNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JRHiCImY/amfty0HduynAIQytD2aUocW7As9Xv8gIungD8Zeqp1Ppnv+r+/75KxjTXKKBX6A3W+Cn11eb6w5hza6IU7pv4LtwSpvS28r9u+MREms7jYYhFTwdUMsK1JJt45vb/ARNgX5soraEJ8kzTW24RRZNxdUlo2cXqfLxio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZelP6Jm/; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZelP6Jm/"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e32f913c3so59573766b.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790797352; x=1791402152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mtiohi+MWIdfMvXbDsV6odKf5ibvIBEkB5eaedtlMyU=;
        b=ZelP6Jm/MioOzJguJABF9mN45ssaqL7gK6mhnrfTn7jgKjnHK4HQrA/skz9A9xWcWf
         GczqFaSOr6QUmnM+JlzPbdlaqdHlrjuEEhv1iWfZjQAX5010fNYtmpj402uZsuz68QN/
         qUfAqxqfqEoxpCXaqwrbPR8oXN1PpYc1/UrCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790797352; x=1791402152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mtiohi+MWIdfMvXbDsV6odKf5ibvIBEkB5eaedtlMyU=;
        b=OdGYklLLGjnUyaHpfynz8QpmG4fldHx7OJ9H7MLe2Ak6oBK+aJ1d40S4v5TwzDL2t0
         qEz5z5a27lQQsOzUwYAm0an/HZZw9QyjXFgIBwqsgilaZhuXj3HwD7krxrTuSMaqLGMt
         5r7MrQIi27/2WVqEgrShnIMoViRq/OGSraYTEaFoWYQ6h5IWmwlip4fSKRWPRcF+Tr41
         fTVbKcN0QtAQwiM00/kW7U1WXyWr6rq8G+Bi6CRgz9ATIKSQL2RssNe+V/lRcc+M2DPs
         u6ta+umwvkWP0wSanjUvKmMqESexqwbRX4pLSqM67Usrh1r6HLpafswYNNx52LL4h8P4
         7bsw==
X-Forwarded-Encrypted: i=1; AKwUvBzfhORqkVEOefeCjZ3OGs77S9l0P+UL24LxI3fIniopVuBb2Ojvy82NsK7kMxlSnYhLV5J6qBww4j5IzSA=@vger.kernel.org
X-Gm-Message-State: AFuF++k/jyILD/OHrdEQetS3hHVDOTwxj0vnJSyyziQumi8RwBBqd+a0
	+HRzU/W13kQXSgLNAMUO2HOlPK6VbeGpXk2+w9ZB2ozQgPTFz0TjuOv29Wo+QwKk2i++a2W9IRu
	sC5pfeg==
X-Gm-Gg: AYBFou1NwyfYUXXrWniftxmpZywsFbpSpf3ZU1zH7Z40RxeYUM0kbDuiI5Ctz5UEsik
	lFCICFPRumoMTTyObXgtHghDea/FsWofTKA+oobgJAUP2UGpRNhdZPAHOTsbAuuLIzDj42tnsog
	c/0BCWrLteIYJ0hmbozxlZyXaaUzS1L8oy7da1U/kaVMxZQWXv0GXqUjFID8wfbK4Q8CZ9R6qkX
	+zYH4UAHdUdDtsMcbWTH1ZWLyT70IqeCL9gwP7SVKJVUPr37XiX50FJBj7DoUcEjHlPLGPOZapt
	5jeou6hxnvnY9VHtEpJv+VyAwpETpdPv9gsf8/2gPzLni0TKiA9k1jQr220LjBSNi+/bkt3tLG9
	xVNOFzxybgje2s0aJ76waQMttZuM1Lm2CxRhv+xoHuVVz/IuPO3kt/KcOc85bpN9zdrEkyYYmNT
	AFPRpBNzlshe87a+6T/zf9iQM+52FCWnY9LClWxgqzWSHIGqgxt5yfHg8wLChOR8wtGJnX2WwGB
	ROvrVxubrRuSUPP3nAkP0TglHqcPa8CmHpdvb4=
X-Received: by 2002:a17:907:7b82:b0:c29:f742:c532 with SMTP id a640c23a62f3a-c2e23e0d1demr218370566b.40.1790797351869;
        Wed, 30 Sep 2026 12:42:31 -0700 (PDT)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com. [74.125.225.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d7a4e3sm49663366b.53.2026.09.30.12.42.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 12:42:30 -0700 (PDT)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so42577335e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:42:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwFSJQOf0GHNy5FLOiIkyY+PrCYkgMGb+9yV2PrfwVVGlN0wJ2Ks2Eeq8hGvmz5yGCey7U3Vjs9HcLDZt8=@vger.kernel.org
X-Received: by 2002:a05:600c:4f4b:b0:4a0:35c:8953 with SMTP id
 5b1f17b1804b1-4a01afe8499mr48313695e9.7.1790797349053; Wed, 30 Sep 2026
 12:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930063856.183763-1-zhouhaikun5@huaqin.corp-partner.google.com>
In-Reply-To: <20260930063856.183763-1-zhouhaikun5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Sep 2026 12:42:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VjKzh636bu4yNQFsGKj7bLZB4oWr6X=So58VHSp=UhAg@mail.gmail.com>
X-Gm-Features: AclHuK8kkfbOUDtVvVwL4GpB8KVrlF-z76CfF7jLe5vynXwJYITtPiQlL47fZUk
Message-ID: <CAD=FV=VjKzh636bu4yNQFsGKj7bLZB4oWr6X=So58VHSp=UhAg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Support NV140WU2-M70 edp panel
To: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, sam@ravnborg.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	daniel@ffwll.ch, airlied@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 29, 2026 at 11:42=E2=80=AFPM Haikun Zhou
<zhouhaikun5@huaqin.corp-partner.google.com> wrote:
>
> NV140WU2-M70 raw edid:
> 00 ff ff ff ff ff ff 00 09 e5 ae 38 00 00 00 00
> 14 24 01 04 a5 1e 13 78 07 7a 95 97 5d 59 95 29
> 20 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 24 31 80 a0 70 b0 3c 40 30 20
> 36 00 2d bc 10 00 00 1a 00 00 00 fd 00 28 3c 4c
> 4c 10 01 0a 20 20 20 20 20 20 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fc
> 00 4e 56 31 34 30 57 55 32 2d 4d 37 30 0a 01 35
>
> 70 20 79 02 00 20 00 0c 9a 0e 00 ae 38 00 00 00
> 00 14 1a 00 21 01 1d c8 0b 5d 07 80 07 b0 04 88
> 74 b9 5d 99 85 95 97 42 20 02 35 54 b0 5c b0 5c
> 66 32 12 78 22 00 14 3f 66 02 85 7f 07 9f 00 2f
> 00 1f 00 af 04 3b 00 02 00 05 00 81 00 15 74 1a
> 00 00 03 01 28 3c 00 00 53 42 53 42 3c 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 8d 90
>
> Signed-off-by: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Support NV140WU2-M70 edp panel
      commit: 37b346eab23aead52d17a8fa687056bfc651a416
