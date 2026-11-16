Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847255;
	b=YwXyIi93NRgTxvvUjIPepJRDb6R1CgqFDtKAnmo3EB51c/M5e4B4GfvaDToTE8fteFaR
	 DqT80KkoqVU5kskA1jWZyg/dLVMWIViXVtvigudKttJcX0E/1OtHYESigMGgM/1cTejvR
	 xFnCtto0F7xR/q1BWO2UlOkPT17lfY68ZdjMfXvdYVOtKa/LhFGwDQ9bcyh+91sAzMgfy
	 gq8c1VINUsbrcHmLJBiemGkapkwjFrHq+9z0ILVw6UrSTHX6UlhRxiNUyn3gPT+yz1U+l
	 uO/VcDzmY3kiQEPC31H9ptNNZCz99lCOkVdPq3paxGs1ivP/M0DwqRKXKtDPQHjFOSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847255;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8T2UQ097opql0CaPE8KovI4g8l6BJk5bz0zKvscODXE=;
	b=V4LJWGnPGXcTydGQMW7MLXM+FGQlr+C+ChiUyS+WIulrDg8zXHg1vUioSw0Yqr9PzDul
	 xzbmAAiHfoogUETEZJD5C3CUu6BzY9uIfpxxfROqDZvLIf/ojHtRz+S1F7NZGDig3SHt3
	 tdJlpwUJ8o+Kjs9Gn0AdOFwdn6YVyRnxc/CGeA0oWevXM7D6weSTFK5GLlUv4QzM5kWda
	 HFmJCXwIm5bf2xgWFE4y1jlI8fbX32quogOxzAfkUNfLUDSPJY0dmFWYuUyUiw8O5btGu
	 XtMRk5gmzVtd+IyuzawnMkzPdcL6F9cYR+NFoQHNC4O/R3pLT3uHtkEXO3xa8/WGGWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=empyreal.works;
	spf=pass smtp.mailfrom=empyreal.works;
	dkim=pass header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b="RuJXcWu/";
	arc=none smtp.remote-ip=185.70.43.17
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DE1606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09DE1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=RuJXcWu/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1794847253; x=1795106453;
	bh=8T2UQ097opql0CaPE8KovI4g8l6BJk5bz0zKvscODXE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=RuJXcWu/gKgdpT9lViVFs2X9SJVWsO0CFrZnIspEGbJ0jhF3692zF+A3j8K9OrLMO
	 d45S2p+NpGhdiS9cRY/ChcV0ee8GrtAcjNfPe5ce1PbooW3ZWJ1SpcGkuJ1i4JmuZO
	 yGoduaTlPvAN3kW2LcqiVxf8eBzsViptmlRExkE2Ml95bVdGM4/hkiO02wR8o8IIsN
	 tvDZecF1I17vR6EhEWLRKH7IVIa7YoOto17hpaLfJx/ThbsrZt8IyPXDcnAGSFNsPe
	 QxoPahRNsafZ8vcudbsvoLCWRfQLy3O4eAKcNAJ2T3+HU5dK+RTnXi7yR4sIMrAGwW
	 bNEjUK4zpb4aw==
Date: Mon, 16 Nov 2026 16:40:47 +0000
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: Johannes Berg <johannes@sipsolutions.net>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Kalle Valo <kvalo@kernel.org>, Ayala Beker <ayala.beker@intel.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] wifi: iwlwifi: keep Wi-Fi when Intel AMT powers the host on
Message-ID: <cover.1794846777.git.arc@empyreal.works>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: 73c86a630b473a4c67cd4238fa6c0bdc3382c1bf
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

With IWLMEI enabled and AMT's wireless enabled, the host can come up
without Wi-Fi after AMT powers it on: CSME is still handing the NIC back
to the host while iwlwifi probes. On an HP ZBook Firefly 14 G10 (AX211,
CSME 16.1) this happened in two ways:

 - the NIC cannot be woken at probe while CSME still drives it, and the
   probe fails with -110 for good (patch 1);
 - ownership moves back to CSME between the end of the probe and the
   op mode's start, which then fails with -EBUSY (patch 2).

In both cases the SAP connection to CSME is up, so the host can take the
NVM from CSME and request the NIC over SAP, as it does when CSME visibly
owns the NIC at probe.

The series applies to iwlwifi-next. IWLMEI depends on BROKEN; it builds
with CONFIG_WERROR only together with [1], and binds only with [2]:

[1] https://lore.kernel.org/r/20261116-iwlmei-nvm-const-0c16d1de@empyreal.w=
orks
[2] https://lore.kernel.org/r/20261116-mei-cl-dma-parent-60802f47@empyreal.=
works

Tested with both patches on that machine. The failure in patch 1 hit four
of six AMT power-ons and resets before it; with it, AMT power-ons came back
on Wi-Fi 36-48 s after Power on. The race in patch 2 was seen once in seven
AMT power-ons with patch 1 applied (after about 20 minutes off) and did not
recur in the three power-ons since (after 0 s, 2 and 33 minutes off), so it=
s
fallback has not yet run on hardware.

Andrei Rusu de Castro (2):
  wifi: iwlwifi: pcie: use the CSME path when the NIC cannot be woken at
    probe
  wifi: iwlwifi: mvm: take the NVM from CSME when it takes the device
    back

 drivers/net/wireless/intel/iwlwifi/mvm/ops.c  | 13 ++++++
 .../net/wireless/intel/iwlwifi/pcie/trans.c   | 40 ++++++++++++++++++-
 2 files changed, 51 insertions(+), 2 deletions(-)

--=20
2.55.0

