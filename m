Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F423B4BB278
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005153; cv=none; b=I2wdNQFLWq/wdX43Yy7jxk+nAL3IXxrIHyK44TFBbWhhaOVP/uN6esv8QGeiozpKoprmIVjah5P9QRE9tsWF8FcztSC/4CTUULG/+57VRiIABBFZuGMIwVNu9R3PacJ6QpPeNDin0Y7kr+GPBjSHuUPzIw0diABTbv/trDH7zRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005153; c=relaxed/simple;
	bh=NpBp5RM3QWRJ9dwHp+GlV61NTC65LnnbLZ3T/gon2ME=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DgnEXTrH+rpYynnwaxzjsn8IjqL1QlNEwmYQE+l4o6gLLTul7pN0sF8Yti0vA+aspUkrj2Oy7qRYstdiI95nrKV/UjyaIz3MobQntAZlgPjEhGdAsVgGBhLOPjNkS4nYt+lVLh6mvBLVEsfTHYuXBZGKrlvggRm8czFkBWzQY00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mw8m4woP; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mw8m4woP"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469a34908so2820298b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790005151; x=1790609951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NpBp5RM3QWRJ9dwHp+GlV61NTC65LnnbLZ3T/gon2ME=;
        b=Mw8m4woPQR/iVt9n84Bopgd/F+EeMsNbzC4SX4efUtOZo1PBbgDfZybiPESC5WH7Yj
         DXsHoq+zmaURqLybkMP1+kwoMtMet5GIMZRTGWyZKgmQjw7pcufY28QvQMqLg+H4Cr/q
         DhGTt0HFSX4BOra072tpB0OSFPTpX74wRmigiDx8i0Th2bFE4eXdbq2VqRlY2TpvvWCC
         RD/kb1JyEy++cB8aESMULMlxtKDonsJa0K2Jz0tAXuGsrw0DgcJSZdm/m1rg8CPBoygI
         i6qJrJmVmci18kGPu1FopgMnUuGeVbj+cr0rcHan2sfky+dWhdj3bgaxl8ZqQiylTU41
         hDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005151; x=1790609951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NpBp5RM3QWRJ9dwHp+GlV61NTC65LnnbLZ3T/gon2ME=;
        b=XK4nOHRdpRrMnl1AOHVU/D5l3PR2kyYQpX5DsTZEgsv4GnR2Nnthrgdf+x0nUf6RGs
         x7f6i7DCOBVjqW81sxj9QN1F82Sqb3MDoZPrJvpEmoSSqwuj2MqIu3hXTgO00LdnHt5G
         VhH2G1AXZWZ6xEo2F8XiWq3CXLaj1dWmUR7Isl5+4dPDt1Q0i87udKdj48qTWUXLpJRI
         AWL8c2J7VZ95mHPYNUpY9FjbGUzQo0aS62EWwV+vxwmr8z75ghJroUUXa6hFdHltxuSO
         hCMNdSd24qg8leGxZiOqrzsLzECNUZGaIC6LqGJFf5iqLvEZE5ih1UMebnnxCx13djS7
         cqhA==
X-Gm-Message-State: AFuF++n8NGBf2aAJrOaokkY893PxWskhosmXDF4WtFjOkXtyafUZY7df
	EaWlaQ6Yw1/A+WTIBjzsLDViCvW9nT5XSk7HhfoqYkesOZ7vAmPwOXB9
X-Gm-Gg: AYBFou3QraTUwQnbgTXLyzmLSiI+xI9k3RkhQc8CBvc+Jg276NnSMYV+4Q73Q5YqUwC
	ibY6sdVhu6mx2NFfTTe02Fr+dvzUxxkrKdWr3uBkeQKkp76/iahsCwxpyKTARO63piJcwaZSjwk
	cVTL9mjuaUNScnlc3u4kq96JOYUOYjlsjWvqpVcyF7Suj8ORLlskWzBrvVfEX8zcZx5F1fz1Gtr
	zr2XaxNo7tbvVc88Xk3DN2m+JVKJm61p6zvmx4C42UOdcxKAG/ro6s1P/5eTNvvvDao7cJFkaK3
	i7UR19pT1aVkzlAL2MgV7kvXqx8NHqGW9VS/+h751ju8bSLir7ToFlFtmRlWkKFtYY6oilhWpew
	n/aLwMr2aRMk6R7+526/XsXi4Z4QREWj3tYZ2I1ubhBH/qOl5TrxY771sIvA8jJxCA4pUx5v/DS
	b91y6s4N3sebv1KptF6QIibSAgdQ7VqqjEnMcWPIM/KXKf9F1ziIHyk3nrL01fERsSAw==
X-Received: by 2002:a05:6a00:2e20:b0:857:7337:5db8 with SMTP id d2e1a72fcca58-874dd9f1d6cmr15473443b3a.22.1790005151194;
        Mon, 21 Sep 2026 08:39:11 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a6ae7d71sm3448186b3a.2.2026.09.21.08.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:39:10 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marco Elver <elver@google.com>,
	Jukka Rissanen <jukka.rissanen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 0/5] Bluetooth: 6LoWPAN lifecycle fixes
Date: Mon, 21 Sep 2026 23:38:57 +0800
Message-Id: <pm-series-6lowpan-lifecycle-82fab5876048c8c9503c-0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

6LoWPAN shares L2CAP channels between connection setup, published peers
and packet transmission, while teardown also schedules asynchronous
cleanup. These paths currently disagree on when channel ownership, peer
visibility and module lifetime end. The resulting failures range from
leaked or unusable connections and peers surviving disable to transmit
use-after-free and execution of unloaded module code.

This series establishes a consistent ownership and teardown order across
those paths. Shared L2CAP and workqueue changes provide the lifetime
guarantees needed by the following 6LoWPAN changes, which make failed setup
recoverable and stop users of a peer before releasing its resources.
Keeping the changes together avoids fixing one lifetime while shortening
another.

The timer support adds one ordered workqueue per L2CAP connection and
serializes that connection's channel timers.

Assisted-by: LLM
