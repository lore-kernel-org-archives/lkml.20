Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793785034;
	b=cvGHRL8NNIJAzDp0wRZS67NGWh761GTPV1ElhFyLW8U/+/Qbzh8cnFSGIZuNZQfm1D1P
	 fmC69jrxcdlF8P9mnl9YvYC6cjmxAOb95zPZZwbX2CRjm8I8hn7nfRzytL6gmuy4ldTum
	 bKgAgUzt4PWloIqrqYl+a2840+G9f9cC8ENXpGe+OCEt18AS4cr/IPDYo9kteSNiGhpV+
	 qR2CRIT7nVU5gpL3qnSNFpyZ+4lDsCatvVPD3+EGafHgrsaOGzyni+90g+B5aItUatV/g
	 58c5zREzxl79UiO4i/9oNbI40yA4KMAwte8NpUmpjcSwbCdWcOXW894qgoAxBDElxKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785034;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=bVnR6268e6MGHFilapvpTtFzYLf3LYIaxg9LYvJQ5c4=;
	b=uxQr39KAtWG6WkcfytLhdvCQUG9DPZeHQAk/oYvMVCXAqhh0eqX+DXwTkA8b3vg0fBb/
	 lqi8gp+xLiJ6JqAPLqlBR5nuE3RKWn/mLyoXJocxTpCRBmtSlxHx3+ypHSVEQB+gPdEX2
	 WhRMV10G5r0MhFo9ns6PPIBX/9Be5WQ6/H7jmNnfUQvv1hPsn4RRHU/0prS6Bf4frzXGt
	 4QCIgOdNZ7rTlmnnbXD5VBQuLrcfcepuXkFx8pQBTyDcBZzZkSvR7nwaRYcTP7nlvBTwg
	 P0vY3JuDCC5b/19tp7gbfDIzwZIzRaiSjS00/xCv2jlRjEg+pvDInDjbwfeky8bQg4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AId2sprP;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=cyOhVXJ3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09162606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09162606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AId2sprP;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=cyOhVXJ3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793785032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bVnR6268e6MGHFilapvpTtFzYLf3LYIaxg9LYvJQ5c4=;
	b=AId2sprPmbEnDtak3d+GVx9lxoUmsp9z55GEZKwlJGTOdxm1KJWeoo7zQnJRtBFB6MrpfA
	LKh0cU62wC3opu5WvYuElKOHfmuywO2zg8x8usvNLp23j3f7Rrd/aEFimczpGDs9kNIo3W
	T+Zj2MR+7Die9eRgTyURUlEQEgLS9vI=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-9Pf9waDuM_SN7RB3_y9L-A-1; Wed, 04 Nov 2026 04:37:11 -0500
X-MC-Unique: 9Pf9waDuM_SN7RB3_y9L-A-1
X-Mimecast-MFC-AGG-ID: 9Pf9waDuM_SN7RB3_y9L-A_1793785031
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8ab43f7f5faso8459267b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:37:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793785031; cv=none;
        d=google.com; s=arc-20260327;
        b=re5ZtnOqfXbLZ38dbpYLEEqhvgBlbET9yre0U+nCn5SdKCG4ZbBrZRddIPw9mfWFIv
         04LZgfsGI5ONLPOio3i1VdVrxwS3R/YjVTKRHuNqsVq5YM8Y4j1i12RLsKHlCIyUczss
         aJBJVfgwmq6Q/+XZIZ6mX3Jq4t90+Jz8gHEyTSQLyYIQOzVTVP2196Pv2QBBo3c70f/E
         xxNU5+fca40hKbBRw3+FCEPhaBLPvHrs2xUVPdomVmVILVev9TbmsXEwmxAw76C4UtwS
         S/PVRvmXQeTFHc/b0tDPXRuOLLkAxrWKPpyb86eJixALbW1a9hgA0GOIRbJdYtuHz/jd
         Zk7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bVnR6268e6MGHFilapvpTtFzYLf3LYIaxg9LYvJQ5c4=;
        fh=H7fl/zudMT0gLlvLCN3vvVtCEpzLIrGcSKh2g0D5smg=;
        b=QoT9IlgxtEaw4fh/7er3rJBjLKQXr+mcrCmyUZlw4LClc3UZ6KT3854ogYPyuGy3+G
         E0G0TMINTJAbNqQieIxP32oWCD868uv0tuVOp8RY/XaOTiotneH3fBCux8rsSHsLIYEI
         MmsZ5D2dKLWHDX0cLMhTV5FwDOJgfNueS7ae1JBtRrchnwRMc0nQMU35Xi/It/5DEdYq
         /TsCg+dO0SHBaONsbs4rqXCxTa/lC20paLa+Xhd/63cZOL2t5ZgNdBDhQtTPwW/XTU5k
         DpLqo7zAQGeAC9TXegT3utgk2E+rxlnD+VZ8eBpGPyVG2ecRJahp3OjbypgV7pDMn9Cl
         kbwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793785031; x=1794389831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bVnR6268e6MGHFilapvpTtFzYLf3LYIaxg9LYvJQ5c4=;
        b=cyOhVXJ3ohss1kg6XytK3waJGb1SHRyF/sYVfdOF2CuLDcoVYXHU7N95w1NO2zhgGb
         qCiyMQ7b9hpat8tj2G5MooJIux52y5ktpA//tAHCx4t0IiZSa/vNL3KLu67EjdgzHlyc
         jWR0GgUzJbSpMa3MmNReB4qOqdZRusO2ftM0192w2bIPnYiHUv1XgFdeEyRGGAqIQbSy
         X5HckDKHJwVJv3hDpemhcJE9yAky523zsKomx1muyLCdsDbE13SMWyQDqLoYgyGhWcem
         yYpa5csR9HASk4RvpnATp08N9XRtIfc6+snpwu69dpdOVO79KMXbDDXe0vWheYqp5Zxp
         MiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785031; x=1794389831;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bVnR6268e6MGHFilapvpTtFzYLf3LYIaxg9LYvJQ5c4=;
        b=0E6hPLPJzkWgtlg9Ywp2viWH4jkk5UlSQcuVfNzLvFTwk6Y5nzghqoZuaaPIMImxiy
         4Nt9Jpv04YTA+L/+J/UGrZ+eaQuN5w/0y0xBdufwWTpd1N8WV1Id632AEKt+qYD8LHIE
         gdW+qHHxT4Qn8ujkfyL0eUT9i3uZGvu9XzxFMKNocp6pfg6odchE1GmAXoV/qjdvRsJL
         tO4NlTOVZx4XmI61Y9x4l1eAW0XeVO2JSdOU5uqf7nbHaFBcTF2zRlCWaCvKwawyXAjj
         HAZ3lP4oVudCqWnnDXnYIRhG+GI78wlhvTL0fuPEygBaMtvIfM2nbPDqKW0Qooq8sm/1
         5EdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJCkqwnU6Jojh9Y/cH7+XWfKaX+Q6HQKMR05HczEy+fOED6bhsl46H0av0w0cOqCa2PhjmthzZ+eGTSFo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rY13a3DMf2PlzJ3+zRCCQUXx5Ncmh6SqpaXqc/9QBq6mSxPlY
	c0zqd2G3TeQbrsMxC7JFAF5WovJqAHgD5t7wdAJzELTDSb1FQsgfhuWbHek86/3tPQwAcPg2LAG
	/9LprEzThM5+trprtCAC3f7VkJBrD2jGGzWm3AgkyM0NMLRAH6oVd31OdLKQuPQaYjjThzaI+gz
	+oCZjUiOwZzkckGJlkUb5kjY76uFMFkaNJjrGvbZey
