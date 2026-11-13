Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594306;
	b=10wQ+JYmM0/B1m7stoAJoNl37vWyRCABKasAZR+CPzZHFLVNCm5YHEU7g9nxzmuN4X1g
	 8itxk16E1pc6HkEJOEmJR1S5vwxXSHo4opBBBiyEIL+EPJGMmE448+eF3pNKdUWSP6opz
	 CdAoSFaUROlYeSfQD85UqbH8V9tcAibr2pZJgN2/FJVhlo328QACok0EzzIvSrysHxjDd
	 a5lXVeC7h1HGtS1UN1gPm2btyhr3xu6q8O6NVBREYRhFVrpu2J4lsVL3kqlPiburPV1NM
	 tuz4f9n0fq968MM0+i7MCB3KQ2dWvj9Il4L4BgxUjCO8Jg9MLJJZSymo88WHmUSZuXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594306;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+4+M6Qf8kgsKLvqCkp78aI5bxXP1So+oEpWQ/VILqxM=;
	b=AXYfxOeGTEevmUK7elO+2nK3ZNnRMgX/K3VLMe2CkpxbgdqU0wkdrkJo4cbuADyAo652
	 tvBDzlfHq3lYe/SouHs/wjGUQnoNgr0H8j9c4OhDEE1b/tOgLA7Wp4jFnyS6fJDmJ/kv0
	 1sdeigd4gQXKrhNCsyqEM0sXWpxF2bDw7yGu/eLGo1iTNkBom93o+0yg+Nq4rGubZJbFk
	 U8WLVWzYhb64UL1ACdACL25N0O1FOk+mVSepKiqQD1MuhoETNHG0vl+iClkdvjiEMjmlm
	 BZnDJJJUcYLj+Avdx+cSzhRMw50QMlhpcQRxinUT3JJa5c+AH8lTbSS0rypV48Edg1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gompa.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F36606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F36606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-71acdd32a53so59116eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594305; x=1795199105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4+M6Qf8kgsKLvqCkp78aI5bxXP1So+oEpWQ/VILqxM=;
        b=T/JQSGOm3K5XxxU5wzgx/5p3XvGQ+xnkAMnRRCnAjnk7yoGpWPDi94Yph7HIsJRSIC
         JmlAdZCqRfsLy3PA1YLMp5i0wibuwkpjLQ+x8a2hfW1tFOm9152DAGKBawT46MjUsaDN
         t3C1NSPXZtzJKQOGpOjbtDbhmV1xfrksaqSojxDHa4n71/yp8JX7Viz/ofZzoZb26bX6
         DiO/3jxpsUTRQl/rkb7OxwumVMc5ADF10m4WHTl4XtJyiBlnJU132KMZcHfKaqb7Wbgp
         MyROD+E4xTsCPxzqNklHOaoX5RHMF7FHgyV96hcIljmmmriY87H7Q3hNWWl8zEZmVsyg
         Watg==
X-Forwarded-Encrypted: i=1; AL+hErHMQCSEWbcpmh03nU9iJDHHBybamPRR0PJdXAU7ofjeELOZpu2yy8RAIgkde+ZQkElqDhZk6iz6SYLjg58=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GN/mdsNyAoaQP9FDI0ywT11TcHUHxIyVI5bXySJd5Xs5XzuZU
	fTo0RANtImHcO9LvcIwM+je5iRMr3twN2+Z+Og6FVWFsE8QCjntedG5CqGw5/g==
X-Gm-Gg: AYBFou3almoezDubPlu5CqkNtiJAZXxVauGn/96BdfZ4FtXiBxDCwf7+FTr6K+UpV0R
	Bets7ObmkJCk/nYN1cD7TSVgNgRhfp9U3v+vaw+OSLekiFsssBwpU/XyQA/N8LYgi/GmfvebrH4
	FZ1h4EpUV4lvZYutoCiQleNRUyT0cG0XSDVqRlOwITUQdMv/rWvgGnr4y7v2ivyXlCojIAUVjUy
	t51dbxM0WkQ2J0ac0YhDRQ2KiyFQzxA/70I8ClolAuin+RcEJOUSemUyKLaT/rpXA9ahPM7Rr2Q
	NZ1leUsN2ZOyQpmu/CodTwYPvIS+wPLGHeDdiz/KzWQAyfjXUi82aXJQ/n11ZhZGYdrLIxVLVGm
	WX30NSkmQscGtJeQ+jBS/FawC0FeojJ5seEmUerd3669FlQ/7WOYEkyjzVXIsPn9c7STcDE4VVK
	79Zu87e/TVaRr20fMJig1EGEH7yRGfymHLqp3i8Q4bS47UBoAfJvBlOa07jB2sssPO24SCYLYFG
	U+DOWm9EryEurXFxH1a/Az5M42R+gazYwMBIhMAM0prSeqGND6QXbJOwFubztggonK7LLH35e91
	V6UYAkdOutJ6p68fD72SuDDZtpo+9YEmS4Va+wnBmxiAX29/jsWEONBb9k8XXDJpUK1HNzNnlVR
	03tJnWnNob0W9ITcFWqj+2iIByjYactwqioR19sUDPg/CqiJ/pImR9VwU3xzaiIqMIo2ef4RKM/
	jbo5zRPhuEbFSEW+4i3nJ4jQ==
