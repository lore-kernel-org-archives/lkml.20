Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390745;
	b=g6uVYdJGZJJ9SjIb25yJ9i3DI+vU0X0QOsBGJntCFjxWdcVm4Iq+bwJGW4bTUOuyRfUH
	 GQStrQFil/W7MMGJXfanO5bIQRQIkv2a+Jx5VusAM21R2e/ljaQKArimiBCrndJDmTIfN
	 RkKB/yJ5Adsf7JRKLcvd3gAOzkrT9cTQdy9VmfXyc3GZPWyYE9H0nOUh3PgJLnwHnimLK
	 NHUnQ8vhGXklcq9j6k5jcbkvtyVSpycrwbEO7WMQFaBK2pihX/nvthAQtS/Vku/K6x08C
	 ymNPYBerzuQmkqeD2pJCWXhCj1jXk6bpl/08L0sDJhaDeLJz90FnZ6J1Cu3RFTeGa1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390745;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=E6l4GGAmgvSu85gCL1YVNUedtbF84qfhJ1alEiUbsUc=;
	b=I4+6Ksgfz1v2DZleUKkYAS1GEEq89VszExNHB5D/Oaf60eQHUkkEBGwloyox8hZeQIk8
	 KpqeFU4Wb1k9P3DdF3fueJFH2kW/4Vk5RSf0vjtlbGX8lpRczXCDhUHgdYMz7z7SXo/c9
	 7vI6QMtdrDvT+Ojm5Efx+I7uNXxz1DTAK07IZFZhMMfoBYleU1WTvQ/ql2sYaFaysbvPg
	 7lMSt5wYP8EW/yrSppw563loBD60vYcxv71Hiqt7dvylkLshCe4qh9YUwsFPr51EMrBwr
	 b7m6hcup4x0dxvgTG1zkjRsCM4i7I2hh8pwijcIAcU/9bCQ9zGbvyigVoutMgvSDdig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4517606A331
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4517606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8CxutHVOvRqXYEeAA--.22282S3;
	Wed, 11 Nov 2026 17:52:21 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxg8zSOvRqrLMzAA--.12000S2;
	Wed, 11 Nov 2026 17:52:19 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] Add some new features for LoongArch BPF
Date: Wed, 11 Nov 2026 17:52:14 +0800
Message-ID: <20261111095217.31415-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
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
X-CM-TRANSID:qMiowJDxg8zSOvRqrLMzAA--.12000S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
	Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2DUUUUUUU

Not tested yet, just RFC.

Tiezhu Yang (3):
  LoongArch: BPF: Add support for instructions array
  LoongArch: BPF: Add support for indirect jumps
  LoongArch: BPF: Add support for indirect calls

 arch/loongarch/net/bpf_jit.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

-- 
2.42.0

