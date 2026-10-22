Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660652;
	b=JIFTdKlzmIh1sCJl852pSaIQqdp3tW3Ga6T9+ygOQ20MXJaPnUPLb2S29kgDRzpaZ+U0
	 wPOgOLn54SPnjTy2vVrPE0Ay/XyCa+7MVLw0pVjE/ATpbkJfPZ15ddhYfWCSc9iT89VNb
	 pEg/Cr2gZptfbC/VtQznMt8TDjcPuMmUFpQDzrMICRYCAcCLBcLKBWbqXj272B4vpuG80
	 cvDP6jI6lTxUQ77y8UqebjizSV7Mb10vXT9d2XFCGhaCh4Oh/sQXa75MEQu1Gi211qgrs
	 krOMRtjaybR/9TeKhLlQ1dsr0QkuMkz5Yuz+ZvM8j7kwa3g2Yaj4wNlNYCI8kVEx59g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YrU9NXkLhPc11UNj4ze98iYIGfoVOje0QPpEBEMUH0Q=;
	b=l98jMnQI0LB3LzO8TSmws6bUshQ7riWtZig90jeg1jHbh/c/dyF6jQVOAlZUyPycbga9
	 XmbUgE27l69TzAjJtfLkcfjCHZUZnj9cuDKBq4FooSojMd3fA53WcMvtenzTJ2UZlP9gZ
	 MltNWIvB1Et3leFg3s7z1+ecJAafNJSTy3d+ilFpdmhV5e62mVstsONzv1XfQyz8r/OyW
	 vbufjiNs05nCV9la44H1ciVy0cM+/8xcvWTNa+d/ShfIgMI7LUQBmr1colufTxZzQkh5M
	 srJD/2UhrNU0Z751O5uAbtITU8L8zz+J0rHqJQkeczcimr9YFY7FmbTMqOVbBpWSwkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YoqQ2qEo;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2A2606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C2A2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YoqQ2qEo
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-354ba08cfd1so2803654eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660651; x=1793265451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YrU9NXkLhPc11UNj4ze98iYIGfoVOje0QPpEBEMUH0Q=;
        b=YoqQ2qEoUEfKXEqbta2HMACEfMy+lta0Cv6sAawZGIhlTO61tZUOyOPCCiiMxW7Cdg
         Ew9z2G5Ob7q5DTIGNmZcPFSgoWmBbGiihn91T/Oe1rKc51mtUQFvsM7c8uEgOZKGSfw+
         0VR8xm2hETmRmDJyP6b83Im8rpVOhKB7RxnbKvg3YWAjWzZrk44jbnUk5Rf2CW2PmTy0
         ChHcvJlJXNp21zKMK29jVvbCO6IHpx9+8QlNcCkOwzRRfs/Ppb57C+QMM649U2AqgMt/
         lsg+C0ZdnybAUSjrB9QIdOt/5GNWZKvQE2Mh6ndUGnCOyNaQjOX9oZTR+pt4Hoh8b4Dw
         MtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660651; x=1793265451;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YrU9NXkLhPc11UNj4ze98iYIGfoVOje0QPpEBEMUH0Q=;
        b=BOlf8jd9DpH5XEIspOHU6LR6KXZ7lTSo6BDfX3RZmX6d077D5OFB5Vj2cMxX2zmowW
         SFUAbUCOFoKfFDq38YHo2speStwzrHapZ1ujOdNYscaPf4LJaSiZtcXzN57LA+gTyeYD
         BC3o2269ms9qpPILtYKJD8CY+oxtVDr7qZ7euGUMfkpku5puLkMAgmX4w1jo3gTiHP/v
         Yc2f910SQROPpAwegaOnUqkijRt9Dy3HXBqO5sHBYjpaPW9ulIYZvwANB1RKt9AWsEz4
         NYhldVeAHB+0JHZ9NQEEiJw4MspZ1NONSEIwNWrv1tRVZXWdSFMNkPWMCszOXbrR94lz
         6pjg==
