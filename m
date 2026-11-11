Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389452;
	b=hPDTZ5aq/M7l7rgIwNYK/kf2hmf5bMoDhNhMfZKtek+p6wQdJ9Xylpe7ljTO95lCmCa1
	 yKhtX/Z2hkoGJj8+NeBAXz8ds8mU7d9U7fjONuMlFGhQz1im4DH5coTvKfwadsFq2yCOm
	 wkOuYJnwGlgdRbFgoJEodZNi9ZwoItEozWHsBbkHJv9Zg4ex/UT/bKjE0SJLU9bEa+Fjy
	 GAigb9mS6XgiZE89qOBlFvHX0kugBSBc5c0Wf4iikBjYd4ELpGh2de+T3UJfsDuAKRNrZ
	 ULWm+BvZAF5Acp0YqUO1mqPScnrJ5FuGThHymU3N5fmg63OUxOvu3QT+vHXDzhzxvHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=B3ZS/U6BiBBD5fGeH1R5VkY9NPLOvEtcvatjGhH2bZ0=;
	b=DHXi24Z19PPeEtpMPbDRa4HiSh9T/9yPlkkDFL16PsqqGGCj+NxtrjTAIVEvE4KOcrrY
	 zICDvY31fSvAnWRrfA1zdN1rabwzOsfqwgwZY9rNln2P5fqmzyzpePWWSFUMlJXYTatNq
	 eLT3C+ttTk2g7Pghap/1tvezlDj3ezVohfYqqY1Ny9OmCjhIF7MZqgrTSjjrzjv1lpK/m
	 +5RMoIPsZPZiGqv7mYlmF9RlQZNpSWnbv9RvCki4XGnR7lCmFhuMJwwm8YeltMiqqqv0Z
	 +r8sPB5TeGXT1htIDmPxalyXoP9pKR20gfq36C6YIVRSg3/pI4ZKckddqju+M0Jiqpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bjJSDUbt;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B771A606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B771A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bjJSDUbt
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49318428d98so1583620f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794389450; x=1794994250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3ZS/U6BiBBD5fGeH1R5VkY9NPLOvEtcvatjGhH2bZ0=;
        b=bjJSDUbtOzaOAQpSLf50C7xoz9mpqk5qHohnCIlWIv+4dIzFCWT8uBWQH1BMHIwq92
         Sp0skk7bQEZLBgS9CBlRt3NPDx8HuxaDGWyvWfkZ1t5b9SklX5+Z5vQDrp+iOrJ3CWzk
         5anlnWL/yOmkvajDxM0Sfb0kdjTXD7vcoBuTVSvmPr/cSe5SV0IKMaZEs066FbMiPLUX
         Aap9BpEE1/6enil0jBizKD5Uh6mVeY0FLVDtPivV8kKXMLwefcdUh/80Q5IJTKpbNejz
         jXcY705DjPDXEcwVQ21YLgF81sG8rxoLoWlBnl9XRE0iNOJ6xgfV2KOcCCdcTYXutmYh
         s9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389450; x=1794994250;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B3ZS/U6BiBBD5fGeH1R5VkY9NPLOvEtcvatjGhH2bZ0=;
        b=m1I74DB0IOCirmzGG/9ss01taNep7/rfeZhQQ/lTIVrPyGOrh8Kz3kuNK1hB9GIe/6
         +wxCt07t/BRoLet5zH7n8IFdivvrMkv7xfxr/MY42Vjb3qiMxAF7S0ub+mmhwPC24ocN
         0ZByCJOrt0vS/AXhKKeg5SO+O8+RKSKHcUilPYJvjx7sSHmzyozBMsl/Izr4NhV3Y2dP
         CzK2SNHu970qq/jsAt+dLOj8DH4b5ipqY/wkHVV5icOO4wS9wj8D54UOx+zZVLOfiyj7
         7UWOgEIHOHgH78fbF2pIKM3pU5RnRROEnREOKCxEgxGBuDenpnSsis09H6RmVhN9wjut
         b1LQ==
X-Forwarded-Encrypted: i=1; AL+hErHTYywX//RWqSjko0kyQEY914KC3gBu76Dkpps72G4KuOK/3Qj9yZpWG68j1Tf7k6MHh4QZz0ydONC6TYU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+cFC8lxxWxY5zsXEn/RAEEuklakoit3p4DEHi/qN7oUGvZpN6
	HYXIeA/fD7DS68QNozjpXsilBfic8B37kz9UtSH9NaP8TVieozOMUEWT
