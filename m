Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.76.78.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793120218;
	b=NQrPJcFZXK7/It1QIL2wMuJZfbGMFGQ/viReq+8eGidpsUETPVKAOBcd4OhhgpHt6CZz
	 KFM43SMsr3tpzK0fJKUnSwiJ7qfvw42hcSWPAoiaDG3X+ZV6VJnb50PARwih3m8kau44G
	 B+0S61O8eOmcPX+jhOUJuhHBOTtRaNwVqgDmZuTUEUAJpMJiiAbksqXXFLMe3sLKbFb/1
	 VKJIA/PmWal3kG9ttKUan1LG10Odfqb0Pue1HEWFnREqAv4/2xiK72DUASumvGOl/46fj
	 KEepzGbVsfj/N9ITSGYce6y6uv73+Ib0mfNrLtP+EaDhOFhtLc15KheNMvqQAyKLeGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793120218;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=RCWxzgu/7qV59oAFXdDj0lwMBaElOazTyjITLzMLpYU=;
	b=GXi8fs/uzE9qkaq/J5xxlUIIi+MgQQZzvJpjsvF/tFCnG8Hyd+qoHoh9i9iIgXrtLF8U
	 OjH3u4Gx+G5siM+lui7rwakP4LUMdxQvU6XeZOGm4cifXhLP0RBj/ztYKEsGcYmueK2d7
	 Rhopzn0m9SxZvr9wYB5H8c9SRZxQtjNLBBC3IZmEVdl2FJuO8qpxcwcsE+WfUqohFNSV0
	 pjBo/IPKH5hkoi1KbYV2w1c0BJQLhpBe0Rndoj7GYwp3rdxq5rkzirOrmQYUMmazaOw0T
	 WjbkJZkluZgby/asRmAWhEtPZceYOomCd4eJ1yCjAeM39Dqn37BxRezxmRU1ZcnDGPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.76.78.106
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F18606A31E;
	Tue, 27 Oct 2026 16:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55F18606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMB2nXbU1+BqE9pfAA--.61182S2;
	Wed, 28 Oct 2026 00:56:52 +0800 (CST)
Received: from hust.edu.cn (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wBHoAzT1+Bqo2nEAA--.2393S2;
	Wed, 28 Oct 2026 00:56:52 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dongliang Mu <dzm91@hust.edu.cn>
Subject: [PATCH 0/2] docs: Update Sphinx dependency checker
Date: Wed, 28 Oct 2026 00:56:49 +0800
Message-ID: <cover.1793119566.git.dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
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
X-CM-TRANSID:IQEQrMB2nXbU1+BqE9pfAA--.61182S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUOi7k0a2IF6F4UM7kC6x804xWl1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
	x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCE
	c2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14
	v26r4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWx
	Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVCm-wCF04k20x
	vY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4c8EcI0En4kS14v26r126r1D
	MxAqzxv26xkF7I0En4kS14v26r126r1DMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I
	0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r
	4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCT
	nIWIevJa73UjIFyTuYvjxUsrWFUUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Add Deepin to the distributions that receive Debian-style dependency
installation hints. Correct typos and awkward wording in the checker's
messages, command-line help, and docstrings.

Dongliang Mu (2):
  docs: Recognize Deepin for dependency hints
  docs: Improve wording in Sphinx dependency checker

 tools/docs/sphinx-pre-install | 116 +++++++++++++++++-----------------
 1 file changed, 58 insertions(+), 58 deletions(-)

-- 
2.51.0

