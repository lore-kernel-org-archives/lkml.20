Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01AB3148BF
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789960777; cv=none; b=qrCo8BbcFZlep80JURJohDSzW+Kxgr7moWq7PCDpVP2J6V/PdonmywJjqZgYK0nmc9yTT+2JlGdDyiCCG0Uy6U0axlH+I+l6qqzO5/FSE1cmF+IzSPsFnEymgrBleuWx8Lo9VXMwc8QU4smYeRCR6XXLag+wbS03sd2bEVX/Lnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789960777; c=relaxed/simple;
	bh=JO6xlIuumsjAVowMBi9vzOL/QjfVvzbvfoqIZGXrbOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YLDfeZf+50uH/A8Rq72cQRyA68S4m4q/UoJAgdcDAms4EwCLlqTtnCJ2CE3hcZl1ogG/I98q7QWdRIZDq+a5PzesB8Xo4E8E9HHl/f+e/pzpG9ab12W+5qS9B2cBekVT1tHl7G0bym4xmqAgNhdwJnc6pI5Aiz4tWtPB8iBuZKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=yXX+4ja3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CNktOj2X; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="yXX+4ja3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CNktOj2X"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id DDB96EC0016;
	Sun, 20 Sep 2026 23:19:34 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 20 Sep 2026 23:19:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1789960774; x=1790047174; bh=sVMdf8Lh9H
	jxt0Zo08Y0BMYUYzm94Miel4RuGcgoig0=; b=yXX+4ja33yDWFAGoH9zrM3znqe
	hkh1CGuYlmvgNLmWANiPRMtstHvlhWBAqzL4jn2HmfUH4YU14kcO0xzml7YdJiwK
	ETt2jqXtkstCUSBePqzs6BjZiGN47SVMVQ8ZAttUjQVIaxNnWjAcph1mgUshaZFz
	yXM3vUjkA0fjylrvvi54bnSmn0b0Fz4QhlcknknrP1fHc3XS+bd9hWqDWsYw7I5l
	FDh+FWIoWlySMinHTXwZVJY2YcuEZMJIy+3+SVHKnyfhPjtye+NcIWm+mnvQrAUd
	XceklkUOPvGenMAXxv2D2gNhYM9ke4VMN7nW2uZgFRrQLhmVdW3+WSK24bFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789960774; x=1790047174; bh=sVMdf8Lh9Hjxt0Zo08Y0BMYUYzm94Miel4R
	uGcgoig0=; b=CNktOj2XF9n+LdIcmetAIHJDu1rQN+ezJBfKCC8kwrTwscE2mlo
	Xg5fuEmqAIhlpdAJTHyXP9Lwp/5A02RI/UplxN4QPOTn8TTGKVFvp6RoRY0tfa2Q
	LE0MLzLXf4yyo4R/6+if65j8gtc4XynRcYoFmtlRMtgGy2LLtEr5rjESe1yAaUD6
	QcbXeBlG7J3mBLJhlB4S/6mQblwzXt12LS58mJFsvHb28Dx7OZB5lg9/9hujztJ0
	E0z6Xiz+XoNXcwflx0vZH7cm4FIe/07fAo13icWVsFaUfXy7QzrK5KnLOvXeEfVt
	KQYZ+1R4YLQUZnaup6Ol8Xe+/jDZbu8OtZA==
X-ME-Sender: <xms:RqKwamRYcWXHHAHQoVShcarCYpyCYgSbfhNNS_krIhPXcJH5-vgOqg>
    <xme:RqKwapvDtmKNjPi42lUKGeTUyn4zx5tRsl-UqcRisty5dPRA3qj-0q1Afb4opeRRd
    545bgks6cL8rB78nAcqbKePrTaYqPaeuRKuGysRPhfBpl4llz2mjTU>
X-ME-Received: <xmr:RqKwarYIOeJvEgoN9FDdhd7OqpZjVNk8u03bcqme-uNfgUNv_UUh908w6cPwR_kUnnO059TQHr9XNhdLiiKXMSMK8OoMhlrV5vLtQjiutAVBVA>
X-ME-Proxy-Cause: dmFkZTEylTtXnmPcTXMh0KFxcL/pWedf56a2slp9vXJ7IDgtQVq4Z3dF6Clp87Fefv6ZlO
    L6fyajfp3wrC9bscpXCMx5qbQgNH+xpBXD9eB8oEArzFr1czF4VybMmK+flqIAI4+ExCXb
    1mkkDRqiM0pyYnd1Y0d9402ryuM1l9mHMv3+Avtewb+XhUh1h7s93P/gewv31aOhSi3OU7
    s/jyDXv8HqyXAHF78zQiNq1oDrkZbVJubR6pJhKLb6vHFdHLaq6c0EFqWCYFvLQQxPD+I9
    tSgwFZcUCjhnTibScod1tbjW9dwCpZIaPDslgqJDLGi/LWyq2NL+MjnXaunc30bfCuyUe6
    25k6KzIXnLGqBfI4in/Tn1I0d/FSthlXjcXzp+btx68VmeA/aS5wb1+x/WbAxGiX+whLaY
    WyoSerQAyGn4d7ZRZ2px5LZaVRg/7M2BrVKhC2EfYN4s4/lvd5oHlmiK2udpNkleY6L1EK
    PtaSie+8Fv8GM5jfYay64pwDIpXXQ5Edkh6IOMvUa+8NKuPTIVmNBS6fv0HfiRSm8SvwZG
    grV+EJ4jTW2+eOmUXEGQg5Hm1BtE7Qh7PNV6y9KngRmRIfxg+NjAmb+cc1efzKsNO2NYhr
    SF7QYGFBcRf+J43CJRTHq4Psma31mVasTAvu4TLUfVwvRPxJZ9+GQrvaRjDA
X-ME-Proxy: <xmx:RqKwauskfAmA7fbmKb3vr-GGuGNW-o9gXikVCOjSEW1Q1r2AAoX4-A>
    <xmx:RqKwatGMP0FlJki1N530HXKBMaY_oQRbx6-zO4HUQTVCz3PMizgtTQ>
    <xmx:RqKwapyyEKGVVfFQGs7bHAlIcG6uRr6a78Qdf6PPm8ymlphbsgUMuQ>
    <xmx:RqKwasg84rhpbSuzXvN9_ls3or71JuAHUC5RP0noJz6WybzebvuEoQ>
    <xmx:RqKwaiEnItfQLdUvcheBI9is3MIKB3lpz4MsARKrftGPPaO9QQgaAc07>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 23:19:33 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] firewire: core: invoke transaction callbacks in process context
Date: Mon, 21 Sep 2026 12:19:28 +0900
Message-ID: <20260921031931.287429-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Currently, some error paths invoke the transaction callback in the
caller's context, while a split transaction timeout invokes it from
softIRQ context. This makes the execution context of the callback
inconsistent.

This series ensures that transaction callbacks are always invoked in
process context by using a workqueue for the error paths and split
transaction timeout.


Takashi Sakamoto (3):
  firewire: core: refactor invoking transaction callback
  firewire: core: use workqueue to invoke transaction callback in some
    error cases
  firewire: core: update kerneldoc for fw_send_request() and its
    variants

 drivers/firewire/core-transaction.c | 91 +++++++++++++++--------------
 include/linux/firewire.h            | 15 +++--
 2 files changed, 56 insertions(+), 50 deletions(-)


base-commit: bbc5886fb1ee5d29438c81a770ea4bb190757b3f
-- 
2.53.0

