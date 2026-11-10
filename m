Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309397;
	b=kUMBnBhX1nqBYPQWtUtmNV6eGlsBr7IcJEN8sBH6RDVYvSVpbuda4E8PFFZ4MIM/QZqg
	 eyjw3zLrqtsL62Vbru0Zv1KZEn2ezBOK8nwJSsWeAEnJl/MxwfOQBpeND3gB4U3/XHTkj
	 iviJOSFzCVAxkKaW7qvKN3Pi/o0zqvuaP3mLn+43TXOf1j22y6rYPOF9X+0hkCs5ezx8F
	 +/SEqr0n6a2/Qs6dLo4Ix/igNn9AEhIM9kyQCunEsm3aFQQHR7TuXvfBKHAtqlodJVjGO
	 qTWj7Y4ebMT+tguDosvW1C8tfDXsCU08a5iYVswcSn1yF5hUugw9DA2kC1eb7Se0Jxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=bxvxM+3WsHm1O3eYYTHfdQpZzw4PbNtujrKlzJvVUMM=;
	b=ghj4lXAEsBEHTu3xc0yq/hn/0cLOr3B6cwDIKhFT6pf7DP0Hoou+K4whJE0k9A5DLWNf
	 GzqAwCJDRM0N5hz1pgtOrSkmGk0UlvuNmWVY+QXxLqJ2khNDwDD0kpRnRYdRNuleX6ykn
	 C6x5ieZ1vZzLVEz1zIFNVKdWYuWLknO/YrIdF3sQ0Ho55EkBcKO+sOfbbIe90Si35V+D7
	 CPp4K3B6MRKVEcwYqVolNw7UR5/atjxxCiz7xgCWVZJ0R4G8TZJvYHzoB93T2nYMrwMOc
	 M1sR/ksFdXJNtOZv/eK9HdF213cz0zq0XvokLNt/ZkwLATTq7icg23Th/qlO4JSsRbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4r9xWt0;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAF1606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACAF1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4r9xWt0
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so889553b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794309396; x=1794914196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bxvxM+3WsHm1O3eYYTHfdQpZzw4PbNtujrKlzJvVUMM=;
        b=r4r9xWt08nn4vwu+boLuJvm8qa6I4CICSIrPcN2/8WR6NtaehS6cEOeRhVbPbjw4yU
         5ifWbM/7kj1OtzjjhRwxQHnl0PiKp4AT2qDcTfKavzE//VPp7bLoPfnk2mS2MeWlWbRB
         eMyDLz7uAb4+C1zIPXKWYW2cqqLs5WFV/dPkA/u2jtAUdT1mLp75p3N2wgiQQf0tasII
         WI1FNPuIaVtrFTekT1YiwF4cGsgXFIf5UEWHQ/hXXzarjmKvVrenicm1apVwJXvhT9Jn
         a6OGwKoksQPtNmYm2lB7TkGjIIE/x5mwxlj1dEmkjoxRVNNRYAMLxgdK4n3dpaTMkfm7
         iW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309396; x=1794914196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bxvxM+3WsHm1O3eYYTHfdQpZzw4PbNtujrKlzJvVUMM=;
        b=UnL5nSu5AHl0ivKFUHTnA/lvh8Qd4iACjI7JL1kcihnwNqSs+1JwEB5Piyig7x3QEO
         0X2aF/aMvpkA2n2uKHWmytbjpU1jITrUFXptwQsu30YxUiq8uTXAIqc2N/40YhlOIZQl
         YDAjRdxTzMllZiFHAar1TIgKada5zRkweaniJoypb/6F8LjhWKNoF6rVeHuruH6G53L2
         9qljPvFv+vcPTd7mjlfGSeO+ke4a/erMOCXimMmex+O0VOCRHxDCJZ7NujHInBSN1rS7
         1ZortzpURhmx4QF8XOWq2D8MD3U2EPI7zT3ZrstXToO+3YJZSPp8ImnY+C+425R2jPJW
         hbwA==
X-Gm-Message-State: APuU4Z+v6g6BfG3BaBuSTVumTJKWrLatJIjSzmXndy9rSlzkAqV3Dvyf
	OaZe17qw1v7XatuzCyTkNlkqDQ1rqdHgbr1oecaBh2BJqmcEmArXq+8pVKiChA==
