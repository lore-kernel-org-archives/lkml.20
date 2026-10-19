Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426440;
	b=alDnDAPu8PBTyXmlGpgo6O1MC3CyireGN2MktJUHNrGfDHnKv40kfJVS+/wN3BT5Ql3l
	 mCGoaCINVBbvIJ+SmeUgx66gTD3KUf4dNEXkOJMdbJJr9eYihcwOPsA5bJraJkZkoUeOG
	 vo5WFm3KCrDMKJvftkGTSbYkBDgLhHFTTK4aWn/k7XD8Tl/+cbCbMDuT3EZYKKYo1CNpR
	 4mj1y7nuGRCxEP2/hlW52p7um1gzmhKnCECi/Ai8SYR7SR77OyvxApoHkS1jV+re4/toI
	 aRuv+gZX4aJ9UVGijDL8SO1lsfW0sHDYxTlL3lfpzhuMnk+mzMZjhACzGjbjp+p64Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wE8DD8N71MQfznU3Ft9s/Hf8dnnaSHV9fDu9XrNDJAk=;
	b=dMtb2VR2dWDGFXPYFE3pe1naZFM3JEdzc9RbfVmFoUF3VVMSzB3dwLjx5kGP3n7Ar221
	 P7XX6HPVEWEo4rAo/JtYJHlKmuxWD8jVw5q11vAwvTjiZCcgWLwYNlNPSqVVnVYyewkS/
	 LU3FYJqqfc8jAQjZyNFjewDtDTuKHZS48ZHwOztEcdaib1xv9bRrAL0atdCJhy9Sc/cE3
	 dDPotNUzj/bppNgmQC1krkuwnOMwX3zYfwT5RNEvbyo0F2sRa1PQxZk6WYjLvn+BlAPoV
	 LKTqLZj/bl4ckzd5oxi3waekl/ukJii+xbBgcutMoKqtVPIRybbPcdHa4fQvcN2sKsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TGCix4OS;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2390606A331
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2390606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TGCix4OS
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-98c8cbdb9daso381171241.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426439; x=1793031239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wE8DD8N71MQfznU3Ft9s/Hf8dnnaSHV9fDu9XrNDJAk=;
        b=TGCix4OSFUVd2foLkH/AQ3yvxD1aX1OJPmYZ7YehqJhxPdSPXmXPixodwvOoqXvR5k
         ds0P+wHXh4/5EGpnSs9+gF7w68GF7tlvLHhrUsK4fmGTF+bjxwhK29DwnQfdwvzkTFDH
         PUZiIvyZG5PX45NXM662AbBKlUVMK/mLq4KsrBME26k98B8kVKz+LN2MyhRjVjp69J7J
         P0nyleuKq+3hDm5xPzXOCHCAQLrSMT4wUWfOjFHrxxTKmPNCYOP/s6iqvHLlYTGO9w2d
         ni8ag7nItDl2SaLCiOD86eAVjcC9MmHA7+ts2eUv92XMBJ5UyvDlVHTn0yUe2SAj1TPB
         ZjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426439; x=1793031239;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wE8DD8N71MQfznU3Ft9s/Hf8dnnaSHV9fDu9XrNDJAk=;
        b=TAPmQ09k2ScxdNj8oV4VVLV4mdSNCYRtqTZPEtHg2HKV6BF0IYKuWYVYY/DzDHuSrJ
         STear5cdtJlvgZA9U604br8yn00wdnKH755zPLxI461fK2tIK3+8QKKPk+mg0piI6XNx
         S5oHtKtoEeSHqkXv/9uaNVHjpyP7b5cUwRE74mO+yiimJLhF9SbLcFBDVjDcc+o99jcH
         DcHOQ1NOskLfG1WMKxTD/5dLAWwlUMv7EmiLXRncWPqj3wZC1cZEJoCyko/TrCmjCjFr
         Hq4sMHPEWkRh01B6a49XxsIzGUs4WBVyp1qYp4v4kBE1CfEngy6HImzy37sIoW2CHWxB
         SjKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwClhE/g+2F4J9lHGVxT6oXujft256l5HrMtKPjZQ81MqN/Az4l94u3FqhIshumiHvtf1X6EOMHCauARbc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgh9Z0ytOxhRJMf0O465ZCUO3Np0uOPjhsMr4J+6z3kmaxMUSt
	x+iZKJoblLEoHmn86JUtpNfn0PYBcW8PtrEJsYN/N56oQtXWan1KEgv3AvVq
