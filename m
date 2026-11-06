Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965586;
	b=rVrTg9+ZmazFd8Vzm5ZoM3AzcN1MY0+o1PHP3mem/OGXhG6M/UTgOKRgKg3uKePoBJKl
	 NiFy2swsGEX690cNgvmFwEfcl1g46dARHvBiN9gWDW8Cf+RWW5uxn7qxbXXROX3I4Tq2G
	 8NXSR1k5NF37QUAF68gw65eNYf3JG1UJqvNsMs5DrEwN3fZj3zBH6A7Mis8Lr/XF/6TxZ
	 aqNhFwFvXt+N6DTJlRtv7ZV5ZldbKcGoNGF7EiPGSHfzmdfK6E4ucXjvlW3yD2ncOkmJ4
	 PnN9On38WE3ZsD1nU2vyvE6UcPBeBB+pRr7pL6i56zUhOtyYHW39WR+JCKGFTjYPPrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YLGfYC71OScNX4P7b0Ywj1iP8vp//hNbWZvlIRGfX1E=;
	b=3OB7bTnaBv4SqD9+dvfNT/lavyFUxM7Nl0RmLEzXDYq5XTZp6ecCHIojpqaymEfFqM2r
	 oCwVTEcNGD1BuMkTFcvOIxLKw3RajfkjEfw9c0Zn+vpY2f6ULanE5sHN8/OC4+Kxrw8RN
	 sDn2e9L4YXysNW3Pp/JHYu4eXlxoYOmmidyXijN3pxjkkn8dYfAa3jWe5z86Q3a9uPoQI
	 kb2jL+do+b+2rwYSfbnl9AH3ayEyK9x/KMWsy+N5KAqUUMcNwx0zgTfedkXJPyj9MpSgM
	 Rmh71fZr/OMWerv3pE8omoOQiQmVkpE6pGwsfIkQxyrgz9ACxyJ/eVkA1Iy8uQd6NOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mKG/AQ/S";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2F6606A937
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB2F6606A937
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mKG/AQ/S
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36e795af1d4so483443eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793965585; x=1794570385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YLGfYC71OScNX4P7b0Ywj1iP8vp//hNbWZvlIRGfX1E=;
        b=mKG/AQ/SA4Y2X8gh0hGyM4oubFdXoBqxMnh8G6XQzKaP0lPmU4nsMkWYHLmJ7XTPkl
         AX+JFGVxQ0NaRb95p9vzR3WUlvDZwSQzZgppzMG/kekQCPd+H17mg7rvpOXLLRodpzy3
         n0QkzjwOhxjvebmwM67xU7qvGWJ0YuYjgfYdDVBsthfsAxfXbN7Rx96QSCjNv5Px5aZQ
         eTIP4ej33VY0gmC2lD9Wk/E+CYxOjLrj3U7WXf96lZlHh2WQopOxMnRo+WRzZWYeBtpt
         2rc0uV+y0aKF3Gwk2G3Mb48I3UfLeG5bVn4Ijw2ASqMgm4Zvd28ccxxkWGET6rY5iMWl
         znCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793965585; x=1794570385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YLGfYC71OScNX4P7b0Ywj1iP8vp//hNbWZvlIRGfX1E=;
        b=MA0t1l/5LU/s9q0iGEmjJBwY2UTxE1FyDIUDmmMlqBsvs/v1c4mOmGqHGpunaxCWPz
         sVemqDty5Kv3GZmoqf6VrjbVYAwMOpBO3Gthhfxw6KM6BpSEuZJK87ej/uwLHG76+Szy
         h/bbORypenLOk3w1Njr40P1Qe4glEYYqEFGcEbPIvy7R612012qmP4dAtkgXtb9urVrN
         0mfPX1y4HKunEALIi2qq5WmqzxRMIqUrWbO9aU5iRLm3zDDnN5ByN85ACMRn8NwAwlPh
         hKn6jAo4dcmrYkY8y9QNI2wvjf5rxn1sQdweJ2No/N6e8tjmGj1SYutrmrYF0dZEf0nY
         lx/A==
X-Forwarded-Encrypted: i=1; AL+hErFyOpfNKgW9tdOmBZi1/um4pkvLjigQazD1nFPe6oikmD/zF3IWwHP8q4RC1opIpZ8jvzmtKfSfIyKwxLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T00lm1acy/i91917G+rpOcg02EAE6NhBzNq9T0Eg/26YIf/hW
	J/brVE9SQl2rTWy1ORvY1nV/QWpSSjGUTesfW+b9uUSjHyv/xFrCr4mM
