Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E937D38DC57
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458366; cv=none; b=DZiRFkFGwHMel5q8/krKGXP7ZDi4tO3L7LqUu5tc91beb2TnkHvNHK5zZo4Z7cuRot51HVHkuV9dzpI1pcChxGwSFhl+jHsDLwGcB5nUmS9m29omAzCeKo8E/He7MBH8GSEwsSp9VqFJ7Rt7LItWBGsbA9TVrgyVHr81bVvjwos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458366; c=relaxed/simple;
	bh=HHzMD2AylVtdJpnUMRpnfNdvO19MdlSmTAiLFrp1k5s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MOIw5N14acw3/Cjj1TBO4bCQjwKb1tyhoF5ZX4ovs++oRNAvRR3a6X3uPov3k231o271DNP/CCEZHbw5VYRAdvMyIWA1VOMOyFpcurHrjb4/kIDL+PIHgYB5Az+/aErzU+PgKYBVyLpPIP16Ce/YEKyr0id0CwZ725HixFfRjd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QFXjD7lO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tlxq/FwR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QFXjD7lO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tlxq/FwR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789458363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HHzMD2AylVtdJpnUMRpnfNdvO19MdlSmTAiLFrp1k5s=;
	b=QFXjD7lOT9YkhSZ0L0NXVAip/XyD6VB2FruyGON8OTjwdnIH+qD57WtUDqnz30tWoIkKe1
	UVKTihc9R37Dg4YcbWvyoGrQFhCqGryXGspe2L409uc7dyclgt5IbOHOZ5fN367vwYZ9SR
	aD+Lx3t59xssraEy4HygTtWnDyJxhvw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-FwswMB2CMgSU7NMigGYRLw-1; Tue, 15 Sep 2026 03:45:59 -0400
X-MC-Unique: FwswMB2CMgSU7NMigGYRLw-1
X-Mimecast-MFC-AGG-ID: FwswMB2CMgSU7NMigGYRLw_1789458359
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e735659b7so14756645e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789458359; x=1790063159; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HHzMD2AylVtdJpnUMRpnfNdvO19MdlSmTAiLFrp1k5s=;
        b=tlxq/FwRKbCbtV9rnMsZAklDIpM9vE5LCL7dAISgnWFPrQ1Cui8vYsSkLnZU2mnehy
         7WngUwNpHA7qtuQkvsS6dc+NAIOsDTDCa9frQLujsQKCO3Rx6jPGMZux8DDbvWX/tRSL
         vGWTEBViLa8giNG9KDEw4XTIo83lEX47xU3ifIN52VS2GUBLw61hf3hi2R5MnqmFqVQJ
         H9Zr6QXUov1j/JIo3OsW70pBpTnAw1Lb+J3xkYIsman6UaLgNxJDBoQ6K26YMX1XJn4x
         CxnC62zgcURs6cs/MeKxUrFvGftm64RruhYqZzlMcDkKpnABmZn/wot49lM+d7UrsA7P
         5mjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789458359; x=1790063159;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HHzMD2AylVtdJpnUMRpnfNdvO19MdlSmTAiLFrp1k5s=;
        b=OiVU6PWKvxyCPRcjEkOWZYdvLhf/BhP+rbH2xq9XGcDIojC2+wog7MAgg7G0RFelx3
         BtuXdvZ9GV/pBs9FJVdHMkOH29AARgExEPsC499bJy/YhcfsP/GdHRbITU7rci/tqJ3r
         mcI5BHSe8fw+jFbE9wW9CyW1UsTT1aBQ35OyzS+FoQAjR2XX22IZScFK/+9YfFUM2luu
         ZAEbKfUEbn3b7tdg+Z4RPl2ZGyu05wTecSEzpufi+Y6O1fIkUc51PBTqHAfa1p66ad4r
         Mzy6k5SAhYIBRrTYP7wxa2yV8bhqWjoKHvMhDKXy8nQFR6e2a9xAcmpG7hnCynYFHdmE
         nlDw==
