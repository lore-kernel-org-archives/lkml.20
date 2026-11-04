Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=207.46.229.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771919;
	b=hqPH3GybiuMBAeEcIKkoonI99fkBjIfkck3V2/3t1Lt+Wa6vfXwohQkbOMkJvBJHOEAp
	 s+IDEN09elUTmvPWrVL+UPC1M2dHv6QYA/sfY5XLuPYLvWemPvvS7DztTOkx6jdHhixb3
	 37paNvBrgLEJBEXVYgOyqBN/yEF6uaPnl+jzawRY2dqT9uyD7XMMeuYk0C/z7Fg9seQjU
	 PAauxkCfkU8v4Ti0wZ4Mz22kzQcem4wTJOSgZuyE/pMTxw7TP8fXuO8MM1shAuEAu3D0q
	 PDZtrjVE5NeSRFqYzqgZgNd2GIp0AJx/WVSaaTFrFqnKHWw1CmlXgInq43RWKAez2Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771919;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=EwVD3mFImzWJJerA1LCoTsK6ZMs366FMZK6FXa3P1uA=;
	b=yooDxtPei/JT7ysEUCkRv5LtKQmiMOmD3PujnLusm8IbrNXn5Yq3Mc4PxyWCS7JFNYpZ
	 zpPHK6memic4XstvqOxYtuk+FazR8M0HFP4QdrkSv5umKzBlMV2lrGK9B/W1hRY1k43it
	 UvjMRjagby6Wvx1EGuKtw4fiOx1sdIb0c7FxiF9JEk0nyyXHRGkzIYPAUk91sdU1Q+1/I
	 TxHleDc9+coUO8RizgZ0MCU4XwN91zzMLtb9ple3ADc4ByzNn1r4U06GVgpamMptMgy3n
	 YPTHVAnjKX/jaqulNoGI4INJLBFPOnTwgfoXuXkyTa3xn4bfOJkC7eIJuxC29EjGM3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=207.46.229.174
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E53606A31B;
	Wed,  4 Nov 2026 05:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85E53606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMDGC6KByepqQ9VuAQ--.54369S2;
	Wed, 04 Nov 2026 13:58:25 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAHlkB7yepqGxscAA--.38438S2;
	Wed, 04 Nov 2026 13:58:21 +0800 (CST)
Message-ID: <6233ee75-1872-4077-97b6-5d0c00cf8236@hust.edu.cn>
Date: Wed, 4 Nov 2026 13:58:19 +0800
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
Subject: Re: [PATCH v4 0/2] docs/zh_CN: update translation of
 doc-guide/sphinx.rst
To: Jiandong Qiu <qiujiandong1998@gmail.com>, alexs@kernel.org,
 si.yanteng@linux.dev, wy@wyuan.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1793279600.git.qiujiandong1998@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <cover.1793279600.git.qiujiandong1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:IAEQrMDGC6KByepqQ9VuAQ--.54369S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7tF17Cw4UWry3JrWDGr1rJFb_yoW8CrykpF
	WYgFs5Ga1kJr13tFW7G3y7AF18XF4fAa1UtFW2qw15ZrsYqr1UXrWxKrZ09ayDXa929Fs0
	vF4avFZY9ryjyFJanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQCb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVYhFDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/29/26 9:29 PM, Jiandong Qiu wrote:
> Hi all,
>
> It has been quite a while since v3. Thanks to Weijie for the reminder,
> and to Dongliang for reviewing the series. Sorry for the long delay
> in sending this update.
>
> This series refreshes the translation of doc-guide/sphinx.rst.
> Since the updated version refers to process/changes.rst, I also add
> the missing zh_CN translation for that file to ensure a consistent
> reading experience.
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
>
> Changes in v3 -> v4:
> - add changes.rst to the Chinese process toctree and remove its TODO entry
> - sync changes.rst through commit fd5425b67355
>    ("docs, resolve_btfids: Document kfunc BTF annotation emission")
> - remove Assisted-by tags from both patches
> - fix a typo in the sphinx.rst commit message
> Changes in v2 -> v3:
> - sync changes.rst with the latest commit.
> Changes in v1 -> v2:
> - drop the separate llvm.rst anchor patch
> - remove the `_sphinxdoc_zh` anchor from .../zh_CN/doc-guide/sphinx.rst
> - add Assisted-by tags
>
> Link: https://lore.kernel.org/linux-doc/20260619140245.1982921-1-qiujiandong1998@gmail.com/ # v1
> Link: https://lore.kernel.org/linux-doc/20260621131215.1303439-1-qiujiandong1998@gmail.com/ # v2
> Link: https://lore.kernel.org/linux-doc/20260706151358.2103703-1-qiujiandong1998@gmail.com/ # v3
>
> Jiandong Qiu (2):
>    docs/zh_CN: add process/changes.rst translation
>    docs/zh_CN: update sphinx.rst translation
>
>   .../translations/zh_CN/doc-guide/sphinx.rst   | 167 ++++--
>   .../translations/zh_CN/process/changes.rst    | 528 ++++++++++++++++++
>   .../translations/zh_CN/process/index.rst      |   2 +-
>   3 files changed, 662 insertions(+), 35 deletions(-)
>   create mode 100644 Documentation/translations/zh_CN/process/changes.rst
>

