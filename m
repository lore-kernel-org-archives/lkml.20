Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592830;
	b=QISvqfJOacsXGD2cLV0Uciloo+IgPuNVREbY/e8zygNVSiqt2GRGl4VpjanirTRUgvvv
	 a8AeArdyBemVhguo2QeFKtopCVGzyEUMLc+eaNIypUP/QBCo/geF2DfobeLtM+gtz0YEj
	 wDml5I/YTb1jwGzumTdfFw03H6andMeWr1dJ3WR6ceFcCeUkFA7bBWiGWFzZ23jXaeO3B
	 yQp0FjEIj8KYSq6gbJG6hglE9RREdI92zDCWs/YPzwIJLxvFCEDX+rpwu00++iZtRHIRl
	 zS2ZfokYVDlI3J8QSLVKWDnEvu1Vhrvctw8PlvI+0Nc0/0y4Cn0Gp0rpUHpAFlvZmtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592830;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=nemyRCLY9K1MAuQq+GBVqsAFkknGZXCyJc4NQM1lADk=;
	b=Nn2bGdIKCAa591P/YWA4/KQJDWJkEWkwEkVHYdurMLFy8/hbwBDer/yIn7thOgtvgqW3
	 hjqBVrBxJfW8k+++UoUnIy+8WfcKHtxsFJBbT1yMsEYdscCuySeGQHmZWZjm0aDfeYfky
	 c1Zz9H9G+h/4reR9+5cwQ2XfSu70Zz8uGuKkGJtCPJZiunHG9fzjjTztVavka4WvpMKNk
	 /LaBwtt5gr1jy5nKuZJxy8akIxyvxQKCcNGQDAjV9lNzHPOjv6sf0bWocOMRc2dOLK9kS
	 dnskGuneaikyYqWcpqBC0JSRsNfWHSVg/T89EglLo2h3bP5cLP7drSehmlIWX9R6EmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsMwHfLG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7AF606A884
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsMwHfLG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2DF1F000C4;
	Fri, 13 Nov 2026 18:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592830;
	bh=nemyRCLY9K1MAuQq+GBVqsAFkknGZXCyJc4NQM1lADk=;
	h=From:Subject:Date:To:Cc;
	b=IsMwHfLGQ9OqtczQhmMsm+iMvrRKWsu7rzdqbaGDjSLqnMi6J7n9h0DpQsim5qnqH
	 j70FLmY3a7Ae3iFiHkCIWxjkyvTIzDX52Qbq1186a23SFqkD+5AeMhqg04IiHQakzc
	 Fk+CceB1yMWiO7npdz7WFsTcuSo72B2snsUo3/l2shIa8+PhouN/J5VRlMi7hP3Ez1
	 Ib1YitzZaN/tGyqQortSYPw3O4iuUGc4YJVpOhxFQNeqIPj8H5Xy6Jc57kyVFefKbw
	 c11Ywcmw/BkJ7VUB5pJ2smz8Xnuu6dDDKAS9Dzp5+vqjz1cTF/HDZO74OmpdVsnwdh
	 iX1DrRpG5gPTQ==
From: Vincent Mailhol <mailhol@kernel.org>
Subject: [PATCH v2 0/2] x86: Add CPU vendor dependencies for MCE and legacy
Date: Fri, 13 Nov 2026 18:59:56 +0100
Message-Id: <20261113-processor_select_is_not_an_expert_feature-v2-0-ae630b1f2e28@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQW7CMBRErxJ5XbeJU6hgxT0qZNnJJPyW2On/T
 gRCuTsmcIEuR5p5825KwARR++KmGDMJxZCDeStUc3Khh6Y2Z2VKs63KutQjxwYika3gjCZZEht
 isi5YXEZwsh1cmhj6s6vNrq03Bk2tMm9kdHRZv76PzyyT/8mMx8GrwfibskR61pR3At3EYaC0L
 yJTT+FjcJLA6oE4kaTI19V+rtbFS7T6h+hc6VJvjfnyrffYuN3hFxxwfo/cq+OyLHdaw8g0JgE
 AAA==
X-Change-ID: 20261030-processor_select_is_not_an_expert_feature-4f329d352ec3
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=WnCo4TPBCuf/bnRqRxEt0bIWcrmUDhp1v3ocjzm55SU=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFnfA2y0zor84I/ISeY5t1SC02f2NPnDoSZfy+IqZu78z
 /9y47f1HRNZGMS4GCzFFFmWlXNyK3QUeocd+msJM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 Ahk6RgxcnAIw1V6HGf6Kp7irBlzIjXg8pbOh8rfLJ75KJok9nrkTAxUzC+SWJmgy/GJa3PiGe69
 op8JpJg2BHYevhD/WEP5YUbbM5MqEX6WHVrECAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2

Intel-style MCE features and legacy AMD NUMA detection remain available
when support for their CPU vendors is disabled. Add the corresponding
CPU_SUP_* dependencies so that these options are only available when
support for the relevant vendors is enabled.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
Changes in v2:

  - Drop patch 3, which removed PROCESSOR_SELECT's EXPERT dependency.
    Update the cover letter to reflect the reduced scope.

  - Update the Intel MCE prompt and help text to mention Zhaoxin.

Link to v1: https://patch.msgid.link/20261031-processor_select_is_not_an_expert_feature-v1-0-6227bdbbe5a9@kernel.org

---
Vincent Mailhol (2):
      x86/mce: Add CPU_SUP_* dependencies for Intel/Zhaoxin MCE features
      x86/numa: Add CPU_SUP_AMD dependency for legacy AMD NUMA

 arch/x86/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
change-id: 20261030-processor_select_is_not_an_expert_feature-4f329d352ec3

Best regards,
--  
Vincent Mailhol <mailhol@kernel.org>

