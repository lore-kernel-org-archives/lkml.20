Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524214;
	b=nQZDuOMIOpGICS91c6L57EJEMsnEoEZUl3ih4unnCLfgTIbOHHH0w+/q1mja0UvvORg4
	 /UNIvwUSuCzIiAGHg4Ws7wATY89Uv4h/VCMdfTPwSJEd/VgcwlBNj9SedoX1AtrhShNN5
	 24QIO+AiSKZrNmDc9K7YgjkjSnMcfJbe7kKEfeSICPTMVl5cXoFON6xg8lGC5EqH/UEjZ
	 /DQlvtstIjUyF3iE9cLqT+pHEOsJ4H8hmVBqfoI9lhqgokLanGIp2Q6UJEA9YgHgIv4YH
	 rirbYz4KuMtUAxFud/sIsFZfJxda2wSojt/JdrGC9awKjmZTPOvKdVrrmi486FMZlBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524214;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=5dtQ92DuU1Ej2VqHzsi67mkbj6sG71DV74OruGJS5Z4=;
	b=GzWxF+iRrRbZi1hBG52py2nZjGpDG5N73knUi+OKrnRNxc7oaUIvbuDX7tyUj9OtbcpR
	 keo+gw/a0fIsWoP/ysJ1zj/Ttnod90V5hWJON6dI4DAYnkg6QEaKvwoXbOTCKk+GP1meQ
	 yiqrjXo1Wo7Te5RxUaqOSO35Ev4oN2SxTF1eMlg3sDNDZL6z0wFJQu1lfPIJ33KubfMi/
	 5C6ZjvOkOwf/jLep+LYnFVU67uypqv/EODakN22Y1X/N4SejXtoT6SR4FTDIEBZJMsLmR
	 IPLwa33dOdtKOSwh22GfCV1c1smX82NcB55OJf+2yiTam6g9y3D0mjThzjm2vYsUjbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DqFhkLgV;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C26606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07C26606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DqFhkLgV
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so1323928a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792524213; x=1793129013;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5dtQ92DuU1Ej2VqHzsi67mkbj6sG71DV74OruGJS5Z4=;
        b=KlQ99BVmm+YpH4SBX3oyY+qQSxY9ifuNnc6v3So98BWJxYfQwGAw8VaoRM0CCNnuhY
         TNelTJzJ9UF3pOJF17L2SWung6aZEPakD/mjxYEbolekMol4l5j3O3tseQ5fxgTYFtyd
         CM1vtl/Qz2fXrVcpxlsl6+QzkRpSuDcYldtyFnpSsFl1BOC8kT+sG0PELumLzYs05OPX
         7+mrm9hwV+fhyUXY9XYgqxe9ez5JWIoVsMYYXwXwO7EP5rlozIYcCCra1PsG07w8tf00
         508lqcj5uSLXAKBUHz6DoURylYeWn08E+dFRDl3ojvADGwX/3NEolWo2BNlD4dV+t+6d
         27kA==
X-Forwarded-Encrypted: i=1; AKwUvBxwchSs3/3XBl+rXeEbjLef0rqDBXe4GOnfInqgy9YT6Yaj3GcdMxxy3i9G+oKXjvWSHupCKMqqitIA7Xw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzCIC+cChzfJXVnWyFLOfYcV/RcrGLOlCrILbEuJ+FnSFaPmXu
	+CwuBZ9ftWkle9ytO16086qI1NDBh9rfUV/xis/kH4HD2Jg2d2yrZEwPfaY0kGV2YBTsEttAEnZ
	raPRZm9ynA0ziqyXyWYhKgsJ8rm1ZdfMGC3ImusnlQSQpeDqwlIkI4MdwWA5OWURnkBVaaEAMK1
	by1EzqdMlZd7K+oPLdYG7PpVIcvguVl5N/K0bMLiT4BwsR5+pHLlDcaNOxD12s4LTUo9watSZrL
	Oxq6t7EqpPE9ydm
