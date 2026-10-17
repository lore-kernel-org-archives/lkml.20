Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366CB356775
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 13:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792242501; cv=none; b=uDRg/t61BdF6tcOFseF8nyOCBw4ljnWElImYYxLFNV26M/aHXF0uwbnxYJtZeuSPZgAhteo8SRCdCcvJnGAcmGwbYIub3TPw9SwMgKiH+WBR1/MY9lndikc44KtrI6pZZMhGwwUSMtxJIHgf56s0xn8h46/CDUeqPTCLg1llwmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792242501; c=relaxed/simple;
	bh=Z/5JBeqwPxSZ0TpSsf5O+k1fvGG7B04vtfTOruv2JxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyE52d9aOGw02y8IN/efvm6xiKHyOIw8p1KGQykyaD4wf+IhmMPq60pJ/93JcD5XCk25fLL89C0R/kXJ0wUetz+a6v8sChiolYmpAjp+ZthpPFijDWu5yT8wuAoTvywfvSt4T6CF/v0oleheYmDr8J3Vjr5g/38uPJIFRjOCqZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXl2HU6b; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXl2HU6b"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15943c9be84so48367c88.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 06:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792242498; x=1792847298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/5JBeqwPxSZ0TpSsf5O+k1fvGG7B04vtfTOruv2JxA=;
        b=VXl2HU6bjknN1IMUfwiSPFCo4VVowwrSEmRotFX6qrdkgbsozOl3Sgewo2O/cYYsXg
         Pkc55EjKirp/4gxCfW7/bybcVFjy/TgoKYkAKf1yvgMlb2Ir8ikM85CcQInSJwJ52Ckw
         gHWUDuLm8EdyOQTVT6oM2XaqeKWqBK3Eusu+kBT0D9jWULFuVqhAvjf4AMFJCVjm3cJz
         9O6oO9PfUW8EK9WwFnQZHdvfq68nOFTWlL0Xx3ZRGePCm2uKpj/QEiu7qAn5mZvLV89A
         VqZ7tpokdg3y4NHKeIXL5h7ZQ+YTV6kBu4k6EAtGzUYxAFjXZxmERJea60rAaaKFh1LN
         WGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792242498; x=1792847298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/5JBeqwPxSZ0TpSsf5O+k1fvGG7B04vtfTOruv2JxA=;
        b=ON7D0MOoG9gKZoXMCki55Oyyl/dwYDVyTkBhVyxt8i+6DByBtdmXsbasvpk8M7iMKk
         vcN2TQ0YCJ28rhVsOfC0BTB2toIQXkGFVnnkCIJAkeBkqrz+uwI5wRSSxrISZ8WSYACU
         cGvLQlLaG8byMu5wXHdheKrHygKRrIRM1VnHGAfTZ1u3dcvyoj0OBMuldUmgAfhZ6heo
         9b+hfh4SxILTDJhB2kGcERGuzKQGurxuwW6WO4znkCuoskwJVrkuXomw0k1BIsFvMZFp
         /N5VMP4T7a9T1xQSHyJoCyASPVwHq5Mu6sXtJcnYuCatvsFoRLiG4mNr2ffIBa2uNO4X
         1JAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzvJmxuhUaEK0kqb8SrCpopx8anP/41/7wV1hJKmrgb8iwNGJJvK7sSM+ypO3okj8DiEI6QMUlyc1rnP0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlMbL/mDua3gnFTObbPCeLdGjO/geYKvecmAQhy9mDKuMUijGD
	toPitl9DJAin6gp63nhE34tEfh7bJvACThruIqcCpLzh0vM62sKXvPft
X-Gm-Gg: AYBFou1RGLMWN9QF/O4P+kLm00XKTDl6aayWLtIfTv5GLWGfW2qandL8x6a4LMJNZam
	fLeAX5BK6pSNu7WS5aSth5NhPdW+1QWUf2p/oOKdF3apv9h1ZqfbqluBdmJxqEHKBl6oJ3BsTEB
	RtTPaQJ795HYVXPWlSRo6YkHnvjcdKksDWdEvDa99jbmBtD2RqkmL0fdrS9mlmkZXodgUxXRY7J
	ikxOmDJ6404pROt4RP7kjXUxhegCAB6+AsXOuRIiFtK420L5MWBTckjMJoOMR5igrQfVD0mkAYN
	bGOHomBeupTXAXOfj4yGbeH0AxrtvGSm93X1au7LXN9KirPdpTXuNlrS/723VarxHq45QeqODLS
	NrboOaKK7hynKyrwS5r+k+7CwrGU3kNNI9RVafozaUYyJ+IVFcG09uEKFbNNRqPv5S2eXDLsvQD
	M1lrkV5HN4ik31Vy6f6zgO1CVILQXMlXwPFxbGinZBRYEucXphD4+UAdHrnt+DAoSqtPgNE/65j
	wg7DfyLE+9esGZ272yKBKhy6xFpN8Kiyfw1MblIdyMqMRurav0M1hs8eF3EL4cSRVjscvXSuOgo
	jeTSFzDwBt6I1YBIBw==
X-Received: by 2002:a05:7023:a5c:10b0:183:d275:cf76 with SMTP id a92af1059eb24-18511adbd46mr5910454c88.2.1792242497725;
        Sat, 17 Oct 2026 06:08:17 -0700 (PDT)
Received: from cachyos-aura ([45.112.151.53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm18903260c88.16.2026.10.17.06.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 06:08:17 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mario Limonciello <Mario.Limonciello@amd.com>,
	=?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] PCI/PM: Skip the suspend_noirq config save if runtime-suspended
Date: Sat, 17 Oct 2026 18:38:06 +0530
Message-ID: <20261017130806.305673-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016214123.GA1884818@bhelgaas>
References: <20261016214123.GA1884818@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 16, 2026 at 04:41:23PM -0500, Bjorn Helgaas wrote:
> pci_pm_freeze() doesn't call pci_save_state() itself, so I guess it's
> the combination of pci_pm_freeze() and pci_pm_freeze_noirq(), where if
> not runtime-suspended, pci_pm_freeze() clears dev->state_saved so
> pci_pm_freeze_noirq() will call pci_save_state()?

Yes, that's what I meant.

Thanks,
Navon
