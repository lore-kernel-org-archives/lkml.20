Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792830533;
	b=rhZBixjRAYC1hZ1BvJNCxhMs4jAhBknsheSIySEppI1V+Pb5txYJ0l37dIV5QHbCIP2S
	 PX6wuJxZ713ZIGr/Tke/wyu/6AcRO0o/wrUSR0RAr3S2WnrvmJlFW62JEmIA78QsXZ81h
	 Vs5ApQTzAk/IAfrvH5hG9o4lVmyWYG5RjehLsxdrC1zfEZaGi5U4O+4WXSc/tvHxYKrZq
	 8MqRBm8imsBrz1UxLlRQho/3EEhe3cnmdfdqGdhkN4+CqYMBJdSpD2rSA3+j5gwg4TsZF
	 sOxKlmL2vTl1TqqX+U/Jux5Zl9XyKWyKS152dtnMuaApJi0hHK6ZJZjpp6WlO64xFnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TV8aougv0HFFxEZHCD307mI1j0UTUQCx1/QXIS2xyiY=;
	b=ebCcpkPwVwzyFACai/ZbDb6Gvy8COsmcFvHZfpl4qIzB/4Y/OjfrJ9unWv6cvMo9LPwD
	 tDZdL5PwCH3Zbx47VZTTXJWzWgtFvJ2We3bB1ZzPQOtwVbhFFH2tA74ZuOZwvaHtfQHS7
	 1ouOvkwRgnaFpEzOQgp/dTzXgw9JsUXUxndmRMSXB0VvNHTRyHmhHoWKGMxfsH+mjEhcK
	 mx9j1D/vXvucz2GALInEe7QPQyPp5Qqco4KHNe5CreJK2c4Fr/obt5WDJ6jVAFnnu3wAH
	 qdurDvHm4vXxT73SPd5H3iBNmDrB7NkuCIp6Y7rA/kPzYeysnLbKJC4uhumFJoos/Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pRpSXZU1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F85B606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F85B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pRpSXZU1
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f20b304c0so147612585a.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:28:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792830527; cv=none;
        d=google.com; s=arc-20260327;
        b=frGwIS+jFnV45wkEhrp7y8FQKPOKbu0iTear8hOqW8lMBK+Z0KDns+vdC7tXCNkYwf
         Ti9mRGCKGxJkEA5m90vdey8WjYbQKB3vQcc02p1UiCC7oMBzX9F9V7ws8IW3rOxP10A4
         dFdvs60jvOuMeJuSBAXe6AU92u5OpeRt3TYG/3J4ROQWE2lwN4uPznR86Yi7CCZUlect
         vei/+1tIKgUQyQRMnQwH7Izkc2mqrhmlr/pMJ7cSXeeVuoOFBYD8wRxrGU4K7/nq9C8C
         Fdug1d/qRBALYLCNPXdu5OsUAdG5dSumLREWy592jkClFtFsOFIqZxj6LoK6upkOTX21
         PAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TV8aougv0HFFxEZHCD307mI1j0UTUQCx1/QXIS2xyiY=;
        fh=e9SPQEY7nBYRJgut+gayORKGHDEW2vsJI4AzorfCsbk=;
        b=Mljr9FCt6UPWamK8EtEhmMVNiCv3ur6VRhyOw+6CYXCsGl9ZbUDfrQFP4ubXNW23aT
         5pZvIpDKGKt9EiWUxy3WsV0O3ST2ZxD9u2jC8SMipn91eZwKVJx/cEw0sc6tUdSt0RA3
         KfLwKrQ/kwLdFFFmu5jJLz/UHGe1Nrtw2h3MX98TlthBGO/SB0iwh6enHto+cq+lWur4
         2IkEYn3eknD5W/VSRlkJAp1TEnh8v6hX3CVfzWgGpdTuYpiVQVb3toAtPe5t0u+8d3zI
         B9OZuFDSfgGQBYNkhGlNtk3+fqfx5GcEZVROjiqPvS+5XMQSwerdk655DobryLxJePjX
         NrWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792830527; x=1793435327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TV8aougv0HFFxEZHCD307mI1j0UTUQCx1/QXIS2xyiY=;
        b=pRpSXZU1yQT1y44daKHD3tUj3rHLXFVwuW/CQz8RSUdaCT6N4yQKBiyjJydRsWD0pW
         g28B1qLz2bwONEtegXVtN3jQk8kTIBJnXEvdb61iXJ6GOmdcdJzzfWoGPXJ8Zc3AAkIs
         WFhFWHFXD3GvhhjyB6SZ+UEZsDPVeUQXyFq7orv9RYQ4Ddy4yyleAD4+BKuksm118uF/
         0FReZdmVzFujp+6kBucxhZu4Ep8MI33EAFpewip65G9SfZGmv5piy6+j36vFaM/mAdIu
         19DXBjsISyvcXO6q06teRbNMfwFkw+dnbAyHZsBMvLQnln/PFxgnGeCCEnOQ1fHE+nej
         2bPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792830527; x=1793435327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TV8aougv0HFFxEZHCD307mI1j0UTUQCx1/QXIS2xyiY=;
        b=a7YriSY1M/Ia89siIW7iCQYhYXtiwFSjqqjG57o0oM1TU2FKw+I62DuR+ugiJa6M1i
         sTmxVAw8vnGQkyIq/9AaHwoHbzLxRJFj6qCCRYBX+MuP46isPUrdYM2Tv+XLho2W6HZZ
         4EPP7sVQZB1QO4s+95KRrn0mwbYuYIEu/2EL+gAjsn2xbqUNH2JAzXM80EUFN58nmD78
         FFt5Db0w83BPWZp9S3QbX7Oscues4MmDZ52appX9UXIweuCNoQ5T1MiQdCg1V41fD4Rz
         4PbXd4hRlJrsFNo7b86IcFvtVYcHQ3jM1Y+3poDPsMUGmg+/GQjrIvr2IPPLhgPn/GBL
         i2Tw==
