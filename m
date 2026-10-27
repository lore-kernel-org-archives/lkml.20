Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=207.46.229.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111387;
	b=wyz388jcnx53lHHZGAODAlA45ydyLZzCdUJRY8zjBRH8MrRV0FA+g0lybRpti4OyHOmn
	 NPJd6o5GMin7yFOhHK/EL8qVTEPEKWN97+yZrocBSYwNXD4f+fx+LhxmtlTObtJj2SwXa
	 wI0KFDQqPTjaEw1BTcT+tRW0HOil5uVRT7HckoZidxiKHdyBtOPq2ErGZYZvhO82NJ+qV
	 PwT96x5b43HIORvimQSsVQSVOZ1IPKcevKNILYo5OHsIxBdTXZdqSqlaSdBooFztHWg82
	 ixIyUUck8ol2EPn+TfT82UzMXEIDnZBzgtjQVFP1rd6UIvbsRw7SvK5PTbtVF+G3zIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111387;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=RRSNq1zxoA231BThBII9TjSTdWRTSwesELUafvlkFhE=;
	b=EoY5Ck2p77SnK/GurMJFrOJZlPMfj2TMfAQk1I3KIpJmuXvDHOXgUHZK5fIDcZkZV79h
	 QbcQrvbVcvMFWs+hHlbhD0W9LY3pwBPIgtmnZItk4RwZ9H1NQADu61Zq2RHNOOXXFdvMe
	 yl8dUpt7o3swwejofwdX5eT82CIefi5gN15di+6n3YlGtvCq+TeW+MTQfXxlqHezTQKc/
	 VyNpPcL4t1XjMoY8lQ0QcGWLSxKI2R3+Jq9qi74EgaLfVvcXx4PVH5vw432NRm26kkooD
	 6a+MXregOu3mVzBL2tWUJdUrRjZJBgerZRRe96yZbarhsojwhnhFHkLhLWK5K14qWxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=207.46.229.174
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F413C606A31A;
	Tue, 27 Oct 2026 14:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F413C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMAWW6FVteBqkKk7AQ--.34984S2;
	Tue, 27 Oct 2026 22:29:41 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAHjC1SteBqhTwUAA--.39766S2;
	Tue, 27 Oct 2026 22:29:40 +0800 (CST)
Message-ID: <8f495858-3877-4807-ac62-5320d8d6696b@hust.edu.cn>
Date: Tue, 27 Oct 2026 22:29:38 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] docs/zh_CN: update translation of
 doc-guide/sphinx.rst
To: Jiandong Qiu <qiujiandong1998@gmail.com>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260706151358.2103703-1-qiujiandong1998@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260706151358.2103703-1-qiujiandong1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:IAEQrMAWW6FVteBqkKk7AQ--.34984S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7uF15Gw4kJw4ftry8Cw1xKrg_yoW8Xw4xpF
	Wjgr95Ga1kJw13tFW7G3yxWF18JF4fAF4Utay2qw15Zrn5Ar18XrWUtryDK39rWFyI9a98
	ZFsIvaykury2yrJanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQKb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/6/26 11:13 PM, Jiandong Qiu wrote:
> Hi all,
>
> This series refreshes the translation of doc-guide/sphinx.rst.
> Since the updated version refers to process/changes.rst, I also add
> the missing zh_CN translation for that file to ensure a consistent
> reading experience.
>
> Changes in v2 -> v3:
> - sync changes.rst with the latest commit.
> Changes in v1 -> v2:
> - drop the separate llvm.rst anchor patch
> - remove the `_sphinxdoc_zh` anchor from .../zh_CN/doc-guide/sphinx.rst
> - add Assisted-by tags


1. Add the new page to the Chinese process index. The series creates 
process/changes.rst, but process/index.rst 
(Documentation/translations/zh_CN/process/index.rst:72) still lists 
changes as plain text under Todoolist.

2. Commit 2c1ccd9a1d78 is not the lastest commit of changes.rst. Would 
you like to catch up the latest commit?

3. Assisted-by tag can be removed in the next version.

Dongliang Mu


>
> Link: https://lore.kernel.org/linux-doc/20260619140245.1982921-1-qiujiandong1998@gmail.com/ # v1
> Link: https://lore.kernel.org/linux-doc/20260621131215.1303439-1-qiujiandong1998@gmail.com/ # v2
>
> Jiandong Qiu (2):
>    docs/zh_CN: add process/changes.rst translation
>    docs/zh_CN: update sphinx.rst translation
>
>   .../translations/zh_CN/doc-guide/sphinx.rst   | 167 ++++--
>   .../translations/zh_CN/process/changes.rst    | 533 ++++++++++++++++++
>   2 files changed, 666 insertions(+), 34 deletions(-)
>   create mode 100644 Documentation/translations/zh_CN/process/changes.rst
>

