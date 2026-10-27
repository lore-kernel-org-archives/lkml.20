Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.76.78.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793120219;
	b=vf7oCG/wJCMEchRTdkheL2nxyJOdUvxLyk1jtgpw0EFyMu2r9pZsc+Gk9QWzWiKS9Umx
	 LALRMLNfm2YDLOfs1I6TLel32pIMbO/4/JUG+0uNmYWPEoyS+7f4Hs2r2NTZ5sKONy9XG
	 eLYry/I4ftfimx0f+Xsa327XpkjHIpdN4C5xQ6sG9U+7zPMDFF7gmYS7YAN0lPAIahsVk
	 z3h4UyUNod07QzAOkZ3kpUlu3/rLmjJFp/ls5PDzjAmuP1FnC96YEN5BG7ZoEmm1h5Vip
	 v0LihJE6Gz1F9VGPEZEvR6xQqbFJuvODJe98cYZbXOH0LL7CuHQkCr1/qbcucegwOcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793120219;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=zLkmClWiA9JJdmMjUYBBhmZcgkNAiv+3WfjMV26whx0=;
	b=lFTkgyZChhIGwjCEvHZk/2h2WcO+yDlxbhbZ+R/LcZvHbcELeTBTiptxrLiLyBaCWaaS
	 KCwP8LEad/ByXqLG20IRiwkatGFb5fqTPm2ip23BPjwqmO8Z73cvCo+FqJ/DwNIYIdOad
	 vaKvEdXdnNcUJBtUOtYV83Jd1AjELCMursQhucI9JPu7WTKGSSb7wrjODOyKlaNqyNfUY
	 XAPvx8aaEkK16fvi0GR+EUyLeXrgPNT2eMzywbFdr8C4oOcY+RZY1mzHVKlZQ78zjxqa0
	 h2ZUtobckSoF5HEtHTwHVImlj8xFT01zNW/xYbum/rs3ni5FSDTxfhCQkFeLyK3qRNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.76.78.106
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E39606A31D;
	Tue, 27 Oct 2026 16:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55E39606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMBWnqTV1+BqsDc8AQ--.18094S2;
	Wed, 28 Oct 2026 00:56:53 +0800 (CST)
Received: from hust.edu.cn (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wBHoAzT1+Bqo2nEAA--.2393S3;
	Wed, 28 Oct 2026 00:56:52 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dongliang Mu <dzm91@hust.edu.cn>
Subject: [PATCH 1/2] docs: Recognize Deepin for dependency hints
Date: Wed, 28 Oct 2026 00:56:50 +0800
Message-ID: <b3e985f11140daa28718087723957e2fbfa4a538.1793119566.git.dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1793119566.git.dzm91@hust.edu.cn>
References: <cover.1793119566.git.dzm91@hust.edu.cn>
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
X-CM-TRANSID:IAEQrMBWnqTV1+BqsDc8AQ--.18094S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoWrKF1fKw4UGFW8Jw15ArWfGrg_yoWfAwc_G3
	yFgF43CrW5XrWa9F4F9FZxWr1fCa1Fqr98KF4vy3W3XF4Utr4DJFZ0vF9YkF1Fkw1UJr9x
	JF1fXr1Dur4YgjkaLaAFLSUrUUUUnb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbdAYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
	87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2kKe7AKxV
	WUAVWUtwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY
	07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI
	0_Gr1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4U
	JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw
	1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jfvtZUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Deepin uses apt, but the checker falls back to generic hints because its
distribution name is missing from the OS mapping. Route Deepin to the
Debian hint handler so it suggests apt-get installation commands.

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 tools/docs/sphinx-pre-install | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
index 965c9b093a41..d1af82e1466d 100755
--- a/tools/docs/sphinx-pre-install
+++ b/tools/docs/sphinx-pre-install
@@ -1137,6 +1137,7 @@ class SphinxDependencyChecker(MissingCheckers):
             re.compile("Devuan"):                     self.give_debian_hints,
             re.compile("Kali"):                       self.give_debian_hints,
             re.compile("Mint"):                       self.give_debian_hints,
+            re.compile("Deepin"):                     self.give_debian_hints,
 
             re.compile("openSUSE"):                   self.give_opensuse_hints,
 
-- 
2.51.0

