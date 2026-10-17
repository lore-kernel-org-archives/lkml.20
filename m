Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88651F936
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792195547; cv=pass; b=D1+UUBa8KgMVqD7g/UUwCiJ6U4EYZuGkOiQUYpCNr59Vzz+foQPVedre6MajlLj2y7sd+pgddZVcMau2WI91uRaSdeMH5QPrkzMpubTrBDA42UsfNUdrFKeMlOmhpdwT7EtsRMYvhnAYzyeWg20r+R/2IoRnI1BA/ei9b4V7BQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792195547; c=relaxed/simple;
	bh=S40D/Gz31yR1IxJSEtQjuAutwyujVq9V+T6kqJG3/sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JxY4DXehl2zihZViQHJ7hm1AXhhTvmwWA2fcfs9w1b3BzcNVSERAAHcaMURANC15dQ6EN76rupFnYZBYuuWpgAmS7X9ikI07bp5U3ptMG1oFowT78DxGjaF36N3ieEgox4r1ovDdkioKI4vDLwJQlyVoHhujPgKxCaJp9rzuN40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rNYHzpex; arc=pass smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rNYHzpex"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93e503815adso31576685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792195545; cv=none;
        d=google.com; s=arc-20260327;
        b=CEyCP99It2JYZdbpD2hBkyTx8uPexCWfB+uzVcPRxLStqk2HfetkzTwpKxSMw9Hxxd
         jaTzvYRX2mA+soUcyVPOv7OllM0/WJViV65mFWv0vsB/FjyHNGsvoRUcRZ0BgUqH6/nU
         E1ekAB/wV1tkTegSm8Py34B1sNu+TxVKbjqgNofjTbaxANwF2CQfR7OR80XlfpFOlpHk
         3WNdQ31NHRVOknyW6UHum1+619OEIPEarHcr1gnydhRIa5tmhet9y0SARKTQG4PhlWX5
         1KCJkLFXfYtRfjxZXTZL+cRwVVYIDEeojdu8zvwy5vKbNyzaIPWlcZLq4G9dS57ZTGbM
         jW+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ue4G/M1eI5fPXNxAGUZc1tMSOgb+LD+5F1p9lIf/rP8=;
        fh=XRW35BQA0Qmh+p2FSCnYIP2TtYKit+IUFkZ4qVPKKdI=;
        b=TWMqdFIukg7E9VvVueowN7l2acdO2RKDGqgtr8iGyfv3kFE41+FL5fBrFKt+Dq8Lsb
         Ht1r5otIdVOVMg632kG3fAoNOyh2fqyOi3J2oRavJSXC8KGQ+nSYYzD0I5iMVGX8lmbu
         QN3IcOE5GaguNExLNLZJbri3Z1a1/4/+41ev6nsKtjHCy7F1LxccNXwPYVYrQgOJFESQ
         +4Ny3wdwwh8PWBAHWKzM9oPbJxcOvu91FVXOTUjFHFIP2T14zfm+Wd89/1QrAbn8Vxod
         wrJRS+C6HSEqzzrR+VvQsJS91IbcABj7ivv9oMYyNQuJBLvGAC7/2jEVAgI4/h8aFAqj
         XdNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792195545; x=1792800345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ue4G/M1eI5fPXNxAGUZc1tMSOgb+LD+5F1p9lIf/rP8=;
        b=rNYHzpexChQwCe+C1Pc+S5MIOs0rhp051bQRNbA/04DOZSYWjeSEz0Xck4/hIB7pwT
         wo/+bDg0ysu5TO+1jxbgeq7VHXvfVO0Ts0QOUZCadDRIPovjcQOC9RGatec2ZOBG6F1p
         rnekmEvblmCaNkJKBtvOr4xnyNBx9gUWvBDEbc02zjH/ZS7aI+5hP4+IJYigUj09ZI1l
         igpKtJhT/Jszz9OjpxZKJz6HXwZByzXT8IIckx0ivYCu1HRFAe8oFWKu1LGFjl8cu0uh
         nVpWAGR+Vsp4GQtAYXObviA0QFiE0C0kQ/oulowW3wFPC571M4bUZYNuaQAhLIgclh4w
         85Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792195545; x=1792800345;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ue4G/M1eI5fPXNxAGUZc1tMSOgb+LD+5F1p9lIf/rP8=;
        b=u6HIA6mi1KvAjAKXdSpkBthrcnur4BpgdcIdoJy4jfPAqEQSy5lbKk7vRlv+AgXf7j
         ljBMWNouTnware64P0G+eW45v4ZeHtLcA+kcQv8Bq6PEnkgepOEAEzJClCwMtzpZouFS
         cp2yhYO++vYXWGnxFNACLg4wxKYNuOsbFYOC2Zxdn9+V334hlIpR3FLJXU1QPPO6GG7U
         FpA6gE06/6rYJs5a0nXiCsV30qWt+IJK3QqsYGxdl6nj3m9oxaebaN8ObPXjGhKhuqGQ
         znOmD63UsvrqaTAfELbmiKfVQaqKKZpnFCnSDE69sDymFRkYfUQj4YD5cztMLgBh2z56
         d1XQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpVulYzvgHdJsWCVN7aQG3Ua/5XJBVYSYpuouY0nvfWy5hfk15oj4uzoAlbm+K+OdwzHAH7Ce1gKDA2+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIT/viyJJBWW+ijZ38SpvVYiKqpaRXkWdPlZWx3DUvM8FFwJEit
	6hLEjiSVXEg+TV7TqzdG15MBvRVpyMmo3rynMiytovrjbQlCLLFgDQFw+QRu/CcdxduLC4DX1Xh
	tc6hQwsyJlaTxYPonnzt8Ki1kaiJrWwiAwblq
