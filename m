Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE05530E0F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997670; cv=none; b=raAcWc3PEofXCWHlBwEtUBcvRTfgtwXUB5ZagGufct4KZL3L6vxRTRBo/8f9rVb0BfCOHO400QwfwjUf1NAr067DmHscigTL+ufJ3meyxZt1Hx/t+e9jjG536/gj+/EhD32R+ov6ejCDXv6Y3/FC+XS/aPpCoDghUIw+eFM0eQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997670; c=relaxed/simple;
	bh=Y5G0mMRpazj+l72BXubNfUUmLZPNnidwgRwTbstnri0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PeIgI96wvLcewfSzZmvgQNS1vm1SKJg2vyO7okm9OE6RAezCXpyImvGofMeQXxENyYAvSYH0jeCzsyCXmK3jLz537+D1hyUJEMU7F3BHFy1xoa9juOuFOpQ+XDWAtVvtAhgj9g403PHO/ejlCV8/7wxEfLJiT3A6ziIk9cOHEp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Wxi1dvfO; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Wxi1dvfO"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso549054a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791997669; x=1792602469;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EPBQKB8avX7XdZFu2VVKrfLOEV5/DL70jPe3HkgjCyI=;
        b=0ogi+isSsTSnTmGRxPnmh8etcxjT2ZDisY6iFIbAJZkjnelEcqlvKsrD5BvQWLfsh/
         kz5GoksWcFDRRn70o2Rk4exK6pAxmOcCErVj4QwAXcsqOtI4zTkOEp91Jydk3lOBMgqs
         EuPvBJ614DNbIkhcoqR6PRocmwkdHGal51CNH9oqF8p3lunY5Shm4pMzQkqMJ8t0F2Px
         8t3wgy2eqRd+LB4tsUCImKaonaCwqn/5TJtgtMPZ2SFzGrEpldTserwgCXZTHkGLjcuJ
         jfWwklePn0JQx2rnQ3USQydeU+Lf9L9ykCranOmW0p/s5YhbBOGH81T2eyxuB6Q5s9dS
         /5XQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgbHB4uONmJlDordhMwXe6/Sw4bevhfIWCoc3w5ScRbNNL1SS2HAqSKbSpYltIrsa0MmkCgYt+gT/I7Kk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfTH9CwPjzOI4hyEQw24CBPiE+et70aUTmRxEmH6yo/D8BQSWa
	FyuYgKW3R5b/Zieu3XukD2miFD58SUu8UerAyxIGfLEzbnxswpkDVh8TLYh8q93PN5NFYRt4xgb
	b2ljID/tP/1eldYmA2UeeP5i8rq9FT5NB8RiJWp1nLrmAIjnGrh/d8+WUYKK2I1HXcfZsdjepAq
	+x0pTkrQhAWmGjGSx2jhxlUNn1xaNNaGAoe6I3s7uPOUDnsKz4OTbZh+7ofpxg5fU+VdAzosrsh
	22KSezmBqkBJEFI6Cc=
X-Gm-Gg: AYBFou0TcuMhdT2TSh2QeazrnQf+WGPqlJuWNn2oO0CwTg9yAPpbs6EUHoTslM0SYWV
	YZ1i4ISa4aRojrUH53AY+5+uZQiSoTRABeMo9+67a1Q7uXKcN+2Vaavo4O25CBOrOLoYB1/Rygv
	f1vo2/e10WZ8rRcK9WdVZIVMtpCbE/zZuHU2x95SG8Fu2vTWw0q/kqCsCdpUB0d6ieRKIMl+4iM
	tWCBFjAalTkdSFclwlDm4ns1LsL3tfRPASnZw85JxhqRSgBdlb8idez/igoYS4nmAu/By48s53E
	1JbRSZsr29z0fWxdwt8s75HoY7Pvs9oYgLaFbEBRhGRN35JiSDOzjHCLi2jxL6FygRMO+3zWrpv
	ybi0zmRa+4av5kVTkqaIL4Z41/K5Seykq+3FH5X2XmxP1OlZBmUjuYVPtB5BV5appM9ow533Dc7
	64+4Qma+1Ij/maSzZF7rq0Bmh8A9cN7xon/h8=
