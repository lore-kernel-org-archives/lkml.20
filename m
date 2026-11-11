Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368664;
	b=cHUacG0FHzJGjnw0cdM38XqkmP1FNHKr8WGOCHKcjAAqJRgOpuEPDGR4DBv62sATQzEY
	 LaDbSysjzxq/riaVbaMl7IqRVKRHZ2eQo/Dj68Y3O/6PS0hKceGXSbAH7aEHNYGq4bqoP
	 5UEcD6P4AaXDJTA4HyPRrn6NYOBc2HOz1A9AC/xWS1WePJI0G/5GdpKeOdFGw7162zCaz
	 jVBbcAbg6mzOYptJlXgLsx3ZSo6mhPCsnYHO5gL2wXGNEVwYGhuWpKko0B+sH0ZKyfSQc
	 cmQ3q8Coa62viGnt5FyV7S9q8MCwyfFeoeQ8L7OYZ3h0LvsK6bTVd1Q/IxHaSoxvoLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rc+P9eOpmSqibWOjblOYo4mq9VjvGRRzJUsMEztZL+k=;
	b=tqrsOl+IuTwbC1bmmj4JnL1IJuTblJfzOu9iNYc7+/SM1a8Ek06rxU8lMo2+K1XVZDab
	 UlbSVToNMZCerwvePkB1YGyuNZMcu/DyaQRbx8jMenKbQoM1tXagOu40UYgTC1JRk8ioh
	 ggoRCK3jD5Z4BhipaT6vd0dluOJ1WhGpp9MIkvWaWsZNOotSXp17qJHQy3QxVAs7wRcjQ
	 CR9rWJyfnT6VBEBSK0qcip+y6oEByN5tec+zt+Hek31Mcx0tOTbreOf91nvmX3+DaZ1u6
	 zxffdsyeFfgM6M4xZ9YMm7ztQNnc/83Djc7QyYtJTJKU787uhjjfdGQr5g0E/Nf2k5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lcjSgRpm;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55442606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55442606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lcjSgRpm
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6deb848ddd7so1685100eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794368663; x=1794973463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rc+P9eOpmSqibWOjblOYo4mq9VjvGRRzJUsMEztZL+k=;
        b=lcjSgRpmHuggSjhLdMHCnVvH/bPQWR68Mb5S3pirIshxAAOFAwuzdPIoiY5Q2wL+Vw
         Yhug/XMF8ZDHULfO0FYBg/LLd9IWrLa6mRdEdGUkB/SFbtHo4kvjkBzjgrByaod8g8tk
         Dx5FsYsmhLSdCykojfTNjD2NEFALj2A4moqJFlH9hwJ/6WFbv9VFd0TOO9MT8p57cfzE
         O5Ndz5TSFcodXjsbtvIKSfi2Hh6Ss6+zpqwtcXuEdbtuO2XK8iYaNGq4xMUPXnFZbJPG
         MdqRETmoGSnW2R+vTmyW44vjbrCQOyxFD31eS7RDt3UB4iy71huiaM4AlzOcZ/3kRJj2
         2Niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368663; x=1794973463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rc+P9eOpmSqibWOjblOYo4mq9VjvGRRzJUsMEztZL+k=;
        b=GtynivEMhD66/DcwTHA71xM4xw2TEenlXueDehN8D3WtMtksPdc5y5SExp8cua3xTo
         1o1V4KBMK9JoXc/0dCochW/ey0hLX17Lpf+d7/fvuxSZl8g72IpiuvIK2HCxdoFuDFJn
         dQaY4YNv7GV2LkAI6d5jnv2vHcYm+IwSYP8QTc+sHElEWyP87Iep51bC+jUlxe6813hi
         Kjwab+H93vB3Tgw44K/ToKOXjnT0itAs/PJDjNZ/QXy6lH+pd7yMk+IJfOvjY3kxHz3D
         2fEIDsAUpDhGqyhzDQTXTkXAofa15XSQ8pS4sOFCrsXMVL/GBwg0dWHSASmZnlKTmDmI
         N2SA==
