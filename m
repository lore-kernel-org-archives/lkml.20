Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E956D28E0F
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306376; cv=none; b=QYwk8tjSl9trP3rzEMrClBmusI7uKu5OhBvt3GA50COlTokUM+vjsKy/OWVS1WhnTgS95bOU5d9NklKBPu36JTfzR3Vee11mgHbQuGeI6NEqJiZWfrxPAv9jhpxYzQoOAcmAWPg0hklyOUeMq7N55m4thxkzpJPEAfdjetpyomQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306376; c=relaxed/simple;
	bh=zNzdbCDPnqIw4sBE3d8vaq1y5eb3IO2wAW2w0bSfvNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DyTZXC3YS4mi7uZLSbKp5gPBmwqD3jUfYvJB7QCQ4QMoSC+g3yMOLp3038EbN4qGTcG6DhH91CpSf4KUgoF8+Rz5Q+HLJLZCzn3VSiTwmhHanElwTBhr43+e2Rc0fe6sEOlRVcUy2tLlmWnAT2pnHN+goe4eCbF/MmuHoDai884=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=aLAJvoPO; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="aLAJvoPO"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3a6cf104827so680134a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791306374; x=1791911174;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l6qEsR/V1a+02iEg0eHwfvWL+pZFHhjbbS7dKOjmsO4=;
        b=FhwADihwbnd0s8F37LtW4a3kBYicY3fOwTCudPyE5J32bE7sz87dybJCDRejF3H7C3
         b3JvOL0f+72BmIWJhN8SSe3hlwyzxVSwz8SUGHMFWzDf3TISKI98M+y90Gqsz9c1HB3W
         Dbu66AlPf2Ocvfck+A6YqL5jd6AcE6bar3pAeTkqw4hxlK0J6U7PYV7kaMNyLvREcO8R
         iIJMPGtBghAEEvYEkZ5V3BTXToKrKxXAQcq51km4+o9HPwxq0svLyo5l2K5gHRruBP3m
         DehI5cs50mxkGFVj2dPwX8oUJVvJVb+48Wm0oL5VwWKJvYy5jCtuWycrpqetiLwR9JHr
         5ISQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjymaTvsfPuMGPR7RjExA0I5GUnysEtPl3XrUlimWEa1iVztk/SZkrfTberyzlit0fj1Am670HgCDZWyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKe7CYgNTn0nGCLLafcEc2ZYUuhstv6ukSRIOOse2f0Baw8ftEh
	JFBfazlLpc7aYFKYl2W1KDGBzoBtnhW63W0C5KEc152YOv64l0MHhR51XvqYWDk59D67MJaObyv
	P0VRcgok0hCmq12W8lf0zX38vU8AEZ6bKx+cn7L0LMVthBZzUCQGMrxiJELpAz31pUlEpl7KjEO
	cOcXkCVCYgg/UI0zJ5a4uex5f6tupnjQ4KX5EE3fEOCL3sIilIPw/QJX027YWfgJLekYAfYGluT
	2NM+lauj7kT7Wua
X-Gm-Gg: AYBFou3yevA6+W8eOY3nY9qz/W6R0lnLT67B6UTW9cyKmFSopBAMAZI6DOpKhrD2PHL
	yEAqHemHKZvMItrJgjBKNsl7a0fT/dXbPlTptERu9a/NmmTUhw4raU/vqMUtu2rXDM6DkY8uRwp
	MJA4S12Pq2cJsEaifQum4nbyhVGv2wy2WxMnWQI4yjgZAQLxx3r2Sdxlq3lLE9C1uxMACDv7Alt
	gBBrS4229neRbWc1QYwHPXAvaNBPlDpJr0oXvwPzTVTbHPSKYy5pVzH+gIncz3IFqWFg2UD7oS3
	TjlnR61z3AsA7HrxlWiwOX2oytGcbV2KjkyjEHeiogzrnT5ii3lsWXBiCZKce5gCa8cy8QdZ29v
	Kg/5G9dEkaBIL+Fy59RERMQbCmLXP/i2urGg5YmJ3nNQZQ9uEnKY5UNuQT47m2lrbZwxaW5hHvg
	Q1D4NTOWVQ2Z3ssUMxe4hkZLE0zW1lrO02wdc=
X-Received: by 2002:a17:90b:2d90:b0:3a8:181a:2bfc with SMTP id 98e67ed59e1d1-3a873505c28mr810450a91.14.1791306373920;
        Tue, 06 Oct 2026 10:06:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a85425735esm1401150a91.5.2026.10.06.10.06.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Oct 2026 10:06:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c29c391bd2fso325662866b.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791306371; x=1791911171; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l6qEsR/V1a+02iEg0eHwfvWL+pZFHhjbbS7dKOjmsO4=;
        b=aLAJvoPOCI2042PpXd6+NsLQ+AZJVBr9nPrA7U5sWZnt2GyW6IE5w8Y/VVDCo0MvIc
         ozbHifuY3jfqdHw4WdbUKDmwY3fbQLgx9+q+xihKS0WdOiQx76aJ9sK8ZQHr/rtRh50t
         3B2GYR91Ed8WCpapKUYUY0LlpBpRupCXvDJCc=
