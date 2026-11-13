Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794597280;
	b=USkQNjuTwvghaJSJM3Le0iShAFdPlzL4bBdWhHhfN51SvIDiQW4oR1H2PYDv+LTai7xk
	 FkrE8zaWT1pzPRpEhdqV6Wj101O9LntoetY5jnhsHALXLjzI08n5l5wnthSccAnOU9o4b
	 EtGkEU69y9uiqbpkv24J00rhqylekeYVvII+jnePtXvQl1Fa+Q41uYg2yg21HJg0Qy0OK
	 ZNiYCf+nl2II7V67QKSZG4vNQPGdHsrm7sKJcZusyLff4Kq5TDDkABznB+pIY2GNDwWKc
	 c9bjayVesaOCbE7gsQKpZSxYJDiYBPhN1keupx2To+XT1cjeQzN62qJ6oUhzOIPRHOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597280;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=ewn4nCsmxQKS4ciDscnEf8cddbaRp74HJH3ImWn4V/c=;
	b=Vdon2yVtDJOPbyJC2zdzoi4W/MLLCQ3+3CEeR5oNYt0AOgJbvOdn7K4a+nwGH0PzaGnj
	 AALuUmiRqzg3u4W6Va59vP8qZAFd4kVVsPpwXHBELuPddWMDrS3lMStiQoN3QyRG2WfBg
	 YRE7u1zkOuGjSbWDXp53paZdTa6mt6m/FyE02zrnR91Ya44vRXAr9ucWY9TX70Ov/fwNY
	 W9xLjOdi1eB/YdAcPVU6feG3y9vA32GLEeyODIju5a9id8seurrSVumsEpnNw8dTBk5L4
	 FFlcuiVZceUh0DABPo7BjM7F9PbiWwnJ5/tSqiovjHOkRDGeeh0pl4EPGR/7vY0TOgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wam+U6lO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61FB606A323;
	Fri, 13 Nov 2026 19:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wam+U6lO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794597280;
	b=OTcouzTjMNULNZzPO29Q/ZPtKf2W6DfMGfhWtham93/Q+Y9fvzawjd0Cfl7VYot6ZaiK
	 RpzQDLlLr17gARI0UwkCi3IXmlnTeivPt3BXxeMUgHMAfeeiUm8DLET/i5/BAjHd4z2rd
	 ald9+dcuvOvpaN2/bpNUG4HxhWUmkt8rRWciDyoo7f623e/ywAImpqKwpXpJjOtwcap7E
	 FH/LwwB25XnVcJK4E4QKdP8oKEjwtpxgD2f6/o/68SZS+uINCcQG95vF4t691J+yTCNVJ
	 tLGbz9HKGpuCINobAIVG22fd+EVplu6eDbjVsKIJ6WXVgKbJWj6FJ4/ji462O9ijtSA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794597280;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ewn4nCsmxQKS4ciDscnEf8cddbaRp74HJH3ImWn4V/c=;
	b=F1rNn+OkPEl1/v7E//47mWnHSjdgDTurn/5ELJ3Io2pOenyXSDEbi9qYcIoE+dZ14SBp
	 Ln+7j53CkY5XdOVfvktK6Z3JvQ0t83l6xoUUjYMeyKJ6jyhZKSZ6YKwWi0KyuBZvr+NWm
	 4UzWg3/SeUg/vNocey7A39QQYJPNIfB0/z9QDwHGRKivKRC1CyvCwpxtg8sxK45vz9Fsb
	 he0uC/EbvEZcj5lMehjK7S+5MQvavj+jAEv5xF6ybQXuj4/IYJUjhP3w+7g01T3otn4hZ
	 gSseTmcJgoB3IQfaqW761JrU3ouJWZ9oaan/TpL8okfdBBwdQ7Z8cEcFRsPZBvlvsxQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EBF641F000C4;
	Fri, 13 Nov 2026 19:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794597280;
	bh=ewn4nCsmxQKS4ciDscnEf8cddbaRp74HJH3ImWn4V/c=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Wam+U6lO5/CdCTpd1kiKzJY0hDq3mivn+DmU+A1T6mvlAHQ6Am7WzQADu8Gdw/yHf
	 xe56pbgrJsFygjG7aHXRPoc7p5LXa1FyJP5+ttIYd8DRsCUXGuh7rx6I8FtSU3SV+H
	 TBCV6gHS5MlmRrfJE1Gl9YbLKaYQ0psMViC1hHegnNw9K7l9WJt15Nsz4G/Qi5rWRg
	 z+Zjuumpsj4aOamPv585oiv/+i0GNCclcFXuMg9Qqw8ULOJvh4u6Vs7I4Kqc/USTGx
	 LqF8JPzwY6QIWj+BLSntkk8AGVwnl3Vov1soAx417a3ZLZiLcKSo7FmGlYnsjbC8Lq
	 vKCbfroC/uQ8A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6C07E49A8B;
	Fri, 13 Nov 2026 19:14:39 +0000 (UTC)
From: Patrick Fischer via B4 Relay <devnull+admin.tsv-stahl-riesa.de@kernel.org>
Subject: [PATCH RFC wireless-next 0/2] wifi: wl18xx: Stop querying the
 firmware statistics
