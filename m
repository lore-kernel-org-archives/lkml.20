Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92FD36D9E0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931937; cv=pass; b=tRSySIx+d+fdzgn5wGDPw94fGpYgzerAqMSCr939RjKoYAOODbudb64Ef+m76H0zOBsLHTjYe3tAQclIi0IOtFx1/tO2/gr6Cd7cpij7eyWeXh/h1yJA8syKzU0vaTwoJgbMvX9+zj2NzSfLoAa9NB6dsGePBkcCrJUpsWt2JAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931937; c=relaxed/simple;
	bh=4k5Hmi2w3haDBLxOGkPPHctNj3pmhYTu676GaexA2eM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0lcZTbXpoC9tJIrvnYA8VJvtYgoRBtZn+sBy4pHKCKkwgNKwSzjH0RTc3eOR2LtoDLz7a54vHOzXZRdlEwFME9KcecIFpHhO3nncrUzNNKLNobkW5yOH1J3vLKl5/+rmUchlzlWUJ9efYFy/FfUsT09xz+EBWdbw2OdvU6pMcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KM7821oO; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KM7821oO"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9d290216d0so130685a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787931931; cv=none;
        d=google.com; s=arc-20260327;
        b=B6Pkpcx+NaN9kFi7098xoe0cvREle37dVP+npXMjOQU71CDm8WbPhAZ6DujfEPXjUN
         V9OqaTS48m4+LmHAbhdm7iWtz6Ay1uuHP9dgXh9wJon81tw+Z8nAIklpj3NbnTOegYqm
         hTlHYsqKR0EV9Ib0jpSOH2hRjt04Q3kZ3LCxFJS0zIWTXfF9ZRy3WmtsWE/P9N+KKBP4
         XbeOILF+sUKXKeOCsBRetH1bgeIedPYKxlurcKDa8H6PVvfs48Jb2mLn6mRJ5iz3RUlw
         u2c+7/N1nEosM/GEWSJ+XilTQowNhCSGD0VHgdslVIJT2RL1qw/bkqWw+vfy/7C7gsOu
         4SJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vJ5XpwnkHox6a4w3pC/S2+0qhPwO5SkHdON4Vp8od9s=;
        fh=qhiW7kUf7UZBt7faqJnz0ugLl5j6vc6+LiIj9XFDeOc=;
        b=G7Ved0QVSfvqjxd3yg0vygsWTw+RXapMvPMo/R7+R2uEt/rcglr9F9Hbscu39MJn3h
         8g2G0+/q6pyQ9G/lh1qPCLXYusfxNDf74hZREJO7+Dt8w+8kGCTp7EAqYvus4AehE8K8
         kVGD18dSumLUC9c+Z0GlV09nsxqmUlf9GQdFjNMPvVXo8g6/avpTRtTnv6WeXDe16Dqc
         7Qg7HpiqW8twnAj36GBIBnqnHta8FhrlEVFiMyN/UYOaeqmCiqYxuyVyd3SUABYPXRUY
         8564zOayoFAQ01Ocs5moOfo+axjtaIqu2pAimCUA7JDJxVopRK8I6gcZ/nDgBwe77UFn
         aGng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787931931; x=1788536731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vJ5XpwnkHox6a4w3pC/S2+0qhPwO5SkHdON4Vp8od9s=;
        b=KM7821oOjoKAA+WIFroihix8ijEfIAQhEhfuvSNakXhrCTkczZPHaUDmFM9I0gGISN
         BsUC3XLsz6d2IDkedz4DMoW309EAANIhGdUda02T4E4vV+oueGvH7aECBlJk2rFU88Jk
         ffS+EllOgdTYx90znr5uYg5e+ReLoRc67R+O1FLXgVw+7lcwd1CAZc3gLHFE+yLJ+/Og
         2uUTORd8Etm8QqxQW9cAVBKS0Gm0TubJaa6x8Z1VH7APUjsYHV9WVxVPHVoIJWNdkl9h
         /SqCBLHLjTmn/RxgFvggtHd1aFYruW+bIWz2NCZ2cYPBOhqHWTVztM4cLHCkr/dmYKJy
         RTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931931; x=1788536731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJ5XpwnkHox6a4w3pC/S2+0qhPwO5SkHdON4Vp8od9s=;
        b=jVnu5uvMZGbNwBiEqfhm3iUx48TZThGQPl1atEQ6XpdmbXFdG0U2i8YN9GhQiPH9iD
         NGZYO+vF+Mfegkl05jRs9KoNCJ15WTb1ZVPWEF7kUwLZHtvDQ/U2mw25+K95TA0QwOwk
         3a003FWqqgQyvcECai27JJLkKyHCioStig3ArtKD0l9d9wTogGHlXKtN+0iH912z6yyg
         WbVYd2vsbz++EGCDYWcVkiOlK8IdXRZX40f9CrGZ1opjZU5xnaUCHuvbhYfIsML4mV5d
         dZTyuwovXzvliLP23YuC97Uo0ljhQZm/wKltg4L9OHRh7T1QV6tcSk5F3aNDrMq09giD
         j6/w==
