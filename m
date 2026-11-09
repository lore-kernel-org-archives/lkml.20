Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251798;
	b=oNnL5p72mbqveXku3/OYDYG1NoC3zX2bUM7xhEjra5Jkof/qMy4vq/5/1v7hVkQSxu1t
	 szJ8mJwF73l/Wq1CgmKxbyDr84XrXZ4TkwyhonDbjtktux7XfUBNwH8DYFMFv3K6hdcjs
	 GCSr7gUYADzuOAQeSA/xxJOtwgQ1UEEZSsvHLEYZaB+PAoBkklipQ3HLSQJljIIoyY5s+
	 wSE+K6RHQiQZFTWmQUUkc5z/Yqs9MXGFYvJG9+5lGvxenrHN4q2JDsD6xIE98SMBL6/Mo
	 vZLm2bYbWXmbsBl541kTWGJPcKbaT78Jy0+pbuizKHChn5xTwt87pCU5v5Vlfcmqipw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251798;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hKAQdA3xa/ca1jx07L9rSksx5n8SHXVGckAyI+PNUn4=;
	b=VzYn5czKXT83Zl4kr7hwlh6PoHLgo4KmV08virEDgu2X+PGxWXmKuN88KXne5R1obPqi
	 BLo6+1Fm7RcAMDFR0yWcI7SpI4vs2YzHZWf+qvWlPI4hhrW/IqAGIb+U2RbucvILQm7Nf
	 eiI51YgwCcvnKDgoWrD+pfDWdcbIlOYrSrCoNfquR/oeAgsYw5TC5VtRIgGbIsuKJGtX9
	 WnyfnuVUZ1SGOg0+Bbu078qoitXDz3K+beR8SQMgz7cTsmI7Ig2wYHzAiNhmpR6Kz9bAW
	 EhqSwxssULEUETgpBC4XpUOEHANSrR+kXM11ObMUvbV6vvuS+mMD0gVO1YCr9CXKi7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YK+1B2jN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9B5606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YK+1B2jN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A5D1F008A2
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251797;
	bh=hKAQdA3xa/ca1jx07L9rSksx5n8SHXVGckAyI+PNUn4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YK+1B2jN/k2S/q7Bau/EZiMetHzk9oLZCRIcrM3auKnbLWOAT+uelMatzkdXaNTod
	 3/dwKhVfpiTNHxxfZvjURrOhvpc5AbUzyqqL8lOHAoAA6OVoFGpFRops19+rBopTao
	 wkotyM0DgerObW4nQ8u4GN5rm7l3bW1GdSjkitXKdGBTzYyP+sKBd3dTdmEf2Wjk7i
	 mXXGeu/GLhCtwiK6TCaD42k7Riw66oNIheWDAh0zrktbe1br/RUgOmOvG/a1+s5KbB
	 9cbvlRIuQVdHpdGyGL9n7FaULAQOXjCPuQFPLcOaNN845Uc8b6e/79pmkWYavPRrBa
	 F05TrVdqFRVXA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3acd523a802so10710641fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:16:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGx1/s/gupopudysOaFltgFKR70rrX3+eaoZmdKH2wERZL7plmc17V7gwoIwIkeVSSQx/0MCSYa2Nta9tM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pn4b9LTBglIHmD3dI+P0a8m42/FvHH2q1k2Qh93EAZ2PpPcsU
	Zx1NnAHz1T4+92uvDhtMnV5twHm49pXdVNEkzJTEcTJyn7+cokSoycW41aXtyylDcsFex5g5H4S
	lz4T88NxcCFrr7WWj7OJHXHWk+1gXdmM=
X-Received: by 2002:a05:651c:1612:b0:3ac:e5ef:1b8c with SMTP id
 38308e7fff4ca-3ae0961fc0cmr447841fa.11.1794251796214; Mon, 09 Nov 2026
 11:16:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-acpi-sbs-serialize-v1-1-913abf8ed30c@gmail.com>
