Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F3A35F5E7
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789877533; cv=pass; b=GJD5MQ3WS/As/6futMO1060i7sWx85VfbFuxACw4nDeD5xEBmuZzykT68yjFYyktRxjaUDvwFci0HzsrXlrHmG+QHkIl7jGKggJNNiwt2fk/kCXiqA+5Ju+Z+bNkRT5fw0vh776FOQpDJ4aALz91TTDwUQ8k2zqf3gYjGezS0Uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789877533; c=relaxed/simple;
	bh=rwaqLd78gCCDxPhEWVmec1Qbp7cY3KIbWZB2b88z5ZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYwc5G/x8mO47SwxgtbvCs9jo3i2wKV26O7f+TnLbtDJR2CGNBhV6r7XMgNDnTHVF+NDjptJ99U0dOTaq1v+/1ZpQt+i6umZJneb1wHIS+vMLWz7tuS2YmtAIpLMEs+RiCojJKH0evetVFhB6BXqS1UScprviEg+1jGopXtJuOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcbJ2Bmf; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcbJ2Bmf"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c08393dfso1603502a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789877531; cv=none;
        d=google.com; s=arc-20260327;
        b=RVSSggJvoV1QWNUtKKssKuzeS60KvHTAWFSzPLoEhmVJpX2lhsClaO9rKXjrXIOOXP
         x3UIQ1ZmeJ2vqQKpmy+lcMfp9q4G1P1I2ni2xFik/TfUnWxN3Gw8sflK+PKvoJIZTWox
         baWlIzcmFrlQcDVvYJkPw6RsFC8YDWat+EqeWFNKkYuCLDoljIjgCOP1lOJrzy+YTuoL
         DgC4ha0OqBfJmGsUkykNuRMhYdlc8UFRq48Sc6HSPOb82mj4ogV1oLBIZeTjMVt7hbY0
         byBq3XxgAl2DTy7nE5zwrbnjQDLzP0ts/SAU4tejbeMR9JUG76j3n3CKD/2JnxHXK66f
         3pkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QlZH2LSeOeUh7PHf/pc7GdeXM+jtt8B7hsy70gSGj5A=;
        fh=BgjhvkFOamVJltcHKEHwjWvTzlhe15bxO6Ju9B3lfW0=;
        b=XQIkk2ddxmW3jF0KMO/Thk0GxRyWooNGizPf9T1or3PglrFIEmCEsID44jtBnVvEr/
         Hdlf75g/8Bg6yB2fyNd9jaQpsZZ9mGs3ndoOCbrPWoqobKV036XpXobwH3QH+ySUV10U
         HIu8EzRwymR0wS8dWIH6wgGVUvmuapiFlVVR8e3aIMgZrsK+j3sSKc+KtKm5+XixwWz+
         uhnneuSk6fkAFk4EFTrIOfZBLoNrjZ9U8PcZpU6ipPkvHGNzozhdB33L+5cjNvtcX5qJ
         3S2bRtURII449dQTL8arkoRliV0Dw9cg58RWs20hZXVls8DPBC5ZJjBCTcVyE2jzXTnZ
         508w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789877531; x=1790482331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QlZH2LSeOeUh7PHf/pc7GdeXM+jtt8B7hsy70gSGj5A=;
        b=AcbJ2Bmf8Sz0U/Eo7z5xTOjBLxmx5X96wSNNRqzLiY0kia/Xqnx2wPPodwraHbMt8G
         bWGFsB5ghcEbtuBCZJUSM3m7lXxtbT3Ini/p2UNsAGhDIz6e3Y1gf1Ar4u3M3Gi7q9Id
         fzQ6KlELvgBaaZ8BcxZTIqdHdATvRotwAubeO28TeeORo7tIJYZqnB5Lx+9Fxgrtib5f
         btN4QYWgYPb5k1A5CwD1jIdLGaXGadNGiPT3/JyFoXbODSvCnDYBS7ZJ2ILopjSfkCUW
         YO7KI20PbuNUzFGCPKlyV831CFyramd8TsHuiMNXDbA10ggouU9AKNfIIeKHjar8wHg3
         mupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789877531; x=1790482331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlZH2LSeOeUh7PHf/pc7GdeXM+jtt8B7hsy70gSGj5A=;
        b=l2xbQDxwbfMklLlhANZG5I0HwMWKRw/JyRjBB+RsAx/5daD7MvQazitKPhuUGX5QZq
         ZByZowsl3Id7n22VUvUOsu+0OdhUIwVWqzlwHjA5m1GZubs5FcLbRWa9xgj0jHCeBZPq
         C6gU3hRqDSQ4pSa44AVQnEb4Sfue0vdWmDX9r2+L7ub9+omzn8XNZ2BqEbLRgl9pClYq
         7/SUYw3RcoaL004KVK+Ec2x6066wiCB4glqq3DKkzyqPfPI8h/OCgA5IMFOe1VIBINzQ
         ZbxlVYorH/0s69o+5AzmxtFlR+T/7XT3Yn5YDb1z3f5KkCaFcmG5PkHaH/nf2TRgM6Ts
         Y4Rg==
