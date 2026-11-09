Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=207.46.229.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201712;
	b=PulFCZ2g8cdQ8rDwJDdpcsGASB1N7CtEV+NLDKMHd7cC79txEVQsfRsdsuOcz3RfVe1c
	 B/RHhQUPK0yiu8FN/RSyVHI2B3TDZLoui3Q7dcsEgqwcyFnSQkRvfKXIMnFm5DtmaXXdB
	 t7qo9QbmHgENdBnzWcIw+SUoJkVguKlmv13zo07yVySCih8Txkvu4yVhW83FWWwMWDysY
	 fKq1LkP9GL4iCSzsTurLFTZurKap82uDsF8VoaVYt68l3T93UuVhiJvByBUXPxOJ2r0lu
	 PcWASQMQCBjq14TWvmKbuK7YkD0HkwQ/OtQvC/HCNNDlwZAGm1/0Do+ddi55rdeytmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201712;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=zKAeyBickJrdL/EaSzHYUeHia/WSDtzfF5yoPJRCW9g=;
	b=AIX2oj85NNHx48X/h7VDJ3tjhyhOWkaNeJzega+D+/wiRkf+WJJtkfmtCiAeVDwrEUrD
	 ooqYDY+eZ7CZayEpPFWJMV2EfyZbHmMgKk+uBxA2zX7l0i4OknqWtNNQVQdMTcWjtPRIE
	 3Donsi/1K5RHtlFO9CZD7LRxbjNlv061n3vALWmsM46jx2H/2MiuzUILGe3HLpEDgEYng
	 v+2gGf/AiswSdvIeCP8o8iQShbPP+wJMCPEyNCtg4W1+yWuW0GXvUtj72rMsJhSsm6rod
	 nwottIBB5C50EnDAXuv+zC+qU2pXxdP3JuO4S8c+gjzqTNtJFl4Xo6YtZwEAhgk3ozQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=207.46.229.174
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E2E606A31C;
	Mon,  9 Nov 2026 05:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06E2E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMBGD2toWPFqrcQjAA--.13048S2;
	Mon, 09 Nov 2026 13:21:44 +0800 (CST)
Received: from hust.edu.cn (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAn8jVlWPFq3SUuAA--.28705S2;
	Mon, 09 Nov 2026 13:21:43 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] docs/zh_CN: translate AI-related process guides
Date: Mon,  9 Nov 2026 13:21:36 +0800
Message-ID: <cover.1794197977.git.dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1794153793.git.dzm91@hust.edu.cn>
References: <cover.1794153793.git.dzm91@hust.edu.cn>
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
X-CM-TRANSID:IAEQrMBGD2toWPFqrcQjAA--.13048S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoWrZrWrZF15ArWkZrW7Zr48Xrb_yoWktrX_Ar
	4kAFWjkr4IyFn7GF4v9r45ZrWIkF4I934kXFn8ta98K3yDtFW5XryUXas5uFyrJF4F9ry5
	G3ykWw1FyFnrujkaLaAFLSUrUUUUnb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbdxYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
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
	r41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVYhFDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Add Chinese translations of the process guides for coding assistants,
generated content, and the kernel threat model. The final patch updates
the coding-assistants guide to link to the new translations.

Changes in v2:
- Add the missing Signed-off-by tags to all four patches.
- Spell out "AI 助手" in patch 4/4 to address the terminology nitpick.
- Format the English commit references in patch 3/4 for checkpatch.
- Add Weijie Yuan's Reviewed-by tags.

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

