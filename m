Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413220;
	b=16HZzJrwxl/DsjEOKgpI77yd8/K6v5l7z/tjLWEukVHs3fas8yPrN7iYsZxDOVjd/OZ1
	 vs38FTkwCB1q9JZEMShdIKspAwHiEJm8mhxBe3MrYTi0piaIz9oJ4hxYp/Jdyx+lizs+D
	 21dTLozdaYYuOtwG3Eb36Yk6PqIqvgdMcFKJ4cuS2tYz5FPSXQ1+clKuJmjgIrXw2OPu5
	 NMCbgvG/3GomKu/S9Bz4l44MLaZ2xCOsS78Oe9LaP38xF4GQMViqkNfPTeMt3WFondd+h
	 FAg3Rj+zlhYOsHRve3OLTR9wJbPB7+NAfF6IWgN5FZPWniQh9p8Jwreh44glKjtiz5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9BSVf0nHP4/mhP9EqbQcCZ9FFbpmkiKR53pnCEDo/p4=;
	b=Uwq1Gwv0/qjD4mdu72Pv31+/JDEznwaYsZwikeCtj+ppl7EUcLP5NSzAWDPqxTpRuxLZ
	 cPsSd0Xs0tDom3BvOm2+s3Uuy93xEI/0N6gIGoXPTsIn1Hrpftl5rDhu4R7jiSM+O9A6z
	 SE2pgVDSN6MpCFyO7Ba+AnM8qER+ASgrqnCyydp8s5RKLl22GFJQ4Tz8sJ2u//KUiRgur
	 lejDa3Bak1H0yF3q/S6QysKvcJ2/lAhqhvG/9aaPwvuPUxfEMCOT/FrY2Li72OLAxJp/4
	 N0QKZvI54VKHuPg9QmTCdAyWVFgNxgGjISU0TTtOLM4wp9sSQ8QZLpYj0aMkZRF4lTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJR7GQih;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FCF606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38FCF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJR7GQih
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso23059895e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794413219; x=1795018019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9BSVf0nHP4/mhP9EqbQcCZ9FFbpmkiKR53pnCEDo/p4=;
        b=zJR7GQihQ73Z/nNA1UHEb+m3JMssWqtoH+69LxKJb236waKuGCqP1jBnY1+prralYt
         wJa/5JZDK5rob/brOCQgzqOCU6cr02+AK7CJFdQL81167FXtD3kIwpTsuEufcDo5D/d9
         I65c9oFzQR2YeQqMW0jhQNVQi7YHA2DAQwqo9QM5oPH7iGytXu9TJUKrPy3tCqXIKbnU
         snYM/PYdpPht4CtPBRoQ82UMQzOwTcgMl6UYE5d+5TWC2XMpkZJGx3GaxDomNCNTm4QF
         aorF8HkdMDqY9GuckAw0gkC7CknPK9+SzAQS3kPwzwFumMGWjJnTHPuqIOJj14CWx7k3
         lN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413219; x=1795018019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9BSVf0nHP4/mhP9EqbQcCZ9FFbpmkiKR53pnCEDo/p4=;
        b=FGDVe7g7/2h3rqAeJHY74jQVeKdhweKGFrMZkCkfNJ30CJ4fBEJj+LQoy6FmZLtzmX
         c7dyy1RXB4yLnDoebb3GIt9qBpmoFlmZCUXi245HomQJWIEuKVQNJiEM/DPr5JFHhQl9
         0cWLdihwRpL6+xL/7p85wtkPgnxS95V/3AeplG5Bf2ZvX63wpSdtEtyEMV78kIB5xYoQ
         D2f1YBtl91+KUp8f0VUbMwuzgmBSWPZMJnUjzVLZhennWlkr+Bpw1HIf+/m60rfqph1s
         rt/QAs5rSnmV3znK3ntFQPH7ql/Aa+GmFm2LW3ZP2Pkx5B6xKTOZuFqbzr3BfzWkIqvL
         pERg==
