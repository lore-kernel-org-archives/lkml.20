Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A274448CF6
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791302781; cv=none; b=Ja+mQHPH1u0moE9pPMwUX23rGXRRP5k2TwXdb2Lq0YTAKyUGcNomSCQ1e5idvuuxvTLrU3H1Z6UVLiy8610qWmmD7sBhTNGcMr/GIgc4nS2wwQxdtjfFG0o1K3FmvBBHgK5WHBD1HPNKrohv7J2kyF+G15w5V1TNU8Lt6rgKYdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791302781; c=relaxed/simple;
	bh=v4l2oT7XpoJJY95pECWl0GI0DGTnb5r8/h9YkRUhmzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OYvv+RkrOJG67e78sNow1O1kq/ybag4QT7GKlz6Bslvl9plmQR0i3GnPhwck08UBk9aZoeZbEsRn39fNNewBOigloGeccjX1lvk1BoZqjB1ydjI1+c0BQMynjOiLlFqh/QzSax/Eg6ifHyzNUC2iId1B+hMh9m9alo1JTM5YfM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.b=VmAq7ZdU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.b="VmAq7ZdU"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso566115f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1791302777; x=1791907577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXaWhmFAy6cyrLqO6zX4eG/+lUuNb4r/xV4XwQ3HDVU=;
        b=VmAq7ZdUBnd93mlqk7/0AbD+NjQOC+ZaAORGnwr3JXREtP27AxZVnWXfswc8AH6Rx7
         aYKbINff2jzZ9y7rLlTg0VsFW9q2/XiARFiCxjb3HJW3123ZzqZJFC/RHDbaPrVi0BaR
         ndhVrRIoJUSPxjrHTX649TpzGD7LCzH4GXBwT74v9ddR32XETriksYF939eTrv/g/HWs
         gwlAK2u+mk45w1UhTLCxmD5XGma9ne72xL9JRhWmAwJCVHGD1FpIIs/AkukGaSvloQzS
         +r7WbxdpR5HTHCPVUkF7Uj9IcjzpZsRDoKfn4VZg/puIG259izoTZ0hLKjTcFMYvGLrO
         kCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791302777; x=1791907577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXaWhmFAy6cyrLqO6zX4eG/+lUuNb4r/xV4XwQ3HDVU=;
        b=CX4D2195XU5KZJ16D0QQnB91uH8rkTeHHzVM9VJI/kOTbKaoPkkyVlZBnfBn4FUcgn
         r2ZSALhQtCy5DwxgA35ZRzpbGKOjii2GMqDW0Oq/Mai1BeZxtmawbbJptMywOZnMiyeS
         Rg9O6zVzZyDZ5/8HVQm+90hL4av8o5LJCKYPETOYk9AT0Fw0RLbvTZL4WVo73D1vc9CF
         /ubvN+8Y7uFjUtMR9G2Hom6ug0GtbLFjt4zFtTxt4slwYh9dTlK5XxhwgnpEg6qm93Vw
         PJng3l+Ad77zPBCkZQt3O59d0g/hsu34qki8haph7vmyH0SE7sv/JzTC9gVW0caAj+cF
         j8Ng==
X-Forwarded-Encrypted: i=1; AKwUvBwDX09ARBMeunYw/ZZ+6zPp/QGd6HqvrgIsiEN5G74/WCf0KMUuhTlSdaF+cVmC87OCxBBDbnJQIQNAXc0=@vger.kernel.org
X-Gm-Message-State: AFq9FYImHIN867wk19GJZWU+KnHtUhBdaGtz/yg4PBvw5J38dGgWFPSQ
	6+blnqYDNYtCgGcxTBPtHSSG+qvEIPSsTdlfdZxE5xwzvlCroXmPmLrZTt1gZX/YodI=
