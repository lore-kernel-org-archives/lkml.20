Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282628;
	b=EMwDC8lFBsRnAUSCNDU10vykOyYOBIeZAwPPOi/Z2G6mKYgNTXfWZW9lyJ4ucRXI9dam
	 UleiBREcvb0mgXwHYmjV0YDK6huVMWfo0eqE8xpxduvR/bNkeoqC6Yj7ptKqXxhsn9439
	 oGpUKwdLKmqZnKO0f3lmtUKyZ77fpi1to6/WnBflHXoA4m86jRI8reLeGLGPy9jJLSM/N
	 jcARFGQlwPMWqkR3o/Y/Orzx58WXQ5eeBfR/kKk9fwbXz/fN6FNhXx8w2oma8UEmY0044
	 2IkM5xLgeCANiGi69uSsYZcf7ubWZjeKSdWyhe95Hdr+eBfcaHUSDZ5EhmslkJRRzMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282628;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=EHdvQZ18BcX/XBcDaD6cKWB/M8/vhPYw3yGXazOgxS8=;
	b=N7nmXNWd2CzvPRxtaSzbFt/fYShPJ8OF0Qnja5fw1TY2Ay4HKEOniKEPJIxS15JtN2VT
	 Us9QPoKd+iWupQJRExGrt1M9mepdHZe5gpjGHWc8NjdFVspNqeC0tXy0H/GjrO61KSYhR
	 k/mJB7mRzam4SzcacmyMkMonORZo4qUUHB9F1QhouudKV2aKDR7kdpdo0MMDKXGT1mKQf
	 gY16bch46mMftBj6As1NISUMXteUk5F/G2Z05/wxwxKFFKUluRSDnd9mhvUDLKISXwnGa
	 qXeJvDH+4dm08dQSaTBdisHs5Wc6DyxaULEVDEsQ3Fe2N0jkrtsH5FDWQfECt6/QnPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mm2y8T+R;
	arc=none smtp.remote-ip=209.85.222.226
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBF6606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DBF6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mm2y8T+R
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-93f259cdc86so142072385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:50:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282627; x=1794887427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EHdvQZ18BcX/XBcDaD6cKWB/M8/vhPYw3yGXazOgxS8=;
        b=kb/Z4W0Be11P/nfPt5nPJv+s5inqXLQM9BacI6WofwBzbQxJevZjy5ZUaBzymbPPXN
         hmQhipUoyWjCKgm0fFajjOGuxp/zDaM9rb+47x4VVujyDoVOBTivmeIOrkFniuMDS5UL
         CXc7NTn/bMt8n1HAdPYkMXoUiKdQuvzhPNW6bOAgbeWDs4qhMo/LwtOHhR3hSmc12Qoq
         U1gwoBS6Idzv1mxJa+wH39ZbmVqx5gva/g8pOp/nP4fwG2FDBy1r5EdZ1EkyNZ5aXocN
         sgaptyUlrZmRZim/ifNtakO+uDEglm4KEwLdDWliM1JMxP/K4GVta2mjiqTauPw6nwIt
         EQRA==
X-Forwarded-Encrypted: i=1; AL+hErFI6WHd7Q2hxjuDJeMau586qi8THcdm0IWCbm7zxh4JvaIGmeiryW4UZB6/0rWWP4E7gotNvjfoXzA3dUM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9onclkXWmalWAtu14JOIKGYlJ8XVGH6arQ6z2GCVCtMKNmLZeM
	/k3D9zok56swZdl/XEQfLnrulk5YIMZ6O7FzR3jmR8KMt1fO0zJ/+qzjTDWnfbvGVh+s5t59QBU
	QcOZUrUHt0bWROlTEW9+X9c2eumZ3T/a27d/cLOINQm7YOEk190HKH1nI32CDIF1TV7e1yJu8nf
	hmuKy1OzvRsEYLlsHMHAjYBMo3vB+PbkwZ1eM5/l7twSuyNZrAunpjfxAe09wkyybo22N7d8Ii6
	5RwBNDEwbbJtWbxsnYySS9A
X-Gm-Gg: AYBFou13tfaY4dEJf86sTBVB0NyCmsJ7dXMLBfCMXh4j6838W3rs/P87VNHPC5zabxO
	8mMA0gE/9e2hF6QW9S1IkKTOjwV7KIRVOB34hmly1bZwFLJPkhfX8ylGs0u1ywsT0VkSYquO7EN
	BTFchH7l4kZQHdzsnmOFsh25zdpk5eGvxBzCUdQt3jP0dCyoPbS46fFfTkDW4HHFgprFALGxpG/
	dfsGrTePCyM/JuO2R1NdmXbr6eLikUzoYDUWeiZm0XSyrz+fxQOrQhSMtRChoM/ixOz0NVatohz
	4imUguysxl70bo/FY/x7RurkzZFV3imscJwEjcjSxBIPQyI+9SP/1onEW2mP0SqDXekOPmMM9oR
	z/yhC7NqmISVLhaEUc+4Bh1C5loU1yd0cO4UFOZCcQhPt2Bj0tBPXrBfPJ8G9G6GQTNEYug/dLY
	aFUJ7ZitYUdCfJVI4hPRUsV7DZC3GYp8bg3UvwLW+2
