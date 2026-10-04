Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0623E212FAD
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 14:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122420; cv=none; b=QvHa8gxjr93xY635shqAkfSweabK9j6cZU6ZdD+NJcYeRvXVRfxIG3aTSCgB+OeHdk7HnrF6cBFXlgXsCCF4s2M0lYtKUM+elQWC3BYd7p4b2bsO0RJ1Xs7OY/c4hjXidzreVvQC/3zpuCr7iO5fiIuBQdgr9KeK+32UMw35vFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122420; c=relaxed/simple;
	bh=M7G/69YDl6UxRKlMCZubwH5wKehLjiqi6b/OWSUeyIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z0S6u01tGKCYFWsPnrJ5gfmHO2m/P1XiqT63UldgXxFl/ygvQn3gKm+g6zRuOjSbvdVOQdu/yyvK/9d1kebZDMhJ8kUWUdYNrmFHjODyoproFqRDiQd6oo93ihrNU13o8WLJATF+oIW4VDemK1qtoGu/sRsl9LNxmRyt6CtDbkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=a/juIQiu; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="a/juIQiu"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso9079045e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 07:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791122417; x=1791727217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7G/69YDl6UxRKlMCZubwH5wKehLjiqi6b/OWSUeyIE=;
        b=a/juIQiu1iPkaqkVtGjm6kutc1d12T4Cow3imMH8s+i8AGaUdYSdFrFI3C7qTaRek2
         vxCCcbqXGVqNOJdZnBr7HLl8w4o3mghMe67WvmSAc+VbNSz/OFM2RUWyhon60g4eT/7U
         sOzO3XSnM97QwbnVbiot4zASn3EvUlSTNf2yDhX1MllEC3yCceyWKKkUQgCBWPiHuthf
         1O8m9iVrokWaGg1YHvv3/Od6c0LewAqfxNPw2Pwvnsrww9WqzU+QxtfEiNF8U5yMI6M5
         jCaxdHC45WP3oR4PQTK73SHEsGYFCMU/XF0fE3GlqTGV/dOL9GGtGLtOv8JyKpyk+6JD
         whLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122417; x=1791727217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M7G/69YDl6UxRKlMCZubwH5wKehLjiqi6b/OWSUeyIE=;
        b=p09btSUSseGm3ikktJ+TRFAcwWbljzbT2jYKT+HgqtPkrxll1ixQG9/NpUTmaUFArn
         +P8kO9fWDjLS14qBrMGURck/gyTpe7pPKcSNjjm5RI0ZaQzUmmRPYBMg//Sn4jn6cyI6
         Mup6NuGP0BOIuzZTsvrh9W9DkNKlz0clhSYX5UPmfWrg0Birjz0rf7EtEO4zncZRlK0N
         WxQodMCSycjU6XEzm8pIAbqFdLEIFMntQZ5Irfh/u32zKZW1nr0W5pJZ65oguLKi1Lj2
         SfzxvTJ1cnZdA7r02ceoDl4+1cPc9/vtH4b5Gu62fx5I2XsASnapFWlMWk5rb0I8zi21
         MRaw==
X-Forwarded-Encrypted: i=1; AKwUvByGjsLwe/nAIhQhuuztFtBFErksX0LudEZ1Qkm4g8QhKzhZrtdKdrncGF/kprTru0+bDgsCztOJ0qN6NLg=@vger.kernel.org
X-Gm-Message-State: AFuF++nyX/5JJGRitVP5cckJY2puoxHK6ozL2VQw6xzOlvHsXjOUgd5g
	lw6QYXGgAccnN4vmLIFIzar6+uSwComgFJDHzteJvuFbgs2OQYradrPFoNU9ayby3e0=
X-Gm-Gg: AYBFou2Ra9T7AHQdmfbjtk+ZS+Q7/LVcQ7Cjr4R20UXo8MquTuZLRMA+PyTIaTmJPet
	PaHn6xewFp9xqKBaKlzEPq73GsMNaV6klX4KcATQUze7crScF3GQoTPbl/w1L37EEShvhwQ5DDf
	vbnmrO2Tt0qKP6DTDLFirCIsmxC3YvoaoVHj7OmaNE74TimaQxC/eNnxYB28O47L1ujetqILloW
	EJtz3eMFB8aNrOazBxNerBrC/jXgqtf8eR3qGXgQc8oYcmylyWMk6TwbDjjwo+qRuJTFpwara1x
	ix6LA2mj+VyStacIQZOSXnwi4aMhvaKjVjiwrW7jU/IAsznxKmL89qO0ElTLuYG3RKzoaENLvf+
	RzftJFlmtiFQeCG4aihDH+oEGb9cKl6v1RguSadOjFuVa5W9XZgoNsgNOqOHDEwfkUpx5/U6NFD
	Z1wSICNLQTv1bVGKeEpzEqWOa1CRIpafgIil4OgtlnQACrFD+vzOeeMCalAQP+C2za8iFLiX4Cs
	nrBfX+CfBikv4zlI7/GUryo4L3LSrLjfbOnpN9YY6503ywY2SXqp8R7QUt3IxwxuWwCVshQ93Qq
X-Received: by 2002:a05:600d:864b:20b0:49f:fbad:29be with SMTP id 5b1f17b1804b1-4a0276afda9mr95240495e9.34.1791122416978;
        Sun, 04 Oct 2026 07:00:16 -0700 (PDT)
Received: from localhost.localdomain ([197.51.72.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8ab4sm17450227f8f.35.2026.10.04.07.00.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 07:00:14 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sashiko@kernel.org
Cc: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] selftests: net: add an amt test for UDP_SEGMENT through the relay
Date: Sun,  4 Oct 2026 17:00:06 +0300
Message-ID: <20261004140006.93394-1-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179106416321.434549.5874142465613964174@kernel.org>
References: <20261002212458.34247-1-omar@blockcast.net> <20261002212458.34247-3-omar@blockcast.net> <179106416321.434549.5874142465613964174@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Oct 3, 2026, Sashiko wrote:
> What happens here if one of the sniffers has already died?

Agreed, that is a real hole. A sniffer that finishes normally always
prints its report and exits 0, so v3 waits for each capture on its own
and fails the case if either one exits nonzero. A tx-on UDP_SEGMENT
case in which no GSO skb reaches the driver now fails instead of
skipping.

> Should GRXD be passed to check_err, or should the commit message be
> reworded to match what is actually checked?

Fixed: v3 checks amtg rx_dropped, and the changelog mentions the plain
datagram cases.

> The busywait return value is also ignored here and in run_burst():

Fixed in run_burst(): a helper that never prints READY fails the case.
wait_tunnel() still ignores it on purpose, since a missed READY only
costs one of the 40 tries, and probe.out is now removed before each
try, so a stale READY cannot match.

> Can this multiplication wrap before the total > MAX_DGRAM check runs?

Fixed: main() now rejects sizes that would overflow the buffer or the
seen[] array, for both send and recv.

> Should that be reported as a failure instead, given that this is the
> data path the test is meant to cover?

Yes. A tunnel that never comes up is now a FAIL, not a SKIP.

pw-bot: cr
