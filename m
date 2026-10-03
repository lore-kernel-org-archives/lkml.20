Received: from mail-yx1-f97.google.com (mail-yx1-f97.google.com [74.125.224.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B271C37BE98
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 07:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791011945; cv=none; b=lgOxU9OiKXwmXHuB1KOwvfxUQSSMLxHgM4CcjgwuJRslormga414UbliaZU0a3ev9HN2Gj+rg1UbDsluTqabqSjNR73fp7/saG6kHOA0WLgYa3At1CB7vRKEO4SZVlDYh1Lt55eiWHgZLLcNhMymS50nZuMrchLBQfm08M8COEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791011945; c=relaxed/simple;
	bh=U7A1x2BN1auK5sksrN69H8ZKxVr9MDroEa92Obb5CBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtQzmPSNoMGY9n/2t8v5B/dS98f+hVP2ku6tHJBWUvKS7kJuXGv4NWXBOazqrR7uL8NBV63U0InnbrNjIwFSYlt1C3QOtDL6cCIqzqQfPA2OPHVl0pkKj7wOHjtOKkwzma62WuwrXSVIZ11+F18G2G+wgTN6vjD/hEOgtZLNbhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=T7NeB9W0; arc=none smtp.client-ip=74.125.224.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="T7NeB9W0"
Received: by mail-yx1-f97.google.com with SMTP id 956f58d0204a3-6774639a8a4so174942d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791011942; x=1791616742;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o3WmEeyd699KgbHqZHQ/8CK/nTrJVjniuFp6vfM/Hbg=;
        b=BYLoyVEeiKXHFWZjGmQEqWHnYlUiPhUFbhpFu3pv2wXumvZ51yePo59AVrPUimsD/9
         EOrDfuu16ZkPygKpJCPW7c6U2f0VcJndlhS1a4XaFpaV6/G03Xt8a2jfaK7DEXde3YCO
         92vlfT3gCr68MjMgLBEmQyHNHnQL1koYqIhQmaSzHhzEZLhni0ZmV06SPRSrq+99xsBa
         UKjfppwip/NclxnD2I+aZDJE9zuN5u4D8sJwV6x2kAGzobmkUjfrdGQl4y3I94OLtFil
         m6QOwM0Vgj+EbWMwX9x7ArFZWwhxC2wjsafQmr0lgKMiBVcCrjV2ays1+lYRjecKYTyW
         vyVw==
X-Forwarded-Encrypted: i=1; AKwUvBxSwxJz+IjLNFBPwL/WCwNKAVJ6AzSNcKCHbdE9O3/RxHLC1wptwmzwW0w+Wpymqm4AJMJaa5qCOdrHbFo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+t/BvRke62jmdF3lIZygdpajurcyUTePIeQmDmw4HghTAm2Lr
	Z6IslyIQ7Gu8VWQaHzAd2MUqrCc1z+i+qB1qlIiF78GDFFIK1EMlJQmQ2B29BLb9cQIg15rpTxj
	9g6R7jN/Qkm8pvhn81bTLDz5KSaZFAv36twVlHOlzO0erf1vOzsK/qbTPNHoqSTpNQEfHEevUeL
	HTIEz2qPA0yYUMFMMV3nqa02aERoLdUsXQLQSvMWhHEVkMeSZNWDJG9ylAwpC+cxJaUzZYpWh71
	hE2Qd8NTaSAL7KMSA==
X-Gm-Gg: AYBFou0fBVwv/Hc5h4knoULz+LvO8WNSmeK4AZNCZn75sCM2SYsnKurNsEscBuJIRBP
	57S40njrodeCYR+sFKF2eCnVeIm0wo8fsB5LQXO1lxqhFBHmggVP++X1rd7smfZubNRnRYLxWWo
	aKR0VuzvYbsqTgHnNHtpKokFm0gUNkTpSCnc2NZcDsIkbs1AozOwSUjSMjYI0PEnkPuqFM2CyGQ
	yCgqevqSw/iK39fvDa47T/9pzNX6RQbWVmN1SVJg1Urz5mLpBdXIdcxalUeHS8+i/nFi1iOqIt9
	SE4mF/+WepVJP+PteU1E2kKzdIfKOPJqTSJ4ajh2C8labprx1yMoY01DPUWFGsLQJ8XqXPv7v2D
	/jcOmBcof+RGv+y9Y7HhnEi4wsja0XJkxm18RWWjusfSx6fvPZUNwPW4vJE4EMNPh1l7ZYDEfo6
	79kNTLgDchagM18Qv/0NHzQXc1JYgKFXI4S8u0
X-Received: by 2002:a53:b08b:0:b0:670:f6e8:1f8c with SMTP id 956f58d0204a3-677bd3e95efmr409849d50.84.1791011942443;
        Sat, 03 Oct 2026 00:19:02 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-677c1b1b594sm189168d50.17.2026.10.03.00.19.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 03 Oct 2026 00:19:02 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5d8d6132e68so428559e0c.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791011942; x=1791616742; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o3WmEeyd699KgbHqZHQ/8CK/nTrJVjniuFp6vfM/Hbg=;
        b=T7NeB9W0iLOQZKnUmXG2fJBjGy82eE/TL9gQvYb98EQqnNyLBPC5JQ5d8NqLdpdpxp
         KRefCmPZPR++LbVUPMYvTQgIsntMwdxEMSpW7GBefraPnW3v8u5hGlVzPmRT+zFeGAxM
         8ImF090Un6pzzQDwQW2k66rCr+cDlzOomLQ0I=
X-Forwarded-Encrypted: i=1; AKwUvBwk4HcRgimfIGHvt8GAl9sWUzOINShfh+WrJ2kMifQTSEhxP2UAVoFOz2RDNZ1ovkpnONh/RNM3zx+rpvY=@vger.kernel.org
X-Received: by 2002:a05:6122:414e:b0:5c9:a60b:e5af with SMTP id 71dfb90a1353d-5de6c80ad88mr531008e0c.17.1791011941690;
        Sat, 03 Oct 2026 00:19:01 -0700 (PDT)
X-Received: by 2002:a05:6122:414e:b0:5c9:a60b:e5af with SMTP id
 71dfb90a1353d-5de6c80ad88mr530998e0c.17.1791011941197; Sat, 03 Oct 2026
 00:19:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928061307.1172344-8-vikas.gupta@broadcom.com> <179084601955.434549.5373208577920989982@kernel.org>
In-Reply-To: <179084601955.434549.5373208577920989982@kernel.org>
From: Vikas Gupta <vikas.gupta@broadcom.com>
Date: Sat, 3 Oct 2026 12:48:49 +0530
X-Gm-Features: AclHuK8Ryz-Zvv8b0yEH_qS3s6SVT0cP-gUsnLehT_iK85oXVHRz2vw_82wr1BQ
Message-ID: <CAHLZf_tbp0AvtinDsRG5HNJHcqBETpiWOANdPjSBAWeBR17t3w@mail.gmail.com>
Subject: Re: [net-next, v4 07/10] bnge: add NTUPLE filter infrastructure
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com, 
	vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com, 
	dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000098a56d065cea7646"

--00000000000098a56d065cea7646
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Since there are valid review comments by Sashiko in this series , I'll
prepare and submit a v5.

Thanks,
Vikas

On Thu, Oct 1, 2026 at 2:44=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] Readers and writers access the __le64 filter_id of an RCU-
>   published L2 filter concurrently, with plain loads and stores and no=E2=
=80=A6
>
> --
>
> bnge: add NTUPLE filter infrastructure
>
> This commit adds the NTUPLE filter data structures, the hash table and
> bitmap management, and HWRM wrappers that allocate and free ntuple filter=
s.
> It also adds an RCU lookup helper for L2 filter IDs, which later patches
> use for kernel flow steering.
>
> > diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers=
/net/ethernet/broadcom/bnge/bnge_filter.c
> > index 3b26939b04578..7fbb67021b5d9 100644
> > --- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
> > +++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
>
> [ ... ]
>
> > @@ -49,12 +177,38 @@ static struct bnge_l2_filter *bnge_lookup_l2_filte=
r(struct bnge_net *bn,
> >       return NULL;
> >  }
> >
> > +__le64 bnge_lookup_l2_filter_rcu(struct bnge_net *bn,
> > +                              struct bnge_l2_key *key,
> > +                              u32 idx)
> > +{
> > +     __le64 id =3D BNGE_FLTR_ID_INVALID;
> > +     struct bnge_l2_filter *fltr;
> > +     struct hlist_head *head;
> > +
> > +     rcu_read_lock();
> > +
> > +     head =3D &bn->l2_fltr_hash_tbl[idx];
> > +     hlist_for_each_entry_rcu(fltr, head, base.hlist) {
> > +             struct bnge_l2_key *l2_key =3D &fltr->l2_key;
> > +
> > +             if (ether_addr_equal(l2_key->dst_mac_addr, key->dst_mac_a=
ddr) &&
> > +                 l2_key->vlan =3D=3D key->vlan) {
> > +                     id =3D fltr->base.filter_id;
>                                           ^^^^^^^^^
>
> [Severity: Low]
>
> Can this plain load race with the store in bnge_hwrm_l2_filter_alloc()?
>
> bnge_init_l2_filter() publishes the filter with hlist_add_head_rcu() whil=
e
> filter_id is still BNGE_FLTR_ID_INVALID. The real ID is written later,
> after the HWRM round trip (which can sleep). That write is a plain store,
> and only the netdev instance lock is held:
>
> bnge_hwrm_l2_filter_alloc() {
>     ...
>         if (!rc) {
>                 fltr->base.filter_id =3D resp->l2_filter_id;
>                 set_bit(BNGE_FLTR_VALID, &fltr->base.state);
>         }
>     ...
> }
>
> In the later patch "bnge: add aRFS flow steering ndo support", this helpe=
r
> is called from bnge_rx_flow_steer(). That function runs in RX softirq and
> holds neither the netdev lock nor ntp_fltr_lock.
>
> The writer can run at the same time. bnge_cfg_rx_mode() calls
> bnge_hwrm_set_vnic_filter() for secondary unicast MACs while the device
> is open.
>
> KCSAN should report this as a data race. BNGE can also be built for
> 32-bit, where the 64-bit load can tear. A value that is half INVALID and
> half the real ID would pass this check in bnge_rx_flow_steer():
>
>         filter_id =3D bnge_lookup_l2_filter_from_key(bn, &key);
>         if (filter_id =3D=3D BNGE_FLTR_ID_INVALID) {
>
> The torn value would then be sent to firmware as req->l2_filter_id.
>
> The aRFS commit message already says that a stale ID is either rejected
> by firmware or aged out through rps_may_expire_flow(). A torn value would
> end up in one of those two outcomes, so the effect is limited.
>
> Would it make sense to use READ_ONCE() here, paired with WRITE_ONCE() in
> bnge_hwrm_l2_filter_alloc()? The series already pairs them this way for
> ntp_fltr_count.
>
> > +                     break;
> > +             }
> > +     }
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260928061307.1172344-1-vikas.gupta%40broadcom.com

--00000000000098a56d065cea7646
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
ZKzsTDzWEhPsCM5DcbMg/B7eD9n+rBWHxsk+yKJKdkLpkpTKdxxTd1Y5Ln+k5KCTjxlCUQQ7Q2Zz
qYU8bfRq5ZMwUVJD3NZCqEKbEIgSX2vXFS61zdPwnLyHyaC/erAWmgHLu4kzpk/V10NcnUjX9FYK
f/Ggi9MeMNG20gEIUbCg3RgYf89YLXUJDOuoz/Yajw/VuiVlwS81wF44DmJhAVcGzrI00uydpksG
oQY2qVlhYsvNTqU2V/uaBrKQnyM0PkU140cCAwEAAaOCAdwwggHYMA4GA1UdDwEB/wQEAwIFoDAM
BgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3Vy
ZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcw
AYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIARe
MFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZo
dHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBo
dHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIwYDVR0RBBww
GoEYdmlrYXMuZ3VwdGFAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQY
MBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQI6pBWVwIN47wGrC1m7lYfqN94QjAN
BgkqhkiG9w0BAQsFAAOCAgEAOdSnSEyuTvTtsnmEilB0JfgRKx1MM7kNdv0pfWcINJhssfHD8Fc5
wm+JzenYR9yJAkntX0Lr9yv+OG0Jqhvy7u9gKljfI4jXO4qxZ2jf1YvI+fDK29/NV3JAQuipT3Vs
IxBI73CQO11VwMePOTsUNM1s+9cWT5zLuqOEEu+95jRo5KEtH1/4nahrToLU1Y+flylsBaAUhB72
KoBBzdewa+psa32lY8X23AWDoczIlUBmPt0hmApBvHOUCYszSiBu4/VhVDuq2iMBtnYAj2j9Q7Ct
pZHPj6fQv247S9dTDDym05r8arHAsUw7B29KvPfxeaqexL4gwQQjIsfdZeh88XYLXA+mvEej6OlO
YO3546G7bczFxIjO6V9RrvYEeAb+n7udXYymuIm02XtxIkr/Uk0gRuFoOpG2Dw1OH8xsOUER1+16
qGb2QKMgaKL/IIM3gXAuCxNVBOT+Fj/wh5hw7MFvTTXPFA8IKusoHZYpxdrr9xjoJ/wt6j4/E6K4
IO/WuSc4nM6kshiwIu5c6r97213ZtJFOrjoITiBIYFP0WQsTsEbWvaBX/7daT5IVr9rvCOCk2JA8
bOWwP4OYXCKJY5nZOntb0ECSI7RM0kGelGY4MAD42+OBWHxKU1Qvt5WK4kIXdKpdFp9Drv17PyCU
dR4AvAJyWnkqZyi5QuRg/hMxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBH
bG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIz
Agxt8eaxmNwH4eu5pUowDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIM6Gyb7SoSxZ
a6qjQCe7ntfGzQqAn064abC+Q2ZpMCoBMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTI2MTAwMzA3MTkwMlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJ
YIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUD
BAIBMA0GCSqGSIb3DQEBAQUABIIBAG95KGzo4Pef5DqBGZKb8wS+vnxajlfAzB5wmDoQflCz4q/C
Yc2Bpub6fOqGAl2rUIOAffZyzlORDn6kt/PVPeyM6Zb9BfLvzWcyQPMfUsn5Apu6EzlE+6xG+M0H
0xU7dybANdrQCvAKeus73bUBB/n73HeeX15sdNL81zBadgevuiLGFBi3KoRYU+LxmqeX0uzNMXP6
zSdQkYhFnG4WumH5/jXYWaKeaooqB4I6dTLfH79S6x+JC5rPEUTLez6Y2fwBBmiLAthRT30yuisv
6Jz1igiHdinOt1w3cRqiVvXCgF/w6VoDhkaJGTxN1pAJV7cpHm//IRfreoniwrsnPbU=
--00000000000098a56d065cea7646--