X-Gm-Gg: AYBFou3jCNGyoD3FrvvzOZyNUDX2zCknqoJgLFaOUItrlJB0/ppSxEMnVCRXj1M/mB4
	k/gaGs1fl1vo4+0wdEQcdJ2PzLBLtrrEAGR2AgPFC0xgZSd8hpyAdBBiKfsh9IrmU7vI8bvdpd8
	ElHfBie9XXjf7y1DFhWAKxINFxqGxG8l8znaLWyg6kirLGzDl5S0RqPpc5nPm8Ky7HfPpx7dhue
	fpnP0br62/iA+7M16fuDt3Oeg0eNQQACr3U8nFs3C84tlVWbUCYMOUHEcl++3PajxKQe6OhGHu8
	sQF8UG3PremygRykR5TFy7RZfJwFDmf6YBjlXy97N4bZt/0B7RYnL7/fnptjn2O/1PCWrhH3ERB
	n8nwYjUm4lV4+BGRz8zfeJdA25W9hpsb5UfWK11HMjHpDHexpqGKo56qetyzxHmjBj1ePnQL+B9
	JJCB6ZXskPQWk7caXp+4EhUsqYf4qDcKRvFtYrhJh77vSqskTWwMcbgcZwfbviL08ZrpbsiL0X3
	OI1tfl6WxwHS3mRpJ0X8J7VPp+zuPwzmaq6QdVszS6QOwEoOCR6XrX/J0eM62XnqJWpKftTKGuo
	w41YF1gAC4o8yMtDKykEqZbf9bZxjBVBeeOzbGkmK4DOpY1NOuWklJaVjsHj38pxSVQF3hU27zs
	kVcpkei6SxdlCyvKrjSo4T1F5tx8cJuFdiOAmaSiyeeKPPHdXqRK+3b+W1G0BsbXdZe2URfS6R8
	p/
X-Received: by 2002:a05:6a00:ab89:b0:89f:c71e:abb3 with SMTP id d2e1a72fcca58-8ba8a10c655mr2329380b3a.50.1794309395894;
        Tue, 10 Nov 2026 03:16:35 -0800 (PST)
Received: from ip-10-90-38-71.us-west-2.compute.internal (ec2-54-71-16-125.us-west-2.compute.amazonaws.com. [54.71.16.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa962e02sm757418b3a.26.2026.11.10.03.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:16:35 -0800 (PST)
From: Xinyou Ji <jerryjilol@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] uio: remove the device before releasing its minor
Date: Tue, 10 Nov 2026 11:15:28 +0000
Message-ID: <20261110111528.2248401-1-jerryjilol@gmail.com>
X-Mailer: git-send-email 2.54.0
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

core-1                            core-2
====================================================================
uio_unregister_device()           __uio_register_device()
  uio_free_minor(minor)
                                    uio_get_minor(idev)
                                    device_add(&idev->dev)
                                      -> -EEXIST
  device_unregister(&idev->dev)
====================================================================

After core-1 releases the minor, core-2 can reuse it before the old
uioN sysfs entry is removed. device_add() then fails with -EEXIST.
This caused TCMU backstore creation failures.

Call device_del() before uio_free_minor() and put_device() afterwards.
This removes the old name before minor reuse while keeping the device
alive until its IDR entry is removed, so concurrent uio_open() cannot
access a freed device.

Fixes: 0c9ae0b86050 ("uio: Fix use-after-free in uio_open")
Link: https://lists.openwall.net/linux-kernel/2026/04/16/709
Cc: stable@vger.kernel.org
Signed-off-by: Xinyou Ji <jerryjilol@gmail.com>

---
Built the 7.4.0-rc2 x86_64 kernel and modules. With 128 workers
repeatedly creating and removing TCMU backstores, the unpatched run
failed to enable a backstore with -EEXIST after 385 successful
create/remove iterations across the workers. Replacing only the UIO
module on the same booted kernel completed 4,350 such iterations and
1,758,183 concurrent read/write operations without -EEXIST.

diff --git a/drivers/uio/uio.c b/drivers/uio/uio.c
index f8fa205..aa93cb9 100644
--- a/drivers/uio/uio.c
+++ b/drivers/uio/uio.c
@@ -1136,8 +1136,9 @@ void uio_unregister_device(struct uio_info *info)
 	wake_up_interruptible(&idev->wait);
 	kill_fasync(&idev->async_queue, SIGIO, POLL_HUP);
 
+	device_del(&idev->dev);
 	uio_free_minor(minor);
-	device_unregister(&idev->dev);
+	put_device(&idev->dev);
 
 	return;
 }

base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.54.0

