Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722379;
	b=SSkYBBcLHGjwnSpmlWtQuhm62VyVY/EUSiaoaqZOqvjkucrqwlrA3EEpbpGFVMBC0h08
	 LQ5/WX1PRWLYM0bJfbhFx1v+Jsn1oEyw/Z1WNQdhWmJQdiWDTKrwzMOitM9q/gCULgJt/
	 ZSmmLRVeSCS0yOtLbdlyaGplLnSvz2M+mxd+blJvZaeFTp+LlSBiW2dgODY9KLsXPDul3
	 Oj/Mn1pBiFEY48J/MK4/ehSh1dM/tiM7IAORv6I21L8/XnSJssDbH3u6tmPg5IGvPXKAh
	 lBI1NU7qhrQ1mEkXoY3n/1lNc2KYPk4nwmoavOrpoftWg5x1i+AtcjYtC5phJoNhz2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hSMTNzWMANqWlYxsoyKc+GU1Gc89Y6rRwgx6/XfOORc=;
	b=CTXKq1KpbDQ3TmfNG0e6Y1M4tSahL8RRGd9SdJTsxfjaRa3ntJeQArObi7THZeX+VIxw
	 a+H1ljbUJfdl49u2uBCENOULA7opyR3+heVaU2SBuw+eSTDnwOq4bOZBXHGwCv4XodesB
	 PjwHdoE53Jv8pOTqsKUtlbAR0dZ7/KHasnKyLESkD27pvNqkh9f0V2pMm+qrx5kiTezUX
	 fIm+7tILR1/3vcTNW9Db89OfOTmBo+i/F/plk0oGDiv13tys5W/Y9FXoj0fVzrKn1CWRS
	 KcTkLhqpxZyhRktN/kJ+68GreDeP4AxGw73MaKCYEKybQAIHJReI2ytL52ywj0Zg1lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=TCYWmWZa;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6526606D80A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6526606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=TCYWmWZa
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so7356282c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1793722378; x=1794327178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSMTNzWMANqWlYxsoyKc+GU1Gc89Y6rRwgx6/XfOORc=;
        b=TCYWmWZaCqFgI85/TpfZ98KMVon3DiDgKRYugDv45+Q8LmWrfKTWHmkQVREtB1tiRx
         HQaCVwM2bFCOsFjmHDsVfvukyXkLHpeHkz8L6tzGFmp4Oy7hTXPOgDSK4F+bz9ZM1nWn
         ZyybP4J0HhQdmsKH+71+tD5JoXFNwrR7dXp+ONXXGxcXQm+sGr3EmsChLgMSeLCvTYB6
         lglkvAXOHOuUbxWhreMXGQ+nJXAk/p3SQTCaBhJxEumAxdM6p1QY1sPEAFaZPIDIki6v
         rRfxKuigPTgOvEQuuUZZ8BD4LNbeIy/kgQYu82lGi1BCREYdM2Tn468Am15+Z/b54pcy
         aN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722378; x=1794327178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hSMTNzWMANqWlYxsoyKc+GU1Gc89Y6rRwgx6/XfOORc=;
        b=S1geF7cMugAP0yTHmBt6L5rcE41GUFTTnzvRMqsGpU7nw19f2UadmsvWcUhmp0ybik
         +nKlxh65+ntuVQQlXku/j+1nwoQbGPJ8RLAxlhfY9U6yfpVNT78+cOfE4E1nMFueGED3
         HC5ejd6yrbDlfSPFMPriVh8t8rUzMCJftHAP8NgEob4mk0JzL3A6Bs2sfPlIY+UC/U+H
         1az6PUGkwmQXAl1mgKPgnnY/ulAjXmdQRYM+tkrFgSLmt+oe91OibDASfuqf7hSrP29x
         MOLrT4eUNPHxyVvC3cyP8DlGwfbIPXdLgNMuyvtKabROHLjrR0B/OMXedec4Wgp6r/jT
         IECg==
X-Forwarded-Encrypted: i=1; AKwUvBwBteQSqbuA/AF5u6yw394LTt+jA41qhYkM4aua2nanQ05Ub28yd4RkcCF6EQMongKZhXvSX00Y/CGbqv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Yxd02yD28jIghCHWxllO61mMZq0zgc46jFK7eU7u+StuTqA29
	662if384uS5NWnvdiyDu7ua8fnFoH9m0NtsyD1hMWJlbOC/mrCEYB5gJYRUkG5haYg==