X-Received: by 2002:a05:620a:4403:b0:93c:5f3c:f485 with SMTP id af79cd13be357-9479f3236d5mr250104185a.53.1794282627418;
        Mon, 09 Nov 2026 19:50:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9479e86d078sm17631385a.0.2026.11.09.19.50.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 19:50:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53661e036a2so33979521cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794282626; x=1794887426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EHdvQZ18BcX/XBcDaD6cKWB/M8/vhPYw3yGXazOgxS8=;
        b=Mm2y8T+RanHzClp4si5idFDdJIiflrORUrVFzdAGIIhEywFD5jAP+m6A79rCyNv4ma
         ryNWxD7oC/vfcub/wrm6k73OF84iM6BmHc5/erWhbv2KyHmBLAwkP+rINyN+v7xCE4Lj
         On/IVAqdJ0GkjYV0NhsnWeGzF6QhCUq9NG+Tc=
X-Forwarded-Encrypted: i=1; AL+hErFxH8z+f9xZfcByYJYQb0EIKHv4Itf0tzwV7AAJz6hh6Ti1FJEd44MG4u0CfRG3sEM+eftDpdMOt6ojBYI=@vger.kernel.org
X-Received: by 2002:a05:622a:2587:b0:533:4da1:b5d1 with SMTP id d75a77b69052e-555292bc4f5mr22485641cf.23.1794282625834;
        Mon, 09 Nov 2026 19:50:25 -0800 (PST)
X-Received: by 2002:a05:622a:2587:b0:533:4da1:b5d1 with SMTP id d75a77b69052e-555292bc4f5mr22485461cf.23.1794282625414;
        Mon, 09 Nov 2026 19:50:25 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af612dfsm13740951cf.8.2026.11.09.19.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:50:24 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v4 0/8] net: dsa: b53: Preliminary fixes
Date: Mon,  9 Nov 2026 19:50:10 -0800
Message-ID: <20261110035018.2169370-1-florian.fainelli@broadcom.com>
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
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series contains fixes to issues reported by Sashiko on the
b53 PCS bug fixes being submitted, and then some more that came from
code review and testing.

Except for issue #2, all of the other issues did trigger in testing and
needed to be corrected.

Changes in v4:

- Return success when deleting an ARL entry that does not exist per
  Sashiko's review
- Restrict the 2 Gbps override bit to BCM5301x and BCM58xx
- Restore mirror configuration on resume, moving mirror initialization into the reference-counting patch
- Propagate SF2 setup errors on resume and disable the clock on failure when WoL is inactive
- Add a patch fixing BCM5325/BCM5365 mirror port encoding, including CPU port bitmap translation

Changes in v3:

- patch 2: added Daniel's R-b tag
- patch 3: mention in the commit message that deleting an absent entry
  now returns -ENOENT, including when the lookup runs out of space
- patch 4: document that the patch also fixes the clear of the capture
  port field in b53_mirror_del()
- patch 6: reference count the mirror source bits per port and
  direction, ignoring deletions without a matching reference
- patch 7: new, harden mirror register programming:
  - reset the mirror capture and source control registers at setup for
    b53 and bcm_sf2, since not all switches are reset
  - check and propagate all mirror register read/write errors, only
    taking a source reference once hardware programming succeeded
  - use the source masks rather than MIRROR_EN to decide whether the
    destination is occupied, and write the destination before the source
- log failures in b53_mirror_del() since it cannot return an error
- patch 8: new, fix the mirror capture port encoding on BCM5325 and
  BCM5365, which use an 11-bit bitmap (CPU port at bit 8) instead of a
  port ID, and translate the CPU port in the ingress/egress source
  masks as well (verified against the BCM5325E, BCM5325M and BCM5365P
  datasheets)

Changes in v2:

- collected Jonas' R-b tags
- corrected logic in patch #3 to propagate -ENOENT, memset after the
  debug print, translate -ENOSPC to -ENOENT when deleting

Florian Fainelli (8):
  net: dsa: b53: initialize the jumbo frame size register offset
  net: dsa: b53: fix the SRAB grant timeout check
  net: dsa: b53: clear stale state when creating an ARL entry
  net: dsa: b53: reject conflicting mirror destinations
  net: dsa: b53: use the correct override register 2 Gbps bit
  net: dsa: b53: reference count shared mirror source bits
  net: dsa: b53: harden mirror register programming
  net: dsa: b53: fix mirror port encoding on BCM5325 and BCM5365

 drivers/net/dsa/b53/b53_common.c | 209 +++++++++++++++++++++++++------
 drivers/net/dsa/b53/b53_priv.h   |   4 +
 drivers/net/dsa/b53/b53_regs.h   |   1 +
 drivers/net/dsa/b53/b53_srab.c   |   2 +-
 drivers/net/dsa/bcm_sf2.c        |  10 +-
 5 files changed, 183 insertions(+), 43 deletions(-)

-- 
2.53.0

