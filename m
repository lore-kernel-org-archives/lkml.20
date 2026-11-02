Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793640234;
	b=ltrjl5UkNYGNTBcpGfZzL7ViFtFK4ryPSusjZu6yyd3PtTfZKMnrZP8bZhD8uSUcYIp2
	 /Tg4vPgGnN1r9t5qKXj3X0DycPKOSa28CCBiZGnFBNwlhlpYL4VnRkHbWzogWPh6eQksq
	 wqLWk4Rqtm9OQ550ZyytJsRSqL3KATncQaQBe85wrb9ZauwVYL3eeq7TR+2HsvpI7scw9
	 GYCl3zIti8pdnfdtaNfhkLnch4YTg1N0yOkqz1+B9RlzfZc01KrO97mVhwsVpAZ0i58t1
	 Q7lGvAi9aQe2EtwJ8NP5Csb42K8K5TnYrJLfcomItOYgKsAFZiO9FDhbQyeqUMR2aCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NMhcwYj2Xh/UOAJWDcUbdWHHqi6JZzcb5fNLyhXGooE=;
	b=jAapVIvCFOLr3zK/o/Kxe/GaTeaD5QDaZdQfc/U40athOjtVaSZ51eqGu0r33YSueyY4
	 bWAqcYU3AEUWz3fF69Ry3wLeN17HrBZT5j2IKho1OFv9nm4WX3e6QsPPRZVIDI3soD9bw
	 Z+veHAYUJQgjDD+lNSpsUpLfAzpwRdvuov7VEhD1HLIoB4kXgNPCrQAkawmTLJJ8f7cmM
	 KYAKK441IvlYvpcB/3j3YoZnRaXCCRu2s9VDMmE5V+Q4ivsZpc2OKOGlhleuEg5TGhqei
	 F/N4KRh3a51nzFyhrynitP3ClcHH6VFp04PimRWRz6fMJXMvyCCFJEc4oUeOcmJ+IJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dX25uZ9p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7115606B1F1
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7115606B1F1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dX25uZ9p
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ab43af5e97so36337767b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:23:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793640233; cv=none;
        d=google.com; s=arc-20260327;
        b=dLnLHRTrvUIcSxdJUsoF163cZmZqDTRiVehrxLZo7nZ/d9BqozfQ0M+fVRDmLta8e4
         ywPr/c1MM+fCs6h56bPXPJAy5j4EDcuE6xvYhcHwmiIP2XOcX9kyjndlYClPZ6qPn6pj
         mNcsEWib567tq4Jg7UiowsXOzn2bQdoXfqWFOOixI8mG4A2qQ995bPcN0P4qpzCJGRqn
         TEsdNslzkScoUFBeZxqmJbM3c0aHd063+O18mY5CyEK3JyyQTGkENLBQQ1jS4h3CRGnW
         JI12pqzciWFahmkL6DpFKvUOFX6mryooczfSVYVouJlelj5jh9BYa1ftwk+V0Mh6X2VQ
         7Btg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NMhcwYj2Xh/UOAJWDcUbdWHHqi6JZzcb5fNLyhXGooE=;
        fh=RoOgBa+yBO0crs+rSh4Hx8o/SHgonJO+Zt+WjcKTH1Y=;
        b=lysHJl80tBd7CgoDdOOC3L2TaM6MYIKipMwBUg0RyavHQtusuPWtIulYV/vGufCFJl
         Lygod3U7lTD/kSVdRDS6rsWmwqj4Qv4jeAU7XUiAPCdjCRLLqFE1bBuPo8g8+gYMsHyk
         GBGFi1AGNR42Z7WW3ZrB4qVo3N1JBk4iaNPjTqb2VSEUoqR9QoGFOwLmHNp3uQ8HHe0S
         tfVKfZ+C1KOcDJp55o+36KunEX7QNWmeyAumwBaZxlH/c07H3oI01ssfwa3RBSvN24BG
         R83Oq68jHhnW2AYiTcgNkwVAFwfa/vVfVfohIVjTcXXYBbAzpGYZMH2xluWanaSECpVl
         sa9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793640233; x=1794245033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NMhcwYj2Xh/UOAJWDcUbdWHHqi6JZzcb5fNLyhXGooE=;
        b=dX25uZ9pIkkqcjmo435YVPxJeGtnfY4yJ2W54a/zE7wS9zMtPmWIjGD4u39ixssJpX
         SzcMCKGAMJTFzbw59DQtDhFN+oa4KgARxyyl0edL4jIFEmsvbQivmzxkgTwfyd2JVjym
         lQ0STAe4TqSjk9r7fLaqfXEW79F1ZtvOGIE25U7kC4Gizj/MVotauiaPyy0xG7P66PR7
         b/Mj8wQvLlxtMS1VcROMbCNSOJ4uHzDkdUebm9Qm6zDNlwRMFDQWUA8tTlGSkp3DaYIG
         /oeJksrMMJ2F7++F9++67FzOz3CrYLBFc4g/PKxSOyNQSU6lPe/fdsxXJ04KA0bl58jO
         Sfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640233; x=1794245033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NMhcwYj2Xh/UOAJWDcUbdWHHqi6JZzcb5fNLyhXGooE=;
        b=Kc5REgWUAPx7gzE7tijDSiydg+4UXGwuUgMqZHeRkwOoiMybZdG53TbtTuXTdRDte7
         wAAYBrvrAkF3/5BwrsXnNqt/vkEgqRMZlRUva3tszxvgtEFigj+AsdZP67vHY/KdEy6j
         ZGH856fJxN41WJU5S3MmEgoKsCs2+NezeIDP+IIIzFuWMpmNWHdnVqUTBbXNozirncW/
         F4CZoNRE3WqOZcBmj11sxYV6wlCYYGDql7eqG1CQEPLmuaWW2VfipA72qBP0xTIuPj9N
         AQlkcfPE+npW1M1sYDYxOK5CFCSQcvIN5M/xDUtK7SjR3BA1l985KrvkW4Tdek9o8JEF
         D41Q==
