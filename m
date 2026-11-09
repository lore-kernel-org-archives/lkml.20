Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794238550;
	b=tw461WFh0XF3/9oSKMBWFQ/yMu/0rPiyo9YJQ+OodSwqvNqEw/HTpJPxFGxSbyj4ydAO
	 pgpByER1f4UJk8nsfwrEk6aG2GU4esDOTZAtOmnZs9ZGOfIkwEcoJrAN1DbUK4ozg77Jf
	 609UOTXINMMH6/r6zaXLHuJ+WmsKDx+Zw310qSHXXaVXEzlVq67U3r+IclHK9Y6OADLiq
	 gdp/cogPFFQcELe1EiVISXD/jK09/d1SexyIRr0A0/fX+T47l9OY+gI/pw8viU1CB6HYJ
	 DanrSXmsHmmHRiP9GHenetxmkVODLKn8ZcQblKSydLPJn4l4np6iaUoz34vPad6UC/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zy8EMM1BFHAclhzxr/2gtUNrv7vvQFeHFQT5Y4VUcUk=;
	b=g66jwqipKlzVyR5In4UZyWOVOXRXXCNoTBEi+jzKBE6h5pqyBEtJYVhzAS5ZUC3+V4t1
	 hzaubpn0/q+4uh2ZqyVl4Mhz7iGrU/bwtDlZLEGi8CqfVYhg+ZoqrvP4unCDfG9VMKXbH
	 mbPJlnxvPtGON582dpRettzxo5xhDrIu3ksrlPzoKez6vF8s03buw2gaNTT+LQE+qAoZ2
	 5CCSVNE8uBTz0E94gz27wgpOMdUQhdkGz+he6SY9th/SPFioe2RXTIb0Fbzd7AOO9T89O
	 xiMxz4GIITKGsSHSwEC3oIWb/vuzwH6wTuiAKG4+rWdjn3vmPUgLSw8u1+mV0m+7WaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPvOhJml;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C66606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C66606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPvOhJml
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67c0ffaae1dso1103083d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:35:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794238549; cv=none;
        d=google.com; s=arc-20260327;
        b=bXgMkhJOZB3W4cIkT8aVt9kml9vmyft3yenQJGBSxBrkgTXGuK522rLEes27SQ8+CZ
         TRHGenQKpdB19Z9w2Q3MxYE7SSblCbNTdmSaBgPOuM5A154xYVdrK62BKWTea6eM9vsQ
         ZvWB+lELsF6L1i2vUSA+Z7qTfg3x8uJt3bValf65/poK120v2mgULeSrxewaD0jkFg2Q
         Gn6f55U1RkoFvQoNkM7qnPsmzUQoBLZukcyv/FlBofUtZwtI0acXLztUVyZMM3ckqKFB
         ZbRpWZza1/k8B+MoroLNLBFazPrmWxoqzyr2schrusm50T3pceTa0o1FLGMdqvXXqlCE
         CqTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zy8EMM1BFHAclhzxr/2gtUNrv7vvQFeHFQT5Y4VUcUk=;
        fh=YWOgQxq7NL8FOkHAT4aoYAwv8hRPFxIQfdU2iZ/9fmo=;
        b=QMh8Hecrjmo8vy17AFL5v4GOnBln3CRW7PhiSMSrDIBrTzeGQ4eN59Rff+VU+TKG2G
         1rs6449Xcw/SMDTPsXSSGIVyQQeLmpXseQviEK/72vB1Pql5ANDK8y1xeWtqgQhHhZGE
         FAiOk+xNW4gTMbvsgKiwbQpFMPq4KBcPN6ee+XZNaGTOhtn1K08A7hWMubMmn9Zd/Vqi
         0oVyxALD0YnGUIi4oFdWxFiboWGBoEHLqf6/FRx/nk4teZB1QQO7F58/5dNtPmFj8Bag
         v9Y8leiheMUAmGJecSytzfEqMfjdGttw5XR/7rfcTZA1sbjJ7JoTqYoubuEXsV/dS6CB
         v2sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238549; x=1794843349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zy8EMM1BFHAclhzxr/2gtUNrv7vvQFeHFQT5Y4VUcUk=;
        b=wPvOhJmlawyeWLM/BpMi2/XGhvtnj0nSJQpchKZsVC5jW9PDPyzZqE2TMyrfJtu2/f
         4gm/SBO9gF0q/bLYzMcjQzlMhvsUflAtJOmoWBz7t/K2JVvaKheSHMujV4hJOpbhcjIs
         yOY81XWxbqsyDvz/twVCOakySXo6dTzwKXc/G+UmvgSB/UCh4JXExzifxR2FkHzEMCvC
         i230IBq/jf5HZBvb03xg6vPHUYSc8CnL/TxS1eDoJ8+9qgPs+wzv6s2VdK4EU+AkOLZj
         1iYgUlihFRZtcizx+DnUxSTSRPdDU+M4ykCA9MglNhYz5U9FZRGEj6ZB7qTazsagJffL
         obhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238549; x=1794843349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zy8EMM1BFHAclhzxr/2gtUNrv7vvQFeHFQT5Y4VUcUk=;
        b=wEn1qg95hA7J+Z/dfm543QRPjFD0PfVskvM5408wBxvjGjO8X7IeIa51Hx4vZo+Wy4
         9GuN5vpEXucJpz0QJ5nsm6iML1GKDQJ7J2vURNC3FkdS6oDGHQPzUcEp3aOaV5iTDn5M
         EEoxGgyMY6YD+r8Ew4jWLMHmIs37Ht/NpQZMjavlr7OeX84vHhyuBqm382LI1v3LbCnz
         SY6M3TW+evh3HY1jXea5hQCkfIxybn/ekNjstoGQcUxemIOpf+zyHpZaeOW7WV83/S8F
         P3PeYhY4QMKi7llklqrve0P8IvgTSoYqTR7rbgQO+KzgflHDF5wgK0y9XqVY4za7gzLE
         W8nw==
