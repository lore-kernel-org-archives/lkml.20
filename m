Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.155.65.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888476;
	b=C84nFjbd1y91P4v+WGK/c+D5QhWzr4E9KYv2AZk8IkI8tbW+WNiq85n0Q1ytAIWZ3lip
	 GDgEOpoogPIXWZbt7wY2oi10bd2PyapABfAsaw86jLa9CFHSzX3etsgG01aOhwl2FSeei
	 OotOHjJTYwqf2+L9gT6C2sV1e6muOvgGC5HqQC85N0SY5/RWH/zOPjbDGY+jZTrJsp9h8
	 eoqR1wUVR8ii+i59hSnYx/j+35OXY1xs/grrZaloDlBJIKzViw/gkmoiOeFCZ51iULbIs
	 KOkaonZ95rAs7TcaQv4oIBm6Opz/7tiYg0lIeBMdVi8lTJx2dJsxsDchQCVfOeP4NiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888476;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 Content-Transfer-Encoding:X-Mailer:References:In-Reply-To:
	 X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-SPAM:
	 X-QQ-RECHKSPAM;
	bh=Qj6ko1N3dgjOtQtUQnSyDi9DsI3Oyz7n8DZ/lHsW7LY=;
	b=L+AmAPZWk2CQKeohClcR5lixIAEiwMZ45qU1GOeHYSZzkRkK9k27NkSe9yMUqiCU6ACh
	 eb5Qv+SS05WbAMHtRdz/S2zsUp2OnnNgMvcG/OMKoHa6RISaDj3kcGZQ7dlf9lFYiYWyT
	 3bWLP2eeyAJ4Fvkjsg/UCZoeihq0uw2VMNSwRSXPFU+pogFuZtGnun078zgr3YYmf6r/M
	 GxxtMbhgB8cjSpqcVkiQI9H9oeoqQN5gaYs1TgxjAAStz42ATzKgvxKkKolC+XCHykwaw
	 r4eJ77Goqs4GXcov0uERbZvtk5DiS/QbsU8M2B3vAgpyHFSqDghhCwShrqB11Yqi9iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b="tNWh3/k6";
	arc=none smtp.remote-ip=43.155.65.254
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C045606A31B;
	Thu,  5 Nov 2026 14:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C045606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=tNWh3/k6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793888458;
	bh=Qj6ko1N3dgjOtQtUQnSyDi9DsI3Oyz7n8DZ/lHsW7LY=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=tNWh3/k6YRp0HcBvXBVUVuq4YORLFT/7XsjQBb9rwNIxUjWXnRZCgA2u5zh8wEQXm
	 dXq9O+Ln/KyXBEkNukhWGdzpBTjbkr/rTEqMHgArO2pC+2Mn2Iuk2MjdzXL6oabKH4
	 hvoK0FEA6VLUH6ucf+2chZH7CObK8QbS2OEJBlkA=