X-Forwarded-Encrypted: i=1; AKwUvBw2k7RFASlSnpbLglp2ho77ZUFfwoHpA38Z0mlEGfvHCSEU9m26IrG3UMk5+bOXrlh+e3oMg5c6/A3FxXA=@vger.kernel.org
X-Gm-Message-State: AFuF++lpOtWavh7tBX5GGCP58RGcPuvUdAgXgbHMGoy8BiR//B7Al5R0
	ZZC7l3doB3xKq9Lw7Hsepq2AlaIioOe3sURe6KEka/YAVWSNT3zdzzPCEUKoS7tI/eN7VlFcxe0
	296tnbmTHeA95WeWY7rmZDEvpbCcG2YE=
X-Gm-Gg: AYBFou2yp7t+u2B7+s+JCYnodmTjPOIFe5QG5yADQxZt7O1gGyC2r3isWe1chMsvI5Y
	TWEftMZMI4lRN5d4C99H5nZpqs+mKWCxv3St305s09zXjc4uffABml5uXHir1MHalDG//nQ8S/Q
	HGUVdCkVDcEVIkvy7zNWhCkhA134CYbCpXVu+JJmn8EJR8RzaEfwZLXpw+QYdtD6iuCZ5AXjNXR
	RKBRK6utC5HG0VzCFj8GWluzi8z8vYdsn2jNBuJqqGzQEYkPS7o/zQUnv0YO05mtMN7s4GVpAkB
	4i2gaM5KJ4ojVpTmOwEH6Ouhk1xxfombui6DBXTIUdXpUZ9ByaXoV7O6pJyd9O9vv3wqvGzZLPY
	yP6hQRhIe+zLhKjml6o4cmflfNBqKMICnzDZlq6eO
X-Received: by 2002:a05:6a20:6a20:b0:3d2:2afa:d7d with SMTP id
 adf61e73a8af0-3dd8c52d98emr12640970637.18.1789877530888; Sat, 19 Sep 2026
 21:12:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789753020.git.kimjinseob88@gmail.com> <a00b004a7ac283e1d6e307421292757004f09e62.1789753020.git.kimjinseob88@gmail.com>
 <20260920022737.4403fc6d@jic23-hlaptop>
In-Reply-To: <20260920022737.4403fc6d@jic23-hlaptop>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Sun, 20 Sep 2026 13:12:01 +0900
X-Gm-Features: AcwNN1UU_ReN-pfK8MzdlfvZg5NTRSP-1VjnaEcQ45UD5XeGrgMYYEtFBppvb_8
Message-ID: <CALMSewJD=hGTuVLEQHTRtO3oPZD0jCNqsCtjBYv29OKdqwcU3A@mail.gmail.com>
Subject: Re: [PATCH v10 3/8] iio: osf: add protocol decoding
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andriy.shevchenko@intel.com, linux-kernel@vger.kernel.org, 
	rdunlap@infradead.org, joshua.crofts1@gmail.com, u.kleine-koenig@baylibre.com, 
	julianbraha@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> The above fully assigns frame so I'd do similar to you have elsewhere
> *frame =3D (struct osf_frame) {
> .protocol_major =3D ...
> ...
> };
> Both makes it more readable and makes it clear you aren't leaving
> any existing data in place.

