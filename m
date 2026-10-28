Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.76.78.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158916;
	b=PjCGpwUA6wcjVwVxKJtRNzxra9Awil1XVduThlKtmM8nInkaLcQ7L2TGpJSrXP36wUiP
	 RdeIEJesErNzQNUec7eKHDhvRdd7fQPWH39ep/cPDWeWo8spVdzxZXB8n15+6hVRWqg2t
	 0hTfPHjYjGSRaWmY+b4CnJDDF5ZyYLP/rZjVf9j3jIFxT7JIkN4L/7vlCDFbvVjKjoyiw
	 gjYjkqUh7kXBcX0suNEvRryYtcyLT4sQ6jZVuw18k11cVb4MEu3Xi3dpxOltGJieMSkAr
	 QSCF/+bRx0s23XxehI5TH9T4jOVS6nUDte+mGPXW6SYVgOTI/c1ycFTf2oC/2/sUINw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158916;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=+CjNl1z8p2JpgWpr3DY7DQzXsmIPBj0B49pe9kUUqhg=;
	b=S2n6RS9ZBNBFqirMlJt3tpRs2fhIUTsMALrMxxG61fVGtD9yQaAY7GYGPkQK6Ly8/dCs
	 IdKI7g55vgFyiAeLWF3gQfsvDMRRolYhLN/wXG9HOq02b8XeLbmp+8qt5AtJoCYuH/QNK
	 OXkSC9XWGOw8cDFYsgO7XylyGBIZ5E8jQmWH/hJGQNBPqn+MmpzhM4/NbBvmgoyQOjo5V
	 am8ppCcGuKcdPtPACrwq8S8kuUrm4KEg1i6mQF/pU/+FGCfiKUtiV7+yx693Zbm5e6oIz
	 sQXLVCQ3BUmHuybOcIgScg/zhUAtgv7RMSNiW5HNqrZgnXoxFf3Nsmqy7+u029TnF6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.76.78.106
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B155060A5BD7;
	Wed, 28 Oct 2026 03:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B155060A5BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMCWvncBb+FqI+FgAA--.57281S2;
	Wed, 28 Oct 2026 11:41:53 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCXkDvubuFql1YAAA--.815S11;
	Wed, 28 Oct 2026 11:41:52 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Weijie Yuan <wy@wyuan.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] docs/zh_CN: remove stale Original fields from SCSI and IPE translations
Date: Wed, 28 Oct 2026 11:41:34 +0800
Message-ID: <20261028034134.4144660-10-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261028034134.4144660-1-dzm91@hust.edu.cn>
References: <20261028034134.4144660-1-dzm91@hust.edu.cn>
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
X-CM-TRANSID:IQEQrMCWvncBb+FqI+FgAA--.57281S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7KrW7JFWrCFWrXw48Gw1fXrb_yoW8GFy8pF
	yvgr1Iq3W8Jw15Cr18Gry7GF17KFWxGayUGF9FqwnYqFs8tw4ktr43tryDKa93Xry0vFW5
	XFsa9rWY9r1jyw7anT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUH2b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC2
	0s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJV
	W8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUU
	U==
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

