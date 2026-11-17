Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913789;
	b=CMNTIiirc4HXj24UaKtIDB2/QP8jk4cSn9NtRt1zPjH1WsvGFTtFbRjp0wdSHO5KPyvG
	 TydVae6Q3lvsFKAlIhCernINR9XRk9DjPLbzZuNDTHRzFjgo02mty38Mu0uy7OPphQbKi
	 EocOLhhrsgk7UwH72CIYy1HWIArPr/mLLLyf3e38s9I4QBK0TlI+d2dfe+N06wiySiKY8
	 5yNYe8zX1rlo1tdI9136D7QCpCOyiZpP3DNghejCXpSjRcW+mIM0G3QQ4ZFwYO7o1Q4ng
	 NZGZfHw6AiX6TErzhzNK+5iiYWx5XMcGjyo2kYByQtcbYbko+utcI9MYq98/qSYgcOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hpmM4eFRun76lvi2NsX7aNzz4o3nnQQCjWbpPZyMB+o=;
	b=I0QYD8ZLWAEN2aLOa8ltqG/Y7pijNnumFzLCDt0dhgpBs3uInogsaHLfrpntChyMYTb/
	 knYJ6nBAv6h2pvxUNG//3+xWea6cS0h2wHunD12tQFZ748hw2jdrp+3du2qLylVSxHOAJ
	 NZTPWVZsMqnqP1h06UGfeULlRVi1T/Yj/eFAhO1r9EWZUnKQPlDww/xhNuc4E8NIcuCtj
	 pIIx4pC+t+L+tWyXfeULKrsdm5DzEwfmg2EI8tA1omizawiArbhcJlo4rY9kGWq0mS1L6
	 icaXlwQlY2YrMrWYlssQWeDKZwd6+09EG3l/hDM+9uLMTbG4uZcLgD45pFMNP+N0L4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MD3kGh8N;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E92606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E92606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MD3kGh8N
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38190551625so680423eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913788; x=1795518588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hpmM4eFRun76lvi2NsX7aNzz4o3nnQQCjWbpPZyMB+o=;
        b=MD3kGh8NkCjvXmoC1i4w2PtRphlsb24xAOL+9ggH1ZTFw0LQ6UvUoCXyiAzNaJp4/u
         6xwiO6o780CNXl7+Vga8jetTnOWcpaQra54nhden1ttLqc2oaMawb2LTaCTQhmiymPsV
         G24D4X4DmnUlcs8CYBjq4F4HGAYoKvpAuEe/IRJaIR2WdQKHXYUxk64Ceq9dUnA5mDwP
         WOcCwdEHVLuAWzSPRUK6sN8TvqE6G8LKtHNfn9TyoJjv+RLd6gss4AATY0u+4J6N2+rQ
         h7I/p+m5/2VBSQjS+Fcn45nyrTJpXD1qHAtWPHqqep+oBhuF6iwc+CJ5Uiogkh2Y1hqA
         l+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913788; x=1795518588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpmM4eFRun76lvi2NsX7aNzz4o3nnQQCjWbpPZyMB+o=;
        b=hlKZYCuJgliKynqkVWb9Re6gLS0tBXHvRKkS4SrNUKT9+Gsrrims2HzjrR7wArikht
         aLKPW+hBtYewbQl8gS2k9OiEgPuN/CHO/L8GgjCuUu4RQrYBhzoJFiRS7MoUM3vn5K0k
         p+/KC7sJor93nilekpTW85xrAhJ0zqpCoQXvCVWgkiqnOI2d1+gzHZZmd+NaWf0UXH+r
         9STOFIwWkSP7P/qa2a7xe7EsZ7ZH55SA4fuZ+XwKMV3/gwLHhe0fLy5yHrZvO66cSY9Y
         H+0oikh3qofyPjPsakYXrzostDYuSX5+9G6KJ4h+/lpCOJOA8bb4WPciuaihJo7nPwHw
         SfOA==
