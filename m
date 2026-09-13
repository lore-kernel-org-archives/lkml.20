Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B363389DE8
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789290518; cv=none; b=XR7NyQaThxKNHzW1QgbIB9pR5ztT/1yoLFzGPfrXXwj37GzVwGQWL+R/8iQKSzq5PuwEC1ufDPCks4BdI648Vw8bNKMqcNygp/jBoVe25nqTggbIxfSLqCKRaT1rySVLDaOUecuaiofLjCx6hlBgSDOpVaWm2aTIkGD6DHFUaQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789290518; c=relaxed/simple;
	bh=TDvcrBX58plavsGuirvSl5Kas6jxwauWWLGcv5Y+8k0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=deHFHSoJVvbKl0i/k/KR1bmwbProQXOOCwA84xYjMA4JmuvWlcin9FpY/yk1nU593Dvy3tcRXpfo1Yn1I8LtOv0AMbY+JIhilf08lmvqmTmu+II26JHbMH8c24Bkv2UvGFRZqGgLVhpLDC43GAnUFL3cVEXIGGajKqztYL1U8r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjCCBV7P; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjCCBV7P"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4843e397f74so1348151f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 02:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789290516; x=1789895316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4caHLEBEOxtFSlC57AtIBBtI8i1ci+K6n0fqXOkiksY=;
        b=RjCCBV7P4yVjo4sTj3v6vBgCGLGw4j8+ZuduFfqR8C/HMplExnNzYKr9uLwJojZZTk
         eIkF7N3jIOwUob4hNmOk587sC21EPZ7R6Pxf0ZWsO9DAT1JdOEtxu2fpiSDhKK7u0Y39
         IAqI8kycxzPAqm7x6Bz5zLEwlLX8IB7TufRHhUWX/N4Qb3KbdGSpTuidJyuVhrIWBQP3
         ULNr5pZCqoMkiW1y03fWFa4LZvn9JlFoTxz0V1itqfOMBOSa+dtyLsH65Cld/Xt7J4Ba
         EB6FYlzTirZRof9YRYjaHfnZMEKqZmQJDYxjHr12vJDPT5y0xIPs9T6sjIvK/nKKeWsy
         z4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789290516; x=1789895316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4caHLEBEOxtFSlC57AtIBBtI8i1ci+K6n0fqXOkiksY=;
        b=U2DEQ5YQV84LWGkiyHWcu6meUG3ChgxgooxigyIgC4ZjSRhoNefJ68ayBhc1QA5BtJ
         DfRA/D4NHJB5bjF6HcQw5Ii5ZFoi03IX64gW2pU0Q36s2927xaYke8GseYEZ3uvmGmzJ
         pJ3rXdLDFjFSRC8sg7CdlK3fFbnrQXVRdz7E3BbE4BpAzrKrRWgIzcANoFswCw1N1tGG
         Tb8LgeogRqrigfNx+Qpdw/Nv39qBM4UBDivRkqBunn0ltxZ+c/kLrRQPoihkdmgGbgJO
         akmPDElJItw1ciattWMwkoSyiqzlCghudobPIiYd+Hx8DudBGBF5yKlV1f5ugmqg0vBV
         SXPQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0+5C7TjkRT6RxnAxivhmCuGu+XC3KQrgNFc3elIU2p+NCpBinskcuu4tgZjm3B8GO+qri+MMC5g6tyXY=@vger.kernel.org
X-Gm-Message-State: AFuF++lgGWZ/YHzcgrNVNhlTHRHzG6EIjqm4oZ0lybfdDUTqwr2OtYDY
	2J2+TZQFpsWBakHsRuA9XJ9rcr3XYn3aGgZgYuoKoTYO5FltxIIyyylJ
X-Gm-Gg: AYBFou1XOhoX9WWnmZ0/7SgBIPpXAdq+N8ogMXwBYegzvslmU7A9BKubgoBy8Hm5XLN
	nsCTcbIX6WyvACi+HPCEszYDG2jO/YB6wp9C5umBn0CfPpsVwN8jv7J1V/HpIbCzDTO9B3YPhjD
	1o4uDSZkbXEgj3HOs5gqhEEXJEjN9+BYArRTQRTKJ+8OpPPGbqw2DazzO2eGkl50tbeE3WcTkgm
	OiiJGrWbeySHLpRZKFoQv1xjhMkbotpkACKFGswh7vp7/2TM3xAHgDW627AT4O+9KGm6vrgfAC5
	TiOGxOoZmQlZ3ggDLIQGWEv3t5SzLfqzd2d0rlqXgx/cHPY+jMg/k3HYlyumJ0N81FGy1rqGtJB
	VC5DluVo6N5fzx0fRARuoaYl3+uDxKoryy9OfGSgMnfpEbrJCO9xo5zTnzuxQ4dBXHqBs345sCN
	X7usJdziZX5Nrg97TuAxDjqWXGC7FTyFk5qBkHgv7WyIJXj8a437CnESb1bINjYw==
X-Received: by 2002:a05:6000:18ab:b0:486:f1b2:cf44 with SMTP id ffacd0b85a97d-486fc955e0cmr1787905f8f.3.1789290515586;
        Sun, 13 Sep 2026 02:08:35 -0700 (PDT)
Received: from cachyos ([2a02:8070:6286:900::a57c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb350686sm19704385f8f.27.2026.09.13.02.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 02:08:35 -0700 (PDT)
From: Cristian Fleischer <cristian.fleischer@gmail.com>
To: Junjie Cao <junjie.cao@intel.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Huy Nguyen Dinh Quang <huynguyendinhquang@gmail.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless] wifi: mt76: mt792x: treat 0xff ACPI SAR entries as no limit
Date: Sun, 13 Sep 2026 11:06:27 +0200
Message-ID: <20260913090744.316095-1-cristian.fleischer@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <acb947435fc78d5c06039c7bd5609c735468b0ee.1789002236.git.junjie.cao@intel.com>
References: <acb947435fc78d5c06039c7bd5609c735468b0ee.1789002236.git.junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 10 Sep 2026 09:23:00 +0800, Junjie Cao wrote:
> Some ASUS firmware includes 0xff values in MTGS power slots.

Same failure on an ASUS Vivobook S 16 M5606WA (MT7922, mt7921e, BIOS
M5606WA.316), kernel 7.2.4 with this patch applied on top.

The DSDT carries MTCL version 2, MTDS with two identical tables
(1A 19 17 11 15 10 12 12 12 12 10) and MTGS version 4 with pwr 0xff in
every slot (offset 0x00 in entry 1, 0xff in entries 2-6). Region ETSI.

Before, txpower_sku showed tmac 3 for every OFDM/HT/VHT/HE rate on every
channel; the AP never answered auth frames from a few rooms away and TX
sat at 6 Mbit/s with ~3 retries per frame once associated.

After:
  5 GHz ch 36/80 MHz: tmac 29, TX/RX 866 Mbit/s VHT-MCS 9, 7 retries in
  776 frames, association succeeds from the spot that used to fail.
  2.4 GHz ch 11:      tmac 30, TX 117 / RX 104 Mbit/s.

Tested-by: Cristian Fleischer <cristian.fleischer@gmail.com>
