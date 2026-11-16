Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794866859;
	b=Pd+c1g4d0IgCbaPO2+QI4T8R1+NhDYNCwMGznVmGR38PGhB88fy4DnUgE/khvWfsOJs4
	 vmSDU4IedhBc7noxUJS31dxf3RIoQw4MdYzRfthu6JaW5tHFj5KWhuPfJYBr8BNmC31TM
	 5xihlYI2Vbxf6WZn1cfHPZgqmYyRBfqv8nxvcI5+kUNNWvfSUjB+DnJQfrYfNaQIMhU6X
	 L032KtaK+PIlnukIkkGzoDu6qNNdaXyLOKNnZUba52sPSlFjglnsCdRHcsPqOWLY2tl3w
	 OxxnkksqKRpxiuZg3+osLnaToymYheI2KIYfgbxLbeDn0rc7N77cpnlHZgQlR3fCZRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bvHNWn/Ypwuuq8M1xLdD8fENdsng8rJJBmTIjt87Kp0=;
	b=pjxiDZa+scLUtW5R17KsDkh/OwLtMZOg/UXksx2+cWRmxfwZ3j/G8x//TF8H3c9w7dUH
	 awW+LR7KTDXdUcnW/8qbnkeLDL2HRWiWGhXGjI+fgSyrGd3d53vCHrsiauu+vnp8vh8Kf
	 aYkkFTAQ3yARO4zCSC1JfE2Lq3SyGA2gLwQ3cNO+awqXZLeoxS2uqdb0SiNExhCeX3kRS
	 chD/i8HK5oDKwVhFLYOH8L6Pfah+BzULwwU1EhO6UcakG1VQIsn3Z7+cSFuPLZkNrkxjP
	 j9qzxC491gAZXX95yUXu1SfT25wDQiZRDq3lwFynlMu2SceGLXjPSkkk/4fie7xdGhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TkxzOX4a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969A1606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 969A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TkxzOX4a
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b869ea8224so352a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:07:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794866857; cv=none;
        d=google.com; s=arc-20260327;
        b=RyF8BNPP0ABw4gTnb/wrggI4Cc5GO5ZMZfwQ+W4C4q5LOQEKnlU7XsRpmTB19L+GP0
         psGrsb8xcbw9g8lkUWShxy2HpJrAEvXgNYXsCOC2S7KnpVVToMphwKMB6/ljHzRPSuir
         mjo0lhYPFvEjtVv7TeuJZE9TZwrCGgmAcfXFFeM73t+2hyWITXGRo+2R+VEH/Ko6eLpO
         56afgranphjkROnzQnYITi6t7XyBO2k/+GVGFFtg9GvlYZHGqRbG8euRi8msK7N844gY
         FjIrmY6dgIZnKbJt0/26G/K4pabiOju8C6bnR9h7k3vIB8sMupvuL2K6ooTXfcaC9ZYF
         dylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bvHNWn/Ypwuuq8M1xLdD8fENdsng8rJJBmTIjt87Kp0=;
        fh=zDZR4BTV/vCvsgCKxTVdn61HCqiKWxvWqQnnc1Y4PeU=;
        b=nqRSNDneRerkVvQ0CBYT1mAlNT6+9bsnrudbejz5EudY29LkDP+QZOr1MoMoYkCici
         YR3YG4b/MOT+4fqT1QRjufmQMGK0G/p6gC3/iH35Wj/dX3O0P42k7zBk4p0DS57pbP5R
         dq193cl9fN5zETTv2AYsUAbIDo8nz1NsfKmGDBo1KKJnSCgpX6TzOXLHU7BD1lnqf2xb
         geQrfePZKX3IXPgLwEeDjQL2pvbkGAts//voBM/+2PSTo6FH8+1LD/arei0T23YeW0Av
         K64hs6PUWTctaht6BF3jTU5VWVdnOr1vZ0vLSnLai49UK89iL3/TPTEaiQoNXISZZGIG
         zZuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794866857; x=1795471657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bvHNWn/Ypwuuq8M1xLdD8fENdsng8rJJBmTIjt87Kp0=;
        b=TkxzOX4aoiWaACUOFc/kBTx4IkhPC7hWIyIuHNSS9HAldz5HFGU4mwK8+vifExWweO
         yvtGROP/WTYByvnFZch4aqyll7KoCPzVmpJlD9qBWnV36MzoD/Zjs4kl7x1CdAgx0NlM
         oYGaAlntwuY8Ca9LOSaWqL8aKhpyV1wAwFyfU+ztOpypXVEgr4nKcSKmA2Yy/eMoCUg8
         2Pd1lofaBdLsK4LTkzukVrXj6onlR9E0PI619s2nBbUn4TmgtVVPcRxfFHZaimXx4Kpa
         S3zywiWQz/XmsIHwDtbPV9cH7SRNwvSwrFY5vqGRWIIAeWwHhgX9No9VXyRz5mH6Nuft
         TE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866857; x=1795471657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvHNWn/Ypwuuq8M1xLdD8fENdsng8rJJBmTIjt87Kp0=;
        b=TmWC5rMIIIhX5HIa8LTdQoznBKwN7D2hdIdYuxj49iZpUxbmUDyLjqVX2u9iHbH7Zk
         kvgbipeNGM5iAXui59VB9IMsz4/zZm/ByC2aPj0VGHjNljgZhixu/V35A9QJTcUOQu9m
         Y6IFwXnQL80zl2sqcO/j1Ymor46DLoMa2swk4cUuvUZiOXL3CHvL8xYha4+ZpbUXG6Oc
         IwQdBJeBSLYWUTvdBSLQ/6wx/UdgQuKcVCobRlXGO+JCXau7OrJ7GUim7aau80OaQjao
         mPWl/XLUn/XyfGtSoJWavI252L1jqGS/7aP6eEYQGZGhjOW8TpMq07hrm/85Riqh8q5K
         rHHw==
