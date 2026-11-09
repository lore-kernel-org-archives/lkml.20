Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794213168;
	b=0zon54G7S4JXFjr7YDa/UBLUTEIl+uG3uBWOJWj1H/86Ih2ET27Bq1/9LbgQXxybLJOy
	 MS9bs+mB6I6aQPc4wH6yaqw6JDmboqM4gnksm7fNh9Lcezxr8Zv0nIja2aH485Nb/v0N7
	 wTl9+wXVI5tdUGEYOoOD25gmrE8Dnqhj4IpEvdQmujOmb5PjGvRrFRjEpiRc8AkLSVcH2
	 R2VKjj2MkDXSVlNAsLB6uGMB7msOq2GO1IU3rMvu8ETOQPCaB16Zv1zv0mFf4VEVy+L4e
	 gumAwgOCjcmrr9zlzF58FhJMuT68DrnDg77zLuEi5uufqBiHYZmLoCDzuJDZ8IQ/AxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NukoXGfC0P2W7Y16ouCnPb9aSM3x9L6h6ebRRl7lnBA=;
	b=uYrGiKPe/UwM0jgq7Wr1N8itzWdcMH6uRhpQf2vQL5piKwpbsWuUNxnDDIk1Gt5z48sQ
	 zAUhKmOWfTgEDNPo76DkeqNMhNKLFkNXZ3C4ao/1pxluXIlv5QKm5F40XGVhgFflUSO3Y
	 ioe5Y0mfYEEBSodJS1IQf+1TJyQODGJZ09OrXWhqrutqUTmRUP9eaFXXXpeUzqCQlBSyE
	 F0g+l5UKQLhgidWk38I2nnyolKD9AL4A81sb9s7LWhMfdv6sljGFwo93uIg0uz2voeTbS
	 1HbhMHp2m8iOMJUJMK4ijXt4JZw0smvFvVHTc7TVzy+6J1/vIjywyc6KzGwNUjW7S2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZTKoyUqQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FC76082BC6
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58FC76082BC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZTKoyUqQ
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c247f6687dcso97400066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:32:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794213167; cv=none;
        d=google.com; s=arc-20260327;
        b=pNlkoIiJhrw7yXqUWcX8wdFlsIKqHCYI8ZgGiWGgOjE9XtQLOSw/c/M6qa8kSN2XnE
         QTH3WT5hXoLzZZ/4nv309i1NFuQzbxYhnfSfqao12AztVTG2SXsmOBHETi9q6n23g8J0
         l8nYmq/vIDQb/uMHnEa8i7jENdFw5NFjfRleJAVai/QA3eiGPsTSyczIAFZDNfbnr/mt
         0bY9YPsfS9EIvMiimsawvbes/eYILbX1hkLXEGMH03XV+UDd6pZDJLmETIVbK0cf5zqE
         F7Ig29zpmt2GY8BF8IklI8OVBa99sai8wju840+PjOCfJ75uq4/iU+lCzHsIhKPzPlWL
         h1Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NukoXGfC0P2W7Y16ouCnPb9aSM3x9L6h6ebRRl7lnBA=;
        fh=cHgP4JNC8Z8Uq22sp9xa154FW+DkgSeaky1ZcuBKddk=;
        b=iKBBNYXPf0f9P+BIK3zD5rMRTsA25s2NqsSz9I/SVpNrWjnFfhYMojOZ96Bt33pTTb
         2pKxUFGL7siv7hA2C2tuSW5MVvjGxNlqt0iaO5As2SU/ryFme6a/wF25KaaGEiBTne5B
         o9h0YN4TVqtU2pt7WHCD8ff2+fiaS3bGgUcQBxbgKJI7zWd3jV9J2Jdu205hFjEHmtSD
         pk1rW73rueEWNcLzaKgmvGpb47vY7eCMOn7Ye7osJeUX1JCuw3PZAZXHMGX+TxeL61Ey
         Ed6To7GaMbFhO4Ar1wN0UpV7wnC1b2FIS5emH8FvTjRNPVhxgmo3xsbQdYTTBz/yQgew
         MxAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794213167; x=1794817967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NukoXGfC0P2W7Y16ouCnPb9aSM3x9L6h6ebRRl7lnBA=;
        b=ZTKoyUqQOLTEMmtAocDtGhbxlOrUTuK15i8z4LV5C20JoFBW7WfAVZMO8M0vhD2W9a
         pE2Qaa/lHQFC6GJoP8bc6MuCbE5eZUNqlYv9FZ+nZZquNdYvGi7qZ7d2hW23OHrrLV9R
         H+AXQCqrKA+TimNW/wnUINexVB7uhkRMtgJV8s38Fp0Exr6dkp3lQ12pToTYjaffeW2l
         Nx6l+GxRs2gmIXpDJyIm0gbKR6ieHNzspDq894W3n8TgNuY99sv2Jc8DaoQ/RXW2Q9+w
         r4hcDYvbXsHvmIWG1r/AKCxra9qoEn5RUKQba2MxQJgNELDIdbuqveNBCjpxWXPihiH0
         dQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213167; x=1794817967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NukoXGfC0P2W7Y16ouCnPb9aSM3x9L6h6ebRRl7lnBA=;
        b=HNm8amDSSeDedz/bU6a2Mhd2ODoSFSRza5AoALmVh7TEjv/5mPyTtZ9anrBX5tED93
         b9qsu/rDybkGaVex/OfzXYoUsj7OY9OqhLIv7IYyOm0AoWsmJob4yjXg4YQoEaqXOCYq
         tlQ8hoMKkH798XLb8CiwPkkeDrrxzrPI+D14Bhh8CAV83/7OFP0VuNqsL1WUf9dtSmt1
         rAjMK3VPOeXd0kMtiuJo7oQxkUIT64mQ8TUmyCGC918XNW/QZDWhgv/4UdibdPvzstHr
         zM/lStv8G4LPzXxkpPkpYvCGdECU3+wxKDukW/KgcQkxP8xJ4jomaMY1FPHvc61psyBy
         xxlA==
