Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930842;
	b=b/6xzYwnuBCysbnEHVxxE/ZHz+BHyyfOVwSwdwdKXne4ohkokbMCl7dfTsXoRBYW4eWZ
	 B7CqX7f6jqU1DwOBmTMdYhhzBDXey2B//qh3pcv5pLhvRdlN6nz4kjnAEayGm+rfKObcq
	 3CXowzDhNtZQ0wiISa7lFAU5BWNXTluZDXBwjCLOrdT6ow+MfcgikbRX/hx4RcG9yn8/u
	 LcLBuSrMO0JeJvHjiyA8zAGgX1YTRN+NSpB5BvaGTU6f90TqdMV5hNroMz1P+t5qwb5H1
	 Agy1OV8c12NmREZXJM39bTxeM60IS+d/0wp0U/AnEJCj132m/CRgzrFCAYd1PDS3wgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J2IjfEFPn1TkX0JoYvkz939IJBltfJgLdRqFoj7aTGQ=;
	b=fURYOAdG4gYg1Iio3THOxfzNhqNDK3CrxJ7svWFf/u2sHbNOBn8/flvNNKi3Iv8om81N
	 OchWiLsgmzdX2Q6STlItH8mg9LKwFFBeV16KI/mCi24lgU9Pbq1f6qL3a+PGR5gCeru8B
	 t3S9U7N408NDNOGiwvy9tFZZgNrW2/onb3VMSB/7TQy1M0INjCpY0IyEqennh5cal3NwI
	 FAMnUtpGrUT618uzKuOA0zoOWIcL7Cc1dG/PUYqBGJpNTS3aCrrQtGSaYuhyxDkvRJHRM
	 RdwdUyS6E98bq2SVkobr8Bvk+fe9j8oB8MO+oTMbsgh1033lA26A23KOXj99wHUK6YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="r0o/7UgT";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA72F606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA72F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=r0o/7UgT
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so3101090a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794930841; x=1795535641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J2IjfEFPn1TkX0JoYvkz939IJBltfJgLdRqFoj7aTGQ=;
        b=r0o/7UgTBhDVgIsXKmi3yThIJQ4HLjTGTAZHpI2yBgSCZKSe0IS0aLYLFDfjg6jbdx
         PiTi4ETstssmo2Qe74jeOng1bOPhMoL7vHVL3FzDNsvy7btPyL2YOMV8O9Fe553pgql7
         QpAbdV4A8Q2N2D5dIurZ8nf8/PV7lX6FlC7dScU+XD2gP/MgMRcYaLNPyhoq/iF9sp5Y
         WqYjAMg/WXTCZU1ts+FCUkLs5dtqGImtEekwK15n9Q9S5g+5PDAX9Rk4OW3+MjlENqfr
         BxQgRVZFjphB0NQTJOlIcwDRCs/KYWvN3tPE7EOPXeK2MiQn6Mpke7oTUA6IJ9DbW8wE
         syaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930841; x=1795535641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J2IjfEFPn1TkX0JoYvkz939IJBltfJgLdRqFoj7aTGQ=;
        b=TcSe5z4Rnb1jjE+uLuQchlg4invf1FHdaCn6PvC7PhX7rlRwzHAasjd3NtfhRCaKya
         1N5CA0wbKOT1JEiJ1PyQCV5IktI3VCF1jq1N/f+PDJPW62ITroh3xIqTJkLc0lfZpdCM
         jerzZbnLMxYB1rkT0yRWBUwJDC7rKV5sgZtYcl672a+MJ7zgilHUVM2mtGWjSovUP7CW
         /O7Emvoy5PSZsyqmCK7GJS3maM7uB6lD6y+QyifwLJonGs2K5U6Z34/gilay/uErmHf4
         2c2fMtYhhKgsquBaOSzym9pZ0U5iawtBldWsw/Fb576xA5jwTTZzu4c3rJgl5nXyeKuY
         d6CQ==
X-Forwarded-Encrypted: i=1; AL+hErFVB9MNTAOnO/HKEOulOTT6qSf+0a0E8z+uk/wWq9HYOb3NZYuskhYqDLqidLcNwph/0yQ/gjwHfl8UYr0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8hZ0uwG2I2T/+ooaxoppnGEZ9E6wD2D2+fq+PhvBomXAtKOT8
	LjP70SzEq6GUZshNy+0oHl1CMix+HyGqZLe4Rz4/D5N/aWT0n8LSeORPVdL1YPYjTL0=
