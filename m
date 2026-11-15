Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760599;
	b=v7ervQoK2O8njh3eayKqW8wVOCwaajbEhE4EA2h2dN3FinaEcgBQ0E9akEGiv7n/b/cB
	 BlRiEPQ+As77P8sg9cuZ1UP1fhfLt0LsVDM5rtsfqwYBdzA57u89h7XSZiNJIM/1wLkh+
	 EIjjSVndVE1KTfZFs00gNyPV1+8wtor4JjBoGi44oqyxpK7BGl0C5pD21cm7TeKAf26A5
	 xMGP36qAlz1RlGPv73lyzPbt2fSx4QLPAYYkIrm0jYbeJ1eMPdokoj3p+5FHbJaWaU5S2
	 1v4wcSpcS5udgFm6d4ajx5I6lf3TcoIrdjzuFEVkHGuua234b02LRsB3jaESraPET9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mcJ8+QiHfS18UpwkZcfAlWMTf5+8/6l6MYdHWQbUNrY=;
	b=20Ih3pRR8Z/gi9ybUKU3Z6pQKi0J6IE1OCTAQJDjMm3S5aMSXDEfOZ2Wy9zIQ4Y5Q+an
	 tMsIKrPN4LKFrMuCxylbHE3zJZbiLHZ2HUQ2R2hvyoj5SVSjAgffrrAkw7m718CXnRhy7
	 xJTI/qPCekW0y2oegzhsCQ+ZFYSOpKDxrbZzDqZObu2IjDsLAQ14Zj9O7Z0ON4KviiBlF
	 URIwFxUZctyE7HawCIyuVPaqLmiDrOA19sGIs9M4cnAx5ZB+zHuG8dddZU5Qb+/w+zdEu
	 D6Ga/YGJ8R+C2qOb4Fz3IJrXnYJlmWitnyT26S4O6O2WKzTcn2DjWJXShAupUmPd9JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L2j17ZL+;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619DE606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 619DE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L2j17ZL+
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso3201687c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760598; x=1795365398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcJ8+QiHfS18UpwkZcfAlWMTf5+8/6l6MYdHWQbUNrY=;
        b=L2j17ZL+18b2OBG87DnI+1KDb7D7TAb3Aw4q8WzaoBOjXcBmQtsGNSthE2Y4pNzlk7
         ckFHiYnitlzKUpgLq4K7bNZ0ZDQiXp6MJRQI5psk67JK9B12ywAhFQzpaTTBZh88DhmS
         JjKxK47NZtgMZRdO8fMBIzEYEsL4v/zATLNacc38fUuScdRYnMnTZNSO5oA5CihXO2pN
         dN/TVsPB1SjUUrlbW3XdTp1bN2vnjKJfxc/T3u6/inS6K1o0ZUVQAiinYUsikCMYWz1n
         ofsAmqyoWK0H5NGyvDzQmkU1u6SI6NOXndJaiPLMv1wJCO1XytqQ/LylGHHitfmFkpPF
         gwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760598; x=1795365398;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mcJ8+QiHfS18UpwkZcfAlWMTf5+8/6l6MYdHWQbUNrY=;
        b=2oBUkfMZ7rWCYkaTYof1wY/fuBbVFMQIpIxdA2jqoLZPxefSyd6EBVeU+QHHcFQfiM
         0S9T2T4qd40vVr8CWm2RFHcMOiLNr+PaQ54CdRTfea3ppCY2vfEVz88FjGkSXmHoR5uL
         YGGQ2XYJQ4SX1OMGs7tOUr9A51SeCxovOY9O19BjVUeQKPPa6sE7m7FdIFW301hRtcuZ
         kfv4LPNuvrrx/mryPZdg6YUnvuvHxzWuvWkmPxyuB0WC/7VsV/y5Sg+vt6YKqXRN8tVc
         MfLgtevIEnIGrYlYHDBnmKjRfl+HYAglBsQ1Yvhe4mdIPsK2Fe6TOiFtDso8aufIaXAl
         rx0w==
