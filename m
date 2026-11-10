Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794322846;
	b=bvIpoy0MxS3ocg65nYh5t4kRBC8s2gxZTyqMkmZdgnhDbC9ogfPxRQ2T9QLcg/pn9JqP
	 5zdemjs5Svlu8u6Py0lHkVxh7QH+mqeuXWYXr91rJTj3HgT158nFePoqjs1MgNw+Qgudy
	 nSVOsBnz6v/aokAjHWYHwCw+HOzCCk1CGA1I6maCDdxtfiGJ/xThZvGvmmfNbGTfcIwP9
	 KiRrm12T9edZZQXhJq7s1DEwIQqjbLK5LlDUTT8YSfmtYCqF5TFocEPTAC/5OVzSXWayq
	 AMWh6pgsdhyn61HDlaYrItvTEoAso6282P769EFyPGNd+XSNQiC4sYrMYUQ6vHTWMWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lerN1oA58W2Z8Jb9p+WACSxu0UlPvw3XxQk8+NissT0=;
	b=CX4vskaXOe/mPo7UcA25C7PNta6eR2EnVsmbTp6KYcvcspnNmOsUsEkgD5ZysVTeoK35
	 ZKRxBuxWjYAUPrYHXpNvkVyecH/GEE2Crzxc+gWIhpeX73xJIaxdFMTKbB8H0bcoKPxVf
	 zoJ9IlwGIiUTwDBECm3h878a5oto8Q9nDh8apcgqdjBdk8kKDwv7yZgNTlwkqupiUSQym
	 SvzX7Uv6WLktNCsabjYmrTNis7OV82My9BF8dAoJZ13cPyCdYiwCkBdN12+SmZwG8XVou
	 qFi6FG2MOF98+t3Wkf3zsZCs4Bh+9Y+bOC1gnx8pO+hn94dMa2ZIlO7Wkml+fX4goeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lF8kNUXv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F339160A3804
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F339160A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lF8kNUXv
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e10a70540so1302101f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:00:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794322844; cv=none;
        d=google.com; s=arc-20260327;
        b=bSTXuCljfjzgUW4NpyBOBDILQDq0gF3kzykLtv2wbyGHMgm5tEX506ugtvmy97NwhM
         W6++vPGdabkH+DQr1LqaNEJs3BxMahF8d+LVdiqRahgaQtisnybvnLOWKkcSpQsTSGpu
         9xOQ/GbiQI12YTuvYviYT09SHEmkQeO1/ljkLcFtiDXgngouJleH1J6PeyvMswK1bK9D
         cmHz29noPfv4q+U6Dm83nLh3hYcsbIKiZNs4+DFHP+I3U67L91HMQY+6N0WCFLrMFjBs
         GoAS39rQBt4gpIe11tUvfVI9g2gOHnpDhnWB1l6i11gMMvaVNNMKi/HlJZDZmf+GhHX5
         hf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lerN1oA58W2Z8Jb9p+WACSxu0UlPvw3XxQk8+NissT0=;
        fh=5WU5942kqnMlN61odA6St1utU8cn1ROvReeL59BPOAc=;
        b=MoShHrZ7Nvru+IFM0NOG2j05VxppyfQa2Jv9myuQvu7UzUTnHGU+4/zCFUkjXw0JBx
         ALfKgRuoERrxeLfW9CZw0zOzv1Dbmsr4FfBqsGjkMmymCzOBGL+6Uu0RjPzKN6Y2Khxn
         RLPEiHeXS2hzyYK3hDxzmDvwU4WqerCoxfPwSsnVU2cNZTMy6Srf1cYjkl79ir7pgQ23
         aH6IW7fwkNbeYor7SggmFhbTyq94Xu4tHT76Dd1ECw5y3luO8tcGHLYadqmEWTmH8BrM
         zeJEJ3Sv5Edsja31RL3Yyd4iPau50fKXfouqdpnzJTLfC0Bd3w+wW1gs7kNpdzNFlZSe
         6alg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794322844; x=1794927644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lerN1oA58W2Z8Jb9p+WACSxu0UlPvw3XxQk8+NissT0=;
        b=lF8kNUXv9vRZwcLl8/eos8sU/Jdi6f9PaFIm8XYKZAeCkMQt4hQ7bsa3IUf6P3fpgz
         I3VbtrsLwLYqKuiAfkoQlxrEUIwLmJJ+7n3+NV2dboruNg70FKcnZCYJeUYnwhAQXocL
         wJ8t4/QLFWOkUWBG9mT9sFmMw8PbXmBWyaEXvd2GOnRkdsTD6ojl2gl8UHOkxi4X/i4g
         vnHbxKquS0kkl1QLAfgu6OK5seYVS9AOrp2x0rC/6OLOBNMgmhfeSOBp4pojJNxgC/aQ
         rZGyxErxqyRM0KOL/cfQ4bP3FzfG3wiDn46tnSjjhsQHc+1TxpLF9HGKkrFeI9AXrUxC
         Fj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322844; x=1794927644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lerN1oA58W2Z8Jb9p+WACSxu0UlPvw3XxQk8+NissT0=;
        b=FFUInzmMlseeaYiERYqVzK+kr6/siF7/wY+qIdzxfzVU3nIxSxWqrVku7xC9/LzXw1
         OKv68rtUKc780BgTbrvPt6E9QkAA7pdw+jGC7lcJhQRjqlQlnuwCo9TKK+FLHvTgc/16
         G5d1bTl87GxGXp0S4ws5fvjUzCEIeAEpCeUumRS2KzAIPo3V3ZCG26Nvau8qI3dx+mTS
         RjG1ZZUnvEWUFsS5rSkutJ5BDuYFsPilbSFDET10zeT6GUWSjp9K+IEX20oFUE23d/QG
         /fqzn7H+f4EB8mk+vg/t4aK8zJdrS/FJ6n6fSD6C97Pznn1GzDXq37XRkgUiaaYt//mO
         adcg==