X-Gm-Gg: AYBFou1kubTqhdx9Xe5sDUxdJtgXm/eCcZCTPkfsn+8TpmZoYf1r3YsBQmp6NjViCDv
	Rdcclt/xiy+z/JX86WzPArr1VqlcMFdH21cKoE/CgzDFAHfm273jRizcoHzwR2vaRpviKYWMmbC
	1EoydEftEarLY3QtUCyW9nu3FBSBueLTUvaxznOdXhNUAOk5R8XVOdrdoiX05IQa946M4Q4ywFn
	PDKH7DijLxSpbZuJAsONS5++vqX46g1z7UnmToOKezct1of39Wj9bTkYaJnxTG2P0zP4NuyGU7+
	xLOhJQ2rVC+gbhfmEvsTArm86oEvdWQvS5DcUJqh81fPUJq9q77HmGfvhiSdT0WfZCI7fVViyzM
	X6F4XNgqcZmhd4NO8YgsqGHPXmsOEkUujSVPm9/QcQRr9k+AY2lV93WamBaEixDmMNi39ojLXdR
	cywKyJlCAi8uAv9JmqZ/vReLNv2FH4hHf9s8iNWWb8C8dFe9XHunX2kzmlE7K2iyzZ9Im4BgYEO
	S+4gJIB771oR1oSbyRaSd7AaPoZaKU1U8ETIlcSIOR2O+k50Y8cov/fVSOLtm4jOvH749r1JDwL
	Llrr+3QrqaNPwtvV2brdNZamKqGCgYXlnfVkVlhU9XfZ
X-Received: by 2002:a05:7301:190c:b0:361:a195:c46e with SMTP id 5a478bee46e88-36de39af458mr6879740eec.1.1793965584700;
        Fri, 06 Nov 2026 03:46:24 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:51:1d31:c2b6:f9ff:fe77:10a0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9be7077sm6167055eec.17.2026.11.06.03.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:46:24 -0800 (PST)
From: Amaan Cheval <amaan.cheval@gmail.com>
To: netdev@vger.kernel.org
Cc: joshwash@google.com,
	hramamurthy@google.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	bcf@google.com,
	jordanrhee@google.com,
	przemyslaw.kitszel@intel.com,
	maciej.fijalkowski@intel.com,
	pkaligineedi@google.com,
	maolson@google.com,
	csully@google.com,
	willemb@google.com,
	yangchun@google.com,
	npl@google.com,
	awogbemila@google.com,
	shailend@google.com,
	nktgrg@google.com,
	maxyuan@google.com,
	bpf@vger.kernel.org,
	john.fastabend@gmail.com,
	hawk@kernel.org,
	sdf@fomichev.me,
	daniel@iogearbox.net,
	ast@kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Amaan Cheval <amaan.cheval@gmail.com>
Subject: [PATCH net v4 0/2] gve: fix RX page refcount overflow with the pagecnt bias
Date: Fri,  6 Nov 2026 17:15:49 +0530
Message-ID: <20261106114551.212675-1-amaan.cheval@gmail.com>
X-Mailer: git-send-email 2.49.0
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

gve's GQI and DQO-QPL RX paths bias every RX page's refcount to INT_MAX,
so a single get_page() from the stack, e.g. splice() of received data,
overflows it: splice/tee fail with EIO/EFAULT and GQI can reset the
NIC. Patch 2 lowers the bias to USHRT_MAX, as other drivers do.

With the smaller bias the driver gives up its last reference on a page
once every USHRT_MAX handoffs instead of once every INT_MAX, which is
only safe while every consumer holds its reference until the buffer is
recycled. That is not the case for an XDP_REDIRECT from DQO-QPL to an
AF_XDP socket in copy mode, a path the driver never meant to support:
commit d8a8ca14c937 dropped the queue_format check that used to refuse
it. Patch 1 restores that check for DQO-QPL, so patch 2 depends on it.
Trees before 6.17 still have the old check, so there patch 2 stands
alone.

Harshitha mentioned on v2 that Google would send a patch blocking XDP
on DQO-QPL; if one is already in flight I'm happy to drop patch 1 in
its favour.

v4:
 - Add patch 1/2 blocking XDP on DQO-QPL (Sashiko).
 - Say "overflow" instead of "headroom"; use USHRT_MAX directly instead
   of a macro (Maciej).
 - Say which trees need patch 1, for stable.
v3: https://lore.kernel.org/netdev/20261103090651.35399-1-amaan.cheval@gmail.com/
v2: https://lore.kernel.org/netdev/20261102112613.18334-1-amaan.cheval@gmail.com/
v1: https://lore.kernel.org/netdev/20261031173449.2439047-1-amaan.cheval@gmail.com/


Amaan Cheval (2):
  gve: block XDP on the DQO-QPL queue format
  gve: fix RX page refcount overflow from the pagecnt bias

 drivers/net/ethernet/google/gve/gve.h                |  2 +-
 .../net/ethernet/google/gve/gve_buffer_mgmt_dqo.c    |  4 ++--
 drivers/net/ethernet/google/gve/gve_main.c           |  6 ++++++
 drivers/net/ethernet/google/gve/gve_rx.c             |  8 ++++----
 drivers/net/ethernet/google/gve/gve_utils.c          | 12 ++++--------
 drivers/net/ethernet/google/gve/gve_utils.h          |  2 +-
 6 files changed, 18 insertions(+), 16 deletions(-)


base-commit: 21f57ec673a1917547c808cfa81890485fffa03b
-- 
2.47.3