X-Gm-Gg: AZFdTZc0Ast8VHefjavM3dpHSgHs5zcElNH7iUs9A712cYHPaL+zdmSl0z6ONF3YWrT
	oULKmy6phf17bs1EQchs5U+opmHh/8z++Hz7C+RCyXcQ4Ywx8wIAJ1ph9KA76jf6kh40hKceQ47
	05vONDveWbl467lzptTfViAffYjB/LTtE6wQHUM4AFGPY2oLMy4FoA+14mnc24s2gu083RAWJSl
	KDr5G1lXNAGwlS4ex9KvrjvXV3j50M1PIIvdtpNDqz8hWC//7u+Ud0fXYtE22zVqoXk15d1rQyP
	LQWfMecthqKApYcvKQwqWSCW2cxhRVE+XCm11RM0LDrw8YlP4+3hO/Pkuo6vTWvNz67VmppjbFh
	LP4T9RldUDS4cbD+oYn9uzw3xuvHdrc2ItXABdBRQvuKsOdToIYMrlxkZxU2lAhD0bcH7fTG9+u
	havsH0VMl9ksJKU6gLoW6XyuG9nJzT0HZUHcXfMKzSYFrwB0zeCUwZurhkjDLrEH88mtvFbSdme
	mHyhvbyLd4/xOb/WZ8X0wJPNC4lLsdfol9cM3aSWdQnBzPFNmBzQKNlHwVDLURp8Mun1XEA2YBh
	nBykOlMryeBdrptNTgklm285MMbZ9kqEI3FYPVOFWht+z4XJJQnMOxvy2EpQFlk3oQ==
X-Received: by 2002:a17:90b:4c0f:b0:3b0:a757:e372 with SMTP id 98e67ed59e1d1-3b1b0b63d19mr13616982a91.47.1794930840793;
        Tue, 17 Nov 2026 07:54:00 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:5f::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac70ea45sm4543993a91.17.2026.11.17.07.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:53:59 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com,
	Joe Damato <joe@dama.to>
Subject: [PATCH net-next v2 0/5] net/mlx4: TX helpers and deferred doorbell fix
Date: Tue, 17 Nov 2026 07:53:45 -0800
Message-ID: <20261117155353.2250540-1-joe@dama.to>
X-Mailer: git-send-email 2.53.1
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

Greetings:

I am working on adding support for SW USO to mlx4 and the branch I have with
those changes locally is becoming a bit long, so I thought I'd try to break it
up to make it easier to review and merge by first sending this prep series.

FWIW: I plan to include more detailed data in my SW USO series, but I'm
working on SW USO because it significantly improves performance on hosts with
an IOMMU and an mlx4 NIC. I have a lot of hosts like that in production that
would benefit.

Anyway, back to this series.

Patches 1-3 factor common code out into helpers which currently have only 1
call site each, but I will be calling these helpers in the SW USO code I plan
to submit next.

Patch 4 and 5 add code to track when a doorbell is deferred so that it can
be written in the drop path. This is technically a bug fix (and I need this
to avoid the same type of bug in SW USO), but since I have never seen this bug
occur in reality I am sending to net-next.

Thanks,
Joe

v2:
  - Better cover letter subject line :)
  - Added Daniel's Reviewed-by to all patches, including patch 4 which has a
    minor change (hope that is OK, Daniel).
  - Patch 4:
    - Change the struct placement to address Sashiko's review. The new flag
      is moved to the area of the struct marked as "cache line used and
      dirtied in mlx4_en_xmit" and tx_dropped is moved down with the fields
      not used in the fast path since it is only written on drop and read
      for stats.
    - Update the commit message to explain this.

v1: https://lore.kernel.org/netdev/20261110231304.1859217-1-joe@dama.to/

Joe Damato (5):
  net/mlx4: factor VLAN parsing into mlx4_en_prep_vlan()
  net/mlx4: factor csum flags into mlx4_en_csum_flags()
  net/mlx4: factor HW loopback DMAC into mlx4_en_set_loopback_dmac()
  net/mlx4: track whether a TX doorbell is pending
  net/mlx4: flush pending doorbell when dropping a TX skb

 drivers/net/ethernet/mellanox/mlx4/en_tx.c   | 95 +++++++++++++-------
 drivers/net/ethernet/mellanox/mlx4/mlx4_en.h |  3 +-
 2 files changed, 66 insertions(+), 32 deletions(-)


base-commit: 6bc9aed3994cb04708fef02dd6d2f1cc5c5e8229
-- 
2.53.1-Meta

