Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9470947988A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392914; cv=none; b=DEHR9KS3XqAx7Wd6+ClsqUlAQ/P+WL5flk/0vW3yiL6jTcBDBM1AxaDKZE9IW/XooPoOeOuZFAgCGiu4DbkirK6/1GKFJ8Dwemai735qa3IPg2gvE1xNb8sEFbIp3pFGSD9SLyFaD1K1Pteu4NyyaqcOpluy81eunDnMVCe6Yro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392914; c=relaxed/simple;
	bh=As8oy9p2U/FOh1PZBgbp0wxjF5Af6Hqf36eaXKu2y40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aXe9j6AsFDZw/JodQtsPdzXo5vuIOnfpti2Or4Bff5lY3P3PIJnRgX3kUAyzoaWEosbSRxaoyCjvOEP3m0QNNn8RtfK4pUO4rnpFT8y6MklpGDf4X1x0uPZechXexPsaKkTws9dvfnlA8BkS+jjlgtpKPUjqTU/UAk4KVe7FVxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAUSGS/9; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAUSGS/9"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55eff0so237782366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789392909; x=1789997709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zyEGDSNNvqXj8TlYB5ZEQxBeM/jt7zrTDK+jYodDq/Y=;
        b=nAUSGS/9yHiei3VffWSNqXD8eipwnkvS//6OlDiywilpmu7TZau6XMLsaZ66ZPetOK
         vi2OngSzZ2IPxbPXm4K/C/2kx+PnPO3YChcACfQvqM594DQte6BEZmziHZL/eigW/7wG
         BxzDZafUd9h8JPhPb1Gx2KzPD5/xS+5UKZQv3EnZpK4WOlUjFQqe6DtkI2AYkBSRqCrU
         9TaBhaj8L5SgNRBfWGBqpdw8EcLa6jSqfThAXX+g2TpjW+uUciD7xF4tpHPu7OhM9S1/
         mNLMlk0ju808u+BNjhPPVc78p+5KbLb7zJBBE/Z7IIO+wvsClajNboLXjELwB0yJg1+T
         WNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392909; x=1789997709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zyEGDSNNvqXj8TlYB5ZEQxBeM/jt7zrTDK+jYodDq/Y=;
        b=dB0N/35LUyAbFNKuYB7mYgE6dKmtEHF+6nxar8nk+Km5grH/pUabRZASREita/8OsM
         kRM/7APrH+xvMVwGuAXL8Jr7mTLThcSSmN+KF9GS/Sd5mkVqDuHsFQ8ZSaeRLdSCB0ne
         SeQcw1YdlgFTNFsFUBtBy1B45ZesICAZguo9VHtACiBnm/Oy4JlmQSMuQWPSz5kpyUT1
         toeQrxakt0EA8eoK/gUYFAKScJDHVxKZQqfwnAc6K3qDGdvh6rgjqyuoeVmQJ6DutLVS
         /hgpR0BPwaViDsqfuY379wkQAntRfPkTXNbT0ureZ0KmUHvXSvsohON5lP/6cZje2/MU
         mPaw==
X-Forwarded-Encrypted: i=1; AKwUvBwj/OVTCMuUhdbE8LyhGh8oaV6dGW7H4uakRplDqpNEApM85qxoeaxh+WCYip7pOiWWv0FUyrZFzLoB2Lw=@vger.kernel.org
X-Gm-Message-State: AFuF++kDegVS7uqvKxQtcfqWj683WMVyJQ+Q09rpeeUHrJhOjEwYo8GE
	GzBJWgqBVmpCCVGddMsQF67TqHJXBOwtz3551xnTDsjWORJBc9tqMjRvW0V+iQ==
X-Gm-Gg: AYBFou03224jy/1KdOQ+B0M3tMsaXobQxWWUmNTSNGWA9sKBk8IyuzTL47nb0QGi4xu
	+ZxxT+rYyfQ5W/hwZNoaHfHSUjj31Jz/7j6oCAXisx/5i6vRBXriE7yzxVRTr7DCR7rIInlHbjJ
	BWiM4lc54wQ3uBlLctGPzhpiYkJXeoy1oYRMSwJ0fDyIDMzNRzU4NdAZFThOFlM5lyO3tDNCbuT
	UL6KpsSAgS4f8muriGMOkKPmb1Nw3o73lWynOfKRjmzpFkSOJw0xUJp7kdau2HFM8Uz+seNAznH
	wUS8hrb3Esg6w+LI8FxNvwBxvWwbmgOGD/SUrZg46EWxLdWHxvKN2mrvCgnreztrIjcN1aL7J8L
	O0SzvDn/FhYMAxi1B2/HsPfDc4XK7pLAGPGSEHKCH9RTMndAUF+d+CJEYy5UtHlQvPuMmtc7lOY
	C1d1phqUGwSeHW4FNfgccJ7EkHINJX2/K4qYhIaInC4efhTQwe9Jwptywzf09TqA48nRvSpQaW9
	K0vPxT6Ud8oCXwPcqKE9S8cfY2vb/Fhyu7HEX6nZ6TbC1SsHwLVR5Fs0x0=
X-Received: by 2002:a17:906:c103:b0:c29:6136:9f66 with SMTP id a640c23a62f3a-c29b85fb069mr157357666b.14.1789392909068;
        Mon, 14 Sep 2026 06:35:09 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966159c07sm441454566b.63.2026.09.14.06.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:35:08 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2 0/2] tracing: Fix buffer_meta open paths
Date: Mon, 14 Sep 2026 14:35:03 +0100
Message-ID: <20260914133506.4865-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes for per_cpu/cpuN/buffer_meta open. The first drops the
trace_array reference under trace_types_lock on the error path. The
second fails the open for CPUs that never came online, which would
otherwise dereference a NULL cpu_buffer on read. With the second patch,
that error path becomes reachable in practice.

Changes since v1:
- Add patch 2 for the NULL dereference Sashiko reported on v1.

v1: https://lore.kernel.org/all/20260913133829.15307-1-devnexen@gmail.com/

David Carlier (2):
  tracing: Take trace_types_lock when dropping the buffer_meta reference
  ring-buffer: Do not show buffer_meta for CPUs without a buffer

 kernel/trace/ring_buffer.c | 3 +++
 kernel/trace/trace.c       | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.55.0

