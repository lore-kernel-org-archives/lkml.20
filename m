Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558A02EBBA1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791878854; cv=none; b=ge+nAulCXXZWvEeVGlxV47pNSkt0kaYxCUK/xOaN9vxAsEu/4dmOLQWCBTyWYgcZJt0CVa7yz2r+0naUgTsUQESX0TskCOUYEcM4dRO21lk5L8hpOsmKPDu5bO5Wa+oFGtrH0hh3S0Zf19jHjl0RqfvM0S4HcIPp6qbbtk+dkuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791878854; c=relaxed/simple;
	bh=Pxa+Ajou/UjyfJ2qYIatNwbu66aMZns6yZ20YFcX1lo=;
	h=From:Subject:To:Cc:Date:Message-ID:MIME-Version:Content-Type; b=D4Nr1FMMZVYCG1gBJcpnpxCCczruY86UpoqTy9pwl5fJByR49WjoiFe07RbWR8IqczQs2MMdEj/DK95l6qnJx6eCkifbojzU4mni4ivc7k4771oPBgUZJpLZ6RuUFEsxMFjDw26h2dXFZ/36M0983/3OK51wAs++/bEY9e0dTH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohRPyxW8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohRPyxW8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7107A1F00893;
	Tue, 13 Oct 2026 08:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791878853;
	bh=y4Agq7s9X2LOHheuIImpYu6j1A9yFBq8aPeY6cwgio4=;
	h=From:Subject:To:Cc:Date;
	b=ohRPyxW8jg3vxcTvEmSKHIdfYGPsf4hTqcxViFoJduZkqf0k1td2rfk+WM3gMs7ga
	 9oTdXCcsFH0Q8heBUWwJjomPOCpatDhZKaenWgWI9O0v+CSRQSbeaDB2IFnXp4qdEq
	 b4Tu9b5SCz9qZPKdZO9PKIS7qHw2wVMUa/ow/7/aTG8kj4sA6Lt3HAU/ZPPpEGgnYv
	 4FYUJczKjLXG/2BPJf/98nX5VuOqyA+QakpcFVP3SxK9atlnpv44mux2NnC5Fu0M7R
	 szRVU3o3DQwC19IlcOszrcg3TbM4AUA9yw4+3oJjRjxMT06uAlOC+PpmXmZ6VBxi3N
	 j1h9zLSPkakKQ==
From: Konstantin Sinyuk <ksinyuk@kernel.org>
Subject: [PATCH] MAINTAINERS: update habanalabs maintainer contacts and status
To: dri-devel@lists.freedesktop.org, Lukas Wunner <lukas@wunner.de>
Cc: Koby Elbaz <elbaz.koby@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Date: Tue, 13 Oct 2026 11:07:29 +0300
Message-ID: <179187884916.468.5557909498363748284@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Update the contact addresses for Konstantin Sinyuk and Koby Elbaz
and add the corresponding mailmap entries.

Set the driver status to Maintained to reflect the current
maintenance arrangement.

Signed-off-by: Konstantin Sinyuk <ksinyuk@kernel.org>
Acked-by: Koby Elbaz <elbaz.koby@gmail.com>
---
Lukas, following our discussion at LPC, here is the contact and
maintenance-status update.

 .mailmap    | 2 ++
 MAINTAINERS | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/.mailmap b/.mailmap
--- a/.mailmap
+++ b/.mailmap
@@ -510,10 +510,12 @@
 Kirill Tkhai <tkhai@ya.ru> <ktkhai@virtuozzo.com>
 Kiryl Shutsemau <kas@kernel.org> <kirill.shutemov@linux.intel.com>
 Kishon Vijay Abraham I <kishon@kernel.org> <kishon@ti.com>
+Koby Elbaz <elbaz.koby@gmail.com> <koby.elbaz@intel.com>
 Konrad Dybcio <konradybcio@kernel.org> <konrad.dybcio@linaro.org>
 Konrad Dybcio <konradybcio@kernel.org> <konrad.dybcio@somainline.org>
 Konstantin Khlebnikov <koct9i@gmail.com> <khlebnikov@yandex-team.ru>
 Konstantin Khlebnikov <koct9i@gmail.com> <k.khlebnikov@samsung.com>
+Konstantin Sinyuk <ksinyuk@kernel.org> <konstantin.sinyuk@intel.com>
 Koushik <raghavendra.koushik@neterion.com>
 Krishna Manikandan <quic_mkrishn@quicinc.com> <mkrishn@codeaurora.org>
 Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski.k@gmail.com>
diff --git a/MAINTAINERS b/MAINTAINERS
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11432,8 +11432,8 @@
 HABANALABS PCI DRIVER
-M:	Koby Elbaz <koby.elbaz@intel.com>
-M:	Konstantin Sinyuk <konstantin.sinyuk@intel.com>
+M:	Konstantin Sinyuk <ksinyuk@kernel.org>
+M:	Koby Elbaz <elbaz.koby@gmail.com>
 L:	dri-devel@lists.freedesktop.org
-S:	Supported
+S:	Maintained
 C:	irc://irc.oftc.net/dri-devel
 T:	git https://github.com/HabanaAI/drivers.accel.habanalabs.kernel.git
 F:	Documentation/ABI/testing/debugfs-driver-habanalabs