X-Forwarded-Encrypted: i=1; AKwUvBys6W/D+CnMv25GAE/L7aTZQPoVpXlj8Uhhu0I3wXvhRyfyC2JTlxWTU7EinVinJuX1TvG3XT2LVWZcpOk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DvhrzdDHzVW2QMhSXmgXLrLehs6OUweq6OLiaGu/t8wJUznR+
	bzA+LN8+rSUdLK6lpfaDr1UJi8vDu91FPx4qH2icoT0FAE51kL3n1yPXv1GQMqKhv0DmoZ9pLfz
	uAiDwnbb+bhDYU0hYQuImmE8Ktkt9yRA=
X-Gm-Gg: AYBFou05GgaXQJgoW8D2XxbtNDZf1QgTeztZ0ViCRClGFu5yalPgfivxiVfsEXuQNsG
	/15coAjWx4s1gF7JAVzSKU6Q+tveFe3UsuEuWEiOkmWJFU1C24AVzc30O9b+QBTOjnO0lROt6Bj
	/DEtqiaV9CMOFEVd8v6/dLh4bZRiQhpHIk3r9Qhu0cU+aFKpfMXVGwqr2ZdcsY6jsCZwxNtNm4Y
	PpglKtIg3DNjuM73mN37AioQUEouW8ReN7V6dzRmIiLyQeMRYz/b/YIadz4EoI9qrOdcIVwa5y2
	oGfkC8BNftFXq+AXaSJw0YpnFTKn3pq8NMEdW3rvfWRkFW24euwi/CT5LYq5dgkMOXulxoArWzs
	twNApuxcgYRI88TzS6ucVdJm3ZEkoxyP76/rKdlNxos+ZoH+UiI4SX4fX/CqGtzqd7isKfEldcc
	FMDh6q68lRs+bRdV/RyQ4np/JyOKFpV59gcEdbdvc9GTkoc4zYIlAMUKee
X-Received: by 2002:a05:690c:18:b0:8b0:cd32:b8dd with SMTP id
 00721157ae682-8b1c6701c87mr107024787b3.17.1793640232900; Mon, 02 Nov 2026
 09:23:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pm-bluetooth-objects-candidate-0184-v9-4094fa28af7bd56a283a-0@gmail.com>
