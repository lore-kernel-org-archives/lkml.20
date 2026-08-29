Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC0441D4E9
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 21:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788037416; cv=pass; b=a1B4NME7NfbNFn/2fFRn1IJdRu4GJ6jlThRIz6n8aWsSekX0R+iY3rJ7D8OY6e4w88h4rEp9mNJBGrX8IIzQPsJcBE3YjbLZ3T9kF4uOMTM1+fB77v6sBCA5S+2rwrPXWnKkEf0LZ/4SceCr/UllfpLtOfrr/+g63jrpaFYYwCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788037416; c=relaxed/simple;
	bh=5zgo2ffRKT32U6AtH9tjQtK2hUKaB+w4fU97hWgGIAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9Dat5kYtZ4fa1Yvef0WAwGif8JAAbu8MJHYHOI3BShLph/uTdN4yMLnqiPNXNTzThNn8eu185yX3qWpL30YNtYzc/cTTYlKuuKlL43FHNqDAhoeGyJMSDHQP28/yoi4APPSlG3Rra1nnUNxfyWTqwJI8pBflqrWbWVv0m4HkHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKKnmrhO; arc=pass smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKKnmrhO"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-77e35e008e8so1545849137.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 14:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788037413; cv=none;
        d=google.com; s=arc-20260327;
        b=TEZjvrAg8vdsgcXrHi1cRMaOWaFI0UpXO+Miqz5ZxV1ydpGc2kLPczlRTkZYUS0CKy
         AuNNTH3tcyUyFl/uTpsk9/1q1RuTbUk6zTrL/qVUaYI60MnfyxtC9p+Ay3JPpP4syqhF
         cYe4+3Dla9d7mRUJyDlJ5+TPb5YOSUN5g1TeD7ETqyMPoTl/4AvQCx+YfydOzEdNTo/J
         C079olXzveJ9Xt4e8enFbiwGa8nTm47UtDzlHwSYDbgzrNLqyj+z1MhCNQHmIVdX7cx6
         U4SLRAbzpxzA23QGV87zhJ32Jf0bd0/fENDFSr+O6fTEazizZYXQ42AiobLFGD4Y54/S
         blIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/XMurdfstMy1OBIHxuK/4vMtORv6ChBcNBL6pfYPlMA=;
        fh=vlIYYmPgNNonS2RUv6HWxeqP5hzmdl9Y4GwqAGBR2YM=;
        b=lX3rUvlvdC2MgQ4a9SBMaL3uDvzfSsFJbOZnZdUVjdzo+5UFncjUnfc54Thv52VAB5
         QA4LUBmAIqz4d2fH0qZXXsDANFjJoi6mXbz/SYpudnaMjDy1cQfCKwZlo8NFIlsA176z
         llKLvB3mIn4oXwkyvTN+qX90JhE8ObboZh0V4nps+paTohTo88ApDx/MPjA8TCEnpp3X
         x41FQq0TGaypaI7vuhBIf9IonKAqhoROlAwNBf3RAkpLi8nvoFf9FTgz6666EaduBCjo
         wCMIkww3D2vFRTsrD5Oqzbu0t/ogCb6zjTAThI/WWQ/H3zQKnY1bjgg3jy3g9ZBusAqp
         ukeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788037413; x=1788642213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/XMurdfstMy1OBIHxuK/4vMtORv6ChBcNBL6pfYPlMA=;
        b=RKKnmrhOsVZ5e6FUWfNj/J1hCm3ovoqrIM2ozRQM7ueWnHKhSFfGgceMtSw2SjPh4k
         72Fsy2c9QEZXbFEBKFKeGKYe2AYZO2tYhy+s6fFbClW6LyVXt57/EQwLCD3epn7vvE0W
         2H0vjeht+vKzRJYJBGPpuPCRnz6wff0zf2Hv/z97pQF9m7EYeeYoUAB+xEC1hJWOL7K1
         LNoAJFYueSYyu1VEwXHCrQT0/RdEwUxu1wtgQohBcsJt//4PYI3Q4V4mr8UITEcrlQhK
         ob4vxgoyawKs2dIFmLFRkZCSTorn8BSTDx0HvdnLRTO4syYPPhbItltprhYB8Mgj/g2+
         bz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788037413; x=1788642213;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XMurdfstMy1OBIHxuK/4vMtORv6ChBcNBL6pfYPlMA=;
        b=RTqIq5yKPSxY3z5vyeH2CQde7Vio+xyXwF0kj45JH5zKKYKEHtjOyh8S+G/zGjEVAb
         jw6F2zKeDDVmNE7ZeHXk6j0uN8eE+xFl/G9TMJjvc12Ky9Pym9r3DvUxbixTlLhBh4oj
         YrVr92E1D/MEEBO7VbQcgPzw8ISi0IHfP8IcaKg9j9HAAyW+ZvdGTo90PhNdsWhBT/pa
         5Tszaq1L1k4l5Uf6SQKZSL/iRZBfsVizLRoKSSdih/ApumP6XY7RxK9pzD92DS0X7rUf
         avRv7X6jZ13fZbEUOWbu5OEZGjlltdoHMvNEQYVZDMUNwQb8hYHULvZOMUTFbzzUa/U6
         rf2g==
X-Forwarded-Encrypted: i=1; AHgh+RpfnLTItvZz2HhXbTOvgeL5rujVhWZh2ecarpAbEv9jwgktNUTLduJsav7voECWdWEdC28A/xAnOBp7feE=@vger.kernel.org
X-Gm-Message-State: AFuF++nwpkPlyCimYnpY2wFxr9hsU4NYaBhI7TkeHPS/GIbBI/Z7L2z9
	YIJMD1NV/HAvQz+zSARpR2/NOH9vYIQGsjLQY9cgSrGKRQy6bBWjEpl8hwQ7Mlx9bcXvkjr0AQc
	UX8BM18C5P+/yECyx9Wskrn0cgqpqxn0=
