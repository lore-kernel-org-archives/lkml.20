Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923290;
	b=mlyWB8WyZpBah+fPI9hvFK4r9c2/TQ7K7FSHsKMlvel1naT6WTFqytohPj6erTfT0Fev
	 S0AKKBcPjvEq7yC6g7qOuaPLxy2M6xNwyqTFUuLb73jgIM8l/Z2DCKH9mFlQDP2CDmE0X
	 E7r9v2wh9f3YYnGhEITJUMGY7GGBytyTuC6SeV4qcxeszHlqiGWpWlktH9Ij9ZtNMu+gd
	 8v1/vbP3ThHguQbRZSOFyyyueR78608RFKvHlLMv4pHObVJNLB1ZJS0EMaCeWsOu2+w0r
	 rBe1T+tYm2aeBV+yHrr07M9L73DOgxxx2EoDSVS51IZo1SyAsYjTV6rAyybTceFZTtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923290;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=eZZUM9YB8PMCl+JKN9NrZ4U0JkC5KAvryISSRWv1/Hw=;
	b=m4FrLSgTAQ/AReHA647DcjzHuqMABoanVYNR77PFrVmrmrJuvxKxFppRdx0glKlUISOj
	 IxYpHCw16j1fUtZQkK/Ds+hsXUbndvs8mL5vvmJFCqY1L8UEwLx+8HUXGCaFcTBMoCYZi
	 QsvFEF+YW//x+uyk+Ql+tEVx8leifLVbYDxfhUPJAslV3cIg524fzG++qJ/vYErAYc/rr
	 xPhvx12G6fpNJzvC5toiKlDM/AGI+8A17P6AxIMUTuphDsu6YJ4n0Hc/anV1Vo5u6kYfj
	 mkg2K6kKMNf4+TGa5oCo16iKGCqz/SNRnjuN+C03+kaXd22vTDk4Z/ffbPtYM8TcfiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PvIUBGhZ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DD9606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3DD9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PvIUBGhZ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A23E21A1673;
	Tue, 17 Nov 2026 13:48:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FFB05FC81;
	Tue, 17 Nov 2026 13:48:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4053A11BC0024;
	Tue, 17 Nov 2026 14:48:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794923288; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eZZUM9YB8PMCl+JKN9NrZ4U0JkC5KAvryISSRWv1/Hw=;
	b=PvIUBGhZick+POTs/Gp9cj6M+DZvZtPrOylizZsgMTQQC1zD1jtAz736xHptxVfWiLmMJ3
	kQATMI/JiqOAJ3OzlfSqwvbMhHM2c+5Q3G/Csps0C45IzRkVXOqUCxFw3WBb6D2I9cdqEt
	5m9XKPuPv4WJPXA7Kb4+VIOPUSgJ1N812YxPSjFtOqCEfAx7f64X1PNyVkjiJkcL0n83oh
	eZ2jWlPUBksATe+34leG+oxUS5zJhmVc7q4RjJJjleZhN5+YlAjXaq5W8kn5KMsxAOxRAk
	n04i83fTH7ziHFlsR2cv+MiT+Pgbhij99tKEHrGBJ4czYc1BqbxdbtCn4XiwKg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, Orgad Shaneh <orgads@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261107174940.3323868-1-orgads@gmail.com>
References: <20261107174940.3323868-1-orgads@gmail.com>
Subject: Re: [PATCH v3] mtd: cfi_cmdset_0002: also clamp the write buffer
 of an x16 part strapped to x8
Message-Id: <179492328718.2243972.12776553428549966068.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:48:07 +0100
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Sat, 07 Nov 2026 17:49:39 +0000, Orgad Shaneh wrote:
> Commit cfc5ebc9540e ("mtd: cfi_cmdset_0002: cap the write-buffer chunk
> at 256 bytes on an x8 device") limits a Write to Buffer to 256 bytes
> when cfi->device_type is CFI_DEVICETYPE_X8, because do_write_buffer()
> sends the word count as a single bus word and an 8-bit data lane
> truncates it.
> 
> The M29EW that commit was written for is an x16 part strapped to x8.
> The probe reports it as
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: cfi_cmdset_0002: also clamp the write buffer of an x16 part strapped to x8
      commit: 760d2efe91a84363d25c1051a10572242e75fe86

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

