Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A4E39B954
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195572; cv=none; b=B2TwY37EYZO6pat0nat1ybAE8rykQissmVQnKcBAbRUDF782F2APfT7bN8Fhmc5XcAo0WBDFD+MVdekjiZ09iTYWBYftWcvgEcNFRQgqG9WdSfRR94BHuDTKQAIxyJQYR/qaj2KsNQAcbC8tN112UxV8phFRuQxZ/RY7iZsiG0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195572; c=relaxed/simple;
	bh=Ewfrv3pb6vTQrXV7ZsHXBFCFYAu5G9ghsNuNVD+zo7U=;
	h=From:To:Cc:Subject:Date:Message-ID; b=i1Uoz8zrgUqey3jEnS7MXDD+uKQRh0CnjtebeEIlIAz2OHuXLyK4eqhPkLOt/Ra6P90ydamBBiIInnllZ4USgk0ywmgjgjCyPKR65K6hyXJlBd1XyhB/z3R2pyAsqFwzd2w+qrpCw7BwsAFXNPSn9MdW73JWqMoA2RRpBUEwhas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=FEx3W2w2; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="FEx3W2w2"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so5534800a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195570; x=1788800370;
        h=content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNWxtw/AIgfdPSPKFR3OrUMfFoHwBve6dL6/68wNzoA=;
        b=izBZTiojDHpYQfIm6W/mHDdeiN9ThC7IfD5iVM/m2zZ5EqZD40owuMHurEeDLmktPa
         JlQhcg6zvv/e9XM8xer8oxXQrk+j+qmt/1FNjV//1lmodlLD0/nist6eEVcpe8fBFd1+
         u9n2DoN3Le1sG4FkXzTzFdGbuZOU7MjVOQVV27BDPX1sUGkEvFrLDDTKhQddevN3jBqz
         PuUN0wQSaYXUWY9Z/T4RwKGKwgRAeqg2gBYwcJ64gCZNSqkiPbgvlpBhNAOeHv9+sVq4
         6u+keC8fMKLXy14TBDpqW8Z56Qlgn8hp4Q6gkSgum5YAp0aJG1UhoczyfrR5ltYxHOAk
         WfYA==
X-Forwarded-Encrypted: i=1; AKwUvBz+WZFo1MUar1Ms0DocOgxhA1Kck1orJG71pZ3yB7DwsaArzPIjR6xvEnrlC66mdGUZdPOMqXvGKaK0gXY=@vger.kernel.org
X-Gm-Message-State: AFuF++n1ykyVVYjxZYn1qPDXtW233Mc2ydxlJgGRKs9ytXgaNmC5h6pt
	OGCo2rzit8YcNFn1a7t65uHcxF2kympZvwav9TdEDaZZjgMIwCilBhBWtHyp2TklkCNtfAQUNk8
	3Vi5Pr5Ind50qdKYxhOrr9F23GfKV83omrQ==
X-Gm-Gg: AYBFou0m/VFpeNPwHVS2r+XGvbJFe3Iw9WabA7/Yx37zWdIXWymGDthEFJn6Qo2Ll7C
	4PH4qzaSODrF+7kVgOxFLgghe4oEU+N8D2mLgl2cLtHbdRMwgL4pB3nehHPnlMqNe4vvA+0vkNW
	maPDWeV0iQ3X6MrLhb27cdldvi7P91/462OVpyKI51TRTfxrCSuLEFLBVUVe2/Rei7nCg2dVWFk
	Nb+RN1A6SEyILg5hSsA0PkgDJD2K5k879hyfsB4bdXACN6ro0JnSjLJsSjYIq4HvCW2bLUrPF6X
	9D4zIn7GwBCY6BQPWViJoRJtmf43+lsJkjQmYjAFysCw/4cKtgrpKleyMg58Raahh8gikZ3eiqc
	M6vdXv5LsAEiy3k6KG+edJh6k223eAA9d1/cjlaIrZmSfaOjzeUicIKGipV8qkGBK2Z1w
X-Received: by 2002:a17:90a:16cf:b0:399:ea1:5a82 with SMTP id 98e67ed59e1d1-3990ea18f12mr10238a91.3.1788195570171;
        Mon, 31 Aug 2026 09:59:30 -0700 (PDT)
Received: from smtp.aristanetworks.com (ec2-52-52-135-65.us-west-1.compute.amazonaws.com. [52.52.135.65])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3990bccf100sm69057a91.2.2026.08.31.09.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:59:30 -0700 (PDT)
X-Relaying-Domain: arista.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com;
	s=Arista-A; t=1788195568;
	bh=oNWxtw/AIgfdPSPKFR3OrUMfFoHwBve6dL6/68wNzoA=;
	h=From:To:Cc:Subject:Date:From;
	b=FEx3W2w2zhDSBt89Fswat61dd1ijBWVH8f7uMo31Q3E9hOooUYW8RYqlGsXaQ5K0k
	 iHJ0ed/09Uhj0AdzejMNbkCsKZNETs7CtO0S4QqRN1rE7be/J113Jn+gZgoHmkUEh7
	 Kh7eXJy0N5z/zZ3vlUeMPD0rpwDfEQ+9xYVC2Vd9Fxgalxvl7XePBxXNPcGfVOUFNJ
	 HeMyPO4CcG6YFbnYCxXxEQ0Emr6gVRZYKGsi9jAjkgkLFAv8hBM3lez9OwUujvUTHo
	 MgPviJQZtrQ38mh6zsXR8+XpsY+XD1Bd6Z6w3UBzyUp1P7Ursmuq7ukZxFt+OWOjzG
	 91Bl211BP2bdg==
Received: from vm-whiteberg-ubuntu.aristanetworks.com (dhcp-244-90-77.sjc.aristanetworks.com [10.244.90.77])
	by smtp.aristanetworks.com (Postfix) with ESMTPS id 8DA97C2E81;
	Mon, 31 Aug 2026 16:59:28 +0000 (UTC)
X-SMTP-Authentication: Allow-List-permitted
X-SMTP-Authentication: Allow-List-permitted
From: Tate Whiteberg <whiteberg@arista.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Tate Whiteberg <whiteberg@arista.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v3 0/2] serial: 8250_mid: fix race condition between output flush and termios update
Date: Mon, 31 Aug 2026 16:59:06 +0000
Message-ID: <20260831165911.2029839-1-whiteberg@arista.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix a race condition in which setting termios while still transmitting
can corrupt transmission.

Changes in v3:
  1. Patch 2: use scoped_guard(), as suggested by jirislaby@kernel.org
  2. Patch 2: Update Fixes tag, formatting changes as suggested by
     andriy.shevchenko@intel.com

Changes in v2:
  Split original patch into two: a prerequisite to to expose
  wait_for_xmitr() and a successor to fix the bug. 

Tate Whiteberg (2):
  serial: 8250: export and rename wait_for_xmitr()
  serial: 8250_mid: wait for LSR tx empty before setting termios

 drivers/tty/serial/8250/8250.h      |  1 +
 drivers/tty/serial/8250/8250_mid.c  | 15 +++++++++++----
 drivers/tty/serial/8250/8250_port.c | 13 +++++++------
 3 files changed, 19 insertions(+), 10 deletions(-)

-- 
2.43.0

