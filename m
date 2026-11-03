Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704907;
	b=AannBg8oW2ADdBaMOAK0pvIpZeO/VJpQ53NwURfMWcH6k0QGY29t7Y/Htgo9nvlBX69h
	 9gX+2GbAaZIDFLsxTkj0SUCR3kQm1KHpemWGYJtZDBQcbm9/nJJfibuj0CYkUIPxhJppq
	 Vjc065EfaTMjRvtmSesBcBnhQY9iowQslNvO5tf+DuHdqM4y3N4NmLOlokWY5XTcIaLqA
	 E0JZMok1cFS1skypsBoviNtKJn0kajPTvkeGLgYNnBj7k3wPJk1MKDHsbn7nqxRFdyofB
	 4DUyQPNRvoVlFYPrgxA/jkcDDUx2j9UaymPnfpt9jDJm+/bpJjCKWSfzPRkVLhnVzDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5EF7qO7Dc9Gi+mPmcNnWbZe4d5lwrsXDXOA1eeEl718=;
	b=gARw/k2m59sbCf3amU1sGjPj2HfpTC5FRCfv5u0i6apP9VpoVbJtJzfGJ0pZGL+Z8Wqk
	 N87F9rr+fWbEp0vOtqfgEu4xJM7qkdgPWMMxUhzdGU0/rPZ8QCftc0t7MUm/qu+ayB7wJ
	 3qNScP6mcKEuPbfNq5Vj4EunaRRUxo9t2F5Bp+5Vh/+3DNqU32jX/loBA1xLLkZB9/DFM
	 CV2pUhO45oNDIwAx0w5gUcrLPJQkf0xRtH7MPtV1fSJ3hdDs2CSIZDDOorMIvWf47iJI2
	 Rm4o6t5y0iI9Yku0CLn/dxfEf49+aRbNfmGBtZM15CX4cqw7bW22BkitFzJ7C6QSxrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=BtpJFGEU;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610BE606B12A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 610BE606B12A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=BtpJFGEU
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a215e64962so36692845e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793704905; x=1794309705; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5EF7qO7Dc9Gi+mPmcNnWbZe4d5lwrsXDXOA1eeEl718=;
        b=BtpJFGEUIfpmQFVgikXOyK8mpdxYTHLH/gETLZu8mAaLbc2hkHlDReg1Bb8ikP41cC
         zu0GbxPNSrpjUNowFKKYNtO+hxCwxRkBOWyfndBKSvL02UIHYx5KdHYIglteVoALumrY
         mRYjWF3gDM8n1bTMqdaVksYeXznIniRW7lVH94tFVwvDf/HJ7g1BbZdP3n7QBgsfq/Yy
         rAolir5At24XWFfZAnW4CNbyCpPhgH+f4okUBq4XgYg2l2N+J0/XQ1IKrEkd1IEqyp00
         IYLroDtzhVmD4CAlQ6OQR8QcVgT99HmgEGrqRjQNloppvZn+q/Nn6iFxthBs237S6JCz
         AQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704905; x=1794309705;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5EF7qO7Dc9Gi+mPmcNnWbZe4d5lwrsXDXOA1eeEl718=;
        b=QN/WcvaI6XV8Eui+1lh2sKZ19H1Kfka2JFMNUjWxWpbnWhxzYRWBPZGlqKonWq1e12
         8W/OQ9MGHEEIO+WOZ851pFJgnNm8FKIqNyGcyGLbJTu6vZwy890UMeXr9akeFqu8k6o6
         Y7Tc7EQ1oerWrJLs9ZIcJvNh8jP5Fu3PECsKkX224n80Ltwb87zJa2vyoBdnOdDPYMt2
         +KzJsz6wbeqDOjhCd+MMzaqoFwbqmGdIXG53jMx4ytLyT72jo6pDcWN3qtPozQj23WWw
         6ksxidXuklcocjQWOIJtP7wj7gnZxUCpUTO6m89Y0FW6mBNnm8Eg5D8SLBlLa4YBkZLN
         0Y6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzrse0IRqHG2aY/NOTN7GHVvAJL8Ty6KONNK1JNiYq9a9Jv6//hFPN7dDlvUjIXDGsAt4pN5KhAcAGpZT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z85lpCXhxxq5/6Rk01Q5gzu28yXLB8oEaq81zuTRpYfuHDmGf3L
	Xxz2Jwfpfp3eoQenTKANt7ffhCLRA0hO9bBYazT0W3bdR4AO9SiSSYH2YJlOZBItSh4=