X-Forwarded-Encrypted: i=1; AKwUvBzpKNUxIDVGjv4A/A/0Ox9qtIykX/4BSFnTZLtow+4W7Wand4JlCEsb6l86IES94NUTzDuCsL/b60syH+8=@vger.kernel.org
X-Gm-Message-State: AFuF++nvjM/ckECwm888xY2Uy2ZZauysWUMIjwFFpTAOOlZnL6NU59Ib
	LG5Ig/ZjidPuy4Bh5mfvMinD5J+Nd/0mqZtALOMf8Faqs7HNFMWAKxZOcKRNyq5bE7TyPoTkJ9d
	6ug/M5reoT7xHcszbO4yLJKtKyEs4cncujTVnuu/UFzIrJ6S3jRf2sW66/+VXHrTrEYXw5y71S/
	vDPbk=
X-Gm-Gg: AYBFou32rPHbYGAoGNNfihMxiXQJL7tz4HbrUJw4F3DBdhpK2yUgTFWJpISgi8/3gyo
	6pU5nUpZkb8OivqU0Ph/VZzEoD8VPSXb9tK3Vqx968tX+J1ooc70Dq5a/NSyK8IuyAcCV3ksL/4
	wPpo/9mujoAY8jsX21q9hxQq416qabvo9To4bqWXl+vvETz6uZM376wf8jdddft3SwDvqI/1LVV
	qCKZakht14KnvI5hHi7VjVSRhSeETrvGEsJqiG8wKTXyfaaqlN673vEnDniazKbLb2hNMrtKnYt
	p6eY9axXFGpcOrhcTSqxfCQ828H4B+XxfhdvFFZD+/HsRnSo5flRJA47B8RjeW/qgw6jFHfgn7+
	QGP6u3JBW64vSN/rTHmApctl8JW+IUw==
X-Received: by 2002:a05:600c:5487:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49e82244b0emr463195e9.10.1789458358735;
        Tue, 15 Sep 2026 00:45:58 -0700 (PDT)
X-Received: by 2002:a05:600c:5487:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49e82244b0emr462895e9.10.1789458358358;
        Tue, 15 Sep 2026 00:45:58 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6b4ee3sm59231025e9.12.2026.09.15.00.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:45:56 -0700 (PDT)
Message-ID: <542f1065c1daf5167f77e160de90e9a04eb20159.camel@redhat.com>
Subject: Re: [PATCH v5 3/5] rv/reactors: export rv_register_reactor() and
 rv_unregister_reactor()
From: Gabriele Monaco <gmonaco@redhat.com>
To: Wen Yang <wen.yang@linux.dev>
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 15 Sep 2026 09:45:55 +0200
In-Reply-To: <2c408ff5-9a13-438e-9068-21b3f1516fbd@linux.dev>
References: <cover.1788705281.git.wen.yang@linux.dev>
	 <7c931773dacd7c3da35a22629c3d7dc286b5a0fe.1788705281.git.wen.yang@linux.dev>
	 <b5ec9da630968a5f801623c8d6e2aaeb0bb509d8.camel@redhat.com>
	 <2c408ff5-9a13-438e-9068-21b3f1516fbd@linux.dev>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-09-14 at 00:33 +0800, Wen Yang wrote:
> Thanks for the review, Gabriele, I agree with your points and will=20
> follow them.
>=20
> Just to clarify the background : the struct module * field and the=20
> try_module_get()/module_put() logic were added to address the point=20
> raised by sashiko. After this change sashiko no longer complains about it=
.

Yeah I imagined it, sashiko has a point, whatever is EXPORTed can be used b=
y
modules, so it may imply modules are supported.
What sashiko ignores is maintainability requirements.
A human is reviewing anyone trying to use reactors as modules, and adding t=
hat
change without properly advertising it may do more harm than good.

> The module-based reactor support, together with its kselftest, will be=
=20
> send as a separate series in a few days.

Sounds good, so I can review and test it as it deserves.

> As a side note, we are looking into using the rv framework for=20
> functional safety in autonomous driving.=C2=A0 Depending on how internal=
=20
> validation progress, there will likely be further changes to the rv=20
> subsystem in the near future. I'll be glad to discuss them as they come.

Nice, thanks for sharing, I had a few conversations about RV in functional
safety domains over the past weeks, I now better understand the challenges.
It'd be very interesting to discuss your requirements too.

Thanks,
Gabriele

