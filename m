Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792686757;
	b=jPlb0mv+cyyPOudmtSnw65xMP452doDo4aF1nRJ6OPLx5/pLsiATosRp24jgx52G4z71
	 RHZPJiPSUXlJv6AJMU0Mmg7CvRbSGkqtfXrlbbsF5l9aJ+zasVQeKryhZaNjaYuITTJOI
	 Eqg4NHNp6eBTRHbOa8HD0/YKnBYZU0E524wGFzdFuplclzpniKVVo6mXKnRdVZCJwb0Tl
	 G5zaAp/WZTXdBLRjXKPiM1Ypp5Qd0Hg95gdPrdajl1AgBcCuF33NkeAwg3nDlWNaP0+I5
	 KnyWu0H9LSzSic2WEWeio4kXBvURL/qaUkLkdSyaPTyXQhyo/kytlU+d9SmK06uUeVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dyDoCHAK3x3k2IkUzfNota+vU5adkAbdwanSXQJIy3c=;
	b=YDciFCIVpkHpqcvJyfaUTRK25aBWv+tEgKl6ovZ63b0msyDWE0V9m+5R+YOzYbEhbsYK
	 vDNgiU9BCPH+e1BaR6nOc4mnW6w8iV2UT+KAGAHCx+/UlKlIOnRxSHQWv8GcNkxG3mDhM
	 x8YUVk8Mt8UKb++ROQAPCUcckYVrIs5WDf23TjAWvDge1W5jLcGkQ/hgB7jKhvCXkIqiS
	 y3w0fD0nacmXsz66AJC0jpvpxV5c4f5Bkp5Mpfq/IKs5SRg/of0TuYffAW9p2iTYD6tyb
	 BwAGhQL9C4njVa6IwBXW8a3fYVBJbYdbprwQzdu8u37TTVqFb5lMvkgEb122S1Jh92g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nlgT2q1R;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4222E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4222E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nlgT2q1R
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so4965523eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792686751; x=1793291551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyDoCHAK3x3k2IkUzfNota+vU5adkAbdwanSXQJIy3c=;
        b=nlgT2q1RTU0EH+YxL4z+hsL4T+7TlQvAkGhXm/A3gBiBq1OjpdykFD0p79P+2QHVXp
         rrRmUnE13x6JIjeqAVMN86RahXl7yQZrxVVvmdH/h3z701xAU3dJkZMO16qz1XzHWXwb
         yvWxB5Dz/qX8uF52sjXSeZYPJDeDbcgeZU1+MUNol869hzum1Olo40CBOrZyYUs873o1
         d2JfUi0Atheb1KdNQAd4ROzSnSe9hAl6UfeSPcuJai48Apf3no8HkCxQgOWlYtlUSBsd
         BQlVpeu2F6rRyR4+kHtPpl0iu72eMIo1cY+IV1lD/TqySeNzClg2LJWDXn8biN9HVq8N
         Px3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792686751; x=1793291551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyDoCHAK3x3k2IkUzfNota+vU5adkAbdwanSXQJIy3c=;
        b=UQDwUBQ1bQdif0XG9Qa1PCj5aJwnH1y8fr/4y5wlMZ/8yEhK9Wh6zS7nV+RkDIE+Id
         LYs/sy7ImkQB0VUcPVkjhpb007sxpDaa0FF0hSStvLgPhp4X0SR3wfPMDxrZ8f75fJZS
         nK3/DkpIir7YyMFgYOlrTzMN+SIH1/k75lnwo5WoKgJYMEPYX50KaJhrJuORKpJym9YQ
         Nm2wCLiDFiC4iC2tr8FOqvGugVM4HxtzCHVLwdDxjvU3eSSsyHiJo9YZTSAiT6FVRLz7
         jzSMKLF9YR1hYrWzPnfGAj8POjAyC0h2x+VyQPMUSI8FXM+IOULnj4wzlY9WrupWOdKb
         nGRQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4HPcN1x6wmuy5/T/T7tk0wvG0TNGyX/+cZpg0nUGCR+IokMQrqu0AOGGJ5BWeoo/y0hhCD/Lv49v85tQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWg6ipj/uNNuZC6hNHRrJjZg3hHwMAIpk7O9HH6pNmSCXfcCY3
	VjZgR302OsaBliFA0koatSNOgxhjURUVuTgd7p4mAYTrDsVEjPD7ARcX