In-Reply-To: <20261020-acpi-sbs-serialize-v1-1-913abf8ed30c@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 9 Nov 2026 20:16:23 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gaTgn-L8R8X_XWesxDNJsCybM6-Wyj4eo6CbOa16ueOw@mail.gmail.com>
X-Gm-Features: AclHuK8KPeR5AAr78YhZ8OA-lcxrUTleUxc9Kx9JKlQhl_Z6Cxy6hVNYGjEtgQs
Message-ID: <CAJZ5v0gaTgn-L8R8X_XWesxDNJsCybM6-Wyj4eo6CbOa16ueOw@mail.gmail.com>
Subject: Re: [PATCH] ACPI: SBS: Serialize battery state refreshes
To: balthasar978@gmail.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 12:58=E2=80=AFPM Penkacelsus via B4 Relay
<devnull+balthasar978.gmail.com@kernel.org> wrote:
>
> From: Penkacelsus <balthasar978@gmail.com>
>
> acpi_battery_get_state() refreshes the battery state at most once per
> cache_time (1 s), but the check and the update are not serialized:
> callers that arrive together all see a stale cache and each read all
> seven state registers over SMBus.
>
> On T2 MacBooks (MacBookPro16,1: SBS battery behind the EC's SMBus host
> controller) every SMBus word read takes about two dozen EC GPEs. A
> desktop shell that reloads ten BAT0 attributes in parallel every 2 s
> drove the EC GPE to ~680/s, which kept irq/9-acpi near 16% of a CPU.
> Readers of a single attribute file each get their own thread in such
> shells, so the race is the common case, not a corner case.
>
> Serialize the refresh with a per-battery mutex taken in
> acpi_battery_get_state(), so that the power supply readers and the
> SMBus alarm callback share it. The first caller does the SMBus reads;
> the others wait and then find a fresh cache. Use a new lock rather than
> sbs->lock: acpi_sbs_remove() holds sbs->lock while it unregisters the
> power supplies, which waits for sysfs readers to drain.
>
> With ten parallel readers of state attributes every 200 ms, SMBus reads
> drop from 26-29/s to 6/s (the cache floor) and EC GPEs from 600-670/s
> to ~140/s.
>
> Signed-off-by: Penkacelsus <balthasar978@gmail.com>
> ---
>  drivers/acpi/sbs.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/acpi/sbs.c b/drivers/acpi/sbs.c
> index f10bbf13c..861739b18 100644
> --- a/drivers/acpi/sbs.c
> +++ b/drivers/acpi/sbs.c
> @@ -55,6 +55,7 @@ struct acpi_battery {
>         struct power_supply_desc bat_desc;
>         struct acpi_sbs *sbs;
>         unsigned long update_time;
> +       struct mutex state_lock;        /* serializes state refreshes */
>         char name[8];
>         char manufacturer_name[ACPI_SBS_BLOCK_MAX];
>         char device_name[ACPI_SBS_BLOCK_MAX];
> @@ -355,6 +356,13 @@ static int acpi_battery_get_state(struct acpi_batter=
y *battery)
>  {
>         int i, result =3D 0;
>
> +       /*
> +        * Callers that find the cache stale at the same time would each
> +        * re-read the whole state over SMBus. Serialize them so that onl=
y
> +        * the first one does; the others then find a fresh cache.
> +        */
> +       guard(mutex)(&battery->state_lock);
> +
>         if (battery->update_time &&
>             time_before(jiffies, battery->update_time +
>                                 msecs_to_jiffies(cache_time)))
> @@ -367,9 +375,8 @@ static int acpi_battery_get_state(struct acpi_battery=
 *battery)
>                                          (u8 *)battery +
>                                                 state_readers[i].offset);
>                 if (result)
> -                       goto end;
> +                       break;
>         }
> -      end:
>         battery->update_time =3D jiffies;
>         return result;
>  }
> @@ -530,6 +537,7 @@ static int acpi_battery_add(struct acpi_sbs *sbs, int=
 id)
>
>         battery->id =3D id;
>         battery->sbs =3D sbs;
> +       mutex_init(&battery->state_lock);
>         result =3D acpi_battery_read(battery);
>         if (result)
>                 return result;
>
> ---

Applied as 7.5 material, thanks!
