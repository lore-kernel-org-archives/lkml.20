Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794183019;
	b=OqeWw+W2DzK8CBPuz+PUkH3P8BIAvaOMEs3eMP+OoK40IFe1OHPscv6+1EryH56WUnBB
	 YUHYfv/RPKXRDMN8GmwRYv/wr3Ujjoq8HzCKul0ew2uqHiyL4gWZDV9rYDMJspyK1y72Z
	 UmQaeeueRwgMv88m3WLvyUoQc1AjvwZI+XWih+4/2SpMWajfBU0AHWOTw4DIyc8nImaRb
	 wiAv/D71MsOEtqOHqeKqsi+dQUn2wjP7PbwfoT9YA7wqgyxC3QrijOye6kKCut/nD07Tj
	 5wbyvrxbErNuoPQkqHocDCkGVwG1G7BWj8q0X5ICVG3li5J9RHBFC9aWZIqBPzA0d8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794183019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=PyTqqEn2wX12kZAgZgEAmVuIcoRQ/KUps+43IBZdEzM=;
	b=mm28XVdXZUdZDLs+s1EaLFrkD+ZQ5hS/wCJNoqd2XrbY7jLWE44q5Ts/QTqnbxyUODub
	 uyjZWfPe6R81g49+VryDaHZoBXLK+q8KtWj8nN+buH/KH5f/7SV4bGKGAoRVvgpi/gQeL
	 k1onvVMiUr4W374zDNKi3ePoAweBWlXwM64XKr+iRef55kqwKopv6Iy4nZyP9lc28S6LQ
	 TONQ0tf3FWohdYNHGiUlib1BMLtNCMI/zZvXAqvPuJk6xJXt6clQToRZchp7H+5NPKBop
	 9c/qcEnHoX5nkvT46nPYkKQmyYjLUu0l89n2cQBXTflVempYhBApTXaPUSmiK3rNkPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iStRZirw;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F8F606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04F8F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iStRZirw
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so686201eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794183018; x=1794787818; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PyTqqEn2wX12kZAgZgEAmVuIcoRQ/KUps+43IBZdEzM=;
        b=iStRZirwtXbMsEeyt8mJmEQC1BN0pUC1ce01sEbH7zzinI+36nBDHz9KTroZuGzvdR
         YsRw4/kMVbClxq9SZoKJLlFdQhGH9mCC/rBpE09xnUzArHxjVS2GyZ6rW9tchU0FTnZ7
         2NThoMEtO5TGMZ2puYuWhsuK0W/etbev5eI3G+q5Iv4PtvHrqW8wx1r1Ji8tkTF5/OAd
         J3/eRKbWmm0CSckHG7UNA/HZH5Mrr1v+N8vv8QKoG9gukPJLMGT48xC/5IQPIBENl/oE
         qWhSvcBoW1+zCnhpJfeJ02iY3IhItA7CyNLtG9+/kZKY3um5fdqw2/oor56tKGuEMC1A
         QA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794183018; x=1794787818;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PyTqqEn2wX12kZAgZgEAmVuIcoRQ/KUps+43IBZdEzM=;
        b=WhoL6H8RfpiCpdV+tsbSkR4afoO2gvkTDVZmwd2A7jOVFc1NC+8jdPa3G+B9w44MYp
         j4Y6E2/Jw3aLjUEzQF//FrKnDZKiftEX74hHQwrBBzDr+YZLwY2XQUZrQIucDsDjz3TI
         OrZq5viQJOuuuxIGJ4Z9NMPbIP54M18UW7kRW+dOraWtJVewGbgNPrPC7nXhjlEGYdgF
         DRqSH0JlmeSCGDqlV29TWIdRyXxhOPgB4JxLGZb6AW8qkuZiOPDsI2B3ch+cQGUmK2U9
         zQyEn1gOIl7rkCFd3efJ7CPU5kBUtqgNqc0lA0G5NinIxc0h1ytQA6I2STM2M+vgsm6V
         lbOA==
