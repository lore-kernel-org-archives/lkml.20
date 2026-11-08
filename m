Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169337;
	b=s+e6BLevnSdMqQdAt04SU2uC3H3wp8Ai1/lXE8WOXSiqL2kjZc43R9VZjNx5RUEdo38i
	 8m9SFsR1/NyuHnIKFm3mKO9vjU3GgrmJJkPQPDk3/1MF5XIQ4i8065odf2djFvjHpNPPV
	 YoK9wYthVbvbmakKCm0H0y/XTuJi+Qt3MavRLuVZUG+UUW1XOionTNahmn8gZw632lTjK
	 JvSXPFWMHhAVsCK5FJeWOxr8vOaDWX8dXZjIkdejdpcLDrMYqdbN9/XUdCPl7lR/Wax/d
	 30p1dmkvkod4mrePaVKx34yxaLU0Z4vTyo8POtVjtvPc2D+Tp4f7kOPcuJxDuWTj4Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169337;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uf3rYk2Sw+UtTo3L+NDO57CFXfBTdTmFk/dP4JckO3Y=;
	b=yKwItDbr68nCLNM8+QHzQ9N7Krp1ctqCBstC6G1D7M0g5ugoG4obyjXcZmpPCF41DnvF
	 pS3YK9lZpjYAT9Bv4EX41Wz3HgbgU0aaqkzJOvb7xGJcvpXPwVPMtBead3Vom+XB0fjea
	 paekHGEOw+HhNXaM+mKnIUDRjqOIXeMG+ULEiBbGP2wrLf5GT0evhHqIBh4cklvDl8a5O
	 UkMmInkPR6Z9mJ6m0JsM5xKS8ZHwnKIYTDVtMdKA9JvsXewUVWMBehrkw1shyG16vGYPv
	 4Mwcq2EP/9QE8Yuotk6yMMZNbxLqYWL3n6KN8FXm2N4CvjssTSP2EnhTQc+BlWXmXow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NGTMfBrD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C95608361E;
	Sun,  8 Nov 2026 20:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NGTMfBrD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AC21F00906;
	Sun,  8 Nov 2026 20:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169337;
	bh=uf3rYk2Sw+UtTo3L+NDO57CFXfBTdTmFk/dP4JckO3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NGTMfBrDMdzgu580P8ziU9ro5+FWbd023XZ6lSD7wxSiSNqAmccK518x4v/+tVKt8
	 qtxxvDGrlSGuJ2bCDrx7gPhbudNZ+4WcxAlkrqRJ2Y3sQk0SRYqk7p0lAIRGtNABN8
	 m8e3aS2q4nlxLRoqc7I5a+MA2TyOBiVbiwIl7/VYBsoi6Tpg7rXXKBtDm2+xsWIc2F
	 pcfXDrnhdg7RWR76blO4gO1FPq7maINdREzh5Pb1PPrP3rWg5aOxabYx/sLAYKRGpx
	 fexanmCkygNfZl0/DtKQItKf/9aw8s9Y4J5kDzUCZwSwIDj8pjycWr2WcHDBZN3n9S
	 mDELGo4BCwzGw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Selvaraj <foss@joelselvaraj.com>,
	Vinod Koul <vkoul@kernel.org>,
	Amit Pundir <amit.pundir@linaro.org>,
	David Heidelberg <david@ixit.cz>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Marco Mattiolo <marco.mattiolo@hotmail.it>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-google: Configure qup_i2c2 pins
Date: Sun,  8 Nov 2026 14:19:30 -0600
Message-ID: <179416929413.628393.5069651762479433992.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016-pixel3-i2c2-fix-v1-1-6a527d52c865@ixit.cz>
References: <20261016-pixel3-i2c2-fix-v1-1-6a527d52c865@ixit.cz>
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
Content-Transfer-Encoding: 8bit


On Fri, 16 Oct 2026 21:37:39 +0200, David Heidelberg wrote:
> Set drive strength and disable the pull on the touchscreen i2c pins by
> amending the qup_i2c2_default state from sdm845.dtsi, as the other QUP
> users on this board do, and drop the unused touchscreen_i2c_pins state
> that duplicated the pins with the gpio function.

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-google: Configure qup_i2c2 pins
      commit: 2935a52ea562799483f263876c368d81ef870e94

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
