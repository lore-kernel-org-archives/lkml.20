Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177302;
	b=xPzbeETlL6cS2IDoIxRYa1yAKNXnrB+OHxhJbYVteC0mU6P408yBTvAEIw4of/lqPirx
	 0YoFDPY6xK1QPd0ZrClcuSyvwYwbb9Hs12fTCKhQNOhQs6nPkUhj+BiJJlRUTQyKzCdLD
	 3K/kWLPAMyv74imb1rY+Z7XMXtslji5D+xvLSyPfV+QArWDYurxj1Nd1hVDMMS1qotReG
	 LEqIniNSjQr/Fj5JV2Bz8HIyVZ3IfwuEOrtcp+m++SuCXdY7T1LFr33sgQW18a3qrmEmg
	 d29Fe2WUcIjpO3B1NLGJP7QDf4tvnAoco7SYnYwxg3dkNY0Uc1twbDXnshkZAI2szXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177302;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=xSPXxSyd2E8x1X/YeNrtU2m1jId4G0QIOdjQ9fsQ2E0=;
	b=3nLp8/WKuuB2MyMgvKAiZw+fMBI2rXl3lr9Tt0c7+GKwo/80FJuQ9145G7rRhtB0CjF+
	 VM0OROlGeAsLQLubSyvQA+PCps2/Kg3ejJU6Q+uqf5PtKs6pzKNMpECM5Fe6oeDzuLy69
	 FHLmZoI6x8kFxttiQtwOp1WT3GIdYVLzB5E7z5fCzQ4C4pDpVCmfq94KBjLEbORoWOuS/
	 qmucPS+QzrrIZZeSHHEGMZfV/jYq/RCENO5aNJ6qlydJb1icm0mh8QKn4dJ3sy0lutqrj
	 BoUscbz3KBep6EZK7YofAH4tLi07oRISK4rKT1zc2Nb79iJD3+Lf3GzwyCSKQ9GvDJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=mayn5dr5obcypefcvt5afqfrri.protonmail2 header.b=Rm9Gohr2;
	arc=none smtp.remote-ip=185.70.43.166
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5339C606A320;
	Sun,  8 Nov 2026 22:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5339C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=mayn5dr5obcypefcvt5afqfrri.protonmail2 header.b=Rm9Gohr2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=mayn5dr5obcypefcvt5afqfrri.protonmail2; t=1794177299;
	x=1794436499; bh=xSPXxSyd2E8x1X/YeNrtU2m1jId4G0QIOdjQ9fsQ2E0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Rm9Gohr2fOADzNMR/La/WCaSQYK9YsloggwEr7MSK9JQW1gwsYN5PLHQABzYXXj5T
	 4qf3udNGuBbg7GudZNf7Rhqm3GGqz/nsDs8x4YJMySp7GQUIQCSVc1BK2YX5Oijlae
	 +V33r2qaTCnqMPLeUUhj7ZXnS6RTDfdR7jLSSPYfeE5TXVYpk0tkd/oox3ueod3y1i
	 okdTTpg/vq20gubZRrSdqUXhRblxNW1FB1V8zNF8D90v+7M6xojSevsfyiY5tsKgZw
	 F0u/lgUABjhyNvmzFQTciF2Eax2+KrO4Y6U7w7Rn+iZukDyAm/DK+xGwkLitAJptnZ
	 A/ru2iLl3cTIg==
Date: Sun, 08 Nov 2026 22:34:55 +0000
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
From: yphtno <yphtno@proton.me>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Fw: Re: [BUG] ath10k_pci: QCA9377 reports recurring PCIe AER RxErr/BadDLLP errors
Message-ID: <SwgcbPjihOw1Rg6sRhFygWxCgxFEKswuvbvFpC22y64m_2UH4QBXwEDYRlR0rrik4aZ0-EUGnFc3etEWDjF81iDFqICvEegMLLn7T_fHq8g=@proton.me>
In-Reply-To: <EX3FulMuuu9uyQAv-TAn5MCVKf4Y9Hdw3DSQVKzb86lJo5uETxcrMlXxMUdaRsPvODlBfAVBj5V1XfNx1cPkVh317NOzXF5RWB6_Q3I5IcE=@proton.me>
References: <EX3FulMuuu9uyQAv-TAn5MCVKf4Y9Hdw3DSQVKzb86lJo5uETxcrMlXxMUdaRsPvODlBfAVBj5V1XfNx1cPkVh317NOzXF5RWB6_Q3I5IcE=@proton.me>
Feedback-ID: 175109102:user:proton
X-Pm-Message-ID: 9f5fa3358e5dbee5a0e9a32a38c4ff8a75f963b4
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable




Sent with Proton Mail secure email.

------- Forwarded Message -------
From: yphtno <yphtno@proton.me>
Date: On Sunday, 8 November 2026 at 2:14 PM
Subject: Re: [BUG] ath10k_pci: QCA9377 reports recurring PCIe AER RxErr/Bad=
DLLP errors
To: ath10k@lists.infradead.org <ath10k@lists.infradead.org>
CC: linux-wireless@vger.kernel.org <linux-wireless@vger.kernel.org>, linux-=
kernel@vger.kernel.org <linux-kernel@vger.kernel.org>


> Hello,
>=20
> I am experiencing a similar issue with a Qualcomm Atheros QCA9377 wireles=
s adapter using the ath10k_pci driver on an Acer Aspire F5-573G.
>=20
> I found the existing discussion about recurring PCIe AER errors on the QC=
A9377 and wanted to share my hardware's behavior in case it is related.
>=20
> Hardware:
>=20
> -   Laptop: Acer Aspire F5-573G
>    =20
> -   Wi-Fi adapter: Qualcomm Atheros QCA9377
>    =20
> -   PCI ID: 168c:0042
>    =20
> -   Hardware revision: hw1.1
>    =20
> -   Driver: ath10k_pci
>    =20
> -   Firmware: WLAN.TF.2.1-00021-QCARMSWP-1
>    =20
> -   Kernel version: [INSERT `uname -r`]
>    =20
> -   BIOS version: [INSERT BIOS VERSION]
>    =20
>=20
> Observed behavior:
>=20
> The Wi-Fi connection intermittently fails during normal use. My kernel lo=
gs show recurring PCIe AER correctable physical-layer errors involving the =
QCA9377, including:
>=20
> -   RxErr
>    =20
> -   BadDLLP
>    =20
> -   Rollover
>    =20
> -   Timeout
>    =20
>=20
> I have also observed the following ath10k message:
>=20
> `ath10k_pci 0000:03:00.0: failed to flush transmit queue (skip 0 ar-state=
 1): 0`
>=20
> The firmware appears to load successfully.
>=20
> ASPM testing:
>=20
> I have tried booting with `pcie_aspm=3Doff`. It sometimes appears to impr=
ove Wi-Fi reliability, but the connection still fails most of the time. I h=
ave not yet completed a controlled comparison, so I cannot confirm whether =
ASPM is responsible.
>=20
> The issue has persisted after reinstalling Arch Linux.
>=20
> Additional information:
>=20
> I can provide full kernel logs, `lspci -vv` output, BIOS information, and=
 perform additional testing if needed.
>=20
> I would appreciate any guidance on whether this could be related to the e=
xisting QCA9377 PCIe AER issue, or whether further investigation is needed.
>=20
> Thank you for your time.
>=20
>=20
>=20
> Sent with Proton Mail secure email.
