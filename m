Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75BC49F104
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062540; cv=none; b=ATWdMaVbVe8/NgqwLdvTOqrUTA8lLqnW0fBEaDkS8stByhoJi+LIkx1uzTd2BHpZ7knNldB963F+/LlUfTgZBLdvWFzT/QScJa/4lrAxmUD/pcOLQY59MWTFQ7gddLcWXFWFFZ4eB1C0FZlPUQqZapUtC0M3WEqTNf+rFhl4FFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062540; c=relaxed/simple;
	bh=LJ68nMqit4wbD1dHEmU5fA+ecIwlMsBD2qIgYG53ORo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5I0t4KUN2Kh+yG8v8SzkHn9wqaCwc4IwOz0TYcd1mWFKXOT7LTTnP7e/t+w4VjWneZDzogr+W1uk7j1OWVC6/1QSOmczkGlOtKGCjPnQQm9+ZN2v1PwKnsqa+bAasr2oTF16UbOuTu45JWfbJPVh8AX8okxepqrOeK3ZFqRBz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zl2q8UM4; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zl2q8UM4"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e946155442so13037845ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062539; x=1792667339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rE60GILgiHa1Mt84O+CQTG7z+YecfD/icyWt/tzZLH0=;
        b=Zl2q8UM4DgMTDYOLYZ5HAzzjcEeiaBAWLZEz02wmmAd8I+SuPSS/kGAoz5yTisYh0c
         YRolQfRPQUGL+ZVaplSmNOMP1yciNuDUPncSpPcFr4Gk7SteqByc9x6SxjRjpmXCPgde
         guWWwW9LbNgu5oGaE7OLPe8JSeMCkUpX0S5BP17HjtgNtRUn2h2QE2h0uT8JMb+nvBfC
         pt/uqs825m56JN/w5adgiDZx2D+bNoqYM1XeHRxOgBPKpJPCcQLDYIme01NWGiuxGf8+
         3qwFtGtCDDMSVywv7S+zd8sPNpt/yfkWo88uVLHin2IbOJB5w8YeW9K9/UIDyH4McEEF
         s6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062539; x=1792667339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rE60GILgiHa1Mt84O+CQTG7z+YecfD/icyWt/tzZLH0=;
        b=Lso+qnm6FzQBygznR17eGDmcHlIdcHwekEFnCGZtXITfdThTAJCbM3FeHW0PTMJ0kO
         /X0KIMSbijXHFR6w1529vs7/RH0zld202xKC7iS35tEnMcJJwL2WkCQp+RdCMc408Yvg
         4KsmTtPX5R3RekmFbgUszucLK1QavQdx2whryxzbYKNUIj0d+AyT6HS3TLoI++peCIKo
         8qkBQUs9Ps6D9A8XJ51RgK9hHXgZ2anwzeGEHGSG4BlNmDFP2yPQwDtD/L6LJoGFK85Q
         xwqEcV7+e8luIyzXFx6pNoDdNemg5bckFFLqBt6VY4xMqrpe1hUP4AcE/vekCaZuuysv
         YvAg==
X-Forwarded-Encrypted: i=1; AKwUvBztc1EEpsntvWD/YzKdcRU0JNZnxhQjEdOyiq2NvVSeG8Lr0GQcB4DIIW2W/QIUYqnjCsFgKf2P4wdoH0g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKm+Q08CTjl2smjn4+b5YEnUabgmj70sk+Oh7TqLPePWZw8h0ic
	IqXDHG2BiTK5mhvho7AALO2S6CnidS6/+xVEzC6OHfktaDtmUMpeP1jn
X-Gm-Gg: AYBFou1yGVWZeEWgMwM+lQcIhB6jebb2Q3aQmVTHrch9url7VkDBDU1ztgYkwvBXTry
	x1Adhbaj15b5xuc77zNBQzmHIX+LxhMOXbp6rZpmbGqWKUXb9TFO47YDlvosJrTAB2K2uDmojVz
	X2BNOeZLK4Vnpous2N4JnHHTl8GLdNH9HsX/UP8Mr8lfnhWEltuFdlFTnG27cUI2UM3XvD1H82K
	ea1vGitGjvrLFoV41Lm9BseEnEemM274KvGoJrpnrGLwP49NVDlIGoYaAQdsWXsPMRFH/6u9Hbp
	wupVOxKN01Z565xfyZU04eLFNdhlv/hSVlaro1XaKRO/v93C45TanIOUItO5sAWBjnXdjCw1XHZ
	bggwFh7eelX52UbLoRwLfOq60FM8ihOkyVOn/LTE43ZG6Nj7RNmstqKwMOQPvyYCC2B/Ek/NUhN
	Esf8Ty0tkFi0MhEc6Vi6rE8nJDw10N++NtBPQv+pEf6+LT+sOKvihBl4m1aGexZVerc5I=
X-Received: by 2002:a17:902:f601:b0:2e9:5772:9ab2 with SMTP id d9443c01a7336-2e95772a81fmr24126705ad.41.1792062539043;
        Thu, 15 Oct 2026 04:08:59 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e8c9sm79918475ad.23.2026.10.15.04.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:08:58 -0700 (PDT)
From: wyibo6109@gmail.com
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yibo Wang <wyibo6109@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: add OnePlus pogo-pin keyboard
Date: Thu, 15 Oct 2026 06:08:00 -0500
Message-ID: <20261015110807.203881-1-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015-melodic-cooperative-chital-afa0fd@quoll>
References: <20261015-melodic-cooperative-chital-afa0fd@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yibo Wang <wyibo6109@gmail.com>

Hi Krzysztof,

On Wed, Oct 14, 2026 at ... Krzysztof Kozlowski wrote:
> I don't think we are describing here the MCU, but the keyboard, thus
> it's physical geometry is fixed.

Agreed - the node binds the keyboard, and a keyboard's geometry is
fixed with the hardware.  That is exactly why v3 does not describe it
in DT at all: the touchpad geometry and the product names are
per-compatible constants in the driver's match data.  I also reworded
the binding to describe the keyboard (built around the Tinno MCU)
rather than the MCU itself, and the touchscreen properties remain only
as an optional override for the unlikely case of a variant.

The rewording will be folded into v4, which follows as a reply to
the v3 cover letter.

Best regards,
Yibo
