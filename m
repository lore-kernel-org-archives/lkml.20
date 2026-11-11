Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794367589;
	b=yIw9l4BcEP9i4CbcSxWAAwiyf5j3Lw6XjTZgcQ0UZwbA698SzAkY8MJLGqZKDhnjozoB
	 i32sk293s7QcWpUyow+Tzq2GbvCPveBDqsQPpjclVJ0ugG74VNlzWu3UhXQgS0mA6DN5R
	 GEjqUWcmNpSTXusyihpdJynj2ePePRmNGy3qf3YMCa/LECLw8cIMIUufONjyMTG7pU8AE
	 ljhLdaqnS+j8Vct3AAvxyQaSFeCW+xCnIdp09qCXF+rW4pmrSRJEgdK2KAMM+kKVPQev/
	 97mPISKiC25XVjDjNQ4gBDacfp1tZ8d4manEo6c3kl1iaYB0uSAlvZ84P1i4VmxwlyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ap4cqG/NlhaBcpOxORsgSraKiaepD805iasuc2oGl0o=;
	b=UWtMVFxKPVM7SXZ2XD5EmwDwMKGsiOu0eP/bngvE1OGsSXOeq2RqkuWPf4GVeOFK1g/K
	 mw460K0k/K9E08EYKRy2RGrwaPqxJos92K6TYy3cxg2lCIPNhS7mIYZv8NHPUYNLDrfgm
	 L9OUa2iBPpYWcVKosCdu97Mbeavrqi4oeDs7pG2UrMLpDs3eRJ4/zhGWoqQ1UxmC8FXo/
	 8qe0N42mPTkPmogZBoYaSY2xX50M16E1vy6qjEqY85Shp61FtWM14CPjMmVups+T5wD3c
	 hglqyGhdHlM4BFLDgHny7bxh82aE6Ea5k/s7o0M5wipjb4R3uqFo7NUScDAD+rCgq+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVaXykki;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3B6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C3B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVaXykki
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-483c607ccb4so1495819fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:26:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794367588; cv=none;
        d=google.com; s=arc-20260327;
        b=G5dzch/uLYVQ5kA8jx3it/DIHnq+9b8LvfXH49R51j2q4RI0R6dd7VluGEaBTNSKNW
         M3sBKT2dbuNfcB7x1iObf8S2/hZU67HgpdGFCPKE38Wy+orgIL8WmmsqjaQPhXfpGxH8
         rQbqmdSPPsIkbAFKFH288Vilkr3SsKe5kiUivlUvRUxu/oXPMOhMH9W1hRsLaG8Pdzsu
         lfFKysezS4av+wEdWIaZxyvbLBeVwf4dsmkghGt9/Wf5O3JQyWNb/uLhuWFlnQtyzlW2
         bPuTr0Ah6o1TixlLOuaMNtyR3BZ2YnREtVWYST5cNJzqLEspQQNaIFr8H5WDSKP3GkZc
         c+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ap4cqG/NlhaBcpOxORsgSraKiaepD805iasuc2oGl0o=;
        fh=gaE0S7LC3hQL+EMAmccbIfiq1VIc9hZDnjQEL1BlAbk=;
        b=CPyi5AT6fiADRM6Axq3n5hbzBLIWkuoxcxk0TGRKZgXju/8UmvOH722vDMuxqaDS8U
         0CRSeqjyL93ItL2wxZox7azn8BIctBbY8+T+8WmPR5qCLHikYq+0tgJD73owPQt3tQty
         PVf/+8NJynYSYBMJBWuZ2ksiILRaxneaJu+AYkcQbnhsSQ7568xkmSTQhdk++2S7cUJU
         3v5405kmkhUpZjr90StLbxXuIpkHsKMPS6eMNVnqR753oaliD9r0K1r89yVeylC0l1tR
         EqAvToCB/DLU6SO63snovEztqcjxXwnBXfHNZQrLmOl/dHyMNul6zFgmXiT6spyAh7bK
         Eo0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794367588; x=1794972388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ap4cqG/NlhaBcpOxORsgSraKiaepD805iasuc2oGl0o=;
        b=RVaXykkiSSSAMExeP+SVx+eLRmxgK89uLqvgvzlzjoDlQhFBqoZdLOVYIvy87xKgSP
         s9rIugjeBBbkr9bH9mcGyU3mzqpwecMQJSvNV4pJFCb0zzFHHLRZbxgxKTXh2lXE2BTi
         EY9+GHN8Ak+SCZkfx1lP5LWqpnjiT80Aa/ws+QonBmd31DDvbIYukiOwjWGvgKQ8VYEw
         dKWlBmhE57OjgzRmbN2Hqc9jOpirywMrhPSPDIbQrSqkLAzQfGFCLUR+m9xo/KPKiPYD
         LS0Y4xSwWX3EktvJbxa4bY0sKzNnunR5Aalx09gaOVllYLnAbzPahsbDezqDReDdQlHk
         NpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794367588; x=1794972388;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ap4cqG/NlhaBcpOxORsgSraKiaepD805iasuc2oGl0o=;
        b=D2TGtXlIR4+L6Co2gwDdvtaqJ9fBs70Z7BIy9y5+OUs1QBdHOQutdbzx6/mv6pCjgK
         JPCjHL2NSF1IrnWOYjWXokUgC/zKC09xmnWtFfu7/AC2iPGR6zVRQuc1PsZgnC3yMol/
         nreULd3NOyIEDL0zvqLYuGUvov0abs1zibVQai2vdr3Ot0xWK+ngl0/OVpC2mYTg0bG1
         bmL0mtKZH8rLpakor9Uv2wgXVvAhjvpN8y3G2w2fFQmNaosfobaVJucmkIVqSA8wiFp5
         nQTZm9xEH7EJDigYyrzQdAoIadF8W7XhwKcYZS/Zd1T5fPcGzVM4pirbsXxsQt0FfTse
         qlTg==
