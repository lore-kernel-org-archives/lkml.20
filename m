Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626091;
	b=tqJCN9j04lOXU27dpb4sA99h0nSKrXXnxR5EEJaV4sUDDCaxaF78RyO3OGKyeTnqyHuu
	 GGyzu0shQ2Kd3IYMCD2c/rEM6lHbGMom+bn61N/bKu/o0eTcB3hLpXiO39ZhrA2UHjJze
	 FDF2FogMq0l+eV34QPQvuQD/Yx2HUex0I42HM78dAm+6v2NqLOqeq3xi33m180bmTOktP
	 8QKPxJNz9ctF08wicrayTg+IKX0Va4rtF8GEQP9YZyci11V5MBGl04fORuOjiXI10Qmz6
	 x1EKHpXX2SO2coUTdXXC2YB1FaGJ1Yq0A729O3ACNtSYWW+L25qvo9a67TOg5+qDKdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626091;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=B8p82c6gfTH6JQbxZJ+gox4JLLeRYECRqGwM5/HtEvo=;
	b=COJEmVLBoYC/Y75ZG9WfqdBokHlyCWxzveuG4B7h0EiyqUb1ysZvDEb5WPmBduAN4Nvl
	 uq5/8j45YUpakgl5iLD233j1nhEvA4nMfZREVXbIWbpd8T+RPYKWokLKo+oYbuEYhcakF
	 XbBRWCo2NOv8RDzNNmewGRhDlsKa4k+gL5aO/HHNW3dCl3Ah9Z1/hbn7/7CUqHPkXQJF1
	 uRKm1dopZhEPC3uqFFoxfaADhU8KE3bNXIfl8qNUQhQ5U1/L4HslMwqRnTvPUtKRL9Cwu
	 awMxH+d/6LV/qzrphmLh4lW+7V5ROup0+oyUpCelCruA5fgG/aufKivKde/BC0BxLoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hWWN9tNr;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407C5606A882
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 407C5606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hWWN9tNr
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so889197a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:14:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626089; x=1795230889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B8p82c6gfTH6JQbxZJ+gox4JLLeRYECRqGwM5/HtEvo=;
        b=lzdriOq3KFhmtqlJFL+5wwYN2QRVBo2SkgHElUzXpZPni3sXsGLNsvgzEzNeDrOGhx
         dYVAjCKiBACSjwjpYfipRUmAey4f3MdTAMtHF+gbA60pU4OqvxBvJ/tfJ1I9Hb8gkPFY
         b2cwlLEC8viOPteZzi4V02YSw6bVhoKOrVj+LCVvuRUKcButUvzOAK76ohweFsN6vyhy
         pr7TE2mE/LAKyfXSYg5ybVAZFD8Cr/64NxknCsQRdPlks4pMYwHjFUMjRGEWwbyeCgYT
         HSPTwT8Q2cCu+EOF8WavlGPA6CkTcob4q/nkE5fS5hZfIkNxsiOGoyXr46o76ghss8SM
         urwQ==
X-Forwarded-Encrypted: i=1; AL+hErEUvXEsgrKnlDNTu1L4aPOBTeFCeMm6KrsQRfry4AwtoybWb4V1xyH2/yu9e48XNfLoIhqENiUkSPwrIUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rRzpgu8Ot7QMnRVQC/pYiEhHXMGtJozuLm/npAOdqD45mMdTV
	WSFvQe8bYJHtbFk+LDzrIPdTYoyQ+CBKqSR63ABCrQYXDiaFdqxUZAtN2FErJMdraGeDjRwueyy
	8JCEawWq92PnW1M3tuBsic9W9j/dRTGosXiJbCuVF00FGjjXr8FDP1ZXlJK9Ll3P9ZMBTMKjw4Q
	Xh2uzj/VQT9lXGAGEK1+Dwr0vODLiC0D2g1pWnkSm5SFX3kospFrEPV1SLdnJ/SmJClrKz5jGPn
	Jp1HnXqZo5EXEWKI2S/3Aaa
X-Gm-Gg: AYBFou0VMVkfOoCIQj2rqz84aoswegYjAA36TZqZB/rBKssSYSpAfZlTQ/9RkUrRPcE
	3E1jwkKWO+kW/I685ITdrGq7yT3YHfFSdzAkKmwAl70ft2VjeSUD6dlaVTFJnq1dkYohHG/wUJ+
	Pn/taTBtVtQ0dln9VvR6GjJeEmbhCrUX6IVLZAwdSlMTNq4hw440+yD+/FvmvEm8IZnZ7t8GBfN
	tVY55bJYmuHjJnLuEv9bm/HDZ8Z5TA9bgIlgtWhLPdk2OckAC6g7xBTCmfzJMPSYX01Y22lQ0k0
	JWk84+uFJpBhsrkl0YyCemL0jxTgRLz+68twHcR4IMbeDDQnE6JSfUFBRgnHeef9b3FXctPrezL
	CIxfOFPVtkr2gpP1bzB+79VtzxNnaYYZx+EpvABhg5YZIGv+dEwKQNjODkGcsSsYCJ6b3He06u5
	PnR4VQSMnOLHFnmSNuza0t3j2q2RxKoGCJBKv5tQYh
X-Received: by 2002:a17:90b:3985:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3b1b0b53626mr4113768a91.46.1794626089506;
        Fri, 13 Nov 2026 19:14:49 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197cdc76asm9091594a91.7.2026.11.13.19.14.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:14:49 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5363763b556so31321141cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626087; x=1795230887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8p82c6gfTH6JQbxZJ+gox4JLLeRYECRqGwM5/HtEvo=;
        b=hWWN9tNrAHLW96j/koLcVFmxUAu68+wMJulvN1TiguaGs3QRvY7Juz7ra0IcHc83/c
         G/SyjpuAlAMm7Gh9Du3NHv97b8hoEmnwrM0W9ukz7AyFtQW876k876/2SwUtEXogU+k6
         yI4l8pQ3FlPRMon37JlbTMX4OjiZOOB6vKBIc=
X-Forwarded-Encrypted: i=1; AL+hErHEduYb9kVz7Hd9x7NTIFpaJXNHrFyvo+cTPKwdmbW6GVJgC9375e52uhccOd9jioMCg9E5LgOossY+se8=@vger.kernel.org
X-Received: by 2002:a05:622a:1f95:b0:52d:3ccc:968b with SMTP id d75a77b69052e-55ac3365eb6mr66885081cf.9.1794626086977;
        Fri, 13 Nov 2026 19:14:46 -0800 (PST)
X-Received: by 2002:a05:622a:1f95:b0:52d:3ccc:968b with SMTP id d75a77b69052e-55ac3365eb6mr66884961cf.9.1794626086618;
        Fri, 13 Nov 2026 19:14:46 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0fff381sm31986401cf.20.2026.11.13.19.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:14:46 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Sander Speetjens <sander.speetjens@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] firmware: raspberrypi: Remove unnecessary braces in transaction helper
Date: Fri, 13 Nov 2026 19:14:44 -0800
Message-ID: <20261114031444.871124-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-4-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com> <20261107-fix-raspberrypi-firmware-v2-4-5bfe605a5cc5@gmail.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Sat, 07 Nov 2026 19:21:34 +0100, Sander Speetjens <sander.speetjens@gmail.com> wrote:
> Braces are not needed around the single-statement arms of the
> wait_for_completion_timeout() check.
> 
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