X-Forwarded-Encrypted: i=1; AL+hErFMmNwctiLktYv81t5QOD+y/NMh1igzqiRAIuy5qEYnh19jAI8L2ZgPuDy1SgfE+R7zL7JnFRoLDy+TTAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8899z7GSzovtnl5+7phAQxG44S5DMwwtfSVVb5TV+WEdOGjujd
	joJyXU62DYF7myj5ASEKxIs+vUXUNEALjsibSTptMdVMauLXsDVSCvU=
X-Gm-Gg: AYBFou3UuhmID7Hu+7zSaOMfHHFGECYVknzPVHJh34A7YnEHBoyc7SlrKmChU9SfMh1
	fttZGe97MojGbVpxWy82qWJcEwWHY6aQ3Boqzxt4HCQpgLY6A52hkvJvI6FXCJZJVyR2ducLCey
	HjMYvgOr1q15ozltms9Bu0lFv652eZ68d1CfXMvRtrbv+UAyzx727zKXEy+Gdk4fEI+UcOoSn9u
	n7W5FS9DXsqd0/7VAGRUWYRtWwdEyYpZnrYtEr1xFn8xc4++BzFpM9b4XuOOjo167G1R/z/pm8s
	9ks6EgKZHrihFTEk9dUODyAcD91gVsWrXmk1wltQmln5rDEWYEgE/FWRoAKSz41QrGnbeC1YeLh
	H/FUJWG1pcJcZ0pQaG/MhYLYI+C+xlguzsPhwQYcfkSffIuVlx2IkmW5TNBzrqxCGZAQEOOJa49
	Wa5HzUYJV2DPPcCL5FKoB0ev3Vaenp1c/G0VamYwNPyZyJtGVgp6Fqq8Mn2BgGpeYpjnuTG8qYC
	cjvUcWNDo6ZoWNHLNo2UqbubHpZl3cXoG+/y07oboH0Fq02NUqHXUPvW9A6vE/bNhKqtWF0bCBU
	KpwE9+OJvfocAJ0=
X-Received: by 2002:a05:600c:3e07:b0:4aa:1527:659 with SMTP id 5b1f17b1804b1-4ba0938369amr51998385e9.17.1794413218559;
        Wed, 11 Nov 2026 08:06:58 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c57e999sm8350485e9.1.2026.11.11.08.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:06:57 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	Paul Fertser <fercerpav@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] net/ncsi: use kfree_rcu_mightsleep for RCU-protected list entries
Date: Wed, 11 Nov 2026 16:06:49 +0000
Message-ID: <20261111160649.677910-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

ncsi_remove_channel(), ncsi_remove_package(), and ncsi_unregister_dev()
each call list_del_rcu() to remove an entry from an RCU-protected list,
then immediately call kfree(). Concurrent RCU readers traversing the
list may still hold references to the freed object.

A similar pattern was already fixed in the VLAN list, but these three
sites were missed.

Replace kfree() with kfree_rcu_mightsleep() to defer the free until
after an RCU grace period.

Fixes: 2d283bdd5b20 ("net/ncsi: Package and channel management")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 net/ncsi/ncsi-manage.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 54d0df0a9efe6..64274a5058346 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -263,7 +263,7 @@ static void ncsi_remove_channel(struct ncsi_channel *nc)
 	np->channel_num--;
 	spin_unlock_irqrestore(&np->lock, flags);
 
-	kfree(nc);
+	kfree_rcu_mightsleep(nc);
 }
 
 struct ncsi_package *ncsi_find_package(struct ncsi_dev_priv *ndp,
@@ -326,7 +326,7 @@ void ncsi_remove_package(struct ncsi_package *np)
 	ndp->package_num--;
 	spin_unlock_irqrestore(&ndp->lock, flags);
 
-	kfree(np);
+	kfree_rcu_mightsleep(np);
 }
 
 void ncsi_find_package_and_channel(struct ncsi_dev_priv *ndp,
@@ -1969,6 +1969,6 @@ void ncsi_unregister_dev(struct ncsi_dev *nd)
 
 	disable_work_sync(&ndp->work);
 
-	kfree(ndp);
+	kfree_rcu_mightsleep(ndp);
 }
 EXPORT_SYMBOL_GPL(ncsi_unregister_dev);
-- 
2.47.3