X-Gm-Gg: AYBFou1TCy/1MWYW+kSo71LGvK9ZtvFh9PWuv1HSf2wjMv8S/ZRJfxMhEKTkJ/iPpEd
	WfmLYsNHB1w1bLVuFcEC4mLeTZ3hMCbOmuE+k8MvbrX7f5i8rd6uWVvxIjZYKq31l4MQSMl2skZ
	niTiYIGSQAt3gaLtfKQKSth/ODznL2XedQOlKerSMbX+RUApmsAkLx/QGuY+8uSGOZe8MrtE9Dj
	AndeTd2qyA22TdhCqgz+Ejjs9qWsybrOGjVv191AsLSOmQSxyIGCjBr5TwAYsxRZoPYCAa4745k
	MsiOPQytTyeFH8A+7Ggk8Q1KxqCEuaGy+JWLUW+3rfjoZRsv9Di2LS3RA4w05uvRk8TWHHu1MRt
	bmzBs1O1pri1EGjRXQ3y/KI8YD6GkRZrga+TfoiISWKL1CvUkhL/5BJ746G2EUfMF1NE53SpM56
	JgaPeBK2cOBHJ8Uif6ZhegJAksb2g4n9Kyfq0=
X-Received: by 2002:a17:90b:574b:b0:3ac:9717:afd1 with SMTP id 98e67ed59e1d1-3acef589989mr9857219a91.63.1792524212410;
        Tue, 20 Oct 2026 12:23:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ad81a5e1f5sm296552a91.4.2026.10.20.12.23.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 12:23:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3ab117eba28so107481fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792524210; x=1793129010; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5dtQ92DuU1Ej2VqHzsi67mkbj6sG71DV74OruGJS5Z4=;
        b=DqFhkLgV7Ohi1tiz9e2CjViSf7c7Letl46pE31KJClR1XM8kpZBB+i5VbKSVuJmBfd
         f8wqnYGbzihAss6VA4UsQl5231TR6GEWgMQGBt1AuFymMHYps3LCxB3oUaGhTZ19Qch8
         UxXEO4CP1I2IyUAW76GPEzCe/1kWh7Pay6O7I=
X-Forwarded-Encrypted: i=1; AKwUvBzfHS51o7Dax6sOrtwbKzA/JGIaVy3NLTAHPT/UO0QKBSs8reE2zV2OB2MQQvwhG7ILr0tHTSXft87RRNs=@vger.kernel.org
X-Received: by 2002:a05:6512:a91:b0:5bc:d39d:b451 with SMTP id 2adb3069b0e04-5be509f6638mr4064184e87.9.1792524210013;
        Tue, 20 Oct 2026 12:23:30 -0700 (PDT)
X-Received: by 2002:a05:6512:a91:b0:5bc:d39d:b451 with SMTP id
 2adb3069b0e04-5be509f6638mr4064176e87.9.1792524209462; Tue, 20 Oct 2026
 12:23:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1790014793.git.zack.rusin@broadcom.com> <81cb85568b36273a8e66215b3e6d671b8488d402.1790014793.git.zack.rusin@broadcom.com>
 <bc783856-9480-3944-67fb-675e4c11d8c2@igalia.com> <atdYIxwz8ksYNty6@pathway.suse.cz>
 <atd7GInNurGWLUha@pathway.suse.cz> <ateYxCu63pRY9EGq@pathway.suse.cz>
In-Reply-To: <ateYxCu63pRY9EGq@pathway.suse.cz>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 20 Oct 2026 15:23:15 -0400
X-Gm-Features: AclHuK9M32-EdHA1PszLB6Y1IscuEU7zjL5tmXKU0jHcFstdblGuIKRQsty0q34
Message-ID: <CABQX2QOKCpoUY_ObhFif7xN7OF-NzcxEM0JABAXo9n9KaacO7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] panic: Add a notifier chain for pre-kdump callbacks
To: Petr Mladek <pmladek@suse.com>
Cc: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Borislav Petkov <bp@alien8.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <baoquan.he@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, x86@kernel.org, 
	Joel Granados <joel.granados@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux.dev, 
	Dave Young <ruirui.yang@linux.dev>, bcm-kernel-feedback-list@broadcom.com, 
	linux-kernel@vger.kernel.org, John Ogness <john.ogness@linutronix.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Bo Gan <bo.gan@broadcom.com>, Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>, 
	kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Michael Kelley <mhklinux@outlook.com>, Ian Forbes <ian.forbes@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000cf5d5f065e4a90fc"

