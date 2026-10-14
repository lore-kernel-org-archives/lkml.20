Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E9737DADD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946575; cv=none; b=rqhGCs+1LYxVnaK62oOM146dzW12Ta1z2awyjqWLZ5NY3JRyLKwHDqVadKcy/NQAlJ0FsJ87FX0kYyLYgMGWdGYYYZqggEMSAk9IZYN0feZc+tI0sXw249dc8ds2b+ofLAKs3VqgZDRQoyN9Au4PY6At7nBiNLLvmmbeb4+I1HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946575; c=relaxed/simple;
	bh=uWMcfyDCxTh3OZr+A544tqFx1pQ3JXPWiQE7qP4mYEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bu2/9jrpxI1E3JPdR3hYyCXeEhC9cIWZt6Fe15jaj/sCvBY4Vrj23gOKvv1Jc9HBLOXYJwqWkv2zVmTw+4yQ/bxDR0o2UkGpX3BAxFFV4+HtAK6izWHK1c7kPCHAWEVJfJT34ZlvrgYzSyJ2KEuzoisSqZUkqHf5Xwv0tDCmYtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=STf7coK+; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="STf7coK+"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-141395927feso6889643c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1791946571; x=1792551371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J/qs6ep0AVoGjDnvQwIXmuadkHemtYNAxelWIgIUeeY=;
        b=STf7coK+XSu1hR57+sbiMolCTwKLxxf+XMDqVmShvAUqdhLMtGzR+Uyvt3T4U7Epwl
         s28ZS8wXwFkJMwZHhrG8dBM91g/ethAcu5Rbx/jqobyZ09bLIzjaOlBQKZN0Zree2UL2
         I9LBqqFRiyzWL/pot/GdAzNBi3jkG76fiG4U0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791946571; x=1792551371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/qs6ep0AVoGjDnvQwIXmuadkHemtYNAxelWIgIUeeY=;
        b=iJhAOo+J7qV27PSJgNsKoFWIHuqTRVWAarBAYCJH9fqou5rC2PSgCOCGisWIrBLUid
         HVTWaS5MY4/XRVEq1100ODlehk1OcH8KbU4lSssPczIXRj9W7yalZK5rVJ4/5i+F/sJU
         EEoLtXNhG/coGLTQ/LLeqXLdMAh/kGhNapbSNO6JioBCdnkY2em9Xboar4t5O6IIThcW
         FApAuFOJI437jM7/gImo64uF3pdN0e7LxigB+nvXTlsaZbEzlfZO6RYbZCcTOeDLe3UJ
         2+FK3KkWhByxDqpDIldqwkhwnua6FrdZreC3Y5aOwdd4P9L7xAQ5BNgOrojADiNck8tz
         y91A==
X-Forwarded-Encrypted: i=1; AKwUvBxuP2ComiLvNb4FcNODXCjFPbAMNN4zLBu2rd9igi/EuTUlfgr8CG1CLp3uz0mBldip6uW06Za2hhL/JmY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeLJ95ueMynWvFqvanSO/geeRvH9vY2xWUzkJjF7/zuZ6Za6hf
	97cs41pTh12UuNSjCThwv3R0OyV7qFYKzUTha/bVLYGdhHLvj3E1BFKAJLAr3dO48MA=
X-Gm-Gg: AYBFou0qxubHRabxNuKGdIE1Q4WIBXFrBnNe3zTjZi7VmMYKQ6TEd1hX93NdZTSnj7u
	cqRNtSEtQObUu3yhILUeoWKja+hk28A0wmXtvphZ0c/P89f2+RB8IgBNElTzKaVvqytwbCgpq96
	YJgxXjSpat8KxLdD9KWHhGIj/tywetVdWRrOE+oQD4fCQMUkV/bWqtVYqHGEIitjwJm5er9I6zs
	70J3nsKxVDUPnDPsO3nCkCNqG1R21Q2Wx5hemWY4w5E8AYW4LAlf/4HTSp1RCCEjlekfWnLP+Wb
	9ERwUbYLs3ExUBo3tdjkINtXt40i28aIpVPOMlFx7koqtYGe77CO9VixbYgzalGg2Pw+TMw7Uzc
	BBjE0MIGSTVioMnsnL2Jy4vrp4KWfvMZC2sqe9Px6Rc+F/j5qF/+fvb/0iQR5BMnX0k0369Oxvj
	2BLojfK/wL+EfKMFKiIF1ChMEiawaXU3q18FsHyuY5Fw50rNO0Hl7BENGrJ+XV1c5Y8FOsf/Ozt
	t+4wGt0vDBqSFegkKP2f+7+wmQ=
X-Received: by 2002:a05:701b:2089:20b0:14a:d8fe:33a4 with SMTP id a92af1059eb24-16a60de40ffmr22090397c88.38.1791946571104;
        Tue, 13 Oct 2026 19:56:11 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm2122640c88.6.2026.10.13.19.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:56:10 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Woojung Huh <woojung.huh@microchip.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>
Subject: [PATCH net 0/2] net: usb: lan78xx: do not use uninitialized data after short reads
Date: Wed, 14 Oct 2026 10:56:00 +0800
Message-ID: <20261014025602.26334-1-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lan78xx_read_reg() and lan78xx_read_stats() accept a control transfer
that returns fewer bytes than requested and then use the uninitialized
rest of their kmalloc()ed buffers. A device that sends short replies can
get stale heap contents written back to it as the MAC address, and makes
ethtool -S report them to unprivileged users, including kernel text and
direct map pointers, on systems with init_on_alloc=0.

Patch 2 makes both helpers fail on short reads. Patch 1 comes first so
that a failing statistics read does not report uninitialized stack data
instead.

The bugs need a malicious or emulated USB device, which
Documentation/process/threat-model.rst treats as a regular bug rather
than a vulnerability, so they are posted publicly.

Testing: the series builds without warnings (W=1) on net and passes
checkpatch --strict. It applies unchanged to v6.12.105, where it was
tested with a LAN7800 emulated by raw-gadget + dummy_hcd, booted with
init_on_alloc=0:

- Zero-length statistics replies. Before: 40 to 88 of the 235 ethtool -S
  counters are non-zero, including usb_api_blocking_completion() and
  direct map pointers. After: every read fails with -EIO and all
  counters stay zero.

- Zero-length RX_ADDRL/RX_ADDRH replies. Before: the MAC address
  differs on every probe and is written back to the device. After: the
  probe fails with -EIO.

Both bugs were found, and the patches written, with LLM assistance,
hence the Assisted-by tags.

Wei Jie Law (2):
  net: usb: lan78xx: do not update statistics after a failed read
  net: usb: lan78xx: reject short register and statistics reads

 drivers/net/usb/lan78xx.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)


base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
-- 
2.43.0