X-Forwarded-Encrypted: i=1; AHgh+RrwlqywodpH5w6gLnVw9LmSZrGoeJMbcSANYBEr1oWdRFColMVVS4Uhr80FydKJI0hr3M5jgIgVh2P9bU0=@vger.kernel.org
X-Gm-Message-State: AFuF++lF+rBqvXQpA72MQlLF3NtFp8IPxu5JRByXHXfcLSPzjK1czNP9
	5WTACv7X5y5+xWORI6r8LX1Eqp6OLAADwtjBYpGq4U02wAslHyrlVRZnTqSUJDpKGTGnu4BJNfC
	D2q4aSg47QEorl2vGHbzB/uybKfX41m8=
X-Gm-Gg: AR+sD13/GNuB5kI1IqY4p5iBnbnsdkWoh8/NjnD90+aRFWoIz5TbLRsmmVKry3nk7by
	QqiYSxWS8Xi5xiRKRoQIf+M80by+3+dbp94yVHPMC1jHbMqmocoWXjMKzzAZhAOFe/++TkBymg2
	wb0Y7gFwjkASRtgspTAqmfPSeSztPS9izLwWCXrLjGKI6kmV4lWmUpEJ54zxFiIC0U4VItzDtcl
	JfitXpFHvuigBd263pzXIZ5qllV4aggvTAgQJwzFYxSDVW/uOYv2TUFkUcEywgN0Wh2kjq3POyH
	8S/AaegONi2A2ZQMUxZox5Mq1ZkS7ZbwtJD0LzORy32D0ZW6JWpuSGctTvkippWHep/ju97ggYt
	twyG+hjD5JUXt1q0SUM4rv70mzWV0j1Q=
X-Received: by 2002:a17:90b:1f8b:b0:396:a47f:d38f with SMTP id
 98e67ed59e1d1-396d1042d5cmr8007195a91.3.1787931930762; Fri, 28 Aug 2026
 08:45:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827010802.56422-1-yanglinlin@kylinos.cn>
In-Reply-To: <20260827010802.56422-1-yanglinlin@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Aug 2026 11:45:18 -0400
X-Gm-Features: AcwNN1UYBdRuALeVF9bH1FXOugA6dKfisK_IHiNKuZW7SAtdOSEUBOQ6I0dUBI4
Message-ID: <CADnq5_Pmd=LBP4BPD4KZCrfraKyHbB6R46KLJB4yjSiyTHJOJw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix misspelling of "overridden"
To: Linlin Yang <yanglinlin@kylinos.cn>
Cc: harry.wentland@amd.com, amd-gfx@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Thu, Aug 27, 2026 at 8:47=E2=80=AFAM Linlin Yang <yanglinlin@kylinos.cn>=
 wrote:
>
> Fix misspelling of "overridden" (missing a 'd') in comments.
> No functional change.
>
> Signed-off-by: Linlin Yang <yanglinlin@kylinos.cn>
> ---
>  .../gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c    | 2 +-
>  .../gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c    | 2 +-
>  .../amd/display/dc/link/protocols/link_edp_panel_control.c    | 4 ++--
>  drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c               | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30=
.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> index 33b5136f7ce3..75bdad22bf69 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> @@ -1805,7 +1805,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchPar=
ametersWatermarksAndPerforman
>         v->DISPCLKWithRamping =3D 0;
>         v->DISPCLKWithoutRamping =3D 0;
>         v->GlobalDPPCLK =3D 0.0;
> -       /* DAL custom code: need to update ReturnBW in case min dcfclk is=
 overriden */
> +       /* DAL custom code: need to update ReturnBW in case min dcfclk is=
 overridden */
>         v->IdealSDPPortBandwidthPerState[v->VoltageLevel][v->maxMpcComb] =
=3D dml_min3(
>                         v->ReturnBusWidth * v->DCFCLK,
>                         v->DRAMSpeedPerState[v->VoltageLevel] * v->Number=
OfChannels * v->DRAMChannelWidth,
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31=
.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> index 8064c4b3fd25..3f62ea493787 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> @@ -2045,7 +2045,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchPar=
ametersWatermarksAndPerforman
>         v->DISPCLKWithRamping =3D 0;
>         v->DISPCLKWithoutRamping =3D 0;
>         v->GlobalDPPCLK =3D 0.0;
> -       /* DAL custom code: need to update ReturnBW in case min dcfclk is=
 overriden */
> +       /* DAL custom code: need to update ReturnBW in case min dcfclk is=
 overridden */
>         {
>         double IdealFabricAndSDPPortBandwidthPerState =3D dml_min(
>                         v->ReturnBusWidth * v->DCFCLKState[v->VoltageLeve=
l][v->maxMpcComb],
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel=
_control.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_c=
ontrol.c
> index 16951a9550f2..d3fe6e024891 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_contro=
l.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_contro=
l.c
> @@ -108,7 +108,7 @@ enum dp_panel_mode dp_get_panel_mode(struct dc_link *=
link)
>                         /* alternate scrambler reset is required for Trav=
is
>                          * for the case when external chip does not
>                          * provide sink device id, alternate scrambler
> -                        * scheme will  be overriden later by querying
> +                        * scheme will  be overridden later by querying
>                          * Encoder features
>                          */
>                         if (strncmp(
> @@ -124,7 +124,7 @@ enum dp_panel_mode dp_get_panel_mode(struct dc_link *=
link)
>                         /* alternate scrambler reset is required for NUTM=
EG
>                          * for the case when external chip does not provi=
de
>                          * sink device id, alternate scrambler scheme wil=
l
> -                        * be overriden later by querying Encoder feature
> +                        * be overridden later by querying Encoder featur=
e
>                          */
>                         if (strncmp(link->dpcd_caps.branch_dev_name,
>                                 DP_VGA_LVDS_CONVERTER_ID_3,
> diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c b/drivers/gp=
u/drm/amd/display/dmub/src/dmub_srv.c
> index 204375f1eff8..587d26c742cd 100644
> --- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
> +++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
> @@ -584,7 +584,7 @@ static bool dmub_srv_hw_setup(struct dmub_srv *dmub, =
enum dmub_asic asic)
>                 return false;
>         }
>
> -       /* set default inbox type if not overriden */
> +       /* set default inbox type if not overridden */
>         if (dmub->inbox_type =3D=3D DMUB_CMD_INTERFACE_DEFAULT) {
>                 if (default_inbox_type !=3D DMUB_CMD_INTERFACE_DEFAULT) {
>                         /* use default inbox type as specified by DCN rev=
 */
> --
> 2.25.1
>