X-Forwarded-Encrypted: i=1; AKwUvByCnmOi371aXVpiZgv/zb/yTuj5qqFAraW1vWdABG+fyMLLcOj07Ks5ohHeAKy2qhaWp4MM03Mc1o9jYcM=@vger.kernel.org
X-Received: by 2002:a17:907:3e8f:b0:c2d:c739:30e1 with SMTP id a640c23a62f3a-c316a007f27mr232231766b.32.1791306371594;
        Tue, 06 Oct 2026 10:06:11 -0700 (PDT)
X-Received: by 2002:a17:907:3e8f:b0:c2d:c739:30e1 with SMTP id
 a640c23a62f3a-c316a007f27mr232230166b.32.1791306371043; Tue, 06 Oct 2026
 10:06:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006060118.41933-1-hemanth.selam@gmail.com>
In-Reply-To: <20261006060118.41933-1-hemanth.selam@gmail.com>
From: Vishnu Dasa <vishnu.dasa@broadcom.com>
Date: Tue, 6 Oct 2026 10:05:58 -0700
X-Gm-Features: AclHuK_v71NP1UKy6D5H5ANSvAKnKsxe38ssVpspgje9QK_ba2DZjSphRC-XE3Y
Message-ID: <CAF+opq2nTaVN7kJebTdSdSn-OCge-Vj82GToHh+hohC=rYNJKA@mail.gmail.com>
Subject: Re: [PATCH v2] misc: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Frank Haverkamp <haver@linux.ibm.com>, Bryan Tan <bryan-bt.tan@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000fc4e2f065d2f03b3"

--000000000000fc4e2f065d2f03b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 11:01=E2=80=AFPM Hemanth Selam <hemanth.selam@gmail.=
com> wrote:
>
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  One further misspelling of
> "respectively" in genwqe/card_base.c is fixed as well: it is not in
> scripts/spelling.txt, but it sits a few lines from one that checkpatch
> does report.  Only comments are touched, there are no code changes.
>
> Assisted-by: LLM
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Acked-by: Vishnu Dasa <vishnu.dasa@broadcom.com>

Thanks. vmci changes look good to me.

