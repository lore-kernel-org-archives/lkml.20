Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314892;
	b=q/MqWoGOfD4+OiIzlzjmzZ9qcn2VK8QUwRwLBYwkyBnFKdKI58BxMZrnvBDm3UseWHXj
	 iD8MH0IuHVA4+aQDBSX4ZXbYxq4xewVjz/+6MasEysl5t/IlZTdRJ0dWv+D0LmC3yS9Xo
	 k8VUOww7BFVfg5qrqqvj8a84T44sfQvegoBXGhtFY6wQ1L/DrqsC2l5Af0jR68iJ8I/33
	 V22ASIp18FxVcyPqWo8dmDyf4ItXalIhk7x+SdGjYlf/RQGoZdGEjSsX+adUqIhHp7PN9
	 P1littproJ2OlZ1NG88RJDgZmI31mo0mlbJdbI9qHoXxpOB2ZIsgRWJ+qbFmJyjrF0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314892;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1Yp4KPwUlz9JWaHLTQ3/Bx+ixssutpKy6VwlgUulV5I=;
	b=OqEL3UeT7L18cULbYiBeSDMDzUfldd73Z0UW0eOLTyaZmrS/XMZEFinF7P8zm4MTPdyq
	 JO0B2UQNNfsBxuviEtpKdUrbCtRLjWyy6DdTQ5gbFA80dqC63s2QQO7reIJB9hdWErBmP
	 j/LYojpl9cPGTYNraPW/TDIU2Ve3Xo9cSR7OpmBKFoT86UroQ5mLafpUYVOWy69wL6tYP
	 jx8/9aSU3gLc7afLofyKUmsaUVKJjW8WsQNeDSz0nZsBn7OPbrdD+VuxvhPsKhMUOpcZI
	 ePVsDWRcU5JhF6+JN+1K2Cn1kcfqPpnIn2gQfJjpO3j8zmWQOgNE1CE0dtjiL6278gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hqcTSQXn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D46C606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hqcTSQXn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A98F1F0089F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794314892;
	bh=1Yp4KPwUlz9JWaHLTQ3/Bx+ixssutpKy6VwlgUulV5I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hqcTSQXnQgoV6UYYGEbZ0kR/MWjpmsUsYXNNpue8cbyBvenKsyeyLZN5UqgVYNGoT
	 tU59WxMxar3DHcjOT871gyr5z1/c3ti+8ga4dKFsLoqsPvKQmiXB+JITlYwAzsS/wp
	 Jq9kYfvZMVqvjN1qipC2JFfAlnnOYKVQGsA2Daw5SiiY03Vt92cjXgOJCOGIekh+LB
	 eiitzPQhBYA5AJbU4PEh+bT3bLaZ2JFOpPsuQ4xuelFadQxdndimaNwBrC84UoEgUM
	 DtZvS4/reoK4Nmb0iWTkFQsV5TipA8am4ghJzplVv5roNDLrFyyzAK5rDIk49435xW
	 j+gFB54h+HZwA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so1972235e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:48:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHrp028Yl3iLwl1D2cbHpTyXOQRdV63Ye7qWknv854bko2W4yY4kp329/cW3I2Uf3NRr1esrbe8cVEp9j4=@vger.kernel.org
X-Gm-Message-State: APuU4Z87XKEWefn0M78h2u6E2Wh9x6iTL9A0MWxk3+GR9gBNDJ/cXXyZ
	aIX2PAJbicn+x/LzWd+HaOJMJOb39VH2Di5ZVNA5dTedBx9FlQjQeZ4lEkDlwt2eEwu6RNwvVrR
	3cycnGWccEs/Ad2EzCwC1VOOp7517whE=
X-Received: by 2002:a05:6512:1306:b0:5bf:b93e:89f4 with SMTP id
 2adb3069b0e04-5c156ecdb97mr835584e87.46.1794314890465; Tue, 10 Nov 2026
 04:48:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109183803.2724859-1-jamien@nvidia.com>