X-Received: by 2002:a05:6820:a088:b0:717:10a2:8997 with SMTP id 006d021491bc7-71ab51381a1mr1737005eaf.69.1794594304894;
        Fri, 13 Nov 2026 10:25:04 -0800 (PST)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab428b337sm2406396eaf.4.2026.11.13.10.25.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:25:04 -0800 (PST)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8479f46ecd8so452418a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:25:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF3x6uYfcaBKGshDY6qa1gxb6a/avAgCby9/adCAd7d2whM7U+DqLdHmEoWxrymXUip7HS3KvgYoFR8fQI=@vger.kernel.org
X-Received: by 2002:a05:6830:2695:b0:83f:f24d:fe19 with SMTP id
 46e09a7af769-8628979e65cmr3203276a34.3.1794594303480; Fri, 13 Nov 2026
 10:25:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-6ghz-v1-0-0b9a67e413a9@gmail.com>
In-Reply-To: <20261113-6ghz-v1-0-0b9a67e413a9@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 13 Nov 2026 13:24:26 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9XODS=vU-tjZev90Rng6D_B+9vxek96mV8yUpXwoQ7GA@mail.gmail.com>
X-Gm-Features: AclHuK9fW5jJ3rn5jJzhWh_iZufJsywX71GMdWHbE-bhsHtoOzuaNfj98eY9hCo
Message-ID: <CAEg-Je9XODS=vU-tjZev90Rng6D_B+9vxek96mV8yUpXwoQ7GA@mail.gmail.com>
Subject: Re: [PATCH wireless-next 0/4] wifi: brcmfmac: Add support for 6 GHz operation
To: michael.reeves077@gmail.com
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, asahi@lists.linux.dev, 
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org, 
	Daniel Berlin <dberlin@dberlin.org>, Yureka Lilian <yureka@cyberchaos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 4:20=E2=80=AFAM Michael Reeves via B4 Relay
<devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>
> Hi Arend, all,
>
> This series adds support for 6 GHz (Wi-Fi 6E) operation to brcmfmac.
>
> It includes HE capability advertisement, 6 GHz chanspec and band
> handling and PNO version 3 support. The PNO support is required to avoid
> channel-number collisions with 2.4/5 GHz during scheduled scans.
>
> It is adapted from our downstream work in the Asahi kernel by Daniel
> Berlin, but reworked to make the code cleaner and more maintainable.
>
> As I don't have a 6 GHz AP to test with, Yureka Lilian tested this
> series on my behalf, on her Apple Silicon M3 Mac (BCM4388). Connection
> and use of a 6 GHz network was successful, without regressions on 2.4
> GHz or 5 GHz operation.
>
> Thank you for your time,
> Michael
>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
> Daniel Berlin (2):
>       wifi: brcmfmac: Add support for 6 GHz chanspecs
>       wifi: brcmfmac: Add support for the 6 GHz band
>
> Michael Reeves (2):
>       wifi: brcmfmac: Advertise HE capabilities
>       wifi: brcmfmac: Add support for PNO version 3
>
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 477 +++++++++++++++=
------
>  .../broadcom/brcm80211/brcmfmac/cfg80211.h         |   2 +
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       |  68 +++
>  .../net/wireless/broadcom/brcm80211/brcmfmac/p2p.c |   6 +-
>  .../net/wireless/broadcom/brcm80211/brcmfmac/pno.c | 147 ++++++-
>  .../net/wireless/broadcom/brcm80211/brcmfmac/pno.h |  41 +-
>  .../net/wireless/broadcom/brcm80211/brcmutil/d11.c |   7 +-
>  .../broadcom/brcm80211/include/brcmu_d11.h         |   3 +-
>  .../broadcom/brcm80211/include/brcmu_wifi.h        |   1 +
>  9 files changed, 585 insertions(+), 167 deletions(-)
> ---
> base-commit: 3c311bf321442d4c4f452a1a08bc9efce242a1f9
> change-id: 20261113-6ghz-a8d587ab3cce
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
