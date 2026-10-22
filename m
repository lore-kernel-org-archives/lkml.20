Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660664;
	b=S66Yn+NHxC+LG6Q61oKysZ8NGc3mhL8epH48rOjEi5Foyz0PN91FB7mwe3CNR0u/6qYv
	 997w9unujQBMCE6jHbYa+wyBhjoD5Sr0BfbHXpQoC/pEomb+wo2H1GmXygLC6smOvtsGe
	 3Wu+m9fFs4FgGaGRWgTzFpIYny3231pv08KJ3Ey0ZEWXVLGB+VGkYGbHt4mpaKwmCY96b
	 aY4YWpea/c5J/oa36KNNR74piqdYakTqm2dAPMrgsV2BltI1EcudYCUHXmMBObzvfffHn
	 BDdx4LzyZmnJvy43NwTOCEjIRbKFt+la69xvradARv8tFpn9xLPmYi3trFcrp6RnUMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ydSllVnxJwUmROhHxhg7pIdiTiTIT+tFa1S9Tfrhzkk=;
	b=2x7t9tPILAURlb4v9R9zZE2UsafoKkHe8I3FtFKKn23jor8fIOg75qzIQ+tVULgCUI1M
	 Peq/it5llWfmqHzl+2i9w/MeI6e1TRj+vsy6x+Om+MbfVLgGQVZL1pk8nvmRdK/hbAgQF
	 E69Vanh56qlA/WOY1MVNEGlif6ZDow8y6k2gla7g8FmixjP+szeSaoeA2eEukZanIyqDo
	 Zx/SeChvTw9U1fOoHDUjSEFZydsGvin/yGR42qtR2zPc7gYY061hi0Gb/6ZwUuGZjZ2CE
	 UFQMydAQdEoCQp7xDVIHNdxP2SOQbIxH7B8CpAcL1GSNQNOJ7Sv7vQdwUjeUfETvYnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kPiKtKO5;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA6B606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCA6B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kPiKtKO5
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-13985f8229aso1509044c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660663; x=1793265463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ydSllVnxJwUmROhHxhg7pIdiTiTIT+tFa1S9Tfrhzkk=;
        b=kPiKtKO5Rb6lsY5ec6uXIph35wXgBO8niiwzM+/FTJEEmYLw4ZEUibPsKIpXJRP1QJ
         E66wE9fkB/medbvdzQcGd3vgJh4CvZJ42hyutBHAnrtOrpQVBtg5X/CezxuPfJh1xIsf
         YrkH5OSwm+tbcB8fjjuVOhRICDwjuwyqB9TKgWPh8nSv07CcTzH+6HkZUWR5wFtpna/t
         bOWwavwu8o1XsT4KuLig20dRzTEcDCNo4ijxgvdBNQC21VV3+5R8Jtcy2NGyTdsuTYkn
         bBGsbBTo+bKIjVsRs+GxUuasEDGfxRoEQqFuL7Fv5xa6RWhJkInlWhB2uVgYRp33Lo8z
         mQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660663; x=1793265463;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ydSllVnxJwUmROhHxhg7pIdiTiTIT+tFa1S9Tfrhzkk=;
        b=C/mdanlG5fExgdoIv+RaOCU3v9rZO9D8x9lchzaAncytudqoN2bD0SioIBUaZnofGj
         m/nLDHQlwW9uTQUhfos9Or2cNeK3bFaU3VTzpDkjdius3F9S4fZbIACbecHJvFyQ1jp+
         /6K7q8oMcO/sUcWx/ySi9vJUyZjKx7RrsjookSu+tmRHe+X/SS2mQiXZV0kgRqfqfV6x
         YwlJFFfRV1iqukLDTWBnTQniPgrvbxzOHFuYlKRNMXAQfpsBapbS7nQB6wPzc5zQa7/K
         0XE1iQw0GFYN7x4dwbI8P6BWCQlAH3S1gQW0pUE4CV15W05a41/TTMiPLyMX1eZO4Z76
         qA0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxPgHOUD4hlNFvYdDxmx7FDD78lRnLA83iZ/gGqXFqQoQHrvvhxvOOlNuHW63I5O0M3G4IvEnZYQckw/CM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbmnq4+yJxZEWcJFij6UOSFn1HLfEugDCdEg0ygZzL4z+mpU7E
	yOxmTO7U6kTz9SfMHEdb+hyDIv+iAXJgYDohWQItVyAudxCfrLHijaV3