X-Forwarded-Encrypted: i=1; AL+hErGHmQDzJYUEuneDtyG0eA0ABHbb8FKbQ4fWkZvBcFBjQLe/fqAqwdfSkpO1I9jJDrF3wY891+p+9Sv/kNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MdgDGCpp2di0YsLIZWeWdlsivWXdISrTDJrkpk19jgwJg6FL5
	GJV6nMmzoCcIQ0kNb1GUnL8/AXwJWwVwwLBHYBQ0HjnKGF3lim6cAQ3HLqm4ZfhLUIZdsQPjMDB
	y75h5n5q1NCihGW8rqJaR49JMcNyIA1JYQaQOVmvU
X-Gm-Gg: AYBFou1e6IaChiW/kV9Az/ZwIe9FAiDh8ioG+81CqdN0yBPztBJckkbW2uZhZd2zC2E
	ImOphqj6Gtudsq1Qy18k3fDdzUzkR0oLtMtAme/qLYB3bHoDqy7eKpiBoPAisf8ErWVcxZv3w/I
	Xmjqn7a6CETj8ZVZxwjNb3LFWXwWTug1EYVeaCcobX7BcqMyIZ95izgncUlto1i8lVCePE6sm+e
	Y8TPdbC9YsE3IzKNGN1+4sRHl7Bk9Njt5omP8hX5kci7hLEL6Ls2vDFmDe15Gp8j29vDT5NOW/T
	7EwLUzkajOuIKK7Br6o9qnXCSgA75PAFggriD3xKyV/ZbIghgtk8EMNFqVkAsG8hAqnNOgScPKI
	3049b7x2K8b7SjjTJyLbMaM9UpCdlK5PisRhJuTopYQX5zIMvtm7FB9Wa4xa/aPXpDQ==
X-Received: by 2002:a05:6402:21d6:b0:6b7:bff7:bbac with SMTP id
 4fb4d7f45d1cf-6b85b5510f7mr20666a12.6.1794866856424; Mon, 16 Nov 2026
 14:07:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116020504.4051796-1-chullee@google.com> <9d58cbf3-e0cc-41b8-8958-df8abd505524@acm.org>