In-Reply-To: <pm-bluetooth-objects-candidate-0184-v9-4094fa28af7bd56a283a-0@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 2 Nov 2026 12:23:41 -0500
X-Gm-Features: AclHuK_r4gnQOsHGOoSkBL1i_04hLRUt4HfVTAlG6GDJlX3jWkppFW4bRVX-7AA
Message-ID: <CABBYNZ+-DMvdpQPTMfR806ZaBx053kg_00q7kz3WCTucziQDxg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Bluetooth: SMP: Serialize root channel updates
To: Cen Zhang <zzzccc427@gmail.com>
Cc: marcel@holtmann.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cen,

On Sat, Oct 31, 2026 at 3:32=E2=80=AFAM Cen Zhang <zzzccc427@gmail.com> wro=
te:
>
> The SMP root channels in hdev->smp_data and hdev->smp_bredr_data are
> used by HCI event processing under hdev->lock and by SMP receive
> callbacks on hdev->workqueue. Power-off already removes them under
> hdev->lock in hci_dev_close_sync(). Two other writers do not serialize
> with these users:
>
>   1/3 The force_bredr_smp debugfs switch creates and removes the BR/EDR
>       root without hdev->lock. A connection confirmation can see a root
>       whose operations are not set yet, and a disable can race with
>       power-off and release the channel twice. Take hdev->lock in the
>       writer, and skip the deletion when power-off already emptied the
>       slot.
>
>   3/3 smp_register() replaces both roots when management powers on a
>       controller that is already up with HCI_AUTO_OFF set, while HCI
>       event processing and SMP receive callbacks can still be using the
>       old roots. Run the registration on hdev->workqueue, where it ran
>       before commit 2ff13894cfb8 ("Bluetooth: Perform HCI update for
>       power on synchronously"), and hold hdev->lock while it replaces
>       the roots. The caller waits for the work with the request lock
>       held but not hdev->lock, which HCI event processing on that
>       workqueue takes.
>
> Patch 2/3 makes that hold for every caller: hci_power_on() runs the same
> power-on update for a controller in the HCI_AUTO_OFF window, but has
> done so without the request lock since commit cf75ad8b41d2 ("Bluetooth:
> hci_sync: Convert MGMT_SET_POWERED").
>
> smp_register() still warns when it replaces the channels on that path.
> This series only makes the replacement safe.
>
> Cen Zhang (3):
>   Bluetooth: SMP: Serialize forced BR/EDR channel changes
>   Bluetooth: hci_core: Hold the request lock for the power-on update
>   Bluetooth: SMP: Serialize root channel replacement
>
>  net/bluetooth/hci_core.c    |  3 +++
>  net/bluetooth/hci_debugfs.c |  2 ++
>  net/bluetooth/smp.c         | 38 +++++++++++++++++++++++++++++++++++--
>  net/bluetooth/smp.h         |  3 ++-
>  4 files changed, 43 insertions(+), 3 deletions(-)
>
> ---
> Changes in v3:
> - Address the hci_power_on() path that reaches smp_register() without the
>   request lock, raised by Sashiko: https://sashiko.dev/#/patchset/99158
> - Add patch 2, which takes the request lock in hci_power_on() again, and
>   correct the locking description of patch 3; the code of patches 1 and 3=
 is
>   unchanged.
>
> Changes in v2:
> - Address the CheckPatch and GitLint long-line failures reported by the
>   Bluetooth CI: https://patchwork.kernel.org/series/1197223/
> - Trim the crash reports in both commit messages to the headline, call tr=
ace
>   and allocation/free stacks; no code changes.
>
> Link to v1: https://lore.kernel.org/r/pm-bluetooth-objects-candidate-0184=
-v7-c26e53b52c260063ab6a-0@gmail.com
> Link to v2: https://lore.kernel.org/r/pm-bluetooth-objects-candidate-0184=
-v8-60106ad0c49170f5bfb4-0@gmail.com

netdev sashiko instance found a couple of problems with this one:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/pm-bluetooth-objects-ca=
ndidate-0184-v9-4094fa28af7bd56a283a-0%40gmail.com

--=20
Luiz Augusto von Dentz