X-Gm-Gg: AYBFou3iXcO1sLKggU+Z54TkrpxnHu+rTfEsRgBmBi6AZ8S0DhwOecEc5xSgFayH7Nh
	/svxQvoHcfZbk3GmFlbkbEeDFwZQXAwqPxqInYduZewd3BglASKBAcLHwn0kfeEcu87IaOu4jyY
	rWSZpnnG3bfyMRClurJdMKKFBa6DJBKXU5uS9CN/KN7wBohAzef2SM6+4ZbHB94/qIXdAWLfSfE
	EKXWLU2DZEBO7qIKmrMeP4XiVsFZ+peCMlWXqDdF51JTCG0jFnp7lfoGSE=
X-Received: by 2002:a05:690c:a4cf:10b0:8ab:44a4:6362 with SMTP id 00721157ae682-8b2b65b28edmr73174997b3.4.1793785030950;
        Wed, 04 Nov 2026 01:37:10 -0800 (PST)
X-Received: by 2002:a05:690c:a4cf:10b0:8ab:44a4:6362 with SMTP id
 00721157ae682-8b2b65b28edmr73174927b3.4.1793785030369; Wed, 04 Nov 2026
 01:37:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104081903.1834-1-gubin@cmss.chinamobile.com>
In-Reply-To: <20261104081903.1834-1-gubin@cmss.chinamobile.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 4 Nov 2026 10:36:33 +0100
X-Gm-Features: AclHuK-c5sjTOvcK9KP6Rr8oWkxc5XccSDR94cElnJTWRBuorU92CHBGWIUNiE8
Message-ID: <CAJaqyWfQDD8OmK=-myHYp0fZuSAQDfwn_KyqUomp7jP1MOaD5w@mail.gmail.com>
Subject: Re: [PATCH] tools/virtio/virtio-trace: fix swapped read/write label
 in path error
To: Gu Bin <gubin@cmss.chinamobile.com>
Cc: mst@redhat.com, jasowangio@gmail.com, xuanzhuo@linux.alibaba.com, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 9:22=E2=80=AFAM Gu Bin <gubin@cmss.chinamobile.com> =
wrote:
>
> make_path() builds the path whose direction is given by
> this_is_write_path, but the pr_err() labels it with the opposite
> direction: "read" when building the write path and "write" when
> building the read path, pointing the user at the wrong side when
> path generation fails. This is a cosmetic fix: only the error
> message text is wrong, the path construction logic is unaffected.
>
> Swap the literals so the message matches the attempted path.
>
> Fixes: 108fc82596e3 ("tools: Add guest trace agent as a user tool")

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Thanks!

> Signed-off-by: Gu Bin <gubin@cmss.chinamobile.com>
> ---
>  tools/virtio/virtio-trace/trace-agent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/virtio/virtio-trace/trace-agent.c b/tools/virtio/virti=
o-trace/trace-agent.c
> index 7e2d9bbf0b84..555521fc8bfd 100644
> --- a/tools/virtio/virtio-trace/trace-agent.c
> +++ b/tools/virtio/virtio-trace/trace-agent.c
> @@ -130,7 +130,7 @@ static const char *make_path(int cpu_num, bool this_i=
s_write_path)
>
>         if (ret <=3D 0) {
>                 pr_err("Failed to generate %s path(CPU#%d):%d\n",
> -                       this_is_write_path ? "read" : "write", cpu_num, r=
et);
> +                       this_is_write_path ? "write" : "read", cpu_num, r=
et);
>                 goto error;
>         }
>
> --
> 2.55.0.windows.3
>
>
>