X-Forwarded-Encrypted: i=1; AKwUvBwAxBg9w+eKASFK4UlFGlxXz69YkbS/lwhqzElMr7NtQA2USzrwAUzVLyPfEZe9lq1XZO8Z2dVzmhX4nCQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhmnqA+hIezAz+zjf3RYbCGZvau0/+GujqHiSr9hbpd8iZ2yi/
	gUZtdlO6oGjXRo/FQHsxQeKrs3v5ddYonw3OqRXxZeloJcUki3G0jbk/
X-Gm-Gg: AYBFou18I/zxUkuuiqACBcl9OtS8m/I+YuFJAphvbAFe2jVq39Nzro5Eg+39T+C9Kl8
	bm5JWyKdsMhyTkTgErMPuhM2XmZ4QGY5toQVE91+nXUS/B5rV/RHwXW//nvDzRXp28TgeiG9yyS
	Iuk5Xccb+zHtMV1UT/HD72lysXG7lD+MRcewzud8d60sL2uVbvQSBlCTviDJ54hgTMuAt1v5zTL
	cOZQjGXahvdHkOWVg2dclJZA7kGQvCXgm32S7pOkZX5a2aFjBNsAn7JUDBoGPA66x4yWGOlzz59
	q3qcaY/iPiJXDsy0s2X4q/ipzPFMJsKfWlbqObo5MNKcXX7WS+RJPTTkw/Sb3bCKMKg0i469BzO
	5rP3CIP/VUcFMh+W7Mk1rdDwIRn51is9sWu6rgVLghTrFbKGiWl2DRHsQhhFalbqCLR6Z60xWsa
	fNVFtRNh1EhEyrs6oEDnW/OF95LVDWIf9uFutD8GQepqKtDa8gZCPAM3a5J4IArbJIrLN/aseU6
	Dkp8cqrqn+eRep8wz86+Nkt4OT/Qd7R3pllo9L1dVDMaE8/z9oDeKngM9b2hvjyTcxvRsEpCVUp
	oif87qmS4Uado4qo07E=
X-Received: by 2002:a05:7023:a82:b0:149:1b5b:1f25 with SMTP id a92af1059eb24-190a4c1fa39mr5950603c88.15.1792660651419;
        Thu, 22 Oct 2026 02:17:31 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e4f2eacsm12227509c88.23.2026.10.22.02.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:17:30 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net: ipvlan: down-slave deletion leaks parent allmulti state
Date: Thu, 22 Oct 2026 02:17:25 -0700
Message-Id: <20261022091725.3652834-1-teel4res@gmail.com>
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

ipvlan_change_rx_flags() increments the parent netdevice's allmulti
reference for an ipvlan slave with IFF_ALLMULTI.  Unlike macvlan,
ipvlan_stop() does not release that reference and ipvlan_open() does not
reacquire it as an ownership pair.

If the slave is brought down while IFF_ALLMULTI remains set and is then
deleted, netif_close_many() skips the already-down device, so
ipvlan_stop() is never run.  ipvlan_uninit(), __ipvlan_link_delete() and
ipvlan_port_destroy() also contain no decrement.  The parent therefore
stays in all-multicast mode after every such cycle.

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1.  Three
create/allmulti-on/down/delete cycles changed the parent's
IFLA_ALLMULTI count from 0 to 1, 2, and 3.  A later live-slave
allmulti-on/off test changed it 3 -> 4 -> 3, showing that only an
explicit off transition releases one reference.  The leaked reference
survived deletion.

The 2019 review of ipvlan multicast propagation already noted that a
dev_set_allmulti(1/-1) open/stop pair was missing.  Current source still
has the asymmetry.

A fix should pair acquisition/release in open/stop, as macvlan does, or
provide one release path that runs for deletion in both up and down
states.

Candidate BR-014 is the broader deletion-path description of the same
root cause.

The self-checking reproducer and serial log are available on request.

This was found with a multi-agent workflow; the
refcount growth was reproduced in QEMU.

Thanks,
Cheng Yongkang