X-Forwarded-Encrypted: i=1; AKwUvBy5o5CUCA04aQZW/spXuzdxIwN53b3P+nEXX2ziKYq16T2Db5UiQMd4AyiD4rUhC8KauJadaCyc8KIZ9Cs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSvMlCvbFsyLo5sLanYcsEL6SqJrPGDacwA/jZM6AkKyUzZW08
	wWeok/VGcBecyMWYSVxYAMqmGSLS2ky/617sscXTcOM3bDYgK0Aprf88CA30dJU9x/uH4v8KqLA
	PCi+/4sbq88Ckk31JIrODJFvf1RYUSfA=
X-Gm-Gg: AYBFou1CNw1DJnUKA3LmmLSg14UojC+jLeSSlFvIwcb/HDMHCPs18juFJdQHyKcK8tD
	37urjNvDgEEkbUDRhPkAkYRodeJ6r4N8zfL18Klij/TFMZIx5/cerzxViIPAQgAyaiWiCwesFXj
	KdlxFrvT/UmM25GiUtfp9hwXgyheuNhgmaidstj3QMJ4YTDF00XaVjPF7opFw9earknmc/EZrJo
	yJwZGnIXnSYzT1iYRBsKuEXf66y++oCm/w96iuCQn5tyZ7jEtQPMux1n4XD/TVVkBlJf2WcehUP
	xZzZ4AZ1l+4tjr22T9+rZdgP1wDTLUr8N7LzYsYEP1K8WEIs65fJgNsvDCRDTg5hrAXNuGa2gDO
	N5s/kEVhhv3U1JdWFZ9X/YY9oXLoajSPqZ40PJ7PsZbO1f6BlHXpGVukcLj7jAJfcNmLCXHnvll
	W74+YqPyN1u+WHkr6ZvoZrwBs83es+5VgHiZmLPoXdBYFYSitHF8yb56J8zZi4M7IpTx910Lh9V
	xou5yMrp3KfDHWkf9c=
X-Received: by 2002:a05:620a:2a03:b0:93e:c12c:9dc6 with SMTP id
 af79cd13be357-940ef9c39f3mr186553985a.70.1792830527402; Sat, 24 Oct 2026
 01:28:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017065012.3063980-1-austin.linux@gmail.com> <n59f1S6wQICe5ZxgcNxb3w@nvidia.com>
In-Reply-To: <n59f1S6wQICe5ZxgcNxb3w@nvidia.com>
From: Austin Schuh <austin.linux@gmail.com>
Date: Sat, 24 Oct 2026 01:28:36 -0700
X-Gm-Features: AclHuK_tinEg57N73i4__wGq3AIgvdQZH-j58Q4vGTYODbuD3w6t9rMnKMeodvE
Message-ID: <CABsbf=Gvd8NGG=yafF5La-pW77QOMAXYkoyWU9y4-B8S2_0Ong@mail.gmail.com>
Subject: Re: [PATCH] firmware: tegra: bpmp: populate debugfs in the background
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, anrao@nvidia.com, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 1:16=E2=80=AFAM Mikko Perttunen <mperttunen@nvidia.=
com> wrote:
> Sashiko reports some hard to trigger but worth checking concurrency
> issues.

I couldn't find Sashiko's report, so I went looking myself and found
two, both fixed in v2:

 - The work could run across a system suspend.  Once suspend_noirq sets
   bpmp->suspended, its requests fail with -EAGAIN, and the error path
   removes the whole mirror.  v2 queues it on system_freezable_wq, so
   suspend waits for it.

 - With more than one BPMP, the populations used to run one after the
   other in their probes, and now run at once.  One failing could remove
   the shared root while the other was creating its directory in it.  v2
   holds bpmp_debugfs_root_lock across the whole population.

If you've got a link to Sashiko's report, that would be wonderful.

> This does seem a good idea, but I am a bit concerned about the change to
> what userspace sees. Ideally we'd be able to have userspace stall if the
> debugfs population was still in progress. If that's not possible, at the
> very least userspace should have a way to voluntarily wait for the full
> debugfs to be available.

debugfs has no way to stall a lookup, so v2 fills the mirror in as
.debug-populating and renames it to debug once it is complete.
Userspace either finds no debug directory or a complete one, and can
wait for it by waiting for debug to appear: polling, or inotify on the
parent, since the rename sends IN_MOVED_TO.  On the Orin Nano the rename
lands about 1.3 seconds after the initramfs starts, and before systemd
starts on the root filesystem.

If you'd rather have something explicit as well, I can add a file in
bpmp/ whose read blocks until population is done and returns its result.

> Just inline the work_struct inside tegra_bpmp. In any case the work
> should be synchronously cancelled if the bpmp driver instance is going
> to go away (not that that will happen, but good practice).

Done in v2: the work_struct is in struct tegra_bpmp, and a devm action
calls cancel_work_sync().

Thanks for the review!

Austin
