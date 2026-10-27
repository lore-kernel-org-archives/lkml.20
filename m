Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102541;
	b=ji1qdTsir64zuwvqyazNYOWTIfFPEM9OTOANN8jTeTcQ+igAgwzi90oJCIkgjoD8u+Dr
	 jKOcJ3qqS5/qxQ8MxcLJ70etBg/POhYUxN4YDbofMgLfF8z3OJtsMoPX01xhSGwmH6qbo
	 9ZQ9z53+vsf03y3LAupvMLXFekkvOxp5kulSPlIfNPyrFzNRmfUGJdAmTdre1yqGxeGdY
	 ZM9rBl+bipJ7Al34eUJV/nhay296Pf4SpRlIWTB+TOP4J+hbuMikK0W94YhOjJeKPvSIi
	 sIdeh80q/xzZPpZAzaY4UXP+9yt8HsY+OiuCyT/KoWs1SH5Rc7HVQ5LHdnMXbK218dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102541;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=oiXXrK5XUhCQ/lY1EPdL45y7v9Qer4AGRuLuUGftMJc=;
	b=TxWnvhxIaQWGkvPbNQPLE2GeW+9aLQgvs5D7jnTT3Dit4qjiLV3FCXA47FlW6qNCLkS2
	 wHjMoLEx1FfKX98jw5LD2UXYhgU+79kvpK1qe/h8f+x7GrqVz+9+6EH/fxi+fZr5Vg0zV
	 forCHVF4iZbzVoxTlAVHR7rlQEjRvLEpRtVsEFUCFG1zxaNH6XCdkFVsm3yZoYbJHs5xI
	 PgGSMeRSVPG4/CUlXz3ImRmWrhYZNjgY87LqxekaRLuBQLNM1SBWIbiUP32NZlJ+SzYdG
	 wkRI4zLPj7AQGo7zKrfEDKyzNIYVBDNixfA8cGZv+nmTxG3xO+EIuWweCBxEcCn+ZWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ugreen.com;
	spf=pass smtp.mailfrom=ugreen.com;
	dkim=pass header.d=ugreen.com header.i=@ugreen.com header.a=rsa-sha256 header.s=pkvm2402 header.b=dOgaz7BQ;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9C0606A325;
	Tue, 27 Oct 2026 12:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F9C0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ugreen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ugreen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ugreen.com header.i=@ugreen.com header.a=rsa-sha256 header.s=pkvm2402 header.b=dOgaz7BQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ugreen.com;
	s=pkvm2402; t=1793102521;
	bh=oiXXrK5XUhCQ/lY1EPdL45y7v9Qer4AGRuLuUGftMJc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=dOgaz7BQsIQNRL772oYMowsALNnSnzXNX6a1+o/pPeP0yA9bN2plNHWy9zfiB42Rk
	 wYHtMxnfNiZui19L+DZSJW7+4nlrk/kXF5xmeEO22DAKe0bMGOIZSoV2Ag7m4mDHxM
	 hnPrrqsD//6T+Se+tQgkF76PEm93+Pi+u7io22Bc=
X-QQ-mid: zesmtpgz8t1793102519te83624a0
X-QQ-Originating-IP: vwT+2XdZ4MX8XZnGFvH2PgtxvUTlI1C3gA3afL6xN4s=
Received: from localhost.localdomain ( [183.16.167.206])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 27 Oct 2026 20:01:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12006375968116155992
From: Haowen Bai <calvin.bai@ugreen.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lukas Wunner <lukas@wunner.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: pci-quirks: abort xHCI handoff if MMIO is inaccessible
Date: Tue, 27 Oct 2026 20:01:52 +0800
Message-Id: <20261027120152.4120138-1-calvin.bai@ugreen.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <02C44DCEA968C75D+20260914022743.30852-1-calvin.bai@ugreen.com>
References: <02C44DCEA968C75D+20260914022743.30852-1-calvin.bai@ugreen.com>
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:ugreen.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: OFUsiW5hnxqhTdh29nDsz1QtMGxXnFY99vElRmj6PK2Dxe8US8ms9vwK
	Rs27Y7DcI8+XtE6XzdXyStf3iIny82C4AUyUW1gvsIRbT0Lz0E2tNghBJpYKr+Mw2idEk+y
	TkmDPyoFVsyiKjgbEuGePQA53EHhnVuFGGRCSqNRYy1xWxbt5iou6YiMgkU2Eg/LewWvG3x
	UUUgEWLevWNLP1Gh44HOU6tuWXCP015NivfK83+DDdO+GT5OBLgGFeVHVLHg/Q1vk/f7AWU
	ksROJL0eNRr89Eit3LSV7QumCWF0vGh9FkbddmN0vU4mgtj933GcnJWtVEqQU87oefiw7bJ
	U5V0+ZYLzR2jbf5UG+2/0y7UChlG3U3z5TpiXg455xWA7iJF33XpBqwgtmgcNrC9sLz5Jbk
	oeo0xrdKgaxdue95iT6BiNIcP83eOIL2owPeSF9lH0cJ4XFPh8p3V3IjvLG+EdeqK9toFl2
	ciG/boym3wfB84cr1wgy+bONBxpyQbutc9YlwGPfpX33SD4PbHZzCZFW6LzNb4aVzjW8//8
	q7p4LiU266CNYUI5wtwtnZzp+n8hXOElhQu3AjqsU9RmK0wQvChpt9LZZmPGL+EVWYfLeOC
	KpQbM39xtWQoO9KkjfOIByem4AWoadSO97qi2Sgm8p/oMuTlShAoXK7P7PvNMuroC/7RBzl
	Flmu2sxr/97fAXpCQCTFwD+geswk3ELODrEdnyGyV5aUJ7+bcuNf/l6DUB7WTtaPSyD3/mT
	9W+vseqExOiMFvpp5gOXI3cTDsumehZhFPACbaNQXXAcumllAayDBXgO3ZVDjR/ySeeixBx
	GGMb/ZgRFJsfp1WMlWaWgAkDZ587u7mUa1zjBP10623Uvl7dXYr/WJGU/12hKWmY5KAL53P
	OvedK+yItr0PGLZQHkowxbTeRsJqSPrCMlWKs4QPMf8aWKJ0hko+vD0wea7BgwDajTZlmOp
	9zWqnSJ9e5jybltfn2zyjOxachDKC8NfNFo7uzK9jnCv5r00nvrPKHVKtn7Q0llvUSXw=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

Hi Mathias, Greg,

A gentle ping on this patch.

The v2 incorporates Lukas's suggestion to use PCI_POSSIBLE_ERROR()
and carries Mathias's Acked-by. I couldn't find it in mainline or
the xHCI/USB integration branches.

Are there any remaining concerns, or could this be queued?
Should it go through Mathias's xHCI tree or directly through Greg's
USB tree?

Thanks,
Haowen