X-Gm-Gg: AYBFou1uucPsdV67rCmj29HP/BbznTEvrDdNmvG26BLyZgEqugDu/mMwhAuRiAm4Kcc
	RTwHKzkn9as+rrZe/QueDxc3PEh4uG2BXkPLJYgFU4kw+fvi7m7MIzZZXV9T+vcVmqbiDQC5Xvh
	mTJh0qCa9YBQqepuZUXcOsv5/WjX/CXv9x1odr6ctDc8OxZ+wtrFYkckNtUNpU3aGOX4LLpkx85
	mMqxBQvDbf8966I2cn5xLg0K2CxE/dJtYLn54xH1J+aKwh5r8ttESGbLhD7F6v8Cuxy26cvjJQ4
	Pp6zBq4NwGQPB1C+cIMYGU11fmjKI+inOxpUFf7WOXBmLhS4EjELKvMIHSpXL39H3mSjkvMpEP1
	Q0ALwkMp2Uc0W/OFsS+KZPUcsiEzFogDvQnV4o/E0C7i5MJQzxDE6Gi1PgcZhuF1/l/CqXqfhl6
	I1iWCQvH8BEbKWK93BYcFAHvOT/7KLBl5G+hQoTM45jx8R5WH4OqmWOkD0EZuJ7Pep203KlpyyY
	niy7VmiEe39qL1bRbCVOoFU+YzgxczxvWgwHWXdGmXI9MTUgaKUE5kVP1WIMPDdOqwRcsRqHV2I
	J9qjobae5BHr3ibrMtbOY7rGdHfHnsVF89sqZ4jHgO6+KN6e/QbSIT78+W1uIFyp1fAbpYILR2R
	IicUkT33w1kZHaeoUhPC0zVFwPFO2cvc=
X-Received: by 2002:a05:600c:848a:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4ac17b2ce84mr321876635e9.6.1793704904615;
        Tue, 03 Nov 2026 03:21:44 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm76135345e9.15.2026.11.03.03.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:21:44 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/5] usb: typec: cable comms on RT1711H-compatible TCPCs
 and FUSB302
Date: Tue, 03 Nov 2026 15:21:21 +0400
Message-Id: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAxG4auQrm1CBwLGqxgXTP2RGgEzBWNCu
 LujLr/Fexs5ksHpVGyU8DK3ecqQQ0E6dNMNbNdsCmVoRMqKh9VjJcLaxQdY53HkuukD2ha1ypF
 y+Ezo7f2bni9/+xrv0OV7on3/AA9Begh2AAAA
X-Change-ID: 20261103-husb311-cable-comm-46f2e77e4c18
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 RD Babiera <rdbabiera@google.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2970; i=alchark@flipper.net;
 h=from:subject:message-id; bh=X0y23fFXZsiPBI8+tUywZO1MABrBc4xkzAM8hyoRHSs=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9PLzn45mK3N7WJUn2n6IvvmDpU/wnuUzLIWGnouOeZ
 8sM9KJlOyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqmFMMf4X3/atwPnBS/7eW084Z9/XztzFHn1wn9Kzz6fT9E6eanDzIyLDqx8N
 Du6U8Jl9pt3S47WSSyefHKlnnlvTe0O6n/mz7E/wA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Neither the RT1711H family (including the HUSB311 and ET7304) nor the
FUSB302 lets TCPM talk to cable plugs today, so cable discovery is
skipped, and with it the cable's current and speed ratings.

The RT1711H family handles SOP' like any other TCPCI-compliant TCPC, but
enabling it exposed a problem in the TCPCI core: it set SOP' in
RECEIVE_DETECT whenever the TCPC can talk to cables, regardless of who
sources VCONN. With the partner as the VCONN Source, the port then acks
and processes the partner's own traffic with the cable plug.

Patch 1 fixes a TCPM bug that cable communication on the FUSB302 made
visible: after a VCONN swap, a source resets the cable plug twice.
Patch 2 lets a TCPCI TCPC receive SOP' only while it sources VCONN,
which also affects the Maxim TCPCs, the only ones that enable SOP'
today. Patch 3 enables SOP' on the RT1711H family. Patches 4 and 5 add
SOP' to the FUSB302 driver, receiving it under the same VCONN rule.

Tested on an RK3576 EVB1 (HUSB311, source-only) and Flipper One boards
(FUSB302B):
- Without patch 2, a FUSB302 sink sent SOP' Discover Identity over a
  cable with no e-marker, so the HUSB311 had no VCONN to source. The
  HUSB311 acked each one and its TCPM answered over SOP, after which the
  sink soft reset the contract every time.
- With patch 2, the same messages went unacked and the HUSB311 port
  correctly ignored them.
- Over an e-marked 5A EPR cable, the HUSB311 sourced VCONN, read the
  cable identity and completed discovery, while the FUSB302 sink kept
  SOP' reception off.
- With a FUSB302 as source on the same cable, it sourced VCONN, read
  the cable identity and completed discovery. The cable plug accepted
  the FUSB302's automatic GoodCRC to its replies, which the datasheet
  leaves undocumented for SOP'.
- Between two FUSB302 ports on the same cable, VCONN swaps both ways
  moved SOP' reception along with VCONN, and each new VCONN Source
  soft reset the cable plug over SOP'. Without patch 1, the source did
  so twice.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (5):
      usb: typec: tcpm: Stop a source from repeating a cable Soft_Reset
      usb: typec: tcpci: Receive SOP' only while sourcing VCONN
      usb: typec: tcpci_rt1711h: Enable SOP' communication
      usb: typec: fusb302: Tell SOP' messages apart from SOP
      usb: typec: fusb302: Enable SOP' communication

 drivers/usb/typec/tcpm/fusb302.c       | 63 ++++++++++++++++++++++++++---
 drivers/usb/typec/tcpm/fusb302_reg.h   | 10 +++++
 drivers/usb/typec/tcpm/tcpci.c         | 72 +++++++++++++++++++++++-----------
 drivers/usb/typec/tcpm/tcpci_rt1711h.c |  1 +
 drivers/usb/typec/tcpm/tcpm.c          |  2 +
 5 files changed, 119 insertions(+), 29 deletions(-)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-husb311-cable-comm-46f2e77e4c18

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

