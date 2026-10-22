Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660574;
	b=jr4xFGWMcAaAFbb0CQoYitJqNcdCYPHsFqN36BpdCVN2JIxBp/NHWiRqIZ4cND/C1MCR
	 H8fu7SIM2nYbOjx2HSjvsaFfdGg8zN3P7wZ2OdoN8k+Ny2A3qzD5Besjxqwa+ZWelCzvM
	 ncaaNW3tom2dsDUyWYVLx6A813uV3qXUe0tHMgqB5JxrEhU2jiEPNHuOufWozUnKfUgdg
	 O1GMxi4rrRzURZ/kF6wNN/bBjuP/9rgutzi3yeGG39mp73gOAVweSTp7TmHiYuClL+nFb
	 OG6XT+jnNB+3zOAr0By1/wArCtfSUrnClczN36MMnhr5dzHVpD3byTFO6AFY4Vj380w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=y4SBB/zAR7G8uWNCyu3PQ07icMwXcC5cIWOIKYHE0eo=;
	b=jFzIwyzQjG6+fgiUiH5d+47iexp7nS49uvg6tc8BJ6tpsfGUwm5RBwTTUSI5zAHtX2NM
	 vJ3Klqq0JRR/hLxe9s/5e61ZkyqmTqFgkca1QubRQr2C1/2LoqpyQA798kCwPFP5PCXcV
	 /Jb/jaNdfRAYs1MId7dCcRdjCdz9Z+6ARCdM7QK7Raytn6f+MjMIPO0AaIVYYxwp6NRe3
	 99ezXYM/X50i8BR4iox/OBej+Q64+9+0p7Tu2YwbbxVcCEuFPpNczqm4A7hEA1EYH5UlH
	 IiWfA8MalLAY6BqrmTJK4Grym5fHAWDct64ZiF4GTuwsGyMXkJxiYaTCCtuCZ9o0HvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=njfsfwGl;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9508606A339
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9508606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=njfsfwGl
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-354ba08cfd1so2801955eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660573; x=1793265373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4SBB/zAR7G8uWNCyu3PQ07icMwXcC5cIWOIKYHE0eo=;
        b=njfsfwGljP6QQuLHug5er7AG833CMCr68NoapFg/Mj+WCZc3iA5mcyBMyeMgfTtJ1E
         KMV/SJiNUvQ+bbmiJ3FOEEIHdeLS532/abj90OawVjuFZCsQWI9yG8BOdX66MqHLh7NV
         n3xAfAqWbQm/emrl87wlKD/JQYtf9iwUCnA0lcOH/bRREk0mggYRKa0b879ApDfvr00Y
         YBprte0hGTQuYsB0ZXs+WO/QzLpKtsrwfUliG3MPdNp/3HJfOkrc2tsfvCPt/r8uINJu
         glcuVMJfi6nUPpK77x01GOkYDcE0EUU4jT9ZDxNoH/25mi2JJDTs22YWLmRs/zsr7WZP
         MDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660573; x=1793265373;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y4SBB/zAR7G8uWNCyu3PQ07icMwXcC5cIWOIKYHE0eo=;
        b=wmSSypQdo6RMMtvGCfTI9L9pDbqxq1J917oRhwNnYemHMKqYXhHC+GKjHg9YNLWgX0
         MYA80sZdhqqc6IRf7U22USkeEFHFuMc1e0xPa7aVZSI3oQEfiW1VAhlgihxCz4cXNOrn
         Tu5KtaJmtUS6Fw91r5NHpoQoYBAr2Qkk9cJ+Uj1UehuI+1QOCdvvKUmMm/FW8e7G9whF
         hI/yqQQk7rzcwY5pAcDEbvKAdSpyWlyLiokogGnIq0nk3fPasQRIcBbdzg5jL2lvd7mJ
         V4Xmf5M5Q1LbDen4ZrcWTqRXkWbYdo2bW1ttnMLMxO098yPD9B5vLJa3yx0SS5lXIwYY
         Vaqw==
