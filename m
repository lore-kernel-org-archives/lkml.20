Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792487567;
	b=Vbf9DpN+xtwwGEUfJ9c9MXgl6dzJ3qN3vFAgpyNWLxsLqewmPmKEAqaUz7ZZ6qpunCDS
	 BRdw6VU5CwEoc3Zq0Bjg8JvFPbaVJpmR/f2TuAtuPSuzD/dGhZiu9uy8Y19NZbo5gEmTU
	 BZc1IpRVen8Y4a9HCM39Qg8sRGCaT5qCTDVN5kLoM65BaWev/KtB2J5GuAY0K8nVi745A
	 RtD/el1LP9fP7VYgZ234f2YV2E22KJ72adYknBcbQKkjUGFJIoHkxraTPH/mviepiGU/J
	 E9VtqYWn7H9CxzBR3O59v43MF5nqItmMSm2SqcHn0UTtp3DZZi5Wzpqgj+Mx9Ga14Wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487567;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ws/nAel3gKigB9xjBOx8xYnJzYDjiCbjwmjPbmNoQBg=;
	b=GCVt36BZ21MAQlpZAOSd9w3saKdxO6oF1svg8V9pNWuQ55cKbzTDVv4U7JJio8YnklCF
	 ABpLJzgwT2mXthzsNHKkv1iNSqwbNsPeYmXX9p/QP/52eHWnJ/xxin0FXsahWVCwRdBxb
	 CfAZlTIcy3zi+X1P1ykgJqV595msSgW8RH6DjzE7Y32gqxIQUjSWSVOG8xswBzW1vgB56
	 yq67OgwEVMFRp/TjTlu1Biw2rDCl+5nUwgM3v1rnBGLTS8+q0ZO6uhYr5YWHjD/cxrSEw
	 iOmPFVRjcFXBXhijC4xsbpvNkjVlZps6edWAQbGo/N5xqywJNuYr004Iep9OsMR7Gew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BBz2pK4s;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RjpmwlSO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE43606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DE43606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BBz2pK4s;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RjpmwlSO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792487565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ws/nAel3gKigB9xjBOx8xYnJzYDjiCbjwmjPbmNoQBg=;
	b=BBz2pK4so24MfB+xS/099doREDDjDg0uPZhNBrm9wGyAMYK2AOrWredClTa6kyCOr6Y0Fu
	9CqRYSQoQuvlqHXsGASovbVj12EhWvI+S/OkVnbi6GKmMteXZ2E1JDx5uEaE9nx/BYZWe0
	aNZ/oEJCdrtUUSyRMlfM2tzon8cLlkQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-ePf0k7XzM_2g_pmxSD-wRA-1; Tue, 20 Oct 2026 09:12:42 +0000
