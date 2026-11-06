Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972396;
	b=aP0XCaYn0PRwGd2luR336VL/L7B6UtrRxTR9ZsBP8RJyto4DnP0PhpQUQNVQnB5DV3KL
	 z71YeAXlDhZMCf8jUJvhtURiRjYoMT4UA7Ys77bxrRFKG7ow2hD1zP+86kKCVwTQ7spZo
	 aBZE2BCvWEEllKHd0hU1E/a5zn0O4onBJ7D4BbM97RLIiU7YdwOoot/vIOLVLaXOuIw7d
	 AI6PQq3Ojc32jSJNXQpMynk0ST2smBwnlG+xMegjYYrbbkxfbfHsc3NqqHdyayYB1dTAE
	 zKTJhd57dkxJ8ABhU4aNasivH9aqx9G9sr+ssAV30Bo/F0Ww7M7M7KzE8HThTcCaV0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972396;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=aCR0cbCVBQ1xXYHP/Hq27JFN6h4MjFD9MsVpfTiy/qk=;
	b=JuhEbHbIUZ4II/RgHEJMcLdS4D2bdBxU1mWx1zLxhpYU/4rAgDI+h6cECVO7+vXAvulD
	 Jff0WjWSqVx6sABC/zwJ8WYuoqEqyRGVWHEg2HAgNbN1pWjqH+txXxdaF+ir5jXldKYbu
	 bfdVN2m2cdlwoIUy8JyBGErW7G6TyJTW95/vYhObUWGk8q+oJrYUz2/pPrg5vX+MDSWs4
	 zhylKpjPl2CKcdjldzfL5Ut4K16utzZNBgip0i2gVU0PMJRkgvLB6Rq4N0B89BXWUXeZ1
	 PWCQPcq6Ynkd6c1gipERhX7J80IMTu71X7MEfUb9apJRha+uiDqQrc/GepQZZ4rcH5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S25BAqOt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B430E606A32F;
	Fri,  6 Nov 2026 13:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S25BAqOt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FB01F008A2;
	Fri,  6 Nov 2026 13:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793972395;
	bh=aCR0cbCVBQ1xXYHP/Hq27JFN6h4MjFD9MsVpfTiy/qk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S25BAqOt9IrpU4qhBINT/g2tjcw4F0YSEL3NlSGG/QiqrQ52COoNH7sBX0B4TnSwx
	 A05ZFJK/r90HmTkmL47koKDzImpiSQNZirz//AsiX9adRwC0Lnr0shLgUMknNFYASz
	 m6qeBc6M+tR9QAu+a1KT6gVibjvTPsdVT6Mjg6NNIzoDSCBI5QIsPC5ig/HRCaLkRM
	 BPeYbaMo3gOiDOWvnpj+MW7qD2Lxx0MX2SzttJKL7c5ZXrh2IEZr0aG43XQ2IKzyb0
	 R+A2c3kO5G8sKZcAOFM7sjIxlJkisp2036h6uIv5gGBh5KxTMO4AFLvlz966Hau2Vi
	 RZaHx0uWDJfHQ==
From: Joshua Crofts <crofts@kernel.org>
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Bin Liu <b-liu@ti.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] usb: chipidea: remove redundant pm_runtime_dont_use_autosuspend() call
Date: Fri,  6 Nov 2026 13:39:31 +0000
Message-ID: <20261106133933.1577-2-crofts@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106133933.1577-1-crofts@kernel.org>
References: <20261106133933.1577-1-crofts@kernel.org>
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

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function call.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/usb/chipidea/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 3461dd763a6e..7edc512cc37d 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1250,7 +1250,6 @@ static void ci_hdrc_remove(struct platform_device *pdev)
 		usb_role_switch_unregister(ci->role_switch);
 
 	if (ci->supports_runtime_pm) {
-		pm_runtime_dont_use_autosuspend(&pdev->dev);
 		pm_runtime_get_sync(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
 		pm_runtime_put_noidle(&pdev->dev);
-- 
2.47.3