X-Gm-Gg: AYBFou2JquczlLNre8nHYMF79S/2/7ShWwf9JfvBcl07gsYgy25V2d0X0NiofoeIMSb
	J9ji6BKOoqiI6oEWCT2dJF5p7q0FVOSfYi5xwCTfcwY0IA0Edb+cFWtzcRzDtCBNNF61WiMKaZT
	anQAWsvl1jSUSCCFrZ9vS6XjicVs6meUkuvllak8CoJKm+nksJBK7extP680gBMf6+GlhnIWbP8
	mrEdxUZvw5OLdSdq98K37FiQJT6VKGEQmHtK0TRTqGtxsc5FPlxCBlmFezqwc8kUtSA2SMHpWIm
	hfWNk9+DLU/sGvWp/u41zPspS5EFfjyfTdSdp4QOeD1QQHwz5fsLbudWoHMyO2oavDQBrfrFIKJ
	Ro1H6i8yJowXIUGoHLBwRIQ4j9dJ27Cts5k9EJO0ZrDSyKUnk+UeMnuNafPj6CwMN2JrKyibOk0
	31vIo4XN8DzunNTD1E3HHdXX2K2wNf/+MqDlPbHlPJDUlM/lO3gAUXMBCOY94l7fQdIIvrWo77F
	nsHPqoJoR6vmK7q7vUJBQUoOoacyYGW00x8otALJJsTszwWn4S2oHH5WXmCrO2fQA==
X-Received: by 2002:a05:6000:38d:b0:48b:a6:61b0 with SMTP id ffacd0b85a97d-48c6d1d9260mr3171130f8f.47.1791302777202;
        Tue, 06 Oct 2026 09:06:17 -0700 (PDT)
Received: from ?IPV6:2001:4bc9:b00f:d376:7c33:9a50:ef33:f391? ([2001:4bc9:b00f:d376:7c33:9a50:ef33:f391])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2eeb6sm361132f8f.43.2026.10.06.09.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 09:06:16 -0700 (PDT)
Message-ID: <b6e99af8-994c-45c6-bc7d-8d1e6ba5f0a0@linbit.com>
Date: Tue, 6 Oct 2026 18:06:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/20] drbd: add the "drbd2" genl family
To: Jens Axboe <axboe@kernel.dk>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars@linbit.com>, drbd-dev@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>
References: <20261006154607.3936501-1-christoph.boehmwalder@linbit.com>
 <20261006154607.3936501-19-christoph.boehmwalder@linbit.com>
Content-Language: en-US
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20261006154607.3936501-19-christoph.boehmwalder@linbit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/6/26 17:46, Christoph Böhmwalder wrote:
> DRBD 9's utilities need the multi-peer administration model that the
> version-1 wire cannot express: peers identified by node id, several
> paths per connection, per-peer-device options and statistics, and
> notifications for all of those. Rather than bump the "drbd" family
> and break every existing drbd-utils, add a second family, "drbd2",
> written as a YNL specification in Documentation/netlink/specs/ and
> following current generic netlink conventions: strict policies with
> ranges, nested objects, split do/dump ops, extended ACKs for errors,
> and a proper uapi header.
> 
> drbd2_nl_gen.[ch] and include/uapi/linux/drbd2.h are generated from
> the spec with tools/net/ynl and are not edited by hand.
> drbd_nl_drbd2.c is the struct drbd_nl_dialect adapter for the family.
> Both families are registered by the same driver and operate on the
> same objects; a resource created through either is visible through
> both, within what each wire format can express. drbd2 is always
> registered, so with DRBD_COMPAT_84=n it is the only family.
> 
> Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
> ---
>   Documentation/netlink/specs/drbd2.yaml | 2476 +++++++++++++++++++++++
>   drivers/block/drbd/Kconfig             |    6 +
>   drivers/block/drbd/Makefile            |    1 +
>   drivers/block/drbd/drbd2_nl_gen.c      |  748 +++++++
>   drivers/block/drbd/drbd2_nl_gen.h      |  107 +
>   drivers/block/drbd/drbd_nl_drbd2.c     | 2533 ++++++++++++++++++++++++
>   include/uapi/linux/drbd2.h             | 1012 ++++++++++
>   7 files changed, 6883 insertions(+)
>   create mode 100644 Documentation/netlink/specs/drbd2.yaml
>   create mode 100644 drivers/block/drbd/drbd2_nl_gen.c
>   create mode 100644 drivers/block/drbd/drbd2_nl_gen.h
>   create mode 100644 drivers/block/drbd/drbd_nl_drbd2.c
>   create mode 100644 include/uapi/linux/drbd2.h
Also CCing the YNL maintainers here. Original link:
https://lore.kernel.org/linux-block/20261006154607.3936501-19-christoph.boehmwalder@linbit.com/