X-MC-Unique: ePf0k7XzM_2g_pmxSD-wRA-1
X-Mimecast-MFC-AGG-ID: ePf0k7XzM_2g_pmxSD-wRA_1792487561
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e1291432aso1577323f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:12:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792487561; cv=none;
        d=google.com; s=arc-20260327;
        b=H+VGBgjjY3MrW8x+RyDfautsPOI0/wMGwBlJvD1x5LMVLMkgSzgcqb7f8wbABs1cOD
         H6gk6fBpROXGCDan9J/NIQUojgshaBQWiC++9lCv8Aj2678uexEOyo+oBtc3WKSHbTYe
         nRn6LwQ/lcl7WSd1uWSYC/MlRgo1zP3T9g3HVu83ujw+mtMzMXbGEr/eMfrOe67i14Bb
         6vIO1JvAK0Tidw0YTSCqCLdvEgB4UREvBdTYX2RQJk04QtM3A2RY3OAH7EGdOkCdT2Hg
         KiVfELKu5De7kQQPq/gNf0T2AYowZT1hUZj3+dk8/1WGl2lDQmQe97qNguReV9wJ5fv+
         GSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ws/nAel3gKigB9xjBOx8xYnJzYDjiCbjwmjPbmNoQBg=;
        fh=dziKW/zJmJBQfVHIe3tYkvitcxywnVD3/4c1Cr7CpB0=;
        b=awnkb7vJuN/zQov8GZ9ebJqbLYQgSW28YY7afTGKziC/OtlFg79iE6OcrjC8pMuEGF
         blF885yQs+g7qmXnNXlO+o3XNsvgGiWb1uzJebhVdCv/UiOYpEyK8QvXu/XQS1I4TBVz
         cQItvhDY3/nqFU4MAfoWzvHU9nNdHS2Q5WIFSrRIY1DiFNM7XIR+gEwM2Xpubz5GbgNz
         x7VnGef969GgSsBK4I37fYXx+IlgE5FmNQlfBQktLV3Te4kNR7xx5tO/kQYZZk2f2RmP
         GRCxVSyCQ0NLqxt0HebBQXVdulyeHlTbHMR+llgLT69wcUgGMy8Mgq2ZyAXFDpnDskDq
         TfKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792487561; x=1793092361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ws/nAel3gKigB9xjBOx8xYnJzYDjiCbjwmjPbmNoQBg=;
        b=RjpmwlSO5deu6v74SbJFeC+/cs6rPQCcxOwX+77f1JeZA9FUx7TmEOYQ3GWV2/O1Ar
         ENJBEE4VhEMJgncIoI36mOfKZbYA6rnhiIynRSOn67MKm3rM3wl59yZPG1KOmRxbQfPo
         HmzNRMfIpvTnVxFcFENkgTTdMbNuTO4fRgeehP/p0DX8LwrUvzLLBWZwfw5soBpBs+pY
         3qSiD1P5XYAVD4zmRr9S0NylvmdMIsLf7QGVh4VfSENaDj2ZtfPJks1YFfHT2I+dkWH+
         8/EWntvDVjHooscn5wxLkMcLJ98hgkIVS5Zes3TWBqgsRobUmDmfNmWb0b/18vmYcsd2
         wNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487561; x=1793092361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ws/nAel3gKigB9xjBOx8xYnJzYDjiCbjwmjPbmNoQBg=;
        b=Tu+QogcRLHoSIcmTvCgYnm03THBDBiA51JEzE/6uHQkQviA2s0NpHOZt/nUe2+tFG8
         XskzdFnOvWPXvnRl95BS62za7+w3JYIA8zwECXdx2p5iC09/AunmOwvhFBYh9hOuME8E
         h4mPNvT4I9LiAdL+KjgZJLFuJQdpfjKtEnUwI0i+xE2TI7dRbyT3a9TFgywRh20H/KLD
         m2s8p7N9f/1wINpY+jHmbjO+U3dHiN1U3fIFPnw6vCfnLP9HHd7/fOpNJo9UigNO/pFJ
         dtGZTNngtZRnTANyHmE65tfXjkdV9huJEyG/w0LBatktrZhnOpy1mD1s7RKQa4v8Y2rB
         MPOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZbRGIzSzVwdLsaMfSJUwqZqQs/66Wb1BVRzpMOEVJX0ANqiz6UkQndTQhfknMpDx1V7nOPBzksDZWx1Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1fd68qsp4bQKuE9lDwwcG9GvVKi5f1vLA2okMk1b9w2+3Cimv
	eLIzJv7th/ZmlxqvV3QJc7YItKSGcaf6dHtkvOgIStg+U2FyEqgVy3UNiR/a5X1EFgZQAuJdOLw
	c5WQj2fgf1g7PXnoFL8silc48GP/6yxqaRlrnNZMrMs/VN++bmv3wHciMwsEk/wQlEs9gXRuXEQ
	ci+tyawivuaeD4kXfg+DjEW+iAIticE32sV2vYa+wH
X-Gm-Gg: AYBFou2RoUeisomyRG5gSTx/aDSB/i8ubYXueiTzfrFPO+EFxwnlv7uCMmrivttP8mz
	CxG7qwcicgiBUjSyE7NQon2bWOJ4M+xUnFEvcxAbATnh1u/6fhJ3NOjS2osS/V53Vj0FQKboJ6T
	7Al6Z62uGV9bWlRbUT7Ccetga4D6ZYn+DV4/UBOkv95328Re35o6DWtouv1pduxzO4uAzf/3CL+
	qggWT9niaCdEeksOaKOZgSDn2FN6EMnNmpwLPIiXhJOXae6/UmWk45gANgQVQ==
X-Received: by 2002:adf:e6c4:0:b0:48a:fe3b:64b7 with SMTP id ffacd0b85a97d-48e07fbbd81mr15612504f8f.53.1792487561028;
        Tue, 20 Oct 2026 02:12:41 -0700 (PDT)
X-Received: by 2002:adf:e6c4:0:b0:48a:fe3b:64b7 with SMTP id
 ffacd0b85a97d-48e07fbbd81mr15612464f8f.53.1792487560497; Tue, 20 Oct 2026
 02:12:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atZJV1B79VsZoy8u@sirena.co.uk> <CABgObfYRYCrOj-rHDaDd3LSFMSd0ug-YoB2pD7jDA8ZgMR0sCA@mail.gmail.com>
 <86wlrczvyl.wl-maz@kernel.org>
In-Reply-To: <86wlrczvyl.wl-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 20 Oct 2026 11:12:28 +0200
X-Gm-Features: AclHuK-CANssAdVajcJL7_fA2sG8dYMTVFsVqplrwOo8ywfc31IgZ0Xj8SjnqCI
Message-ID: <CABgObfboCa74iJg7SgGqP1emsETwd-oSZG57p9XARYv89tdScQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the kvm tree
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Oliver Upton <oupton@kernel.org>, KVM <kvm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 9:13=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
> > Hi Marc/Oliver, is this something that will be fixed on your side by re=
basing?
>
> Yes. As soon as you have a stable tag on your side, I'll remerge the
> fix branches on that, and all will be forgiven.

I have pushed both the next branch and tags/for-linus to kvm.git, so
you can go ahead.

Paolo

