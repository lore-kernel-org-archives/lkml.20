Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1193D9520
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789886816; cv=none; b=cS2O/ABBYBANok8IpZJo4JpYsmEabj7Tm2CO7ovNozCVIPjEBxNlOPjx0asIvI4kPkOXxfU87goTv4z7DwZiLQqx/ZHHWL5jHTH3dIFoXsr1KjOcmQlENTiSXqJVdgvRIoadAJE3qLxV81revUgvhBg41QGP93rgZR5HiMHcZOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789886816; c=relaxed/simple;
	bh=BKLHZGPBT1ra9/o3RySzPt6GWmDIvoVinMejtLiDi40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irTgK4vmoksI3Pxqav8aYha8bVapgFZM3ThiMcUy1oye/EWiQuq9NgZiYjdQLSeVEccPCU7UHkPIgvDMVlSu7ZKtxYhE2BbRhr7h0oU6D959d5mnMyDbuTvs66oFgtiBMM3LkbnHp8pGsEO9JaA1HoKDTNYwvsUiq7JU9hMFMOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=RpNCRhpU; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="RpNCRhpU"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b899413537so3019006e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 23:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1789886809; x=1790491609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NaOoXMCD5+08vNUZK7B5Sw9F8Wgv/VWmCEv3fUCICio=;
        b=RpNCRhpUf0euCWxZSxksNGwOXQD3gwl/UtG3sxPbBNbzNGxr5u3l+CGvEAU7mCJ+8F
         vjIqubp10bYk/trSLHG45OKJxvBGEa60wYA93tY4egC2zN9EC843CAZlcoquZkkaQ4du
         CVowpR54SAsW5X89fmvmXqPVKBPKBUiOM7WbUzeTgheKnPxANcOhDRu3qaD3bQWAnyXy
         U8QJe4j6V+JraJ//LJz148kDobS2PZ1VmKWyzx1omeo/GkNi3p5MHVJvi4WQzYo6gGXL
         u9affkz8g7I5xbhmJVo15yQUkUvIWZHFFX1IHiGAIm/70YJc5RQ11HpfUeShZbotYTNo
         Twhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789886809; x=1790491609;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NaOoXMCD5+08vNUZK7B5Sw9F8Wgv/VWmCEv3fUCICio=;
        b=NLBC7MO+DkhSxgCAy4rBJlKwuEfYAJMflfYBLZkrCgzigHf70pa6bwEj9VQpLipt8r
         s/fbamrhlVfH64u5m/7pBP4W5xrfAOk0lyLNCtEsUDChpixnpvkeJcvMQ47D5JJy20jh
         H651Q8KBr8qhtoaq34F1cuwMXfrSQYuuhL8rHdwiqU/gYO5H6MWQChMsGNJ6pL7/ur3P
         sZnR9KQeAuf4hW1oNLuvIveGBELveAb9Gwe7b5sc8N2DwLzEv6lNswXk4Pg0z1Ik2XU8
         P0otLjzPBPaC8m+QbGpJUWoRiPE78qgxRUx9dZWBQYNYMMDu35jvE5shg5ANO+B/i+lA
         3/VQ==
X-Forwarded-Encrypted: i=1; AKwUvBxs4OkX5STc2jCSiogt0dZnL/a6/deaYZ4Tdx4UOa1JK2Uj8oyY7TMlvWOBOAzeUiW5UKzI2YNi/lAN0w0=@vger.kernel.org
X-Gm-Message-State: AFuF++l4CSvp1BscMjTgUWtC+4Dh/9XphGGtWYuRlH7WwMS1Y8z9ts+A
	A5qtec+zXqzP3ge+DqOwBotIprvXMGWP3BI3/v+nMZFM+7InWC8u9Rcjw3jv+fKA96Q=