X-QQ-mid: esmtpgz15t1793888456td5594c5b
X-QQ-Originating-IP: yBFPL2ZTyWZz24PGoH1FCJQ1EtD4gvUo9iOr3+labVM=
Received: from = ( [183.48.245.66])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 22:20:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9366842104901777624
EX-QQ-RecipientCnt: 14
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=dda49a7eb14547398a92cd8d13a7d78afa9d0d5b3d65ebe7063bbb21050d;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 05 Nov 2026 14:20:52 +0000
Message-Id: <DMNCDUADFF3L.2ZLV0D2ZZ8CRB@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] riscv: defconfig: Enable AT24 EEPROM and ONIE TLV
 layout
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "E Shattow" <e@freeshell.de>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com> <20261105-k3-com260-module-sd-nor-mac-v1-4-138b39d74602@linux.spacemit.com> <0c4b79f0-383a-4884-8132-59dcb3487cd3@freeshell.de>
In-Reply-To: <0c4b79f0-383a-4884-8132-59dcb3487cd3@freeshell.de>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M2z/kxGgDm0n/d0ck7D7Wy7+LrazgwpDU7hS6yDw3UK5ewC+b/5uO+Gq
	iM6zLuEOcmCP2iB0ze93/9myAu/90fCH8q46J0oNmlMqAG3O41HtewubMk6Mx8c16FkQEmS
	M0MYfZGz4tLTf4GDfgunyBJ8+i+wqhTutVb2j2iZb45S8zEVbEvUBHF2cogNMhIqXCjsOTp
	a7xhTQfXPw6eaM+SnFmUywcLuevDRuq8QbR2E6TCeMDZCA2Y6XXlii2Wo2pT+pLKLBoyKHI
	FWo235+466LogsjrYK5UqoEgZRo4qTDnxdW+TW9685O+Cz4NndKwhuHgc7sF+NITJoNjNwC
	4jLYzEqSxNUNVljA/vz+RYoT1jRJJN6CB1gQvkD46QfZTy/Nk4HcuX1oQL+dJYn2iPKSVEk
	rzVSNBK3zxEtflwSifnXiGvBP5gmPUxooh6WZsViLw3zKw71oNYty+PqITPCOwAlnP2PxJ0
	HGsEI3ZHITQBaGGYww6ZU1m63eKRSxSTQgDYAReJHRzDsRI/8puNtdDNCOsiQdQhvVL1qNJ
	9TMpJcZkEd939OOBvJW9OAOmf0mAuo5Zv92HeKnJN1mEf1/m1xbCN73By4yHhkBG5ZWXxxI
	XlhNWQ+MIbTE5s/BreNM/UOnlPVEKupXpEwvWKp1noxh7sGrhRkZueEq3AJ2rVLRjuAeJxr
	1Lgncm5mE0TBEcjd6P4MqGZ+Wft62aA1F8yB8Xz8baYu910+T3UQyp5AhkKwl4FhiW4/Pfv
	NDl87C+w7dRnKiDoSTdz5mfbtguvbEMGAlT2e1snZPgtuazL6nbah0yusZ3KatcGIKhetm/
	NpdnWkWfbE8NNF3F/+rytMz7nP+lzxuFm/7z8xDurNpNoQts2suN2hRkja8gjP/+FdX5pB/
	ECr/jvyeDW9IX96z0bMEFAQPbNZXZBdeDB1vCqKCFZ7razxSktKu4ofx4I3S+yrKlhQdRtI
	rZqEwZJ2cawO968XitdRzGN0+VAIm0SaKThV1XwhUJxV4cIsswd5dZgIK1N91YiI4xUA9zy
	EqCPkh39OWDugfa9LJBWxdu5/5sJXGjzcjJ7+WeImLHb34JFgwhDENmdVEvwmnbqZiQadV8
	zGpyXi4MMA3UII4vBls2dCb7cISCexH3mR+4ni6IUaFEhnkgZB0Y9Zyr+2WFleWO4KZ875d
	rOvGbkNJ7BIwUTwNhUMUCZH50Q==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-SPAM: true
X-QQ-RECHKSPAM: 3

--dda49a7eb14547398a92cd8d13a7d78afa9d0d5b3d65ebe7063bbb21050d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Nov 5, 2026 at 10:42 AM GMT, E Shattow wrote:
> On 11/5/26 00:23, Troy Mitchell wrote:
>> The OrangePi RV2 and R2S device trees take the Ethernet MAC address from
>> the ONIE TLV data in an AT24 EEPROM, and the K3 CoM260 module stores its
>> MAC address the same way. Without the EEPROM driver and the ONIE TLV
>> layout, the MAC address lookup keeps returning -EPROBE_DEFER and the
>> Ethernet controller never probes unless the bootloader passes a MAC
>> address in the device tree.
>>=20
>> Enable both drivers as built-in so the MAC address is available as soon
>> as the Ethernet driver probes, including for network root file systems.
>
> This does not make sense for platforms which have no use for EEPROM
> driver in Linux userspace.
>
>>=20
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>>  arch/riscv/configs/defconfig | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>> index 04ae305d5511..a76f801d8eed 100644
>> --- a/arch/riscv/configs/defconfig
>> +++ b/arch/riscv/configs/defconfig
>> @@ -276,6 +276,8 @@ CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=3Dm
>>  CONFIG_PHY_STARFIVE_JH7110_PCIE=3Dm
>>  CONFIG_PHY_STARFIVE_JH7110_USB=3Dm
>>  CONFIG_LIBNVDIMM=3Dy
>> +CONFIG_NVMEM_LAYOUT_ONIE_TLV=3Dy
>> +CONFIG_EEPROM_AT24=3Dy
>
> Enabled as module, please.
Yes, you are right. Will be module in the next version.

--=20
Troy Mitchell


--dda49a7eb14547398a92cd8d13a7d78afa9d0d5b3d65ebe7063bbb21050d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCauyQxCEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC9ZSwD6AxJbBe8W18yH
nr4KCfjIsJCOqNmdf0vzp8XWweapmi4A/1NGR2u7q/A/7Ho7/TlsOtBYjUmXNKZ4
lwAjGYrg+mAL
=AhUC
-----END PGP SIGNATURE-----

--dda49a7eb14547398a92cd8d13a7d78afa9d0d5b3d65ebe7063bbb21050d--