X-Forwarded-Encrypted: i=1; AL+hErHzjbpmoqoR2brR1ggCUgoUUo9na80IWb65CvfKsJEKJgQhHkcyOylrRWGoDBSvkrmxVID8kYybyZeR21I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p0cHHyA+wkd3S3IbfZ04UI6ITJsyh10zews5fTK8O0TL2ZMWh
	q+4jHnk7XMNz7Vx17EIFuAx+UJo7ztqYqZrD43cOndOVs/zkHIWsG3U4CrMA3tpr4yG4HBl1F+/
	Jv32qgOMfH2hAvBoHV34IWxO0dg75kAk=
X-Gm-Gg: AYBFou2Ojx7HkDf6U0un/zC2+sh+wR+tPzUQq66uo81TkM1A1xxFZzUQSVzg0DOTCfD
	MO6jCEDryi+Jo9CqE2cuLKiYUj83WOSms8AJjq64Z/FsiYRFJfO9Y1Bhdqsf4CWhpeXKxcX+LNL
	dlsz/ofJKwVsfxTWBWUg5GbJjg9tCgc6BsSD2j6f3R4Onb598e4fJldNPokuvuQG/byc+/s+3XJ
	lxFuKnhFrvMReEKQq+SSoQdv73DrOHMyirdcX8f32vox1n3l/diWdr8srkAg7iiIubYirx6BU89
	279eCojO2O1ylXg+2VdMiDigq4XWjtE0WwIoScZbnaLMxmj00NLaZtmUHZtQm9Cu9BPE/YM28RF
	8E6Cs7tqqKCgyEneiOyI5s5m0RiFPJAG1AEWavu930IHOAC7isoQnU5QnzmAufi9IMLlmrvn0UV
	YE6eDtRKmNpBggEW4woI7Rfz9OH5tkFbsqTbrSws4ARiOv09J7P3Ow
X-Received: by 2002:adf:e011:0:10b0:48e:66d0:664c with SMTP id
 ffacd0b85a97d-4982f2b4b58mr4108324f8f.15.1794322843878; Tue, 10 Nov 2026
 07:00:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com> <20261109-zsmalloc_stat-v2-1-caee41684aba@gmail.com>
In-Reply-To: <20261109-zsmalloc_stat-v2-1-caee41684aba@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 10 Nov 2026 08:00:32 -0700
X-Gm-Features: AclHuK-XBZsgATZ4npwXhUnZcAjEJ-IievOGuoTbtipAN4Uucan3rCpbmZ9SRXo
Message-ID: <CAKEwX=M6dJMccGcDqp2S-66cbegdivnB6MqQRj6tQ2u18UH62g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mm/zsmalloc: remove CONFIG_ZSMALLOC_STAT
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 5:59=E2=80=AFAM Xueyuan Chen <xueyuan.chen21@gmail.c=
om> wrote:
>
> CONFIG_ZSMALLOC_STAT only controls the debugfs interface. The class
> counters are updated regardless of this option.
>
> Remove the CONFIG_ZSMALLOC_STAT guards and rely on the debugfs API
> stubs when CONFIG_DEBUG_FS=3Dn. Skip statistics setup silently when
> debugfs is unavailable.
>
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  mm/zsmalloc.c | 33 ++-------------------------------
>  1 file changed, 2 insertions(+), 31 deletions(-)

FWIW, LGTM:

Reviewed-by: Nhat Pham <nphamcs@gmail.com>

But I come from the perspective of large(r) server machines - I'd wait
for the feedback of embedded folks too :)

Sergey, how do you feel about this direction? We've run the stats
collection (even before we select CONFIG_ZSMALLOC_STAT to expose the
stats to userspace) for eons, and it was never a bottleneck AFAICS in
our fleet...  And the stats files seem trivial, relatively speaking?
