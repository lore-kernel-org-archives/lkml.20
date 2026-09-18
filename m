Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01B147124B;
	Fri, 18 Sep 2026 18:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756495; cv=none; b=kBOqlfydJAYTFdVE8NYpk2+zWnwwR0xy9GCFQP23wWdDUYXcZ3djHcn8TaIm09iFv/ESMyC224aI1P1u6Ensz/gZ2YaIFKx7PyKHMRP2uWeZts7rfj3TbsBnZFK1hZruHQ7IVzrxI4n5NxSeoG77vU9YEA+NIQLq1LnA2DBzJBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756495; c=relaxed/simple;
	bh=divxltYqBNV9yHuXguH7zvOcBDOIFdIwxHr3FE6/77g=;
	h=Message-ID:Date:MIME-Version:To:References:Subject:From:Cc:
	 In-Reply-To:Content-Type; b=DYSvvHp9HOtdzDloEwRkMud0bgo8Zk8NsSVmS6m9CRjPfm4HWSjVg4Z5NlVaxE9/fpAVOGyduYDISXCp77Fw5jlub8bjElYItZx3lhq2oQk6pEwwg83Q7CcE5Dh1ygJhE3BaysIEjE8x2LSPZyDQJqwKnCYP4IQlp62wRHuJbXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=vV2m9CE6; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="vV2m9CE6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1789756468; x=1790361268; i=markus.elfring@web.de;
	bh=XomWFw+0kSaCOPZpP0EBOQVHO2JBaqhxOiP0AvbRjkk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:References:
	 Subject:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=vV2m9CE6xH9187+cLzc5thgklafibPPfvxmzD8k7K7Ja+RfLl6/IXj5XQpJXi5Wq
	 budPA1b1eOKPhSM6QPTpIAlmy48xyWIBMPkbxYyfRNtoUKjyFSAFAO5Lhi3qhzG5v
	 vOuBRAQ00isDZaVsITvR2CK5N+EtK2HzKTV2N/l0v2QNSLxmwu8oe0FGNTc3N4c1o
	 zTkVO8q+0G+pFHZHQrya0ZkYzdqL8Xg0VVTa3DQOAytmqllLGlj7BG4WyXDrxvSJR
	 7Vm/1uY63fUoq2PikKdN7xgvDG0nkS+Qp/oy9RXvVebhuEvBCFqhN0zVFbylOxP13
	 9wYfJsHhBKH8spJ9Kw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7Nii-1x8kwR4BP2-00AKmD; Fri, 18
 Sep 2026 20:34:28 +0200
Message-ID: <5256fdbe-cb76-47d2-bb7f-033f95ddc1de@web.de>
Date: Fri, 18 Sep 2026 20:34:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Wilcox <willy@infradead.org>,
 Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
 linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <aom-YjzhIG5BN2ks@casper.infradead.org>
Subject: Re: [RFC] ALSA: pci: add PreSonus Quantum PCI driver
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <aom-YjzhIG5BN2ks@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:DpwTLxdCAlTs4wbUQ730SV7x9SGClkiY4AmLYT/iNd/vpA+JNK6
 cr+8bkX6QSG8sGKPC5s73ytnCOZj/7N4g59hezyxmSd6PZdYEP5LZ298t+5jlaFIgwshzn8
 Wdr7V3G7GrHfk7WYZLpFGp/VKyf3Wf5TKwoMUty/SQdU4g/mU7SOU12Z9eZGiKuDCmEsPDT
 xcKspKYbam4SPS24FFnbg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mlyJxa+8xkY=;XKaB4c6cAXtQ0Hfsu02DxXhhZhS
 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

> I see you've attracted the attention of the Elfring bot.  Please feel
> free to ignore everything he says; most of us do.

Can the patch review evolve into more constructive directions?


>                                                    He may have some good
> points, but you should not feel obliged to address any of them.

Under which circumstances will interests grow also for such development ideas?

Regards,
Markus
