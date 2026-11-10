Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289506;
	b=bar8jRIha1yvNAADKyWcr/kc1RWp8FJGK3qAtqIi6uAPYw6CsXHQqhY6cCwkMbATv4hW
	 gcBm9Fg2Yknd1iSMj+ZEdA0XHB0Ddxu5W9G3YG0NmaO2OFuSbQpRs3eixUTfanvkCsamH
	 Krex+W7o/3UFEMxGag+eV+Q6DsrfTTXGwVQDVYeqXBMPktnERy9Wys/r3zrTKoGGLpB5N
	 Ki6NlMbSIOAOSfi8644GmMKBeY0hfh1wkEcbjTb3+fP+gsQExLQ9jlQYVPgQ8DVgOZrAh
	 wsRRCgTeey+Q+bhuKgQzeunmZNeO5pVR+ZB0w49BhFK32y4b4E7PLJIRhdlywBuJsUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p+m90ZHP6p5x4AVs4ojsWRq2UWvQJVYuVb7I16eMYE0=;
	b=ntceCZiyr5FTvt3XbFXdwaLLmU2NFh0sk775nmdIhNDtTFVeMGJw5R3l67UZolbLFDrA
	 8oPEWgoruHVhfDQAIbSOVJK40uT9/1dvdHGfhmiu5cAD+5X1YxjGKWMxG9GCHmB+VmVZ5
	 U0dHfCWSpK10fw+iZQ/sTLydKREkRVc34h0PJAwInP1hOTaDZ0ayaIOXRRuHS001uYtr3
	 AohiOLQoKgVBqVVjlRNg2N+xBcESSB4O2KYzQqOr5He4C0ugMDV3M+cxveE4q440rAdWJ
	 At34TBH5KAgja36O2uFpaXULREBsuEXyL4ikeCDlcY2EdLp8+O3thqfkt9qzadCVeFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CnZ8C7h5;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E16606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0E16606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CnZ8C7h5
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso991141f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794289504; x=1794894304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+m90ZHP6p5x4AVs4ojsWRq2UWvQJVYuVb7I16eMYE0=;
        b=CnZ8C7h5094DmlshNeGptAMnvcSxnLAeyMg8K/R3q+alRDLFABRomdJnRcergKmB3S
         51RfVxdzAx82FnvV3pyNPgZcTOcTei24JRyX4rc5R+0h5RDUc/Dt9iTqrob60+wuwzBz
         ZpMM4yiGR0SZ7TlAjZLozlqJbWctfFkfa7yeHINDvW41NcJN/Frae+iLfbX8OBnJZHqh
         2wMLhFOlWcp/DI23lfYsIQ+062ENiDQPILuRF8eMUu5IjwhyRf3sT8HBBLwHOZuenMDn
         11mcSyLPcR1eDkjPct+01O2JlNKgiEYjfI41OdXC8KJ0obKKrprZHdHl1xdHGru0rZLv
         63mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289504; x=1794894304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+m90ZHP6p5x4AVs4ojsWRq2UWvQJVYuVb7I16eMYE0=;
        b=yzkwTPZ8ARVa8MeqNtdmbwEMZbo1o3c8n/lusNGKKb8scrXz4qLC9v1izlgUYOhzqu
         isgUNajWAyMnTkk/2L5lfCwSutR/EieXrH0PHeH2ovrOQRDfC3QAj5iBHHrpkw8HNm7o
         AlXJQ6XcMo4Uul8xsFNfKAEmCEkoo5Shpec2vJHWQxTxC1QPnCXmu/PRcUs8h16nlssr
         t5VHYRyg0MfE2wGj8/RYtPuVuUetsHVgVV+gryBFtbrdmNyJSFqpVCiC6OIX8FDyO+Bq
         kwdIHbPkcImBAiBL7hOw96veoEG+PNKD4TcsebZqD94ktraWycCdGAFC51/6kMVAaHL6
         DNyg==
X-Forwarded-Encrypted: i=1; AL+hErEmQa4bIBWLL+jLNxxrg4en0NseR5F7RfoDPftMiIPUoOnrEIp3hGg9quwyVu6sg9nzmAcmt4z8ddtbHU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YPS4xAjx5Ni3JfzYWTh43oDdjYXFjd4lkUQ6vMO9G/uhVkuNq
	9Xuqn5PezeXqhEoYW3r7qoM44dEvQnaZjDJGiBOHuvZUvtR2Ica8QRMZ
