Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90653A48D9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411406; cv=none; b=A5rKtt1SkT2fDvbpBv0E6w2H8xaeBR2UL0yI5bA1ZC3sqjEBDrdLsZffUl19PEutQZDLrzlOMQNLPbtvMX+xf85Z1DgEsRg5RC59pFaNQ2ZTe6tbpLoozbni12m6FTstYml3CK/eRVCOShvsBl64wQzNWTDDDsQ5+dIMUzqI6bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411406; c=relaxed/simple;
	bh=mtWjlL6opbGn5Z01q2KziQo4eyqJ4qENxxukKPKDwso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=etXjKo5QOze/EYp2xlBcMsNmkmPHGpb2S5V6uDB86IonhaFWTcAc/C4rv3sf5dh4YBDadeUDLBdOPqCBaxjpMJUvFVCEAj4S2FpCKB41wns65pVOy4c/zXNviKDxka2ihhwB3uiaBuVy5C9YECvZh91fgstsVxmq5QDrHHuCnho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=TootGZae; arc=none smtp.client-ip=209.85.128.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="TootGZae"
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-8630c1503f2so1202277b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789411398; x=1790016198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRYv25iRu9fFTWg27vlxcds24V+T7PCoVZa9yNuXC2A=;
        b=NnS7yzrfjqySkvjaL+CPFrBI4t6YFEY8ED6vYHCqjmSp5vPBQHKuXDBRqPEOO8SD17
         8cg9SiPwgXIl6amOJdZcBlAQDwnFvCQNXCjlc+mihYXPyD1TX5qXwoIKec41FnRC3BgM
         2Yl+gMfu+7qjkFYDgMDKsgN/I85F1W0XpQuu0Zgfgzg2ZwoUZg6GeolFRFnzaD0ZjdwA
         9u4Adt4I2D9oHJobV8SgvG/X9FALoZUFHm+Aa+t00LTeay8Sy/V+z8ajHVoYNAahs/NB
         K/z95Uc8Zm4NSKvxUKsc8yJxD5KOhdhzAk4XnoHFiiTGaGLWh8KRNdo6clWzWROnGDk1
         hnRw==
X-Forwarded-Encrypted: i=1; AKwUvBz8TFNatmyUZNCZPtSb0AJL48+kR+SvClRUriLrSuzOGhOK15c1kibLBDA+lbKSzeOd4TTG0mJq+6kLsDA=@vger.kernel.org
X-Gm-Message-State: AFuF++nnQoGe4bZKaxd/evEihr6TRZeXMvLDT0r+xKPnnLDyPv5jbEiZ
	07Msb5E4K5jQdN/nbxCx5tgc+KXQXeUwVkNoXQhf4ycet+EoSaAc0sUVR2E5Yzy86k9+LqnnTjm
	2Kc6eAYjy9KHYp1VCRUyLC+O5AjmPf1bXNT+6KJxM8mP/O0ZD5bjOhSQFPlRPqrHnTldjP2/YOa
	i6hyRNSxKsS34ObdRnXqawv4bLsYgXaKHfUwNX1HboBs9Y/FlkPE6lCrUZdEf4OZXfhtG1HO9Dj
	DDSZWV2J65j3VSzDgRqMTCroT4R
X-Gm-Gg: AYBFou21pmyao4V7vb/eyGlF7igExYYWtp8lkF78WJXH2TTGeWBxbL8lDMVt6bA8TEc
	gVTfqBftsXywh0JEZFhGoi1UgrpjD0MlT3xGNtFjIkC0nEawNZgemn7a6GX8WjOGt0ZerTY2Otz
	b9fk2F5Dr5K9AkoZM4Q9fiBbPUGV4/blHhiGFCbhYQD9oB3f9u1T/1MeIPvc649A3e0yISP9REj
	JRggLLVabJsy5hZFyLM1xzbHXvoLn+iG4zqYtCHw/d0GV5eKLPzuTzsLuEz62vUzi8pdo3mvoIY
	rJFYjkdDK4xDh7WLLSrlDldHHfzVbtPxjkdWlNsROI36/iY4HUNKIJjVSuTuqihTyxl3KxbE8Rj
	dqxjcMv6FbiQFjUnepwe8Rt27mbZO1ft+c3oJTLWL7EUCJxkdmYEtHQ8PV98UW72apMTo2OCXDO
	Tnqunyt4AuisA3Jt0pO9CbsaHXCsgU06okijonWmA=
X-Received: by 2002:a05:690c:91:b0:857:12ab:3e19 with SMTP id 00721157ae682-88d24655697mr14486337b3.32.1789411398271;
        Mon, 14 Sep 2026 11:43:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-88c5671402asm764457b3.14.2026.09.14.11.43.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 11:43:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86a74698972so4155055b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789411397; x=1790016197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRYv25iRu9fFTWg27vlxcds24V+T7PCoVZa9yNuXC2A=;
        b=TootGZae418iEWKwoGbK1fPI2ZYlJkNzuAhVdImGQwg1LnzMnWlXCwsrYJqpl9l4Uz
         wIXLzwJXdfeNqX22NnS/omHPJvj8SDiK9X8S4gNVWqzCaH4cx9ZwX0F32FW7tWmXeg19
         9UzCS6M8MXXj8QoI0GfMDFdJjJeHZx4nGkueo=
X-Forwarded-Encrypted: i=1; AKwUvByULhqNuLVWFjK1nDHb8dzAPdU3IK2Y8bIEneDlFf26pCHl5UkP8uiHq1tJy3SfL6um+MAlKUOkZfUWr/w=@vger.kernel.org
X-Received: by 2002:a05:6a20:a11d:b0:3d3:adbf:7783 with SMTP id adf61e73a8af0-3db40672d49mr8756123637.24.1789411397010;
        Mon, 14 Sep 2026 11:43:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11d:b0:3d3:adbf:7783 with SMTP id adf61e73a8af0-3db40672d49mr8756051637.24.1789411396577;
        Mon, 14 Sep 2026 11:43:16 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b347e6sm24621139c88.4.2026.09.14.11.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:43:16 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jiangshan Yi <yijiangshan@kylinos.cn>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	kees@kernel.org,
	linville@tuxdriver.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	13667453960@163.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmsmac: fix UAF in brcms_free_timer()
Date: Mon, 14 Sep 2026 20:43:11 +0200
Message-ID: <20260914184311.1477250-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260815121043.938414-1-yijiangshan@kylinos.cn>
References: <20260815121043.938414-1-yijiangshan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Sat, 15 Aug 2026 20:10:43 +0800, Jiangshan Yi wrote:
> brcms_free_timer() calls brcms_del_timer() which uses the non-synchronous
> cancel_delayed_work() to cancel the timer's underlying delayed work.  If
> the work callback (_brcms_timer) is already running, cancel_delayed_work()
> returns false without waiting, and brcms_free_timer() proceeds to kfree(t)
> while the callback still accesses t through container_of().
>
> Add an explicit cancel_delayed_work_sync() after brcms_del_timer() to
> guarantee that any in-flight callback has completed before the timer
> structure is freed.
>
> Fixes: 5b435de0d786 ("net: wireless: add brcm80211 drivers")
> Cc: stable@vger.kernel.org


Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
> ---
>  .../net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c    | 4 ++++
>  1 file changed, 4 insertions(+)
