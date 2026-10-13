Received: from mail-vs1-f99.google.com (mail-vs1-f99.google.com [209.85.217.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30880480DFC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873785; cv=none; b=d9SVHSIKZIFuzYvwxt5hIJQhihg5mQUHzWbL9eYY1j67igSeZGUbdrr/C79u2vBR2NmI594VqrUP/AuA+FHCIMGsZtA9V6UdlDd/DzOHcgLIdn5ZNXvPs+eoLAZe12kchxlsaasgOkOgQij1ZZSpXnsHLGPDBkLVknn0hFmCQVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873785; c=relaxed/simple;
	bh=kCehPlh/3XQnkqPmmilQH+p8r+IBbnlI6FDzPVogJGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FsN2+nvuQsHboiQKkCC+IUbSuDQiWWO1M9ZTFHv+m0pUcxxbXtaZEfTISXEmRwXPLPM8XH9wHQXtSL9HlWVWCSb9LOfeoD4QVfeCoQuJbvUVhZw+Q5PhgzEKJvlcgHCyubTRN43xgms1MnZdvPQPR4glNaExJX8vGNYfj+t/GI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=CdUqjV9w; arc=none smtp.client-ip=209.85.217.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="CdUqjV9w"
Received: by mail-vs1-f99.google.com with SMTP id ada2fe7eead31-7c6e6822b11so686976137.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873783; x=1792478583;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Anyuoo+Ay5sLt0Ue1ZIaOHUx+uRNQi2csCpp6G0+8tA=;
        b=Qhs2LqN4iNDMzfnR9pdI1IuX415kW0k+ehL9iheUXKjuINlPmp5Gt8HhFyMEasCyOi
         s/4LCiSH85TowkLFHjdpUvbNN5bDDRiHsuJ9AxPqSfjobK5RHXcd7NwUOlMsbAevbpt6
         LupI6SaPvX3COaboqKWjv/YkzDiICiYr9y9N9Oxps9VYtFM5uweanWU8L4mMTn6fpuln
         cY/MwormTJyqxlE5SxS/c1ZtfWKAcV2+UG0YySLj1/vSARXdMGA/j0c9Tdbio22AvyqX
         h3n4ImZHzDzIfMPKbVSlUZaZKtUnELmps8AF/D7ftxW42a3vqxoDv0tEsaHCUKaQkukS
         ZiRg==
X-Forwarded-Encrypted: i=1; AKwUvByIpU6tG9yXyZjDfGD8wWrfOM7KVA4ymfIPtNCUMui29PSDA5LbqnELGZIZxopP8uXCA5ukQ5r/s2TCWV4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtksbfJVKxKA7TAtOAIuWR6Lil0SyDN6jlYSVSnyriZyf4K0z+
	raV3eKiVsxGJkEwTDB12hp/8OPBw2fGUiWTPQEGZdhHjXlP+oJ+CaDTZYJndnsvk1kkRaVg6Ln7
	Rt8J3D+X7J9U0BdygrFIqKcDa+qt6FFoK3lnMDce8RTJh3xp5ulTE8uZDgqG25JqTUK7Yk93/C1
	YZafkJaLXg/RKc0be6eDe8rnVvitDKDETSZOVv52L+rmD8+5s+chki0Z4HIisdbdqIq6wbB83Xa
	PbarKLC1BYTVpSY/w==
X-Gm-Gg: AYBFou0A+yCxvnoZiJSBjvOMS47870AbIGmazR21E9hxZ0H7aI4/tvrhWCBapF5HOZL
	oXlyVKE1EfieNmX+N2++n36ldUDndlFk+1eV2RwKEnNLOSt4Nu+9SkaWiCAIYMxLO9Odl1yjFAy
	LM0b6sS0hUkUNP8a1VcL0FNky2//9mxEO2X7HOBh4WisvMVhPr5XtYGnKeDuIysGBPCNSznK8+y
	X8gKIUo3tuGfMu6CT6YsDFHwUKP5WrAyMB/wrntH+hL5UDi0Vo/6GTmI0uwb/hd7z1lU7xRNnPi
	fdM7PBN8JrTRL298mO56FQil7HWS1w+AIMmCnDDOz83Yz8ocg5gXacFF+QN4ZAnd92Lg24BnlnK
	QQkmx9dHQVtQbIxh6Y6I37yXBaOlURgh1HSofjWl/lFvW7RacYsTIPlm98rOKhtsE9xE4p7QAD/
	eq3QPtccbPbeBZ+XMqBZICvmt7IiYgFE0BvSKI
X-Received: by 2002:a05:6102:4423:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7cb372b0f01mr2548968137.11.1791873782688;
        Mon, 12 Oct 2026 23:43:02 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7cb353cb6f1sm116267137.9.2026.10.12.23.43.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Oct 2026 23:43:02 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c82cf2652dso334719e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791873782; x=1792478582; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Anyuoo+Ay5sLt0Ue1ZIaOHUx+uRNQi2csCpp6G0+8tA=;
        b=CdUqjV9wyivb03cG3oShm6Us5nPY8FC/DvzWc9J/8quO8wl5+jy1lrxhIQE24j7rZI
         bOPEqmtj3ZKjoZkezl6VdatYnj4wme/9k3Ijnd4KCue7kvcMSyKrpuF34OLjlCEZqZ9i
         kV6x37Gm1FZS4mQ//WrEYeofPOR1p8gNURbXE=
X-Forwarded-Encrypted: i=1; AKwUvBzD+fxPoXRDI8w6WUsJJTzhA2rD4YOGtyKb2dOg5odPc5Ag7vWDpE0TS3/f17o1jRYtXkd3gTVHNtO9TWA=@vger.kernel.org
X-Received: by 2002:a05:6102:418c:b0:7bd:b263:14c8 with SMTP id ada2fe7eead31-7cb37506fb1mr2596075137.30.1791873782040;
        Mon, 12 Oct 2026 23:43:02 -0700 (PDT)
X-Received: by 2002:a05:6102:418c:b0:7bd:b263:14c8 with SMTP id
 ada2fe7eead31-7cb37506fb1mr2596068137.30.1791873781485; Mon, 12 Oct 2026
 23:43:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012054325.1782819-2-vikas.gupta@broadcom.com> <179187029600.434549.15294077033511744217@kernel.org>
In-Reply-To: <179187029600.434549.15294077033511744217@kernel.org>
From: Vikas Gupta <vikas.gupta@broadcom.com>
Date: Tue, 13 Oct 2026 12:12:48 +0530
X-Gm-Features: AclHuK-zZOPhxETEOXdk9k-2_FDRzU2fSAIRGlxrihJhn-QSViMHWD2ybvC97Ds
Message-ID: <CAHLZf_ujPYqE0X5UeX3GhRML+Vit92RbBv-y3-r6f-UBS8ngrw@mail.gmail.com>
Subject: Re: [PATCH net 1/2] bnge: fix RSS table sizing for large RX ring counts
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com, 
	vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com, 
	dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000048c3cb065db32073"

--00000000000048c3cb065db32073
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
  I'll send a v2 of this series with the patch order swapped.

Thanks,
Vikas

On Tue, Oct 13, 2026 at 11:14=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] This commit opens a heap and DMA out-of-bounds write window for
>   513-576 RX rings.
> - [Medium] The commit message is wrong about the completion ring.
>
> --
>
> bnge: fix RSS table sizing for large RX ring counts
>
> This changes bnge_adjust_pow_two() to always add one block before roundin=
g
> up to a power of two. RX ring counts whose quotient is already a power of
> two now get an RSS indirection table that covers all rings. The same
> helper also sizes the RX, TX, agg and completion ring pages.
>
> > Always add one block before rounding up. The same helper sizes the ring
> > pages; their count only changes when the number of entries divided by
> > the entries per page is a power of two of 2 or more, which does not
> > happen with the default ring sizes.
>
> [Severity: Medium]
> Is this accurate for the completion ring? It holds for the RX, TX and agg
> rings at the default depth of 511. The completion ring, though, is sized
> from more than the default depths:
>
> bnge_netdev.c:bnge_set_ring_params() {
>     ...
>         max_rx_cmpl =3D bn->rx_ring_size;
>
>         if (bn->priv_flags & BNGE_NET_EN_TPA)
>                 max_rx_cmpl +=3D bd->max_tpa_v2;
>         ring_size =3D max_rx_cmpl * 2 + agg_ring_size + bn->tx_ring_size;
>         bn->cp_ring_size =3D ring_size;
>
>         bn->cp_nr_pages =3D bnge_adjust_pow_two(ring_size, CP_DESC_CNT);
>     ...
> }
>
> Take BNGE_PAGE_SIZE of 8192 (for example arm64 with 16K pages), TPA off
> and default 511/511 rings. Then ring_size is 2 * 511 + 511 =3D 1533 and
> CP_DESC_CNT is 512, so the quotient is 2. The old code returned 2 pages,
> which gives a cp_bit of 1024 (fewer slots than cp_ring_size). The new cod=
e
> returns 4.
>
> With 4K pages and TPA on, agg_ring_size is 2044 and ring_size is
> 3577 + 2 * max_tpa_v2. max_tpa_v2 comes from firmware max_aggs_supported.
> For values of 260..387, the quotient over a CP_DESC_CNT of 256 is 16, and
> the page count goes from 16 to 32.
>
> Could the commit message mention this change to completion ring sizing?
>
> > diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h b/drivers/n=
et/ethernet/broadcom/bnge/bnge_resc.h
> > index b62a634669f62..c0b6992d7f828 100644
> > --- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
> > +++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
> > @@ -81,13 +81,10 @@ bnge_adjust_pow_two(u32 total_ent, u16 ent_per_blk)
> >  {
> >       u32 blks =3D total_ent / ent_per_blk;
> >
> > -     if (blks =3D=3D 0 || blks =3D=3D 1)
> > -             return ++blks;
> > +     if (!blks)
> > +             return 1;
> >
> > -     if (!is_power_of_2(blks))
> > -             blks =3D roundup_pow_of_two(blks);
> > -
> > -     return blks;
> > +     return roundup_pow_of_two(blks + 1);
>
> [Severity: High]
> For 513..576 RX rings, bnge_cal_nr_rss_ctxs() calls
> bnge_adjust_pow_two(rx_rings - 1, 64), which gives a quotient of 8. The
> old code returned 8, but this now returns 16. Nothing clamps the result
> to BNGE_RSS_TABLE_MAX_TBL (8):
>
> bnge_resc.c:bnge_cal_nr_rss_ctxs() {
>         ...
>         return bnge_adjust_pow_two(rx_rings - 1,
>                                    BNGE_RSS_TABLE_ENTRIES);
> }
>
> Can this overflow bd->rss_indir_tbl[]? bnge_alloc_rss_indir_tbl()
> allocates BNGE_MAX_RSS_TABLE_ENTRIES (512) entries. On the first
> reservation, bnge_reserve_rings()->bnge_set_dflt_rss_indir_tbl() gets a
> max_entries of 16 * 64 =3D 1024:
>
> bnge_resc.c:bnge_set_dflt_rss_indir_tbl() {
>         ...
>         for (i =3D 0; i < max_entries; i++)
>                 rss_indir_tbl[i] =3D ethtool_rxfh_indir_default(i,
>                                                               bd->rx_nr_r=
ings);
>
>         pad =3D bd->rss_indir_tbl_entries - max_entries;
>         if (pad)
>                 memset(&rss_indir_tbl[i], 0, pad * sizeof(*rss_indir_tbl)=
);
> }
>
> The loop writes 512 entries past the end. Then the u16 pad wraps to
> 512 - 1024 =3D 65024, so the memset() clears about 254 KB beyond that.
>
> The other RSS consumers also look sized for at most 8 contexts:
>
> - bnge_setup_vnic() calls bnge_hwrm_vnic_ctx_alloc(bd, vnic, i) for
>   i < 16. That stores into vnic->fw_rss_cos_lb_ctx[], which has only
>   BNGE_MAX_CTX_PER_VNIC (8) entries.
>
> - bnge_fill_hw_rss_tbl() uses a tbl_size of 1024. It reads
>   rss_indir_tbl[] past 512 entries and writes 4096 bytes into
>   vnic->rss_table. bnge_alloc_vnic_attributes() sizes that buffer from
>   BNGE_MAX_RSS_TABLE_SIZE (2048 bytes plus the hash key).
>
> - bnge_hwrm_vnic_set_rss() reads fw_rss_cos_lb_ctx[8..15]. It also moves
>   ring_grp_tbl_addr past the end of the coherent allocation, so firmware
>   would DMA read outside the buffer.
>
> Configurations with 577 or more RX rings already overflowed before this
> patch, but this patch lowers the threshold to 513. Hitting it needs at
> least 513 default RSS queues from bnge_net_init_dflt_rings() and firmware
> that grants that many rings.
>
> The next patch in the series, "bnge: cap RSS contexts and RX rings to the
> RSS table size", closes this. It adds a min_t() against
> BNGE_RSS_TABLE_MAX_TBL in bnge_cal_nr_rss_ctxs() and caps *max_rx at
> BNGE_MAX_RSS_TABLE_ENTRIES in _bnge_get_max_rings().
>
> Could that cap be folded into this patch, or moved ahead of it, so this
> commit can be bisected or backported safely on its own?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261012054325.1782819-1-vikas.gupta%40broadcom.com

--00000000000048c3cb065db32073
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
Agxt8eaxmNwH4eu5pUowDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIBixV5mrnQdt
neFfN7AIQQ69VV6p+BzCypQuLhafRVM2MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTI2MTAxMzA2NDMwMlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJ
YIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUD
BAIBMA0GCSqGSIb3DQEBAQUABIIBAJIds9qIuk/S1gb4Sr4PuFFhjdJh9bjk2s3yLMoQ7whSVAxp
eKsOcdN9wCxEIRmW0See2ps3OmlHJjSO4nHQrulDL9UZVsnML3kvmxc3LeXKg7qwU3SNuwpAyaJx
mBrk3sunpGiWkqybtJPPwAfWPNXS827+a5D9keQ92Xvi/enVXPfCQzAmHFdzntJdJ1iu/ahifozg
6J0Q4VViMaejXo1+NJ5Vy/FCwsBpDSOAGM6IC8p6o4BKM1AKwlVcOcYiV+Kgzuzoxoa8+P2vYZ8p
fQMMs61Xc5RH1GiBEOsB3Z44E+cksX/oEFGd4uuBCR5TCPaLn2vm3zzjnFUeOuGrAUc=
--00000000000048c3cb065db32073--
