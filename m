Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793217966;
	b=1R6mBL7eDfLzX+pqpuejnPFHFwNtB9Ck0yn1GEF3JaJMPvbpkrBep5JKaH67vokVV3nL
	 Qk1nZZ53Yx1Fhr0LPQUFDgEVt9X+4TU7aZr8LNKAf6GbZX0HtfstclwD3ZtTOdYgnv/SY
	 71u3vrILM6abvxSiQyGylp/ITIQ5UV88jYJCh2r7Y+ldTyfPcsWEGsZZmGeZ0F72XkoUp
	 ZCetNfI04nyBzyect4dXmIe/xaH6efSErG9uM6RGePDvoMZ1Gj0hLkTVFZhEDyi3VCJxu
	 /DV0jqvnH/UrWWxvTyY3IcrVfDY6K3rqGcBbtqWbcEVr0nSqcsCZcEyQmg7oeapWobw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=E7ixOB69ERI62LQAi2qp7f/jJpNcrGT6jByhhOIKXrg=;
	b=EF4sOXwtQgmzZFTNZr+Elbna9cCNfD8aWSrLJDze85RO5Ae5+j5QcBFc47tqfOOBT1s5
	 2WEQp9KAeci1peAzeZ78S8/Pby5P8UIXYqJxm7YdDhn1k+Cxosg6FRcV2Ady4TWI2CPEM
	 XEyx3j6XbyQjYKJejBHNiOApZ3UjpQZxQodUtq+/Swr2EgXp57sBvSp+TU+XWVhvEHIlr
	 mb/FzpIDy/eGKWSlRLNTU8DBKqREcxG+NBdxJoPiXySXM/t/8EHoO25tplCvkA3OtlFAS
	 bEtMYq/7PJze29cvHyH0qa5w5c+IgE011kMGccDdwNfKhZHYJRRJvKMIHhaHHbdLBDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dXlutysd;
	arc=fail smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371B5606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 371B5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dXlutysd
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53644ab1f7bso14259691cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793217965; cv=none;
        d=google.com; s=arc-20260327;
        b=gfjX8yWsa3pW1hwENdceQQ47f6p19D2YCvrO9ZowrefMzZkqGR/3CF+UC8DMcZfzR0
         IFWhQgewwJJ7aQG2wUl4F/lTbLOGeKtLCGuRWAWTX9aLTA3ENpmhYPp1A0ysjID1VZ5W
         V+aX0oHqb01noEZj6j0ScRRxvz9wVbBmUkWj7YYmXkwj5Mw+SAdc+GYsAVcKJZY57v1G
         CPZhsFuz5CndAeCjuRcL23PMLeMmu6AeUwNKM56xp+oPYmvaYyKqqh1YDZTXi/n74U9Z
         S8ZU0QZPf81UKWE/On3celhGY2zaLkfAyMu+YQ4rKJPgquqnFsUpxeruiOxm1szkRGpI
         vhZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E7ixOB69ERI62LQAi2qp7f/jJpNcrGT6jByhhOIKXrg=;
        fh=6b7OIrBlyujhDfsfK0PY+6EyUr6y+zenL6rtOydwfL4=;
        b=RXxU2oDyQN+3K20+0HKM71WrK6YCfZ3u6XmsFefgu6e48KwFRXvh/g15boT0q0TYKN
         z2AsWU7Wb28Kmdf79iQtmnHZ3Xfhx8Cw+x1mBJWVg/vmTqUOJUnUvdtNYVnj5QCD9QtD
         GbV4YpXyGzcO3WNKICGvQRAGhLZphz6QC7bczUC+Nd8aOeROOyFdyfurGjvz4AkoDh1G
         cpA0x4tKhzvBJEL77KsOLVnDN1mWpgZZIa0ncBl0yTC6flgHzIVg2oq42CGlSfcBmt6O
         Tri2odJqJ260I5femrWbDG0M/YxlhcWpY5A3KPmbea6KjNHFD4Mbxik2syQfM8bu0UNW
         qpyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793217965; x=1793822765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E7ixOB69ERI62LQAi2qp7f/jJpNcrGT6jByhhOIKXrg=;
        b=dXlutysdDhscdJmeRbPa7EM1sLb4yD199vkD1Ud5wNXNla2GnfyQapJff2WzczuP0y
         ZoScjWnXZShxVmWz9NPieu6mPwchuubNN4y7UAizgNwTD5dSTLPO7oagVoLQhXgFwI7R
         0ax81qAMbxaGvmxEDaZrIPclJ3y8sA4VvsKl/tdlP8Xza6OaZoMCzoeQ6mJK7dbuP0Dh
         n6EEY8267H2Ahnai+uaOOBePk7JCxf7O1jC7P83jtze93Mn/OFhfTe77V/idFSexTZVg
         PjpmHlYWxCb/SMBZbZRok6C4ExF/hzy3pfjJ2pGP1SCnuqw86uG5L8xj2e4geQGqcLCP
         v20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793217965; x=1793822765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7ixOB69ERI62LQAi2qp7f/jJpNcrGT6jByhhOIKXrg=;
        b=G6IfKDZ2uqaHF1PzXc1NVyjIyhksbcKsDg+0pqFIo17KV1k7WhDoZv4QD20ItxIlq4
         JigGC0qghZ9s313GnwIIvFKIiWDyVID/n1PpaviAEkUceH7lNOqCT1GX7ipv0m/bTvjC
         FeaQ4jGZf2YAdgPG/AqKWrNJ3V85otqfalV5YL9p+zT6cVZst5VCfOLehVuMgcYH8PRc
         5h2j8tZVif9DBARfNG2QOYglHfN5EURma2WxCsvPOrx/tkavPSuc6Muo9EPV3hn+zE7/
         XehgdK+Zfpsf22IUzjnbJkOMRx0JZ5rEuw1oLu/XHsvqH0E4JotbDOD2daV97z5SIc8E
         G2Rg==
