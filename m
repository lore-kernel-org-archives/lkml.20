Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA8F4A99A2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677290; cv=none; b=DndRgSDg4gnR50TVNucfq+Ef6j474rtAKaaKqqNMXxrogr917h28k0oDEP/dFfI33/A4MkO2XjR+1CNF24uWXexMBrNYcu2kooyNmpHnoahe+oDUzZfQZWYctGqV8wRhNhFeDxBSyEMRz5w1RjDpgNAWNiGDEJV5v8fl9EapGlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677290; c=relaxed/simple;
	bh=mYjbBVwargHWsKu07Jhp0TKQU4hcLQthxlQyB3uB2hE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gzk7eyroyXv8JbLRTio7vjO4iXCp0lsTtxIYSgbv+gCE+cGtNFl8baMjXbIfC1hXIxRnthMRadnIzykke07CRQXBuSBbglLaB7trXsg9LKLluxICaI0LWzasPXxuk49m3C0nkR2pWGOb4sFDp6FhTkbzXQs3cB9yq1vz9UPcCTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iNmCJzIl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mlY/EhQV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iNmCJzIl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mlY/EhQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789677287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mYjbBVwargHWsKu07Jhp0TKQU4hcLQthxlQyB3uB2hE=;
	b=iNmCJzIliOQZA2WcO6a0oiV+J+2Neo1IT9gJECrI60vp+kxketDPBG4aRe3OXhPLjsh7w6
	uCDNNdzZLfGMWr+85U75WVk+af/eI60gnoJnMILnMqzO1wix+bSGT1lKxJTSi9+6lzIf2Y
	Pzp1VVKSOpPStFB15INHLt5jag14FWc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-SMMjURIBO7yV_zDQYXYToQ-1; Thu, 17 Sep 2026 16:34:46 -0400
X-MC-Unique: SMMjURIBO7yV_zDQYXYToQ-1
X-Mimecast-MFC-AGG-ID: SMMjURIBO7yV_zDQYXYToQ_1789677286
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bd22160bbso7412785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789677286; x=1790282086; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mYjbBVwargHWsKu07Jhp0TKQU4hcLQthxlQyB3uB2hE=;
        b=mlY/EhQVEuliHlsFMCsYwGJ1EaRZGUFzfXYXGSEd7pTyjyrZwaV/JBOeJRilPeLh1x
         TzB1KlNgcCi1jHrbKGaugKrglp6XfFyqqDF5Rznlp5JSj3U3AR78YxIMt1tlFuj+xR4M
         CQd6dC4g0D2NiOQ0AY4iq+919hFYX6HOMjFk/Yuq6fibKQP1n9MTuYGw/eky9AWB8z1v
         cceOgJNDF8kuiGyuGQp9OPkCRgWKchE7ifQ1SvQMkopDffnPmk40Y81jt2lpNB71UtPS
         btUXtlxNeslVKVCXopg8OZwNYEm+abXGMNUocqIuiFFCcfXXPh44UJzEDtoMCxN0uqBq
         VJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789677286; x=1790282086;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYjbBVwargHWsKu07Jhp0TKQU4hcLQthxlQyB3uB2hE=;
        b=sgcNnxthHeFFFqSmuueSjfME5AKfUNes5sKQbVYrQDiKjl7h2UP+/QS17CI5dpHa79
         YOb7Bhffw1n6Nax8stYWhfzepw7U+xhdekNltWa+Pefsjj5UjZ/rm2SIWlItRhUgqPfc
         Ua2Xit+yXkbcY8OKtsn1TllsdikbIsEcGI0FV1U55rjrjJRwWvefY5Sp95wyL4iFkbLx
         CF7usIaETlsjv6ZMGthjantnHWfVkyDpF6RfHL5cH1AxSXL96UDhnQldRjOmbE59C+nc
         cacB/W9cCuZHQB4Y1+wvOZXf5AR8Pq9L11UMCPArHOXKgvm1w97rwAV6scW75zZoPMRJ
         wDoA==