Agreed. I'll change this to a designated initializer in the next revision.

> I don't hugely mind as it's your code + spec to maintain but generally
> for a spec with records like this I'd expect it to be possible to extend
> the structure without it being a breaking spec change. As such
> I'd kind of expect the check to be that the payload_len was at least
> as big as expected len. Larger would be fine but we'd ignore anything
> there.

I'd prefer to keep the exact-length check for the existing OSF0
message IDs. The fixed OSF0 specification deliberately keeps the
baseline message layouts exact, with optional extensions using newly
allocated message IDs rather than trailing data on an existing message
ID.

So I don't plan to change this to an at-least-length check in the next revi=
sion.

> Entirely correctly I think you don't do any checks or reads of reserved v=
alues.
> As such why copy them around? I'd just drop that field from your decoded
> structures. Not a huge saving but why carry irrelevant data around!

Agreed. I'll remove the reserved fields from the decoded structures.
The reserved bytes will still be covered by the CRC and tolerated on
receive, but they don't need to be propagated past the protocol
decoder.

Thanks,
Jinseob

2026=EB=85=84 9=EC=9B=94 20=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 10:27, =
Jonathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sat, 19 Sep 2026 03:24:41 +0900
> Jinseob Kim <kimjinseob88@gmail.com> wrote:
>
> > Add helpers for decoding Open Sensor Fusion frame headers and supported
> > message payloads.
> >
> > Validate the fixed OSF0 envelope, payload bounds and CRC before exposin=
g
> > decoded frame contents. Require exact known payload lengths and decode
> > capability entries structurally so the core can apply support policy.
> > Tolerate reserved padding as required by the fixed protocol contract.
> >
> > Use explicit little-endian wire storage sizes and designated
> > initializers for decoded output structures.
> >
> > Assisted-by: LLM
> > Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
> Hi Jinseob
>
> A few things inline. Some are about what I'd kind of expect from
> how specs are often defined to leave a bit of flexibility and reduce
> the need to update drivers for new stuff being added.
>
> If you don't want to go that way I don't really mind.
>
> Otherwise main thing here is why carry reserved data to next layer
> given it is meant to be ignored. Drop it down here in the protocol decode=
.
>
> Thanks,
>
> Jonathan
>
> > diff --git a/drivers/iio/opensensorfusion/osf_protocol.c b/drivers/iio/=
opensensorfusion/osf_protocol.c
> > new file mode 100644
> > index 000000000000..e0d7c7a9ebd7
> > --- /dev/null
> > +++ b/drivers/iio/opensensorfusion/osf_protocol.c
>
> > +
> > +int osf_protocol_decode_frame(const u8 *buf, size_t len,
> > +                           struct osf_frame *frame, size_t *frame_len)
> > +{
> > +     u32 expected_crc;
> > +     u32 actual_crc;
> > +     u32 payload_len;
> > +     size_t total_len;
> > +
> > +     if (!buf || !frame || !frame_len)
> > +             return -EINVAL;
> > +
> > +     if (len < OSF_FRAME_MIN_LEN)
> > +             return -EMSGSIZE;
> > +
> > +     if (get_unaligned_le32(buf) !=3D OSF_FRAME_MAGIC)
> > +             return -EPROTO;
> > +
> > +     if (get_unaligned_le16(buf + 6) !=3D OSF_FRAME_HEADER_LEN)
> > +             return -EPROTO;
> > +
> > +     payload_len =3D get_unaligned_le32(buf + 10);
> > +     if (payload_len > len - OSF_FRAME_MIN_LEN)
> > +             return -EMSGSIZE;
> > +
> > +     total_len =3D OSF_FRAME_HEADER_LEN + payload_len + OSF_FRAME_CRC_=
LEN;
> > +     expected_crc =3D osf_crc32_ieee(buf, OSF_FRAME_HEADER_LEN + paylo=
ad_len);
> > +     actual_crc =3D get_unaligned_le32(buf + OSF_FRAME_HEADER_LEN + pa=
yload_len);
> > +
> > +     if (actual_crc !=3D expected_crc)
> > +             return -EBADMSG;
> > +
> > +     frame->protocol_major =3D buf[4];
> > +     frame->protocol_minor =3D buf[5];
> > +     frame->message_type =3D get_unaligned_le16(buf + 8);
> > +     frame->payload_len =3D payload_len;
> > +     frame->sequence =3D get_unaligned_le64(buf + 14);
> > +     frame->timestamp_us =3D get_unaligned_le64(buf + 22);
> > +     frame->flags =3D get_unaligned_le32(buf + 30);
> > +     frame->reserved =3D get_unaligned_le32(buf + 34);
>
> As below. I'm not sure what benefit of keeping reserved around is.
>
> > +     frame->payload =3D buf + OSF_FRAME_HEADER_LEN;
> > +     frame->crc =3D actual_crc;
>
> The above fully assigns frame so I'd do similar to you have elsewhere
>         *frame =3D (struct osf_frame) {
>                 .protocol_major =3D ...
> ...
>         };
> Both makes it more readable and makes it clear you aren't leaving
> any existing data in place.
>
>
> > +     *frame_len =3D total_len;
> > +
> > +     return 0;
> > +}
>
> > +
> > +int osf_protocol_decode_capability_report(const struct osf_frame *fram=
e,
> > +                                       struct osf_capability_report *r=
eport)
> > +{
> > +     u16 capability_count;
> > +     size_t expected_len;
> > +     const u8 *payload;
> > +
> > +     if (!frame || !report || !frame->payload)
> > +             return -EINVAL;
> > +
> > +     if (frame->message_type !=3D OSF_MSG_CAPABILITY_REPORT)
> > +             return -EPROTO;
> > +
> > +     if (frame->payload_len < OSF_CAP_REPORT_BASE_LEN)
> > +             return -EMSGSIZE;
> > +
> > +     payload =3D frame->payload;
> > +     capability_count =3D get_unaligned_le16(payload);
> > +
> > +     expected_len =3D OSF_CAP_REPORT_BASE_LEN +
> > +                    capability_count * OSF_CAP_SENSOR_ENTRY_LEN;
> > +     if (frame->payload_len !=3D expected_len)
>
> I don't hugely mind as it's your code + spec to maintain but generally
> for a spec with records like this I'd expect it to be possible to extend
> the structure without it being a breaking spec change.   As such
> I'd kind of expect the check to be that the payload_len was at least
> as big as expected len. Larger would be fine but we'd ignore anything
> there.
>
> > +             return -EMSGSIZE;
> > +
> > +     *report =3D (struct osf_capability_report) {
> > +             .capability_count =3D capability_count,
> > +             .entries =3D payload + OSF_CAP_REPORT_BASE_LEN,
> > +     };
> > +
> > +     return 0;
> > +}
> > +
> > +int osf_protocol_decode_capability_entry(const struct osf_capability_r=
eport
> > +                                      *report, u16 index,
> > +                                      struct osf_capability_entry *ent=
ry)
> > +{
> > +     const u8 *payload;
> > +
> > +     if (!report || !report->entries || !entry)
> > +             return -EINVAL;
> > +
> > +     if (index >=3D report->capability_count)
> > +             return -ERANGE;
> > +
> > +     payload =3D report->entries + index * OSF_CAP_SENSOR_ENTRY_LEN;
> > +     *entry =3D (struct osf_capability_entry) {
> > +             .sensor_type =3D get_unaligned_le16(payload),
> > +             .sensor_index =3D get_unaligned_le16(payload + 2),
> > +             .channel_count =3D get_unaligned_le16(payload + 4),
> > +             .sample_format =3D get_unaligned_le16(payload + 6),
> > +             .scale_nano =3D get_unaligned_le32(payload + 8),
> > +             .flags =3D get_unaligned_le32(payload + 12),
> > +             .reserved =3D get_unaligned_le32(payload + 16),
>
> Entirely correctly I think you don't do any checks or reads of reserved v=
alues.
> As such why copy them around?  I'd just drop that field from your decoded
> structures.  Not a huge saving but why carry irrelevant data around!
>
> Jonathan
>
> > +     };
> > +
> > +     return 0;
> > +}
