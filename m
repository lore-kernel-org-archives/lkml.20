Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792518593;
	b=sbeklegJrOEsUL6tbpCM1QotPQmYzx4xlmb7Lkfx4bbhcarvo7Oy13Yo3iqVy7rY5BBE
	 xaJuG/TVrBYkVaJpGgemHx7Ed3BK+NSaYfKHGBf1/uPHoJlc/Dk6acVeDIH0xAFEcqw3i
	 KJUEfWo6Nmu4tMh9R1JHhWaED4NwNa0zWWq5Ic0eEteGNNAsHC2jFUZzWyL+WPzfUJJjv
	 WQg1UPMYgq+Q/p72wF1v+nG7sAl6wiIXEJBsRmZ2VmJ2uVS7F4PMycCGT8Sk/O8PUjtiV
	 YsG/zg7OK99liL1eo8g2BZfcb7LHu99rUCOIkMZwkNzd0aSdG620phEB9y5iIqDkb0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792518593;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Content-Transfer-Encoding:
	 From:Mime-Version:Subject:Date:Message-Id:References:Cc:In-Reply-To:
	 To:X-Mailer;
	bh=VdO3TkGJkE0/5auvzRmeM+H+7fXA7G0lgo2mz/y/Xz4=;
	b=VRPqoWYuFjj5FR3PZRUR95UL5xMD+ZRUuEq177tJtfQrWt5cD0Bl4OHdObl9DQzhSFst
	 S3uGOk87N7Q7/34E4hPTnTr8a7OoT866cn8aUMplG/kwEAa6V0u8yBdDQffv9GPTCIhQg
	 sjgJSui4/O9Jw+BoSSA+98kI2wIXhgF7ZZN0kJ7J3jw/5d4OBMNSEJ6d8DW8ObTLqNY/O
	 aqVFauyOqXZ94WktOVf67U32QMZX0UV6Q77UR5vh7y5l3IOAjwtBRukIIQVTbB7Z+1XcA
	 2a4dMkdlDZvSS5OZwwzK0CIrDdV2FPPM2ANjdwT0Q7iz4KsTV5N8bp4+FKuHTprsHvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.173
Received: from mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6235606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6235606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VdO3TkGJkE0/5auvzRmeM+H+7fXA7G0lgo2mz/y/Xz4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792518585; v=1; x=1793123385;
 b=RBtdtnz8TwYDn2UOv5vbA6DVvZ9hjToKOK3loqZfafR1McdaLsW9UNaNv/XB0d7HQVMpJgnH
 v7Jvx2P6yxicTdn9rKuXvfbtNgIRUpdHBilxA8vU69knmzfU49j5gGJ1H4gHP6nyF1My+57FeeC
 SzJUNRGnzxKwsWD/COZ61Omg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 27681babf8702918;
	Tue, 20 Oct 2026 17:49:44 +0000
X-Mizu-Trace-ID: 27681babf8702918
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Aditya Garg <aditya.garg@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [REGRESSION] intel-iommu/brcmfmac DMAR fault on Broadcom PCIe wifi, v7.3-rc7 -> v7.3 final -- candidate mechanism and proposed fix path
Date: Tue, 20 Oct 2026 23:19:29 +0530
Message-Id: <BCAFF55F-7FFA-4CB5-8738-F56D0F205086@linux.dev>
References: <1a15a4b49f0.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Cc: Jason Perlow <jperlow@gmail.com>, baolu.lu@linux.intel.com,
 dwmw2@infradead.org, iommu@lists.linux.dev, bhelgaas@google.com,
 linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 regressions@leemhuis.info
In-Reply-To: <1a15a4b49f0.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
X-Mailer: iPad Mail (24A446)



> On 20 Oct 2026, at 10:40=E2=80=AFPM, Arend van Spriel <arend.vanspriel@bro=
adcom.com> wrote:
>=20
> =EF=BB=BFOp 20 oktober 2026 18:02:30 schreef Jason Perlow <jperlow@gmail.c=
om>:
>=20
>> NOTE: an earlier report on this bug from us bounced off one of these list=
s due to HTML/multipart formatting from the mail client used -- apologies, s=
witching clients. This mail includes the full original report plus a follow-=
up, merged into one self-contained report since the original never reached a=
nyone.
>>=20
>> =3D=3D=3D ORIGINAL REPORT =3D=3D=3D
>>=20
>> Hardware: Intel CoffeeLake-H platforms, various. The affected device is a=
 Broadcom BCM4364 802.11ac PCIe wifi adapter (14e4:4464) at 0000:05:00.0 on a=
n Apple MacBookPro16,1 (T2 Mac). Aditya, including you directly since this i=
s T2 hardware; copying iommu/pci/wireless because the fault signature and th=
e fact that it reproduces on only one of five tested machines (at the time o=
f the original report -- see follow-up below, that has since changed) looked=
 like it needed eyes on the core IOMMU/PCI path, not the driver.
>=20
> [...]
>=20
>> THE ONE ANOMALY WE CAN'T YET EXPLAIN
>>=20
>> Despite the last two items above being unchanged, the actual generated .c=
onfig has CONFIG_INTEL_IOMMU_DEFAULT_ON unset after make olddefconfig agains=
t the rc7 source tree, but =3Dy after the same process against the final sou=
rce tree, even though our template explicitly answers "# CONFIG_INTEL_IOMMU_=
DEFAULT_ON is not set" in both cases. Our working theory is that some other s=
ymbol started selecting/implying INTEL_IOMMU_DEFAULT_ON between rc7 and fina=
l -- which would override an explicitly-seeded "not set" answer during oldde=
fconfig resolution -- but we have not identified which one yet.

intel_iommu=3Doff has the same effect as disabling this in the kernel config=
. The real question is WiFi was still working before when intel_iommu was on=
.

I wonder if PCs with Broadcom chips are also getting affected since we have a=
 confirmed report of a non T2 Mac as well.
