Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794551526;
	b=IaX3ldjZHisGdEjhlL3DFQAnbQhFhyppTeAq0cS+j5gXBr1dHASVr+NMiuhT/4XPglb5
	 Eb9PV5imDHFTmvehSmo9iwGN6s7WTmVUxe4ZurASGBHsnaasHQQ+qoVexWXj0vDqobQh5
	 PNvC36mUrBATclRg/ks7lAonkC8nApqd70TOBLSx60H/UtuKkD877Ki2ldbF8ZgtQelRg
	 383NZ/A0Bxwx5amxKzoD46IBPNKDWXQZQinHg8YRykMOcSXPEx7PDL5IyUF0U0GaLkx5h
	 BYKDCFk/i2+eRn8fYNfpdfrd1WwL9XASDuZbmmWO6Kw8uUiltMmeMX68DgPSD0L61aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551526;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=HvA7+WtaTN4yvDTr9nDTm4lyRhrTIF/PJJOZl8KDOik=;
	b=lY9hG2Qdmj6zCunwVFWA+o5gevnK3ZLTzYzV0+LsShs5FHuO+khrJAMSpf4eWkgJRbCc
	 7ESpIFwT7QWAFk1pwbepSilzPevHg8297z26ORYB0qERV2YECb4UDgmo9CCst599d27vr
	 Ee8uuIcBz1yj40v/+3CVUE4xyjgSOuhhsZCKZOT0zj09YN/Z4lj8BrsCDCUQ9bW+sim3U
	 rea01hYgzWZ3yRL787/WGAt6w/q4Ujljitvy+HWBmQt/B4+dxxZKeFuglUR4UH4wXODOU
	 KRkCfJseLef+4/hVHzuEDFvxqPolVPB6BZlikKmPEvCKQ1KJhKqdner/JxYiXQrJCug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+aDS7k5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ABE606A327;
	Fri, 13 Nov 2026 06:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+aDS7k5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794551525;
	b=vcpUF/GPNfQyKvEkAdFJMOcczup+OBeKGccuN2pgPZ6Bo130pVVNVzAiBQf7/h/ggzqs
	 wOiVn67QtvlNrzlc3xBuvRu7Kz/DfuB0qJfgwNs+wX9jZtLCXcmXK2H9Ak8pzIPB3mwsf
	 TR22ShEgqmmrbTx9elM+HGptpxFK0cTIB3t+XFF0fsAHSJjAfEV1+Vk0CCF5+Hhwj2X2+
	 CZRtGRFExc+9m3OMXCFjT5UdfdeeAK6oO+ZdbW8H7xLcX3hhTfw2Gg2Oyz3mchyQtHU7j
	 wVWcEs3uxRVFPgSBFRwhxsK4BbRXAKvH3IyTHSBurT1jmhvxujL23oC7NT2gWgLB/KA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794551525;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=HvA7+WtaTN4yvDTr9nDTm4lyRhrTIF/PJJOZl8KDOik=;
	b=saEmvdwjUSUW5froWWihB0yTvg9/0Z0pQoCMlHzrRME8nXZEnKXY1OXvanb1y66pH13W
	 SFhRbIur2T0xRaBFkmiO3cwSr3g9nsq/EhcnX/t+lfIBIFp+fH3CloSi6yZAtZ+I2grpj
	 Pnqg0U37jTN+UQvDuD4uwSNyVHaJl8x260Ipn2zM7H//u9lGiBILNYQzyRRGN/xwCU9Ip
	 nIrfINc2gFD1uMEToEWZFVY6vnr5w8MZbACdSB0b0z40jbVE12wAK0/OQwsXmQF3DCNn6
	 ajPB0GzMwQKKQiaIQ23ViB5P8HqYPQDBSnu3gw3qkdXxOW1Y6qb40YuB5yWWRc9t/Og==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12EC71F000C4;
	Fri, 13 Nov 2026 06:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794551525;
	bh=HvA7+WtaTN4yvDTr9nDTm4lyRhrTIF/PJJOZl8KDOik=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=f+aDS7k5SUBuukbwNgPRJ6SwsIcIgb3o37wEMnPB5cZKRpaqw/OItTtWpXMay8Csf
	 GpW0c429Csx4tT3A3WBpiX2F1ZcxnEDxfTobg0dZOk9/tSB+HsAh3wGRnMY+FDmx1L
	 idEkgIx6gF/Df4TaxUlYtenclRZW1H4h4Ndxu37aghUwIwYjrA2MJb/6oO19iKpdXj
	 1uUuQnlh6zsK83iwZOgpS2QOirkmB2Ww5ruIr9TI7eAVROmS2EDaoguGEbZhoHL/PG
	 qA6tb050xl4X3vJyQpJWuLHOmjU7eZkZoAfdU5n4smLBJoQUuc7Cmdyj0l91fL8Hce
	 8aWrW+Wi3HUGQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 647CA47628;
	Fri, 13 Nov 2026 06:32:04 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Subject: [PATCH wireless-next 0/4] wifi: brcmfmac: Add support for 6 GHz
 operation