X-Forwarded-Encrypted: i=1; AKwUvByBVSb/Ksxe9AGjhQjOzwnLb+hYHDAar9IkugPPtrgo8MLXeIYclAqWWEQVy5/+2L0HEtG35vktQg00jC8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUNNwtA0QWmBc+9ZGRUZY+8YomuAsKkJBoAv7Rvo7nJqLJbtmV
	CaFZe0ItGRObKNlSTmw/aSmofKVuzFk1KZjb8aTjVN2BfntRGTIUGFnw
X-Gm-Gg: AYBFou0d0gaTI5GTFAwdwo6JVJL5OtzVClJ0mwUUS9wcsfTd1GebODzUwAAZ4xs8GaV
	UFgOQJP42ZLBeCmUpQzA+rwHM3Tv8m2LmJqaXIK6r9LyCtoLjL8K6KdmEpT/dgNIAI/1BMiud7M
	w3vxfaJS+abONbWXzx9YMm9LmmwUCGNuD6h/fwI4Cq0+33FKrLLAPrIDR90KneveVsVUntp09vC
	as6rvzVTcKqcg5Wpxls7mK3qRTrcIh9yZTxH3I429YxUNuNAC+kVNhMfFVKKTzb5GTjPxgHC54M
	rzPwVuIXlJJv44sARFgt79JZVm6J5pDOIES4a5tO3hjdGAeuwZ9WuLsXO6GP40beG3vM/iKfg97
	aspJR9MfwKVoivNBZz2uGI2ppfRnuyvur3FhTBmmbWsr13Wu2b0i7GiBGDW8pOAlwFuWBJjLJqL
	qPMF3vLN2iHfuFPkPCXcePxXR7gQpLofqxd++8hGdKSB6m1L7mWmTQ4nf/HwFaiTNXkggaZneA+
	gMngUy43rARCkMIIgiJOGMlIO0Mt1ZFi7MepOLvOLn6MLoBh+8y5BMWgHgQLZoyM8MwUApZJjng
	+RB7QghqrP01G7QG4tw=
X-Received: by 2002:a05:693c:20ce:10b0:366:9ac5:34fb with SMTP id 5a478bee46e88-3674c92e0f7mr6089640eec.13.1792660572901;
        Thu, 22 Oct 2026 02:16:12 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411bc89fsm18131777eec.16.2026.10.22.02.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:16:12 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net: bridge: failed VLAN tunnel update suppresses state notification
Date: Thu, 22 Oct 2026 02:16:05 -0700
Message-Id: <20261022091605.3651677-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

br_vlan_process_one_opts() commits BRIDGE_VLANDB_ENTRY_STATE before it
attempts BRIDGE_VLANDB_ENTRY_TUNNEL_INFO.  If tunnel insertion fails,
the option loop exits before that VID's changed flag is included in the
notification range.

The new VLAN state remains active, the request returns an error, and no
RTM_NEWVLAN reports the state transition.  This makes netlink listeners
disagree with the kernel VLAN database.

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1.  A range request for
VID 10..12 set state BLOCKING and tunnel IDs starting at 100.  VID 11's
tunnel ID 101 collided with an existing mapping:

  request result:          -EEXIST
  VID 11 kernel state:     BLOCKING
  VID 11 tunnel mapping:   absent
  VID 12 kernel state:     FORWARDING
  RTM_NEWVLAN for VID 11:  absent
  RTM_NEWLINK for the port: absent

The listener was opened after setup and pre-existing multicast events
were drained.

Correct behavior is per-VID atomicity: validate/prepare all options
that can fail before committing state, and roll back any earlier
successful option writes on failure.  If partial commits are
intentional, the failing VID must still be notified before returning
the error.

CVE-2026-90114 covers a different defect in the same batched range code
(descending ranges and an uninitialized error value).  I found no
matching fix for this state/notification loss.

The PoC and two independent logs are available on request.

This was found with a multi-agent workflow; the exact
notification/state divergence was reproduced in QEMU/KVM.

Thanks,
Cheng Yongkang