X-Gm-Gg: AYBFou360VSdyELtiOHdHMbqcg4VnWZt0zvMnkuPEAnkzeKSocgRbBsmmukKld9WZge
	01/LfDJYsUns+YrXfUw8yrhN86RYi3VfbwCnXcYbVVbf0VvUXgDas/16CYoB3J8ES90YHclyQQ1
	zwPGw8J6VZG0KLfdoCFpSBLN8N/RuoV5mezxNFya9Fn/MSKuLyYv8jIfB8D/3qnNa3NGU/zzu2s
	mITEsFKpL7o3sgnqm8i10ieLBBwU0Nx4bRe04QJFKhuVe/WKu1GskHwT7UAv+swrxWL0Wu6S0IQ
	s8/2HWKldemIdwCq4O5KLRW6tY4TiudIUUzhS0KVozNStLMwSizLEa+Xre65seApuCnK3Hm2gpl
	+3jjCjjavbTTMQtk84JR9/sIKecoTZP3KwDobIOxzGGolzgZJQLlyErHbKF4OgkjA1ujm0BgO0C
	lcIQ1jKcGEEDWs+ZhB226pSP6BqJNaQ6sFFw04Ad+b2OeGojfNERmgYAbsJwPkkQeL+oF87Edln
	UslShsIwv92c4WtlBRifH6/FFOk0I8QlymcCjff+RQbXyxSngsuM1Bi21Qxr7vdZ+itb7t9jMYg
	gcoDNN1YgEQol+7J
X-Received: by 2002:a05:7301:18a1:b0:359:9302:a526 with SMTP id 5a478bee46e88-3674c93ba42mr7166066eec.7.1792686751237;
        Thu, 22 Oct 2026 09:32:31 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741e71eaesm37214243eec.26.2026.10.22.09.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:32:30 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: mani@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH net] net: qrtr: ns: retry service announcements on -EAGAIN
Date: Fri, 23 Oct 2026 01:32:23 +0900
Message-ID: <20261022163226.1091-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <179250109438.3135.5278679700614096504@kernel.org>
References: <20261016124600.31-1-26rote@gmail.com> <179250109438.3135.5278679700614096504@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 20 Oct 2026 12:58:14 +0000, Sashiko AI review wrote:
> - [High] The fix only covers one of the two paths that send NEW_SERVER.

Agreed. A service registered after the remote's HELLO has been handled
but before our HELLO goes out is broadcast from ctrl_cmd_new_server(),
and qrtr_bcast_enqueue() drops it without telling the caller. If the
local node had no services when the HELLO was handled, v1 has nothing
to retry.

> Could this be handled in the core instead of by polling in one caller?
> For example, packets could be queued in qrtr_node_enqueue(), or the
> announcements replayed once hello_sent becomes true.

v2 does the second, as you suggested: the core records that the remote
has sent a HELLO, and when our HELLO has been sent to such a node, it
passes a HELLO from that node to the local name service again. The name
service then announces every service it has at that point, which also
covers the dropped NEW_SERVER broadcasts.

> The same window opens again after qrtr_endpoint_hello() clears hello_sent
> on resume, because the nid stays assigned.

The flag is not cleared on resume, so the replay also happens after the
HELLO that qrtr_endpoint_hello() schedules.

> DEL_SERVER broadcasts from
> server_del() are dropped the same way.

v2 does not replay these. A service that is removed before our HELLO
goes out has not been announced to the remote either, and on resume the
remote has been reset, so it has no entry to remove.

> - [Medium] The new retry loop in announce_servers() (ns.c:232-236) can
>   stall the whole name service for about 10 s per remote HELLO.

Agreed, this is the same problem Mani pointed out. Nothing sleeps in
the name service worker in v2.

> A HELLO that fails with -ETIMEDOUT or -ENOMEM leaves hello_sent false
> for good.

That is a separate issue in the core, and v2 does not change it. With
hello_sent false nothing but HELLO reaches the node, so the replay
would not help there.

> - [Medium] The NS side gives up after a fixed 10 s, but the core keeps
>   retrying our HELLO with no limit.

Agreed. Any limit in the name service can expire before the core gets
our HELLO out. v2 has no limit: the replay follows whenever our HELLO
is sent.

> - [Medium] A retry can re-advertise a service that was closed during the
>   retry window, and the remote then keeps the stale entry.

v2 has no retry window, but the replay is one more HELLO for the name
service to handle, and the ordering race you describe applies to it
too: a port closed after the replay is queued but before the name
service handles it is still announced. v2 does not fix that race.

v2: https://lore.kernel.org/all/20261022163116.1042-1-26rote@gmail.com/

pw-bot: cr

Thanks,
Joonhoe Kim
