Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794263005;
	b=2tXWV7Tyz6Bl6od4mZl3AZjUdQXEAIy0w56CPwEm852Eg0a3pSzMobk3spFlKid/q9nG
	 pTYiDVVgJRBVGtsjPBGoQPlg00M1gz1ovEODzXVgG3qX1lRbIp2+S0LuKohwFjFrKnxMr
	 xLbTpq2hwAqsnLsxwt6s3pltPvAPTKP0OLgNtuWOcCpkFzs6+9xg1N4G+t0rywZfWaf7B
	 cvucWIeZHslhIl2NiYwmnk0mwIl3vB5kfz/IwLWsg8MQvc4iI7K1F6DS5Wz/VKtWESh4P
	 fxOoCjks++ROnqxYAvupPyP0wDfqsWsqEiJBeoGJKR7fQvtWo+fykP0Vz63xSK+0CuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=hvt+G1mIzT35OGkCWsRN+8maDO38GDDJRQI/VuEpfmU=;
	b=ngP5YbepbzoK0nHpKbK3ON0vPBsf+JFk79qg2mNq+nVzx3eJtpnfg68EoWfqaaKtJw/7
	 yc1Ee+tuGl3SSW2CuBFkQSJM2tFp4YyiWo1YZY998nFLFGGgSu0rgGnepuwJdzVIsM/JP
	 1EuAsLjdnguDr5q3naOwHUl3I0mrL+kgwC3Vz48kjSP94/AYm5Rrazs0Q6dxhXAk/pwLv
	 CuvFe85uRfaygkgrQqUbuTfaZq0AdYBptWZcte6bBIztBSTtZsw4BiZDK+SCTrCVlzQx9
	 8U6Wpfcwgj53uYTMpyuoTeg0/+a4zj1qoS1P++vaDfbs67niwQXQjcyyh7oao2pY4ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kI1EnoNo;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE19B606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE19B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kI1EnoNo
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b33a08df33so12680107b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1794263003; x=1794867803; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hvt+G1mIzT35OGkCWsRN+8maDO38GDDJRQI/VuEpfmU=;
        b=kI1EnoNoLZkJv1riHQNNPu/sBIhscyQqHWRKH7RUJ5Qt4Q6CwTRGfAElyO6WodBzgK
         Vx5q7OvRzeGjA9LmQQuzC7voCOIXvEHazMUvmcOA8j8b1n0O3IwpJRzEivHgpAhdLyvw
         BO/a5rqQDrPnzKXeCfhdAu79QTGbU3C7bB8Yvs+tVRofz1e49D/AKoxeQ9OF207xrFLP
         +1WPVb53fELgvSRIl2b54wZtS4WgIcUDLb3ZyEFgzSeI8n0VnVx7fWVHCvuqAWOFS4kd
         R3USqBx8sbaxwp1ks1qB7InJ/g924dPnFyFJGmd+SNPX4STePR7GeCvrDwGBAup3GeNW
         iLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794263003; x=1794867803;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hvt+G1mIzT35OGkCWsRN+8maDO38GDDJRQI/VuEpfmU=;
        b=KnlscE86LRN1v30NVp9/UoFLrOVTahFuf7QLNU10tuIEIP3j+qxRm2c3woYppbg28G
         SF91NLdvAtmMy+zof6QIg4xq/tcS7Z/avvEQojaD7AwYwz9Hbq7WLcVlykB+YBwftHN9
         smfghI6IBIN4nJANRDMeINPu1pxkHJIQZ9+5tOMadXjJkVZizyZ7fiMkCsJQU+2S//Ru
         1E+YzVKnnGbxWiO8s2vP4f2bd0M0YIM5qakQypqJD+u/4swsa0lopZhWlWojijDdxevY
         UpqE/BXM0LdeyXUXzTldlIpHvTQ5OKKQbWXJO08mMMZG88hcVI8c/mHRnjFxMvoJUZub
         fGTg==
X-Forwarded-Encrypted: i=1; AL+hErHpqNPawpy7dcDmXJsi5r3o5axGPz9OWKl7Z4X+nkntoXnCJnN5er63QaCiZotG81fmpx4UF9Jt61NLJck=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EdxjkMDC2OTBrstdrtktfhRErz7JxOA0kHaPpyjxgkiambVFk
	2PNykksXCCB/MmEKKm1TwN0FNAO48VddckYBXp63RiRpGYetDJIt0ZQ59GfNibQShcE=
X-Gm-Gg: AYBFou3jvpKSTETazKr5P3KN7T8+e7gPBUybUK6jrKFF7gz1LboOgkPEA4cGqKKP70h
	y+45uBdAAXT7JM0cEHTlnUIzc8S7wODQ08Toc01W9Nl8wKDmgBCA+3xgwGRoQsfXU4ocD+ya7+2
	IyOtnsQF7csuo0e7RWKMxKT1RMB/9sZhgF321ZNgfKSbLcV3Yn+/6MXoG5scvHzR8dwjwlMW3Ne
	EGv8NJfaATop4Zpy9PSg/2bL14JAq8p/bX76xym91PwR7yx4Z5/WPYFQssMhsqfjLN/UrO68iKK
	/frscrwcFd0CMWuW0q/NNAemwKjunD2rh8uzzNAcJ18g2Uei5FozzB7GOTiTfzb2GncRtSXipqn
	slDetFNV8kRY92gdi11fDyQOHgV3hCrgZiXlrifWYHO6EUncF4wpYzQkFN8Lofv7ei1upp/F1H4
	pHzkBhja++icSljcdIEo5ziMjW9I2DD393PqZE5xEnf+tcec89/lqInhLGKIy3NQKEEfg0d2ai6
	m7f/IpkSPdBFGut5JbfJ8aL4JklhFyTxm+ugyByPEn37ptgrIWS7NwNrb743QPgjP4wieDjMguh
	9mC1AXfHohfMqX5zkVYfx5f2Jw8A26fZ6ET0sOutpJNJo/LZkUv9iK2bQdFg63rUrIK4Ef+jM1v
	zGsmi21Cw4NY5puWgymAHZX2tKp0EIhXh9/PpjRqfoODHGvElw0/yANc1T+7F4DmbkM4q0G7iFt
	/NyyrtvUmuciSQEkh7yl8=