X-Forwarded-Encrypted: i=1; AL+hErGASOJkxefmk0HrfQHFVZ5Hfn1aDG/d5/svGjlCDaUxvD2jNnaE02pDGQqbN4q1SJS/KGYXVjV2k1lWv8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CW+JgXoVbZROc0XUlyMiw8MX54DJnaKAQEdgniB5AMQ00AUnL
	iyJx84H23zn4Ac9be5NMID1Da1Ygup8d+DT1k7wjn/TmqLyNtfvBqmr93KwSqUag
X-Gm-Gg: AYBFou1x0RO1/n/DcoSWagzIw9Xe9KAe4FKJRLX6u9yJw/yLX+flzwmQIHQEx4FH3qc
	/i6l8z8QODRi0Hp6dl+WfwQYlQpltvJ+xjarvsazl3oWxh4CFl9yboO6kuINUxtYv7E9iDPKv8n
	bxI2lGWq9KvRJTeNrJU2zwyL3e8Ld59X3+zsx6ZG+dStWsOroxrKbUE/gz0fLkOcLc8ryLQARZi
	zGtePowyK5mxY39TLAdNbNpHGJfcJkJdDN36GMkIPv4tXqDfZeNJbV+lYpc07yyVsc1J9BgENb5
	fm4sc6LF0yYA7D6FQxvijk2obWwqUdaHjBTyAfIStbIgACxVDVOKTkmJKjnoT7ZaW6egeRphnn2
	bOnBc7QXEM36tTxbEFi6i4rSwV6Wv+75JJpvY1nCWRNNs8JEVKrEfETT74VJVoAD2XcZvuzs+Vv
	rgKSGnMwsUeqD7VVyEFDyGcoLxIVKRuuMNfb9eaGYcD5o1yZhpI8rcEDta+NV7GJqVuNaA+TAjp
	+gXmBnqi8mGC78dX8Vb4Er00K8yrBUIch25cgRQHd6s6Awgds0mg53TVOF8tFQRQFuWarbQk0sH
	1p+/YAdwPwp2oSio/K5iWl8c2RwqGSRr46mHYXxccHFBmRy5yt/fbiXR+Z9QWXbp6XJz4kDm7et
	4Z+3t2LLvgxOivPtftFbZGK4Qe+cIplNG5o4E0oAJWAMtak57Y4axXr45aL7ibjn4+FiHPS7N3p
	qgtQ==
X-Received: by 2002:a05:6820:1ca4:b0:6f6:1e3a:6fc with SMTP id 006d021491bc7-7191795fda6mr882755eaf.79.1794368663202;
        Tue, 10 Nov 2026 19:44:23 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae23031a4dsm2487525fac.14.2026.11.10.19.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:44:22 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: net: wireless: qcom,ath10k: add PCI devices
Date: Tue, 10 Nov 2026 19:44:18 -0800
Message-ID: <20261111034418.194610-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

ath10k PCI devices can be described as children of their PCI host
bridge, for example to supply the MAC address and calibration data
through nvmem cells. The only compatible for that was "qcom,ath10k",
but the generic PCI device schema requires a node under a PCI bus to
carry a "pciVVVV,DDDD" or "pciclass,..." compatible, so such nodes fail
validation.

Add the PCI vendor/device IDs handled by the ath10k PCI driver, as the
ath9k and ath11k PCI bindings already do.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index 0cb065265df4..992926ce5c5e 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -15,6 +15,15 @@ description:
 properties:
   compatible:
     enum:
+      - pci0777,11ac  # QCA988X (Ubiquiti branded)
+      - pci168c,003c  # QCA988X
+      - pci168c,003e  # QCA6174
+      - pci168c,0040  # QCA99X0
+      - pci168c,0041  # QCA6164
+      - pci168c,0042  # QCA9377
+      - pci168c,0046  # QCA9984
+      - pci168c,0050  # QCA9887
+      - pci168c,0056  # QCA9888
       - qcom,ath10k # SDIO-based devices
       - qcom,ipq4019-wifi
       - qcom,wcn3990-wifi # SNoC-based devices
-- 
2.56.0

