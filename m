Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095081D6DA9
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280732; cv=pass; b=ML4YHyDJ8Txs8km9UT9xya6xOKbK9BOX4hGtAwFYOvmRzN6EmfqH5Lt8e0fbZRy6Jhsotxw9N7RVvovJJI//+FI1t4zcaD4k7jkQRIA4W2sBepVVUA+OOQUujoHPbTK9qFU5p3vNbjZ3BZ1wX86i0bL/S7hE8lDiJ5CgzfpfQNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280732; c=relaxed/simple;
	bh=TfgIkUJeKpRApK4VOrWPIGRugIiFcyG1Fg1a7IGEwM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HpheINs7iCynnqOQIBGCai29ck1hCqBWMukyCMaOGwWo2B7j4X29uKzh3TECIzE3VjQNuV/5mCMU8Wo/fKXAOYVdolE7X9J8qnt+5ZxdbI3ybfylYJeAiOnWD7dJpTgqDbCFSgVRwTZYxMFKm+4qCFwyI4zUP2jIrnC0o3Y1Frw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citymesh.com; spf=pass smtp.mailfrom=citymesh.com; dkim=pass (2048-bit key) header.d=citymesh.com header.i=@citymesh.com header.b=ONudnpbK; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citymesh.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citymesh.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=citymesh.com header.i=@citymesh.com header.b="ONudnpbK"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so3755176a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:58:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791280729; cv=none;
        d=google.com; s=arc-20260327;
        b=pY89rkrjszaAuDaFChABc0jvCwR2r/6QYkHJQ4Rz7oUKbUCd6Mfapil1edx1khEHlD
         d30zP12fYPyMA/jCKVGyah/Fi5ZB72tF9WYtSwlCjRCfVc7mpoIckmxP5TwnJ7TOmN8u
         IY7nRy4EPve36Vz6NCH9j2lbQqIMBuHIOOFqJic2/utIFuCL976AlETEORzdtRH35xF0
         fWAe8RonPJNc1T4UEeyBTSheKtwKOTGg2dUoUVX0iWn7ezGEmbLxSb+sn3R4qIwVZEpy
         hhoFEjBd8+j3v21z/Ig46NGBqec4xEYxRWk5/wlFzbROwZTUDmll1p4aazMoDe53IvJU
         ATpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TfgIkUJeKpRApK4VOrWPIGRugIiFcyG1Fg1a7IGEwM8=;
        fh=MkN9km9TF8s/SObdZ4OCB+Z+AFXo/20Cviyqk2nGKFA=;
        b=k34EpwoTNz8okWGcujuSMINe/gusZEQH3jckVuvaW1clQlC6lqCCgMc5OhCvmnYss8
         K+eZqLSNWBhwSVwzKXJZuA1x8XVkfQ/cnml02UdhS2QaCxjWMXb7QhOMvpA5k6wL6Ug4
         VYgHQVW/Uyt12S9l0YYsREslvrBRN7PfU2O3Dx6mG/hnNvw1A0nxEkY2j6GD8Q0FWuZu
         IgVuVLqbLa43+FXSHWzC+wnwPjhbB4KqVStx96cDG0dxn7R7eH5QoOO1LLmO6W7qoN7G
         1lFqjZ+EdXK4j6beqESpvVvPYWLCMQMmjVDzfpn8XnZTEwBJ9PSzcp7jDZF76EMRWlki
         GwOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citymesh.com; s=google; t=1791280729; x=1791885529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TfgIkUJeKpRApK4VOrWPIGRugIiFcyG1Fg1a7IGEwM8=;
        b=ONudnpbK1Wyc/dClYap/PNdxYSDb83qMycBufPqBIdWAC47/+mDXpZzmFvm/mcVkXq
         4XsMfOIkCWLd+OCCAS3161iW+E+XNlBUFOt0Xk+Mhkf0l3ywtA9lzQoTCxyRLqNQ58II
         45ivC5C9Dn/03OKQwzg9mxDac4pvj/zotzBPfBauW+dskY10aOe5MQstIU3Yb5LaVBfy
         8tSjEd6+JI4o8Jn510IM9dZh74wMJa9+oNrjfGuF0iowey1ev0TjE8hz8gTRvtKNGaKF
         NsPCjSAmzztx9PFrFFzBqEPtgJXDA7Lbf0uwhzToGrCdrY7TLQHt/H39GizLOpTHiFQd
         cYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280729; x=1791885529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TfgIkUJeKpRApK4VOrWPIGRugIiFcyG1Fg1a7IGEwM8=;
        b=o494GY1ORkq9ZuR6Y7Yy2wiOwxJhO69AJs5vo80aZVx8X6kfFk/eT7kWnkUrwz/0tl
         HaHwgKlAa6dzJca1G3ChqqdoGy2SDWntWmAh/oiE48ok8AMnNWbatc9F97NeK4/neFJG
         xPrnD6zamOAErXkbZ3bt1kHur/7voyZSnfhvBtaGmaFO+/9OFEf1blp8zCoMj68DoUKx
         B6Q7DPaWCSrGHRYyEmkvMWlEvPfMncWbbiltt4dQKpBWWXZ/OIRSI4W9NNNNTp9kdvDf
         f/fRKoLdYwKYx6JsqQwxbsxJ/Rvl59q/numIo1LW7uHvNlFFxzM+3xUeSxuam7qdkMBg
         oGtg==