Date: Fri, 13 Nov 2026 06:31:54 +0000
Message-Id: <20261113-6ghz-v1-0-0b9a67e413a9@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CMBQFr0Le2iYWIhCvYlyU8oBvTDX9KATC3
 a2wnMxkViijUHHNVkR+ReUVEthTBj+40NNImxj5OS+ttYUp+2Exrm4vdeWawnsipe/ITuZ9c8M
 kkU+qmsB5xP3Q+mke9ON/hW37AfWOKtx3AAAA
X-Change-ID: 20261113-6ghz-a8d587ab3cce
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: asahi@lists.linux.dev, linux-wireless@vger.kernel.org, 
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
 linux-kernel@vger.kernel.org, Michael Reeves <michael.reeves077@gmail.com>, 
 Daniel Berlin <dberlin@dberlin.org>, Yureka Lilian <yureka@cyberchaos.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794551523; l=1842;
 i=michael.reeves077@gmail.com; s=20261107; h=from:subject:message-id;
 bh=O2HbX3PGoxwHaTzbO9NvLzP3Q0NQYtRhPhMh4oU9kEY=;
 b=lpongLP+YiC0s/OvTNBUYPbK8V7Ti1fI4slD5KFcSIQVYpJMBlgTvJiZHV0uHW+ThRZJLLo4Q
 XJAEiUAm+87DmvZDEUY3SDYprUoQ4KrQo/2ch8hLJ9cr5EKTqF2NU+M
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=ykwkLcuByJYb/cdLc2UuoYP03pIzwrscEZg30+4tJL8=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20261107
 with auth_id=1442
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
Reply-To: michael.reeves077@gmail.com

Hi Arend, all,

This series adds support for 6 GHz (Wi-Fi 6E) operation to brcmfmac.

It includes HE capability advertisement, 6 GHz chanspec and band
handling and PNO version 3 support. The PNO support is required to avoid
channel-number collisions with 2.4/5 GHz during scheduled scans.

It is adapted from our downstream work in the Asahi kernel by Daniel
Berlin, but reworked to make the code cleaner and more maintainable.

As I don't have a 6 GHz AP to test with, Yureka Lilian tested this
series on my behalf, on her Apple Silicon M3 Mac (BCM4388). Connection
and use of a 6 GHz network was successful, without regressions on 2.4 
GHz or 5 GHz operation.

Thank you for your time,
Michael

Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
Daniel Berlin (2):
      wifi: brcmfmac: Add support for 6 GHz chanspecs
      wifi: brcmfmac: Add support for the 6 GHz band

Michael Reeves (2):
      wifi: brcmfmac: Advertise HE capabilities
      wifi: brcmfmac: Add support for PNO version 3

 .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 477 +++++++++++++++------
 .../broadcom/brcm80211/brcmfmac/cfg80211.h         |   2 +
 .../broadcom/brcm80211/brcmfmac/fwil_types.h       |  68 +++
 .../net/wireless/broadcom/brcm80211/brcmfmac/p2p.c |   6 +-
 .../net/wireless/broadcom/brcm80211/brcmfmac/pno.c | 147 ++++++-
 .../net/wireless/broadcom/brcm80211/brcmfmac/pno.h |  41 +-
 .../net/wireless/broadcom/brcm80211/brcmutil/d11.c |   7 +-
 .../broadcom/brcm80211/include/brcmu_d11.h         |   3 +-
 .../broadcom/brcm80211/include/brcmu_wifi.h        |   1 +
 9 files changed, 585 insertions(+), 167 deletions(-)
---
base-commit: 3c311bf321442d4c4f452a1a08bc9efce242a1f9
change-id: 20261113-6ghz-a8d587ab3cce

Best regards,
--  
Michael Reeves <michael.reeves077@gmail.com>