X-Forwarded-Encrypted: i=1; AL+hErEsipOgcqGQFduAHTk9e2qC/xkPN+omlmH/ALt0+Dow66tyBrChZQzLVrsTHjO42JdmvxYh/7/KFIonfKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z94sN2k4IJtqJo9JvT1PseeZLXnNoul7nWFNHWHWM9xCG/PTNx6
	UVAqd4Oq8kG08cHygiI4kTDXmj2UWuDyYCbe5ujAjbBSZ5BKOTtx/mBV
X-Gm-Gg: AYBFou2Z+s1NKSCUujIwyvNmQroqMyuqnemDFM1EP1Ym8l8w5t3LkqaPQzHVP+qs2MR
	+XDhmXZivwspvfEzxoDhzwwjzQ7SOA540LlIucfiFpkCgeXf+w45QbqHB20lgU1qWwd6/Dv4Kkv
	3Em26ZBF37H12bP/x9RQ4JT4guiWhMoCigZ/AiHD/37P6bc83+RHTZ4a5IwWCInhDL6zBSLgyjx
	N6Dp01aRQRRkEa9uXs7GdJul0A1HvOVSel3Kg2ckUCn4sjDyWF0Qu7SCF+vX9Tek2MT/mTmV5/J
	fxGvpuewr2toQ/wToy5vmljJcrkvuB9/WXUvDs/f/NuWTlPR0qERyIcYjUIXUQ77Qoomp/SUmS9
	NuuPURwNeA8mUm51pZ24UKozGD8sjfXzXLD7mrtXlv40XQpRyddkv9dStfqXd7g5+m3a1A3ZS29
	SomX1tnZGx3GnICsyl7TnnLb64f7N4B53+BXfjI0mqnv7QRoA2vWIk705TwpC34QzGil5tmhh9h
	7zopusWB7TMWWlWnbPtKtkbyPR1w+OwAa5FRddZL84jHv2EVfAIoz7/kp/siLjk0X5R/MusBXXE
	WRAFW2W0EKCPzSPIJKP6d2tSwid5/g==
X-Received: by 2002:a05:693c:8808:20b0:36c:9e26:88b6 with SMTP id 5a478bee46e88-37256613f82mr4409295eec.9.1794183017970;
        Sun, 08 Nov 2026 16:10:17 -0800 (PST)
Received: from dev.local ([163.43.243.221])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265ff3415sm7790873eec.18.2026.11.08.16.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:10:17 -0800 (PST)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Subject: [PATCH net-next v5 0/2] seg6: skip route refcounts in seg6local
 lookups
Date: Mon, 09 Nov 2026 09:10:13 +0900
Message-Id: <20261109-seg6-lookup-noref-v5-0-96dc6a652c7e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAGUP8WoC/23QSw7CIBAG4KsY1mKGZ4sr72FcYBkrasGU2mhM7
 y6tLhrT5cDM98O8ScLWYyLb1Zu02PvkY8iFWq9IdbahRupdrgkHrhmApAlrTW8xXh93GmKLJ4r
 AtDTqqAEdyXP3fOifk7knATsa8NmRw/cmPY4XrLqRHHvPPnWxfU3xPZsmfklqIalnFCgYjqUsC
 okl7OrG+tumis3k93wmMFgSeBYUq8A4Z0pmin9BzIXFN4gsaKeY1WB14cS/IGcCF0uCHH9hHdh
 SmLy001wYhuEDmuSQMJQBAAA=