X-Received: by 2002:a17:90b:2d8e:b0:3ab:c674:d83c with SMTP id 98e67ed59e1d1-3abc674eb8amr8424015a91.27.1791997668503;
        Wed, 14 Oct 2026 10:07:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ac9462cba7sm98454a91.4.2026.10.14.10.07.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2026 10:07:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3a9e7d65fe4so20170511fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791997665; x=1792602465; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPBQKB8avX7XdZFu2VVKrfLOEV5/DL70jPe3HkgjCyI=;
        b=Wxi1dvfOVInqM3/wUAHrhkIfFzklnZiv0lcd12BGVc3TTVUAIl0mnMEaEvfq6YYVoZ
         6k8tn9UwhieKdR2PFyW/PkdaZTyfQoyWfGEXbxglnmZjt8mM7ZKMREheH0tHb8C+zhjo
         qbEu7pXD3gMWQzLwpWdGFDNTRWGxBarD1vMtI=
X-Forwarded-Encrypted: i=1; AKwUvBzb91Cd3ac4WdJ4uQWNjuGtFrDgKIA+bF0BB7HGVXCXxa17wlzI53eAKBTysQ8o60L7DR7d6pfsg03v/ws=@vger.kernel.org
X-Received: by 2002:a05:651c:b27:b0:3a6:6aad:be45 with SMTP id 38308e7fff4ca-3a9c54b789fmr36820581fa.10.1791997665343;
        Wed, 14 Oct 2026 10:07:45 -0700 (PDT)
X-Received: by 2002:a05:651c:b27:b0:3a6:6aad:be45 with SMTP id
 38308e7fff4ca-3a9c54b789fmr36820461fa.10.1791997664890; Wed, 14 Oct 2026
 10:07:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790014793.git.zack.rusin@broadcom.com> <364337F4-8127-4693-BB85-E0657B634B43@mainlining.org>
In-Reply-To: <364337F4-8127-4693-BB85-E0657B634B43@mainlining.org>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 14 Oct 2026 10:07:30 -0700
X-Gm-Features: AclHuK-pXeefcjtxG6LN0Usydz067LI9rz9CqzP8-9S0l3gWG-8eO_FkGWWqZ_g
Message-ID: <CABQX2QMX7yQgKwY7EnazH6ejAExx_hb2o8Vcw21E+kucYz=h-A@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] panic, x86/vmware: Preserve crash logs before kdump
To: Bradley Morgan <brads@mainlining.org>
Cc: ajay.kaher@broadcom.com, akpm@linux-foundation.org, 
	alexey.makhalov@broadcom.com, baoquan.he@linux.dev, 
	bcm-kernel-feedback-list@broadcom.com, bo.gan@broadcom.com, bp@alien8.de, 
	brennan.lamoreaux@broadcom.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	gpiccoli@igalia.com, hpa@zytor.com, ian.forbes@broadcom.com, 
	joel.granados@kernel.org, john.ogness@linutronix.de, kees@kernel.org, 
	kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maaz.mombasawala@broadcom.com, 
	mhklinux@outlook.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pmladek@suse.com, pratyush@kernel.org, rdunlap@infradead.org, 
	rostedt@goodmis.org, rppt@kernel.org, ruirui.yang@linux.dev, 
	senozhatsky@chromium.org, skhan@linuxfoundation.org, 
	stephen.s.brennan@oracle.com, tglx@kernel.org, virtualization@lists.linux.dev, 
	x86@kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000004c2873065dcff8c3"