> ---
>
> Notes (v2):
>     v2:
>      - Drop the drivers/char/lp.c hunk.  It is not under drivers/misc, wh=
ich
>        is what the "misc:" prefix claimed.  It is now sent separately, as
>        "char: lp: fix typo in comment".
>      - Also fix a second misspelling in genwqe/card_base.c, a few lines f=
rom
>        one already being corrected.  checkpatch does not report it becaus=
e
>        it is not listed in scripts/spelling.txt.
>
>     v1: https://lore.kernel.org/all/20260904113843.21367-1-hemanth.selam@=
gmail.com/
>
>  drivers/misc/gehc-achc.c                | 2 +-
>  drivers/misc/genwqe/card_base.c         | 8 ++++----
>  drivers/misc/genwqe/card_ddcb.c         | 4 ++--
>  drivers/misc/genwqe/card_utils.c        | 2 +-
>  drivers/misc/vmw_vmci/vmci_datagram.c   | 2 +-
>  drivers/misc/vmw_vmci/vmci_queue_pair.c | 2 +-
>  6 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/misc/gehc-achc.c b/drivers/misc/gehc-achc.c
> index 9792189c0923..2c1222edb5dc 100644
> --- a/drivers/misc/gehc-achc.c
> +++ b/drivers/misc/gehc-achc.c
> @@ -369,7 +369,7 @@ static int ezport_firmware_flash_data(struct spi_devi=
ce *spi,
>         dev_dbg(&spi->dev, "EzPort verify flashed data...\n");
>         ret =3D ezport_firmware_compare_data(spi, data, size);
>
> -       /* allow missing FW verfication in secure mode */
> +       /* allow missing FW verification in secure mode */
>         if (ret =3D=3D -EACCES)
>                 ret =3D 0;
>
> diff --git a/drivers/misc/genwqe/card_base.c b/drivers/misc/genwqe/card_b=
ase.c
> index e602eb3c51fa..3eb843af31a5 100644
> --- a/drivers/misc/genwqe/card_base.c
> +++ b/drivers/misc/genwqe/card_base.c
> @@ -286,7 +286,7 @@ int genwqe_flash_readback_fails(struct genwqe_dev *cd=
)
>   * @cd: GenWQE device information
>   *
>   * Note: From a design perspective it turned out to be a bad idea to
> - * use codes here to specifiy the frequency/speed values. An old
> + * use codes here to specify the frequency/speed values. An old
>   * driver cannot understand new codes and is therefore always a
>   * problem. Better is to measure out the value or put the
>   * speed/frequency directly into a register which is always a valid
> @@ -904,7 +904,7 @@ static int genwqe_reload_bistream(struct genwqe_dev *=
cd)
>   *
>   * Condition for the health-thread to trigger:
>   *   a) when a kthread_stop() request comes in or
> - *   b) a critical GFIR occured
> + *   b) a critical GFIR occurred
>   *
>   * Informational GFIRs are checked and potentially printed in
>   * GENWQE_HEALTH_CHECK_INTERVAL seconds.
> @@ -1210,10 +1210,10 @@ static int genwqe_probe(struct pci_dev *pci_dev,
>  }
>
>  /**
> - * genwqe_remove() - Called when device is removed (hot-plugable)
> + * genwqe_remove() - Called when device is removed (hot-pluggable)
>   * @pci_dev:   PCI device information struct
>   *
> - * Or when driver is unloaded respecitively when unbind is done.
> + * Or when driver is unloaded respectively when unbind is done.
>   */
>  static void genwqe_remove(struct pci_dev *pci_dev)
>  {
> diff --git a/drivers/misc/genwqe/card_ddcb.c b/drivers/misc/genwqe/card_d=
dcb.c
> index 969178573940..07e2c1be22d9 100644
> --- a/drivers/misc/genwqe/card_ddcb.c
> +++ b/drivers/misc/genwqe/card_ddcb.c
> @@ -460,7 +460,7 @@ static int genwqe_check_ddcb_queue(struct genwqe_dev =
*cd,
>  /**
>   * __genwqe_wait_ddcb(): Waits until DDCB is completed
>   * @cd:         pointer to genwqe device descriptor
> - * @req:        pointer to requsted DDCB parameters
> + * @req:        pointer to requested DDCB parameters
>   *
>   * The Service Layer will update the RETC in DDCB when processing is
>   * pending or done.
> @@ -543,7 +543,7 @@ int __genwqe_wait_ddcb(struct genwqe_dev *cd, struct =
ddcb_requ *req)
>                 return -EINVAL;
>         }
>
> -       /* Severe error occured. Driver is forced to stop operation */
> +       /* Severe error occurred. Driver is forced to stop operation */
>         if (cd->card_state !=3D GENWQE_CARD_USED) {
>                 dev_err(&pci_dev->dev,
>                         "[%s] err: DDCB#%d forced to stop (rc=3D%d)\n",
> diff --git a/drivers/misc/genwqe/card_utils.c b/drivers/misc/genwqe/card_=
utils.c
> index e3b5fb337182..7c57cb881d7f 100644
> --- a/drivers/misc/genwqe/card_utils.c
> +++ b/drivers/misc/genwqe/card_utils.c
> @@ -1003,7 +1003,7 @@ u64 genwqe_read_vreg(struct genwqe_dev *cd, u32 reg=
, int func)
>   * @cd:                genwqe device descriptor
>   *
>   * Note: From a design perspective it turned out to be a bad idea to
> - * use codes here to specifiy the frequency/speed values. An old
> + * use codes here to specify the frequency/speed values. An old
>   * driver cannot understand new codes and is therefore always a
>   * problem. Better is to measure out the value or put the
>   * speed/frequency directly into a register which is always a valid
> diff --git a/drivers/misc/vmw_vmci/vmci_datagram.c b/drivers/misc/vmw_vmc=
i/vmci_datagram.c
> index 6193a22c3ab5..73b43b097f92 100644
> --- a/drivers/misc/vmw_vmci/vmci_datagram.c
> +++ b/drivers/misc/vmw_vmci/vmci_datagram.c
> @@ -434,7 +434,7 @@ EXPORT_SYMBOL_GPL(vmci_datagram_create_handle_priv);
>   * @out_handle: vmci_handle that is populated as a result of this functi=
on.
>   *
>   * Creates a host context datagram endpoint and returns a handle to
> - * it.  Same as vmci_datagram_create_handle_priv without the priviledge
> + * it.  Same as vmci_datagram_create_handle_priv without the privilege
>   * flags argument.
>   */
>  int vmci_datagram_create_handle(u32 resource_id,
> diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_v=
mci/vmci_queue_pair.c
> index 46bba9bef553..e1a11820be01 100644
> --- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
> +++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
> @@ -2668,7 +2668,7 @@ static ssize_t qp_dequeue_locked(struct vmci_queue =
*produce_q,
>   * @consume_qsize:      Desired size of the consumer queue.
>   * @peer:       ContextID of the peer.
>   * @flags:      VMCI flags.
> - * @priv_flags: VMCI priviledge flags.
> + * @priv_flags: VMCI privilege flags.
>   *
>   * This is the client interface for allocating the memory for a
>   * vmci_qp structure and then attaching to the underlying
> --
> 2.47.3
>

--000000000000fc4e2f065d2f03b3
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
R/NZ5tTafc0SyuWmEVyFR825FbSoi1HwMkY1/lsU/2Ny0PK1+9WamuvV11QKd2dN0bYDXrT9uWC/
Cw+IDnr+5S21lWL9xM3S7htf+QjbSezM58DicE0QLGoXIYZ98zGOum91sMMgq2YfQKCVeOcD/7SL
0tftIn9SftUtPTeRab5qssPI8Aqo18uk3WxLqQRQv57jHWDis/0CAwEAAaOCAdkwggHVMA4GA1Ud
DwEB/wQEAwIFoDCBkwYIKwYBBQUHAQEEgYYwgYMwRgYIKwYBBQUHMAKGOmh0dHA6Ly9zZWN1cmUu
Z2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZzbWltZWNhMjAyMy5jcnQwOQYIKwYBBQUHMAGG
LWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMzBlBgNVHSAEXjBc
MAkGB2eBDAEFAwEwCwYJKwYBBAGgMgEoMEIGCisGAQQBoDIKAwIwNDAyBggrBgEFBQcCARYmaHR0
cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBBBgNVHR8EOjA4
MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmww
IwYDVR0RBBwwGoEYdmlzaG51LmRhc2FAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwME
MB8GA1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBSDkmQlbsGdC/WLbyB/
f4VlMvD+ozANBgkqhkiG9w0BAQsFAAOCAgEAYv4/sGMrazXrWECSGMFJ6YIDir3jLsYCcD/xTMfS
bXSiWFQ/ZiFLbxfVV9JJKkkKR29ow0Eo1fBaZMCDhnax7746XJn6qJ0Iz5MyLKFB2DKt3UO2q1PB
+wh73XKXTx6FDnbFRDjtyam6uKjknIMrZcFVTyFwUiY9zKz5pK40OPx4ZzdWxOCKMnCblGOiqvS+
gHpKXHRfCd9Ul1teGR1+muz+L7fJfrx9WUBNDFFIhwZEevLSVo7wIoyT2PG0fIk2yjKCFOT3CVVy
E5LT/kzQHjq7Y36GeUxozu21FbrNYm4Ivlh1OV9suNl/3iN1j9kFAdgg/8QXh9USKmg2zaS/S9lc
1YYUOS+Epg0WBwhAwWtVym636KWqu4Esgz2XWX1260rHG0sIxkdxzvBwsUYpf3e1axBlOHHr1Jz+
vDtQVeBUS7fBAVDWnBJrKNn+jseGnpcqBDQSSNq1kB44XhKZFApne6lKSCqYkE3qXnr7Dp0CXm+G
pPoyxqxotis4l4Dl4A3btCkYLp/dzOS00M71f185BKufW7S/16rj/jVUzgz2AjGvM/OC0SWvGoB2
tDdyBMmW1/0xK5rKGnmfM07/k8agfS2J6eI1iWB35m1Ni2SoCoLGoLlvUA4OhexyRqMTTjyllKtA
0Z9TF7kzBYUx8Qa7zfaTaIsVorChiSjphpgxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkw
FwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlN
RSBDQSAyMDIzAgwcY9XKjV0+TQvViOkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIE
IGrLyKwC8ZdPhuP8J9vkWusGazTaVMWL5vHgd5ZQ5z7cMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0B
BwEwHAYJKoZIhvcNAQkFMQ8XDTI2MTAwNjE3MDYxMVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgB
ZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcw
CwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAJ83oL93w39uNoY3qBDYPkalJHizC91bhs/0
h0U6oY5xIiCge9Y81IHXBz1EJ8P6ZHdEXuTTM5LdUKj+zvT1XlZDMHeXx5/pFA8UknfPVEGsM3li
2NLWXF2uPvmSyqOeOjjZzZqk4Fo7xcKo/nCMJP2u4RNs12PIriClxpCr/TU/2c/cxxgy04IxOcA9
35zYOs23fKU5h6WVjR+G40jEa59MpdaxPptn9ozG/L7yot2my6eF6EN9En//knccnXGlB/qIFi/y
ALlczz8mni0nnxkgTQL34IDTR3Y+8MjByxB3tg8dWvrcOrLOWKlXvvuKf8JP19I2KDEddMEic5Dq
ZGM=
--000000000000fc4e2f065d2f03b3--