Date: Fri, 13 Nov 2026 20:14:19 +0100
Message-Id: <20261113-upstream-wl18xx-fw-stats-v1-0-cbdf50739185@tsv-stahl-riesa.de>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNTQ6CMBCFr0Jm7SSUBYhbEw/glrgo7VTHYCWdY
 psQ7m7Rt/te3s8KQoFJ4FStEOjDwm9fQB0qMA/t74RsC0NTN60qwmWWGEi/ME3qmDO6hBJ1FDR
 dbftWW+tMD6U+B3Kcf9MDXC/n3UscaCIR9JQj3P4pWcYnmbi/wLZ9AYIYETOSAAAA
X-Change-ID: 20261111-upstream-wl18xx-fw-stats-c70d96addfc9
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, linux-kernel@vger.kernel.org, 
 Patrick Fischer <admin@tsv-stahl-riesa.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794597277; l=3601;
 i=admin@tsv-stahl-riesa.de; s=20261020; h=from:subject:message-id;
 bh=xIHoochWWNIF1OBob5awdmieWYZJ3MmNdz4ox+BKRs8=;
 b=BmDcxnz+qaJUpjLNVd8On1QPe2mIV1DXo7LzCwM1yRoUmMe5yxROT9sVe8G970/EbTZszzu5O
 C5mIKHRaG3LDMC4ogmvhz8WI2xSPKaspkryZ/IbnNI/1zGFDcA5nYV3
X-Developer-Key: i=admin@tsv-stahl-riesa.de; a=ed25519;
 pk=D+v6EloYcEY9PIUHFyTM5sqcGIU/fIXzLUdkR8vjAtk=
X-Endpoint-Received: by B4 Relay for admin@tsv-stahl-riesa.de/20261020 with
 auth_id=1251
X-Original-From: Patrick Fischer <admin@tsv-stahl-riesa.de>
Reply-To: admin@tsv-stahl-riesa.de

On a WL1801 (Tegra Note 7, firmware 8.9.0.0.83) the answer to
ACX_STATISTICS overwrites both event mailboxes. struct
wl18xx_acx_statistics is 1100 bytes, the command mailbox 740 bytes,
and the two 180-byte event mailboxes sit right behind it
(0xb007f8, +740, +920 on this chip). An event that is waiting in a
mailbox while the statistics are read is then handled with statistics
counters as its vector and data. I ran into it as a NULL pointer
dereference in wlcore_event_rssi_trigger() with a P2P device; the fix
for that crash went out separately earlier today [1].

What I measured, with a test kernel that logs the mailbox addresses and
can change the requested length at run time:

- idle, chip memory read through debugfs "mem" before and after one
  query: the pipeline counters (bytes 952-1000 of the statistics) show
  up in event mailbox B after every query, also when only 740 bytes are
  requested. The firmware ignores the requested length.
- 600 s iperf3 upload with the statistics read once a second: 50 bogus
  RSSI trigger events with 1100 bytes, 24 with 740 bytes, all from
  mailbox B and all with statistics content. Without the statistics
  reads: none.

So the only fix I see on the host side is not to send ACX_STATISTICS
on wl18xx at all, which is what this series does. Patch 1 lets wlcore
run without firmware statistics, patch 2 drops them from wl18xx.

Why RFC:

- It removes the wl18xx fw_stats debugfs files. If someone knows a
  firmware setting or version where the command mailbox is big enough,
  or another way to get the statistics, I would rather do that.
- I kept the statistics structures in wl18xx/acx.h as documentation of
  the firmware interface. I can drop them as well.
- Should patch 2 go to stable? It fixes corrupted events, but only for
  people who read the debugfs statistics.

Tested on the same Tegra Note 7 with v7.3 plus these two patches (the
touched files are the same in v7.3 and wireless-next): wl18xx/fw_stats,
clear_fw_stats and fw_stats_raw are gone, the other debugfs files are
still there; unloading and reloading wl18xx works and the station
reassociates. The same 600 s iperf3 upload, with the monitoring script
still trying to read the statistics once a second, ran at 46.7 Mbit/s
with no RSSI trigger event, no oops, no recovery and 0 failed frames.
Build-tested with W=1 for arm (gcc, clang) and arm64 (clang).

[1] https://lore.kernel.org/r/20261113-upstream-wlcore-p2p-rssi-v1-1-754bd625daca@tsv-stahl-riesa.de

Tool use (see Documentation/process/generated-content.rst): these
patches, the changelogs and this letter were prepared with an LLM
coding assistant (Claude Code). It worked out the mailbox layout from
the driver source and my logs, wrote the test tooling, the changes and
the texts from my measurements and instructions. I reviewed the
changes and ran the tests on the device.

---
Patrick Fischer (2):
      wifi: wlcore: Allow lower drivers without firmware statistics
      wifi: wl18xx: Stop querying the firmware statistics

 drivers/net/wireless/ti/wl18xx/acx.c     |  24 ---
 drivers/net/wireless/ti/wl18xx/acx.h     |   5 -
 drivers/net/wireless/ti/wl18xx/debugfs.c | 333 +------------------------------
 drivers/net/wireless/ti/wl18xx/main.c    |   1 -
 drivers/net/wireless/ti/wlcore/debugfs.c |  18 +-
 5 files changed, 14 insertions(+), 367 deletions(-)
---
base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
change-id: 20261111-upstream-wl18xx-fw-stats-c70d96addfc9

Best regards,
--  
Patrick Fischer <admin@tsv-stahl-riesa.de>


