Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352397;
	b=0W0kz5VNw0dPNnTtttmnKi63FAqUmPoNqXouEtRICLRHp3r9pmQ7jrRO5GvYF4oX3Fos
	 UkOSCEuNGb+jedDXo78rooOiuuAe9I04it6s6yhyrjJHdJ4NgxlBrOOZNbZyIMn6KcJXr
	 8i23ghBsJ0lNkik11zLtFq1XlG/a4FezWYg4SieNPysJDsBIxv/RUOO5gm/s3c4i60ub0
	 v09YHY/b2jQ0LMZ3tWwjCAMxXuJkMBQs+1jaTubT0HQsOKDvffZRI5uG7m5JRBMbWQJJT
	 kLGtNx+SdTr2YBVze4Z0u/FGv/EGOlcoSHrVzNFnVNCuwpsZvVNQk/1I+DIbvY3jlog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KsKueNaLCcMcO8fOomY84U8+zo1sTWNNmG5cOs+hZOY=;
	b=KRGXCsg8DykB4G80/nxSEM3ZUmlbeLHUcAsHNsMtyZolrbf+VAdqcqN6afF6zKrVGafW
	 YFqk24/zIMoLHo1QY7REKUAe2dOxCRRuQ+UX+U+tZH9ehQs/MPbH7gjJ0u4l4vnqq0jgf
	 E4MOZB8BviZ1XGT8q/xXWkSFZ5KN7VWDrv4XktWz9y9hC2deAs65wT7Hg7doxyI00MGdc
	 +5x7A8RUYS01yc378WvXhAOEVFlmFS9Oc4gVUSyjdlVAyHGdpwPnAwkxqyjE4VR78u7rz
	 Y+2//KrfWrUFg4n/ZjD85ixV6BD++L1MM2ZvqN5nCIYtqCiDVENtQxVGcPWZ07PkyeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FK+2VQx1;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFC0606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAFC0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FK+2VQx1
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1542011a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794352396; x=1794957196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KsKueNaLCcMcO8fOomY84U8+zo1sTWNNmG5cOs+hZOY=;
        b=FK+2VQx1Rck3gtirbWEklE18mufWggWNqt0gkFomavHdTH2lDK6wGCOKuhYvkSs168
         JWb6GCiCQekKWDzmzJP+23oUZfYNKz3VcLEI4aXD8857RgT1zdkM6HJ2yD1+K3jat6kp
         FFqOGlsxx5PC4PG43cMC/K2o1FVC9ueUrziRxN8vlsAonFweSnZnQGhmMTv4OLKcRcEK
         XzPBZyn6/fVGad47aJPMDHw+fi5A6trGw75sM64+F5ch/tXwpCHR6ieTrqkkU7lhfP1o
         L8zcig4Fd9NOO8DOsX5+ReXw9f9YHDYolbqs27VMYF4U1J4wNt2kpYyv0yuGdHKgf/gB
         aBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352396; x=1794957196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KsKueNaLCcMcO8fOomY84U8+zo1sTWNNmG5cOs+hZOY=;
        b=cPF2xfbAYPX/4mW5GLpOU+yW47LW3jUAeKJpchtXUcCOTR8Dh1FCWUkje/L01PmoW9
         DJb42nbEMJi+Q6jZ13Pz50R/bW779GOFdxfh9s6RbcbJtjiFlwkUnTpKAU1g7ydBGeJz
         HETev6reMD4jTvpVLTTcKWdAzyYSggR3uyQU9FEamIgAtd5A07KuTaZZYMeR3vrS2223
         mfAPAx/l/NhIV/OCc+rZu4/z31NUnuSeDOQ81ERMM/QSMlwn7iWSUZLqzs1h3U96fDb/
         +fh/NowGOL8gcKH2Xzz09lOUYrPiFBcrnB+zL+Wpz92DggurO7JFEOrKeNmr7HkSRyec
         GoNA==
X-Forwarded-Encrypted: i=1; AL+hErGk14N23LDAe/8DiwhG+Jcc5tURxpDwLUIgDiToB7LMbqQkKedFjB4SwC+nY4EbnONJPlnM8ebhg3MJotY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UHxDVCbXFw50Qq5AXz+PYMgt0Bo/4MVACdgXhHhiW+TpeTHUN
	Fhc/EpO+OMDLv+Ek0Ph/a7iRdEVe3GcQTvoRcRf4k2AQ3jMDBKdmRtpfm6eibHfC6Zk=
