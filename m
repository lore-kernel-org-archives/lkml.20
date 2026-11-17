Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919861;
	b=HYrn5aPHRtr8XOxOOcZ2OyPWKnWy/FnNj1Hwk440aNdcnXiZb+2xgjc8GsYZKyTttNNT
	 bFrMa5vF0dHK3MBgrvAWSSMVHjSQy9xZIh7HXjuW3AtD9bDKDjfnUaXWo1sAXSEWIVD/o
	 +PfPyLfWr3xdSb8hLpJH4v/TBfRE8UY0Xj74Ptr5r8oufW2mcU8P7MftEs/j1ZkGOUhlG
	 SwwtewAMOl9utFODtqCR9cfjVLw+saD901EHunHvZ1s4rJYLPdw8UkwaYlLUnV2U01jYx
	 sQ7g3mQw8cSRgZO0M5hfnrXrKE3I74ONFSIr9RQzq0oTV5EVXyysB4CM75mWxFEsBbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919861;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QtamuS0YltAetZPlLXNxUbQrgTbuGQGdLQ9mnxmiNw4=;
	b=bKhRQzI92twUvRTUgB1etGEUzlWGvDMsJo7rvvLzTJmVjNpbxZO+ImJqDa80OWqTQWYM
	 Ei1Z4AjeUEVwQ+HcStbRlivi7GUdVd65ULA+Whceh4Z/KlEX+SqJ/CtjtAsyvaPSBj9NQ
	 7sbMDSEikDBKNiec+uQIRcfvSxjRTZC8Tp4RYEPsxjgdXthA6MJZHOMyVTA0+iv26qmJo
	 yUGexhpl45ICVOBv1GK/bDeuAI7i5BmsSyOayJA9dc7zTXac5AAPS3m1XNDC7blGu+/rV
	 WHdG0IfFTu2XZ1QmrznBIU6fQYDXsADMKw2fIFrdyNSo9jxd6LXuGL/ir/q/QmZzveA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="Nh9Z/9vj";
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9927606A8AB;
	Tue, 17 Nov 2026 12:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9927606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Nh9Z/9vj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Nh9Z/9vjWw3kQcJ7AM3BknE+O3JBBnylgq5QYAjdqINCo+K73KvMWfp18yqL+tFzC6BIwBY3e1hjf
	 OgjwpIzXC6SCxMfBpdcAwD+SxQ2emHE1SlBJDAHC1ib4sDgkiJdodVNCANQMALXLjXpQfBQAAH7vJE
	 AqPvonveVyJIjOzs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66afc4dac60a-d76cb;
	Tue, 17 Nov 2026 20:50:56 +0800 (CST)
X-RM-TRANSID:2ee66afc4dac60a-d76cb
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from utest (unknown[123.121.1.242])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afc4dad71e-b1c0c;
	Tue, 17 Nov 2026 20:50:55 +0800 (CST)
X-RM-TRANSID:2ee66afc4dad71e-b1c0c
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: nkapron@google.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 0/3] usb: gadget: f_hid: GET_REPORT fixes
Date: Tue, 17 Nov 2026 12:50:48 +0000
Message-ID: <20261117125051.5646-1-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179486710796.2938203.13522037990167268712.b4-review@b4>
References: <179486710796.2938203.13522037990167268712.b4-review@b4>
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

Cover-letter:

Hi Greg, Neill,

v4 of this series.  Changes from v3, per Neill's review:

  - patch 1 (sleep-in-atomic-context fix) is dropped: it
    duplicates Yu Zhang's previously reviewed patch [1].

  - patch 3: Just copy req->length bytes to keep the existing
    UAPI behavior suggested by Neill. Thanks!

Remaining patches (unchanged from v3 except for the race fix):

  1. memory leak: report_list entries allocated by the ioctl
     are never freed in hidg_release().

  2. data race: the GET_REPORT response is served from a
     dedicated buffer instead of borrowing a report_list
     entry that userspace may update concurrently.

  3. memory leak: get_req is leaked when usb_gstrings_attach()
     fails in hidg_bind().

[1] https://lore.kernel.org/all/20261020051446.92179-1-yuz08559@gmail.com/

Shunbo Shi (3):
  usb: gadget: f_hid: fix report_list entries leak
  usb: gadget: f_hid: fix race between userspace report update and
  GET_REPORT response
  usb: gadget: f_hid: fix get_req leak when usb_gstrings_attach() fails

 drivers/usb/gadget/function/f_hid.c | 34 +++++++++++++++++-----
 1 file changed, 35 insertions(+), 6 deletions(-)

--
2.53.0


