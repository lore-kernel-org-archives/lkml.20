Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142351;
	b=PZWTsYYlfJ4XoKZ7l0Hau1G3I6WXjUMDo+JnedSy3jOLoPs7o02cgGtQv8aFTzK8OIaR
	 rlSqWJ9XQcmFbXSyC3oG58b8FbIfXpPXBIK6kwLYDJtGdDdNrn5GuWDQ86w2sa83WeZ+n
	 Y1o5hd/XnaXL7c5BGK9Mg5s0BVvrMLhxjECm8GigFFZ+tk7WdglimOZqd6s+izDenVUW4
	 uF9JiCxqfiym6+c7N7L5nIxbvkVh8amr9+lBHsE8N6gswRq5oICkdopjn8o4QRshSK0uW
	 ARQiKLEBfaRJiD1gKSZJTXNtkCbRN7abJKzrNo6EsFQleIpMAdSIjeHTGa9QY1ok4JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=EG6vB+d3AGeFZ6pBVrncqfS7pzggD8yTk6rsfUsHybg=;
	b=2TWVh2DJ3k4mKIGsvskfcVHZ85rEQ2XMxnxX2t2pRLwW8opAK1hW315j8th68v6AJQ1A
	 qDHMqciw4S1HKcl1mLWo/4duicAfEKhHXkNJfUcIARMEpcjJ9nYS5A0ZqS/pIfPqUmsby
	 HNljMufJYxF/Gv76W0T/UcIfjb3hM+/xTOg0LLtN2TsiFHB7B/v0ahuYP5wxRbYvIZyoC
	 BXSECPzWusc49Isi/gdWc4FlboYP3OKJ2naMycesFoClcCOP9RGppXoOasrw3ctyFZp1o
	 qsER4TTg9DeC7iIJqzME9ebuaeeoVSgS/rpWyProGxW2w1t+jfvIFDegxXA4Vq13BSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KT/MDSGr";
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038B4606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 038B4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KT/MDSGr
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-84a248254f4so241660a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142349; x=1793747149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EG6vB+d3AGeFZ6pBVrncqfS7pzggD8yTk6rsfUsHybg=;
        b=KT/MDSGr0uiF36n1Qrx6rANybi1J/wRnns6SvuV0WRYq8HzMIRyyz4vdmpsUYZs+Yv
         9IGrgHrXaM/XarQ992vpIS8+mgYqJy2bht2+DF1Rvv+bjFeCLY0njrYrBseRwTnEfaow
         N++QR8p7TKYnPWFQC6IrtpLjL4lJxzeUmcWKgBiej1Eu8RMEZjtlEghRAFuw9++2i798
         t+AFefaWtQ4FBhJpBl3xmicKecKCGVsTq4xShRjQ2k6pdI4+N0glUEc3bwkveLIrivEH
         p8XL0deTfodNScRzHdgMmB+qY/D48qhU6t6jX1y5/F4No4hmKE8hNzIIxONybUrvKRhT
         rIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142349; x=1793747149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EG6vB+d3AGeFZ6pBVrncqfS7pzggD8yTk6rsfUsHybg=;
        b=GPSCiVBnmyTBfm948/tpMWvJF4fk59NayoZ8eMGrXrXC/D7NnCj3FQupkC6nHyfcqM
         DMZGd/ae48O1PbCH1rgYNs2AZLdQcZ3W8M5+oDIfq9VDVe/1IzwHZwVyDcpzYwzVrKL3
         +t7irVvcwxfgsaQWiyblM9t0TBJboZbH00dQp3Vz3YNo1VciiFmOBJ5EOQMEA6nfPB5x
         9r4p7U8wlEAtuOmsrOBBQKyUYGQrnsM2LULMDTyuZW/8/jSS8iLEKSP2bVQPZm3rD2LY
         uVtq1+4YbN6JE5DWiGfD8ubRxWTSZwSAnRoy5Wc/w5CInrfzyPuPJ2V3ODi4Bhi9vAeS
         Xlfw==
X-Gm-Message-State: AFq9FYJhsWNDV7Osflp3u4cYzEAPqWwjZCCMyTZRWJzVABwb877tvzxi
	FxupDh7Wu51QwB+A2omypYG/W2v0f4SPSXTXSs3rnhCIdwhtgTAXP24u
X-Gm-Gg: AYBFou3rTzcpEGSG9Oxf1HRwI2otwhomvhSpMNrzoFFL+TcMczXPe/e245UrzQ8OWuD
	ee5B1ADEc7rVc14RsqdBP7XXNx10LMEAMSZ1g+3aeYbeka6GyfiTT16OEleDwUusz2Lof871u2k
	Xcy0xfHIE8FvFQg9B8YoiB9jm8Bryq0i7N1oh/62oNxnWGCWHCLdXkvy0hgd9c7/fn1VthlngiD
	dy/UJHQutLUgzZ8A9oGr5moAScfUpRhdeDOwmA0swmouc1MViR+fbri67Q2oR4iU00t1S3tKYLn
	Ji3nscpSGF94o+0UgPCKsu6jXbokA0vE+lkI/LtZbJLaIYzP6mJTDXhu0KP3KL5kXozWUhFqzP0
	Ko2mQTMFDvs4v+zqMvluhnpK7/pHwmdq/WmF5pf0yVXoeaCblhAPvLNCWPkpSBS9s7aUL5QrZbm
	SLlQTUUV3wrSU2yWmpnepc8AXYM4fpN80TaJXuMe0u6ob+st5Api3XzUPqJMtkubA9HbLat0A+L
	IrCam4uenMHBIywCBoe5Yogy4KwqpB5lV5IKg1F06U5Oy1bJM1Oj7kSS2+pmP44Sr4ktU0+mqEI
	516wtimV3WNBGmQLio8ABeK6EqlT5+nSuHGpfbNcfL6KgYu0QBKiyisWMfs7WDx/ooATRWwiG0/
	CpcjScDERvrNAWJbmL63/h4zpQrFnLfn3iMwBNtz3IoYhWWYr+5TCWulLWxGpu7ha+oOLBb2aiF
	EzGg==
X-Received: by 2002:a05:6830:4aca:b0:824:df9:971 with SMTP id 46e09a7af769-85abc7246ddmr898761a34.10.1793142348950;
        Tue, 27 Oct 2026 16:05:48 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:05:31 -0600
Subject: [PATCH v4 3/5] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
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
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-3-d37e018fd0a6@gmail.com>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
component parameter register does not report the FIFO depth. Its optional
register layout also differs from the generic DesignWare integration.

Add a specific compatible to identify this fixed configuration, retaining
snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..fc1289073241 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -60,6 +60,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun50i-h616-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

