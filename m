Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1E23DD86B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 11:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788608389; cv=none; b=GhY55gUq1vULy8AC1noZl/jntZ8YwEqe8dL6S6YaIhBxTrK6BFpdixZ0vaamZbKV0SXALhw+g2LHYPrmBqdo6XwKQzIubIqRDmEjhaIuVc1bu5Q8xcolU+lSXgfWufaMz57ZxTeVeCkaDyc1WEBjDUpI5/CzkxnfHTQG2ZBNw+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788608389; c=relaxed/simple;
	bh=lMEz9anmh29niSjIZwxuAScbscWTfZJBraDziYakze8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOEhM3xtiusvsfRcVmaZbZLq/r/+afiAx//GDU0UxmHffZgClTnPw3lkXc5Mk8T1wiZPKPOiuWytXQZYidMbIFBleEqVw+MriQjNDNXArxBtypGGHY7In2aVSEBqjhhXxdeWBliSVrxEgFhP+xmgNTPhQkkeh8xseRcI1RiTfs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=YLL0eOp9; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="YLL0eOp9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788608295;
	bh=lMEz9anmh29niSjIZwxuAScbscWTfZJBraDziYakze8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=YLL0eOp92KfDzX5XrS9yzVrZ0o2uNRcrgBHhhFlKuk+tJ3bhATkgwJIncM8IrsOTN
	 0fsUWMengTy/aKtkau4Euvexf4KISeYwHnyChmesVbVNElwAcxQp+vBLe8nyuj7jmf
	 IvGTdOtFq0RSizk2NHHzZgkOyO8wQQIbprg4dhMY=
X-QQ-mid: esmtpsz20t1788608293tef3e1836
X-QQ-Originating-IP: 27AhG9p/djI9g566/XZgLSrP78IAGNRiW9q2swTfNdw=
Received: from zzz-PC ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 05 Sep 2026 19:38:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13578306995493492248
From: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
To: ljs@kernel.org
Cc: mike@recall.ai,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	liam@infradead.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com
Subject: Re: [RFC PATCH v1] mm/madvise: prefetch private file COW swap entries
Date: Sat,  5 Sep 2026 19:37:42 +0800
Message-ID: <2FDC4C32B782E1AD+20260905113742.2201351-1-zhaozhengzhuo@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <aprY-BekgYlsK-Y9@gremlin>
References: <D758D1DD4372AF8E+20260904100919.2139680-1-zhaozhengzhuo@uniontech.com> <aprY-BekgYlsK-Y9@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NZoGRXcpWFb2hwuvk/1/X3epi2FQlVQXqKx+HgMb/SpkhwUMBLEA7r+n
	kLXsR4FAUKp2BwwXjIHSKdiSqgPrwm2gtcMwacsFVSVqW8vFXnsJ3mwVpohgKlfeXuE4Odj
	a13a4SPUwuA4NbJMHs3CsibOuogxalc74gAzHdTwZsd8HagXvtu9F4Mcm1KDssOj8fJUfql
	FUt0S/TrgdWN5gn+5XdHxm0n7Zgg4NgwcnmmxLrK3MRONvW7wjjwPrrXNJGqn8xRiOCjk1i
	EKgEVYxs/8EGnoWMTBBdilKhP8+fsFhNp0vWxwUhhduiS1aQC2xPM0O6NO6HSd4x/H2zi5W
	omJwmfAdqEm3XpNyLGR1AO+5qDqtlLFzQFo9bJszow/CbKwicL2kcK0VXv7AqaiE3F3GXOp
	OGLKbu3avGBrveBxCbwB8tv46ihv4s62aR621Aszy30fa8zwe3jDG0S78vugbhQnqBDkHFB
	9jRsMMrXttp1D++/50X2kg+45D3u40DT/wKm+xZACRUMm2QBifahpogFZgffDhNzWNGA7FJ
	hGRFe7ae+jw50Y1H26WljQC8VtpQbOkzwvwtjpv6KRXxiZ+IR1AV/ivpJ7vbrb5HKoeAyaa
	0qsvrm7GkSxTeBm9c7ZKLkN5ACAT6AkQ+XodOXRfM3xDC/12Fyjqd45W6scz1sK+idtct3m
	zc7HmXFa6Od/SwmB8ZD6ycB0iHbDnR7oUTlJmW+iI3tOBKkDmYxBhsd6WHCk18SHUgAUkIO
	BvwJIHM1B2WA5vLGTVs0O7eEXy4cevUUrz+2PtRE2SzdeTm5ez03kNq9XVwTWOn5PubdIp0
	RwBewKxZtWL5uODPxmXagC9LB/gvJ4HxSwt9Pa7Q77zb/FU1kLBjm64b4RR70/l2KVv1ZW0
	fEkzqqtsI7TB89hHaYKFauBiZArnfBUd+KJ/5fCUn0lPDZrjUU9+o1IONV+uMxmq0EG/XWA
	F2hLvuMmt4YYWGiF/AEBtDdK9MQTy19LNb6lsmRErrwEthAQRcjN+Mjn93kz5q5oz2gprRb
	w5QU4l7CLlkJVAEVUNEw8XdB9dcZRj3cUSOFnMQ85FzsTCGlEr+2/2eDsFEMUNFI792i1OV
	vJs3n46qomq
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

Thanks for the review and for taking care of this.

I have gone through the issues you pointed out, and they are valid. I will
pay closer attention to the complete thread and the kernel submission
procedure in future. I will not send a v2.

Thanks,
zhaozhengzhuo