X-Gm-Gg: AYBFou0AqWDwpWlUZ9maYz0p5R5slRW5odqoUPtDpWofsC/ap+6hs/nkjPtyHZkD4uM
	wwc+3AAecUqWHJflCOT7/BzhLhPRyCLDqTV02JECoNDEUAo1YJiyqYMVboX5bkrYR52Uy2FmBL3
	yVB9opGyes0/vQ5C86e0MYaXgJtlBua7DUSIfU7gl7r76Q+fs7LFQiiEMLiT0JcfFvzuiZ5z/sh
	Y+gsR/PApU09nnBkopGOamP7nQOVtu0P7sMTf+10qJbLPFkj1hr4g5WVw1AwtH0dB/03QdTlJPK
	eIL+JWY6Fvf8x5wpgKVngqVNAiwLZb6GGsO3byTITvn678/DfDYIlB0=
X-Received: by 2002:a05:620a:2314:10b0:93f:2b23:4820 with SMTP id
 af79cd13be357-93f2b2369c4mr102446085a.48.1792195544563; Fri, 16 Oct 2026
 17:05:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <579o8so3-09o3-o312-4sq0-0qp6n672q46p@xreary.bet> <20260927041138.4112920-1-jinmo44.yang@gmail.com>
In-Reply-To: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Fri, 16 Oct 2026 17:05:32 -0700
X-Gm-Features: AclHuK-SADDPY5PP6EjKcN38xFI4Wf84MYQgZLb9v6sKQSXZdgOO2mVDmoKZCOo
Message-ID: <CANRwn3RrB0O152idsVP56zCauXfjjbyFArNAv2e8yfbXskju8w@mail.gmail.com>
Subject: Re: [PATCH 0/5] HID: wacom: check input devices in the report handlers
To: Jinmo Yang <jinmo44.yang@gmail.com>
Cc: ping.cheng@wacom.com, jason.gerecke@wacom.com, jikos@kernel.org, 
	bentiss@kernel.org, dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 9:11=E2=80=AFPM Jinmo Yang <jinmo44.yang@gmail.com>=
 wrote:
>
> This is the extended version Jiri asked for in
> <579o8so3-09o3-o312-4sq0-0qp6n672q46p@xreary.bet>, after Dmitry's
> observation that "there are many more places in the driver where it used
> wacom->pad_input without verifying that it exists".
>
> The audit turned out broader than pad_input. Of the 155 lines in
> wacom_wac.c that reference pen_input, touch_input or pad_input, three
> places already test the pointer first:
>
>   wacom_wac.c:1807/1815  wacom_tpc_irq                 pen, touch
>   wacom_wac.c:1210       wacom_intuos_bt_process_data  pad
>   wacom_wac.c:2192       wacom_wac_pad_event           (HID_GENERIC)
>
> so the inconsistency is inside the legacy dispatch rather than between it
> and the HID_GENERIC path. The clearest illustration is two adjacent lines
> in wacom_intuos_bt_process_data(), one checked and one not:
>
>         input_sync(wacom->pen_input);           /* :1209 */
>         if (wacom->pad_input)                   /* :1210 */
>                 input_sync(wacom->pad_input);
>
> Why the pointers can be NULL on a *successful* probe
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> For a non-HID_GENERIC device the report handler is selected by
> features.type, which comes from the id table (wacom_sys.c:2945), while th=
e
> three input devices are allocated from what the report descriptor declare=
s.
> When wacom_setup_{pen,touch,pad}_input_capabilities() returns -ENODEV,
> wacom_setup_inputs() frees that input device, sets the pointer to NULL an=
d
> still returns 0 (wacom_sys.c:2172-2196) - the "no pen in use on this
> interface" case. wacom_wac_irq() then still routes reports to a handler
> that dereferences it.
>
> No error injection is needed. A descriptor declaring only touch usages
> leaves pen_input and pad_input NULL; one declaring only pen usages leaves
> touch_input and pad_input NULL.
>
> What the series fixes
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 15 locations, each reproduced as a KASAN NULL-pointer dereference from on=
e
> /dev/uhid device plus a single UHID_INPUT2 write, with no privilege beyon=
d
> access to /dev/uhid:
>
>   patch  file:line          function                       pointer
>   1      wacom_wac.c:4229   wacom_report_numbered_buttons  pad
>   2      wacom_wac.c:137    wacom_penpartner_irq           pen
>   2      wacom_wac.c:227    wacom_pl_irq                   pen
>   2      wacom_wac.c:244    wacom_ptu_irq                  pen
>   2      wacom_wac.c:303    wacom_dtus_irq                 pad
>   2      wacom_wac.c:326    wacom_dtus_irq                 pen
>   2      wacom_wac.c:391    wacom_graphire_irq             pen
>   2      wacom_wac.c:444    wacom_graphire_irq             pad
>   3      wacom_wac.c:594    wacom_intuos_pad               pad
>   4      wacom_wac.c:1209   wacom_intuos_bt_process_data   pen
>   4      wacom_wac.c:1232   wacom_intuos_bt_irq            pen
>          (both covered by one check at wacom_intuos_bt_irq() entry)
>   5      wacom_wac.c:3100   wacom_bpt_touch                touch
>   5      wacom_wac.c:3117   wacom_bpt_touch                pad
>   5      wacom_wac.c:3130   wacom_bpt3_touch_msg           touch
>   5      wacom_wac.c:3178   wacom_bpt3_button_msg          pad
>
> Patch 1 also guards wacom_wac_finger_count_touches(), and patch 2 also
> guards wacom_dtu_irq(); both are reachable with a NULL pointer but their
> only dereference is in a dev_dbg(), so they do not fault with
> CONFIG_DYNAMIC_DEBUG=3Dn.
>
> Dereferences that are reached only through dev_dbg() are otherwise out of
> scope here. A few remain, on unknown-report paths in wacom_dtus_irq(),
> wacom_graphire_irq() and wacom_intuos_irq(); guarding those needs a
> separate look at what a pen-only or pad-only interface should still
> report, so I have left them for a follow-up rather than mixing them in.
>
There are a large class of devices in the legacy codepath for which a
pen-only interface is not valid. There are exceptions (e.g. GRAPHIRE
is a pen-only interface), but in many cases (see
wacom_setup_device_quirks) interfaces which have a pen interface will
also have a pad. I'm not aware of *any* Wacom device which has a
pad-only interface (though I could be wrong; I can try to dig up old
spec documents or original commits that would shed light about any
cases where there is doubt).

