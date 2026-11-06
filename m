Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793990788;
	b=I5CDHs1LpIvzIS+vP1trCf1rzUn/llWmEaxg9s1O9skfpk9R2/WX2Fl9H4+fwtLLK4+r
	 /CPDhEtj4ufhPp11WmGikQiywbzXGvPkpH9hJ/yXTr+D6v+pXWahoIFvnDAHETdVK7/B3
	 nx7++Jl1BDOjXbHl+adsMcSMueFPWYkaRmNMa9B75M1A1Nd6E+RoGZ18a164m0laGhiVp
	 t1sF1yQLgtYXpFNt06QpJuGl6L4sh0TH97v9mvpp5MU6rVGQ0PhYvFLsKsFs+cqFlMtA1
	 2Srl3GTKPR5K83RKjRoCqceukvoZswUZlARP2m6k+U7qVZAFmIJbBdsDkEwzSibIXkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oEn7bwxlp6JtTrktDXtiT+wX7H9tzS76+9SrUUaKcg0=;
	b=WIsccWNQZaFwyao9xkPXI7zYiVSc8LjxFzH7PJ1P1SrA4vETWjrILbQxv9WpdMzfEojJ
	 uttpcERfTWE6ZjppZ8O42wlm5k4uFUJ75raz+3sbKmUCu0iHyB4a5Omurw6gLgj5FxxMJ
	 otrRCc3AQHreTwUC9i3ahGTWIYVhonr2Dt6gM8ouxBev/NZVb1AqIDIPc/SHC06tx7zqJ
	 9IlzrERA9azpoTN6ITOTXMk2l1N5w1UAXOmniKzHE1nNiim1JngVk3CCQcC3n6uKbF8k2
	 RKVbT4uGQ0IiF8gvonj/C7RujA2CMH/l673ZjbB1+qACOKMIo6CCokVJgS5nVlpsd8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9HC86ZS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6A6606D811
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C6A6606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9HC86ZS
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-930c0f9c1b1so117124685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:46:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793990786; cv=none;
        d=google.com; s=arc-20260327;
        b=nkM1djf4MA8RcdmJ9TdvpNy35yUaPRUXYCX2lt+wpoHQe0myuo1IPlvGtR2HUeSccC
         aX8d9Skbnco+9qrgIDcFTo/ecJ+PcZOf1/Gu6n0ghLnZBfw9afJRXYSnGiW8YSplHo+f
         NCX1eqUUEiArYVTeGMfrs7TB0dagtDWPQG8vdhFOLzhJqxd4l1ewEPZSeBFI/sF/36+J
         +UTPaPDD64JN7KjUuWhGl9aWrIhv0c4SgwmHj7o/2eui+jdvmlNmbItbmEWDY9A7P2Ul
         2Qqocbf4ov7a1iRdWNIuia4YDxNd62jP4WSjgg1MVyer8xumBu/PqUNXGCMH8WY4y6YO
         L1Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oEn7bwxlp6JtTrktDXtiT+wX7H9tzS76+9SrUUaKcg0=;
        fh=6rgZC6a9Ml4L1s/JbjRpXJL8pPNdn+3ZnDPLAWj5bQ8=;
        b=ExjcSiJjM4+F0z1nfVstJONXa6YoIiWryEP+lj8EDEJJZWYCeeTj9PJEtEgaG7euIF
         rIA4SnCtOMPAG7dW7FHL4xY7ZwZPCehz3Ph+B+rezbYRWpMjSsAKx26aLGYl/DRFlCOz
         p56nwsy5mLZnjCGwJt3BCj1f1juM/dbhkD2MA9IvakOALkUGy4Ux8g/9YbH5QMzxW2/1
         CBa6q/M4YiamUcAtzKG2eSXu9czdw8d49l5YetSM972NJPkYvgL4+Z7a2iD4BdttYTC1
         JCWwMoTA+CXjYk9/KBB6n+4A/qKp5iMTjOTrauMor5hZeLES5w2lNezc20QDxRSk2Tvy
         6jRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990786; x=1794595586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oEn7bwxlp6JtTrktDXtiT+wX7H9tzS76+9SrUUaKcg0=;
        b=Z9HC86ZSkUDNPhx/CjWi/SScFfOIPSHSo7vMWUh+XGsATmPW8BWEkCM6bOCgqO0Are
         20V/CwD73gFN96nZWlmqysgtlzg+CXzInQPANKnmNePAw2GtNLcDs57tXNMHpd95fp4K
         m5pRi6yR71ZCllopH7Ng9CmRbPV0moMMBHJ3IgZrdANixqOan7PwN+ZUAYblo01OJz/D
         mrnxC/fS0LoYFk0xfk8L5+mFtw8CSkAJi36Nr/tAeEtHUIaHNZA/EKAYiXYe2yn97+vP
         vY53r76H67QgodzNEezlF9MB/G0k/L8R1rgP+HWHFLFuJsYq4T4nDQNrbBQXwxpN0NTc
         +qdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990786; x=1794595586;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oEn7bwxlp6JtTrktDXtiT+wX7H9tzS76+9SrUUaKcg0=;
        b=lOQpFF360iSPqS6Okyk9DqmDhDA3Z9V2ltFMpx+PvLgi9E1pRxuoAmL+EdoBRQCuhS
         mz6McZF3mTV+jdA5O6murQP5f0hZ63bpc2byTL7G3Y0pnqGF1eQ5ymBAt6OYCAIslJ9v
         RLocpbtepVhWctXM/HYp9mwzLA9boyfECrkUQse9iMf2+V+UQJbbfOnIyDBp/dE/rBAq
         oxOXdPv4GDCfhSjCq3sSWx5b1ygmKzHQaNrqJNzbmuX66cubVRf7g7VjVs3HgPfxGj+d
         I/GVUhSSDoURY25af0kbKXXShWt7skcXa6kz4wKfULfq7S82jy+ecbi3jA3DemXUS+Kj
         1zBA==
