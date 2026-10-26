Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006891;
	b=RhhHocXN0KQ+U7OiEzm8BEcnq0mT6iSLXsC012Q1Ww5W/1g1PF9scd9VW70iBHRmXWpY
	 f6pznbVTM5jD/ksH6q0i8VPAlZkA+DwZbAIiWei8Mjr4Dob9hcK6Mg5fchdKDo33csXQX
	 JPVduo6nBnERZhj+qe8ywnz6/am4IZb/7Mas1HzIZWPKg7SPYM0ZKUdsUH8G6s8wXm0gK
	 YTVE8+nNorigo9MO4UDDCFVKZCmKuJ3V+eEJjhInah4ycQSjcTaqEYqwdwmXgn6WKmvPF
	 hNcQdqVB5nmRzPFCgerPgbLz76aGnJIuc1JgVOSjzw/Vu/jcsz9ABBV119phnNRxGmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006891;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=NcMZbSKk+Fr7qV28EkyvvxtcCdxcqzKGsfGHYdYZ+qU=;
	b=cv6FrAVUVOY8ExHaRdfjXjuIbwvn2aS9fnclhDrWC4HjQkoBBMhlfVf+BjnJmvWwRFSJ
	 YkOQzbmd6L5EAgDiR7wRvJm7jTrjMC1eA0SOYWwnALDEhH9B++xcRokWbnqme729Mmpxq
	 RQV/z7cp8Po7JvF8RstZtv9XOebQYxPoeT3uLkF2fKVK/xPdaHORSwpdkaz1xrRiAnUur
	 5wqrV7qK0xiO6+EWo7GeAdITiz7uw+FI/xrSHZZeEjtYofgd1k3+bIwmNdZYcUBqoJPlN
	 NpUiLFY0YJk9zRQY8+bPF+9QtVLb5Sl6uNL+b34jDYxPFn89DicfYFNoG93ptKw68uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xzm+K8lW;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942CD606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 942CD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xzm+K8lW
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1995091a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006890; x=1793611690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NcMZbSKk+Fr7qV28EkyvvxtcCdxcqzKGsfGHYdYZ+qU=;
        b=GRJYNzVmOfbD73SeVPgPoEvwVwNKTEm5jZi7uVcx0fcKvHZzCf4ZbSsB0jRld7ofBQ
         MybTz3yXu4AvQIpeArBKN6EaVauYKVL1tHFM5zkzZH0l5T7LxkxsAVyr/zdQ91ux4skf
         jFFIV/7NRvflk7UFOTMXyuF3DapjmVtOaG2YWevvyg3zMWDSUsBdE9EYjvldngvNVZ9D
         EOtFx+BC6n+sAfTBKkzZFNWvHbGdNw7CPUt4nOlZavaAw7praqPiJNf1hIYcoHRoPZWo
         GbMTMDVrDpm7mLb/67hVoP5RnesWOGKeR0gNtn1fv9Mev42lr9T7IZTeO0TaKt64arM7
         ZG8w==
X-Forwarded-Encrypted: i=1; AKwUvBwjwaAqss3EWgiBUnIo3jfLJR5fMpCedX479z0nrjHAZi1YmIPzF5i06Ad8D+YzgTQXk3kbO8HriDs+WVE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiJhCSqKs+IL4pZyQDHiCXWlEeME3yPOzl5neWGU+KUgZ93d3M
	GRdzr8qen3kk25VAg75KztO7/RxMUGv/wc1UrziR5IRtfNFZh7Da/Ccb/1+bgBJoEMPAcxIm37p
	ie93d4rI56mODxSPaFXElyacpu6IJpOxIq4FCmsCXKeuXfH2Vkg7wib6tSP6R+Cj77wmhmS+9af
	vTcvWZmQers7zeHZlzAaLhsGpeAFHugd6diSfFzTOroW3w+Pwt3wZenfh5LGbFRWM8Qj9nAiLOB
	I+1/Y0nvl0Nr2gFlA==
