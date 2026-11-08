Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.75.44.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794154011;
	b=bKJJtiYTLAvS4qib99HXpocX6j0z6+PnW0asnge0CLT8s7ibLW1WNwbCvh8ZezbzCFjQ
	 LXw1E/hLr6kyyTFtViBJQoOIgstJM8SjfGBgfF9bbEMaNGLOezBLUnRU3oce00To5/+kw
	 E4BVUpYyTmgLs0TX8beZyunH9EjOskMTGl+SJDynycUoUvcp4a37xFVuAiXTXuxtCIM4A
	 Y9RuTV+noj/HxOZCLDxgDhgxbnIBfarK0Tps1mtxOQo/p69U5I4g8BB/xruaqF/aYKMT5
	 csQhmfwrxRARH9dWuoSi8A2QsPvF5PROk/EDko/M6gpLJnaGl++HaQJdHw2PVnQXHlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794154011;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=YNj0crrPME+eTibyxcxvGkAnT+MIth/jffpvZHujZCI=;
	b=wf3nqrsbM99i5dwtvNjj5UfE5k3DmS0SYrCckURael882gG402UdeDPBBnBRC41Tdpba
	 J2uC3O3tfhHn7498KkKM4kqP7wJIZ9AXQPJi43LsTLfSgMkemx2/UsTd2WAQl5TLmIPTu
	 MkQ/ABazHJnuc/n9CfZmtpgeifTqqjCwyR9iAB/fSR2rYwwGNAb5HjlI//IPdXqW10jV/
	 Za2l5yY66MOTU9gA8gM/23YfNtEHrRN+qira1VARvA0XAcZX4umaIi/XSu3uvMocodo9f
	 EW1Lw9la5YVbQl71YyXX0w2Mp2+dP645ZEhKTnaCCmOj0eLmLNqgreAsofCOTwllS9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.75.44.102
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F958606A322;
	Sun,  8 Nov 2026 16:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F958606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMDG7cUOnvBqxgAJAA--.8843S2;
	Mon, 09 Nov 2026 00:06:38 +0800 (CST)
Received: from hust.edu.cn (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCXYh4LnvBql4QOAA--.19133S2;
	Mon, 09 Nov 2026 00:06:37 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] docs/zh_CN: translate AI-related process guides
Date: Mon,  9 Nov 2026 00:06:29 +0800
Message-ID: <cover.1794153793.git.dzm91@hust.edu.cn>
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
X-CM-TRANSID:IQEQrMDG7cUOnvBqxgAJAA--.8843S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoWrZrWrZF15ArWkZrW7Zr48Xrb_yoWfuFb_Ar
	4kAFWjkrs2yF1kGFW09r45ZrWIkF4F9rykXFn8tayDK397tFW5XryDXas5uFyrAF4Fkry5
	G3ykWw1rtF17ujkaLaAFLSUrUUUUnb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbHkYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
	87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2kKe7AKxVWUAV
	WUtwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Cr0_Gr1UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCY02
	Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s02
	6xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUVWSoDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Add Chinese translations of the process guides for coding assistants,
generated content, and the kernel threat model. The final patch updates
the coding-assistants guide to link to the new translations.

Dongliang Mu (4):
  docs/zh_CN: translate coding-assistants.rst
  docs/zh_CN: translate generated-content.rst
  docs/zh_CN: translate threat-model.rst
  docs/zh_CN: link AI guide to translated documents

 .../zh_CN/process/coding-assistants.rst       |  74 ++++++++
 .../zh_CN/process/generated-content.rst       |  97 ++++++++++
 .../zh_CN/process/threat-model.rst            | 168 ++++++++++++++++++
 3 files changed, 339 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/process/coding-assistants.rst
 create mode 100644 Documentation/translations/zh_CN/process/generated-content.rst
 create mode 100644 Documentation/translations/zh_CN/process/threat-model.rst

-- 
2.51.0

