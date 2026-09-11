Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A1F2222A9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117690; cv=none; b=fpaSzZxM2ors0NsHgP0RFNzSGnrlmxoPlTOWtR+9PXILwi6r3AAsKx3YOCT3cZXYhnyFJsHdUy1GnULU9AVwkRPREcHtLTJlzCjaDnJxDisiDm1JTkgLaVna9YVhcLWmIt/1x27si3tUXWXss2RGdMpKX/Xg/ugIGRGrWMJ7ogI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117690; c=relaxed/simple;
	bh=h5Y//1jky2LEHTCcw2gY9dyBkMnJvC6xxzQH5ChrLNQ=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=nxHgYfw3w5NrA3i4rJsSngwIY6YGxBN4lDuHWSA5n0vDsQwdmIRV9YQ+RYYiWvJEnRU8jaY8lZ17mwm+6U85P46FCXa/rsdfA0yzaWMRHTejrTONAiDuJjDCS2AivHEOA22E6SuJWOZsqVc70ckx6qae7vvOkGGZtTcnpCTcFjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hh7xJ4S5sz8XrrM;
	Fri, 11 Sep 2026 17:08:04 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 68B97rcj046889;
	Fri, 11 Sep 2026 17:07:53 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 11 Sep 2026 17:07:55 +0800 (CST)
X-Zmail-TransId: 2afb6aa3c4eb72b-0c6c5
X-Mailer: Zmail v1.0
Message-ID: <20260911170755975ug1lrs9fz0EjWzEAnsbmB@zte.com.cn>
In-Reply-To: <aqO_memM4BIbFAxf@gremlin>
References: 20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn,20260911160725440VlRXkblhz6f7GJgQfbVv3@zte.com.cn,aqO_memM4BIbFAxf@gremlin
Date: Fri, 11 Sep 2026 17:07:55 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <ljs@kernel.org>
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, <surenb@google.com>,
        <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxLzRdIG1tL3BhZ2V3YWxrOiBkZWxldGUgdGhlIHVudXNlZCBtZW1iZXI=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 68B97rcj046889
X-TLS: YES
X-ENVELOPE-SENDER: xu.xin16@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 11 Sep 2026 17:08:04 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA3C4F4.002/4hh7xJ4S5sz8XrrM

> Please fix your cc'ing.
> 
> Cc- everybody on every mail.
> 
> You cc me only on this (1/4) and 3/4 but then don't on an mm/rmap.c change in
> 2/4 when I co-maintain rmap.
> 
> And 4/4 is about use of VMA locks which I also co-maintain :)
> 
> Just cc- everybody on everything...
> 

Oh, I’m really sorry—I accidentally missed sending it to you. 

I’ll CC everyone in the follow-ups.
