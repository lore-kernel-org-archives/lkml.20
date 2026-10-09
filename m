Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD344D0A06
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548077; cv=none; b=gFMHBWyTxH3GfEFoh5yOIw46vJP8MgHT0My/Goc7iJko8lZZV9WLDVD5Ok5T3iMsuVcyBev3Us7EN4aP0qGEqvAL9D+0XtN9LeplLmZoDqyQTmA4JdUmgr7668IuYakS0MwJZFLKwSC+2UKP5W2DNeHOxsOFWlOmABGl9hyvUeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548077; c=relaxed/simple;
	bh=0wp4vMpTTbKxmOcrBbd4LZZUzPZPjqMgHGJhHKYOOwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BhM+47QvMjqVGsV57+fv2FMOgrnq2AkP9zEGAzAbmGSI/2mOnBPuxqakA2ksnr4wEpn4CeQZ5JcSOdONGPQpGS9SBn9dEJgffMWW3/dn0hBPCOsyazMXqK/2grsYN9ia4KtvQMquzFgA//TBQyin9K5Ug9Ypv+gKnmiRliTCYCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9nmZpe4; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9nmZpe4"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-351767ef18cso3149144eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791548067; x=1792152867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1/r00KwLC71l7qD8SlMXbKms6f/x3lGEnJZwDjSrz8=;
        b=Z9nmZpe4CrdMXiwTD8nj+ROgWtOqY0nySjUqKYHV10R6zGopaxoyIgPED7KYucoePl
         xaM6O8nyG2MsLaFaeXXX7HQICqDHsx1XzlavOp51nPPMwP1JQCr355/nYaaC70heC9FC
         vNm2jpr3KJl55hrZCmL8YDkz4MhiMhYaPA2aw2E7nFqWVIUg290H3XyGFlvjcxVdhn5Y
         eQAnuNyVNMkmsRksYbjr97vIQCPg5WSRzO9XBYdGyIGd+lHZ7uA0/SSKZ75q4aFGgc8r
         nsfv/lm4kuE8MF7WjhdikAk6AU3U0RN+hOGQmAzPhDYWd/PZtQn0E9t7i4Qw55ms5bDP
         urQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548067; x=1792152867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a1/r00KwLC71l7qD8SlMXbKms6f/x3lGEnJZwDjSrz8=;
        b=2QnWhF+gU203offVqeZoTJeSl8v5TMg5iJ7myEIYwNdB2Gpp+D0DfBreGg59FKh8oU
         Q3xYNwqXL+buESHpEWQXSQ36pXwjRtynHm+gP+YB33oVULeWhUSSo1o2BWrgpXjODbuX
         G8qLU18qRFAcNkc7vnEo9Bs4obpmypUHzrDLHeIvSG9DtyUQdmiJ+fXN+tw+e76AKZZ6
         FWrQjR1SzzPjSFnebmaNRYC2gtOkXPIQV7zjKoQZ55UDRRcKOsTv+3Qscf6jroBZr4fD
         47BIkC/CmFEgwCWdxuXbowNjAGdf6K8MVRbtPwf8K6MK1XP+YaNsUHN813sznP5qsdrT
         vZqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwetsb4ekZvEUbrRbpnx7EFULjlKH1OM4w09kj8zjlNSzZUd6rjs2BF0pRTN0zkSITinSiWYFu82YR6oYs=@vger.kernel.org
X-Gm-Message-State: AFuF++mDppvTmKjuw1p5PMUBoBz9FEW5essncG4AdHz+1GwZSE8XEFbN
	o6zIuddb1tQh7GXCnWwUxIrBnmMHGple75uP0dLlHIG4BIIR0cJ6y9Ir
X-Gm-Gg: AYBFou31hRF7nvrfZ4f4I+NjopJ2yA4ldky1cHoVtRcf92wqHegm9sAqWs4NFqFIYFd
	tUIimn47EY6SdkXym+/PrYf5WDxfh3WfQ1ZPpFrD9RNN3iCpWNH/c1Vea/AbZebVqBNahC6aiId
	Xo2f+ZsIUaS361egvgYZ5UZQzCg+9qeNTCcZ9rg8MIJiH+xocxt+f+Nwdr9x8Mychmd8yaDsKnR
	hSJUeQoh9POQfClxnBTAolDRcTr+b5ZdkKKE2wJzwVx0HIa3L1PvThNOsCgJRUzCPK7MlaRdRWp
	abdOTFOq617/bMK6uPL+RLvgWgCP5BJZawGlWbx2S82Qv1S1VZeKXXoJNJH72hL+w3AvDyqZc/a
	3uqiB55+NicVOlUtFt1P/DgNX5DEHDIgwVLuizuYB7hd0UmRNlgI2t2iaRMo0wyr5qcrTibEYSe
	RHhrRMLj3xGa8pcd2mndSL4FGT3GGwHZyXPBCwK6GH8RpTN4wtq8xQofDMPeurnJ46GGCc9KFV/
	YMofcsJ
X-Received: by 2002:a05:7301:4b09:b0:351:2958:1740 with SMTP id 5a478bee46e88-3537e088bf1mr2376765eec.37.1791548066814;
        Fri, 09 Oct 2026 05:14:26 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:1c75:eeaa:b22f:20dc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1ba7esm6895458eec.7.2026.10.09.05.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:14:26 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: mjg59@srcf.ucam.org
Cc: helgaas@kernel.org,
	rafael@kernel.org,
	bhelgaas@google.com,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lenb@kernel.org,
	linux-kernel@vger.kernel.org,
	d@rrell.co,
	andreas.noever@gmail.com,
	westeri@kernel.org,
	YehezkelShB@gmail.com,
	lukas@wunner.de,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] ACPI: PCI: take native PME control on Apple machines
Date: Fri,  9 Oct 2026 09:14:13 -0300
Message-ID: <20261009121413.23538-1-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <asikbIuZUZsgmU52@srcf.ucam.org>
References: <asikbIuZUZsgmU52@srcf.ucam.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Matthew,

Thanks for going back that far, and for the explanation.

On Fri, Oct 09, 2026 at 01:23:08AM -0700, Matthew Garrett wrote:
> I /think/ this was the set of parameters that my machine would hand over
> via _OSC if we hadn't called _OSI("Darwin") - but it was over a decade
> ago so I can't promise that's the case. I think this probably needs to
> be tested on some older machines as well just to ensure there's no weird
> breakage as a result, but if PME is actually hooked up and there's no
> SMM managing it instead I think that's fine.

On the MacBookPro14,3 both conditions seem to hold.  With the patch, the
root port takes the PME interrupt as soon as a device is plugged in, and
the controller is resumed in the same second.  Without it, nothing picks
the event up: the controller stays suspended for over a minute with
PME_Status set, the GPE the firmware declares for those two xHCI
controllers never fires, and its handler doesn't notify them anyway.  I
can't look at SMM directly, but if the firmware were handling the event
itself, the controller would have been woken without the patch, and it
never was.  Darrell saw the same fix on his MacBookPro14,3.

You're right that older Macs should be tested, and I don't have any: the
patch has only run on my machine and Darrell's, both MacBookPro14,3.
Two things make me think the risk is small.  Handling PME natively
doesn't turn off the firmware's own wake path, so if an older Mac does
use a GPE for this, that keeps working.  The only side effect I would
expect is the PME driver logging "Spurious native interrupt".  And on
these machines the kernel already takes over hotplug and AER without
asking the firmware, so PME would be treated the same way as the rest.
If anyone on Cc has an older Mac and can try it, I'd be glad to hear how
it goes.

Thanks again,
Francisco