X-Gm-Gg: AYBFou29AzC6c5TEBKQUr3AZOzGlC/P+hX6gqiPLISyID/5uWBudHd4YMrOp0QUYA9a
	Mjxdg12xh0EBofphuz4b9mWL0gGmejm05TSE3djWqXsIpqkeJMhnGRpjkUbHXfWggD2mXpEmrSI
	zJLciJZLbe9i1ycjKE2CsCWD1jFBiA83l6zrS2EaEWaBqqZw1tI+FOJRI7RLXW4JR+iHHPX6+ok
	KvRpMEwkhx8+vhacBhhVUgz8u0gUnI72S7hd1Np+5w7I502nmjfVCibHjSQfEHxNDwYDHEsnLfg
	x9SxqWK5h1OEhuSzbrPl2vgvecso2V7cIVU2Q0morJaYZM/XXsqb0mIL0x00sJm/n8CZcHPrkZH
	0RPQ+XCXaQxEfKQByACDpT6ka2nGokrAakd8wbgUWgLIIGYCk/abI0BLm1SuDrxLCNffDvNTV7D
	ZhAUZl4yfp3+LMxBmjjYQl1uyZKpuUo4XLxb4jx1zRS/gsSqm1mZdOMsjjswNqaKvgA29wtzLds
	/ilGMIVwfp+P5CA2HAw7DMLuuwhfU/IHOzhbpzjezVXKJLPCF9qn4GoyPUquXhuyD8QDrWIxuZc
	80nc/pkZM8vW2MBvLgMtt29ENe5UjLqforx0Dg4A3wR0khqE8eA9djQiyAH3Dxkzq8ozKOwfVCX
	bzL4GqP4Rfb31xdJqLLtf/2qVm4aDXs2BdJexxWXy1HCKk69AgsxMd46mG8T8tFkBRX16Yp7Zcd
	PpLo1bAGr0mAc=
X-Received: by 2002:a05:6000:25ee:b0:48e:932:aefa with SMTP id ffacd0b85a97d-499c630fe5cmr2820902f8f.26.1794389449756;
        Wed, 11 Nov 2026 01:30:49 -0800 (PST)
Received: from AHERLNXVDANI01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498362eb14asm9175839f8f.34.2026.11.11.01.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:30:49 -0800 (PST)
From: =?UTF-8?q?Daniel=20Via=C3=B1o?= <danividanivi@gmail.com>
To: intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org
Cc: anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	dima.ruinskiy@intel.com,
	bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Daniel=20Via=C3=B1o?= <danividanivi@gmail.com>
Subject: [PATCH iwl-net v2 0/2] igc: fix L1.2 disable on resume, add I226-LMvP to I226 helper
Date: Wed, 11 Nov 2026 10:30:33 +0100
Message-ID: <20261111093035.513635-1-danividanivi@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This series replaces "igc: Disable PCIe L1.2 substate on I225-LMvP and
I226-LMvP devices" [1], split up as suggested by Dima Ruinskiy.

Patch 1 removes pci_disable_link_state() from __igc_resume(). That
function is also the runtime resume callback and can be reached with
pci_bus_sem already held for read (pcie_do_recovery() runtime-resumes
the affected devices from within pci_walk_bus()), so taking the lock
again risks a deadlock. The L1.2 disable done in probe persists in the
link's aspm_disable mask, so the call is not needed on resume.

Patch 2 adds the missing IGC_DEV_ID_I226_LMVP to igc_is_device_id_i226().
Besides the L1.2 disable, this also moves I226-LMvP onto the I226 TSN
code paths; Dima confirmed that this is correct for 0x5503 [2]. Patch 1
comes first so that I226-LMvP never picks up the problematic
resume-path call.

The I225-LMvP part of v1 is dropped. On the setup where I saw the
errors (HP Thunderbolt Dock G4), the I225-LMvP does not advertise L1.2
and the upstream port has no L1 PM Substates capability, so L1.2 is not
the cause; I will investigate that separately. As agreed with Dima
[2], disabling L1.2 unconditionally is not part of this series.

Testing: compile-tested only (igc builds cleanly with W=1). I have no
I226 hardware, so neither change has been runtime-tested on the
affected devices; testing on I226 / I226-LMvP would be appreciated.

The resume-path issue was reported by the Sashiko AI review of v1.
I used an AI coding assistant (Claude) to help with the locking
analysis and to draft the patches; I have reviewed them, compile-tested
them and take responsibility for them.

Changes in v2:
- Split v1 into separate patches, as suggested by Dima.
- Dropped the I225-LMvP L1.2 disable: L1.2 is not supported on that
  link, so it cannot explain the dock errors.
- New patch 1: stop calling pci_disable_link_state() from
  __igc_resume() (reported by Sashiko).
- Corrected the Fixes: tags.
- Changed the subject prefix to iwl-net.

[1] https://lore.kernel.org/all/20260925112850.189302-1-danividanivi@gmail.com/
[2] https://lore.kernel.org/all/5d45a583-198c-467d-afbe-8f19398e82f3@intel.com/

Daniel Viaño (2):
  igc: don't disable ASPM L1.2 from __igc_resume()
  igc: treat I226-LMvP as an I226 device

 drivers/net/ethernet/intel/igc/igc_base.c | 1 +
 drivers/net/ethernet/intel/igc/igc_main.c | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

-- 
2.53.0

