Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096785;
	b=cE8VEDL7+esVZaS4gKFOoleKUgmsx2EnotrgSAaHdQQRMu7mF4ryrsjd7HZuW68yk7RH
	 OQD51OpkVV/dbWN1q7YP9ycOmgKzITxhQR5CLt+R1knR+YxmRCwZM+nM3sWXJPByNen5f
	 Q5fWNKVhdIej+TPd15W5FZfRYmQs9i+D7Q22bq2hDtvoCEM1IZMftLYsdSx2X8LfP8i5Q
	 h51CNg9OdLKEnjZmOWZP3I55aIA9BsegQbjy3gqflhB0XWqMh9eczZGbzVG4tbVx4Nrqz
	 KJc6bQL9GCcWLRisfKX8JFz9biJqkPGHeNEcU6ujb6yg+GfkQOj2m+nzBrCuV5OiULw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096785;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=+CjNl1z8p2JpgWpr3DY7DQzXsmIPBj0B49pe9kUUqhg=;
	b=zE7ZIUos7XXr16CsKuAJC9JL+OfZqxjspR1Ka0MDHaWi0ndu5x4S654UmX9VTL5THvC4
	 GipsaqdpkUPJ734zY1cCI6/vkvOrri19yOC84W+uSP5ZB4P26Sympc7ZsdDkNhTQ4Vadv
	 TEdPww0kHnj4p1a21kddQjbxaj9Yz1EPqwrPha4t7zGrfiNTEOlkfT8LtkdOwh1pCnFyl
	 8b7t6KK6u56wyAJt6A7INblZjMHmFZBc+1vcXSkQJZU7eLkNr0JLwTuU6Zaal8A6lcj3c
	 ZZscMumGINdnoeV+REOZF3vw/Wq37YuZLEhRP8Odw5M5fI3CHvCdzO+GvQyPsU6HvOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=132.226.202.154
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3099606A33C;
	Tue, 27 Oct 2026 10:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3099606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMC2+6FNfOBquKg6AQ--.34283S2;
	Tue, 27 Oct 2026 18:26:21 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDXseYwfOBq0WPDAA--.19105S11;
	Tue, 27 Oct 2026 18:26:20 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] docs/zh_CN: remove stale Original fields from SCSI and IPE translations
Date: Tue, 27 Oct 2026 18:25:52 +0800
Message-ID: <20261027102552.3801595-10-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261027102552.3801595-1-dzm91@hust.edu.cn>
References: <20261027102552.3801595-1-dzm91@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMC2+6FNfOBquKg6AQ--.34283S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7KrW7JFWrCFWrXw48Gw1fXrb_yoW8GFy8pF
	yvgr1Iq3W8Jw15Cr18Gry7GF17KFWxGayUGF9FqwnYqFs8tw4ktr43tryDKa93Xry0vFW5
	XFsa9rWY9r1jyw7anT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHFb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC2
	0s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJV
	W8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVYhFDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Remove the stale Original fields from the WD719x and IPE
translations. Both English sources use the same relative paths
under Documentation.

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 Documentation/translations/zh_CN/scsi/wd719x.rst  | 2 --
 Documentation/translations/zh_CN/security/ipe.rst | 2 --
 2 files changed, 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/scsi/wd719x.rst b/Documentation/translations/zh_CN/scsi/wd719x.rst
index 79757c42032b..f56eef04fd00 100644
--- a/Documentation/translations/zh_CN/scsi/wd719x.rst
+++ b/Documentation/translations/zh_CN/scsi/wd719x.rst
@@ -1,8 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/scsi/libsas.rst
-
 :翻译:
 
  张钰杰 Yujie Zhang <yjzhang@leap-io-kernel.com>
diff --git a/Documentation/translations/zh_CN/security/ipe.rst b/Documentation/translations/zh_CN/security/ipe.rst
index 55968f0c7ae3..51065bbc53a1 100644
--- a/Documentation/translations/zh_CN/security/ipe.rst
+++ b/Documentation/translations/zh_CN/security/ipe.rst
@@ -1,8 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/security/sak.rst
-
 :翻译:
  赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
 
-- 
2.51.0