X-Forwarded-Encrypted: i=1; AKwUvByqP2/U3DheNLb0DH32UAr1HPGKVUY2TmNfXxpO54V8K+oJ70HamIa8CjlvlTv7MQtUD41XhjBbMU+zFN4=@vger.kernel.org
X-Gm-Message-State: AFuF++nXTmq1HaOZhNKTo+8cjFg6ddhS7U/LHaAXgsncLddEEjnhCMee
	CGaubCRXobjF8Z2/gifwYNDrAo1Nqn4oPhTHFd0HxcQCcAOhWxAW4nw2TySk40rrTRs9tiUxoa4
	uwBYd28Zp09Z1FetsziC0qzTlOUy9+FK/xM9P1BhHmjZIZXTyhoaAObSCNyqRkWkpZQ==
X-Gm-Gg: AYBFou3q8Yujuo9516AVZR4sVzOdgJ8/1ropGLA/jusMxomLHOJbTWiimdb7pajLiDA
	PDSQL1SmPXGFK06NoSeLskW1sFS5PPVDZntVsKEzCeacOa3X3JHLWcd40MuuKhykum9eB9NoFsT
	lDkRiiRn6GV7ox7ADYf8qDkw+ds+Hw3g00r++lULXCYn07WZ+BO1/XrkDiUUXbQ3+WbvoQLSQuo
	Vb+l6aNMQly1OC+WcpxDd4cLwA8v3PSNmqx8uxBIpfxzlFMP614Omp/075QsEGIRuFosU0hCyRe
	/9AoPm+jtTMU3mkVxqL4mQqn0HGfz53qI9RnXPQXPM5XpcB/Mg0topjQMzCx73QamlqPnd6o
X-Received: by 2002:a05:620a:254a:b0:93b:d79f:d951 with SMTP id af79cd13be357-93bdca433b5mr16959985a.70.1789677286178;
        Thu, 17 Sep 2026 13:34:46 -0700 (PDT)
X-Received: by 2002:a05:620a:254a:b0:93b:d79f:d951 with SMTP id af79cd13be357-93bdca433b5mr16957185a.70.1789677285807;
        Thu, 17 Sep 2026 13:34:45 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b781deec2sm559137785a.7.2026.09.17.13.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:34:45 -0700 (PDT)
Message-ID: <fcd366286750d61f0d4e2b99ddef2a9d36e72b0f.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/bios/init: drop unneeded semicolon
From: lyude@redhat.com
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 	nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Thu, 17 Sep 2026 16:34:44 -0400
In-Reply-To: <20260801191002.1383835-8-Julia.Lawall@inria.fr>
References: <20260801191002.1383835-8-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in a moment

On Sat, 2026-08-01 at 21:09 +0200, Julia Lawall wrote:
> When a function-like macro expands to an expression, that expression
> doesn't need a semicolon after it.=C2=A0 All uses have been verified to
> have their own semicolons.
>=20
> This was found using the following Coccinelle semantic patch:
>=20
> @r@
> identifier i : script:ocaml() { String.lowercase_ascii i =3D i };
> expression e;
> @@
>=20
> *#define i(...) e;
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>=20
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c |=C2=A0=C2=A0=C2=A0=
 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> index b54f044c4..3f888fb97 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> @@ -403,7 +403,7 @@ init_table_(struct nvbios_init *init, u16 offset,
> const char *name)
> =C2=A0#define init_io_condition_table(b) init_table_((b), 0x08, "io
> condition table")
> =C2=A0#define init_io_flag_condition_table(b) init_table_((b), 0x0a, "io
> flag condition table")
> =C2=A0#define init_function_table(b) init_table_((b), 0x0c, "function
> table")
> -#define init_xlat_table(b) init_table_((b), 0x10, "xlat table");
> +#define init_xlat_table(b) init_table_((b), 0x10, "xlat table")
> =C2=A0
> =C2=A0static u16
> =C2=A0init_script(struct nvkm_bios *bios, int index)

