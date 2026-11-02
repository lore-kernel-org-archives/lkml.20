Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793663220;
	b=YgF20+glQuoZ6PNmvD9ttjWCOcILbgx+vG7GipzGWS0cedu2tee+zfMp+Eff/jPEyIp0
	 dRiXUVR6wUcGbMtrhEx6uJPKDrb/gGZDNC0Psda6rVor615CxVdsuXe5Qe8RqiooLuH+7
	 p4OUM7u1b+Ab5amGR71OTVe/m6H+Ng0LvXowu7pw5eHpe+Qgg5pdnHGxKTgDTzpnYlkJJ
	 UusZtt39HB1Y0z5z8q+ekiNWPsXckvtwhUZ+stTyuH7JpHq962bDoi9+yLydzB/tmHahI
	 IA7jxojQEDh5GIOzBJJWo/c2qjapUbL/x3WedMI87PqGEtemKj7f3GjroT7veO95dow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663220;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/bS9d/i1gRSbcPUFuyM/5xepf438giKbQf+2Rto7XOE=;
	b=hFQHdXk9qtoEl/QF+h6cZrWXukLeMHG3wvdDqOqqgSB/VULanhZHKw9YbJdINs7tKmVu
	 DYSGD4SrkNBnvubv6Rd+KWob44y1LnpwfaWXcrM4eDTNUGTGTLzF64Rmxd+Qw42Dxrgf4
	 6U3vuPX2gCTtX6OR8uJIaPqwB+UJvNEWg10M0r8AzxctAeQRZtXr2iyTRLQhRVGrBjQV+
	 O7WRZkWW3SKF3hRJNm7oLNaY1JpyQdjF51eDwl2nLEA9aCEMwZDtN6HjbKPYZw96w8l62
	 j6YRRCj2PXRW1uhzeX07p6mwBUUdhbvk06L4elX/FBqY4D9D24JHgnv9FKpGMSOUfPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CB2606A326;
	Mon,  2 Nov 2026 23:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F331F00A1D;
	Mon,  2 Nov 2026 23:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793663219;
	bh=/bS9d/i1gRSbcPUFuyM/5xepf438giKbQf+2Rto7XOE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=CuB+cx/+5nTpMOcM0Ac6b6u+gtOLAjDlHaVaVtoOiUv/qOcV8am/60fkrcM6mRFVe
	 4EoWHYlPe18iJvg4fEtBxXLZPENp0Brc35+A21I30otPM9h2lrTIEqLxa2rwCvJNgg
	 1Dsv4jGGUUvmNAitHmB9NoH30CKiZXVlJvxFF1sUFT8SzuJJHJSQUCUmcBE8Ur5j7r
	 kpz0xCE/o4jR3bRgpidydwbZwuhW4sI3Z4nCGichni73eXJR9MOuIAIbLzywz36DQJ
	 QTnGP8EntnGV1qfbfj3I7KAE7FtQ7DtWmmMklL4fZUMALCrp1AqFlpOa22Wrw8aiGE
	 e+C1JdBPvjClQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id A4C83253936F;
	Mon, 02 Nov 2026 23:46:56 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/5] ASoC: tas2783-sdw: use the BIOS speaker ID in the
 firmware name
From: Mark Brown <broonie@kernel.org>
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: broonie@kernel.org, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261016232416.2628603-4-matthew.schwartz@linux.dev>
References: <20261016232416.2628603-1-matthew.schwartz@linux.dev>
 <20261016232416.2628603-4-matthew.schwartz@linux.dev>
Date: Mon, 02 Nov 2026 23:46:54 +0000
Message-Id: <179366321499.2186205.14199496267448130552.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2334; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wKCmLbHI8lyzBYlxNSptjlmqgDludI0jRe8B7YwGQjI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeKnyYwd5dWL3V6P3zPocPeQutPQq+t9xW4eBIP1xkz
 LrkJmNCRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACbyvZPhr4xmq1OKSeffZekh
 LLv0NfzvOFwwdV/kzLNHbpdOcteuuQz/43Z3STmxdhs9L7ofr1b3PHvFEYedcRe+duzVep3SLKv
 ADAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Some boards have TAS2783 firmware in linux-firmware named
> SSID-SPKID-LINK-0xUID.bin, with a speaker ID ahead of the link ID (the
> HP 8EA1 has its amps on link 0 and ships 8EA1-{0,1}-0-0x*.bin). The
> driver only builds the three-field SSID-LINK-0xUID name, so these boards
> never load firmware. On the ASUS ROG Xbox Ally X20 (SSID 1954) the BIOS
> provides the speaker ID in a 4-byte SPEAKER_ID EFI variable, and only
> the four-field 1954-*-*-0x*.bin files exist.

> Read SPEAKER_ID once and request the four-field name first when it is
> present. Boards without the variable keep the current names, and the
> unprefixed three-field name is still tried if the four-field file is
> missing.

> +static int tas2783_get_spk_id(void)
> +{
> +	efi_guid_t guid = TAS2783_SPKID_GUID;
> +	unsigned long size = sizeof(u32);
> +	efi_status_t status;
> +	u32 spk_id = 0;
> +
> +	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE))
> +		return -ENOENT;
> +
> +	status = efi.get_variable(L"SPEAKER_ID", &guid, NULL, &size, &spk_id);
> +	if (status != EFI_SUCCESS)
> +		return -ENOENT;
> +
> +	return spk_id;

This returns a u32 as an int so if someone decides to pick a very large
value it'll look like an error value.  That's likely unrealistic though.

>  	for (; dev; dev = dev->parent) {
>  		if (dev->bus == &pci_bus_type) {
>  			pci = to_pci_dev(dev);
> -			scnprintf(name, size, "%04X-%1X-%s%1X.bin",
> -				  pci->subsystem_device, bus->link_id,
> -				  fw_uid_prefix, unique_id);
> +			if (!tas_dev->spk_id_read) {
> +				tas_dev->spk_id = tas2783_get_spk_id();
> +				tas_dev->spk_id_read = true;
> +			}
> +			if (tas_dev->spk_id >= 0 && !tas_dev->fw_use_fallback)
> +				scnprintf(name, size, "%04X-%X-%1X-0x%1X.bin",
> +					  pci->subsystem_device, tas_dev->spk_id,
> +					  bus->link_id, unique_id);
> +			else
> +				scnprintf(name, size, "%04X-%1X-%s%1X.bin",
> +					  pci->subsystem_device, bus->link_id,
> +					  fw_uid_prefix, unique_id);

Mixing this in with the fallback decision seems confusing.  There's some
cases generated in the Sashiko review which look plausible though I
didn't fully work through everything:

   https://sashiko.dev/#/patchset/20261016232416.2628603-1-matthew.schwartz%40linux.dev

-- 
Mark Brown <broonie@kernel.org>
