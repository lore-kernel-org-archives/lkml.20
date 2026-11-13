Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606579;
	b=0W+anMQ+JTIBX695csUZi1mgso+/I9hQl8x25nQNjwu38VSbVSLnTIfn3l/Z0+yR05Ej
	 pGsHIdeqVW/NgjNnwh3QxAq9ZdTGl8oPfek9TIzQFhfsFvMKTD1u5dK1H3z5bo5ejld1S
	 kUgQffBNhpzThga4GKUlLb/KWNNeVynO9uIZYTgl9eiQJv9faZFzl/h1OY+ExuUTFUgz2
	 PmbLGGJXql7m2YS/DPCW9PcNMwkE07xhHJoxHh5qgecbXrY2TGLb377PbL6xRJr6Aogpd
	 tf5GDP7blnO8a5memb4UXHlVDlPq93Uj7Dxhhdg4nRd4dwiwqFB8N1yh9NKktCzTAJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606579;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=Dlag7MRnimQp/VdUsSYNeNxTfLzNTam8qkTAMMPdLYU=;
	b=H0UzHdRTPlb9w6U000Qg5tBTyriGMK9FpWo5yX9OwSYsyuppbjY81jIxHpsYsXRslutc
	 uHaxknoWn94B0+Zq+98WDCMFME9IzQCLnf6EaOuuiAfyt4rk0d/OoZizYLfnwdteiDzm5
	 W59C2FO1knzkdJugoWJYGN5cJ7PMatUBUmgl1XZaX20nOMCnx1MbqCV8wGgiQnjFjhy76
	 iHCZ1LMT+1zSuciaUsaPjSXKnjuU/CdMD5KTZmsMYqQduxcpp6bZGpsFF5Ixk81vZ6asN
	 2dxua39t3Q/y+CsefT2lBA058bJKEJqqFZJjSs1KlKi4r/J2SnhLqtDqEsCSm7RBobg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fxXz9ruH;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lRioWVEm;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1EF60A3801
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E1EF60A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fxXz9ruH;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lRioWVEm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794606576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dlag7MRnimQp/VdUsSYNeNxTfLzNTam8qkTAMMPdLYU=;
	b=fxXz9ruHgrcIYZqgFbdUwHx3ncmqakHZQnegAQohNDmBLmp9ThmM55g+Q/xKUSJ/klduRY
	PoAlFaQwbvDkiJEwF2R9GvKa9k09/E955iRRD064tN5bJRIAj1NZlrvuoMK9Yy9ZAyprrP
	b8qKN8RNXGbqgxPTmhzY1ZZ4tqW7POQ=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-Kg0724XpNP2pQvCy-RSq1A-1; Fri, 13 Nov 2026 16:49:35 -0500
X-MC-Unique: Kg0724XpNP2pQvCy-RSq1A-1
X-Mimecast-MFC-AGG-ID: Kg0724XpNP2pQvCy-RSq1A_1794606574
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8615bdcc5cfso1949648a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794606574; x=1795211374; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Dlag7MRnimQp/VdUsSYNeNxTfLzNTam8qkTAMMPdLYU=;
        b=lRioWVEmAanVEmYr9P09LSzVnkES4jrotyxrKBS8/YJbB3iwj/jfsd97sfkJ+Fqi/B
         PiGWbDCGqZXXIuOaQ/TX2T4DJCCQ+bTHS5aCc2t6r5paNN1wlKcFgAzNbaCS4/KgdbZs
         302IY8gFJ0GkDnaxeoZlkGJyTxEYT57TZ1HVFTTbqNRyUm9UIY5UCeRvPryzmkO93LAo
         CspufFPmwklTu5sDDu4JtSHDxjT9iIh3dumszRnPY4iu2jVaBIL/iiRX4P4Nam7sgp59
         +UxghOZeWyUz23NFypMMbKO5eAgxzII4epjuKfq1UItb0oMUzYQEqqTeJTguHfgN1u2t
         dIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606574; x=1795211374;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dlag7MRnimQp/VdUsSYNeNxTfLzNTam8qkTAMMPdLYU=;
        b=kXY8NnHIHlE+Os90tVhR3vME56ECKU8boNRJMbE4LZkgygpOwtD1ZjfKKEikJzb+T5
         MMBu8t20ktu4a/JMXJ9fOPq3KstXKDy/nMDeTHxY5dqfTfFEjzzRhvGmvWpGybrSiig9
         0XmmlKkzIWjEdxEXmlWUnbsS+a4sh257WCtGc8YKkDyQtsdWIaytNQb3gWKFUXwFZO+/
         lcVA4zlLX7aY7cxDYWTl/ePDjzuqCdvcjoiuTnLKN4xNld4/XBpRHrOCVzvE5LGlOFDa
         p+FWQFGWCCxxOIUiwsq/VT+X3IWqOoOg6/vsfBvBI2MZRcyUEoRR4tP6A9MV5fI2hIlL
         XShQ==
X-Forwarded-Encrypted: i=1; AL+hErGv05Y4/qcDOMg6ZNYw80++TLAuwPpO+w/dJMDHUWh2gMAinX5Gq4YrtKM1uvPiMfFvykq9Ddr2KuLaEpo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vOciJZefxuJxzjuvj1Sy36Jp/7KLr07hez8T4TvPkJct5Ivo8
	+fFDlNT2BfRBKTDMbbb7lfmc9ocoUvW6jpgcLbSRKrCOa9PZks7EMHTjfW1AFCyUZw0TwGywRsa
	z8KFGQe1ZjflzmxisqKKnmE3jDhcqU30gO96ZodISF9SL1T7UZVh0rYSKNrvRBojFIg==