X-Forwarded-Encrypted: i=1; AKwUvBywTJjzUVraBKhloU98w1CtYeLwpcovYYNVeVuHAejDRnTdni0prCiSHtOzbwj5RD/SGBF5DBXAmtykOTE=@vger.kernel.org
X-Gm-Message-State: APuU4Z831VAL4mvBZX8Of3x51y6S9wyM1cE1jJeAclOg6jl3LyOWlpca
	p/oTBwqFcBXXA5KI6E7+ct4+WQASS0L/YQ3s7vp+1zxxMdLupEiJ+5gdKklPsPNHH9CjpbbO5nV
	tCpxm1OCZ4VqdKiNR7qX9kVWHVOEWAGU=
X-Gm-Gg: AYBFou224XpN/VtKz3RxUkzL7Q2MCG044eUFbb1HkL8RU5JEWPv/bau3dRPSpqn34LR
	cHsooxddLxX5GxiKaiUVwcD52Q0IxjsZJ4P7P1grK+dmAPRbEfcsD5djKwPwzjW00csgtTjmi7R
	fSkmeI2xYUMvPTkYZhS+UPVOXMVnDjppNh9OnfwveM9MbL1MyIKi/DNMmqb/DRCuV51yp9GKSzN
	OvlOSBK3EoR6/Y/RCq1fAaTAQmy45fDdSMSefjaUmcxqZghK4Xj3dBFBN+tRT8d16x3jtaXGYK2
	3ysWVhjeWMYjKWZCMdjLb+xzku48YTup1qbIXJqoiujNshKiKUm5P3MVYWn+UnOcc/srIVxOaVl
	U8n9+m+teii7UaAkiaOm2GT+VTF91uTGaUz0z