X-Change-ID: 20261004-seg6-lookup-noref-e016495b60ed
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabriel Goller <g.goller@proxmox.com>, 
 Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=r8iXkM8RhORDogoTl4VkuWoeTGCS5cWvT3FEyheqGgs=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBq8Q9myrVipLCknrBU5SJV2TPFs2kF3X25o2+nJ
 FNZfnl4Hm2JAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCavEPZgAKCRAq19F1Kl0b
 TQ9+D/wL0aPKqaUINLk0fal0rXnwjtAGTNMsON9DuE36VQwgMrZVnfBmofWg9S2GOFObJ/RWaSC
 mP31iIOC1ATKv1I0das4lSzckHsYuFSygdX2E+CW/96vLNeMwF0EcXH24wHsXJwnZljTGJ2NKCF
 8ruipLI4p9yE7muqR2LZYA8pEXAfoBz4qNXdHCneD1iZwDY8Its8rIYv93t0DhPwI1s32G8dgfY
 ezZup19e90qh9GU6GikNfYzJQBSJbFzWGB2yIlnfH/aFq2F1eQFw/dPyjD28AlOyeNIlS0C1Mur
 jYfWd2csIGwbPMATXiwGThhQTvVsC4zOk3hCZCKKIdIBTjt8D0zPP1igdI04z81TFAIiWNbcYEv
 irHhb+x+eyvlPzCOP5DixitwKCQ2qTGcS4EfQzWe/C1BGW4NgrWBkyMUhp0YJ+eIFqV7gtHjRK4
 ATGMpP2LyQC2GLIx/GyMFRdY612r5641HMHPyZpnjCCvR2L/D3TZGHKgXT60h4wO4tZWMrXz7Nf
 iFkkNGDCy32r6dIKgDjFz/PEWAhjJ8yS5zqx3VqBTVU8pzOlUqqOWkoWhafZcvNTmGcCaN/0Rcc
 EiYKfAZzZfmRVwIBUNoRSzmTUsyZNYewX4lKUl1thlUQ7kMNDG7KN5/Nhr7HLVUG6WSzDu4ZXKz
 PZPk1VdmvGwklvw==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

seg6local looks up the nexthop of its IPv6 and IPv4 behaviors from the
RCU read-side section of the receive path, yet takes and drops a route
reference for every packet.  Skip the reference, as ip6_route_input()
and ip_rcv_finish() do.

An LLM coding assistant helped write and test this series.

---
Changes in v5:
- Rebase onto net-next after the merge window; no other changes.
- Link to v4: https://patch.msgid.link/20261023-seg6-lookup-noref-v4-0-0ad0a83960ef@gmail.com

Changes in v4:
- Take no reference on ip6_blk_hole_entry after a noref lookup,
  including for a missing table.  An End whose next segment is a local
  address took one for every packet (Andrea Mayer).
- Comment that the noref helpers need RCU held until dst_input()
  (Andrea Mayer, Sashiko).
- Link to v3: https://patch.msgid.link/20261015-seg6-lookup-noref-v3-0-6d51a60a67d3@gmail.com

Changes in v3:
- Keep the refcounted lookup in seg6_lookup_nexthop() and give
  seg6_lookup_any_nexthop() a noref argument instead, so the BPF LWT
  helpers see no change while a route is released (Andrea Mayer,
  Gabriel Goller, Sashiko).
- Mention NFQUEUE reinjection and the release race in the commit
  messages (Andrea Mayer).
- Link to v2: https://patch.msgid.link/20261010-seg6-lookup-noref-v2-0-51c09dd98197@gmail.com

Changes in v2:
- Split the lookup into a noref primitive for the seg6local input
  actions and a refcounted seg6_lookup_nexthop() wrapper, which the BPF
  LWT helpers also call (Andrea Mayer, Sashiko).
- Rebase onto net-next and re-measure.
- Link to v1: https://patch.msgid.link/20261005-seg6-lookup-noref-v1-0-092e84774e80@gmail.com

---
Yuya Kusakabe (2):
      seg6: skip the route refcount in seg6local IPv6 lookups
      seg6: skip the route refcount in seg6local IPv4 lookups

 net/ipv6/seg6_local.c | 59 +++++++++++++++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 18 deletions(-)
---
base-commit: 7b6ab4dbc156e2f96419715130b3d5738a306c93
change-id: 20261004-seg6-lookup-noref-e016495b60ed

Best regards,
--  
Yuya Kusakabe <yuya.kusakabe@gmail.com>