X-Forwarded-Encrypted: i=1; AL+hErH6el9cKLhJJFzW5j9wa6VQXRqF2tC5pIvmNkBLmLJpFfwV/1g6N7hAltLsOE2YofkuenwMw7jzdGcOyIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Wx8E+PMDc1hcMSlGI4RKYiW4VF2urED/ADwsMMgjtAUdkUZ0y
	MSz44H3iQDS+EZ4fQN57dvNPZMMgMbCRkrX1UHNZAK8lzUV3zuWm64oV4ksizPa6N41vK+X8KB4
	jJZly0rZP+KpJ+aG3yhABcaH1dbyJzCY=
X-Gm-Gg: AYBFou1T9AD8vaHAIwPBzll7YycViJg0TrsaUviJ+lxplIGB8UCNKMhW4lZOFzb7La/
	TayyZYhaHTsw3c+IcmXp3Ko/o8hsQze9bchzbPokiNJx2HQNHg9DYZzzW1zyZlHGdL1aEUzXO7b
	SA87W+CejrLESbehB//cX9nK4zVNVjv3PvDSZqvq1EUr/2+PaySYc7uVZ3H5OMbB4cikay1uBY7
	wP/Fdj5kjvLJ7eIA+ulCSGIvyz/I6slC9ShJUfXHkEIC+1vbQAjJHqKlRrFmFT4bUVZ84o0ZTnL
	Z7ox1oiA6fQiXkS5ehOGqZHrd0uacOwbAkPpJnGddsZ8OABLyXsgEQ5CZctzH3ZAtc/T2t7mpjo
	Xt7+hAYRDjeyOuCN2q4/6koXeRsYKO14Kg9G9sSSBcndG+VlvMFtG4gIO9saLz+ZFy7QQksULID
	5llvtEEYul7B7qwsKHPqAZq+gFIlC+Wr+GmMqrMrSn4iSppqxGcSFB7OHi
X-Received: by 2002:a05:690e:214f:b0:679:c7d1:fff9 with SMTP id
 956f58d0204a3-67c3dab73ecmr1892246d50.38.1794238549440; Mon, 09 Nov 2026
 07:35:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108042008.226295-1-hex@freenixos.com> <b83e0172-2f64-4e28-9750-1a5fb3dd6b41@oss.qualcomm.com>
In-Reply-To: <b83e0172-2f64-4e28-9750-1a5fb3dd6b41@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 9 Nov 2026 10:35:38 -0500
X-Gm-Features: AclHuK9eNSp57e_PRSWgRYYAfxmD3rF4iHPMGs5VJcyC7z9NY_ANVxJUm3pWbPE
Message-ID: <CABBYNZLJpDXTPmE_=rJ=J3oUMWRzybHhut4y1kPTEU8y2AKKiQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: Use DECLARE_FLEX_ARRAY() for memdump
 segment data
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Hex Lindqvist <hex@freenixos.com>, Marcel Holtmann <marcel@holtmann.org>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zijun,

On Mon, Nov 9, 2026 at 8:21=E2=80=AFAM Zijun Hu <zijun.hu@oss.qualcomm.com>=
 wrote:
>
> On 11/8/2026 12:20 PM, Hex Lindqvist wrote:
> > struct qhci_vse_memdump declares segdata as a zero-length array in a
> > union. Zero-length arrays are deprecated [1], so use DECLARE_FLEX_ARRAY=
()
> > instead.
> >
> > No functional change: segdata is only used with offsetof(). With debug
> > info stripped, btusb.o is byte-for-byte identical before and after,
> > built with GCC 16 and Clang 21 on x86_64 and GCC 16 on arm64, with
> > UBSAN_BOUNDS and FORTIFY_SOURCE enabled.
> >
> > An AI assistant helped find and check this change and drafted this
> > message.
> >
> > Link: https://docs.kernel.org/process/deprecated.html#zero-length-and-o=
ne-element-arrays [1]
> > Signed-off-by: Hex Lindqvist <hex@freenixos.com>
> > ---
> >  drivers/bluetooth/btusb_qcom.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/bluetooth/btusb_qcom.c b/drivers/bluetooth/btusb_q=
com.c
> > index cc4cfcde2afa..97be9078e045 100644
> > --- a/drivers/bluetooth/btusb_qcom.c
> > +++ b/drivers/bluetooth/btusb_qcom.c
> > @@ -533,7 +533,7 @@ struct qhci_vse_memdump {
> >       __le16 seqno;
> >       u8     subsys;
> >       union {
> > -             u8 segdata[0];
> > +             DECLARE_FLEX_ARRAY(u8, segdata);
> >               struct {
> >                       __le32 dump_size;
> >                       u8 first_segdata[];
>
> NAK. Please keep this as-is. since:
>
> 1) segdata[0] is a familiar GNU C idiom and, since it is only used as an =
offsetof() anchor, is more straightforward than the
>   DECLARE_FLEX_ARRAY() expansion.
>
> 2) I guess this kind of isolated cleanup may not be welcome.As noted in D=
ocumentation/process/maintainer-netdev.rst, simple cleanups outside
>    the context of other work are discouraged

While this maybe true if the above code does produce new warnings then
it needs to be fixed anyway, from the commit message it doesn't
mention any build warning but that perhaps is because it is enclosed
into a union which mask it or something, anyway trainling variable
length should be accompany with __counted_by; so the compiler can do
bounds checking.

--=20
Luiz Augusto von Dentz