In-Reply-To: <9d58cbf3-e0cc-41b8-8958-df8abd505524@acm.org>
From: Daniel Lee <chullee@google.com>
Date: Mon, 16 Nov 2026 14:07:24 -0800
X-Gm-Features: AclHuK9nG0sgRz_IDHuGpKLsvCg91L-4oJRDfBo0bTPftq8WaH6t570Q_2Ba8YM
Message-ID: <CALBjLoCzDbRg9EO=iJir3WqK5bpQZqTbc9X-hoP823oDUDwUeQ@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] ufs: sysfs: Add WB partial flush mode support
To: Bart Van Assche <bvanassche@acm.org>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	alim.akhtar@samsung.com, avri.altman@sandisk.com, tanghuan@vivo.com, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 7:02=E2=80=AFPM Bart Van Assche <bvanassche@acm.org=
> wrote:
>
> On 11/15/26 6:05 PM, Daniel Lee wrote:
>  > +What:
> /sys/bus/platform/drivers/ufshcd/*/attributes/wb_partial_flush_mode
>  > +What:               /sys/bus/platform/devices/*.ufs/attributes/wb_par=
tial_flush_mode
>  > +Date:               June 2026
>  > +Contact:    Daniel Lee <chullee@google.com>
>  > +Description:        This entry controls Extended WriteBooster partial=
 flush
> modes.
>  > +
>  > +            =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  > +            "none"   No partial flush
>  > +            "fifo"   FIFO mode
>  > +            "pinned" Pinned mode
>  > +            =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  > +
>  > +            The attribute is read-write.
>
> Please update the Date: field across the new ABI entries (June 2026 has
> passed).
>
> Also, please drop the quotes around "none", "fifo", and "pinned" to match
> the other string attributes in this file (such as wb_resize_hint,
> wb_resize_status, and hid/state), since literal quotes are neither emitte=
d
> nor accepted.
>
>  > +Description:        This entry configures the maximum size in Allocat=
ion
> Units reserved for the
>  > +            WriteBooster FIFO Buffer size.
>  > +            The attribute is read-write.
>  > +
>  > +What:               /sys/bus/platform/drivers/ufshcd/*/attributes/wb_=
cur_fifo_size
>  > +What:               /sys/bus/platform/devices/*.ufs/attributes/wb_cur=
_fifo_size
>  > +Date:               June 2026
>  > +Contact:    Daniel Lee <chullee@google.com>
>  > +Description:        This entry shows the current size in Allocation U=
nits
> of the WriteBooster FIFO
>  > +            Buffer size.
>  > +            The attribute is read only.
>
> Minor: please drop the redundant trailing "size" in "WriteBooster FIFO
> Buffer size" in both descriptions above.
>
>  > +What:               /sys/bus/platform/drivers/ufshcd/*/attributes/wb_=
pinned_avail_pct
>  > +What:               /sys/bus/platform/devices/*.ufs/attributes/wb_pin=
ned_avail_pct
>  > +Date:               June 2026
>  > +Contact:    Daniel Lee <chullee@google.com>
>  > +Description:        This entry shows the percentage of available spac=
e
> remaining in the
>  > +            Pinned WriteBooster buffer.
>  > +            The attribute is read-only.
>
> Per JESD220G Table 14.28 (IDN 43h,
> bPinnedWriteBoosterBufferAvailablePercentage),
> this value is reported in 10% granularity (00h: 0%, 01h-09h: 10%-90%,
> 0Ah: 100%), not 0-100%. Please document the 10% granularity so userspace
> does not misinterpret 0x0000000A as 10%.
>
>  > +What:
> /sys/bus/platform/drivers/ufshcd/*/attributes/wb_pinned_cumulative_write_=
size
>  > +What:
> /sys/bus/platform/devices/*.ufs/attributes/wb_pinned_cumulative_write_siz=
e
>  > +Date:               June 2026
>  > +Contact:    Daniel Lee <chullee@google.com>
>  > +Description:        This entry shows the total cumulative size of dat=
a
> written to the
>  > +            Pinned WriteBooster buffer.
>  > +            The attribute is read-only.
>
> Please state the unit here: per JESD220G Table 14.28 (IDN 44h), this valu=
e
> is in units of 10 MB (and saturates at 0xFFFFFFFF).
>
>  > +What:               /sys/bus/platform/drivers/ufshcd/*/flags/wb_unpin=
_enable
>  > +What:               /sys/bus/platform/devices/*.ufs/flags/wb_unpin_en=
able
>  > +Date:               June 2026
>  > +Contact:    Daniel Lee <chullee@google.com>
>  > +Description:        This entry controls the Pinned WriteBooster unpin
> enable flag (fUnpinEn).
>  > +
>  > +            =3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  > +            0        Unpin Disable: pinned data is not flushed by Wri=
teBooster
>  > +                     Buffer flush operation.
>  > +            1        Unpin Enable: pinned data is flushed by WriteBoo=
ster
>  > +                     Buffer flush operation.
>  > +            =3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  > +
>  > +            The attribute is read-write.
>
> ufs_sysfs_flag_show() emits "false" or "true" via str_true_false(flag),
> not 0 or 1, while ufs_sysfs_flag_store() accepts any kstrtobool() value
> (0/1, false/true, n/y, off/on). Please update this description so it
> accurately reflects what reading returns and what writing accepts.
>
>  >  static inline bool ufshcd_is_wb_flags(enum flag_idn idn)
>  >  {
>  > -    return idn >=3D QUERY_FLAG_IDN_WB_EN &&
>  > -            idn <=3D QUERY_FLAG_IDN_WB_BUFF_FLUSH_DURING_HIBERN8;
>  > +    return (idn >=3D QUERY_FLAG_IDN_WB_EN &&
>  > +            idn <=3D QUERY_FLAG_IDN_WB_BUFF_FLUSH_DURING_HIBERN8) ||
>  > +           idn =3D=3D QUERY_FLAG_IDN_WB_UNPIN_EN;
>  > +}
>
> Per JESD220G Table 14.26, fUnpinEn (13h) has Type "D" (device-level,
> addressed with INDEX =3D 00h and SELECTOR =3D 00h per Note 1), unlike fla=
gs
> 0Eh-10h which are "A/LU/0 or D" (Note 4). Including
> QUERY_FLAG_IDN_WB_UNPIN_EN here will send a non-zero INDEX when
> WriteBooster uses an LU-dedicated buffer on a non-zero LUN. Please leave
> ufshcd_is_wb_flags() unchanged.

Thanks for pointing this out.

By the way, the name ufshcd_is_wb_flags() is a bit confusing with the
addition of
Type "D" WB flags and attributes, so it might be good to rename it to
ufshcd_is_lu_wb_flag().

For v4, I will keep the exisiting names as requested.

>
>  >  static inline bool ufshcd_is_wb_attrs(enum attr_idn idn)
>  >  {
>  > -    return idn >=3D QUERY_ATTR_IDN_WB_FLUSH_STATUS &&
>  > -            idn <=3D QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE;
>  > +    return (idn >=3D QUERY_ATTR_IDN_WB_FLUSH_STATUS &&
>  > +            idn <=3D QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE) ||
>  > +           (idn >=3D QUERY_ATTR_IDN_WB_PFM &&
>  > +            idn <=3D QUERY_ATTR_IDN_NON_PINNED_WB_MIN_SIZE);
>  >  }
>
> Same issue here. Per JESD220G Table 14.28:
> - 3Fh (bWriteBoosterBufferPartialFlushMode),
>    42h (dPinnedWriteBoosterBufferCurrentAllocUnits),
>    43h (bPinnedWriteBoosterBufferAvailablePercentage), and
>    44h (dPinnedWriteBoosterCummulativeWrittenSize) are Type "D" (INDEX =
=3D
> 00h).
> - Only 40h, 41h, 45h, and 46h are "A/LU/0 or D" (Note 15).
>
> Please restrict ufshcd_is_wb_attrs() to the LU-indexed attributes
> (1Ch-1Fh, 40h-41h, and 45h-46h).
>
>  > +static ssize_t ufs_sysfs_attr_store(struct device *dev,
>  > +    struct device_attribute *attr, const char *buf, size_t count,
>  > +    enum attr_idn idn)
>  > +{
>  > +    struct ufs_hba *hba =3D dev_get_drvdata(dev);
>  > +    u8 index =3D 0;
>  > +    u32 value;
>  > +    int ret;
>  > +
>  > +    if (kstrtou32(buf, 0, &value))
>  > +            return -EINVAL;
>
> Since ufs_sysfs_attr_show() supports 64-bit attributes via
> ufshcd_is_qword_attr(idn), please either support ufshcd_is_qword_attr(idn=
)
> here as well or guard against it (e.g. WARN_ON_ONCE) so a future
> UFS_ATTRIBUTE_RW() user for a 64-bit attribute cannot silently issue a
> 32-bit query.
>
>  > +    ufshcd_rpm_get_sync(hba);
>  > +    ret =3D ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,
>  > +            QUERY_ATTR_IDN_WB_PFM, ufshcd_wb_get_query_index(hba), 0,=
 &value);
>  > +    ufshcd_rpm_put_sync(hba);
>
> Since QUERY_ATTR_IDN_WB_PFM (3Fh) is Type "D" per JESD220G Table 14.28,
> please pass 0 instead of ufshcd_wb_get_query_index(hba) here and in
> wb_partial_flush_mode_store().
>
> Also, unlike wb_resize_hint / wb_resize_status / wb_resize_enable, none o=
f
> the new entries check hba->dev_info.ext_wb_sup
> (wExtendedWriteBoosterSupport:
> BIT(1) for FIFO Partial Flush Mode and BIT(2) for Pinned Partial Flush
> Mode per JESD220G Table 14.4, plus hba->dev_info.b_presrv_uspc_en for
> Pinned mode per Section 13.4.18.7). Should we define those capability bit=
s
> in include/ufs/ufs.h and check them (returning -EOPNOTSUPP or hiding
> unsupported attributes via .is_visible) rather than waking the device and
> issuing unsupported queries on devices without these features?

Agreed. I will define them and return -EOPNOTSUPP when unsupported (matchin=
g
wb_resize_hint / wb_resize_status / wb_resize_enable).

Thanks,
Daniel

>
>  > +    QUERY_ATTR_IDN_PINNED_WB_CUMMULATIVE_WS =3D 0x44,
>
> Please spell this CUMULATIVE (single 'M'), matching the sysfs attribute
> name wb_pinned_cumulative_write_size and JESD220G Section 13.4.18.7.2.
>
> Thanks,
>
> Bart.
