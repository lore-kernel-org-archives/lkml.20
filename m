Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net [178.33.251.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1438C3BB100
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.251.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790621541; cv=none; b=Nd2FqOQ2R8s+uz9HYDHYfUhBwStNCl9yEPPbLNlulpr9jVpk3ZbC4u5qwJpRRU4Ll9ayKVdTI8jHxcaorzEoHPkQPos4K3ziWNAZitmlbTojYtKo4qDNySP26RZNVjm/dK84fIQ7zIzRQ7zrFf50EV/VKpP7edg2f1CWm4rO2qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790621541; c=relaxed/simple;
	bh=88rVedFhxqOdR27x5I0bHCtoN2wziyI967j5BXtuKaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FB8J8wGkqzO9wP6rs1aKamFLs0S1f579vo2LfogtxC2cIBLWwHivlOHZ7ZyTCdZLQxi2rpkOr4LezpVyhrowjWU/eBiCQxMIZWcpa8VRHfy5xZdaFik/M13Jdtl+8yORjosVK2UxuPLYlPUtmCsXA2ZujRoYHVeF6BpHZjcIB0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bobtopus.eu; spf=pass smtp.mailfrom=bobtopus.eu; dkim=fail (0-bit key) header.d=bobtopus.eu header.i=@bobtopus.eu header.b=UJYZepi1 reason="key not found in DNS"; arc=none smtp.client-ip=178.33.251.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bobtopus.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bobtopus.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=bobtopus.eu header.i=@bobtopus.eu header.b="UJYZepi1"
Received: from director11.ghost.mail-out.ovh.net (unknown [10.110.43.232])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4htmmw1LKpz5vmQ
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:22:40 +0000 (UTC)
Received: from ghost-submission-c7b579475-dl7f9 (unknown [10.108.42.126])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 05712C297E;
	Mon, 28 Sep 2026 16:22:38 +0000 (UTC)
Received: from bobtopus.eu ([37.59.142.113])
	by ghost-submission-c7b579475-dl7f9 with ESMTPSA
	id w+6eLk6UumpwvxEA/ZOadQ
	(envelope-from <bruno.boi@bobtopus.eu>); Mon, 28 Sep 2026 16:22:38 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-113S007973b7cbd-cbc1-49bc-9eff-a8abd266efe4,
                    99F57D8295E04052021F6BE73B89593FAD7611CD) smtp.auth=bruno.boi@bobtopus.eu
X-OVh-ClientIp:212.68.233.96
From: Bruno BOI <bruno.boi@bobtopus.eu>
To: mario.limonciello@amd.com
Cc: Shyam-sundar.S-k@amd.com,
	bruno.boi@bobtopus.eu,
	linux-kernel@vger.kernel.org,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86/amd/pmc: Add Thinkpad L14 Gen3 (21C5) to quirk_s2idle_bug
Date: Mon, 28 Sep 2026 18:22:29 +0200
Message-ID: <20260928162232.714426-1-bruno.boi@bobtopus.eu>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20c15bb0-abf3-4a34-86e5-712f8f131acb@amd.com>
References: <20c15bb0-abf3-4a34-86e5-712f8f131acb@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 10687041917137784582
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTFjQfW8CHoeRMXHG+tc8jIyH5nK+RO+OBkvOxHBFrCEpPIlM7YRXOYuxybRXGVpiC/YmQsuC93G55NNjG37BnCd9kFN9HeFhXhJA5WIv9I/5MDozs6pcIspqJN/2OZjXBGaUDUbbna3pIjRuoCPJNVQOvPNt9nvaeYzML7xxRU+9KApTDk0gVAHR3vlMfV84QXI2dHRczTBkesoOnFPoRU4RL/A5QYk9iXHlrfKS1xwVEMFZx2xQgIsWlGqCh7jn0mX7PFbdMQ0SZK6lQ55jQ5b74Vd05DHxqkaqOdm7hojpstj9tWyJSwmIfQgXOCbRwKHJgcZLTDO8ivSkZ6izAXmTIjqOnYYxO9zuvgvODdKULnF5XLIEXgbpGLEfwwUFd/feijd/01h/WDezqIYOOxi9nd6yWklsOem1mKaHs3NpO3y5NbTVZRAcFpWJylyr3W/XjD/K9BA7m9fi3CHOcM0gITUqHHkRxptIhOPmU5z9dmtjdYdp5ZsJvddpXRLhAeK8HtodBhtK+flk1GhmnxXmimCrXMwj6qmnJAKhlXMTPCNwgTSEZBjehG2KTgXtLFY+coxEI0KO3M+E+j5Gi7JNxBo5Wj3qtjuR0yAGwe8vOQUHzqJ2N3SCXM8v16IrR24jS9y+RjIKRNmnMzxC62icTNGq8KhxpmdRzhYdX6e6Q
DKIM-Signature: a=rsa-sha256; bh=88rVedFhxqOdR27x5I0bHCtoN2wziyI967j5BXtuKaQ=;
 c=relaxed/relaxed; d=bobtopus.eu; h=From; s=ovhmo3865769-selector1;
 t=1790612560; v=1;
 b=UJYZepi1dIrG8WWKXunnXf73Ys7uzN7n5njEzgYJ1JG7FTuXgMCqL1oA7HprrYJ6KphdyrfW
 qcrZGrWjZgPCGUsYG+ZWttRhkdBasCzX+1jcy63BbZ1w0yTf64b0gved15NnbjsfDpSCPxx4lIV
 bJQZW6ZG3WZVLhfA+i3DXkT4Y7FKBXXHiyKiYssX/xw72dvrSwAlZBTGFPEJ5skrYCDpQezEuJq
 yrCrcdD+2d+iuJKa5K/ykNCoPxYGBACGplWsAEut+pAOkr+N/NgbPWf5rIhOfeLXdYbSLie730e
 Cf6C6kqVend8wLCIQxm8sKn2x2TswlSVojCQ8uls6Ap5Q==

Hi Mario, Mark,

On 9/28/26 11:09, Mario Limonciello wrote:
> Mark,
>
> Since it uses prefixes rather than a new entry how would you feel about:
>
> DMI_MATCH(DMI_PRODUCT_NAME, "21C"),
>
> On the 21C6 existing entry.

Works for me — and it should be inert outside the AMD units: the "21C"
prefix also spans the Intel siblings of the L14/L15 Gen 3 family, but
amd_pmc never binds on those (no AMDI0005 ACPI node exposed by their
firmware), so the widened match can only ever fire on the AMD types
anyway.

Happy to resend as a modification of the existing entry if that's the
preferred shape.

For reference, the v2 as sent was tested on 21C5S05800, BIOS R1YET62W
(1.39), kernel 7.2.8: the 7-10 s resume stall is gone (kernel resume
in under 100 ms, A/B tested against the stock module on the same boot).

Regards,
Bruno
