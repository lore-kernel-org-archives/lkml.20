Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDA951FCD1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699301; cv=none; b=nbhF4cVK+7ZeAJGZRZILvcoaPee7zg6qT7CXECD2md4AM4rTTGwoHkqYEonOkLJ6tLMJ+Ox8G1mGjnEF0HFfRdffX3hVdH4UAO3M54Y22DuUFbiLjuUwwudXiRWJZ0oSj9+NSm0/r3tNbko2jViuB1kKiw/trflKXKxF2jdG2vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699301; c=relaxed/simple;
	bh=SzIosLDQg7snE9UfrT+BODzU4lO9sxWMvYyaifhgwXQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n1UwxmWEADtybc054Wv+X0el1uEZUuSjKXKtUPxrARLILb486VsM5Y57Trbz6CchCdljtPQfXg/jeoGC/pSm9ht69R43JoH1QnVIVe/D7CqQ2Y/OhzET1q83oLt+5xOyFbWgUESNKFhZf/drFnqGn9RsZN7Ol++oLzxHdS6NBqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=NfBiNLfv; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="NfBiNLfv"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b3a9cd8edso440164eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790699299; x=1791304099; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EIUT7gLZI+rQeOH5s3bmQw/tw87mS5D6Yw6a8lMvT+Y=;
        b=NfBiNLfvFezRNZyPbzatwBdqeAYME0qXx4ugFjGTaq5+ZERa6AbWw6XqEWMVmm9nYO
         lNzPCoR7AKbuxrCsXI7lMqdPaZZP2pttwLveriOINRCKVtdQM/sq7bVZCUGzVRx5pXkV
         1fyGQ1w9AHHEXpLYWtZdonKFxPGXuOqjFnWbTPWlAj3Kv5vjicMma1DEYITp9mTuKWsC
         La31l6pTrK67od91fExtRE0hE+8rsCvdhcEYPh7QR5L1AltSfMEtIKQMglIo9gsywGx8
         ZfW827mPjTYbskyxXWso/wPod9scVVS/lGacIMhnhvvg0hov31oPky263Uocnru62n/Z
         KvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699299; x=1791304099;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EIUT7gLZI+rQeOH5s3bmQw/tw87mS5D6Yw6a8lMvT+Y=;
        b=R7pXp8t35YzYGzH8tnoRBVw4zaNEw8BmgXpXlmPUxG4xyluirFBwjAKeJcx0xqt1YT
         lPQB3itPzbuD0ks+isJv2+Zvjspx16sr8nO/lhsovX7PTYSN+AzfFs2TFZi2jTHCI46V
         aEC2cnwCb+ULLP675cZjvE76DhOE1kQzKa3h+J93p9s1Cv+eWsyRaBKngQuEMVfunkqe
         JBItwqt0PiV3pbZcc0b0r0LzSQ3kBPJzZ2ueqPYZyWWtCpDjIBpmXa1AL/auSXwIuOcZ
         kaqCZTLRoOLP3hTBuTJSGY2UNSxdQ1b4GTMC1E0ii2pPlYliU2OdRZz/zWm2eHn5+x6D
         wVjw==
X-Forwarded-Encrypted: i=1; AKwUvBwo7RRRb17+oeR4G7l2UI2gFwmdo+wnJbkAHXrhLoda86G4NJ8hMQG+brl6w+kLKOfJ0TyDRspGtF57dJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIzshlmbMG7PHExJ2n1nvQ+lkWKuV0Cnwab6H9+AOPsljKqY8n
	MOqOpcdi/w0wQFIta4A0yzJnXe7iirrBKbsj/YPVlhSfBKsgF3Jvv2Zpgu8qwlYNfS/wZHl0gl5
	NWJn6NXU=
X-Gm-Gg: AYBFou12yB/QRdetLUkhy50gEBLpAbO012EbGUje5EgD2wQdxCFnOoCC9e/9XNsgH3v
	pc124h/cuNjTXKZzYFBivaGgGN81oj6DKSZP3/Tgo18ZuXHx0IHTz+CPSiBvcWDFHcY9CIk7fuu
	mS2Iwd9VB9LVlzrcPwJa2inD1y2O8Z7l77d8pScQrl0W+4a+l62MYKPh0u4cFPL1L8cLjUJw9w1
	0zBFkUdJ6AKHb3byMahmXmlEFngjcqvI5zNNX2lJ5b+11AidmqGffC30XoRgH7hoaQyMecfnW7g
	dY2ChctNYbpUY9n/CAxV6Kkjhl/T+p5LgkiHk5CpxC0U91eczjblvbOCdaYCx54EPyvCqkWVrdq
	mnjyYYgBUF3vVk7LO8X+edPVuEU58eLXAa6N6x0Sc3grUcU4NgqROhYQEOe4V5R1DRavNzo0wxX
	jnpJ/pmOhCHqnU0uZps72j5JfaF9Whr87NAlw3f3dXr/h+wu0KiajqO+MQBQcvmkHERWYe9pqR1
	jk8Mkz2kpPs
X-Received: by 2002:a05:7301:201c:b0:340:f5ba:9670 with SMTP id 5a478bee46e88-34af4723c4fmr3538573eec.1.1790699299076;
        Tue, 29 Sep 2026 09:28:19 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c378c9a7fsm425590eec.10.2026.09.29.09.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:28:18 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH 0/2] misc: eeprom_93xx46: add Microchip 93LC86C
Date: Tue, 29 Sep 2026 09:28:15 -0700
Message-Id: <20260929-eeprom-93xx46-93lc86c-v1-0-272791aac875@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6DIBCF4Vcxsy4JIiLTV2lctDjqGG+BakiM7
 16qq5Nvcf4DAnmmAM/sAE87B17mhPyRgevfc0eCm2RQUhmJCgXR6pdJYBGjNmlGZ40TSpcSK91
 Yizmk7+qp5Xh1X/XtsH0Gct9/DM7zB3FciFp5AAAA
X-Change-ID: 20260929-eeprom-93xx46-93lc86c-2450974d8891
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cory Tusar <cory.tusar@pid1solutions.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790699298; l=759;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=SzIosLDQg7snE9UfrT+BODzU4lO9sxWMvYyaifhgwXQ=;
 b=QH6GMoz2gvT8CuoOPTd/O5Ygd0WGNmy3k6SjZEqGtLZFlHWFV1LNXms5PFaGasY1VMiZJ9+/u
 OAEtqr+9EE6Ca/WtsNOBP03TfNgABXFtfCNoBMYHc+ulQ4FHO8ZZ1ws
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The 93LC86C is the 16 Kbit member of the family, 2048 bytes. Like the
93LC46B it clocks an extra cycle out after the address during a read, so it
takes the same quirk.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Abdurrahman Hussain (2):
      dt-bindings: eeprom: microchip,93lc46b: add Microchip 93LC86C
      misc: eeprom_93xx46: add Microchip 93LC86C

 .../devicetree/bindings/eeprom/microchip,93lc46b.yaml         |  1 +
 drivers/misc/eeprom/eeprom_93xx46.c                           | 11 +++++++++++
 2 files changed, 12 insertions(+)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260929-eeprom-93xx46-93lc86c-2450974d8891

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