X-Forwarded-Encrypted: i=1; AL+hErGPt5s+UY1RtUXcXdAphy3TGW/08d0X2DPUzy0dd0rjo1z9svdQLNWGruZAHs2JyLH5y13LTOzoGrQQQ38=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EY3/SlrFckCUVqfA+E5y3qFMrElzbDl/iFn3BZi8YUGd8yTAy
	GMKeSU8aC5q2qeS9LjX2SCGz6jDD63nZH666iohxPbZvuS5Xs/XmZugRLTgZqneezSnnQMyFWqf
	ioQLgOMUBNTa9XaUfuuazmAX7nDHG5CAD2TOVMbcE1g==
X-Gm-Gg: AYBFou1pVLWvOEF8Pscp8H/UFYGO2YYNTJ83odf+ytRe4flXqz9RPIt61KVlf9oZA8M
	3vF3dshwf2G4llQibJHAdpS2PTBrH6uf4h3nn1R+Mifef0hMkjlasgyvwthxhW/Sdas4IlfIDuK
	U+XMj83FG7XGQibdx0S9z5penrBtbB5/iX0ASQ7PS3Biv/c7P05OkZqxMrpIxWhDy6V8wI0zEZs
	LhW0ibF5x0Wpn38sNFWZ3CN0dwCkFUX4KY1v0SUPpMJ1LQexFLUCWPVrMMEE842iQtTXlmufmia
	8FZOwG9oa1RvrznKWsbdLZQxwS9l+a+AeMnVBs1hDgOdHZ/Al/O2fpc2KwU3nPbbsrR45e8rfOg
	PFuresHwQST1o3YbPJNdhH3jkYuSZgErw/HNTYwEratKjIu5zctLT2RZ/X5VrmoYEDoENKPc=
X-Received: by 2002:a17:906:4795:b0:c46:ba0d:3728 with SMTP id
 a640c23a62f3a-c4d6d4f2dcfmr235657366b.18.1794213166488; Mon, 09 Nov 2026
 00:32:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108142708.489067-1-skalpesh942@gmail.com>
 <20261108142708.489067-4-skalpesh942@gmail.com> <84AB3D74-F70D-452F-B621-B5487951B719@linux.dev>
 <CADYuhkqCNQxevZih3D+Zu-HcuyOao99iF31+Y6kDP0iM_Rr1kQ@mail.gmail.com>
In-Reply-To: <CADYuhkqCNQxevZih3D+Zu-HcuyOao99iF31+Y6kDP0iM_Rr1kQ@mail.gmail.com>
From: KALPESH SOLANKI <skalpesh942@gmail.com>
Date: Mon, 9 Nov 2026 14:02:09 +0530
X-Gm-Features: AclHuK9xFhiVuFOiQ15yfj3eynse4178ZQrsYyay_WeuFEgyDwln80k8c-8gbTo
Message-ID: <CADYuhkpGHNq_B-2qKqjD7R4fAnaVBM2emwySyq4E4u==wLBOFg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] wifi: rtw88: ps: trigger firmware recovery only
 after consecutive LPS leave failures on PCI
