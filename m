Received: from mail-dy2-f25.google.com (mail-dy2-f25.google.com [74.125.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE72040DB2F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 06:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790923979; cv=none; b=Tf+G2wvzkP5stt2gaWMUQvZGsDvYwMywIGBAy6BL3MWcSp37mNeGbOA9u4DhyZqmzPvmO6rrEyykkkhw7fj8gd7Mj/GM53RPalzTEveH3p9xJ44dkV3jG/6LcjJXn5HqU7GpEaHhkFf1Tg2tQ450vlo0uwe2fcy2WDqr1QLbVw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790923979; c=relaxed/simple;
	bh=qGSXLJIpdkJs9oQnRTS0s0gNjId4sqoHPGUPrcLSvO0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ukYfUsmWleDUu0pFHstyUc6yzkdomsBrKDU+LBRemZfTYFxUzF8NOxx7L/RlE/v3g0JpsDjzIrxne1f8CvHTI/sqqt4M8XpT55WYC1Xj/tyObgME3Ht79oGr3WyMxaD2/ldues2s348+uphw+3IjwSFrHCPHepHvKebIlu7FHfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWXyAo8w; arc=none smtp.client-ip=74.125.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWXyAo8w"
Received: by mail-dy2-f25.google.com with SMTP id 5a478bee46e88-346c612c7a8so3811992eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 23:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790923975; x=1791528775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjwPvXel9UWguQCsnhPQwjYgbCzapnsN3TFfdt7dBwM=;
        b=cWXyAo8w+o6XjheKjYU7OBQtEbDkaEyYn96VfrHsKVYTsyENwia16OI2JjrAlA+qVz
         b6reFEGrsTsdetw27zuQs5Gc69PwTNhse2DV/+O2nvsc39X7w8kU6ihF0yNbec9M45ZE
         vTrGUHqtkt/fxlqdJiIa9ckwQpEev2jYg/bOBxEj5pwFTv5ZRF9ejq17oaeFzC6piuGL
         YrJJ0vYVCe1upS+FJosTYw/3IQyAV5i1fCKSKcIKRGBl0oluxEel/gWK8BRPcx5BpfUx
         7KK1lIL25uLHFVhtTTIiL2qSwaRE4Ju9xBPtWgslqXZuzjfk/8QnhX0nKccZLdSL4BiC
         Ku8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790923975; x=1791528775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjwPvXel9UWguQCsnhPQwjYgbCzapnsN3TFfdt7dBwM=;
        b=dD92HhRcgX7LWiYZFoljH2D5AiCkkvwr0sNp+Mqytejo+qkSJCNa5ie/sJdtug6zju
         zkEVcy5XpnRZt11YziOzrOwhYZKLqXhyKzMdtcK0gtCIhWTbQgerJuwc/Mb+GnwmNdqk
         cN1IH6GT883+Bn4WsoEiIKbgFiBpIj8dkv4Az7Wp3cD2N9c/RY9v9qSfWTJyUZp1agxY
         7TBYekykJBmxT0v1eay7NGj9fjGIP3c5W/0+eTKP5MIi4twQGHY1KrpwQQ8kflGFWe+y
         JfWCEvuxOrigvghUZrWSvfMRwIG2GMd5enTBxeuRsFwyIGfYNuGT9Bwa5QfJTtmI7IbK
         3qfw==
X-Forwarded-Encrypted: i=1; AKwUvBywewpeWiKZEIHFGO158kAGKGcX+zUJi08Ti1f041MrMawdQChsjq4V3V28PBAeQ4WU8d0XMR/0eyGFaFQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvyLyEy6jMLaUWs1BpYBHpWY++6jr0TqwGag67QRmXq3t4cUd2
	uM8893OQ1kP76nUvVpKVxLxXBbv0Cc6UpZfTk4KPoF47ayh5xakT+REk
X-Gm-Gg: AYBFou2+KZ7kym+22nfJ/TyMwotO1M2qsLsdOIR4Lbps6OhdKPre0u/eY7fRPkQi8MC
	aOq9sOpeKlHLwZm7EaMOwUKM11pMCGMUJc/kgb58IGlB8VTUGl0FBmxe9WuRcGsh2C31lTA2Vl7
	0xJIANV6cVu9bEjA5WHd8+DUAsKBK/rX+1oHygXxD4A/tqXx/CKiZt6k+8yjW1JIcxnnyNyeULt
	X+/gss4EZ/aGJxyTNbe/y3v3iCHLkHoxYsm6zjttfGcoeOY0XfPrZHXiGnTY1Q+ort+pR0vDRZr
	AvMUb5SQ06GBtu1DWZ0DQf7ZGTPKBCa6/44MlhpNh6OBofwIap0FkMuxAT0hzKx8q4YAqmk9rOv
	HJ4p8zG3lGWzHVQ1THSkDj0nWX5bJs9rlunKpqW/4Z/DO20sDe7PGTedwy24BThQMci0yK+3PL/
	OAdlvqy5vv3Y77trekdj9I6RGa6t0yq0jaXFHVo/stFErk/xFKIfqP5x2r4J/ZT6V3xhSi97E6J
	LTTO7Q5
X-Received: by 2002:a05:7300:c38f:b0:34c:f181:85dc with SMTP id 5a478bee46e88-34f219cc55fmr1976751eec.41.1790923974964;
        Thu, 01 Oct 2026 23:52:54 -0700 (PDT)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f0672c739sm4349453eec.3.2026.10.01.23.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:52:54 -0700 (PDT)
From: Zhengchuan Liang <zcliangcn@gmail.com>
To: "David S . Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhengchuan Liang <zcliangcn@gmail.com>
Subject: [PATCH net 0/1] net: netdev name hash leaks kernel text base
Date: Thu,  1 Oct 2026 23:52:45 -0700
Message-Id: <cover.1790917676.git.zcliangcn@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

An unprivileged user can recover the kernel text base and defeat KASLR by
timing SIOCGIFINDEX lookups for attacker-chosen nonexistent interface
names. These lookups reach dev_get_by_name_rcu() and fail with ENODEV
without requiring capabilities or changes to network devices.

dev_name_hash() passes the struct net pointer to full_name_hash() as its
salt. A missing name that hashes to the same bucket as a resident name,
such as "lo", requires an extra chain traversal and takes measurably
longer to look up. For a known kernel image, the collision pattern across
possible KASLR slides identifies the runtime address of init_net and thus
the kernel text base.

I reproduced the issue as an unprivileged user on x86-64 and arm64.
A tested reproducer is available privately to maintainers on request.

Zhengchuan Liang (1):
  net: use random salt for netdev name hash to prevent text base leak

 net/core/dev.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.25.1
