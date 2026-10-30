Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.189.79.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375702;
	b=Z1I9cyLnY2k3jNA/c5SD8LQq26YSuQ8B81KHC4zPdr91eKmLcUsNCYnQe5jizaWTOmCG
	 pk6pGmoUrtxWApdsbfJoyEjvwGgZgge6JXc4dC6uaOBhldrzIHr3uSGyytyopvfQTZpaf
	 9LsMcZjoweTf/VawEznqBPKA5K6O/QnWeben4U92rRFf7mR15V6SGXx0frSH055uN3JeS
	 VbzNqeqsGI65YD/BkNBFsf8poPQyrrmHBJlexyFA4Yz2LXcjS8vccZB+RGMrjz7u4ZjT8
	 fL0iQglurwvnimSmOWqDKURPlu8s29FH0bVwDlSrGGJHmnLnJZB0Oxnr3oHSZ82Eugw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375702;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=9v6hFCPpdYZviQ7x5eM3YxSNz+lH8flY2Zmp3wEmLS8=;
	b=0tQql3dVLjQfe+DUzC/Y8xm9cLkLaPtDtyr5Yn3rF4Tgx58JpQyIFFqHFvSCAlvl2WKa
	 gVZSwu7DDsqovSSoixDzXRC0EHe3dwsFLKokGFtA+OWJ2PrWV8FYtL15zPhBQVCCi9Oen
	 91gI29j9TTro7tUmDagaw1Y/TBPhkxlIl/7EIigAKoOEKTPOFkz3Fx3ou0Q+jjJIJXAL3
	 UTnALIG0OhKAKyDOUlnvI2X8SKRKeMTXA3PwWSUofgDRYAL5vDgKle63Ef+cp5Z2M0Qep
	 e3KVKVs5lYMBDjST1YMkIf21t2oSXTq1hTRJiz4nHoCcfAubNBCe3qVTBGdl00MDdTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=206.189.79.184
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D4C606A31A;
	Fri, 30 Oct 2026 15:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69D4C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMBWnqTQveRqKQJWAQ--.60155S2;
	Fri, 30 Oct 2026 23:54:56 +0800 (CST)
Received: from hust.edu.cn (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCnrzvNveRqGMoMAA--.22894S3;
	Fri, 30 Oct 2026 23:54:56 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dongliang Mu <dzm91@hust.edu.cn>
Subject: [PATCH v2 1/2] docs: Recognize Deepin for dependency hints
Date: Fri, 30 Oct 2026 23:54:51 +0800
Message-ID: <da05975b4a5354b4e07beeeb6c62adab0018f800.1793375024.git.dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1793375024.git.dzm91@hust.edu.cn>
References: <cover.1793375024.git.dzm91@hust.edu.cn>
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
X-CM-TRANSID:IAEQrMBWnqTQveRqKQJWAQ--.60155S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoWrKF1fKw4UGFW8Jw15ArWfGrg_yoWDJFX_G3
	yFgF43CrW5XrZIgF4F9FZxWr1fCa1FqF98KF4vyF13XF4Utr4DXFZ09F9YkF1Fkw1DJr9x
	AF1fXr1q9r4YgjkaLaAFLSUrUUUUnb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbd8YjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUAV
	WUtwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2
	xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2Iq
	xVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jfvtZUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Deepin uses apt, but the checker falls back to generic hints because its
distribution name is missing from the OS mapping. Route Deepin to the
Debian hint handler so it suggests apt-get installation commands.

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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