To: Luka Gejak <luka.gejak@linux.dev>
Cc: pkshih@realtek.com, kvalo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luka, Ping-Ke,

Thank you for the reviews and feedback. I have had a bereavement in
the family yesterday and will be away for a few days.

I have noted the comments and will follow up with v5 once I am back
and after lore/patchwork is operational.

Best regards,
Kalpesh


On Mon, 9 Nov 2026 at 13:53, KALPESH SOLANKI <skalpesh942@gmail.com> wrote:
>
> Hi Luka, Ping-Ke,
>
> Thank you for the reviews and feedback. I have had a bereavement in the f=
amily yesterday and will be away for a few days.
>
> I have noted the comments and will follow up with v5 once I am back and a=
fter lore/patchwork is operational.
>
> Best regards,
> Kalpesh
>
> On Mon, 9 Nov 2026 at 12:43, Luka Gejak <luka.gejak@linux.dev> wrote:
>>
>> Hi Kalpesh,
>>
>> Thanks for the new version. Two comments below.
>>
>> On November 8, 2026 3:27:07 PM GMT+01:00, Kalpesh Solanki
>> <skalpesh942@gmail.com> wrote:
>>                                                                         =
    > diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/=
wireless/realtek/rtw88/main.c
>> > index a74f199a93ab..7009f8ae3e57 100644                               =
    > --- a/drivers/net/wireless/realtek/rtw88/main.c                      =
     > +++ b/drivers/net/wireless/realtek/rtw88/main.c                     =
      > @@ -638,6 +638,9 @@ static void rtw_reset_vif_iter(void *data, u8 *=
mac, struct ieee80211_vif *vif)
>> >
>> >  void rtw_fw_recovery(struct rtw_dev *rtwdev)
>> >  {
>> > +     if (rtw_hci_type(rtwdev) !=3D RTW_HCI_TYPE_PCIE)
>> > +             return;
>> > +
>>
>> The same check is also in rtw_fw_leave_lps_check() below, and the other
>> callers of rtw_fw_recovery() are PCI only, so I think this one can go.
>>
>> [ ... ]
>>
>> > diff --git a/drivers/net/wireless/realtek/rtw88/ps.c b/drivers/net/wir=
eless/realtek/rtw88/ps.c
>> > index add5a20b8432..fa3a4e476cf6 100644
>> > --- a/drivers/net/wireless/realtek/rtw88/ps.c
>> > +++ b/drivers/net/wireless/realtek/rtw88/ps.c
>> > @@ -166,6 +166,13 @@ static void rtw_fw_leave_lps_check(struct rtw_dev=
 *rtwdev)
>> >               rtw_write32_clr(rtwdev, REG_TCR, BIT_PWRMGT_HWDATA_EN);
>> >               rtw_warn(rtwdev, "firmware failed to leave lps state\n")=
;
>> >               rtw_fw_dump_dbg_info(rtwdev);
>> > +
>> > +             rtwdev->ps_hang_cnt++;
>> > +             if (rtw_hci_type(rtwdev) =3D=3D RTW_HCI_TYPE_PCIE &&
>> > +                 rtwdev->ps_hang_cnt >=3D RTW_PS_HANG_MAX_CNT)
>> > +                     rtw_fw_recovery(rtwdev);
>> > +     } else {
>> > +             rtwdev->ps_hang_cnt =3D 0;
>> >       }
>>
>> As far as I can see this can't reach the limit on stuck firmware without
>> FW_FEATURE_LPS_C2H, which seems to include rtw8822b and rtw8723d. The
>> register check passes once the bit is clear, the failure path above
>> clears it, and I can only see the firmware setting it again when it
>> enters LPS.
>>
>> So if I read it right, stuck firmware gives one failure, then the next
>> check passes and resets the counter, as long as the registers still read
>> fine. Three in a row would need firmware that is still running.
>>
>> Would it make sense to only count failures when FW_FEATURE_LPS_C2H is se=
t?
>> Ping-Ke, do you know if only the firmware sets this bit?
>>
>>
>> Best regards,
>> Luka Gejak