In-Reply-To: <20261109183803.2724859-1-jamien@nvidia.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 10 Nov 2026 13:47:57 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0ib04dv_eL2w41=1KoFLnxqESJkKhPGVQpb1j8XgP_SRg@mail.gmail.com>
X-Gm-Features: AclHuK_3K7ly66VqgF56p7QfwVKq3MI-pKUFtTDql6PCL8hm7uoHRF2WoGGSNCs
Message-ID: <CAJZ5v0ib04dv_eL2w41=1KoFLnxqESJkKhPGVQpb1j8XgP_SRg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] ACPI: sysfs: Expose BDAT data region
To: Jamie Nguyen <jamien@nvidia.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	Punit Agrawal <punitagrawal@gmail.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 7:38=E2=80=AFPM Jamie Nguyen <jamien@nvidia.com> wro=
te:
>
> The BIOS Data ACPI Table (BDAT) points to a firmware data structure that
> carries memory training results and other boot-time data. Patch 2 exposes
> that data as /sys/firmware/acpi/tables/data/BDAT, like the existing BERT
> and CCEL data files.
>
> Patch 1 fixes a leak in the existing data file code, where data_attr is
> not freed if sysfs_create_bin_file() fails. It moves the file creation an=
d
> the cleanup into acpi_table_data_init(), and patch 2 builds on that.
>
> Changes in v4:
> - Patch 2: before mapping the BDATHEAD header, reject an address where
>   the header would wrap around the end of the address space, as
>   acpi_data_show() already does for the data region. Found by Sashiko
>   on v3 [3].
>
> Changes in v3:
> - Rebased onto v7.4-rc1, which includes the two fixes posted during the
>   v2 review [1][2]. No code changes.
> - Dropped the "Assisted-by:" tag as per latest guidelines, though an
>   LLM was used to write, review, and test this series.
>
> Changes in v2:
> - New patch 1, fixing the data_attr leak for BERT and CCEL as well.
> - Patch 2: the BDAT callback only checks the table and sets the address
>   and size of the data, and returns -ENOMEM if mapping the header fails.
>
> v3: https://lore.kernel.org/r/20261109180945.2438349-1-jamien@nvidia.com
> v2: https://lore.kernel.org/r/20261012230632.3574987-1-jamien@nvidia.com
> v1: https://lore.kernel.org/r/20261009232955.866131-1-jamien@nvidia.com
>
> [1]: https://lore.kernel.org/r/20261013180728.957618-1-jamien@nvidia.com
> [2]: https://lore.kernel.org/r/20261013193900.1258808-1-jamien@nvidia.com
> [3]: https://sashiko.dev/#/patchset/20261109180945.2438349-1-jamien%40nvi=
dia.com
>
> Tested on an arm64 server (64K pages), with v2:
>
> - The file matches a /dev/mem dump of the data region taken in the same
>   boot, byte for byte, and decodes with valid CRCs.
> - With lockdown=3Dintegrity, /dev/mem is refused and the file still reads=
.
> - Malformed BDAT tables loaded via initrd table upgrade (test-only change
>   adding BDAT to table_sigs[]) are rejected without creating a file: no
>   "BDATHEAD" signature, size below the header, non-memory address space,
>   zero address, and a table shorter than struct acpi_table_bdat.
> - With a test-only change that makes sysfs_create_bin_file() fail with
>   -EEXIST for one BDAT table, kmemleak reports its data_attr as leaked
>   without patch 1, and the data_attr is freed with patch 1 applied.
>
> Tested in QEMU (x86_64), with the same test-only change:
>
> - BDAT tables with address 0xffffffffffffffff or 0xffffffffffffffe0
>   are rejected without creating a file. With v3, the first of them
>   faults in memcpy_fromio() at boot.
> - A BDAT table pointing at a valid BDATHEAD structure still gets a
>   data file with the expected contents.
>
> Jamie Nguyen (2):
>   ACPI: sysfs: Fix data_attr leak when creating a data file fails
>   ACPI: sysfs: Expose BDAT data region
>
>  Documentation/ABI/testing/sysfs-firmware-acpi | 12 +++
>  drivers/acpi/sysfs.c                          | 74 ++++++++++++++++---
>  2 files changed, 76 insertions(+), 10 deletions(-)
>
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --

Both patches applied as 7.5 material, thanks!