X-Gm-Gg: AYBFou0u5S0YYVf6dLOzBlkQZ/rLfAlzNquemgkz+DmAgU1oQ0QKo9yzb5FodihoMkh
	M4P8t73KbtIl10dK8+bqtCrkOc3ynfhl8fQejyw1A0vxIAGanBl339QcYqCVMwwv5UkbjhdhYok
	/cVfRPzfSXV4ATztlr7V8UBaI2K+6vsfbwR33g2A/5zkHl/KaPXYADU4DTTKdWtgH6xYAaEN1AX
	yq/2PZxURu/1q/UAHbxfLYgGEJM2SUqbOq+ZiBGVqHe9Td4o0TO7/InWESkFpt7AL4AZnTOs1nq
	0x8pAECCf1GMkU712QEjfKRoATmZHbceOZG/tmm2RUSdA/xHo+HNkR8qix1kVbvumxb6QbXR+fG
	/EY7teRE08qMVvBa5n9R/t0k8wAuhGPEwLSw1C4DMx50mvCqzM0M8DPJDadyZsgccsJdWMx0+ui
	i+5XJus+5EiCSWvS9i3GA4QREUvWwTpFq9G2t5
X-Received: by 2002:a17:90b:524c:b0:3ac:8897:7ba4 with SMTP id 98e67ed59e1d1-3adea0b02dbmr5070912a91.5.1793006889674;
        Mon, 26 Oct 2026 02:28:09 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adebd531f0sm6327820a91.4.2026.10.26.02.28.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:28:09 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so8096149eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793006888; x=1793611688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NcMZbSKk+Fr7qV28EkyvvxtcCdxcqzKGsfGHYdYZ+qU=;
        b=Xzm+K8lW0mUGk55AxqhA66uVifxA/ILn/O1KWK7w3WJDy9UhzsOPGLVNj4AMt3gX/t
         zjR+CKNRMePuUKkGOlktYKGcaFt5bRQgLPdVth/NKsM/cMGf2+mR8z6OeBLv3M9znAKU
         UIZSlUx3vciJ9NUeqS5VbLb5pa9AeXV4kJtpI=
X-Forwarded-Encrypted: i=1; AKwUvByFIVVm5Oxwcy8eoTJuDoQ8FjR5V0xw3Pmyv4gRe8fHt9m2PZCBSNBBWaCDFlL874Jj5J+/6u2YdgFYkb8=@vger.kernel.org
X-Received: by 2002:a05:7300:6da8:b0:369:f655:cc85 with SMTP id 5a478bee46e88-369f655d09cmr9019267eec.18.1793006887731;
        Mon, 26 Oct 2026 02:28:07 -0700 (PDT)
X-Received: by 2002:a05:7300:6da8:b0:369:f655:cc85 with SMTP id 5a478bee46e88-369f655d09cmr9019235eec.18.1793006887082;
        Mon, 26 Oct 2026 02:28:07 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f4164886sm16711294eec.7.2026.10.26.02.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:28:06 -0700 (PDT)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net v3 0/2] bnge fixes
Date: Mon, 26 Oct 2026 14:57:55 +0530
Message-ID: <20261026092757.9168-1-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
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

Hi,

This series fixes RSS indirection table and context sizing for large RX
ring counts. Patch 1 caps the hardware RSS context count and RX rings
to the RSS table size, preventing out-of-bounds writes and an oversized
memset(). Patch 2 fixes the indirection table sizing so rings above
the table size still receive default RSS traffic.

Thanks,
Vikas

v2->v3:
  - Fix Sashiko (Nipa) review comments.

v1->v2:
  - Fix Sashiko (Nipa) review comments.


Dharmender Garg (2):
  bnge: cap RSS contexts and RX rings to the RSS table size
  bnge: fix RSS table sizing for large RX ring counts

 drivers/net/ethernet/broadcom/bnge/bnge_resc.c | 6 ++++--
 drivers/net/ethernet/broadcom/bnge/bnge_resc.h | 9 +++------
 2 files changed, 7 insertions(+), 8 deletions(-)

-- 
2.52.0

