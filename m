Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246014;
	b=tzHEujRmaHS67tv2kjj++ohka+5TGbCBa08dxp1N6Pl2ixRudvN4FJzsVS6/K0qEG22s
	 IB6qfBlKWmUFN3+n5EIsKUnXzcBGgfiA+oSWSi4Al/8hEbhjd86ienH4rgKSIf/fUl5XY
	 q66rdCgNh0OK1QMWw3kiQKynjlisUM6GK0j6MAZy6W0bCNJ42K5OG8gCqQPDHzq1rsMvV
	 DY19iKrSdnPjH4oHk7l0viBoMd8IgSpxqh4q0qHRkmDELoAyLViTrfCNqX7m0xjw9zyel
	 LkLdxaNpYmpDyO4PWZkGT05ycXoxbQVOq/sH6qUnPm0QE+Bz4QdB9hoZQPBydtDwLXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246014;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o7KDuZ1nMhNo4YG48lXW5JSMztCo9HbxwuLzAG/SOPA=;
	b=q3j1I3e4CArMJIKluhDi+W5kxiJqaI0bkyoaMILm0GX9oU+NczkGLeRV9zqubX/kuPxz
	 jRAzXJC61tIuuDxBw1mBbrH54YxCQ2oZAJ7FI243Z0/ZyhggsIn33+XJeBBkO5Aalg72C
	 BT3cDipiOG/tw2IpTwbvfJZxqF94VSND4gtPN0XjkL1u2QHs/H4K3YHlRKh+sJYtQrs83
	 zx3zlTQ2NCLRAO3Un03kDv/rz9MZ/m9z9Svi+p+HzMOfVDfn76qJ7i628LFWpm2lk2vRV
	 F0gKpdwF41POiqL1Lm41f9NdzYyLSqPP2jZX0PuZgpqfdEbKYagAbziGnLGdZub0RZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CnJZE5MV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2177606A333
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CnJZE5MV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668831F008A4
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794246013;
	bh=o7KDuZ1nMhNo4YG48lXW5JSMztCo9HbxwuLzAG/SOPA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CnJZE5MVXJeUIGen6nObmOPWrZnw8tp1xFse4tayeQmEtVCNlmXuN7RKnk5ttpwKo
	 G51D6zGfbqZKUTqRKYlt/k27sdm2OthnnMnpwgVDab/erYa061YSArOowkcSuE5SrG
	 6YZSrhisgogsGIDcvHytfEnqtcmzbv8+UlD6d302+i2kSzhGEvwJhMvSeWc6hFOzF6
	 VBgxley+qblJFFmfmtgVssMrzGiECqpr1Q/BaerEzuPL73njFfMFA16mp6PExPJp+Z
	 0S+GfHNtd+kE3XnUERN6dqOTwUZwjKCFWcLOPrsua3ixTt5A+jK5hfqLpjEgG1tsHb
	 IJwQrxmBhETNg==
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eac7220e9cso405585e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:40:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHMux4z5Hn65EF5xnjsH+1WdWIspTuZVTpVO9lp2j92RXrIl9oHu+wCj/0bWn+rJzGsF0fx30mgPLzpgcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JcBssLWfn8xwCEwe+y0bOgpTDfNdKsTKD2e10Fze1ppLK1LrI
	b3GfU/maI18D31i2uXgcW5FNhSkdCO2awt8RP2EYtJEFxIQYPOGzH/J9qYYr1uS3k+zE8KvSqdk
	xIxxg6gCQLzSvotW/x9RCDNyatQk7q+o=
X-Received: by 2002:a05:6102:914:b0:7cc:118e:7bfe with SMTP id
 ada2fe7eead31-7d2db102570mr1357435137.19.1794246012630; Mon, 09 Nov 2026
 09:40:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012230632.3574987-1-jamien@nvidia.com> <20261106154227.1445127-1-jamien@nvidia.com>
In-Reply-To: <20261106154227.1445127-1-jamien@nvidia.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 9 Nov 2026 18:39:57 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0i2FYcSeaZegt8zxVcrBXZtC15rruT_3a0Tr88mmCTJUA@mail.gmail.com>
X-Gm-Features: AclHuK8LYN7BAT51RckggiFWb7BukptqiyDiUMTJJKIqUJL0I_hnRI-HB9HvIok
Message-ID: <CAJZ5v0i2FYcSeaZegt8zxVcrBXZtC15rruT_3a0Tr88mmCTJUA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ACPI: sysfs: Expose BDAT data region
To: Jamie Nguyen <jamien@nvidia.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	Punit Agrawal <punitagrawal@gmail.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 4:42=E2=80=AFPM Jamie Nguyen <jamien@nvidia.com> wro=
te:
>
> Hello,
>
> Gentle ping on this series.  It still applies cleanly to v7.4-rc1, on
> top of the two Sashiko finding fixes [1][2].  Please let me know if
> anything else is needed, such as a resend dropping the "Assisted-by:"
> tag.
>
> [1]: https://lore.kernel.org/r/20261013180728.957618-1-jamien@nvidia.com
> [2]: https://lore.kernel.org/r/20261013193900.1258808-1-jamien@nvidia.com

It would be good to resent this to allow Sashiko to review it again
because the fixes above are part of the mainline now.