X-Forwarded-Encrypted: i=1; AL+hErEILW1AsHtOXX4/JqxxETv6GdJKulMVnRawh4NE8tv+3dj7Qsg5BtGjgoPG8xfpeaWQ9Ni4JmVbOGMwmTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lTLDSZjYmCHbhsMMFfuAZSQqUSVysSwRFFl3a5fS9MSAXDRZq
	9uWGREmZ4zp/+YALRC5wPqBPZ7LkJ5cYUtXtBDZvgbf4V5esnfrSkNgt
X-Gm-Gg: AYBFou0xqzVFHIYYsvYT75DlEOzBgGxT1VNaH4aK3fsOnTgMI/hgCusZoXpKSsORbHA
	qCLxIefn7m6To5P0cfILxsOs9muWc5bKWKO843TKxllOLci9Un7dYEuBc17c4jV1bGGzF8e7JO6
	GcJ0CZfDmyln17JUMAo/yxsiqJqnmsWiq8ZZT28OGqkc+niUjZEP2TTag4i4ldGjOIDMiJnEz/Y
	4e9DE5sf3FO6cBSdxkfLM7iZcyy/b7meU+oq8qfTqkcQmSFDkDYAmAGPyvRAO0To2Dhz4GdvbRx
	2rjBLBfLh2PQul4WzI7lygpSu42oz8TT7IUsONScqta1PPN/ipTJIe4gXF6sis54FI5mHtMrcB5
	IuNNfuKw4w0BL1bwdTY9x/RQjVbnGY/I6508VDOpyPlvZt/qV3itm+LgNfsdogi1XHdyZ4sr19J
	LjCyrj0tVCC0vrRXZIHn84/FGjEDsKFob4u4BCbRfcvKkhrZOD9ek8Ry8VkdQ+x9c9Qx2FZiVoC
	rUNhhiMHAtencOlbIoBiCXPN2PeuAAvtmtADA3YKlA4Qn4zKzcHhqH0Y+N40Rg32+T0+t15Lhez
	+g0xLBbIuESu9WUMTCvuElREIF1XPFbhiZqv/YwhCQeAwVKGTCqoPcCuiKkQBtG86mz3
X-Received: by 2002:a05:7022:108c:b0:143:2967:c0b1 with SMTP id a92af1059eb24-1b5030b6178mr6760986c88.25.1794760598420;
        Sun, 15 Nov 2026 08:36:38 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm33639439c88.9.2026.11.15.08.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:36:37 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] tty: TIOCSSOFTCAR ignores a locked CLOCAL
Date: Sun, 15 Nov 2026 08:36:28 -0800
Message-Id: <20261115163628.225925-1-teel4res@gmail.com>
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

Hi Greg, Jiri,

I hit a small inconsistency in tty_change_softcar(). It only matters
if an admin locks CLOCAL with TIOCSLCKTRMIOS, so it may not be worth
fixing. I am reporting it in case you want it.

Every other termios change in tty_ioctl.c goes through
tty_set_termios(), which applies the lock with unset_locked_termios().
tty_change_softcar() writes tty->termios directly and calls the
driver's ->set_termios(), so TIOCSSOFTCAR can change a locked CLOCAL.
It also skips the ldisc ->set_termios() call that tty_set_termios()
makes.

I only have a pty to test with, where CLOCAL itself means little. On
v7.3, root set and locked CLOCAL on a pty and then dropped to uid
65534, keeping the master fd. TIOCSSOFTCAR(0) returned 0 and cleared
CLOCAL, while TIOCGLCKTRMIOS still reported it locked. A following
TCSETS with CLOCAL=1 could not set it back, because the lock now kept
the changed value. The code is unchanged in next-20261113.

One way to fix it is to build the new termios in tty_change_softcar()
and pass it to tty_set_termios(). The lock and the ldisc call then
apply as for TCSETS, and the existing C_CLOCAL(tty) != bit check
returns -EINVAL when the bit is locked. I tested a smaller version
that returns -EPERM when CLOCAL is locked, not this one. I can send a
patch in whichever form you prefer.

Thanks,
Cheng Yongkang
