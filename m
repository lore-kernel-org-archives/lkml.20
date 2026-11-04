Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793766939;
	b=g7QaK6Upx+JdiPXUU9HJj1HE99CA1yCO5fv5hrUIU5BdFbmwDxGBmBF51mz8X+F7fgJJ
	 +5MTBCkrEoYzPpp4qe1cWu4dV3Eeg4JZUSp42B1jMSHyhXv3+IaIh1hOPcOp0Cg5dTRHc
	 spneV5O8df/d3X3P5k0MUpkT+FaOaw6neXMTns+z5uZ29ninaIlexDGLQv9zHPB7dJ5gG
	 sI4eDjbeH2k4ug7x1v9hSrFHUBUNzUITKAm1RQcIkMA5lE8RR+dJeJIThex2Sfekl6hp6
	 GUFGljdFw4nksKy1wI45LkZJCVXnWzl0Ooab2l7RIWaarxGJxGPVM22eNxsSJdcNTnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793766939;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W/RawqYH3cIEJNIGeE74Vl+KIbH3cI8A6QOSk74pxNw=;
	b=Y0Uvshmlq6kPaMuQsnzl/juVY0DKZczNOGUqY21vNkURZXuO/FEYnw4Nh9BzrCZWr9h6
	 ihGtA5WUh0ygkTE/y9ov1gDO2PbvSN5bYLFNGRc5fxCJrIzfdmqk/h2BkGHZKGPSa/r/f
	 zfgxhiqbssv8DQEEHg6HRg3Go2T9qVUjuPDfd4BihYrON46pECaySzZTcYiOWCH1cpBvw
	 AG023h2VlWfCqTQovPmD08mr0Ww4HRnExV8eS8J8xflYFCBj7L8H3VGu2j0oqYiTV0Nl1
	 iP1Rb+j9CGORxt/kVKAMHvCBxkBYddLmshY2W0oMrj2QGJj1gPYq2J9B0XQGVOxBxUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=brhbfGN5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CAA606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=brhbfGN5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CEF81F000C1;
	Wed,  4 Nov 2026 04:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793766938;
	bh=W/RawqYH3cIEJNIGeE74Vl+KIbH3cI8A6QOSk74pxNw=;
	h=From:To:Cc:Subject:Date;
	b=brhbfGN5/OrEgbSP1uNJpt+dD+JM+4foOXQtb74sX3V3hDQInCgnEJhEZY7o88bi6
	 61wCcQDlUw9JRnZm49x/Aanq7eEzmLUIp6JmfnOs3q2gCedA9Q9+32WGEyJc+tW3m1
	 dOKqTgPTVARa9v5kDkyD6tjFeNqMPFz8Xpc7lpHtOizBEqu/QIwJf+SSD7EqVN4SE6
	 S+wovKpnixw3WC1ZPHOVgnzKCgUvM3bjnlthNotisyaHw3KtOxiF6UhXNjPGvih5pW
	 KDdmeln8s2rPXhMyg0XNnbofmLznoxOa8CfPgzXCW0K0h+RYn/vfV/0eiUP/6z39pp
	 utq0cSr9+AQCw==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 0/2] ARC io-accessors updates for 7.4
Date: Tue,  3 Nov 2026 20:35:33 -0800
Message-ID: <20261104043535.2039948-1-vgupta@kernel.org>
X-Mailer: git-send-email 2.53.0
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

Hi,

A couple of patches that I plan to send for v7.4.
One is an old issue and other a cleanup out of it.
CC'ing Arnd to ensure 2/2 is in the right direction.


Thx,
-Vineet:


Vineet Gupta (2):
  ARC: io: work around GCC PR127718 in __raw_write{w,l}()
  ARC: io: use asm-generic MMIO accessors

 arch/arc/include/asm/io.h | 134 ++++++--------------------------------
 1 file changed, 19 insertions(+), 115 deletions(-)

-- 
2.53.0

