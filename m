Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950728;
	b=QMVTl1tCPqJVphSgH4iaEu+NT0tdLwwabuGg0mVHr7NtgoNT8hd2TcT67iizVE4byCRf
	 M/M52D+jqWoaHkneGkiQXOQYvUrVpz0f1yyRgZp4lz1LMlVOVVBubLv7sstp05njqL2W+
	 3Zs2Jm30lSWmRJufReLZhekgTblsI8Wcj4vAeGFQiDDVjjRET5QyPQcyXjKXQxVytNJhj
	 6LIJ9WXFBFxw1to22ioLqogHx45m5HOxTESGtkhTwfDKy9wQkLPbExtBNH76UmnHjPoya
	 qHuR/4v/OPS9wiF8Ap8PzVxWosZ7kc6kKSbRt4maEdJ8jKBBQJS1Tz3B6ZlzEMIuH/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TcYkro3OCO9AzDAkILfFADp57R1OwJJFMCiJFJWlr6Y=;
	b=h2Cc3EUIIUUeC+Nw17h1HAr3ZpUP3nZW4hCXGMnUHbFJ9SODjM540GHr2wi1W98ERJpV
	 e5hyMrsJRNWxFVWXmhalJUwRZPU0uzPEPcyketdscY9nO9lVspFp4bBjvRzoRaJsfbgbX
	 C1jZ41Fm97Cp7PV7uaAHViCqhXh1gHZnADnDMPXGhhQGO8YPmdX7SPCt9tqta4cVFzGic
	 b8UWatD2YJnlkS/aWultHi8B2WtaptJQZ8UpvMnBjy4fdccC1381PIMVQ10mEYHMabPxY
	 stVAV2pob315iwhD+UAkrSVdJs5el3qRL2JfoTmAiyPIZOn1lhw+j+9JaeckvBeLTXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URrZJ691;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D770606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D770606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URrZJ691
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-89f28c3ac7bso115213b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793950727; x=1794555527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TcYkro3OCO9AzDAkILfFADp57R1OwJJFMCiJFJWlr6Y=;
        b=URrZJ691JmVcD72j0SGaNZStzdayZrIFIHow+ExwIvgRqcMpD1eLXE61lIGxoePydc
         HlNv1Hzt+mAEzDSroZ8vm6qYAvNkJxZjgp5tfqM9RTqZjRys5XlKAkMCJjGjcFl7K3FA
         OohaON1wc4rbUXqiazpy+/FyX/nDwSL3i5rOe6KFASbecfQUPp5TNRK3peQVIrIJz21M
         ppF+oCnScVfQSpY0ixdIV1aJE4LFqoF/ZpRKtvmqYOzgp/orbr3QHuBGkjEB4/LeHrRF
         qtFsqqV4ZDvphOtRJs3IzJWIm+roa9Ph6KdeYIpx1cDMms2rXYpVep3Ph6nWxW9U/NJg
         2IFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793950727; x=1794555527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TcYkro3OCO9AzDAkILfFADp57R1OwJJFMCiJFJWlr6Y=;
        b=ahmzB61almatQgdW9OV6zTvR74hR7e7BxduULAPTKfb2yHdlK/B9jLPH/NAur8AP//
         vcHG1xxv4joe8fBpcID099NdhxV4JTqI4zB4+rYxBQWOtpVqw2rLpOVM4IPHLgrDUUTm
         RNh6h1KO9Mleeojq/ZBIlZkh4hNmbadQE+xNbxUspRW7+bzrAZFsaXQDWEh4tntVFzu2
         /os/6lblC3j0VQpKe9OpnqrQh2PIuRzPKIYbqrKjBgfml+gppIIXRuu6xhGP2Td2ccaJ
         fpoz4AlgXxKj0RRFiMtxzdVHMzx90nJxmLKzgZwYXkNThPFyedmLJohto/Zcy77ANeSu
         vyOA==
X-Forwarded-Encrypted: i=1; AKwUvBwVM80PaIoVmFSCAdRJV9e5OFLcFH+H1EaE8E0CBH3Mlkg/topbSeraeEjrYwQiFXmgK2ns6+GJC5mo3Qk=@vger.kernel.org
X-Gm-Message-State: APuU4Z++7mY5qCfhorIWIN212oLjE3gSNVt1C8DwZsvsPuOowQ4E6pcx
	0Yq+jIHfU0PwG2ed7phvfYcxAMBLnsteI+5z2noEa3DaKNJ4XQjdG81O
X-Gm-Gg: AYBFou0oood/DLHiLD5xtP3/e2RkFwrV9g1Ygm6uK7MtwdhOZzyFgWmt/c77+HsCOHD
	maxbeHk0WAFnHmsNPT96vnVMWZuUeAypML5ODhzwD3uBoLoG34pNVFdTp1nP+4fce6tOUdO+ZYe
	3hE70FxfjcdAQRn480O+mQrnqgIgdHLbW7YOJhOtR8TVW3fC9Iw2mWHAtLlCE+q3xJNlw5nh1dV
	hEZPCUIA1nS9dfzLwboLpHLwUavCG5Tv+Gdbs9RNhwFsPuuEhxMLqHXoW4Y3rJuTm9bwP49BLPd
	/pD7NDHLoZcWbyKghFnH9wnl9RnQNCO8OokXCENaGyL7kQ0UfccqSYM88RqYfy8/tNxOF2K2mE6
	91ZM+rZaZX/VIlrXVYZscuulzzZq58bAlseBxX+54FVXnAqfoiv/E6ErHjfmFhN3kcrW2qhqvp4
	D472Ca3VbI3ZtgixU1VmlU3VksXFLi8oGnV6vLlcGytCgy+1mWTOpjIpjMQrlaUDa85kJfE6JCp
	PErwUPkgY8sLKuisyVPK1+Q3IXnFfCRyHd1/9Y/kNE8jR+v9mx0J1Ri3YSX3wb5ymYwKb/4wSHC
	+kKCagPyPtFPaOLm8M6DM3bGbPSRtA81n+jSLJOkgvD7krMPufrF
X-Received: by 2002:a05:6a00:2345:b0:88b:76e3:cd8a with SMTP id d2e1a72fcca58-8b37bc5fad2mr1635751b3a.38.1793950727410;
        Thu, 05 Nov 2026 23:38:47 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597efd53sm373484b3a.23.2026.11.05.23.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:38:47 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/3] net: dsa: motorcomm: ACL fixup
Date: Fri,  6 Nov 2026 15:37:59 +0800
Message-ID: <20261106073806.112122-1-mmyangfl@gmail.com>
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

Various ACL defects. Found by LLM and manually verified (on YT9215).

v3:
 - also unset `reason` initializer
 - fix action resolver again
v2: https://lore.kernel.org/r/20261103095514.338700-1-mmyangfl@gmail.com
 - withdraw patch 2 as it needs another test run on the device
 - fix patch 3 to align with software behavior
v1: https://lore.kernel.org/r/20261102071119.3435180-1-mmyangfl@gmail.com

David Yang (3):
  net: dsa: motorcomm: Fix extack message on unsupported TC actions
  net: dsa: motorcomm: Resolve the flower action list to one ACL verdict
  net: dsa: motorcomm: Delete the ACL rule of the port being unbound

 drivers/net/dsa/motorcomm/tc.c | 90 ++++++++++++++++++----------------
 1 file changed, 49 insertions(+), 41 deletions(-)

-- 
2.53.0