X-Forwarded-Encrypted: i=1; AL+hErHWP/Xwv2htZSUjuRjuIlbu+vVhxaaVzR5kVoKPyn9syxx99oS+O2mmwAx8JAlun5TyUsN1k+9o3QEdzbo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9U7Y0uJF9ppFA6kpQqxxCI9C0GJNgjDG+ixPcQ3NMQLXQ57hgz
	BrULZ7VKGe33zHixWxSC7L5xWmamk9bSykK5AbVuy6uFGu2AB/Ie5BKd
X-Gm-Gg: AZFdTZfDV9Eb+yE76MtSj0cjpHtH+X7B+BN+9W2gNd5/mrHcu2nkL9PhsMTZNmo3F88
	duMX6K1VhghWmgBNtlLQ0qThKbIhjxzJYr4bKc5ju7e0rpcr0kQOhslVZoPtF4OwZaFNwwPLduW
	VOVj/dNuw3xmLf8z3JnOEkM4CRraU3MbfMuhLkl9c1/HZ4b0V52cUpeUxVJXbw/BwpHwHMNma5d
	zHRAJ1Y+SKXORAWKlZsGgIeDH95oqcx/hP4tXt+Zj/1ZU0zuWwp7dw8rxmqQHf20GPEdHDltxBu
	SPA8bfohH5gTFzR/SZcf/RxYt1YL3ho0oRlK0f3pWbvlHKqj1JOs2wtSLV9kl5XVJ1ccTtyeZYI
	brKrNAyQDDiGsk1hsiISP8ILZu0QB5lRxcB9y8W9GVxyRqzhje3jXWmBpiArhCFWwHG2M+OzStU
	IKJxagDqCGPW9JCxcZe5gbUWs7S8D1GLtWVTPU/JI8a2ZUlYkesQEFNOKDGa2NSw94OMSC9BEhZ
	B05pSxZ18uyvfuQThXH4P3+rjwXpInlEckF4VmwA8xc/XKpqxXTuM9hOLr6meASxdge6fDKa4tP
	stczbviNcMuikUtPEIxKe1eoODQLvMs5mOHRPU+/0jf38QS24vVTXdF3G0AiVu4tiZlpAuEhG2n
	MQ97AXtlPsGxLfKuQ1DOH4XRSVRiIVVlcgjz4IJEQhyHOSVlFZn8X3ImnFh5z1wXQ93ivKI2wlz
	s3o5KUFbC0Bo2C9aQVZkWiXbHEHnWFYR+3FQdjM/Nmaw==
X-Received: by 2002:a05:7301:70f:b0:381:eb93:81b9 with SMTP id 5a478bee46e88-381eb9383c7mr522846eec.34.1794913788282;
        Tue, 17 Nov 2026 03:09:48 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-381a55555dbsm5560475eec.10.2026.11.17.03.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:09:47 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>,
	Daniel Campello <campello@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 0/2] Semtech SX9xxx: add a reviewer entry and binding maintainer
Date: Tue, 17 Nov 2026 16:39:33 +0530
Message-ID: <20261117110939.214932-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add a MAINTAINERS reviewer entry for the Semtech SX9310, SX9324, SX9360
and SX9500 proximity drivers, and add myself to the maintainers of their
DT bindings, as Andy suggested on v1.

Changes in v2:
- New patch 1: add myself to the maintainers: lists of the four
  bindings (Andy)
- Patch 2: refer to the Link: tag in the commit message, and use
  sx_common.* instead of listing both files (Andy)

v1: https://lore.kernel.org/all/20261117094737.15253-1-kapoorarnav43@gmail.com/

Arnav Kapoor (2):
  dt-bindings: iio: proximity: semtech: add myself as maintainer
  MAINTAINERS: add a reviewer entry for the Semtech SX9xxx proximity
    drivers

 .../bindings/iio/proximity/semtech,sx9310.yaml      |  1 +
 .../bindings/iio/proximity/semtech,sx9324.yaml      |  1 +
 .../bindings/iio/proximity/semtech,sx9360.yaml      |  1 +
 .../bindings/iio/proximity/semtech,sx9500.yaml      |  1 +
 MAINTAINERS                                         | 13 +++++++++++++
 5 files changed, 17 insertions(+)


base-commit: 20ce8ef9c9e04cd6c5ae0422e251a9b5936c6b7c
-- 
2.53.0

