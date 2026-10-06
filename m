Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF653822A5
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 18:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791313148; cv=none; b=Vmtq+QJL/KuQlG2PoPSZlceK50wa32sK0v2OmpEG4vJ69F9RBch2wC53MdXj83szrqwk4Z+xb367Fy3ruelKbMnrQM2L6wiaqc9RsHJMcTaUCc8YwMEir5hVroR4jOq7xanhjQSZrUBZT6LJKjGekAR1WadwD+U2VX2PfJGWnQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791313148; c=relaxed/simple;
	bh=dv4RjLik04loNUOzkh8nJb80tSx8DaW2szTEAybVa+4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tviLFvf7iKYoprh77iXsIjtTTwVS81kGXEiOXckYBEsAT5IPLokye7lbi3LXfk2l22jvZJGNXMLCeaIVhlhs6XD2iPREkhvmKKNV+UDiRS3NdyPCZJ1PyonREtI8ZT20uSWdinQfhHBKEmS68+zy4Ao0VOoIvodPyd4PyX8TwLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdieSigV; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdieSigV"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a01eeeed23so1729695e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791313145; x=1791917945; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wL/0NGViGLPH765DFhz7xB3hieQEl5TW4iCSY1y8XQE=;
        b=QdieSigVtfjSRDBaqxOJ8TIqSK533wqJRCOVwyMPfIZSUBeP1ZWwhd7TeiYc021TIc
         q+LfEOZ2Tkt864pPAbB8Ygy217wTthpfuIDtomKQIi700BzvouYbyRVFcu+aUciohr9W
         dQG9o0qoSklx97kM2pkRbORHjzRv0n95W+FM3TvhEmO5c9DrwZ3T4GbxHg8l272uOALR
         TK9YPyJw2hR9RUOgW5iFg1gqqyZi/fe2oQ1yrCvmVjwdlsMkkG3Niz6V9ICPGeFAPaSr
         Yds06n6syNFyDwVwhBVJQmh1Hn5wng24GFvcFbBi0oaqqK+GapQ7bXGjZihAJkASvayu
         TZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791313145; x=1791917945;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wL/0NGViGLPH765DFhz7xB3hieQEl5TW4iCSY1y8XQE=;
        b=DhbuxxaWJ4xDce961/g8al//r5opCi7BhYhPDHXcL4eg+CyuyvEAfxVPiZms75m6Rb
         QjKAF/9vh3KqpM3IVNjDd4gVDHiNqgvzjS5NLiBG5n9/jSFdqU3aMIcSKV4OR3GxgSlf
         a3z6K8bQkebC9XDlmST29VSy3Mbzf9SgCMHHEEigpOeTOp/Zoc1y1xoAnKP/nJ2N+hKR
         7VWRerQEDuC3EOSQkBnRpRB2vM8gt0T3ehXmF0TEDlVOwuNP2ZT7AFg9iAFm6lbf7s5J
         6h2jqERVbbJCGeEPhEWhOa5++QLNbp1E1JzAR/I+PXNwQ4V3pCkIMtKaGmoOCWn/9lhh
         YgGQ==
X-Forwarded-Encrypted: i=1; AKwUvByWIPsK8Gzd/Yo1Js7QOyFk6R9vZ5GsMGgV/WN00RsKrRDMWDjaXwKZt17+8Xrw/o1RfKyP4FBsB+9MVMc=@vger.kernel.org
X-Gm-Message-State: AFuF++lDQCZwx+cafey+eT+pujDw5JE02SJ3sf5TVhNWgZsiCygt6ReI
	ENnH23/0EOljV7lVSu8buBDdq0g0A4OmsX5IZW2tEN4kW5ZIyTcFExZV
X-Gm-Gg: AYBFou3yX804ghi9lQ3nJHs8Su+/Qr+wsdHy1QVjnii8bCCSP7NrdFHmiRu7TJ5+SPu
	P9CiQ4vg1ci+2xfuoJW991qocSQTb6y5Du0JnPTVsBZgebsueTWgLAmCI2HKIVGFYdDF8NeUQ+E
	iuhOhfnaqFikdlnpjaljxAqErBIds0bUsSF/VuqLmMIT7xW5OkYYTqVOVkyfn9SVBIi4C5MZVoH
	z4oynpnMWEEhBLn+2ylwt4V7uHA5hdD4tVaBJ2c3is7WPnjOSEoPQXgaxTytSbjcayJXH/viBAW
	F85Vzgtao7PYK2jRRkz8rBK3BSfayEwG1Dq9hym4XFAI/I7i5a73pbKJGscF9yNa52bKi1CWfbt
	aOzIjlUmVC2c8QZPLHD5hi+ACyo1q1lFE+XN4dPjkWdl47bnbUcyFTWdJXYhk+4nrWsLgg5WjFM
	Ax8puOlBUv19+Vzx5HYqbbkG5IaAotGaxF03LXnWm+q8/vXnQyidLL
X-Received: by 2002:a05:600c:3489:b0:4a0:1b14:d01a with SMTP id 5b1f17b1804b1-4a02753550emr248265155e9.1.1791313145276;
        Tue, 06 Oct 2026 11:59:05 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::4:4701])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f653d7csm5039275e9.14.2026.10.06.11.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 11:59:04 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Subject: [PATCH net-next 0/2] netconsole: add locking to configfs _show
 callbacks
Date: Tue, 06 Oct 2026 19:58:28 +0100
Message-Id: <20261006-netcons-fixes-next-v1-0-231cd26f8c51@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBBFryJ/3cAYsJZeRVxonOh0EUsmLYJ49
 051+Xj//R3KWVjxrHZk/orKmgzqW4WwDGlmJ5MxPPl7TdS4xCWsSV2UjdVoK26INI3kH7FpCRa
 +M5/Wug62P1foL6Of8cWh/D9xHD8WPAHrgAAAAA==
X-Change-ID: 20261005-netcons-fixes-next-af0db028f570
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gustavo Luiz Duarte <gustavold@gmail.com>, 
 Sashiko <netdev-bot+sashiko@kernel.org>
X-Mailer: b4 0.15.2

Patch 1 fixes a couple of reports from sashiko by adding proper locking
to configs read callbacks to avoid printing partially updated data.
Patch 2 is mostly cosmetic but worth fixing.

Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
Gustavo Luiz Duarte (2):
      netconsole: avoid printing partially updated target attributes
      netconsole: remove unnecessary target refcounting from the netdev notifier

 drivers/net/netconsole.c | 93 ++++++++++++++++++++++++++----------------------
 1 file changed, 51 insertions(+), 42 deletions(-)
---
base-commit: 8b4e7209c842d8cb9516f1f5ef0a88aa2d8831a6
change-id: 20261005-netcons-fixes-next-af0db028f570

Best regards,
--  
Gustavo Luiz Duarte <gustavold@gmail.com>

