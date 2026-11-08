Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165401;
	b=Z7qomGVWFXElzP7ScNhERLS8ER3S2AG6YLa+EdlbaLLgTtqr/oQWhGjl+dQVty89UyJB
	 vO1bS60w+gYJn4g+VwnR5Vn2ujHhmjqBW7ym3Fh5P1ihySq7elfVQnjxCC/WP/nbq37dI
	 eCZnkq83gJBzWR4kK3uhuvOhlR0ByiKcu/Q7p7pc7GvXz4XoqBcg73ykZL63wXZlboU4L
	 ZDs14uAd/9l7XFILNZWAGIG4cuYM22txHflvSOvCj2mpFPxyTr6B20uwi2pwM/TmwD+5C
	 hRgCJR67daQS6QjXxNQt7uUfsykVCXjzJgGi5lDnFoaX7Ux8r3CDlF6QEOX6RHkUcLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165401;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WHhmKLeDTRwj49XIu5uDDUoPAxMbsDAkiOYdqoJD4ew=;
	b=gyTIWk3S2T/wDXwmUVQeuFWWNUSmee7nCRgwwb+40D8JJo5yXxk1/zHCwHNoHMrIe1q5
	 QrT4AHOP4vsmLEj4m8X04rT4gNw6oaQNIOibmdXZqPHiUqgLFrKO6lNlhKK6gC+cPmdqD
	 rPlmBRPDo9K7sFYgT0vrfZM/CXYo4GGURL/4+kcyrYpe8DOcJQXjTXClBA89dgkZERnn/
	 z1QiJlOybNMBFh8KFeeO20T034XWEZoVhZcOOBx01dATLlhR4Nfxky7EzcFsn5yrpSewr
	 MXiBZFGFI5ZepTZEx4H3ldcM4kBOSFPlSurrXitIkbc01BaBXL5/e2QGr5zIxjJA6Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=JHRG5Dou;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=LBX4T4nJ;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8E8606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C8E8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=JHRG5Dou;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=LBX4T4nJ
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1794165392; bh=WHhmKLeDTRwj49XIu5uDDUo
	PAxMbsDAkiOYdqoJD4ew=; b=JHRG5DouWApyhWwlX0Bp/9rj23q3hL2PPjXD+o+mdzDIqrtzma
	rZOUmsZwvBFMG/puAYYUFiO7JSzWcbn9th2WCih2JfG3+M+HMUr2FNaSgXgQT2EVACZN16CaDwX
	QnY9ys11FCCIeJ8feZKmnGDjS+/Zbi1b+AEwp0scZdsdMQ2X1wk3DdsMRBfC1YHuHgnjE4mfb2i
	4ovf3er/hDEs20mWAet4m9JSwtmxb+rwBApgEm8eRjqyTB6TLHTiQjOAIpYKWvA0jz1BGY6GT+S
	OYCN9OmueABi2lJIFJij0by6U/b0hCVYp8Ek7Ut7MV0c6JjO+E1O0wifHyKuarN9AJA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1794165392; bh=WHhmKLeDTRwj49XIu5uDDUo
	PAxMbsDAkiOYdqoJD4ew=; b=LBX4T4nJniBAGZcdTcf2e+GoUy1oHkFu+GxvgU6Zk660CFHpOk
	cLArrN8h1n702/4w8mKjUsHLZfxPgPbBkbAQ==;
Date: Sun, 08 Nov 2026 19:16:33 +0000
From: Bradley Morgan <brads@mainlining.org>
To: kizilgunmete@gmail.com
CC: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Add kernel.cpp
In-Reply-To: <20261108154503.17529-1-kizilgunmete@gmail.com>
Message-ID: <4FF24E39-CCB2-4D12-98A5-C711ACAFED34@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 8 November 2026 15:45:03 GMT, AwesomeNick <kizilgunmete@gmail.com>
wrote:
>Please add this to the kernel now. It would be a shame if you don't.
>
>CRUNCHY CRUNCHY, MADE BY AI
>
>Signed-off-by: AwesomeNick <kizilgunmete@gmail.com>
>---
> kernel.cpp | 6 ++++++
> 1 file changed, 6 insertions(+)
> create mode 100644 kernel.cpp
>
>diff --git a/kernel.cpp b/kernel.cpp
>new file mode 100644
>index 0000000..7202cfd
>--- /dev/null
>+++ b/kernel.cpp
>@@ -0,0 +1,6 @@
>+#include <cstdio>
>+
>+int main() {
>+    printf("I am the kernel's great update!\n");
>+    return 0;
>+}

Oh em gee! Best patch ever! BOI

Reblonked-by: Harry Potter <harrypotter@imnot.ai>

No but seriously this has to be a joke...


>

--- Thanks!