X-Forwarded-Encrypted: i=1; AKwUvBwtXuoAOz5jB1etepX2GPJeqW81Q7v5fuC20EikyJPxlU3aJU+7wkTDzDjWry67GGC2Y5JlHStH0R602YQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5AYfsPzTtfPgggBXNs+ZVK71I0iWiGESVcGixgj91hEso8Vm7
	R3480NBqLEaX8j2FMNqa3uxV2QfbBAcZlO5Ty7GLkQp9GUnbbWCgwNgD2Z4Ur6W+15dXbvOYakP
	TFXDS3D5IDlGnY2eF1W++cpWmdPUhqvM=
X-Gm-Gg: AYBFou1W8w282LDnDrb/sWTw5DnQbzwb4rAp/OcmOpysBKxVvUDkLdNDBLAkNlftafp
	f/3uxVAtFI2+w3tI5C5SMwRE/pgFQEMeOQYWsHl9wQz44i2QQBNBiXNJRBqrqRmPpWQG0L/WuSq
	H3S3G5/TEvahQ1AyAKjZFJ3CAtUberfzH7ffa1OB7aTv0ozvtrhJTgWO8LIckPq8q+XCecUf6+H
	7fC1zl7t4ac7n4YMvzT7J9Kabpn0jPXMUk/Qgqgo4OZm1dxbC6dmBirtQOpMNhByM+guULlqYIH
	LHTzTTEgnrPma4WmXkJHASX781sXW9cnUQUhI6ADdREDP3BENt2Hky1IfGsdLtXWZjPKQN0ZlIo
	otR9yIIlmaK1utgzEnW7n4Uxa+6r/gU3aPOzl
X-Received: by 2002:a05:622a:1b06:b0:535:11e7:fdb3 with SMTP id
 d75a77b69052e-53fcc4cc979mr53158021cf.34.1793217964993; Wed, 28 Oct 2026
 13:06:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028155005.174417-1-mbkchelofficialdev@gmail.com> <CA+YDrKA1hTM-Yh+qsCz7Q_O9f4m_JWqyxkm4izaz4uAao_Jz5Q@mail.gmail.com>
In-Reply-To: <CA+YDrKA1hTM-Yh+qsCz7Q_O9f4m_JWqyxkm4izaz4uAao_Jz5Q@mail.gmail.com>
From: MBKCHEL <mbkchelofficialdev@gmail.com>
Date: Wed, 28 Oct 2026 22:05:52 +0200
X-Gm-Features: AclHuK-gwnM5a3gchHzfHJ4Fbkh10NoTzJM4qf8pmkxYyLfJG-2YoMNVzSxHgK8
Message-ID: <CA+YDrKAjSO7SVOE+odJ4zYEphfJtytjteSvQgGwmz_rD4tsx5g@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: document emit_base in ModInfoBuilder
To: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 28 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 21:57, MBK=
CHEL <mbkchelofficialdev@gmail.com>:
>
> Hi,
> Please note that I made a typo in my last name in the "From" and "Signed-=
off-by" lines. My correct name is "Ivan Tverdokhleb".
> If the patch is accepted, could you please apply it with the corrected na=
me?
> Thanks,
> Ivan
>
>
> =D1=81=D1=80, 28 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 17:50, I=
van Tverdohleb <mbkchelofficialdev@gmail.com>:
>>
>> Add documentation for the emit_base method within the ModInfoBuilder
>> struct. Explain its role in formatting metadata strings, handling the
>> differentiation between built-in and loadable modules, and managing
>> linker sections and conditional compilation.
>>
>> Signed-off-by: Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
>> ---
>>  rust/macros/module.rs | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
>> index 0a7b9e24c..6f361013f 100644
>> --- a/rust/macros/module.rs
>> +++ b/rust/macros/module.rs
>> @@ -49,6 +49,16 @@ fn new(module: &'a str) -> Self {
>>          }
>>      }
>>
>> +    /// Emits a single metadata entry into the module information table=
.
>> +    ///
>> +    /// This method formats a `field=3Dcontent\0` byte string and place=
s it into the
>> +    /// `.modinfo` linker section. For built-in modules (`builtin =3D=
=3D true`), the string
>> +    /// is prefixed with the module name (`module.field=3Dcontent\0`) t=
o avoid naming
>> +    /// collisions in the final monolithic kernel binary.
>> +    ///
>> +    /// It automatically generates a unique static identifier using an =
internal counter
>> +    /// and applies appropriate conditional compilation attributes (`#[=
cfg(MODULE)]` or
>> +    /// `#[cfg(not(MODULE))]`) based on the target type.
>>      fn emit_base(&mut self, field: &str, content: &str, builtin: bool, =
param: bool) {
>>          let string =3D if builtin {
>>              // Built-in modules prefix their modinfo strings by `module=
.`.
>> --
>> 2.56.0
>>