X-Gm-Gg: AYBFou1oVjp6KRkWFdM2dOLvDaUOWsdUhOogUxq5doghoTUG5HQ756YRTTt+uOPT/B8
	uAxm0MOUazdYCf1ku5/qiXaCWURV0zK+ZEUcvX/WWNJwCwQndTnOAd7hPeJgjj3VpHqDhF5fPjD
	XEXLbLhAbzlSzK5Ko/tm4q2LZuZhiCsDxEXIM/lhhaT9/8fWLQIcP7fn0wMCbP9TB/pXNwVD42r
	+Ph0P0+HiF/TnwdhZODeifsFRG5MWw1lD/+jhdI81lgBwMlKm55DwbHxLOjtcTAn6YdgbKHcqMV
	o6KrcRGvpCxqqGdlIEFb3iXvXpgurdkaa1hKjn9dRyr401BNzj1AbboiOhhkzLdumJX3XEsKCLb
	nNzAlzg07cRexb9YGD6MilOgNt3MCUDBuonYuyrDHyXid+Wu/+7vG2AVZFaFsWRogAffeqel4tv
	2npPStkWvWt1YNMnZ8CJChWW0qmYFmIfQtUGLNXwsa5X06joZil+QmXyyYkHItBPHaIL37cdPg2
	9uS7OcEhMalaig5POzcS6HJx8H8D8nM4bbP2N9G29QeBlSLqHWm0S9XAVOmD/x9WJghh8P8RZHH
	IcEYRgM8TOWE0XpLDqaWz0p6PLYs4zFI656tg1PIZ1/n/VSgr2IXKVJSDDmk+nOB3d5p6kW5dut
	MLEAFJ+XZ3ZayjA==
X-Received: by 2002:a05:6000:2482:b0:48e:353b:9f28 with SMTP id ffacd0b85a97d-4982b28ac5emr3169751f8f.1.1794289504112;
        Mon, 09 Nov 2026 21:45:04 -0800 (PST)
Received: from DESKTOP-OL07BOP.localdomain (109-92-113-33.dynamic.isp.telekom.rs. [109.92.113.33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbfc6sm3083123f8f.41.2026.11.09.21.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:45:03 -0800 (PST)
From: Hristos Nenkov <nenkov2004@gmail.com>
To: Song Liu <song@kernel.org>,
	linux-raid@vger.kernel.org
Cc: Yu Kuai <yukuai@fygo.io>,
	Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	NeilBrown <neil@brown.name>,
	dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	syzbot+8b22a0459202f76b4096@syzkaller.appspotmail.com,
	Hristos Nenkov <nenkov2004@gmail.com>
Subject: [PATCH] md/raid10: preserve recovery flags on reshape abort
Date: Tue, 10 Nov 2026 06:44:56 +0100
Message-ID: <20261110054456.625-1-nenkov2004@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6aec6738.059f5055.2712e4.0005.GAE@google.com>
References: <6aec6738.059f5055.2712e4.0005.GAE@google.com>
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

raid10_start_reshape() can fail while resizing a bitmap before it
changes any recovery bits on its success path. Its abort path nevertheless
clears the entire mddev->recovery bitmap.

dm-raid keeps MD_RECOVERY_FROZEN set across suspend and resume. If RAID10
reshape setup fails, raid_preresume() logs the failure and continues with
resume. Clearing the bitmap removes MD_RECOVERY_FROZEN and makes
raid_resume() hit its invariant warning.

Do not clear mddev->recovery from the RAID10 abort path. The error paths
reach abort before raid10_start_reshape() modifies the recovery bits, so
there is no personality-owned recovery state to roll back there.

Fixes: bb63a7019df9 ("md/raid10: resize bitmap when required during reshape.")
Reported-by: syzbot+8b22a0459202f76b4096@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8b22a0459202f76b4096
Signed-off-by: Hristos Nenkov <nenkov2004@gmail.com>
---
 drivers/md/raid10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index 066c43154..1fd3f5f4f 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -4490,7 +4490,6 @@ static int raid10_start_reshape(struct mddev *mddev)
 	return 0;
 
 abort:
-	mddev->recovery = 0;
 	spin_lock_irq(&conf->device_lock);
 	conf->geo = conf->prev;
 	mddev->raid_disks = conf->geo.raid_disks;

base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.43.0

