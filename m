Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794323001;
	b=S7XaLbjOG+w/cYACgkjtpwwCZW9ph6jt/n7/G5/ww11RuyeF/n6u6cnRAm8qfCEHMpIi
	 2E/JgL+Ko7tq3rH1Jo1NYUTwSi6TxFIJuiQc94zlReM2G8B7d7Rs0ZHUNGLYpNL6V55xM
	 J5F+IGp/BCBmXM9qNGk8DxrCchkPStH+lVbYDpoCbLMAeeecN4SNms9/WN6QwWgBEO7VE
	 KC5d8HUDToIOcwqrOQkYpLcncGN/rhPuJmLh5Os3BvzVSe+76LLYaDGyJDOlw8tS90B6U
	 IeEP2bVPJD53sSbpRM58ZBvni2z8G7F5FmRefnu8FAGScwDP9N3yu6en0mvTYWjYOPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lcxrNtNwR+ubuo+QT1C+HX+mC2Hh24BYfD+aCKJIoPI=;
	b=RaEqEWgrcHLAVByW4zFJpGH5xlIritWnACbCiXSwqO7JFSmC1LWhR63pN2e04jwuQs/z
	 jIS2WMb/7/E85kNlTusuVyaP+Ea5b7jlID425wmpdw42HrzlMQnM5w50Xa3Rw7IanE+Tk
	 Tm4bNFislt9w8uGweAfvepmpaufrDrN21RHVF4PJ8vWuELeNThZ3P/lO98FeJ5Ul0Prc5
	 RmIVHBZNKR/H5A4Qvrk0Kbg4gmG0lRRoFqQR7zZRne6vXUo4WpUPnc46CCevYP7M/5obk
	 dBd85b5rtCL/+woMDJqZ8NuKJx+WQL5hGyfTsNi6UThAR9v8rMvuHgxtl+X5JIry/gg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gkZ3ZevI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19DB60A261C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A19DB60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gkZ3ZevI
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso16276121fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:03:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794322999; cv=none;
        d=google.com; s=arc-20260327;
        b=aywGdiKDuDSA0kPVK8I0Wq8XiUxN7ICq03ASqmy6afl4gM2z80nUSCOGYiQH7IVL6U
         MD5b6IN7ECDuPMou0gGkovKCKsxH+LLDX7+gEmiXmPFDTNC5zb8vAbSizLf/4tgAvGpN
         UFXNzaWpRb8CNSHkFIvDFLhi6vTDuSCJSl3VmuqoEm4dixx/LRb81xSLoaqyAK1Al9+z
         kpl/y/FElXmdS8pJ5er3Is5h7Xsg4N7uFpvLSKgpNWk7D0lmLEBy2tnvv2WkK1q172DD
         4ALFHskN1OMXdDz6Bb25bK/DzZVLhIqVkdXD/UKp8bSNI9fd6EDBvFikXklEor+FehJX
         3MPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lcxrNtNwR+ubuo+QT1C+HX+mC2Hh24BYfD+aCKJIoPI=;
        fh=lFr+shz85HeSal65yPsvRRc1IjADhMyfygN7VEF4O/k=;
        b=cWLsnQkTDZKGYMknWsP7wAb2/Pk4QV8ygW4j1eJS62lvdgLQBXKqAheSDAV018OKOu
         SGKSukfgJqK+njZgOvbUO/jE+URhfkbYrow7BhZYwXWw0Rs84CZ80Uz/iOo1F72xprsR
         j0UWHesEd0IEbvi28HGCVKIUVwa+n+VzCN5gW5RUr6GUgzdPzNCjfUek/sqfEyf4yvV2
         TZU0eiYeUOZ9VoyCh/EpoG4EvlOgs006CXsksKvdDJ55fTPNnx5piUY1xapHiegJ05Q7
         4V3fztiLmp6V+6aEsj/WaFRf9wxJUFjPMKhEWPNMTWT29xoNwONtxjFHzTb9678CjjxT
         aRYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794322999; x=1794927799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lcxrNtNwR+ubuo+QT1C+HX+mC2Hh24BYfD+aCKJIoPI=;
        b=gkZ3ZevIjNXFHSzu9Bt+jSMSyP8cWYV2jHvj4vt0pnNf0x9xage6N68On8Vnm1bXc+
         Fl1bB3JoFV3MFaC85jmTIHoLhEjc6p3kWnaZvOSIBoiKSpLvtkX8Frk6gAeE+BrRvsV2
         LjgvGbz52JOdxoXE3N+YfnXQCta1Ex2pqPJEi9dAKe90Hm3IZ34I2WiteabFSo4/cDKC
         EzA7B0wweN8ofdxXGMBUN8hi4cKHwd8q4q8n2ZXj06st8a4RMBvg0k4f/cC+rTfEnpg7
         kJ45z/RPqRp2K0CFoXGlfCke5K2gNDYI+biNGp2w9BoG9uPPsb4u9sDCh2T+2P4WMZWH
         jcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322999; x=1794927799;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lcxrNtNwR+ubuo+QT1C+HX+mC2Hh24BYfD+aCKJIoPI=;
        b=u4Sf/KdLFABPHxcakPKSr7m27WJB8nP4GzLBiCal+El+V71Q7Kghu56d7mGxVfzGwd
         cTO4Oah1+63ZT1xX6ocNOleMK0K+YSKwhyWK4MYN7cTVsMlsU/MBvvcdaSgz3aKjUSVH
         /3vB+YZQpxFgYea7M3w9A3nOvhCBs9gdJdUIm5dCyG1ovRHhhLDUIPfP0+Ip8f9yKSkp
         e0bmve7+f5HTNR32fKrxJPMJHkoWzq8YTVa1bp/htnh6J9HABC4Mgy11QT45uqm5ronf
         hT/eMLn/g0DZ+5EzSEOUwIZsIkcn6PmuGmDHziIDoEO/XY+hngNhRLp/8ViV4YhQb3X5
         3tFw==
