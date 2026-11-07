Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794055462;
	b=fxxYE0X9ChfGAgq+zp9uTf4BPl8SYZRuvAG+anCUkEt5/AlFaCqO2WCHKF530bEvywYi
	 i8DiTL+yiWdqOcXAG+qiFIAFH8LkVSoXeDj3Vpf9jml6nIoM8piRJTxe24Bxvne7dCuQx
	 HRh9wHgpY7NITOWmL8KC6NaH2obi22Z97mVsJf+How1gBoFMR3zFkVEJl1E0n+W4tSfzS
	 FX3c+9fkFHDZK6bFq5ztMhQVwc95H/5xMVT7nISfdf7qARVoO0vLOcsGnOJQCM3PODRIM
	 KPg74zQj93XkaA+tpNlFm6EoBCuc5h6IhMFsr86beGXHJEd8vnsrZE/H8nVnpFNmReg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794055462;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=xAFaghBdRPi4vjwI859IZf2UkpyMvTo4p7bxzlYcToc=;
	b=RRlv7JL+wmJan31Y1OEiwqxeKoa2r34n6+9G4LostH4x+CgE7cm6ksWfdfpA0bBiq3jf
	 UygbHTvg6ZY7yTfabKPQaTlek72JgKUFeSYpZ+tbjK/rey7ONTzlQt+FsWo6W65yqYgJB
	 aybfWjO+hdxDZaRKgasmBTZS+eZ7VF00i41UH7ID4mVJd2OKn2WL6laieVJtzcjsrSQ/9
	 xxruFnX6mdQUH9+AVf6pwd1yxkVKUg/tTeqCb4RZZOgTSlxfUxeiIkxl9TcHpU86NkNg4
	 mtXs0o0KaUUeUdkq+m99WXCkKyayMsiss01b8Kve8+o711aeldtrqm4rKjhC5cILeDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=162.243.161.220
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41947606A338;
	Sat,  7 Nov 2026 12:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41947606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMAGLsYaHe9qw9sGAA--.16757S2;
	Sat, 07 Nov 2026 20:44:10 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCHgB8VHe9qBIMJAA--.12252S2;
	Sat, 07 Nov 2026 20:44:07 +0800 (CST)
Message-ID: <3bbce43f-476c-4a21-8da3-2be98a696e9c@hust.edu.cn>
Date: Sat, 7 Nov 2026 20:44:05 +0800
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
Subject: Re: [PATCH 00/13] docs/zh_TW: process: add translations of 13
 documents
To: Chen-Yu Yeh <chenyou910331@gmail.com>, Alex Shi <alexs@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>, Yanteng Si <si.yanteng@linux.dev>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106113545.708896-1-chenyou910331@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20261106113545.708896-1-chenyou910331@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:IQEQrMAGLsYaHe9qw9sGAA--.16757S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxWr43CFyfCryUJr4fZF4Dtwb_yoWrXFW3pF
	1xGFyfGa1fJw12yrWxKF4xJr1rAayxCFW7trnFqwn3t3sYyr1IvFyrtr9Fga9xWr10va1j
	qr45trWDXw12vFJanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQGb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUXV
	WUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4
	AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCF
	s4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI
	8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
	IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
	AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jy38nUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 11/6/26 7:35 PM, Chen-Yu Yeh wrote:
> I previously promised Jon that if no contributors stepped forward
> within two months, the maintainers would have to produce some results
> ourselves.
>
> This series adds zh_TW translations for 13 process/ documents that had
> no Traditional Chinese version, and moves each one from the TODOList
> into the toctree of process/index.rst.
>
> It is independent of the "resync translations with the English
> originals" series sent alongside it, and applies on its own.
>
> Terminology follows the decisions in that series; whole-file
> terminology unification and the glossary.rst update will follow
> separately.
>
> The series is based on the docs-next branch of
> https://github.com/kernel-zh/linux-zh_TW.

This patchset looks good to me except the newly-introduced top-level 
labels, which have no references.

tw_researcher_guidelines
tw_applying_patches
tw_pgpguide
tw_changes
tw_deprecated
tw_kernel_docs
tw_maintainers

Dongliang Mu

>
> Chen-Yu Yeh (13):
>    docs/zh_TW: process: add researcher-guidelines.rst translation
>    docs/zh_TW: process: add cve.rst translation
>    docs/zh_TW: process: add applying-patches.rst translation
>    docs/zh_TW: process: add maintainer-pgp-guide.rst translation
>    docs/zh_TW: process: add changes.rst translation
>    docs/zh_TW: process: add handling-regressions.rst translation
>    docs/zh_TW: process: add deprecated.rst translation
>    docs/zh_TW: process: add kernel-docs.rst translation
>    docs/zh_TW: process: add maintainer-handbooks.rst translation
>    docs/zh_TW: process: add contribution-maturity-model.rst translation
>    docs/zh_TW: process: add conclave.rst translation
>    docs/zh_TW: process: add threat-model.rst translation
>    docs/zh_TW: process: add maintainers.rst translation
>
>   .../zh_TW/process/applying-patches.rst        | 392 +++++++
>   .../translations/zh_TW/process/changes.rst    | 532 ++++++++++
>   .../translations/zh_TW/process/conclave.rst   |  35 +
>   .../process/contribution-maturity-model.rst   |  83 ++
>   .../translations/zh_TW/process/cve.rst        |  90 ++
>   .../translations/zh_TW/process/deprecated.rst | 363 +++++++
>   .../zh_TW/process/handling-regressions.rst    | 969 ++++++++++++++++++
>   .../translations/zh_TW/process/index.rst      |  35 +-
>   .../zh_TW/process/kernel-docs.rst             | 355 +++++++
>   .../zh_TW/process/maintainer-handbooks.rst    |  20 +
>   .../zh_TW/process/maintainer-pgp-guide.rst    | 795 ++++++++++++++
>   .../zh_TW/process/maintainers.rst             | 127 +++
>   .../zh_TW/process/researcher-guidelines.rst   | 136 +++
>   .../zh_TW/process/threat-model.rst            | 187 ++++
>   14 files changed, 4101 insertions(+), 18 deletions(-)
>   create mode 100644 Documentation/translations/zh_TW/process/applying-patches.rst
>   create mode 100644 Documentation/translations/zh_TW/process/changes.rst
>   create mode 100644 Documentation/translations/zh_TW/process/conclave.rst
>   create mode 100644 Documentation/translations/zh_TW/process/contribution-maturity-model.rst
>   create mode 100644 Documentation/translations/zh_TW/process/cve.rst
>   create mode 100644 Documentation/translations/zh_TW/process/deprecated.rst
>   create mode 100644 Documentation/translations/zh_TW/process/handling-regressions.rst
>   create mode 100644 Documentation/translations/zh_TW/process/kernel-docs.rst
>   create mode 100644 Documentation/translations/zh_TW/process/maintainer-handbooks.rst
>   create mode 100644 Documentation/translations/zh_TW/process/maintainer-pgp-guide.rst
>   create mode 100644 Documentation/translations/zh_TW/process/maintainers.rst
>   create mode 100644 Documentation/translations/zh_TW/process/researcher-guidelines.rst
>   create mode 100644 Documentation/translations/zh_TW/process/threat-model.rst
>

