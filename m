Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450361;
	b=KMSmG+jdHuPha+VRtDE7EaS1A7mE19sIeTkU7hPC9IqmzwundX7rdFhFWboZmxH4eOZE
	 +9RybJjy1e68l7SCjS1scqm7bjizE8c+KYhBo7SWvnRuBzxTD1U3hFPJRterSOUa3tYOG
	 f+0Hsq/y1spLKv04eVcah0IWBTPNBqtSPyd43O85CtzOwSwjgfqSS6WF2Wve4IHdR3nen
	 h1wyw9kNci6mPAUKq+KcJpPp3qsgNlwWeOp6hz2YupY+TfRgvu7bNgwECO3rgVPCUmISV
	 7xFmVRQSf4bQOhszi0Meur6MdaRn9xOMkssnbQxmKT+US5ixHTN100aHydAqH/RINEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p+SP5aC6kFf2m6+Y0UAcy1XbuoZimqxQ+Qboov/RQdw=;
	b=Op2VSdjbPrM7CyeEqVova0KVO4tdtkYkONdB3cZThhyLPuSTtzvZAJ9msWAyO+0qQTts
	 AUjRfEb+GU2IqnBQq5asdUu5BW07QtcfP4OByuvez+l9DLXWanITPLDyq1pJT8xg7G0Yf
	 3bKuU+ujYp3c/DJYxohrLhxg+u6aPt82RrHk+KckSSZ4HnLZ9hPtLGclVU5u0swrFNXJL
	 V6kz5k/0IxbNzKwpGSUIFjQitpeQyb9MSg4wtmCGr7vfe+BrKwNTnWfa+iRsdim19XyXh
	 NTFYvQWXKBGd/0UG9G0fLtjoNNCk4dYTTGx5Crb3cPnqIdNuLAL1kGiX7FPs68n6JVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKL4FZYZ;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6080E606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6080E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKL4FZYZ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a2551d7b5so3419496eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450359; x=1794055159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+SP5aC6kFf2m6+Y0UAcy1XbuoZimqxQ+Qboov/RQdw=;
        b=xKL4FZYZxZ2DMFO63mud1fJJvL8ljHKd1cSzKueTBjZ5KWdT9ssOnP0v+oXC+Q0hZo
         Qs+PHJ9Klrp7eA+ZXpy9jf3Dvec5+bt97LOlRXjZ2Q/ZQk3duWOE8JWGvfSgl57vgWch
         JCwhFXX9MgJGW590FuwNWfZumZRtLkpFT5T7+6Bz4lAo+aIOdOUI37/Kc3CAmRyY4HcK
         W41yN4QDz1O5X8AHfcEF+5+xoVAARl8Hp+FsH+KuRBB/WuH0FK/KGowokkDV3UY6/ekT
         v7y6LWO5F42Vjer5ob4L76hFwBAGTlmtyimH5jt8uYFW8EL+iFHLnr9Tu8b/QEml5OWf
         mHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450359; x=1794055159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+SP5aC6kFf2m6+Y0UAcy1XbuoZimqxQ+Qboov/RQdw=;
        b=wHekrQTO60x85bqqpYBmvzwlOvR8zaZ4oXHTjp42kW60GDTk8tfCi//ahUiYLnliKg
         jqO3QbzeEma+0yrn6CGzovtLxnc3EptfiRgmLmxuqwbykvAVrQsH62MKVpCtdqsh75XT
         Y3cvZ3MbvWLXd7Ui0O1Nunw5AMSfQaZJGmdmpHAQphkB0b1LPt6dM7/kMrMoyxsx378B
         mD/z3r5v5lvn6XuzA3KWXcfZXII7Y9Fau8Alw6i8LbPkClECe6ovI+fA+QviPgIZ3Z1U
         eLsZggxwkDA6a2lMtr3LxggmmOriHf5cw6X3fyiAUnX446CuMGcwHR0XtjoL0CxZbknY
         JbYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJaUAF8ZWVN662/BX2c+II9MxU41W3fSe1gSsGVBnJehhlsDOXYfUwRKXLD/MuKb52IC5r74g0bGpnUJ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJamIJO3G9OVvRmaB+nv7DczcWz9ah8SaiKnhuy7NxWAUmZuKuR
	qk841XRUKRWq07gU+/ywaYda51gl0KR/1vfjUxNxQB3G3SdZZV7/RPet