> Approach
> =3D=3D=3D=3D=3D=3D=3D=3D
> A check where each pointer is taken, which is what wacom_tpc_irq() alread=
y
> does. Where a handler serves both pen and pad reports - wacom_dtus_irq(),
> wacom_graphire_irq(), wacom_bpt_touch() - the checks are per branch rathe=
r
> than at function entry, so an interface that has a pad but no pen keeps
> delivering pad events.
>
> A per-features.type table of required input devices would be one place
> instead of 15, but a handler's needs vary by report id, so such a mask
> would have to demand every input the handler might touch and would then
> reject reports that work today on a partial interface. I am happy to buil=
d
> that instead if you would rather have it.
>
> Testing
> =3D=3D=3D=3D=3D=3D=3D
> linux-next 20260925 (7.3.0-rc4-next-20260925-gf5f84daefcd9), x86_64,
> CONFIG_KASAN_GENERIC=3Dy, CONFIG_DYNAMIC_DEBUG=3Dn. 27 uhid reproducer ca=
ses
> covering the sites above plus the dev_dbg-only ones, one fresh VM per cas=
e
> because the oops leaves driver_input_lock held:
>
>                               before    after
>     KASAN faults                  17        0
>     probe failures                 0        0
>     hidraw nodes created          26       26
>     input devices registered      25       25
>
> and the set of input devices registered is identical in all 27 cases, so
> the checks remove the faults without changing what a device exposes. The
> one case that creates no device is a product whose table entry sets
> .check_for_hid_type, which uhid cannot satisfy; it behaves the same befor=
e
> and after.
>
> Each patch builds standalone with no new warnings, and checkpatch --stric=
t
> reports 0 errors, 0 warnings and 0 checks for all five.
>
> Not in this series
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Jason, your review of "HID: wacom: add report length validation in irq
> handlers" (17 May) asked for the length checks to move into the
> sub-functions with len passed in, plus WACOM_PKGLEN_* names. Eight
> handlers already take len and eight do not, and six of those eight are
> also on the list above, so that work overlaps this series closely. I have
> kept it out here because I have only reproduced and verified the
> input-device faults; I would rather send the length revision once it has
> the same evidence behind it, on top of this series.

This is understandable. I will note, however, that while evidence of
misbehavior is appreciated, it is not required. Consistently
performing various precondition checks across similar functions, even
if they are not *strictly* necessary at this time, can still encourage
good habits for future code.

>
> Jinmo Yang (5):
>   HID: wacom: check the input device in the shared report helpers
>   HID: wacom: check the input devices in the legacy irq handlers
>   HID: wacom: check the input device in wacom_intuos_pad()
>   HID: wacom: check the input device in wacom_intuos_bt_irq()
>   HID: wacom: check the input devices in the Bamboo handlers
>
I do somewhat question the decision to split this series into five
pieces. I feel that most could be combined, especially after I have
checked that the few per-branch checks in this series can be
simplified to per-function checks. Combining the patches is not a hard
request, however.

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....


>  drivers/hid/wacom_wac.c | 97 +++++++++++++++++++++++++++++------------
>  1 file changed, 70 insertions(+), 27 deletions(-)
>
>
> base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
> --
> 2.53.0
>
>
