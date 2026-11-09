Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216031;
	b=y5auAkj3diC0Kd2kKbmDFUICSDlVaMvPR4hldzg8XlX3iDKNhwZYvrJfej2xU9nS8hCf
	 4OJZp1UdJAP9GQhMgI9NDHcw3eLa/Iy0vGXXArPMlV8bKYdZpinnOQjam8WCsmwvTDKOB
	 DAKX09XCVPMzHABf9TMN1Y/S4EAugJklzzjBMeBl97gskoCfN+gKrhnewODwJzwQi5FpP
	 6CZkdl8zUsSaxKvqVvdPo3VEQYa++e5Qkdl0pW+AzJAOsJXoLf0jomW6+6fOjLRmO1IfC
	 /qEqeLCyOR9mQT4aQze2rOsWBN2hWg3qpqc3gRAUL/84cnc2/u2+Ur6i9rVnrWrASYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216031;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=hOeIq5VPY1EfMQ4JJ61ftsSvZ9lkqj4sGh1lrViA6xc=;
	b=DGBfitcEuT+/EGMgBuwv5VrUlWAezKrTn/V+zBkmWT18HcLjBM1Tar8ubYPGObt5FHB+
	 /JCvEIAGXH3EioII4KZBWL+iUMsGl2ZlMUNMLuQvZmoVwY5LxoCmft8Keneor/TVhKwm1
	 7IEQSkEi/ypPlcyMvT18f0bnu9PigjGwl5nOkOhBDRWxKydLBWyxWms/QH5WsHxeOIC2D
	 nLuChFJjJn4wjj9gR8s8H1kuieJeEqG6vviKT2VehM3MK2A3ZbmyClt1ibjOYPx6F+gN6
	 z/5YG0WY5H+k76OeQOJRr6auKdaxBDbxSrKSreAl0bPJqc2nZf4mkArdGlNGl6a1XcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=eswincomputing.com;
	spf=pass smtp.mailfrom=eswincomputing.com;
	arc=none smtp.remote-ip=132.226.202.154
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECA8606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ECA8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app2 (Coremail) with SMTP id TQJkCgDX3Zs+kPFq8X+JAA--.48044S2;
	Mon, 09 Nov 2026 17:19:59 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: kprobes: free insn slot in arch_remove_kprobe() to avoid memory leak
Date: Mon,  9 Nov 2026 17:19:57 +0800
Message-Id: <20261109091957.645-1-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20261013023605.317-1-yuanxiaofeng@eswincomputing.com>
References: <20261013023605.317-1-yuanxiaofeng@eswincomputing.com>
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
X-CM-TRANSID:TQJkCgDX3Zs+kPFq8X+JAA--.48044S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYV7k0a2IF6FyUM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j
	6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxV
	W0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAa
	Y2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4
	A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Av
	z4vE-syl42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI0_JF0_Jw1l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYx
	BIdaVFxhVjvjDU0xZFpf9x07je1v3UUUUU=
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAQEGE2rwpDcqUgAAsk

Gentle ping. Is there anything I still need to address on this patch?
Happy to rebase onto a current linux-next if that makes it easier to apply.