X-Gm-Gg: AYBFou1LkeTzYCTQYptj1n77xgDUfbWVSLZrPeRcdUBhlxvan0VTqXaGKsZSvBROkcY
	6i1+JGjB34zJ1yl0vMkX1yBoWAQVWp0ODereyQHxwgshfFWy4of8ApYk0uLo0WxfcfMuBJMCXyB
	FQvFaKuP9STuA2+8MOSTF9WOeojpqheOv/8S6yTVVI9vS/oEd5+4dyU7+5HPPPOqout4zzIe+Bo
	QzEY1zofcVSA8uvsJkgruPVQtdK3XDhlCCir8PK+NcOXK7bW1L03Ayc5PtvFifUPTKSuCUBxsZB
	vd5izxlAeTGNzr+37f6ZjlA7CNqnN3drP+7K2mYiNhaHqLg/Q8V2bffQ3q3erxpqG6FtCl0RUXg
	haUP1XuQoYU2foSBCUIdB0bdUiA++rCPqLe6nk/l31sKe5V8BRU9FoWuGN3NwNlAoGR7aD5PqYz
	S9whzAE5pcColrby7fTYsOvY8Jk+IbWmq/sRhIeixCvy/oqtLplRgo/JuKgCEx2grGgMai3k/nd
	g/G4/+v
X-Received: by 2002:a05:6512:3a8d:b0:5b8:c147:f363 with SMTP id 2adb3069b0e04-5b8c19618a8mr1949385e87.64.1789886809102;
        Sat, 19 Sep 2026 23:46:49 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c88d537bsm891722e87.45.2026.09.19.23.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 23:46:48 -0700 (PDT)
Date: Sun, 20 Sep 2026 08:46:44 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Konstantin Sinyuk <ksinyuk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Francois Dugast <francois.dugast@intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Ilia Levi <ilia.levi@intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, jhs@mojatatu.com, jgg@nvidia.com
Subject: Re: [RFC PATCH 0/12] drm/fabric: vendor-neutral topology
 infrastructure for scale-up accelerator interconnects
Message-ID: <aq-AwReIVop1qv82@FV6GYCPJ69>
References: <cover.1787552412.git.ksinyuk@kernel.org>
 <apAsfOowcG0cTvT8@FV6GYCPJ69>
 <fabric-jiri-reply.1788176464.ksinyuk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fabric-jiri-reply.1788176464.ksinyuk@kernel.org>

Mon, Aug 31, 2026 at 01:45:15PM +0200, ksinyuk@kernel.org wrote:
>On Thu, Aug 27, 2026 at 02:35:16PM +0200, Jiri Pirko wrote:
>> Using generic netlink instead of sysfs for this makes a lot of sense,
>> but it may be a bit odd to use it outside the networking area.
>> I've been struggling with the same in another non-networking use-case
>> as well.
>
>Agreed, and the series shows the friction. The namespace handling is
>nominal, and CAP_NET_ADMIN as the mutation gate is another borrowed
>part of the model. I went into that in more detail in the reply to
>Jason.
>
>> - One character device per registered instance, not one global family.
>>   Access control is the file: udev rules, ACLs, an fd passed into
>>   a container.
>
>The fd-based access and event model addresses real problems with one
>global family and one multicast group.
>
>The main question is what the CTLV instance would represent. A fabric
>can span multiple devices and has its own lifetime. An endpoint can also
>be detached from a fabric with fabric-id 0 and continue to exist. A
>character device per accelerator would not provide the same global view
>as the current family.

CTVL is supposed to be just "transport". So however you use it is up to
you.


>
>Can a CTLV instance represent a multi-device fabric or the global
>fabric registry rather than one physical device?

Yes, whoever creates the ctlv instance is in charge of the lifecycle.


>
>> Would this make sense to use for you?
>
>In principle, yes. I cannot base this series on an out-of-tree pre-RFC,
>but the fabric, endpoint, port and peer model is separate from the
>current serialization.
>
>Changing transports would be more than regeneration, so I will read the
>draft before saying more.
>
>Thanks,
>Konstantin