X-Forwarded-Encrypted: i=1; AL+hErHn3CfGoQH1lpi1i/v7pEWkU7C7QBMgx3btxS6xND5OH0Y2t2pyOUUKi51Skbn2p72V1mHWScg2MDo9gIc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RVrhfZaRgrbC8h4afgwMKPtEFfYcjTCfMGKqcPnezCYBCb0gT
	1ApQVJmygc9VRcuC9kLHSIFPN9xOXpQ8pcWIfwN2kONPm3Q5Q7N5H+789l3XLVh6vxA3tjJdJHK
	7IY+8cVY2u7yF0Nk0kxP5d7l0vxbJUFUdzYCVRXA=
X-Gm-Gg: AYBFou37VkF9Q/gd7IW76FBR2j+lwN514+i4/QYAnYuV4CL89sttmoy+a527+DSrq/t
	YeZLrXzqJTMl2XFopxKQ2CtNOgx2gPdNemsmkA3n00C0wBpjSHlY4uowONFlGOc8X3NwluesQW5
	YYMRXRIp579Kc/BqNzvOSoi8WJMaRyExArImBCkW5xJ5xPDYj/Lh+MNli5iBW7ydH3j0hUSstoI
	djvaiLIzPskzYiIB/R9p9QJYncjYsvby6n8jm7gHwaNbjaBo5eWUyZKejORn4yodCTUcvhtKamY
	yzVbNRN2Uyb/wgEtVeZ2KcYGa5dXcyweoXPI7wE+G5Jq6Zr6wfYbRveBwNGXhd+pUtmFvStCIKK
	xiJZzt2yn8MyUCMxiPDhSHGAXHB/9zi37/QnujRsK/VTQ51d+lUB+0nrHuZC8e2NjQEtRbaoXDT
	No9zDWmwsBtFbJMSMClfZXt7oZiIRos2zjIO/W9g==