X-Forwarded-Encrypted: i=1; AL+hErHtfDfyzhcRPq6D/EX5ZW6j48mN95WL013BeddbOsXEQIsM0PLpgARLgZstcd1ATHNyjsEwxctWo28zbaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z85LfUWRnwO8uF4BsHLLTdLHe/F40Xumk4dP2di8CbqbrloAvs5
	CRBp6QE73+8PoxQIcVEDoAT9g54dxxUM76OHX10huIE14MBrP5CYoA9R+OK5fnh+ZAtbJ7HfDNK
	l6aaSSyPjKO+EYjCMUcKz6MagA7rjp8s=
X-Gm-Gg: AYBFou2z5IrXHIUHmoayJ4cvgibrvP36cLx3lwvcKIKjygAH9Qxj7GBlJtyZ4MZmSZF
	c/0rmFhzWfJDRrKRjkQTeEqp06Pc9EaVM+zlGNhUZXPD0Ru0qQOngzNke+vo6CbCjDAEDMF4SQ5
	j3NjC4UbZCcgGYvgsn3a6CaEvisD45ai66QFMZKG6fZf5xyFKL6HgQsGTAc0Kuwvcq8Ei92268g
	25dr2z81ltYCYlGjCBJrCrVBravFXzuzdNMcE6qhyXo8b034GOPFviLybmjCxeko26MVfCC32X7
	A2JBlnLVAcqiQfEturyI8Vriaru86rVHWEMJ1Nnr+7+6quREbgQKmhC4fWvoaIZZaY+CoLdVxQn
	MgqG4HAyFjVIohgERA41h0JExs9goPaY2o/y2pH+S2mrSLVtHLqD9YEbptGYyvvXRNFhsnWizVm
	vKdWy0fJI7n5M853zMCWRCc5WqZadLxkwgMetvtfM1HwMlS868ZaxIOfah4YsPKC3J7nmnurnkZ
	A==
X-Received: by 2002:a05:651c:886:b0:3a9:db75:823b with SMTP id
 38308e7fff4ca-3ae0963461fmr6011631fa.17.1794322998586; Tue, 10 Nov 2026
 07:03:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com> <20261109-zsmalloc_stat-v2-2-caee41684aba@gmail.com>
In-Reply-To: <20261109-zsmalloc_stat-v2-2-caee41684aba@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 10 Nov 2026 08:03:05 -0700
X-Gm-Features: AclHuK85VkAR2wnOqNqvQgZfQ_LlfrHbXEwJe7NhWmwf8P3bqM9yi-Y0ggTdBo4
Message-ID: <CAKEwX=PNpMr5x4gTo_OK5D5EgKPDvZx2e2=95-4_SV8zq37VnQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mm: remove CONFIG_ZSMALLOC_STAT
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 5:59=E2=80=AFAM Xueyuan Chen <xueyuan.chen21@gmail.c=
om> wrote:
>
> The statistics interface now uses the debugfs API stubs directly, so
> CONFIG_ZSMALLOC_STAT no longer controls any zsmalloc code.
>
> Remove the Kconfig entry. Replace the remaining CONFIG_ZSMALLOC_STAT
> settings with CONFIG_DEBUG_FS=3Dy.
>
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>

I wonder if we can just squash all 3 patches lol. Anyway, LGTM:

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
