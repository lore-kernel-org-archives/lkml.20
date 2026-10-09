Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C6C3F1047
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582876; cv=none; b=o/fN1lrjylH6Uu0zHWeufnvSt7/0UCFk66mkmYdibrZD/xHKKgL4Kj82OSB5R5XO0Mtc+18rx6eDJlSx/b295Ez7B2fGI5JcNZuCRD1pFPZSWTq4CdB8aJTv3Dw2HN2VVxzSWymc6CfEMB4t18d/5QoqpjVCSICvq69q3mQs8JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582876; c=relaxed/simple;
	bh=CtH6DluhMd+muXMYnJEXGqPlgnABaOW9uHENaxu6YHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rcddbmqNfdZyGoZg4ccS57KSL1q2O1YK+3+DfcXEyn0wDAIFmYPRsqoufBX2VX3rnhXvvSTrw9AfVsplMgnlvy5aJT1zFqLBXgjpvY6mloR/Kcye0DTJaT/V9bhX7YWtMsl2nch41SeJAwZwY/3GYHDy3Wde7dXPQl+d1o3Vvb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=yTTItb/J; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="yTTItb/J"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso43166a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1791582873; x=1792187673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4abdHfRSw+nQAbbMuTS5V/T7lcYjtcsQiFz445wACEc=;
        b=yTTItb/JDVpHmMnovZpO0nIRnHIRyiXWAdlRM1jh5x3ZxscihtRQcVQyWDu+6e1itI
         1oYkdwBLVYUuxC5TgsYDWkOM3myxEo9i6vdFU834bRX6G+sr0PlHvBAhle4bfU1OVTl3
         CTPobMwQIfwn3hPUSuhhGre8QCx5ci5SUHc80N8lE6WpgZmserJURdBNoI9o4/yCR6jI
         UWdkDT2VQjN5adHtSMpunnmHOHp8iUkG2BeN46qqXFaG0z+c225yoMhYxSMtEFMGGpOi
         F/H6XyDH6dlgI8Kc5+RHk9Jgq7YLGmYYgLTSEPzgFgxG9KUnVVFrw2su0kTW6EJ6ZAfe
         14eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791582873; x=1792187673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4abdHfRSw+nQAbbMuTS5V/T7lcYjtcsQiFz445wACEc=;
        b=u7vm6I13f5Cglht7J00ldsAsCKtqOGo7AiUqM+E2E54YT28oIzo87P6rwHiteHyLP5
         25nbociPIfxFIGeWvnlwY0bknkTdIH3Gm+HdH0LuX51q/fwqws3v12TQKiwn03FFoiGY
         sUas2464xIpgOeiQmrRM2qJpBsK3CwDy6dL3QGclQ08ktpkpFwzmOQorTd+Gfzitg6/5
         4dx/gkWvytI182zEDBEJlJiv4oBgK12M1kdSBew6v8mVbiRTgpj0j+TCLr9130TYh9yb
         ZkuERNe8+nNLv5lLUovChN5rvJzhIuAulwytQeG9Q6KL0Q8CqK2RUbAOZUNSMdT5wbPx
         O9CA==
X-Forwarded-Encrypted: i=1; AKwUvBx7qWLoJThxHqKb9FtxyLcT7HoIH03iHXkvR77073kboiQxlY105E7s7bFZAvIrj4l2lPwPVWHpz52ILyI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1dnJKAGX9Xh1ydNVrfAhDSgCMtYbtcsdFn5h1bzsAWOfUOA+J
	N3hOlJgeZ7E1z8GW4q+O6zpzYZqpIw5k2q61SHqlnhl833cYsrggU6VEjT4czQkOuLA=
X-Gm-Gg: AYBFou1GrvUx1cobUaxcehRQoXSscLaF5trdDh1zdz7SIxofFMpXxkfpQ+c2hE9bXrt
	Ut8TE+k42xV1bzGf08giZF4Oj2zB5w85MrZIV7PvUt+/fH7rwzSvcmnkrQHQVKRml+Hi2V0n1mt
	6XkwAHUyNtdjE8WCNUMRl9tP0LH9NJmxX9wozeL/7au12lfwT2XipUpMgTvlOqe40rKmChGpTJ/
	nNk8RUH1Eti3vLmn2fhXmtL7wAjETDbP5fzucdvFDeHWVkrUOXOFvI8xfzZglB2xsXzORbPsN81
	eVjxLItl0cRyuxRvVzZVOZ1CFv1NR+jKjNmxrxHPgxz1y91xD3aIstMciCt92PWxwhZNt494DgD
	1Pc3MUCAFhPNw+tN+mV/wfTLGlYr5n3j9KejAi/SCG3DHeC2mMwrki2Rp4OrnB2+47MjVBY0Ow7
	7Bexqnq2i63XhBMZOh4SgMpRvGJB9i6UEOzj+L0ddxVzgy8lUfSElPzvjpQaCrEeY3fmR+BJmCC
	YElH8eSFfS3WHPwcSdHgQ==
X-Received: by 2002:a17:90b:2ccb:b0:3ab:1af3:a0d with SMTP id 98e67ed59e1d1-3ab3ac63ba3mr2640667a91.33.1791582872747;
        Fri, 09 Oct 2026 14:54:32 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:7::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab397920b4sm3032876a91.4.2026.10.09.14.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:54:31 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [PATCH net-next v2 0/2] bnxt_en: Fix SW USO padding
Date: Fri,  9 Oct 2026 14:54:22 -0700
Message-ID: <20261009215426.2377946-1-joe@dama.to>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings:

As a followup to Eric's fix a51d233ccd48 ("bnxt_en: fix DMA mapping length
for padded small packets") which fixes padding for normal TX, this series
fixes padding for SW USO.

There are two cases I try to address:

  1. The last segment could be shorter than BNXT_MIN_PKT_SIZE. So, add an
     extra BD if needed to pad to that minimum.
  2. The gso_size is so small that every segment would be shorter than
     BNXT_MIN_PKT_SIZE (under 10 bytes with IPv4). This seems exceedingly
     unlikely, but just in case, it is handled by clearing the GSO features
     for these skbs so the stack segments them.

Patch 1 is a small refactor to move code into a helper that patch 2 uses to
avoid duplicating code.

I ran v1 on a bnxt machine and re-ran the uso.py test and it passed, but
the existing uso.py test doesn't test this specific case, so running the
test was more of a regression test. There were no functional changes to
v2.

Note that I did not see this issue in production and it should not be
possible for QUIC to hit this case on either ipv4 or ipv6 because QUIC
packets are at least 21 bytes. AFAIU, only ipv4 segments with less than 10
bytes of UDP payload can trigger this. As such, I was asked to send this
to net-next.

Thanks,
Joe

v2:
  - Switched to net-next
  - Added a comment as discussed with Michael in patch 2
  - Added Michael's tags to patches 1 and 2

v1: https://lore.kernel.org/netdev/20261008191114.3736826-1-joe@dama.to/

Joe Damato (2):
  bnxt_en: Add helper to fill SW USO payload BDs
  bnxt_en: Pad short SW USO segments to BNXT_MIN_PKT_SIZE

 drivers/net/ethernet/broadcom/bnxt/bnxt.c     | 12 ++++
 drivers/net/ethernet/broadcom/bnxt/bnxt_gso.c | 61 +++++++++++++++----
 drivers/net/ethernet/broadcom/bnxt/bnxt_gso.h | 15 +++++
 3 files changed, 75 insertions(+), 13 deletions(-)


base-commit: d8674294aefef02266c4d47ad10131f1bffbe534
-- 
2.53.0-Meta

