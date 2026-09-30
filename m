Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE40407575
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767443; cv=pass; b=HAnzgfS6MwrtaHSEttKdL3KCvk3z8g6jTASC+ATRFo/gCS7sxUfDd7ASBZRlqk1oJB/dcwgEcni1CnrwNUQ7DwjpPwhDiCxovgKsKakLYA4BmVtGev+/gwK5P57NWFFzjFbN/xLCgAZvvZ9YmI1JHzhalyMGqA5kBkcfWxtJSMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767443; c=relaxed/simple;
	bh=UIBWMrR7o3WZIls8H40iqBJV61DfDMQSfoMTLyNGHtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hx1o3uGJe8r/Zb+OG3ch9yD3JCIgc4ENk5bg9ATzjMaSPtJs6R7LpWznrnTlej3zmYXWTLuUWp9WCROh/VXZ3tTkWmv+Q7WwFMs3DW2H0w5lokYevFeRe8xu58SHAgADKXrwQItPRehobtJ5Dwo5thFh1IX7eYEPeEHQCDBYVrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RWqwqK10; arc=pass smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RWqwqK10"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-533245fd18dso33958961cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790767441; cv=none;
        d=google.com; s=arc-20260327;
        b=fJsufKQgEHKwL7/Lga+1lcea9t4atR5VW3aDsZTUYUNvlEcHq+8Tlk9vaWL14nWMH7
         mao6ARfreSS7ENWwQho5wLBtVFV3NjU77QkC3YzGVLXrYE7ctrE4aO0oYM/68b4Ce7d2
         CHb6LJxK2JqmMc9sZ9ILDb9aox+G/T18maZi/6MhPuxYi/YPoYvnP+sXacI9jtvRP16b
         Rh5VXL/aqusbYFx8a/tcrtkAmqxEBu8ueWp1vOviMVu/RqC+lFqC3EBTXVLS9XKdfJ4c
         YZZdd3/hWTbMmaCQTRrCQcDqhp3YUBaRqo6mhV2+AT5Jx/mE/CTuFYrVMrf1wqIQ8s7g
         Iatg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UIBWMrR7o3WZIls8H40iqBJV61DfDMQSfoMTLyNGHtk=;
        fh=SsrYlxuKrdmV05I+cWrAKZ5T02Ko8DNv6/Ayb4qnocM=;
        b=QoYYWiJoywy+iaJjoXdZYklNK9fHBobXhTWLg/ksciH8cKUlwfMsa9ALzNtl+0MoF5
         P7aZlNArYFnld8nbNcZT8V4dSrVmzD1jpGf1J8Fd3TaWrHSObDGlZFRgpaQMEiinyV+g
         Ax8mEzIVd2rV0BfxS8MFrAmDT1Xcq4o4nJLFEqix3tUeXaqyXymo5wXAMRLzadoxXax1
         ZA3moU93JpFedDYsXlbDRIM07OqK2C6fxPJXUbZOV/k7E8Rpj0fo+IeLNbBt/EquaIza
         QWn7qJZ947G4q4d5A6XpGFTr90L0bcmClB0sag4Cwra8YlYC8O3u6mmrOTCoLYTdBNZZ
         PtZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790767441; x=1791372241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UIBWMrR7o3WZIls8H40iqBJV61DfDMQSfoMTLyNGHtk=;
        b=RWqwqK10UbRdnJxNTIrShEfhofEA2XfyDyLWiYgh2N7JE9A0rdasAsdbIHkmzv2NaA
         7AuTXG1q6RgjbmPJFX70TG7dXi7FG48mMOC9kb1GA0Fni7nQKp7wU5e/aetfrvCYMOr6
         2aXy5s6QohBL/LiO2u1ZwYBsgoV8vj2jeG9jp5PPVILxGLBmHbkc5p7i265VsDBUkT5H
         VeDg2e9PFpEqh3d/JqkkgpUa0Q4OZGqce7f/y+bIp53uuSyM52933ystGUJ5iBO6G580
         8xGnx7o/s5l8pKHgZuMN4290E/umeZODNwP85a70yNzO3dU+25PCeUCFM4VWsv66DU3E
         8Pkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767441; x=1791372241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UIBWMrR7o3WZIls8H40iqBJV61DfDMQSfoMTLyNGHtk=;
        b=B8ErazWwAySBB9fuk8h8mhqapbLHUSxjTPZtc7iR0EI3fs4wKfTE6ES6jufXHDuVmo
         K9oqAvWQoL0KK6jkZuizAgWM0Ds6tyUS/ExLk6qwL5KTy5yYI36KI6HJWHIwNGa3fnsN
         vm0g5VwWX5FkdGNOMOwhDDZhIxL6m8Yjlc4ChWkijBJnSRJnTgccdg6bhds7GCKSluRP
         zQ98v2CyFKtDRcpJ2UyIShFflMnyQjspTTHP6EraGPSwWagAXtwNcQjePK0OTIMffMXV
         iwUqh4kRotbZinqdBb76IZnlSCGwNGjGsUapg5XEr9aVtIccfZGFfNzfBY2W9Ltk8QXx
         ijAg==
