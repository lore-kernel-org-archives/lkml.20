Received: from mail.amicon.ru (unknown [77.108.111.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31F24CCDDD;
	Tue,  1 Sep 2026 08:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.108.111.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250018; cv=none; b=ukxwYCuowQ20qry1tLzOrYv1uUGs0GShzYDf4qPorHM9d9EkMY/updjJkKboL3PSYOU0Irkp7z2rY65eO5CNYWqa3I3X8fZIa/I41JUAAFxgkUxNrrokx4KnXsWqutLWZL+J1MXrMKhtbRSOXcy0t9GO7TPhuPGusx8CRLhSizA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250018; c=relaxed/simple;
	bh=sCcIfIzoMBaEhys9502dtin0BMmqsESCuqMcEaMVlwY=;
	h=Content-Type:From:To:CC:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=PA4dpxa0jqgx+k/yTsJvHEDVSvgJQYd7ieVlFnayH4w2fl3DC1iYfMHUnMyffzs6NLzudndSa00q1ty/8eVeLPZreMVWhUYxVscOSUNe5CDI71Hqj81ETSziqgRXotCs8g2xJ1r+jRyhQUN/WARHFFMW2B2yu5x4mPztO+cpAzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amicon.ru; spf=pass smtp.mailfrom=amicon.ru; dkim=pass (2048-bit key) header.d=amicon.ru header.i=@amicon.ru header.b=N5fGn/8m; arc=none smtp.client-ip=77.108.111.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amicon.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amicon.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amicon.ru header.i=@amicon.ru header.b="N5fGn/8m"
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; d=amicon.ru; s=mail; c=simple/simple;
	t=1788249101; h=from:subject:to:date:message-id;
	bh=sCcIfIzoMBaEhys9502dtin0BMmqsESCuqMcEaMVlwY=;
	b=N5fGn/8mi6QB61cclwC4RDSKvEHZVwFPcorW9N+x+njItlfakJf6ByPLUcG1P7VVhDq18+vg7/q
	wDpXLhBDUqYq4GTvlFv91p2HJhFOCETtNay3jiFGw3cHb9muOfCCTtiEfPhX1ObpyFieiIm/NuUbQ
	RB8UPbVl2zGZraXKGiNZFIP2ffw5kG0sUcXMt4Vw4YdFUKCQGqEVMmtZZ91Sjs+eF1bc2+Cxf0hrs
	wyEi5ral0TiDEE94+tvyv95XM1kCX7/5TnZBtctHRW2r48GMVyG7EXjFiDJGQV3dkuzaqQpHPMcF0
	D3M8RzOe4w6G7e8+LtlxsYISFj6ae0lTT2eA==
Received: from dish.amicon.lan (172.16.30.10) by mail.amicon.lan
 (192.168.0.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.27; Tue, 1 Sep
 2026 10:51:41 +0300
From: Daniil Iskhakov <dish@amicon.ru>
To: <dish@amicon.ru>
CC: <ade@amicon.ru>, <gregkh@linuxfoundation.org>, <johan@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<lvc-project@linuxtesting.org>, <rrv@amicon.ru>
Subject: Re: [PATCH RESEND] USB: serial: mos7720: fix actual baud rate not reported back to TTY
Date: Tue, 1 Sep 2026 10:53:51 +0300
Message-ID: <20260901075351.609802-1-dish@amicon.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817155324.2514473-1-dish@amicon.ru>
References: <20260817155324.2514473-1-dish@amicon.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: mail.amicon.lan (192.168.0.59) To mail.amicon.lan
 (192.168.0.59)

Hi Johan, Greg,

Just following up on this patch once more.

Please let me know if there are any changes needed from my side, or if
there's anything I can do to help move this forward.

Thanks,
Daniil
