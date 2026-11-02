Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633511;
	b=hmdL8CBVn508Bi9w+coDuPHiLJd0l4SEkNNkAAMdBH78AAjA6K723OCtDrrWBFo4PloQ
	 zYc7vgefznebD2yWUhmSjNvQImkh1viv6IfFzi8jDQ11mwX/1oYEm+BWVmvF/A6xVne2w
	 AW/bLMX2h7iW6NKffMozP2aq3EQ/web351O7AW9EIBC4D2aW398e9Px4ofCQw5BqGwVhT
	 qx7+J6aeeST/0ri5MRVPNxrFkgM0+KGc9RLqgHs53r4eltJRfn/UwZEHNDKAA58E/kbWm
	 +F5ucRRhcxd9B5hZ63X/JyEOt7NGjhthvHtQqKjpjYrkegbk3uwlJ4xO2ltYy5AFg3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633511;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=ZSG+XZ0qJP6XeItaA48g0VFugtl9Yrf3DKIbb0+bgrA=;
	b=StQ0j2z49q3TKp6+kRlD/0nTmuKZj2srdWWPJmOf1JxKPDY40FmOtztnv7kdoKi1En+Q
	 Fbof9garvB3+JfxF4vtSwAyeNtLW6U5iFDoOtwrPIXOdegU0pZkrLHTQIDoyARw4HfFBw
	 kr7bgng0Bf0oWNFHIPJnz4Z9n/IEEZtHzB70aOkSdsAIFMAjabRTYEMyaEmzRKYa6b0X6
	 cgLRe8uePZEmNX5MAXXRWXkcq8u1KnA8vZ050MaHy7kdVKCB6c8KRaBgVMgQa/rKLpqeJ
	 CcTvifluKV+iUqElkGnSiQy5rDudm7DoVBEoDA07hbo5KUmG6YoA8yrAy0mtJraAaOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K2xK9SMq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC3F60722BE;
	Mon,  2 Nov 2026 15:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K2xK9SMq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B5D1F00A25;
	Mon,  2 Nov 2026 15:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633511;
	bh=ZSG+XZ0qJP6XeItaA48g0VFugtl9Yrf3DKIbb0+bgrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K2xK9SMq0qWDFEeHQkMKbhnKE7r/1ZYbeJs+QVd1HX3l7hBWrFxL67IiI4Xzms3b2
	 iay9mXOi2qwd9DYXUVg23Ud9Jip6R3h3eCtPK0UOATneie4L/zdQFxdQi7IypT/ub4
	 slk6oI317WDZ3AqMUr2tI2bVXGPNR4De8psTG2T9vWpaI6sadpwHAS6R2kizoOirJu
	 HlTpBMb2gP9gIDnr9sFiIeBbKiDN85h8/i/nt3PlRv1gMJ4ZiXEVpYPOK/y6rialyi
	 HtedojKiJFnP/gI1V4n52aOMbIGsioYcRVF5hMmJ5EVj+I9YOxHJxK/iEAdMf088y2
	 Zt5fbG+gRPOCQ==
From: Thorsten Blum <blum@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Scott Wood <scottwood@freescale.com>,
	Stephen Chivers <schivers@mandarin.aust.csc.com>
Cc: devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH 6/6] powerpc/embedded6xx: Drop redundant initializations
Date: Mon,  2 Nov 2026 16:30:04 +0100
Message-ID: <20261102152957.300019-14-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102152957.300019-8-blum@kernel.org>
References: <20261102152957.300019-8-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=865; i=blum@kernel.org; h=from:subject; bh=RiHJeens/IMwaUmE7MVJthRKIR+M4XGfT2WVpk9hsHs=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkv1rSqm/bV+Ku6Mn+7WDZ5K08dM8tcLoO5Z1kertqWu P+epOHKjlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZgIy2FGhjkhm59/yVxaErZb eu/n7Xo2aq8sbnAl70s1/bTo1/7dnbyMDOdMLa5/e3Ohfvnl/dnW+3+x1wmsYDKz9SnysIuZ99/ 5IBcA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The variables are reassigned before their initial values are read. Drop
the redundant initializations.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/powerpc/platforms/embedded6xx/mvme5100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/mvme5100.c b/arch/powerpc/platforms/embedded6xx/mvme5100.c
index b6b4d0581fa9..b8a59e147dfa 100644
--- a/arch/powerpc/platforms/embedded6xx/mvme5100.c
+++ b/arch/powerpc/platforms/embedded6xx/mvme5100.c
@@ -53,10 +53,10 @@ static void __init mvme5100_pic_init(void)
 {
 	struct mpic *mpic;
 	struct device_node *np;
-	struct device_node *cp = NULL;
+	struct device_node *cp;
 	unsigned int cirq;
 	unsigned long intack = 0;
-	const u32 *prop = NULL;
+	const u32 *prop;
 
 	np = of_find_node_by_type(NULL, "open-pic");
 	if (!np) {
