Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122332;
	b=e65hNrxsVbOaezji9VbiE9q7TfGDTsaTT+fVh1Gnfftbg9dpZG9Kf27tx4JKRVFqj2Mc
	 xrJF1pbq+4EaqyfegAPEi/j/kSvcIRJTIUIdP8fRNmQvInj2BRjIdaW6gejwpUBPtC/t7
	 bz7j6EgxDw8VFyecjdxEtcjLs73dhw+TkkJ5rqvnVu4FQsYXrv3BtBuhXfwRyP+M+aXFI
	 54DZ+gSKiK0RSW8lr/86uVQTqZvTp49ruB54ZUIbbCkdcpJH/T9VdmVKIPrAqH/gu0ONR
	 CKDRR8L9M7sbQRZPsdy7CCnpN2HepHj8WR00qtBDAUhHTW1wVFN/b5VthZ5oT7hhXMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122332;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:
	 X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:
	 X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=o1AfnpvDOdIlxUV6w1EJOtOgU3PvW3osh1278II251U=;
	b=BywyLb+S++5OlowygINMGS7IMgPTbPkT4YCbzPPJCLHUJPH9jn0/1ujVVa89YQ9rxTXQ
	 i1g9R8ElFv6pL7J1VnpbnvLP4HKiKM/ldpK0UuxmfmaPV/xL3t83s5t7NFLYJN4OOsgVI
	 BMLIIPnkUPCKtd2ZoYoQ6yS+MtrPsGDxdYfjgCsRNiOsMiZwKrWYkQvpHLztYya6CgtUM
	 dJYTpDXMSpJFlgYei0sIZiupS+aa2hqdMkO/GdF9d6fLHrCdkqj3jJyIKgZU+qm7tjcoJ
	 asKO47huboDpp/IQoDLx5ehQftEyqTfwFhpHIH5FiTvPUF/RKPGu/8ZmtYfkyTZgWiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BDB606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40BDB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jMkmT3Tq7z5BNRf;
	Sun, 08 Nov 2026 15:18:49 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 6A87Iekl022379;
	Sun, 8 Nov 2026 15:18:41 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 8 Nov 2026 15:18:42 +0800 (CST)
X-Zmail-TransId: 2afa6af02252fd4-686a2
X-Mailer: Zmail v1.0
Message-ID: <20261108151842879F_ON2AUBnuh5imOx8oZ1w@zte.com.cn>
Date: Sun, 8 Nov 2026 15:18:42 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <lee@kernel.org>, <mfd@lists.linux.dev>
Cc: <tharvey@gateworks.com>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIDAvMl0gbWZkOiBnYXRld29ya3MtZ3NjOiBQcm9wYWdhdGUgSTJDIHdyaXRlIGFuZCBzdG9yZSBlcnJvcnM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6A87Iekl022379
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sun, 08 Nov 2026 15:18:49 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF02259.000/4jMkmT3Tq7z5BNRf

The GSC regmap bus wraps register accesses in an I2C retry loop to work
around a chip errata, but gsc_write() throws away the result of the last
transfer.  Every write through regmap therefore looks successful, and
gsc_powerdown()'s existing error checks can never fire.  The powerdown
sysfs attribute has the same problem on a smaller scale: it ignores both
the argument parse error and the value returned by gsc_powerdown().

1/2 returns the last transfer result from gsc_write(), so regmap_write()
and gsc_powerdown()'s checks start to work.  2/2 returns the kstrtol()
and gsc_powerdown() errors from gsc_store() instead of reporting a
successful store; its gsc_powerdown() error path is only reachable with
1/2 applied.

The patches apply independently and can be applied in either order,
although 2/2's gsc_powerdown() error path only becomes reachable once
1/2 is in place.  The read counterpart in gsc_read() is handled by a
separate patch and is not a dependency here.

Shao Mingyin (2):
  mfd: gateworks-gsc: Propagate I2C write errors
  mfd: gateworks-gsc: Propagate errors from gsc_store()

 drivers/mfd/gateworks-gsc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