X-Gm-Gg: AYBFou1F4911I3kXMOr3Jq9xb6sITCQeaeZjBZSET7Z0hFd/4d2/D86L9ydysCTkT/7
	HXyzh5p3jf6WSgDI09Um2J5UA/vzNWdpQdeIk36mDjluK02hNLexv0PSciKwH6rtBz6p58wo3IF
	/91XywI3O/c6pS3IHaphQLBlhPO6jBLhDFIzQfTwfHwogBwueM4YEH5EeIy2vPuh2rCxUx+4dOq
	0cCrB6CDHGvsG19WdXI8bsOmqIZpnKkgfdacXUIKBtjfokcd1/FGNzFms6vuplEVvJFyZ8GGW5R
	nsZAgmXyhOlLFZNBjUUKbjoXkK4s62+fXWnYH3eC1wUvbdb2JDtwW5v5bzF6BsYl3hvgAAGpqyw
	kORsAkoqlHSidByUBT4Lz9EGCCChTdCIQpzFs4mrAXI1Cj+i01pQMZJZUqumykOnEs7gvmfMLhd
	7ilZjiQ8SumNSBYio80e2gy1JCswWWAw0So+qNg11EeJaN7vWAm0A0kIrlDrlZZE82deLQ6xyh2
	ebXrvMZkK5hIDMK7h3km31I7ItUBx0PZLBjX8SAMaxa9eZV61hrzOUqLlgvWsHXYvOt4ljrNbwn
	IKz5IwwA3tQD2ZyatzvEbMVztH4OaE1gIfv8HoSq0mqfsaFEtfeA/HV7d38GOmWp6mMQi9y5V3x
	Ba2OONOeO5Px4i57M8UC5oQIkOyeEoJhzEk/vuqGLoHrtVM0sWFKw57eEir9y/WYyAr9Oqxa+79
	+ZcMTb1d7jM2M/sQ==
X-Received: by 2002:a05:7022:f507:b0:1ab:90a8:87a2 with SMTP id a92af1059eb24-1ad1077e9a6mr5123543c88.11.1793450359362;
        Sat, 31 Oct 2026 05:39:19 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:18 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] serial: fix TX kfifo underflow on flush in five drivers
Date: Sat, 31 Oct 2026 12:39:06 +0000
Message-Id: <20261031123911.3784690-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031004733.3345841-1-samarth.colleges@gmail.com>
References: <20261031004733.3345841-1-samarth.colleges@gmail.com>
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

This series addresses the TX kfifo underflow reported in the parent
thread, where uart_flush_buffer() resets the transmit kfifo but a
completion callback from an earlier DMA transfer may still call
uart_xmit_advance() using the byte count from before the flush.

The fixes take two approaches depending on how each driver manages its
TX DMA mappings. In samsung and tegra, which map the TX buffer once,
samsung's new flush_buffer() terminates the outstanding transfer, as
tegra's already does, following the approach introduced in 8250 by
9e512eaaf8f4. A completion already in progress skips the kfifo update if
the transfer has since been retired by flush_buffer() or stop_tx().

In sprd, msm, and pch_uart, which map each transfer separately,
terminating DMA there would leave the flush hook to unmap a buffer the
controller may still be reading. These drivers therefore leave the
transfer running and mark it as flushed, allowing the completion
callback to unmap the buffer without advancing the kfifo. This means
that the data already queued for DMA before the flush may still be
transmitted.

All five patches have only been compile-tested with arm64 defconfig and
the relevant drivers enabled, including pch_uart through COMPILE_TEST,
using W=1 with no new warnings. I do not have access to the affected
hardware, so testing by someone with suitable devices would be
appreciated.

One race remains, which is also present in the 8250 fix: a completion
may already be running when the flush occurs but acquire the port lock
only after a new transfer has started, potentially mistaking the new
transfer's state for its own. Preventing this would require tracking
individual transfers, for example with a generation counter, which I
have left out of this series to keep the changes focused.

Samarth Narang (5):
  tty: serial: samsung: fix TX kfifo underflow on flush
  serial: tegra: don't advance the TX kfifo for a flushed transfer
  serial: sprd: fix TX kfifo underflow on flush
  tty: serial: msm: fix TX kfifo underflow on flush
  serial: pch_uart: fix TX kfifo underflow on flush

 drivers/tty/serial/msm_serial.c   | 19 ++++++++++++++++++-
 drivers/tty/serial/pch_uart.c     | 27 +++++++++++++++++++++++++--
 drivers/tty/serial/samsung_tty.c  | 22 ++++++++++++++++++++++
 drivers/tty/serial/serial-tegra.c |  8 ++++++++
 drivers/tty/serial/sprd_serial.c  | 24 ++++++++++++++++++++++--
 5 files changed, 95 insertions(+), 5 deletions(-)


base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.34.1

