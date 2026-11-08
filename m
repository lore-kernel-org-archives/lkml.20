Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794170199;
	b=nvg6J3sNk0OsTS6idt++ZxpOv6sWY0Z+v/5+VuYiI4z4PhS8YfBXGotMqFE1jqLPTeIg
	 lCxs69SkovS8+DLz8wR16SjetSheUlJbL8YlfEtqWEUj51Qeoec2Nzb2P1s6SMATL9m2T
	 oSoJG2udidqluylMYN6H50pH+v4EqiFNyzRr3x6Lbb7CIS2cSmC957LGVYh+TmpzawPWE
	 9p2a48nFQ2LCvbFA3eLAgPDkEOT/oQhC8bnyGKEpKrMeHRwOkVvHd2dzjM5s8GM9GvXwg
	 lAqxDBcLvTu8H42+V3tlRIe3DmczOFLyUTTfJ1h6XnOQOWLOTnVJx/kEyYB4uyVlvjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794170199;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=9YVvd2ias7oqjMEqARskIvZbwtnDIqdVNAS8nBJq/RM=;
	b=D3/SZD3g9UueEjYosj9sd7yHXuJrJ53to8YJvUkRXsa1knnfgvJISxBMU6eIYTNe0t+4
	 ou8RVI/XPEfZJptYV98F5bjIljO04RQ7TZFxqG9TJYYb9zXv6lzvRekYTnjTdpREoLMEC
	 fU/521H+rbkvG1twUAX63aSdlhK3C09uBivQonJDzNjvBtNHx9mIm9meo4e7xlfq580O2
	 9VpFaprB8npfUpZcuDTbirqKRaEQGmgraZOCPIRqH+kD8TWgpPh29RFmKrtNO2nnDhylo
	 s0ZmZGQCWlw5Vxgq92YV4FK+Q9RD1KCd1jguCP6Rdkg94g6zQbRsBJ07Aai62ASBdJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	dkim=pass header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=VcrKSNtR;
	arc=none smtp.remote-ip=109.224.244.117
Received: from mail-244117.protonmail.ch (mail-244117.protonmail.ch [109.224.244.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37AA606A9E9
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B37AA606A9E9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=VcrKSNtR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1794170196; x=1794429396;
	bh=9YVvd2ias7oqjMEqARskIvZbwtnDIqdVNAS8nBJq/RM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VcrKSNtRHM35HUJnEbg+LcDHgpyT3/Qqt+mbnfk6UWUnPLLFPdBywz/BsjHRayRiI
	 JYTOIXPjvSRo9y4tQ61qFFUlI3MoqaKY0SZVRJByoeCoXhr2Yfkzl2suR2Od3wSdSg
	 +1B6S3Asv07Rf0OxO+a2cj48yV0ywnOR9AxSBpXlBkYfe5jdqGIpT5/kQO0dbHR2zd
	 ZolRnqe/DypZgAjD/QYjCjTpRl33lxojULfHd5qtQEMnnP4ssebP04B715JegOKV8s
	 czlRvscVGwK3y6vXoSaZuvWUcbaqRHqT+mv0bDz93lGLwNzl317Nw7U3hOTXOl9SuU
	 UlqAniVxIScfQ==
Date: Sun, 08 Nov 2026 20:36:32 +0000
To: Julia Lawall <julia.lawall@inria.fr>
From: Chad Aldreda <ca@modelmiser.com>
Cc: Nicolas Palix <nicolas.palix@imag.fr>, cocci@inria.fr, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coccinelle: api: add a checker for device nodes in devm_ memory
Message-ID: <20261108203625.2517017-2-ca@modelmiser.com>
In-Reply-To: <18f23c2b-d76a-8b94-bc4d-f298354c8f8b@inria.fr>
References: <20261106193517.3267013-2-ca@modelmiser.com> <18f23c2b-d76a-8b94-bc4d-f298354c8f8b@inria.fr>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: 397ed8c69a1c40a50facf91283c12a512d61ff6a
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

On Sun, 8 Nov 2026, Julia Lawall wrote:
> I get the same result for
>
> spatch --dir drivers/media/pci/intel/ipu6 scripts/coccinelle/api/devm_fil=
e_reachable.cocci -D report --very-quiet
> spatch drivers/media/pci/intel/ipu6/ipu6-isys.c scripts/coccinelle/api/de=
vm_file_reachable.cocci -D report --very-quiet
>
> Both report the line 990 issue.
>
> What version of Coccinelle do you have?

It was 1.1.1, the Ubuntu 24.04 package. With it the --dir run reports
nothing. I built 1.3.3 from git (11b93adb6), and with it both of your
commands report line 990, as does the --include-headers --dir command
from my note, so it was the old version.

Over drivers/ with the script's Options line, 1.3.3 reports one site
more than 1.1.1: drivers/misc/pci_endpoint_test.c, whose probe function
1.1.1 fails to parse. I'll redo the measurements, including the -j
variance, with 1.3.3 for v2.

Thanks for the pointer on the parsing nondeterminism.

Chad