--0000000000004c2873065dcff8c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 1:40=E2=80=AFPM Bradley Morgan <brads@mainlining.or=
g> wrote:
>
> On 28 September 2026 18:55:34 BST, Zack Rusin <zack.rusin@broadcom.com>
> wrote:
> >A VMware guest may have no persistent storage or working userspace after
> >a crash. Preserve its newest kernel log tail in the host's vmware.log
> >before entering kdump, without enabling every panic notifier by default.
> >
> >Following Petr's suggestion, add one generic panic_pre_kdump_list with
> >VMware as its first client. A set-once helper covers panic() and direct
> >crash-kexec entry. Fatal oopses can reach kdump without calling panic(),
> >so patch 2 adds that call after capturing the original registers under
> >the existing kexec lock. The late panic call follows sys_info() and
> >precedes the kmsg dumpers.
> >
> >Patch 3 adds Guilherme's suggested escape hatch for debugging kdump
> >failures involving early callbacks. With panic_pre_kdump_postpone set,
> >the list runs before kdump only when crash_kexec_post_notifiers is also
> >set. This can omit hypervisor crash handling as well as diagnostics.
> >The late panic call remains eligible. This policy is a separate patch;
> >I can omit patch 3 if it is not wanted.
> >
> >The logger preallocates an 8 KiB buffer and bounds its register-based
> >RPC transfer and retries. Michael suggested increasing the buffer
> >because 4 KiB can omit useful stack-trace context. Ordinary guests
> >enable logging by default; encrypted guests must opt in. Use
> >bool/proc_dobool for the sysctl as Joel requested. The potentially
> >terminating REPORTGUESTCRASH event remains a separate late dumper,
> >suppressed whenever a crash image is loaded. The v1 assignment to
> >crash_kexec_post_notifiers is dropped.
> >
> >Tested on VMware Workstation and ESXi with ordinary guests, and on
> >ESXi with SEV-SNP and TDX guests.
> >
> >v1:
> >https://lore.kernel.org/r/cover.1788414671.git.zack.rusin@broadcom.com
> >
> >Zack Rusin (6):
> >  panic: Add a notifier chain for pre-kdump callbacks
> >  crash: Notify pre-kdump callbacks before switching kernels
> >  panic: Allow postponing pre-kdump notifiers
> >  x86/vmware: Add a bounded pre-kdump log sender
> >  x86/vmware: Add the vmware_record_panic_msg sysctl
> >  x86/vmware: Report guest crashes after kmsg dumpers
> >
> > .../admin-guide/kernel-parameters.txt         |  14 +
> > Documentation/admin-guide/sysctl/kernel.rst   |  20 ++
> > arch/x86/include/asm/vmware.h                 |   2 +
> > arch/x86/kernel/cpu/vmware.c                  | 250 ++++++++++++++++++
> > include/linux/panic_notifier.h                |   4 +
> > kernel/crash_core.c                           |   3 +
> > kernel/panic.c                                |  28 ++
> > 7 files changed, 321 insertions(+)
> >
>
> All the panic changes and crash_core changes looks good to me!
>
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
>
> Tested basic panic calls with Power10, in courtesy of osuosl:
>
> Tested-by: Bradley Morgan <brads@mainlining.org> # Power10

Thank you for testing!

Petr, do you have any thoughts? I think this version addresses all of
your concerns/suggestions from v1.

z

--0000000000004c2873065dcff8c3
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
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
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIEFo
IJ5vd/MUhAk2bv3a6kGZnwx1m1lxJbC2yytLvdDuMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTAxNDE3MDc0NVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBABK9edzXmHJsrnESInLkCDpMxAeQWV5jzCabkD63
GDvvFykL23/V0cxhOSPMDMCRC9nn0dsnVDcbFl9Zhc4DtkDZuXCbQENDMfMUSI/GePHHJG8YnjrD
2JWCESHf00TcVrhQbaO1r4Nq7xZtgMbLEeEz5zIB7hjmqikeVV6EyHhSloq+nAx07GaiUnIlZwoA
+Um86trs2MIo17ep5P50407bAKu5B9UkDlVvUWYNFpmBYZ02S+tKGkXM93HQ0hBzHbrwpTcko8Tn
6gqJzfNUh5LDuNdSF+L/WRZqxKEVQcHaRRsf16bPWPxCB7I+x++uf69cRAP2I0rYxLtm5Et7KXc=
--0000000000004c2873065dcff8c3--
