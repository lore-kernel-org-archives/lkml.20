Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389453;
	b=QKKIOod1E/DCJqr7SRHGsZxDNXx7o1ziErGhXkENvCeBNaoEDiTtQRe4HKS0HK1E/I3G
	 t+GtJ69uXfRx2AG+f73SV6S/efElShUx/ChmadoEsvocmhc1uN5TYbmosYkCIuq4dK+cI
	 FDBjnaKoxuC8XfAEfShepVjsyeZoEgDv6NB35PLdrH0yN7co9i+y20SHK1P5xJ0/SuneT
	 xwaifQ0MAnnI+oxAmuz4tUn8L7ZjLO4S8fv+vSbbJDm+RvjlGN1r/GFR53tWnPoyekSeb
	 ue52jFI7APMzFAjkjINtB1HpwVclRj8tgv+Ya3E7s1KNg2Qhap4Kxpxu8RCVhHXxPIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ohdbjek4hr8Jhs6bONF/iNmbouRA5J+FWduvFT7IpeM=;
	b=2CNVDoPCqqa/dqsu+nGJ3s2j1CJHB5JR50wQqPtH2XGfckqyn5yonQROeILtBXfZJSOT
	 TKvhUu71mpZNQEb6rRk3Mx1QcDqCiwS17Tkz5byUZQnegy+bRcvRfZIfeoL8IAbZvkQD8
	 aeko6N1ejS3i4sn3VzibDuQXnXIHpXftJIayHUJz2qawsMF7XuYjHp1VA4VnWDAu4F8qE
	 hmFUie/4DnwWKkYD2SYdw0SxrhXRJJfad9swODvmH41A6/FapEzUi9GVFMfTz+TDUHlZU
	 EPrXZIU9ymv0nI/5tyu1I655khK8GuFzlKwkHwneALLmZSTW6a4HBjmNLF8UinLqiqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fqrgW2iX;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD6D60A2612
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BD6D60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fqrgW2iX
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49412eb1474so1820033f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794389452; x=1794994252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ohdbjek4hr8Jhs6bONF/iNmbouRA5J+FWduvFT7IpeM=;
        b=fqrgW2iXgHIJeJhQma2d8o1vZNeBqNbbG52ROBSXr7B/rKI6naTwS/dn5wgSlDXWyY
         v/ZQuKpMBHa7ZQxHt7ZeAfqIImafnW85f4Rc39C8m/lCZsstB3xUd9BbWtoX2dIHhB+g
         BhO5+RX9d2HCuar+UqD9j8ByYscf5nN5vEkO0VGjb1KLKc6Iex/tpGh8j3AnF6xfhNjN
         ZNLVuPm5/XyQ2CIY0HBr8vPI7Z14LXZFNOk5NpAFsJOgD7EPc20Ox7Z/9IFWcTUev6Hr
         Exm7B0B5OWTFlFbwj7M3W0PHhe6AQrmFle3vOCwPN2DPjV1WpA0n7PXQk5kZEC0jnC3t
         t0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389452; x=1794994252;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ohdbjek4hr8Jhs6bONF/iNmbouRA5J+FWduvFT7IpeM=;
        b=dq1oaiN0V8Zufr1lCrPglsDu0NtAUFurlL7KcwoRsRmYD/YLR3Jh5s2o1sv6IE/7n0
         YZekFBf+gJ/AGn5dDwWTp9UKW3NhV8t6QgQX+jyuZeGPVTvnGKWNH3OrZgh7nDcxhxv9
         L4/kHyFEI47svdmd/Rj00KzDPvOqrYISJKv0V1AuRwC5FYjABXAFVYvvFfKcLfRwkR2l
         dqAMVRMkpSTdwe/s0T1TTkG5lHfN76Xa5mmS9LEYxCdFUV2WhsJ/oaqQviaNyrDiaPDI
         IRr474mDVbh9/JJIDptXoLLiHylJrq/66J8AL/hsAop9D0arNRTu04BEu5+vRq8qoTvt
         A/gA==
X-Forwarded-Encrypted: i=1; AL+hErFKYYZswouHHaEqQO1YYUjodjeReDVM2DXLcNN1vFHlK4DeF0uAfSyPx5E2APc9WxEvJAKTyQtz7i43+ec=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VXqeOl2l4m1Hz00vzTJzttlDj4SHXJjCxrETnDBVjdBFK3gJg
	gdyIgqe+WUfp2N6xq7dAfV+InQ59CrUqVIohoQmkFWa1UxnHR8C+4lvu