X-Received: by 2002:a05:690c:9304:b0:8b3:2eb4:1439 with SMTP id 00721157ae682-8b392a10e6fmr4468687b3.19.1794263003496;
        Mon, 09 Nov 2026 14:23:23 -0800 (PST)
Received: from ?IPv6:2600:1700:6476:1430:19e2:7427:4b2d:8d6a? ([2600:1700:6476:1430:19e2:7427:4b2d:8d6a])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393477a57sm4829777b3.44.2026.11.09.14.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 14:23:23 -0800 (PST)
Message-ID: <564d24919b96070f53297b03e8551c8e98bd4c91.camel@dubeyko.com>
Subject: Re: [PATCH] hfsplus: enforce legacy sequence fixup table invariant
From: "slava@dubeyko.com" <slava@dubeyko.com>
To: Noah Weinberger <NoahWeinberger2003@proton.me>, 
 "glaubitz@physik.fu-berlin.de"
	 <glaubitz@physik.fu-berlin.de>, "frank.li@vivo.com" <frank.li@vivo.com>
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Mon, 09 Nov 2026 14:23:21 -0800
In-Reply-To: <XizPhPDPPpkNfPh9_zn3vMVegijzle2lWWBSUgdPB3tpi8xMB2qBIDun8c_X7eyFVMgq0zBlmGikFuBstwkN-O0l2bfQcmA5gtxudDOHUQg=@proton.me>
References: 
	<XizPhPDPPpkNfPh9_zn3vMVegijzle2lWWBSUgdPB3tpi8xMB2qBIDun8c_X7eyFVMgq0zBlmGikFuBstwkN-O0l2bfQcmA5gtxudDOHUQg=@proton.me>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
 NFdvziOa4FgUBC4X71upsZIoZJeii2V/Jtc3B4g==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, 2026-11-08 at 22:32 +0000, Noah Weinberger wrote:
> Hello,
>=20
> hfsplus_fixup_legacy_sequences() can grow *len and memmove the tail
> upward with no check that the replacement fits the caller's buffer -
> safety rests entirely on every table entry satisfying repl_len <=3D
> match_len. The table is regenerated from Unicode data, and the
> sibling
> decomposer asserts its invariants at build time, so this one deserves
> a
> guard too. With the current table the invariant holds (no entry grows
> a
> sequence), so this is purely regression protection:
>=20
> =C2=A0=C2=A0=C2=A0 if (WARN_ON_ONCE(f->repl_len > f->match_len))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contin=
ue;
>=20
> Affected version/commit: mainline
> fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07),
> fs/hfsplus/tables.c:3701-3742, callers fs/hfsplus/unicode.c:551,670.
> New table/code added in this window.
>=20
> This was found during an assisted (AI-supported) static source review
> of
> mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-
> 07); every code path cited below was re-verified by the
> reporter against that tree. The patch below has NOT been compiled and
> has
> NOT been runtime tested, and no reproducer was produced - the
> triggering
> conditions are described above instead. Please treat this as a report
> for
> verification rather than a battle-tested fix.
>=20
> Reported-by: Noah Weinberger <noahweinberger2003@proton.me>

I cannot consider any patch without Signed-off-by tag.

> ---
> diff --git a/fs/hfsplus/tables.c b/fs/hfsplus/tables.c
> index 2101201..0b2aabd 100644
> --- a/fs/hfsplus/tables.c
> +++ b/fs/hfsplus/tables.c
> @@ -3709,6 +3709,13 @@ void hfsplus_fixup_legacy_sequences(u16 *buf,
> int *len)
> =C2=A0		for (j =3D 0; j <
> ARRAY_SIZE(hfsplus_legacy_seq_fixups); j++) {
> =C2=A0			struct hfsplus_legacy_seq_fixup *f =3D
> =C2=A0						&hfsplus_legacy_seq_
> fixups[j];
> +
> +						/* A replacement
> must never be longer than the sequence it
> +						 * replaces: the
> caller's buffer is sized to the original
> +						 * length and *len
> may not grow.
> +						 */
> +						if (WARN_ON_ONCE(f-
> >repl_len > f->match_len))
> +							continue;

It's really strange location and alignment for this check. Could you
please place the code in better place and align it properly?

Frankly speaking, it's the wrong place for the check. The check runs
for every table entry at every position of every name conversion:
lookup, hash, compare and create. Skipping a bad entry also changes the
result silently, so the on-disk name would no longer match what
fsck_hfs or macOS expect. The table is static data, so this should be
checked once, at test time, not on every call.

I think that the KUnit test is the real fix.

Thanks,
Slava.

> =C2=A0			u16 *src, *dst;
> =C2=A0			size_t copy_len;
> =C2=A0			int k;