X-Received: by 2002:a05:6870:1b0c:b0:49d:c3f6:4191 with SMTP id
 586e51a60fabf-4ae46b7ad9dmr1244368fac.18.1794367587733; Tue, 10 Nov 2026
 19:26:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111111455541qAdd9RB0rUfpsuO-qYSne@zte.com.cn>
In-Reply-To: <20261111111455541qAdd9RB0rUfpsuO-qYSne@zte.com.cn>
From: Ming Lei <tom.leiming@gmail.com>
Date: Tue, 10 Nov 2026 21:26:16 -0600
X-Gm-Features: AclHuK8mU4knlc3plyz22hZSYsu_-l0cLAdxqzPq_sYq1-iZJfcdOG-JJduA6g8
Message-ID: <CACVXFVMgLsPgGV=bVgnKY0h14RY=P9Q5j_+14ZKfg1xjLowVDA@mail.gmail.com>
Subject: Re: [PATCH v2] ublk: stop reporting zones on an empty response
To: shao.mingyin@zte.com.cn
Cc: linux-block@vger.kernel.org, axboe@kernel.dk, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:15=E2=80=AFPM <shao.mingyin@zte.com.cn> wrote:
>
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> ublk_report_zones() treats a zero-length zone as the end of the current
> server response and keeps asking for the remaining zones from the sector
> after the last reported one.  A response that carries no zone at all
> therefore advances neither done_zones nor sector, and the driver issues
> REPORT ZONES requests for the same sector forever.  Both BLKREPORTZONE
> and the zone revalidation done when the device starts hang, and the task
> cannot be killed.
>
> Only a response with no zone cannot make progress.  Terminate the whole
> report in that case, and keep following up on a short but non-empty
> response as before, which is what sd_zbc and virtio_blk do.
>
> Fixes: 29802d7ca33b ("ublk: enable zoned storage support")
> Suggested-by: Ming Lei <tom.leiming@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
> v2:
> - Stop only when a response carries no zone at all, so that a short but
>   non-empty response is still followed up from the advanced sector.
>   The v1 form ended the whole report at the first zero-length zone and
>   truncated such reports (reported by Ming Lei).
> v1: https://lore.kernel.org/all/20261109225110056QQJAEflTHzwYHzwXlMBb_@zt=
e.com.cn/
>
>  drivers/block/ublk_drv.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> --- a/drivers/block/ublk_drv.c
> +++ b/drivers/block/ublk_drv.c
> @@ -661,6 +661,7 @@ static int ublk_report_zones(struct gendisk *disk, se=
ctor_t sector,
>                 struct request *req;
>                 struct ublk_zoned_report_desc desc;
>                 blk_status_t status;
> +               unsigned int i;
>
>                 memset(buffer, 0, buffer_length);
>
> @@ -689,7 +690,7 @@ static int ublk_report_zones(struct gendisk *disk, se=
ctor_t sector,
>                 if (ret)
>                         goto out;
>
> -               for (unsigned int i =3D 0; i < zones_in_request; i++) {
> +               for (i =3D 0; i < zones_in_request; i++) {
>                         struct blk_zone *zone =3D buffer + i;
>
>                         /* A zero length zone means no more zones in this=
 response */
> @@ -704,6 +705,10 @@ static int ublk_report_zones(struct gendisk *disk, s=
ector_t sector,
>                         sector +=3D zone_size_sectors;
>
>                 }
> +
> +               /* An empty response cannot make progress, stop asking. *=
/
> +               if (!i)
> +                       break;
>         }

Looks fine, and verified with one ublk zoned server which returns
empty or short report: BLKREPORTZONE & START_DEV don't hang any more
on empty response, and all zones are still reported on short response.

Reviewed-by: Ming Lei <tom.leiming@gmail.com>


Thanks,
Ming Lei