--000000000000cf5d5f065e4a90fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Petr.

First of all I really appreciate you going over this. Thanks!

On Tue, Oct 20, 2026 at 12:37=E2=80=AFPM Petr Mladek <pmladek@suse.com> wro=
te:
> Approach B: Three lists: platform, smp_safe, and smp_unsafe()
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> It is similar to approach A. We would just add an extra:
>
>      + panic_notifiers_platform_list
>      + disable_panic_notifiers_platform_list
>
> This list would be used for smp-safe notifiers which are
> required be some platform. It would be the notifiers which
> are crucial. Which are currently the reason to set
> "_crash_kexec_post_notifiers".
>
> It might be called also when __crash_kexec() is called
> outside panic().
[...]
> This patchset, adding vmware_log_notifier, might implement just
> the panic_notifiers_platform_list. The rest might be
> added by another volunteer.
>
> How does this sounds, please?

That sounds good to me. For v3 I'd do just the platform list:

- One call in vpanic(), right after kgdb_panic() and before the first
__crash_kexec(), whatever crash_kexec_post_notifiers is set to. The
list runs before kdump and before the other CPUs are stopped.
- One call in __crash_kexec(), after it has taken the kexec lock,
found a crash image and saved the registers, for paths that enter
kdump without panic(), like oops_end() or Hyper-V's hv_crash_handle().
Once the early panic call has run the list, the guard makes this one a
no-op. That removes the dependence on crash_kexec_post_notifiers you
pointed out before.
- A once-only guard shared by both, so the list also runs only once
when a callback panics.
- disable_panic_notifiers_platform_list as a boot and runtime switch,
checked in the same helper, replacing panic_pre_kdump_postpone.
- Kernel-doc with your definition: smp-safe callbacks a platform
needs, which would otherwise be a reason to set
crash_kexec_post_notifiers.

Roughly:
        kgdb_panic(buf);

        panic_notify_platform();

        if (!_crash_kexec_post_notifiers)
                __crash_kexec(NULL);

and in __crash_kexec():

        crash_setup_regs(&fixed_regs, regs);
        /* Direct entry outside panic() */
        panic_notify_platform();
        crash_save_vmcoreinfo();

I'd keep the second call in __crash_kexec() rather than crash_kexec(),
because afaict crash_kexec() can return without a crash image, e.g.
from the BPF kfunc, or from oops_end() before it panics. Calling the
list there would use up the guard even when no kdump follows.

crash_kexec_post_notifiers, the existing list and the kmsg dumpers
stay as they are, and moving other platforms over can come later.

The VMware log copy would be the only user, and it's still best-effort
diagnostics: kdump and the reboot don't depend on it. It copies the
log tail into an 8 KiB buffer. On panic() that happens after the panic
message and any local backtrace; on direct entry from an oops, after
the exception output. With the list enabled throughout, the copy
precedes the later panic notifiers, sys_info() and the all-CPU
backtrace step. The guest-crash report stays a late kmsg dumper that's
skipped while a crash kernel is loaded, because the host can power off
the VM inside that call.

If that matches what you had in mind, I'll do it that way in v3.

Guilherme, Stephen, Baoquan, does that work for you too?

z

