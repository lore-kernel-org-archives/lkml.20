Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89941424D59
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791359402; cv=none; b=C7qpNAU/bw2FsFHab7cC5lCdCnyQaTRErEpacYYbsFoqAr30Qjw6CCWpLmtDKWECkrw7xl2TM+B2QYced79JXnZ+O/1AL4K3YpQhesLhldgLiLSVwJrWeemlh/h94Pq+RFuM8flx1zhLPwCfxvwXdWbgbW/nd41B/hf8cKMl5B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791359402; c=relaxed/simple;
	bh=nMaITITM8ppS1s1piPMkzPT3Nw8ZBXddmh/VXOpIvRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LM6mdIXjn0h1HEqLnrhka5aJnvTlnTHKDv8Rdo0uAtu5Zht3vPZLe57aOHOQlmKVZMruhyfKzTc25p43CdwI6a/LAGgYusa0CyDZJ5wyR7w8qLLrVKZn2O4Ma1FpM3EPdmULu0yhoPk0JU6G0nK+eUqTKsbCabUr3PGzfdtj2Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hlsml1Wc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hlsml1Wc"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a020e65269so11430585e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791359397; x=1791964197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pn+g5D+MnrIlDOIrmHAvBk6Qq6SEotSMsbaOoZY07lA=;
        b=Hlsml1Wc97MVgKuls+kXldEXEOiWVnyQQe6bbTlrOF1gogrq0eCTW1kMX8A+RgCO7W
         x1/OCQVaCvrRP8OVDOnOwbW8t1Ku+ARO8onTGGnZTa2+DSnuda+OgfrqxhiiwouCVPhm
         n5xJ+wUfgaAij7g3sy2fdQPhV6SRQn+O4DeHpWlatoU7PaQN6XopsY56d9qV1YFy4/R/
         6qtb8OG42tlKCSfFL/GQTFVkwdAQ7/G3tb1qEXKtRZI+mFoXDcfc/uPaAuaHmRiy4wLr
         t108IDW8SMtqpaboPGMc5uLEJbJX3oMC+QdEKsl8cC888RuxjBckGbVwKOTIMyzDpZHd
         mejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791359397; x=1791964197;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pn+g5D+MnrIlDOIrmHAvBk6Qq6SEotSMsbaOoZY07lA=;
        b=QE8wCgU3DbORqggZTtwhvQDwXhtAq/hrrviQ8tiMz0Pk6AyL6NuPMJRjEqN+6Eb08Y
         3aMKnq78oU63kjWNqvqVbui15yAkF677lktFHpagLB8LJNL0OK9kp/G9v8aVRPAcdRhL
         Wh1Lz0zy6eaG73+HKLPXfBra0y7MI7t/cmxnVyf9tce9nBNjiu4OOzLfW5udOg9GZg5j
         l46PrLEKrOV7zMv69EwafAKdSJKhkkMfKAYjBb01nZtCNq3L6qMTz/xL6YBYJnPPm9tl
         ac73rEyD/p+yIdlaXo7U+mS/UmSjflL+D6paqx/3BcagGyKUMuBVLo10WGeBdmaBtwA/
         oL+A==
X-Forwarded-Encrypted: i=1; AKwUvBwwiMKKK+tY5HNgBdo/rSsyAE+2cs3TFqZqJsXu8APm5cP18LAcx+8+5Axz6ycAtIAk+MIszYpXuZTlDf0=@vger.kernel.org
X-Gm-Message-State: AFuF++m/n3gf9TrKbmgbK4WoTPEHiSC9JXmQaRQOMbYqR1z0Ifttlxit
	qEwXonPZ0xCcWCgpw+9Q2+54Mp8C/ckwG68aQSfsjmuFUpjDJRPBJq2w
X-Gm-Gg: AYBFou3EuWd/kmnlIKgDH0J+FWV8ZLcVDZlsDzfy+1PwXdDng8Tpk4XrfwHvKsaB1Um
	9rgBoCiGHHrf2ffr4eyzB2EFsxIpd2gJWIfU9WXOzxKpeMiitk8g+S3DuFAN1JuLq9ZMbsB5maj
	+fnARoTHvSUMbJNqwAgitVuNWlUyKOUqQiOk2OAqSmxtxq/tIsGdhBUOz3VEyrrX5C9g/RekVip
	wacGsROMYsvubhi/b/GyRNE/jq8Jy3k6gETocI0R+s/8KAy7nuqKhgbI/A13RbDuoomMp+VIR/P
	hhInimftrlBP7VP48pYSFm7KOEqv708umOVM0ZXKaqsYwU63JWDSASlIr976ClC8Koi/29Psv4D
	DBP93rAI2M6/4sxPvx+9aDa9W+ljnurl6JOXMZIMGJPcH+ofgeHSkuXvn5B+lCt3vWV6kBXcBOE
	Uf0Fv++S4thpcXLQj/q5pp82k3cDogjUCpAmRa6da9bBZPEM1JH+bI+2kg4DkqON9cb2YNwWwK7
	G7xw51UmA==
X-Received: by 2002:a05:600c:19c7:b0:4a1:70f0:ac2 with SMTP id 5b1f17b1804b1-4a180648d69mr19173665e9.24.1791359397104;
        Wed, 07 Oct 2026 00:49:57 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b65fsm3760272f8f.16.2026.10.07.00.49.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 07 Oct 2026 00:49:56 -0700 (PDT)
Date: Wed, 7 Oct 2026 09:49:52 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] xhci: Sort out the TD skipping business
Message-ID: <20261007094952.28bfa51e.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Mathias,

I see that you have picked this series for 7.4:
https://lore.kernel.org/linux-usb/20260804120110.01bda0e2.michal.pecio@gmail.com/

There is unfortunately a small bug in "Shorten the TD skipping loop":
old_trb_comp_code is assigned before being used by the !trb_in_td()
block, which means that we use the *current* trb_comp_code instead.

 	ep_ring->old_trb_comp_code = trb_comp_code;

 	if (ring_xrun_event)
 		return 0;
 
+	/* Handle events not referencing the current TD */
+	if (!trb_in_td(td, ep_trb_dma)) {
[...]
+		if (xhci_spurious_success_tx_event(xhci, ep_ring))
			// ^-- uses old_trb_comp_code

This causes false warnings when running UVC with non-power-of-2 alt
setting on HCs like VIA, which generate Success after a mid-TD Short
Packet. So this will surely bother users with such workloads.

It happened because I tried to resuse existing ring_xrun_event check
and remove an identical check from the !trb_in_td() block, so I placed
the block after this check.

Revised patch places it before the old_trb_comp_code assignment and
retains a duplicate ring_xrun_event check in the moved code, I'm not
trying to be clever anymore. Patch 2/2 is a necessary rebase.

It is also a pre-existing bug that in some cases the function bails out
without updating old_trb_comp_code, even though we know that the prior
TD cannot generate more events (e.g. we are handling ring underrun).
But that's a separate issue that causes missing warnings in rare cases
rather than false warnings in common cases.

Regards,
Michal