X-Gm-Gg: AYBFou3nEUcf6pGIRxXeMnvDIi8xPOiKUGR0/vAufbIOgaMf2flxi+bAIdz0M+LgZ+L
	DZvhMaVRCJGQDCz5MU52gCvTUJ67RMnDIyf1DWVTpcN9C5eT1135rn2HKazYR0Onj4ob86ggNeb
	TdLpt8VinAzUFq/ZGCOXGPOPVNP6EVLVmwVBFgqwkIEBVCu1SLjb4HyMBQErcNCo2/pb6ya7qTD
	g6FeUVHWNAM1Jd2G1Yx7qtpHIoTNDOYGw7a6oqSp7FhtxJfn87QSrPPWBn5fA5F/ysopcy1Qwxp
	vAC9+yurYGfS/Ja/ikeXc/nDI6vRB5FmRlkPATw82Mi8BezGIZ/lgYz1P3+uPXoRMu7t42bFFS6
	5AC37YxOtkRqRi3Gh5DWijmg9t22An8ZbGtltBTZwX7XjqesslrCXJvAcLK9+z5UIScgj0euH6z
	adDg8lXxYCwYD8d37G7UFB2Kq3txY9Ua2BQTC14PGpzolymECdy2vv1bK1z9N0tV1tgetcb0pFN
	dPMnZBDjrvorPKDMaIGny70G4pkNfJyt5XJ9XmgSa2pog9sULbnoo9oIVrSnNZ4abdst8RmbJjH
	NuH7JB1l+OdCBSt3yK5hJnAUGk94F9pwejtAJ0z0
X-Received: by 2002:a05:7022:3804:b0:17e:6de6:6a1a with SMTP id a92af1059eb24-190a4f064a9mr5160458c88.8.1792660662898;
        Thu, 22 Oct 2026 02:17:42 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm19890469c88.5.2026.10.22.02.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:17:42 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net: ipvlan: ambiguous external multicast frame is dropped
Date: Thu, 22 Oct 2026 02:17:36 -0700
Message-Id: <20261022091736.3652981-1-teel4res@gmail.com>
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

ipvlan_external_frame() classifies an ingress multicast frame as local
when its Ethernet source equals the shared ipvlan parent/slave MAC and
its L3 source is present in the port-wide address hash.  An external
sender can produce the same tuple.  The frame is then returned with
RX_HANDLER_PASS and is not queued to any L2 ipvlan slave.

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1, with two ipvlan L2 slaves
and a veth peer acting as the external sender:

  external ARP broadcast, source MAC == ipvlan MAC,
  sender address configured on a slave:

    parent RX +1
    slave 0 RX +0
    slave 1 RX +0

  identical frame with a different sender MAC:

    parent RX +1
    slave 0 RX +1
    slave 1 RX +1

Packet-socket marker captures agreed with the RX counters.  The frame
is lost only when the ambiguous source tuple is used.

The macvlan sibling documents that source-MAC ambiguity cannot be
resolved and prefers delivery, accepting possible duplicates.  ipvlan
currently chooses the opposite behavior and can cause packet loss.
The same classifier also explains the duplicate direction in candidate
BR-015 when a reflected local frame has an address that is not in the
port hash.

The classifier should use an unambiguous local-origin indication or
make the ambiguity policy consistent with macvlan.  Candidate BR-016 is
canonical because packet loss is the more important symptom.

The self-checking reproducer and complete console log are available on
request.

This was found with a multi-agent workflow; the packet
delivery differential was reproduced in QEMU.

Thanks,
Cheng Yongkang