X-Gm-Gg: AR+sD10JXXfyXeT71YgXi1DvZ9kV14QJ8keaInUOLoQICCHOTTHWtkkb5TmPgTMVgpE
	bEOqfTDimEvTgB2KLQfUunYHlJs9f9JPbtwGmUrDJ5bGpDJCCD1kO/Ag2vshFOn5UKXCBSurcaS
	JQXaH2wSur2HPs1SpPADjFc7aBeH0jR+uNkbmvKf5gVJs199BMPfyHbL28YBbk+D/4GTU1oiObk
	NoYhJ5fFYTqT8p4khDQ0nUmqA6wKoXKdIloyZY3d6dtqSsXZPOg0Qqipf37xQMktoBuPBRWcYT9
	ro3Ho7EgOXe8kaTpFBbOhLWidrkaceOhnTd7+Zn8zoPfmBc9z8mB/QZMsiX7/2mG75lOxE7ljeU
	knpM=
X-Received: by 2002:a05:6102:a16:b0:738:f27:43fc with SMTP id
 ada2fe7eead31-7841cb3c625mr4577793137.2.1788037413073; Sat, 29 Aug 2026
 14:03:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826233818.124278-1-rinat.muhamedgaliev@gmail.com> <60faed5e-8a19-4eea-8272-145aca3db2d9@oss.qualcomm.com>
In-Reply-To: <60faed5e-8a19-4eea-8272-145aca3db2d9@oss.qualcomm.com>
From: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
Date: Sun, 30 Aug 2026 00:03:21 +0300
X-Gm-Features: AcwNN1VMWjJRjHRJtM0CbB9UeZyAxS43Ej93bGRg7cCVnlgW4IUM-2HfGBqUOus
Message-ID: <CAGHQT46f3wexEQHpcp_aoa4MHpi6vrtAd8Pbmt0KANdn9rANLg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: fix fuel gauge compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Caleb Connolly <caleb@connolly.tech>, 
	Frederic Laing <dev@fredfunk.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 29/08/2026, Konrad Dybcio wrote:
> If I'm reading that thread right, this IC is on the battery itself (?)
> and it seems to differ across different units / suppliers, would that
> be a good interpretation?

That matches what I found while looking into this. Both the bq27411-G1
and bq27541-G1 datasheets describe them as pack-side fuel gauges meant
for integration into the battery pack itself, alongside the protection
IC, rather than being placed on the phone's mainboard. So it's
plausible that different battery packs (different suppliers or
production batches) could carry a different chip variant, and DT
can't detect that at boot time - the bq27xxx driver picks its register
map purely from the compatible string, with no runtime DeviceType
probing.

I want to be upfront: I only tested this on my own OnePlus 6T
(fajita), by reading DeviceType directly over I2C on that one unit. I
haven't verified whether other fajita/enchilada units report the same
value, so I can't rule out that some devices out there actually do
have a bq27411 and would regress with this patch.

I'm not sure what the right way to handle this is and would appreciate
guidance. A few options I can think of, roughly in order of effort:

- Ask other sdm845-mainline users to report their DeviceType (a quick
  i2cget on 0x55) to get a sense of how common each variant is.
- Leave the fix as-is for now, since it's still strictly correct for
  the tested unit and the previous binding was wrong for it, but note
  the pack-side/per-battery caveat explicitly in the commit message.
- Longer term, add DeviceType autodetection to bq27xxx_battery.c
  itself so the driver picks the right register map at probe time
  instead of relying on a static DT compatible - though that's a
  separate, larger change to the driver, not this DT patch.

Happy to go whichever direction you and the other reviewers think is
right; just didn't want to claim more certainty than I actually have.

Rinat


=D0=BF=D1=82, 28 =D0=B0=D0=B2=D0=B3. 2026=E2=80=AF=D0=B3. =D0=B2 13:05, Kon=
rad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>
> On 8/27/26 1:38 AM, Rinat Muhamedgaliev wrote:
> > The fuel gauge at I2C address 0x55 on OnePlus 6T (fajita) reports
> > DeviceType 0x0541, identifying it as a TI bq27541 rather than bq27411.
> >
> > Binding it as bq27411 selects the wrong register map and produces
> > invalid voltage, state-of-charge, and temperature readings. Use the
> > bq27541 compatible and rename the shared label along with its fajita
> > and enchilada consumers.
> >
> > Tested on OnePlus 6T (fajita): queried DeviceType directly over I2C,
> > built the DTB, booted it once with fastboot boot, then installed a
> > locally built postmarketOS kernel package. Before the change, readings
> > included about 65 V, over 10000% SOC, and -273.1 C. Afterward, the
> > bq27xxx driver bound as ti,bq27541 and reported 3.835 V, 42% SOC, and
> > 33.3 C.
> >
> > Fixes: 12dfb002ca01 ("arm64: dts: qcom: sdm845-oneplus-*: add fuel gaug=
e")
> > Closes: https://gitlab.com/sdm845-mainline/linux/-/issues/36
> > Link: https://gitlab.com/sdm845-mainline/linux/-/merge_requests/148
>
> If I'm reading that thread right, this IC is on the battery itself (?)
> and it seems to differ across different units / suppliers, would that
> be a good interpretation?
>
> Konrad
