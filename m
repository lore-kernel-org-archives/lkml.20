Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632646;
	b=r7nlugppjxf3+fPOOwlk9SrpO2sO6UjnUiU/VacE5dNuABAvIMjmIu8eMQ6jncqiwv+e
	 YJWFQv5aRfQZbKlFE2sr33n9DmnNfcUgIFWyRDwY2ymlFj4musxxO3IqhCG5XrjrOcflf
	 ZjoC8zYH2EbuAPRQBc2YrsgwVMqs+1rglP1NFcVVmQwCI8y1KAiz5oTw00rsg4p7wSbLH
	 pTD352Pf1HAVkAJr8jHxPKa6kVOtLCTdOZcM0LpZaP4BJUh83P4utQsEMCjoxd1fWVsUm
	 QvbXFPillEmUuCluUtNe1Id1RDsep89BIHV5Ss1YqZCU/SUJEZQ+VagKTX4SEjAm7cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632646;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=xuhqBrKW16db99x31+Khr64qplFD0yF8QwhweIPseAE=;
	b=S4pmsPlqtSm1Zu6lO+oFniaVgr5pZv8kzhLHMIuTy3Gh8w3qIilkyDGAP1snzIRPBX7F
	 OerzT2Mxtv7jPX8I/gbb7DgTiC7RnfcaUxp+0toLwFBMbDFkIc6gHP/dt7jqw3O4wvcAN
	 cCM1b9zPmlj15AijO8tv1QirgUcIe48SAIVU0oR7HsndwjR2kpBgkVnPBWxy+1I2LhdcY
	 k5E2uN8PAJ9dscmGSE1BpskCRogIP/I7nSUqkjyqH/QYKMKwW1piHwpJMA75xAI+pEl9q
	 U18k3QSLclDNnC75EC3cdxYF9st2udLuvTTA7WFtCgWlxQAkKhIZCNiaitxqYSTfhXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580FC606F3F7
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 580FC606F3F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14394530ec6so3880298c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632644; x=1794237444;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xuhqBrKW16db99x31+Khr64qplFD0yF8QwhweIPseAE=;
        b=vqCj1ArXFUzTV6fSBnYxabX5dxFwWfgNOBRnZP9r/5SS3ngPRO90ixnYf+sWei9EjL
         I8jOpD+wxJV0UZYQnBa3OOaBOotDnfIA0HX8SXHBYaTCXykk4bqvMbt6z4GyfRqJNpTp
         FwtyNRB350dx08qwYvTvZ/ggzf0s7FntGK/G0+J6dPpIQNTl7x1cuf7OcTCuyrWN3h5X
         jw3gusi26n5o9oIiGeye+cSewGU60c4v1WJRRWE+AvfX2XxiCGpfHjRLBHPDvZHnfjM8
         COjXfvC3+H42Ccdx1jJaq4/GHq4K8ihISW1h0NtZBmNcZw/+fv7nYWtKxFBKduPyJMik
         gXZg==
X-Forwarded-Encrypted: i=1; AKwUvBx8FHMCaR004hgPumcNvXMWzZd8DRrqbonMdeyDJO+TjypARj+Jl3FGHQPgCnMkZDExBZvWpM1Dpsgy2Hw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlZud2fUXA4G8VQ4fVSjwHluHGm9T9BoE0KyWgHUR3D619RbUb
	KPS1FpjnusBfjyyC0+nTHdgfmC/cGI86cqQVD+vqhJ7G5t3z13fyiVkU
X-Gm-Gg: AYBFou1OK7ycplfnnTeF0sy8QSdF47kO0W82GL4g6ruLMtBMt/YbWUy6DftRlsIveiy
	JBtrZU5EW/bpEDqMWGJ/R64gnImu/VD7/CFuomusZDifKlAtQAasenEhMIs5zQAOXH+CdPpS8d2
	IJ/Sha7Ac8KEJjKW0SQM+3G9IrMi5wFqq/ECIeRSL2ryKGqUInQMc4HtvxP9JZ0ZVb7IkBOXfUx
	rXGIzylYLxx1RHQnXe2Oa1pxJlwR7QZuPjFJge7JP41m93uqmQ5ec/AY/emgajDFIXiHddsgMud
	4ezty77bpQG6y16JS1+K5uEf5mESXXJR733eiqTybZGzWZtNqxlSRh5Q7JFKfAD22N2w0AWEUfV
	ft96f7KHYB8kvUR4MDoOYIS4P4Vs6HVBSZw39QFq3M85FyiSYTtFeHTueQiVFaj3XbXB2rvzFHY
	tBHIPlmG2Ee1MWYIbfYiemBfBd093DE8G9lT72IET8v+BnVlaSYQaaIJ2UxJY50Qjuxt/5f7OWG
	+inrVPbkFvrOLAU1fkrqdn3AQFZF/iK4NYJzHlrn2poM8GdFrWDkeJirVzn/ikRIThTtxuV4I/+
	JGEw0mCyMLWTcUM84/oa7ew/BRqdTKu3ML93KZvlrONm+5b43QxanAVqSpMghtPitvm+iYfnW5O
	nHw2Wzmwr64NKKtQ=
X-Received: by 2002:a05:701a:ca8a:b0:1a6:887b:16e5 with SMTP id a92af1059eb24-1ac5e31f9a1mr17352812c88.27.1793632644055;
        Mon, 02 Nov 2026 07:17:24 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2602:294:1:b9:a2b::1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1d4dsm31588877c88.3.2026.11.02.07.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:17:23 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: samuel.thibault@ens-lyon.org, speakup@linux-speakup.org,
 linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, chris@the-brannons.com, kirk@reisers.ca,
 w.d.hubbs@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH 2/4] speakup: Do not hold spk_mutex across catch_up()
Date: Mon, 02 Nov 2026 23:17:11 +0800
Message-ID: <179363263139.43100.6891425671047443776@kylinos.cn>
In-Reply-To: <20261019111505.2048-1-xiehongyu1@kylinos.cn>
References: <20261014071713.321914-1-xiehongyu1@kylinos.cn>
 <atUPbjRxDtzBZ4Vc@end> <20261019111505.2048-1-xiehongyu1@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hello,

Since my last reply I ran an automated A/B boot test of the series in
QEMU (TCG, q35, busybox initramfs) that reproduces the stall from the
report: speakup_apollo on ttyS1 whose backend never reads, so the tty
runs out of room and catch_up() keeps retrying with nothing draining
it.

Without the series, rmmod speakup_apollo never returned within a 50s
window. The hung task reports escalated from 10s to 102s, with the
stack pinned at __mutex_lock <- synth_remove and the speakup thread
stuck inside do_catch_up: rmmod dies on the mutex, before reaching
synth_release() at all.

With the series applied, rmmod returned in all six trials, covering
repeated load/speak/unload cycles, the spkout synth, switching synths
at load time, switching back through sysfs, a no-op unload, and a
stale-fd write. No oops. A write through a /dev/synth fd kept open
across the removal now returns -ENODEV.

One number to be upfront about: with the series, unloading a synth
whose tty is still wedged takes about 30s per round. That wait comes
from the tty layer's close timeout (tty_wait_until_sent called by
spk_ttyio_release); it is bounded and preexisting - the series does
not touch that path. The unpatched behavior never finishes at all, so
the unload moves from an unbounded hang to a bounded wait.

Hongyu