X-Gm-Gg: AYBFou1+K0+jj/7Z6oAaTeGnQZBNr26QO2kDwQRxIXUhf0uCs77O94cuxN8vyOUr5nT
	axaFvXpnTffvoXEX2gjLHyU/CtKU3O+FmitGZ7d2sjLv9e55oFKBl+aOSbh7Q9Dfpuv+NM3vgJC
	BcyaWlssbzoeZs355Xt0lzCVQOMOsYScWdg0v1AS/F6YxcidW5HPrOTD3a/PYm3AKl2lhM//rOf
	lKiYxLTdzutnnApublaroHn1X9fPpYeSVamZnn40/CleMTOWFwIrNh45Y8pH324Ms8tv+c4pW6I
	7oZgFdQ2jCVYvJVnWds7X0i6kUu9vRxEv2wQDSfcuA7AX2EXsdqr550HrRtZMkWq/990NK2Whpo
	OzSbHzi48eIbc6Oqu7VUfZDzXqdXjcrEiW0xGxJFC8928YmSq5eJxKyXvaE6XAIPL+DSLNIHBvq
	Z7PSi3b3UjgCV74//dHFzR0ZFsuRAx
X-Received: by 2002:a05:6830:230c:b0:81f:da91:c984 with SMTP id 46e09a7af769-8628984ffd3mr5321301a34.11.1794606574268;
        Fri, 13 Nov 2026 13:49:34 -0800 (PST)
X-Received: by 2002:a05:6830:230c:b0:81f:da91:c984 with SMTP id 46e09a7af769-8628984ffd3mr5321261a34.11.1794606573813;
        Fri, 13 Nov 2026 13:49:33 -0800 (PST)
Received: from crwood-thinkpadp16vgen1.minnmso.csb (71-34-16-191.mpls.qwest.net. [71.34.16.191])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862881a965esm3363739a34.25.2026.11.13.13.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:49:33 -0800 (PST)
Message-ID: <c03ddcb736c86c7fa16d8beeb8af9ecb6343d9f5.camel@redhat.com>
Subject: Re: [PATCH v6 02/10] tracing/osnoise: start_kthread: Always check
 OSN_WORKLOAD
From: Crystal Wood <crwood@redhat.com>
To: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Gabriele Monaco
 <gmonaco@redhat.com>, 	linux-trace-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 13 Nov 2026 15:49:32 -0600
In-Reply-To: <179447882048.254241.2527227025791137084@gmail.com>
References: <20261028220120.4005187-3-crwood@redhat.com>
	 <179447882048.254241.2527227025791137084@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-12 at 18:20 +0800, Chaosheng Qu wrote:
> On Wed, 28 Oct 2026 17:01:20 -0500
> Crystal Wood <crwood@redhat.com> wrote:
>=20
> > We can get here on timerlat with OSN_WORKLOAD cleared via
> > osnoise_hotplug_workfn().
>=20
> Confirming this from the other side, because it is worse than a stray
> thread.  On 7.3-rc7, with `rtla timerlat top -q -c 0,1` and cpu1 cycled
> offline and back online mid-run, the CPU coming up installs a
> "timerlat/1" kthread even though OSN_WORKLOAD is clear.  stop_kthread()
> picks the teardown path from the *current* OSN_WORKLOAD, so when the
> trace stops it takes the user-thread branch for that kthread:
>=20
>     WARNING: at stop_kthread+0xc6/0xd0, CPU#1: rtla/57
>     WARNING: at __put_task_struct+0xdf/0x100, CPU#1: timerlat/1/72
>     WARNING: at free_task+0x7d/0x90, CPU#1: kthreadd/2
>     BUG: kernel NULL pointer dereference, address: 0000000000000018  (rep=
eated)
>=20
> kill_pid() plus put_task_struct() is only right for the user thread,
> which owns the reference taken in timerlat_fd_open().  A kthread is owned
> by kthread_stop(), so the extra put frees it while it is still running.
> A plain offline (never bringing the CPU back) does not reproduce it,
> because nothing calls start_kthread() then.  So 02/10 fixes a null-deref
> here, not just a redundant thread.

If you stop at patch 2 I'm sure you'll find other ways to make it go
boom too :-)

> One thing about the series itself:
>=20
> 02/10 sets osn->sampling, but `struct osnoise_variables *osn` is not
> declared in start_kthread() until 04/10:
>=20
>     @@ -2053,15 +2081,18 @@ static int start_kthread(unsigned int cpu)
>     +	struct osnoise_variables *osn =3D cpu_osn_var(cpu);
>=20
> so 02/10 alone does not compile with CONFIG_OSNOISE_TRACER=3Dy.  Sashiko
> flagged this on v6 and it looks like it is still there in the posted
> version.  I applied 02/10 on its own on 7.3-rc7 to be sure:

This should be fixed in v7.  Not sure what you meant by "the posted
version" other than v6 itself.

>=20
>     kernel/trace/trace_osnoise.c: In function 'start_kthread':
>     kernel/trace/trace_osnoise.c:2043:25: error: 'osn' undeclared (first =
use in this function)
>      2043 |                         osn->sampling =3D true;
>=20
>     +	if (!test_bit(OSN_WORKLOAD, &osnoise_options)) {
>     +		if (!timerlat_enabled())
>     +			osn->sampling =3D true;
>=20
> Either move the "osn" declaration into 02/10, or keep
> `cpu_osn_var(cpu)->sampling` in this patch and let 04/10 switch it.  The
> second keeps each patch buildable on its own, which helps anyone
> bisecting the series.

I moved the declaration into patch 1, which seemed more appropriate
given that patch is all about cleaning up the per-cpu references.

-Crystal

