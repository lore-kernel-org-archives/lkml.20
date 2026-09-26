Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F12380FC1
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452328; cv=none; b=ezd8O70JqTZYjwiAUascaIBpqLcQ/4EeF4qCSoYK7Hc1Hq3gAL4WBXtj1OTNU2pEzcCmnRSwfM2Rp+InuDBusIQBbkJf3pet0Gbk5e2PqLCT9PDKjcuGhwM9dMDE8XWqtFAwTgaxgL9s8Sl2JHnkw9rRVJRfntjDNObWaoyQ8as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452328; c=relaxed/simple;
	bh=quK4ESbWBNP7NCO/VpFQ3aGBfCDPjj+jYULDZLt3xFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ACAhILDniDxhH6u9vee2rzamFyuJ7aPvoGMwkuQrkOfPGi6p5i9Z8rPR6VI/JW0uaOs7EM2yQpeBAziPApmLLNvhk8FDX5NuQFOTParOv9FPQh9Dloz9pCNbTd1W2Ux1iEaIUXh/21jfh+/YsL/PhdUsw04mCXgHG4fJn0SqtPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxYeNQa+; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxYeNQa+"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so9998625e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790452325; x=1791057125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=quK4ESbWBNP7NCO/VpFQ3aGBfCDPjj+jYULDZLt3xFY=;
        b=IxYeNQa+l/BSiMAeCtVMRQZvYslgHiiBRmba5FXHPfdr8C3RPZvT8Q+7v1R7wzLVxJ
         CkrecyEwh5SIVKKZ8z4aMDwWkcn5N9JeY2n0D8BA4kTO1iorB/IPS+nW85CNlUcN9vh4
         bLN2TMHPtyWItZi+6AWiHtPGKhHewE+o2UTWXiG+zBjKI1K2jVNy51dEyZcLUAV/Blyk
         vLHlDWYESsZY8w/oBUUa8iOiZpIFl3nJiqqI0P5gwQHNMJO0rqNwn9W/ZN5wXYaH8hng
         civ2XhBDfBHYkQVoVMsiyefTOoCI/CR8he9h98tAHQkyVdGj5lezZ/e0kIgpvWT5/TSs
         5x0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790452325; x=1791057125;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quK4ESbWBNP7NCO/VpFQ3aGBfCDPjj+jYULDZLt3xFY=;
        b=d2g9/pOqEHZWS1UTmjXKeu6Z/gyLfLbehB2Zs3cCkuqWPtkwYuaLgzTGBp5uaUHnv6
         zA5RfAcBitFSW2ISese07yKcKpPI2oPZ/m7aGz9p4mYurF7We/KZvLURVXwjOUaFC7vK
         y4LYqRpnNRRD0BDHx8hIgVcx38LkmeTKFZ1qWMa7ldlCi+mz8Xsqz/sW1OHVSqo9Ufhb
         gdSI1tNJWDq1O5RM+CEOCdnxXfev44Ly8i4fCu4MNvkKsRssitYfjFGKXxWPieEfFKdA
         vzaJKIb0TLjbmF1y1arGRLC43FNTBBqV938rtotvrv6QNhzU2p7slR2Oc35Cmrjjc3ml
         0mMA==
X-Forwarded-Encrypted: i=1; AKwUvByYfv3CfYuAITadtSNtJFxnQwfoY2ksTkTbGQIbv5L7DCKDZ1kisiiOIkVNosxhc0HvUU09jjXcx01tJ/g=@vger.kernel.org
X-Gm-Message-State: AFuF++n9/joxy6L/SF98G9cx20lcQcNHCpfwtafSlQsJiupLKzOls6b1
	E8ueTjonUPvr2CnwE6tEy4XTTXuCQ/NxQsq2sA/F56lH7hZxTEKWHmOV
X-Gm-Gg: AYBFou2jChWeR0DdUaw4aIjI7u36tbv9UEWAfcMNmxl4tYeTZUIfHjc9hmby8YreM0J
	4AOIKWFsZNdm++BEBRk9yfX+IpY9VIf+m9JcIDTksRf7/LBvdA5Pa9Aste7XJ+0UntYIsJCyJt/
	GC3vKT9fntDEjJT/t+zG+YnUoITn46zv4njIRcffr6vupRX9ymRedS6V74sBumLTWrEM7pCzoX1
	FUIHrlbjDaAlDXZX9WnvhqnUgnkNU6kXKNTaVImclvhoyhwVanMF0PdCzD1Pux4XAAPCnvFxSGW
	ka+UhXHvuoK9vHIMq5Th76Aubz69cMcGJuLXaSiBjuxJ0YAhnhRdhj1AVq2/V7DDhc/HlFelMq9
	adXCaH+x9CEt62xZGyFy7UMQwc9fhGKxv8jtqHk7c2/r76gKP9LXCLm5Zu2SXmCyUWeP/b9Os/y
	pcw+z3tw+0Qfr6BeG+2gVBozxr1DjA3aNGLtw9JzEJHyea/tjjWRxYLsiYK7V2VlKrzt5HFlmQf
	BgDIvtB+1LjTq2ppw==
X-Received: by 2002:a05:600c:4ec8:b0:49f:dd10:3c71 with SMTP id 5b1f17b1804b1-49fe66c61c4mr167010005e9.11.1790452325101;
        Sat, 26 Sep 2026 12:52:05 -0700 (PDT)
Received: from localhost.localdomain ([94.252.74.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fef4fc959sm139458915e9.2.2026.09.26.12.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:52:03 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lyude Paul <lyude@redhat.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/dp: don't mark the AUX backlight enabled when enabling failed
Date: Sat, 26 Sep 2026 21:51:55 +0200
Message-ID: <179045227485.41069.12855843493298872118@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAD=FV=UohyFHM3r4i6NoDbzVFpY9xZzg_=FvGFhBgScaCUwH2w@mail.gmail.com>
References: <CAD=FV=UohyFHM3r4i6NoDbzVFpY9xZzg_=FvGFhBgScaCUwH2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Doug,

Sorry for the muddy commit message. Unfortunately i cannot reproduce
the enable fail. I found the unchecked return while debugging eDP issues
on glymur. Please drop the second paragraph when applying, or drop the
patch if a code-inspection fix without a reproducer isn't worth taking.

Oleg
