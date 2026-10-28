Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793172648;
	b=Mz7Q7burPcXKRnh/waWGaV0LYbcTH2iyFKPrCq2SOqNKM3mWHOc7lWtFaBRzKshOUsfc
	 nbdJsByAJWKEUeR1LEtlWqDuBmvwGbOp8A8vDpstg78gOFN8O/H1BXFPd/bDgVJS6nEzX
	 UNuS/obKwAN2j1ZIEKv4nUYN0gXzofqZlM4mSFuoTEWVI24OMRsR1mzb1gtW8wYQMgqKp
	 DcuTC9mijZsFzPdF6SoB2JoHHTj23gzcTbh9lgoWveGBHVMMvtpM7O8UmLzC73bv3DboC
	 W/4ROOeCTNFJX7fT7qzQDXw+tuSpbC4qyYcHV654ZdMU5k0JRpZJwyV9DOVN74N9Rwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793172648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BxvbLiLB44gG/WoazELJQFuN0Xy0A4FvSD5C1wEHAm0=;
	b=wZjUqXecR82CQ5UdNFBiSqLnh3fHua3o6YP7trAdbW4k1v6W/Nm3VkypYzJ0oPmuZzC3
	 bsTeh7+ju2e9N67YD0Y0pXHoS5orrs4kFswC/QpyRZ4i2UqmHCIQz3USwyMHPCedbqXJ2
	 /7DGT+LVkgjKklBCxtCPq8Yxg2BBmZ8TtiSTqt3WGv2J42lknNbok6iPu0rQY+3e6thjL
	 Lzlul4mPMQY7MWrEQLhPNlZvxML41XOmfSA5MpUs6sHDZO6rQXcwh1VPAqd2zSby197Id
	 FUoUvTuyGKHQcqFtpzd4EZ+NytfA5APV44uDsAAyPHDonTiJX17mpC0B5yocNHKTP4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mRLRWAGe;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0F3606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B0F3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mRLRWAGe
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e0d1da913so495524f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793172647; x=1793777447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BxvbLiLB44gG/WoazELJQFuN0Xy0A4FvSD5C1wEHAm0=;
        b=mRLRWAGeA7H3IjzneNLFO9sbSmrbIQlbKaZtyErWv88mhO9sN6uLpVULpwazRH+dzS
         Jyk9hRegs7Yg8WYupnu5k67TNdXbdnITqZKk4ntICHBWqMuYji9MyBMANJU5KEg/ohb1
         eiMjy0uF/zXdM41aGKmg/dCn8uDLKBT91hHuy59LG7SD/Eir1YivjuMA57XBZ64iDKLJ
         OINJmKrzc1KzPb5S0BA5caIOC1oQOJ9LVDQNESXHUkVfkqwnhXy+/oejsbs9TDeWOyMG
         EBLtcymiTiUE14f1U0/pUWX05hk3ny4VkJDb91cyeU4D0nNJK3U94VmYU3adVmua7y1g
         BudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793172647; x=1793777447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BxvbLiLB44gG/WoazELJQFuN0Xy0A4FvSD5C1wEHAm0=;
        b=XOMRoOQTOojMKoxdgplQYouyrYwBbEUcfGk34LC4sqliJxMkDDSm1u4WuyW4QqHxbR
         VEeeTGAVzbn/DyhjME+UcutIhR0kACSu+gZeBFt8xUI+/ssKUmdMqT5hHUKWOHEPdhY8
         c9S0ianIsmHWnLWda/ZaCoDGd0F9GkZvKrMfxKjLQPGS2S+W+35TsDgBIgv1r4Uy/j4R
         RZt/CFcSMhX1V7qFX+8LLLKf0++xXzn+JoUbdrHTCY+XIWZ6PMim+Y81HqH+OcsekJ3D
         pUAu+3MxTT/h+tN9kb+Q2/M0Xi5wOtS9tGqSem+2VXUVq9JoYl+IkmTJETxwxQ8A9TvR
         la+Q==
X-Forwarded-Encrypted: i=1; AKwUvBy6Vvc3uejrn25h5rawJrSToOkvF+cXEt7wj8SM0VbK47FHrwbHvX8gKcLe9JSLS361S49qQ4nmdSWJzY8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGwmwVtCSEQf0c4xr8a+SmFK5F6vBBTbw+oOTuabdj6ppgH+zV
	KuITtBJL5hSTRkr+vZjED27HtSJzC3jb0hxIAw0uYyx6k/Os1gMAVOys
X-Gm-Gg: AYBFou1NMtrML0wIVimsYqHc/kA4rx1jiNz55XNGovBYRgB1VZGuTIe8Pwo7ec9Fldc
	IMhPJIN26OsUMxSYfBfCaE0QOUHbohsFrgmbYXnhdMqtVbuL2mew1SuAtWJ4uKyNxNNj5AGl/K+
	bEFNJh3nXp7Etq/0pyffQ0ilXLRhxZjN7jCtKhhkBNlk+Rxjkt4cJJ25LpOOM507jAjVFwAHDOU
	eu0iwisGNWN32eQFzL1XHFhiLsj3ZXv3VXePoYB9d8O0CH+YU4h+/zEerPsnRB4SKnX2E+wm7O0
	1EATd8U1Rt6gwhyr4bgQ8rx68E74PaUMucUJxied6UO1R0lcVH3qLn51vJ5M4cSnz63Hb24tmeg
	ni8pO0YvDcN6nDG/7uinVPryO/WtmU/DCkIYqU21+hKHzkcCv3qvjyDGjllZpqr/GUvrljbfEX+
	HKwoNVQcKnKbnEoAkduP+oUr49lMrHB1xrjflwZkXeBZeBt0ZxDMTNXC1AIYDywFWlADLrk3fZe
	uxe/VIN4Fc20FP+f01brSAWrBbwd3F2UPYrBwwr7hFJIlheP/T85kMVHmiR5u5kSUbJuJcQVANd
	6tihCG7HeasNm6AnKxG045ViD3F/djQ03M0+4vcpnwQr5lbF6PXaeb2y2MRaIM5Hr103meQRpun
	YmpkdtPtLGBCbNZ+OMndZ1soyoq60zY16TA==
X-Received: by 2002:a05:6000:50a:b0:48d:ed95:3823 with SMTP id ffacd0b85a97d-48e60209cfcmr1021843f8f.11.1793172646645;
        Wed, 28 Oct 2026 00:30:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e542ed998sm12083088f8f.13.2026.10.28.00.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:30:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/4] net: phy: as21xxx: simple series for trivial fixes
Date: Wed, 28 Oct 2026 08:30:18 +0100
Message-ID: <20261028073024.25175-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This is a simple series to account some fixes for some corner
case for as21xxx

Changes v3:
- Rework to address some comments from sashiko

Changes v2:
- Add review tag

Christian Marangi (4):
  net: phy: as21xxx: handle stale link status during autoneg
  net: phy: as21xxx: fix read_status speed handling
  net: phy: as21xxx: force C45 OPs for AUTONEG
  net: phy: as21xxx: handle odd firmware on loading

 drivers/net/phy/as21xxx.c | 180 ++++++++++++++++++++++++++++----------
 1 file changed, 136 insertions(+), 44 deletions(-)

-- 
2.55.0

