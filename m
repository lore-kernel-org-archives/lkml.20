Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794800380;
	b=lK8DbFDVENDW+nDvMrcfm7lFx4DZWbkW4PewDAlGVouPDovTNnB2qGD3aAOB+Rhv8gnx
	 F0F2WFkfzDazWi0LylIXWRAEsc/LDsKpRUaWDRrVQP2OYUpwRXQ9P1WiCK7qQutXq4TeA
	 L/fodHn3iDwyntXJCxtJEbZWsntTUus+Wsq8Jbu58eeRrJ3ddlU5XFKn9wjzx9mcxXDAe
	 EWpHaKY4JNVa7fPVlhXNj5+eQ3uoAqQbSGnjBnF8o9RJGdf5EYLexIpFF4//JOtiswrH/
	 LJVlEAUHZA9XhRHynDxMrl1JZ731viugxpbPkLR4aHMuQIcDTWBcDFDGxMecU8yudJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800380;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HRGDjehKKUWoG0r3LnUHhSCDs695Ox9bsthRPW3AfKs=;
	b=SCts5vH2KRhLB1xm8Oy0KA/tV/FSCjVsQgZ3Me139xE1hO7epZrs0IUEXH1JeOUqjMEK
	 nJKxPTjc4oX2r72DIJaRGwJ5K38QPIy6Jr6OzFsThaN8bZM6jlkfGYCrgQwNQ43C+bH90
	 ap4jX+MgE27peF+ZHouiBekuoX/ujexvBVjvvvjfjPGp+12U1vbNS+8hSEehTNaReSbU/
	 hbpwIBu93oJHl6MWg+BOQF8D3KeV0v89AKNTKAvtjVasCqjgEaDKTkzqEpk/uZu77gphV
	 9O0AsiW5OEQIul5sFValo6dTsZfp3V3yTQ6Dx7CzhjUBbkbgksd8xZVA/PMr/MA++Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Yf4zt7AW;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A341E606A321;
	Mon, 16 Nov 2026 03:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A341E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Yf4zt7AW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Yf4zt7AWXnplUEExzTTbKl/Z5j3+TTwFwUVJo5Sc5Al0bMHpAiv0j4ZgUOub/ODfCcD92z4AXhq3t
	 SE1wgPeXcb30hHiJPD53i7bGL0/zFtCc06fYYJGIwhchowXwzrr2M41fX04LLxLMQPKPAmnah06QTB
	 roxuH4m1CDS0fZH4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16afa7af7a13-d721f;
	Mon, 16 Nov 2026 11:39:36 +0800 (CST)
X-RM-TRANSID:2ee16afa7af7a13-d721f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [25.255.2.225] (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56afa7af7057-7b58c;
	Mon, 16 Nov 2026 11:39:36 +0800 (CST)
X-RM-TRANSID:2ee56afa7af7057-7b58c
From: Jiahao Xu <xujiahao@cmss.chinamobile.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Jiahao Xu <xujiahao@cmss.chinamobile.com>
Subject: Re: [PATCH net v2] net: usb: cdc_ncm: don't underflow the NDP room check
Date: Mon, 16 Nov 2026 11:39:33 +0800
Message-ID: <20261116113933.562622-1-xujiahao@cmss.chinamobile.com>
In-Reply-To: <179466534452.2199510.12286844115122956221@kernel.org>
References: <20261110151624.696101-1-xujiahao@cmss.chinamobile.com> <179466534452.2199510.12286844115122956221@kernel.org>
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

These points were all already addressed in v3 (<20261111124156.637661-1-xujiahao@cmss.chinamobile.com>), which is merged as b507828c7b61, so there is nothing to respin and no pw-bot: cr to add.


