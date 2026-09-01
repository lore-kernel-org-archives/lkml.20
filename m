Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3668644999F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292520; cv=none; b=gGKwCmD76xl92ZLUpF4p8ap8nchm+lfkjWuIz9SCe+7st/XjKlN2n3ezU9eBNMPdpCsVNXKEbE3Qm6sXIAuOFt+c1X2qnhB0F2kDGUyn0+A6VH4hhoF+TH2FSg8HY5jS8cCWz+zbMSJBgKE6eMQ4znJ96DfhL6ZSwWgTgUGFFNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292520; c=relaxed/simple;
	bh=2777MRqkHHDOXl9YhBOlEzmHGlKVDToTlF462SeCB8Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DKMrxLzMLkvs/1CXSM9rx7/t8VrELlA6nBY3zbfUMYiW7fYkQGOeE7p9l8lbuPKJTnFxO9n/1023qkwMzOPRSR1ZtJxussZg5gurPqJU3wZaZZ0hJe4vvGNY4SqrhoRp1G42uJnxB1LraUFHszOgHjUIdzaNDThxqO8Njs0XWL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pfg9dHRp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JqgPh3AZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pfg9dHRp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JqgPh3AZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788292518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2777MRqkHHDOXl9YhBOlEzmHGlKVDToTlF462SeCB8Q=;
	b=Pfg9dHRpQW2AGiFrkDw2Gsv9/jynW4xvZjSlswvYdXoO2Oy9mFX3hMqUYrKYiHWNu75jD4
	QB/9VXiyPiFz7q8aEjZovt4ekCzOrNKK+daAcDEzQ64oriP9Db6CoLnMmuCfjT3JFYLp1Q
	YgBdJwD5VjmXRaDewhGN49o7Q8ilKr8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-gjAZb8HqO5utyg7HnkcScw-1; Tue, 01 Sept 2026 15:55:14 -0400
X-MC-Unique: gjAZb8HqO5utyg7HnkcScw-1
X-Mimecast-MFC-AGG-ID: gjAZb8HqO5utyg7HnkcScw_1788292514
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93918756165so84487485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788292514; x=1788897314; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2777MRqkHHDOXl9YhBOlEzmHGlKVDToTlF462SeCB8Q=;
        b=JqgPh3AZb+BW1F384zEf73F6+wfZcz/qYdgVw0eL4Z9YEUOxKNFZsFyQFREbta/cgW
         4yGXDT+hfPjh/XhJdGJ4Sho2QbUTPLBUPN4/BeIC8z+bcPPG4YQFhncVOwS4Xjsk409M
         3RBkvUa7DOTlbuhrSvKDSD8TQ6a13JJLYNCZX+tgWxi4Vjrdw3xIFg0KqsFnp39YCyqD
         55h6V9UqOnre+CfdMUzG75CS96uoWgDMdFF+wsWgieVXB7+Z7ZC368cxDLtr1v+7Kr91
         zpdPeSUZs15hkKJvc3sgTEQgBycXZLm/kp+EOIt9A8i2VuPzV/PcFGwSkIcrF19+JP5m
         9/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788292514; x=1788897314;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2777MRqkHHDOXl9YhBOlEzmHGlKVDToTlF462SeCB8Q=;
        b=ZlJ3eNffNHzEe50/XO+B3pShLc+8zc/xXoDqc7YuQoxwtiV9VRnkOwziihPm0qiAeI
         w3CUi9C5LmFGNcIdfkUVJWQMTZR/Ysbu2bBmvWw4ASNJkAUfjsifhMGhNBHSj++e7JHy
         I8OGyxmanG+GocGcwWieibaIBA+x67QwTl0kTsZ+v4q/jal1stLRk9WeVKUwEIfT+4gO
         0kSp/LBNf7Fb825ok4xVyqP4pz+8Rvxu5vAzy8yDPLmBKq0wz8+8oY0HvGZh8AIbmWyS
         RsWVMSehxwrXeXLGHrsMBTjlwMmH3EphjmfLaKT8xi0EuLXN9pD8RfaPx1uSYgZRPs81
         cqyw==
X-Forwarded-Encrypted: i=1; AHgh+RpmkBSzkLCW3MBdEjHwAqaDKojwngueiGSIGG+6wBXA5Nm3l6oAie25JOfP+opUrFzwlfR3slTVZxgZ2dQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lB4YeyQju/y2hWUomFM0NhW75prig5ouGbqxos6/Nx5ZwPvylL
	znEaqA2Fz3p81vas7fO647N0bcSNXjWfz0WKKLjfrxwq8voT0kINNEYv3sensX0JUuD2+W2lL93
	OtiptDgNSS0NhCGaL0Za6GK+MAN2ubv+TerMSExJHexPwzVtmdJMiFdLbL1vs1WPjzw==
X-Gm-Gg: AR+sD12HcqryRcnkRs/yb29OkzhZDe2WfYHnEIP8RLCBzZXyuRGWw14RoyTfJspxG1P
	JMoIKwc3oOiBkwrVEA2zWrWJgTs5wa+iOGlvSkMqOMkhMaW7avYIL+fWXzM4zVblVi4Aa38TEYK
	raNh77GVR71QDxdDRNp+iy7ZncME4kOgr10mBVHQe4qsXgWOFWIh9VKVCiunZN3KET2yfwhxGKu
	MtzUNyqgqP5SbSxFlRE3MX07IGR/tAS0LgCuYhpwun0jURM4R6Vv087S2BP0n1oITIP2uI3i9Hz
	JXzg3S0eQ+Qe9DgHO2Zl9OWNLapMUb8kL3UxcZ7q49bTvZEFLVPsw3VBjgjUtpJDszkOnPBU
X-Received: by 2002:a05:620a:2b88:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-93948012fadmr1557893585a.15.1788292514217;
        Tue, 01 Sep 2026 12:55:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2b88:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-93948012fadmr1557887785a.15.1788292513678;
        Tue, 01 Sep 2026 12:55:13 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f361042sm19286085a.26.2026.09.01.12.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:55:13 -0700 (PDT)
Message-ID: <27200b7e13ecc99d57c41da4e25fad690fca68d7.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau: Use write-combined maps for coherent
From: lyude@redhat.com
To: Aaron Kling <webgeek1234@gmail.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Faith Ekstrand <faith.ekstrand@collabora.com>
Date: Tue, 01 Sep 2026 15:55:11 -0400
In-Reply-To: <CALHNRZ-JmYx-PhruhDZ3L8aPVu51cJrqP_FeNtGTyMHCH_esgg@mail.gmail.com>
References: <20260821-tegra-coherent-wc-v2-1-2b1ddb67bf18@gmail.com>
	 <8cb96c08-2d1e-459e-b356-c6fd97ef869e@kernel.org>
	 <CALHNRZ-JmYx-PhruhDZ3L8aPVu51cJrqP_FeNtGTyMHCH_esgg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-09-01 at 13:03 -0500, Aaron Kling wrote:
>=20
> Looks like the tag is:
>=20
> Fixes: 1b4ea4c5980f ("drm/ttm: set the tt caching state at creation
> time")
>=20
> Should I send another revision just to add this, or can the subsystem
> maintainer add it when picking the change up? For stable, I would
> like
> to see this picked to 6.18 at least, since I primarily work with LTS
> forks.
>=20
> Aaron

I would send out a respin with the tag