X-Gm-Gg: AYBFou3EOl5vXv6sk3I+/utCGRZOVMIE/yDFMaUAZ7MaOn6EBvbSN+YGCkhhSkc3cIb
	uvSjTcBzWf5Znch6hLTG6trE6hma4DZ+U3obi62h3MpFrAZUeb5z1mI1VjxmOijNtboCuPL/uKI
	D6gQ9mRI4fVo301N8OCOI8uFvUAHU9K7PUCoKyeF6lxx8ciDEciPjRd0G4AUXUUbcGc45DX7Z8y
	ys0hnaqvoShj1PguMqUm/zFu0NtjpEawwcJLK0UUDu6TXcagCGvTllfF0QE4gX/C3AyUxLeO6Xl
	0L7xinm6fuJWrZ/Em1RbFM1sFxeKaRRrVfJpav3zylt8wwd33F3XXpVX1a7fkDyd+jgh/NjdkBY
	CV/2PGDqULW4kEH2mETkvLTnUdEo+gSIlHSs5vi/R1yFaxAX+dzFm6HCarj0adkIFIKuiLFdXfE
	en8oYnenJRLGfjwBedfgl8j4JfLe6KErmYz3MLsnYrHP2iFnrkfvJ5TnTP4DhjgYKwWBCRD/aUs
	h4p+iQSVYLxRMGv9zfG05Nc5GNR2BUXpWCFZP6flCWjWvoDkrJi57QoVKAwmXz9B79J1qBdqbZU
	meYa98ZG5ZtBplfGrFc1sn3z6O/kZPKobKh5Ygh6qQ==
X-Received: by 2002:a17:90a:b107:b0:3b1:83aa:5b53 with SMTP id 98e67ed59e1d1-3b183aa5ed3mr229122a91.58.1794352396089;
        Tue, 10 Nov 2026 15:13:16 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:7::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17da51f80sm1524296a91.1.2026.11.10.15.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:13:15 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>,
	Eric Dumazet <edumazet@kernel.org>,
	linux-rdma@vger.kernel.org,
	Tariq Toukan <tariqt@nvidia.com>
Subject: [PATCH net-next 0/5] mlx4: cleanup and doorbell fix
Date: Tue, 10 Nov 2026 15:12:54 -0800
Message-ID: <20261110231304.1859217-1-joe@dama.to>
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

Greetings:

I am working on adding support for SW USO to mlx4 and the branch I have with
those changes locally is becoming a bit long, so I thought I'd try to break it
up to make it easier to review and merge by first sending this prep series.

FWIW: I plan to include more detailed data in my SW USO series, but I'm
working on SW USO because it significantly improves performance on hosts with
an IOMMU and an mlx4 NIC. I have a lot of hosts like that in production that
would benefit.

Anyway, back to this series.

Patches 1-3 factor common code out into helpers which currently have only 1
call site each, but I will be calling these helpers in the SW USO code I plan
to submit next.

Patch 4 and 5 add code to track when a doorbell is deferred so that the it can
be written in the drop path. This is technically a bug fix (and I need this
to avoid the same type of bug in SW USO), but since I have never seen this bug
occur in reality I am sending to net-next.

Thanks,
Joe

Joe Damato (5):
  net/mlx4: factor VLAN parsing into mlx4_en_prep_vlan()
  net/mlx4: factor csum flags into mlx4_en_csum_flags()
  net/mlx4: factor HW loopback DMAC into mlx4_en_set_loopback_dmac()
  net/mlx4: track whether a TX doorbell is pending
  net/mlx4: flush pending doorbell when dropping a TX skb

 drivers/net/ethernet/mellanox/mlx4/en_tx.c   | 95 +++++++++++++-------
 drivers/net/ethernet/mellanox/mlx4/mlx4_en.h |  1 +
 2 files changed, 65 insertions(+), 31 deletions(-)


base-commit: 97ced2c090bfc2156db31fca9f52cf253e4bc186
-- 
2.53.0-Meta