X-Gm-Gg: AYBFou3Lp9zzot9XHkysiSNDDHDs/TIvHL6XYma556OfE0XyqNjnN1+YVoBbmCf/9rd
	cDDLpX7GL6xSGS5teM/tadgMeoW0O/l8XyNwWuLfQgqdEF0yjiZUIKaTylftkXcXmTrjduPaAnP
	xM43NDYW0L+O69UEuHocyj65YN1zNZYkgfaaQu4h0AizPWz/n9iYAGqJJRvJIsi5MKNhorFkA17
	fcu58gPmpRte6X+PH6Yp3601JSYBN3iyCnojPXgm+kIwsuun5aKFi2kW7lAt2J+HqrNWTvP4V6R
	DdCSlR6IvSSVi/q6geYjof9oNixJWGhrjGi1ZWPdveHZwsv3Z/Pti+zDwPlqKl82IBkWIVmNlpf
	gAOFAe0wGbNOG/dLfdwYcLk+6BNVAzAfeU6UyWW9ArqG/1//3vuX94rnwySEA/VG1Ddri0+28ll
	q6njl3RX0ZiClxCX/H+NKP1CE5bq94DQFMSJeh2oFZzHsSgnnvOH+srNi1PFSZDHznh4t5T7goU
	oJNrGZrs0bRk6elSe1ugL41PWJwZbJHNi5Vu/mp2Dzr0SWJOg==
X-Received: by 2002:a05:6102:5113:b0:7cb:bc5e:7dad with SMTP id ada2fe7eead31-7cc368f6cdemr2108176137.10.1792426438620;
        Mon, 19 Oct 2026 09:13:58 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb38f7f1sm525062241.10.2026.10.19.09.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:13:57 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 0/2] remove TryFrom<&Device> implementation for pci and platform
Date: Mon, 19 Oct 2026 13:13:36 -0300
Message-ID: <cover.1792417858.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This patch series removes `TryFrom<&Device<Ctx>>` implementations for
pci and platform's `Device` struct.

To make sure that there were no remaining users, I checked for usages of
the `try_from` method and the structs implementing `TryFrom` using rust
analyzer, activated the modules that were using the structs, removed the
implementation and compiled the kernel (did not trust entirely in rust
analyzer because it does not find usages that depend on this
implementation like the `try_into()` in fact, the last usage of the
trait was a `try_into()` in pci).

I did what I described above from the most recent changes (rust-next,
linux-next, drm-rust-next) down to the introduction of the
implementation, stopping in all major versions (7.3-rc7 to 6.19) to find
the last usage and mark the commit in the `Fixes:` tag. I found no
usages for the platform implementation.

If applied to current rust-next, commit 7c306f00835a ("rust: zerocopy:
update to v0.8.62"), nova driver will fail to build, drm-rust-next and
linux-next are ok.

This series, along with the i2c patch [1], closes:
https://github.com/Rust-for-Linux/linux/issues/1264

I made this a series because both TryFrom implementations were
introduced in a series:
https://lore.kernel.org/all/20250321214826.140946-1-dakr@kernel.org/

[1] https://lore.kernel.org/rust-for-linux/20261019152329.620610-1-nico.antinori.7@gmail.com/T/#u

Best regards,
Nicolás

Nicolás Antinori (2):
  rust: pci: remove TryFrom<&Device> implementation for &pci::Device
  rust: platform: remove TryFrom<&Device> implementation for
    &platform::Device

 rust/kernel/pci.rs      | 21 ---------------------
 rust/kernel/platform.rs | 21 ---------------------
 2 files changed, 42 deletions(-)

--
2.47.3