X-Forwarded-Encrypted: i=1; AKwUvBxS0XIgtzkQAASC1/gYIJuTD45wopdmY2v+GRjyetmVq41/CJR0UM4M9TfPTOA+n+bDH6OS2sy0Mo/Rccc=@vger.kernel.org
X-Gm-Message-State: AFuF++m5zf70nNtcno+zLjDgAI1Ewr02n+Gjb0IPsW6M1ncqktwwCSI4
	O8/nDSvrl8lU5cAWDtkOsc0ruw0bZGiUqrVdwdjxyOLFbTKIQGVTruoRYQrjiB03V/DGHJtQ+1Q
	j7ean0mW2eUKU9OwdcACPfrlZtAeS1qlj0TDR95MJ
X-Gm-Gg: AYBFou21H491KqkKqg8OambNbV9olRiIL/+77YDnlv5T8JB7YoCOt7E0HPnmm3B9vKQ
	DfxwOJ4hhvfUJh7qqNyOVgpGEx8pz2bgbChR76R7P63jbEB5qUOjOU9qVXSC8Udw6cFVdqiOsZ1
	vg/cQ0D0nJF7CXOxsYV4+85JV3hr3ypDgC7ipp+yw0rbW71mHJG2jpJoEDgACHkFYQ1IrSFLP+p
	pvjZ8sw4b8nvsLgD/dX2CPP0EQd3MclBPtLwD1EMBJAkhBvES+FS4Gw+xeYiXCIbAosRCAmJcZL
	gfGoEL5O8OTVryX76KWT2cmhxtCcRrIebofUTObPlkH9hVapZsazwVivBbi6C6H5GFyaD+fHI9b
	rgjSAvW5dqBkyITpIu1YjMZnD6njsVhEBsRrdvj3mEbIDUdEnT2Qqxf2b1FYQh7TZQKDU
X-Received: by 2002:ac8:7fc7:0:b0:533:3e09:22b9 with SMTP id
 d75a77b69052e-5337424db09mr20540581cf.11.1790767440497; Wed, 30 Sep 2026
 04:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930100937.206377-1-jiayuan.chen@linux.dev> <20260930100937.206377-3-jiayuan.chen@linux.dev>
In-Reply-To: <20260930100937.206377-3-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 30 Sep 2026 13:23:47 +0200
X-Gm-Features: AclHuK9808Jpl2m0jf0JxvvJwCZd-4x4ToXvGi2OJWvz_yrBHOETOrC_Jxm9R5A
Message-ID: <CANn89iLYyttK9bXFJ1yXYti3YGpqNCz2J97XA1Mgrs36-OPN8Q@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] tcp_hybla: fix divide by zero on rtt0 == 0
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, VEGA <vega@nebusec.ai>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stephen Hemminger <stephen@networkplumber.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 12:10=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.d=
ev> wrote:
>
> rtt0 is the reference RTT in ms, so 0 makes no sense, and
> hybla_recalc_param() divides by it right from hybla_init().
>
> Reject values below 1 when the parameter is written. Also cap it at
> U32_MAX / USEC_PER_MSEC, since rtt0 * USEC_PER_MSEC can wrap to 0 on
> 32-bit. An rtt0 above that (about 71 minutes) makes no sense anyway.
>
> Fixes: 835b3f0c0d7e ("[TCP]: Add TCP Hybla congestion control module.")
> Fixes: 740b0f1841f6 ("tcp: switch rtt estimations to usec resolution")
> Reported-by: VEGA <vega@nebusec.ai>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