X-Forwarded-Encrypted: i=1; AKwUvBxbSaw60YqlDm80qvcFnDxgzwK9MjWaY3ATsCyWg6nUEgI7uFGjtbpRJwXLOISQW+w2bmNi0g6ximH1f9E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzmoZIK+xTVpALR+x4e8YQJ4QjQP1f5pUbSQDxyrxuAM0k9qiL
	VjVSPuVR3nTYPpM81bgCStf+UunpMjhXAe6chC4BECdN49lHb4KxWrHnmPx6HLl4sHUHFJLPRQM
	5qLk09icylvr2xO4LljA7L4lMF8NBAaISLm6Ugv1IrA==
X-Gm-Gg: AYBFou1W/StCJGfdaRw1YtEHL5L4pV4OnjBTMTYRHt/qgb/Uw6ItIAvNYJBQSwoIh9v
	PPIoY93sHY5k90jKNfbT5WR9yJD4OuowPIHmiMuHx84A1+WBrFRCAUxxnsL1BJGaz2BEgieeUrR
	waKAgbQDyQI9DxO5KpQNdaACPJl1Q6gbN//bwhA2Kw2QEnF+Ov7mO0qmodCRLx2d60t2yDgz4ue
	Ep3AVx/kbb5dQrQO28PRy/OlV2Z4oUXBi4aZ29sRm7TgsBCeOVdbGQ7UOAkmrQlk9IlZiDEUik5
	HqswqcBdujR3TIS40K5CFu4TfEpZwNy2sb7aAq80qayQUFJHplNl2rL5u/bmrAo5tzrWqy/b
X-Received: by 2002:a05:6402:3549:b0:6aa:f02c:dd96 with SMTP id
 4fb4d7f45d1cf-6afad8d08e4mr8967181a12.11.1791280729128; Tue, 06 Oct 2026
 02:58:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002143529.3217189-5-koen.vandeputte@citymesh.com> <20261002204825.29726-1-sean.tranchetti@oss.qualcomm.com>
In-Reply-To: <20261002204825.29726-1-sean.tranchetti@oss.qualcomm.com>
From: Koen Vandeputte <koen.vandeputte@citymesh.com>
Date: Tue, 6 Oct 2026 11:58:37 +0200
X-Gm-Features: AclHuK8_i_YLch736XQN-K-YuwwwRZKZlCpaSoG3oZTOfBCg2fSHBzTivHWJVdY
Message-ID: <CAPh3n81CHtXXozrkLwubTkSuZm6Qk-PDWG-=07JHcacCDDNQQg@mail.gmail.com>
Subject: Re: [PATCH net-next 4/4] net: rmnet: optimize rx handler by replacing
 skb_linearize with pskb_may_pull
To: Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, dnlplm@gmail.com, 
	linux-kernel@vger.kernel.org, subash.a.kasiviswanathan@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 10:48=E2=80=AFPM Sean Tranchetti
<sean.tranchetti@oss.qualcomm.com> wrote:
>
> Hi Koen,
>
> Unfortunately this patch only works in MAP v1 configuration.
> In either MAPv4 or MAPv5 with checksum offload support, the driver needs
> to read more than just the standard 4 byte MAP header.

Hi Sean,

Thanks a lot for checking this.
You are right .. I did test it on V5 also, but got lucky here that
data was already aligned by nature.

I'll check if this can be fixed and submit a v2

Appreciated!

Koen
