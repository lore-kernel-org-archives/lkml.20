Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905363;
	b=qqm5kLyd5v+OyGNt8Cs8tQ08RbwmUtCOlUCNSxSUHvZVHjle498ftFj2v8tdO0DO13JX
	 xk41r4MRpH8sKvbLCiYpvXD/SIFeNdwtUHPddn2G0dhLCC+dFIJJr1/T3Neng1l7gvwc1
	 Vej3uZQUfZzt8tMSPl3asNWYenMOsZfvbdpTSTjH5JxVBXXw4L3usXsy5ltKFSBK1iqa6
	 YC940NNfLSj/ghFuNu4zQTVx+CESUCeJEjepJjzzewzDiPHRF/rgiIDS2Xp/BxLOTLb4t
	 Ncr6/81+4FcDtUJqN1lLKlI84O5P36t4YOhSz8zyXmesXMaoqguXlEdb1Wp8espDeOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905363;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=F624hBP8nCq0U3Z4JN9NgFEkbbGSYRe06F8mXyDOOmA=;
	b=2ZrDrqNDG43GnNlwQf02WPOYyYmOXBscaBjkrkgWfinXzdOCvlzuRIl0huD8PdeR9Eqr
	 bm5I6UxaLgMFvmMV+bp3fWWuQqEVhlbzib+w+QssKcBcdzRqWKLy9UeJ0NMhpXx5u3ZNr
	 hlkSFkXyuTYt6qD4LDAq9zqB1zrJaQQkTutcVObZs7t+YaK+VG88nCrHF2RuWrmsapY10
	 9DuPFERGtOxn3T1Q5kBYHvn2K9OX1cdIC0PBQ4QGL2koAg6l7hBGrd5HBYyBfaB96XwqR
	 IYdwkmuMl1gOrjusvQle4CczlEULtoJRQGz8+QKD0TzeuPOU3k80ff02aYWytimGlAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b="WFwo/TNP";
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5AA606A89E;
	Tue, 17 Nov 2026 08:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C5AA606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=WFwo/TNP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794905342;
	bh=F624hBP8nCq0U3Z4JN9NgFEkbbGSYRe06F8mXyDOOmA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=WFwo/TNP7ACGHAFJBzTwN2lH1zBMxdbPieDuiFfdCGFdS+c8Oo5BIEvsMBkSDwrBF
	 qbZ78f9hntXu3LUCqOW/wVqQDA7kiE844H2WDii3/0N/x5NX3YIm2k4hAE1R2McGbE
	 c+MQ7cJLpGpKE0yhwWAYot+BorqETAC5sitG6AWQ=
X-QQ-mid: esmtpsz20t1794905341td0a1e098
X-QQ-Originating-IP: yAhYonpOo9gZVad2TwrxHzgW2nNrsyrheoL/P/zPnE4=
Received: from = ( [183.48.247.191])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 16:48:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15463618535279915353
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 17 Nov 2026 08:48:51 +0000
Subject: [PATCH v2 1/2] dt-bindings: riscv: spacemit: Add K3 CoM260 TQ
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
Message-Id: <20261117-k3-tq-dts-based-on-com260-v2-1-68b337bd8938@linux.spacemit.com>
References: <20261117-k3-tq-dts-based-on-com260-v2-0-68b337bd8938@linux.spacemit.com>
In-Reply-To: <20261117-k3-tq-dts-based-on-com260-v2-0-68b337bd8938@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=844;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=d9pfWYq2YU39bcVp1bR7pPQWrfGG7CsUOEEvhbFyPng=;
 b=kA0DAAoWmAnvgPkzNC8ByyZiAGr8FPah+Bx/KYpAGlInCBI0BKUIerhWz/0OzqErVgCaqfw6q
 Yh1BAAWCgAdFiEEi+AMtnBMWj1wEHFNmAnvgPkzNC8FAmr8FPYACgkQmAnvgPkzNC8lzgEAm7Or
 BMwoPtvdsblYg21rmukUfyuP8L/85KThsmidLmkBAK0l62JVO9a0p1wFVz1q2shkjFN7KWrMnb4
 J1buKGwII
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NCgx7n94Yw/yLOHR7Ri9EYtw1Z3238RZlGe1PPa8IY6iSlS4UwtrFjS2
	QHauFgcOMB48CPs07uxJx9pa/Rwh2NvtG1rJ5StVCYXv87wtWQOXoutK2YsElsVKfBP8LMG
	fpjPz9Gdc19j9v42vhtbO4N1pLjdsXZGMWNmwiKITTallVbCl+V1mdL8+oUmqL31dksfwZs
	YWVBccCoNbU2xnQtZpAnUXPRRbpo0BuZ95wCv2Cqt0hy7upwfZbHKXHoLxoFi8Jg62rMrYs
	A5be/azpWcx5Ajh6AGBanpmTtY0trd0FzV8mmPxkByDRzhdvu/glUyDmuuHs1rTzYzpdztF
	VIob0Siz8NEYnjH+W5RrlwRvLoxoyF0YBsriJK0iPeqUNzTjKqRgqT80Qd8uvYkGdMB+4Yl
	jOLwisNc6VW6KmseBoZhw6bYtHyIDaNgP2cpgjMNoz1YUzVQilZRVGwO23nCgM5dBxJdQoC
	Ldj2VMLAzI1owoxDl3beB0aDbQTvG779JHS7OhVBtXtBeuAaMx2oxyGpwBEM153/Bz9Sy2u
	bXbcDxQu7ZWBRrsrYXI2zFgfEh3626eMy4+qgnaUA4JFkVDpbd5L+y+81UWJFUamzoTamcL
	c+L82PKcEz3oBmOun91ZZciqwqNYaOZBioGaM5BZDuABtH7y3/ZP1+IWZEMn3QEFmzED+UE
	rwGbutxOR5n3LmDcvj6Fh6o7L5Nf7XAvidM8ObbxLLAHoGq4eTiFHwJRRrIPND/sPjUhvzb
	CJkA42vo+A4kj1/Kvex1ALMrm8/0GS2M/Lorpu244SyFBCnsIhvxus7qVZH1TfUmZgSkP2w
	uEaZRi5lSK7ehJNl/loInPF3wpoiB/wCNSNJ9era9lNkWksMO+Ud/vecoAqd1UraPKAQEmE
	e2aLvK3r7/tIcEK1RuaFM6nlA/330jUAMmKBiBB51pLsVoZ8NGfrbkd3w5RlpNEon69RdFv
	is2ZD5iHssng7tBb/alcJfTTdsx04XlKaOx0SIdlCHRkOPzT5tNMCcr76VoxoNgWIYtNz1g
	ECl4SMJCqb1cVCp+1zBqfHCS24JgPjfFYqPWYhlCl7mdIEmdX1Gc9VvdoPDYzWyqyQluuJV
	Qevf/NWzjlgnQmqbyMvAh5CYxU050dm3+rgLfoa7yRv6kvSsKdyIITf2438eFbFKTprMCMB
	OXrge640UCqi2oQ=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

The K3 CoM260 TQ board combines a CoM260 module with the TQ carrier
board. Add its board compatible with the CoM260 module and K3 SoC
fallbacks.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 4ee9c88984b4..9d1e1ff189ad 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -40,6 +40,7 @@ properties:
       - items:
           - enum:
               - spacemit,k3-com260-ifx
+              - spacemit,k3-com260-tq
           - const: spacemit,k3-com260
           - const: spacemit,k3
 

-- 
2.56.0