X-Received: by 2002:a05:620a:2b93:b0:942:a42a:78a2 with SMTP id
 af79cd13be357-945f34ead3bmr431647685a.31.1793990786229; Fri, 06 Nov 2026
 10:46:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CANRwn3RYhEu0g9Lx+Vg=Uy8V7BWWz-jWV9d7UVuyRK-MGdbHOA@mail.gmail.com>
 <20261106120405.169399-1-qwe.aldo@gmail.com>
In-Reply-To: <20261106120405.169399-1-qwe.aldo@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Fri, 6 Nov 2026 10:46:14 -0800
X-Gm-Features: AclHuK_mPu4CGKBJY9JOjjdbWKDK_1Mvm3MPelFofXSeQQja0gast3M1vggbj_s
Message-ID: <CANRwn3TtcDdy4wgHCRfzecAoB6m3Jat0kNOd-AYPskg1OA9+Bg@mail.gmail.com>
Subject: Re: [PATCH v4] HID: wacom: avoid divide exception in dropped-packet calculation
To: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 4:04=E2=80=AFAM Aldo Ariel Panzardo <qwe.aldo@gmail.=
com> wrote:
>
> The dropped-packet calculation uses a modulo against sequence_size
> (logical_maximum - logical_minimum + 1).  When a HID descriptor
> declares a sequence field whose logical range spans all 32-bit
> values, sequence_size wraps to zero and the modulo triggers a
> divide exception.
>
> Replace the division-based calculation with a branch that computes
> the forward distance through the sequence range directly, as
> suggested by Jason Gerecke.  This keeps the existing int types and
> avoids the divide-by-zero without any 64-bit arithmetic.
>
> Fixes: 359673ea3a20 ("HID: wacom: Support sequence numbers smaller than 1=
6-bit")
> Cc: stable@vger.kernel.org
> Suggested-by: Jason Gerecke <jason.gerecke@wacom.com>
> Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>

Much happier with this version! Thanks!!

Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....

> ---
>
> Changes in v4:
> - Replace s64 arithmetic with a branch-based helper that computes
>   the forward wrapped distance directly, as suggested by Jason Gerecke.
>   Keeps sequence_number as int; no type changes needed.
>
> Changes in v3:
> - Replace raw s64 modulo with div64_s64()-based remainder to avoid
>   __moddi3 link failure on 32-bit architectures (i386, arm32).
>
> Changes in v2:
> - Normalize logical_maximum/value as unsigned when logical_minimum >=3D 0=
,
>   matching HID parser signedness. Store sequence state as s64.
>
>  drivers/hid/wacom_wac.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index 361738b..1d3ae94 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -2426,6 +2426,13 @@ static void wacom_wac_pen_usage_mapping(struct hid=
_device *hdev,
>         }
>  }
>
> +static int wacom_hid_wrapped_dist(int after, int before, int min, int ma=
x)
> +{
> +       if (after >=3D before)
> +               return after - before;
> +       return (max - before) + (after - min) + 1;
> +}
> +
>  static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_fiel=
d *field,
>                 struct hid_usage *usage, __s32 value)
>  {
> @@ -2551,8 +2558,11 @@ static void wacom_wac_pen_event(struct hid_device =
*hdev, struct hid_field *field
>         case WACOM_HID_WD_SEQUENCENUMBER:
>                 if (wacom_wac->hid_data.sequence_number !=3D value &&
>                     wacom_wac->hid_data.sequence_number >=3D 0) {
> -                       int sequence_size =3D field->logical_maximum - fi=
eld->logical_minimum + 1;
> -                       int drop_count =3D (value - wacom_wac->hid_data.s=
equence_number) % sequence_size;
> +                       int drop_count =3D wacom_hid_wrapped_dist(
> +                               value,
> +                               wacom_wac->hid_data.sequence_number,
> +                               field->logical_minimum,
> +                               field->logical_maximum);
>                         hid_warn(hdev, "Dropped %d packets", drop_count);
>                 }
>                 wacom_wac->hid_data.sequence_number =3D value + 1;
> --
> 2.53.0
>