--000000000000cf5d5f065e4a90fc
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIVIgYJKoZIhvcNAQcCoIIVEzCCFQ8CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghKPMIIGqDCCBJCgAwIBAgIQfofDCS7XZu8vIeKo0KeY9DANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNTNaFw0yOTA0MTkwMDAwMDBaMFIxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBS
NiBTTUlNRSBDQSAyMDIzMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAwjAEbSkPcSyn
26Zn9VtoE/xBvzYmNW29bW1pJZ7jrzKwPJm/GakCvy0IIgObMsx9bpFaq30X1kEJZnLUzuE1/hlc
hatYqyORVBeHlv5V0QRSXY4faR0dCkIhXhoGknZ2O0bUJithcN1IsEADNizZ1AJIaWsWbQ4tYEYj
ytEdvfkxz1WtX3SjtecZR+9wLJLt6HNa4sC//QKdjyfr/NhDCzYrdIzAssoXFnp4t+HcMyQTrj0r
pD8KkPj96sy9axzegLbzte7wgTHbWBeJGp0sKg7BAu+G0Rk6teO1yPd75arbCvfY/NaRRQHk6tmG
71gpLdB1ZhP9IcNYyeTKXIgfMh2tVK9DnXGaksYCyi6WisJa1Oa+poUroX2ESXO6o03lVxiA1xyf
G8lUzpUNZonGVrUjhG5+MdY16/6b0uKejZCLbgu6HLPvIyqdTb9XqF4XWWKu+OMDs/rWyQ64v3mv
Sa0te5Q5tchm4m9K0Pe9LlIKBk/gsgfaOHJDp4hYx4wocDr8DeCZe5d5wCFkxoGc1ckM8ZoMgpUc
4pgkQE5ShxYMmKbPvNRPa5YFzbFtcFn5RMr1Mju8gt8J0c+dxYco2hi7dEW391KKxGhv7MJBcc+0
x3FFTnmhU+5t6+CnkKMlrmzyaoeVryRTvOiH4FnTNHtVKUYDsCM0CLDdMNgoxgkCAwEAAaOCAX4w
ggF6MA4GA1UdDwEB/wQEAwIBhjBMBgNVHSUERTBDBggrBgEFBQcDAgYIKwYBBQUHAwQGCisGAQQB
gjcUAgIGCisGAQQBgjcKAwwGCisGAQQBgjcKAwQGCSsGAQQBgjcVBjASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBQAKTaeXHq6D68tUC3boCOFGLCgkjAfBgNVHSMEGDAWgBSubAWjkxPioufi
1xzWx/B/yGdToDB7BggrBgEFBQcBAQRvMG0wLgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9i
YWxzaWduLmNvbS9yb290cjYwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjYuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yNi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUAA4IC
AQCRkUdr1aIDRmkNI5jx5ggapGUThq0KcM2dzpMu314mJne8yKVXwzfKBtqbBjbUNMODnBkhvZcn
bHUStur2/nt1tP3ee8KyNhYxzv4DkI0NbV93JChXipfsan7YjdfEk5vI2Fq+wpbGALyyWBgfy79Y
IgbYWATB158tvEh5UO8kpGpjY95xv+070X3FYuGyeZyIvao26mN872FuxRxYhNLwGHIy38N9ASa1
Q3BTNKSrHrZngadofHglG5W3TMFR11JOEOAUHhUgpbVVvgCYgGA6dSX0y5z7k3rXVyjFOs7KBSXr
dJPKadpl4vqYphH7+P40nzBRcxJHrv5FeXlTrb+drjyXNjZSCmzfkOuCqPspBuJ7vab0/9oeNERg
nz6SLCjLKcDXbMbKcRXgNhFBlzN4OUBqieSBXk80w2Nzx12KvNj758WavxOsXIbX0Zxwo1h3uw75
AI2v8qwFWXNclO8qW2VXoq6kihWpeiuvDmFfSAwRLxwwIjgUuzG9SaQ+pOomuaC7QTKWMI0hL0b4
mEPq9GsPPQq1UmwkcYFJ/Z4I93DZuKcXmKMmuANTS6wxwIEw8Q5MQ6y9fbJxGEOgOgYL4QIqNULb
5CYPnt2LeiIiEnh8Uuh8tawqSjnR0h7Bv5q4mgo3L1Z9QQuexUntWD96t4o0q1jXWLyrpgP7Zcnu
CzCCBYMwggNroAMCAQICDkXmuwODM8OFZUjm/0VRMA0GCSqGSIb3DQEBDAUAMEwxIDAeBgNVBAsT
F0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpH
bG9iYWxTaWduMB4XDTE0MTIxMDAwMDAwMFoXDTM0MTIxMDAwMDAwMFowTDEgMB4GA1UECxMXR2xv
YmFsU2lnbiBSb290IENBIC0gUjYxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2Jh
bFNpZ24wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCVB+hzymb57BTKezz3DQjxtEUL
LIK0SMbrWzyug7hBkjMUpG9/6SrMxrCIa8W2idHGsv8UzlEUIexK3RtaxtaH7k06FQbtZGYLkoDK
RN5zlE7zp4l/T3hjCMgSUG1CZi9NuXkoTVIaihqAtxmBDn7EirxkTCEcQ2jXPTyKxbJm1ZCatzEG
xb7ibTIGph75ueuqo7i/voJjUNDwGInf5A959eqiHyrScC5757yTu21T4kh8jBAHOP9msndhfuDq
jDyqtKT285VKEgdt/Yyyic/QoGF3yFh0sNQjOvddOsqi250J3l1ELZDxgc1Xkvp+vFAEYzTfa5MY
vms2sjnkrCQ2t/DvthwTV5O23rL44oW3c6K4NapF8uCdNqFvVIrxclZuLojFUUJEFZTuo8U4lptO
TloLR/MGNkl3MLxxN+Wm7CEIdfzmYRY/d9XZkZeECmzUAk10wBTt/Tn7g/JeFKEEsAvp/u6P4W4L
sgizYWYJarEGOmWWWcDwNf3J2iiNGhGHcIEKqJp1HZ46hgUAntuA1iX53AWeJ1lMdjlb6vmlodiD
D9H/3zAR+YXPM0j1ym1kFCx6WE/TSwhJxZVkGmMOeT31s4zKWK2cQkV5bg6HGVxUsWW2v4yb3BPp
DW+4LtxnbsmLEbWEFIoAGXCDeZGXkdQaJ783HjIH2BRjPChMrwIDAQABo2MwYTAOBgNVHQ8BAf8E
BAMCAQYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUrmwFo5MT4qLn4tcc1sfwf8hnU6AwHwYD
VR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwDQYJKoZIhvcNAQEMBQADggIBAIMl7ejR/ZVS
zZ7ABKCRaeZc0ITe3K2iT+hHeNZlmKlbqDyHfAKK0W63FnPmX8BUmNV0vsHN4hGRrSMYPd3hckSW
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGWDCCBECg
AwIBAgIMYT8cPnonh1geNIT5MA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI0MTEyODA2NTUwOVoXDTI2MTEyOTA2NTUwOVowgaUxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEWMBQGA1UEChMNQlJPQURDT00gSU5DLjETMBEGA1UEAxMKWmFjayBSdXNpbjEmMCQGCSqG
SIb3DQEJARYXemFjay5ydXNpbkBicm9hZGNvbS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
ggEKAoIBAQCwQ8KpnuEwUOX0rOrLRj3vS0VImknKwshcmcfA9VtdEQhJHGDQoNjaBEFQHqLqn4Lf
hqEGUo+nKhz2uqGl2MtQFb8oG+yJPCFPgeSvbiRxmeOwSP0jrNADVKpYpy4UApPqS+UfVQXKbwbM
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIJgn
CNxVL33+iqpOJLjSQE+fI6/B7+bT9NdTrK/5e0egMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTAyMDE5MjMzMFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBABXeJ4Zi7Hx37m/4xuENMuaBIjI5g8sV098DSsuq
GGOgFSRS+bPdWT+JQ5Th/CRo3u1z6eeXt3O18LZ2WHsM7+gUEGWy2LigXj16/Vkx7Wf6bIJ7OGyM
gvgMvpksvF0e8Er257K13eJFI8y1wyIM9EjupE87WC0j6Qrso26z6FVa4oCd/WIQj6LmheoX6BiI
4uqtLF21GGeLkrrv/qVwvyNXTsCZlii5gIifsGkS1Wu4/p1Q3YKmXStgF8+LfwpsBnWKCAoU59+U
DzxSNhTpQDkXXuTb+stS9jFKvjaPK3Dks11VMG88eqDfHIw71W2iGOuYqt/iCDJAGZhokJecljo=
--000000000000cf5d5f065e4a90fc--