X-Gm-Gg: AYBFou3hHiMonBBksN4QJeYOtFjxPMzYG0CDU1HHu/Rp4BxPMStPSRTNnFzQAgYgI1Y
	KBNVzjSQlhy49AWlcduDiH6YBE/pyYihesHhawDwn+4LIZ4+dt17ZSIeU8nfag1l/DwRGY1SBhU
	PUzfSHALCcg39cw6zsBG8bSFY5P7v44WuhRHdwqxcAAmxs+HijwyskCpGmphAmv/10/0B2BPi9W
	dQkTZgehPhZtUkKS2dvXC1x8ameeZ+Nqoj0BXoi5JtpWa29SlwgFtS09W6SbbzFQ+aS07TlIsje
	BGRXyJeKucRxgWXm7WKrJD3NXn1Q9tPlM/SpFKtXDsVvYpjGlFXXxLffSFv3m5jyC8PTZVMFOx4
	N5/ZQrozZ744j3cNzVIR6V1WyZFS+ObCrKj8HipBtIVBo+1B5TOgXxVA9/Dq/DjZsdUhRnMdd/M
	ogbCKYHs1hEMXp1nZJvdZv0wEaP1h02nh0Fl9X6qsSaS43YKmoF10MiVbp0JfZKeUJhTRv6/HIT
	/yQE1qGXzxPLLYuSfK8ToXZhGJRYvog+ReFcNkEvAFBaJ9wl/zweMK1tGVnmKKb39KJhMTT6gRS
	ODYCFDZjYHl1F0ptp8XMJb5P/VsaWiB1S32VwfqblV51ADv+SD0WGz6aMxqrQpG5agilsIAd+Sz
	2HJhHd0O9yeCxjpek8RVPSfDUH61Me9/NlFyou+WT8thH/2RCWrS+4l16nNijDEDpUKv+OGvTNH
	9FEFLIKa0kuyM=
X-Received: by 2002:a05:6000:220e:b0:48d:ff0b:9b52 with SMTP id ffacd0b85a97d-499c72712d2mr3050951f8f.19.1794389451603;
        Wed, 11 Nov 2026 01:30:51 -0800 (PST)
Received: from AHERLNXVDANI01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498362eb14asm9175839f8f.34.2026.11.11.01.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:30:51 -0800 (PST)
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
Subject: [PATCH iwl-net v2 2/2] igc: treat I226-LMvP as an I226 device
Date: Wed, 11 Nov 2026 10:30:35 +0100
Message-ID: <20261111093035.513635-3-danividanivi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111093035.513635-1-danividanivi@gmail.com>
References: <20261111093035.513635-1-danividanivi@gmail.com>
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

The I226-LMvP device ID (0x5503) was added by commit 8f20571db527
("igc: Add new device ID"), but when commit b8897dc54e3b ("igc: remove
I226 Qbv BaseTime restriction") introduced igc_is_device_id_i226(), it
was left out. As a result I226-LMvP is currently treated as neither an
I225 nor an I226 part.

Add IGC_DEV_ID_I226_LMVP to igc_is_device_id_i226(). This changes the
behaviour for I226-LMvP in the following places, all of which now
match the other I226 parts:

 - igc_probe() and igc_io_slot_reset() disable ASPM L1.2, as done for
   I226 since commit 0325143b59c6 ("igc: disable L1.2 PCI-E link
   substate to avoid performance issue").
 - igc_tsn_enable_offload() and igc_tsn_disable_offload() set and
   restore the I226-specific RETX (Qbv full) thresholds.
 - igc_tsn_enable_offload() handles the FutScdDis bit and the base
   time as on I226.

Intel confirmed that the I226 TSN functionality introduced by commit
b8897dc54e3b also applies to I226-LMvP.

Fixes: b8897dc54e3b ("igc: remove I226 Qbv BaseTime restriction")
Link: https://lore.kernel.org/all/5d45a583-198c-467d-afbe-8f19398e82f3@intel.com/
Signed-off-by: Daniel Viaño <danividanivi@gmail.com>
---
 drivers/net/ethernet/intel/igc/igc_base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/intel/igc/igc_base.c b/drivers/net/ethernet/intel/igc/igc_base.c
index ab9120a31..6865fef40 100644
--- a/drivers/net/ethernet/intel/igc/igc_base.c
+++ b/drivers/net/ethernet/intel/igc/igc_base.c
@@ -447,6 +447,7 @@ bool igc_is_device_id_i226(struct igc_hw *hw)
 	case IGC_DEV_ID_I226_V:
 	case IGC_DEV_ID_I226_K:
 	case IGC_DEV_ID_I226_IT:
+	case IGC_DEV_ID_I226_LMVP:
 		return true;
 	default:
 		return false;
-- 
2.53.0

