Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384811;
	b=fXZlT5LultOzklfMiPTB92ZQXFJIBFqYvUrYz7S/x/GdBMMrnQKOJ3qdM4alZl3ZF2xC
	 HtPhV6fDgL4xSqQ+0w0NwXteyxlsVkF3+nasKEymr2POAaSIdLBKLSbxFaaDGrcfF32V+
	 DAH048FVjHRp/ImDhp7ND/ARjbnKnWTul0LD+/hkx5HrERjBpZYlFEmOZPczhcf1vsi9s
	 /nko5GsM1XGhrAPoEAnrzehBPPNm50ltgTISmm0keaGnvBP+nV59ITF+H5Z4drwZlMVaV
	 vz1W/34oUj9r9uMhF7AZ/ibCxMM9sQKIVHAVKgzsC9mnnNBR53heeJ6qMpEIUOsErMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384811;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5p59/vP2FLUaNpLtNu93J96cyvzPx+H8A5VO4vaT/Pc=;
	b=iqFf3LLyO1ANya1vm/ZndWRuLaxkyuedoC6DFhP6evo/b00oNgFnRR6U1EaPzzWtxDa7
	 t/VVJM4gN2MfP/ianfC6VWcnEegQmSRx8qiHnNroIROUe02wBiqh/6uy2QEvUIKr1DGL2
	 PjKI6UIRhpqtsXad6fM1jdRFAPfdOVAkFB+iUzbB/rufgDswIGFUddE1XJcxHHkLRaJ+k
	 8e/rXDD6GJycQYXdvMOuppmO6C3/JZtbsocNzD//9VKZ6fIPso5+SdyXaF4hkOxv6eOhW
	 yB1jyP7N9N/dO3Pgkd4UljOUFeDwTkI8f0QtdjCLd2CMr1K+dr97VKpnbZJ0dPzt8Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Hsjd1mZ1;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD46460A2605;
	Wed, 11 Nov 2026 08:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD46460A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Hsjd1mZ1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Hsjd1mZ1S0QjVVqY9JlI3iPaJhZc82U1PdoF2hp0qboc7Ni+s4wALX0olf0sFPPlGw+cumbwXukW2
	 m4w8dBzKd+TyNrccJpJM+n0Q0/Jugr5OzOl5hZujBAtBp2LMvOw7uURauUrjlcFfLLHVJuHr3e860B
	 RlZRXRKcxC4DMMm4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af4239c48a-a30c5;
	Wed, 11 Nov 2026 16:13:17 +0800 (CST)
X-RM-TRANSID:2ee66af4239c48a-a30c5
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from utest (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af42399a3d-d4b41;
	Wed, 11 Nov 2026 16:13:17 +0800 (CST)
X-RM-TRANSID:2ee46af42399a3d-d4b41
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] usb: gadget: f_hid: three GET_REPORT fixes
Date: Wed, 11 Nov 2026 08:13:09 +0000
Message-ID: <20261111081313.16626-1-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
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

Hi Greg,

v2 of this series.  Changes from v1, driven by the Sashiko AI
review and further self-review:

  - the dedicated response buffer introduced in patch 3 is now
    freed in hidg_unbind() and on the bind() error paths instead
    of hidg_disable(): hidg_set_alt() never reallocates it, so the
    v1 placement caused a use-after-free after a USB reset;
  - the tail of the response buffer is zeroed so no uninitialized
    slab memory is sent to the host;
  - the now unused get_report member is removed from struct f_hidg;
  - a pre-existing leak of get_req when usb_gstrings_attach()
    fails, found while auditing the bind() error paths, is split
    out into its own patch (4).

Patch 1 and 2 are unchanged from v1.

While reviewing the f_hid GET_REPORT userspace ioctl feature
(a139c98f760e, v6.11) I found these bugs in it:

  1. sleep-in-atomic-context: the second copy_from_user() in
     f_hidg_get_report() runs under spin_lock_irqsave(); a page
     fault on the user buffer deadlocks the scheduler.

  2. memory leak: report_list entries allocated by the ioctl are
     never freed in hidg_release().

  3. data race: the GET_REPORT response is served by pointing
     get_req->buf directly at a report_list entry's data; the
     request completes asynchronously after the spinlock is
     dropped, so a concurrent ioctl updating the same entry
     corrupts the data on the wire (a torn write).

  4. memory leak: get_req is leaked when usb_gstrings_attach()
     fails in hidg_bind().

All four were introduced by the same commit and are fixable
deterministically from the code.

Shunbo Shi (4):
  usb: gadget: f_hid: fix sleep-in-atomic-context in f_hidg_get_report()
  usb: gadget: f_hid: fix report_list entries leak
  usb: gadget: f_hid: fix race between userspace report update and
  GET_REPORT response
  usb: gadget: f_hid: fix get_req leak when usb_gstrings_attach() fails

 drivers/usb/gadget/function/f_hid.c | 61 +++++++++++++++++++++++++++----
 1 file changed, 48 insertions(+), 13 deletions(-)

--
2.53.0


