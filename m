Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798648;
	b=0uH5UQ55oELHYAc2PYb066sgxB2/Rx5pTEm/15uwfxf7Vi+T5khMTgBfHmo9ZAI1MzQX
	 LSKAE7kvMI6t27RIuB/v1uR8VRvv1leMjyetsw/m6vmzRcMmSvJCn6rKWs+eUoN+Q3O+u
	 h6Jye+ggO02EpNtHJEO3VBUjYEZ+jdOux5JiZJ8yhuLy4FoqOBPr9H6zroRBXgdluxAKW
	 uOR5KTU/Yo2YoTO7CBblEB9x7eTT6JOpikwjzGVWrgqUy7owGoeNN5JlzSTatyn8PJ9ex
	 VdgnRcxHqhh3PJkrNUjL2oYj4q64HYebT0Qpp96tCQ4aDFhdhzxw7A7GI9uJa1fN2UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798648;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ib/TsOvX0mYioLqo9PHpNPyJt50P9ND7jv2umTnaZ3E=;
	b=BUqsuZCxxb117z/BCgoCYRRvjW1pDHudiq/cvkws3cWsuoO3Xtxte+SOeGJD0ehVj/IY
	 VaehMPqAVnipmog6161/eRl8OgggBbcoERw7a4ueCdWphxWdxi+QQLLvt064156wBhYRT
	 WyO9FtCu1WYzucFNlWeG46WF7zq4uuyZkyP7PbTrnwIIepOI+AOygnG9gsmxAMiOxKOt4
	 J3wBce1XOk/m3sG/8Xi9L3hiJ47zYP5ENSJ9s0i5pD3s4Zy4dDCzIam3p4JXT3Ql8/bzo
	 d8wFC8ixcpZQlp5MXHh1SUsBhAIG9laQ5aUrsQf46A70nLXfhMFIDpIPR+Hi7tKwkuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=JWtFeB+Q;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77EC606A881;
	Mon, 16 Nov 2026 03:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A77EC606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=JWtFeB+Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=JWtFeB+Q9ETkVQYVGvtRjZZvtDJAEa7Za08FV43LRLETYBIlFy245oK7LGWpr+8QJagnRtWdGp4tl
	 zvvf+9KrAWNSkVNjhvtjc9K/l0DVMDpuRNjSsQOqjKEQPlcS98AYXk1mBvRmqjuSIEaTEBQAN6NGTQ
	 udGMT0hV1LSlIlh8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36afa743545d-c7086;
	Mon, 16 Nov 2026 11:10:45 +0800 (CST)
X-RM-TRANSID:2ee36afa743545d-c7086
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96afa74331d7-7a4df;
	Mon, 16 Nov 2026 11:10:44 +0800 (CST)
X-RM-TRANSID:2ee96afa74331d7-7a4df
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: r8a66597-hcd: Fix clock leak and unchecked clk_prepare_enable()
Date: Mon, 16 Nov 2026 11:10:43 +0800
Message-ID: <20261116031043.505-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261102100455.600-1-laixiangwu@cmss.chinamobile.com>
References: <20261102100455.600-1-laixiangwu@cmss.chinamobile.com>
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

Hi,

gentle ping for:

  usb: r8a66597-hcd: Fix clock leak and unchecked clk_prepare_enable()
  https://lore.kernel.org/all/20261102100455.600-1-laixiangwu@cmss.chinamobile.com/

On on-chip configurations r8a66597_clock_enable() ignores the return
value of clk_prepare_enable(), and if the subsequent register access
times out the function returns -ENXIO without disabling the clock
again.  The patch checks the return value and disables the clock on
the error path.

Is there anything blocking this patch, or does it just need more
time?

Best regards,
Xiangwu Lai