X-Gm-Gg: AYBFou1ItcyKfc/K20WdK3wTVS+hoUz3RyHFSSIHUbcgkL/1oaTsCOqjGEmmb1PBBRK
	UsmprRlRtHi5hm41yCwvw7GzSgH5eoWHfv5Ayl5WyAihBm5Nq/ZDgPN0T8p81Ti+CVYUsjv6tqI
	4zKfSGL+bN/y20Ut6SpsiK2JBQ1i9Wx2ZdqmiXGt8HXdr5QZUkYM1QYcMcYZL73Oa6jMnPvbwRD
	A2XnMyykxThMhk6StlsZDqD425EuSQ98Cv5SQiC1NRVIgizsk6E5pIVPLhjBiSUU20uRsevzSKv
	4mEJviORCfGJurQW3ne1kCdCXDiYFUSxi28+qjyMcQVTXMsJMjQRSj99rtWf0omZ2ZInZz4QPko
	SnfjS5fVia0tOkBmAc2orr/PckSqdBPvrgb13QvChPjV6FCSCYc5d9dEvp8UWUiTXztsW1KAe2S
	5Jr2bmM5q69BmmefsQoenCOOnA4Y3QpyWxsBIO5yRJqd+Zv4aUwPk3pwIFJPB/wZM/GEMuWjFO4
	5UxMtB418EwLNCGgV2xnXiVGW9q9xfJvD4wArp3ZSBIGA8A6C1ZWsJFb2KOtpABBT3g+mjgC8qM
	Hv+qxkWhW2Vg9s5sldr/dfBK6m28afNuJ6baByL0
X-Received: by 2002:a05:701b:4241:20b0:143:2968:564c with SMTP id a92af1059eb24-1ac5b9cb040mr21210378c88.26.1793722377822;
        Tue, 03 Nov 2026 08:12:57 -0800 (PST)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm47214021eec.6.2026.11.03.08.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:12:57 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 03 Nov 2026 21:41:50 +0530
Subject: [PATCH v5 3/9] greybus: operation: arm request timeout before
 sending
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-gb-uart-transport-v5-3-f8e326d6561f@beagleboard.org>
References: <20261103-gb-uart-transport-v5-0-f8e326d6561f@beagleboard.org>
In-Reply-To: <20261103-gb-uart-transport-v5-0-f8e326d6561f@beagleboard.org>
To: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Markus Probst <markus.probst@posteo.de>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=zpOdmfpBKhgDMSZ3lQslDxw8tphqN8m/HcEZLtVnRY0=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBq6gffPq0afsUXss+TmBdVdcpnwmES8qvVoLoO8
 fS7Dc+JsBaJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCauoH3wAKCRAFzvXHieVa
 dFAUEADCzZFb4PmN4Rj+2VqSKvaqBBqV1/9MMgt1W+ePRdZqR2RiTnya+lDjXg76JvCKC7OaJJh
 tPF4igoaNIvSeMnln1nUF/c5JmeqXUOvtr8iZNVddhaKHTBjhu8RO9QW5vRmymDn9VHi5y5Zc57
 jdRvwIzTBspkV+aeZw3jha9H1VQxRQZ28Elj0GMYRzcV7hbyuEerljz0mC+sLJ7DQH7K0HF4URR
 mqBQP/viA7KP8jwZyxzha2TVxp7/6qQ7uvlPgOF4ev2q58pH5QgGE0aY0IzdsxEJ9TLEkoE5SVe
 KcKjQI6fj8rpb2dOOIHS/NwNhpcyOFBeBzi2ehtKW0hyb00CZU00Qm/tf9gMnZ19tFLblr0vL9Z
 eN7B3nD4r2RsiYt/JYM1Es4ZjPVhxgWwtupkOf+7Y5ss9qcHGukalGPJSg6dmINyw2kySgXqonR
 EMnhdNMDXQVKCitMDg+GvvO24uGQWvLjlVWmmMnzIRJhNcBN6KZEfk8drCV+YSSehwa7Lk9ShkE
 CIAS2oed/ThFJR9r4Ekh8CENJXPhTKo1FRO3AlMkm3j9PmEtKoiatAbrgnX1jbvFUcRQq3YKyoq
 wWB5Pz8+FmmOUy9k21LGNWhqUeoT9xxDMmTwot0WDvYbxUfr89m00XeYfWozvgbn/GNGrwldMtg
 Z+TSFS87f4yWb0A==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

The host driver can complete a request before add_timer is called. The
main case for this is softsvc, although, depending on which transport
is used, there is a possibility that response arrives much faster than
expected.

By populating timer earilier, we prevent the starting a timer on
already completed request (which would then leak an active timer on cleanup).

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/greybus/operation.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index a63bc2eb164e..2d37acedf36f 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -782,20 +782,25 @@ int gb_operation_request_send(struct gb_operation *operation,
 		return 0;
 	}
 
+	/*
+	 * Arm the timeout before sending: the response can arrive, and the
+	 * operation complete, before the host driver returns.
+	 */
+	if (timeout) {
+		operation->timer.expires = jiffies + msecs_to_jiffies(timeout);
+		add_timer(&operation->timer);
+	}
+
 	ret = gb_message_send(operation->request, gfp);
 	gb_operation_put_active(operation);
 	gb_operation_put(operation);
 	if (ret)
 		goto err_put_active;
 
-	if (timeout) {
-		operation->timer.expires = jiffies + msecs_to_jiffies(timeout);
-		add_timer(&operation->timer);
-	}
-
 	return 0;
 
 err_put_active:
+	timer_delete_sync(&operation->timer);
 	gb_operation_put_active(operation);
 err_put:
 	gb_operation_put(operation);

-- 
2.56.0

