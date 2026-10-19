Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8494EF142
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411437; cv=none; b=sPc8iaUhIuKUooCQxDc1qmsYvqjnE/WbkWSQTMXk3Is+FZMcr6yoaMOZPDFUf1bXUie7MtSgUnMDhxY17RS3+22MIMnuhHN0giMEieifQDnj8Hl0tfbUNEZf9Vrnz3fWxo3RJGkA4sg9qmR4xVvKlc5SSBDl7EvdbcodEpDuPbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411437; c=relaxed/simple;
	bh=MX+Iz+ShiaE8nHEd/iGh1hntzDuqO+M+7JVZ/MbnG2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tF0b/JHhMio3hCptucVcKmqHznLfnMYBZcW2Io7SAiLQ2JqBBnYipUax+MVO1YoxYgeISOYuq8eVMGRv9T4jbd2fRnQF8/tjRx6QGLFPYR73q4PHa2B6OKmNkMB+V1vZQR1xPnLb0EgJ4v4FqfVZwE28Wem3LG8dxYSG3nIr+w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxvpULg5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxvpULg5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so15603415e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792411434; x=1793016234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PWBhm50kJKv5rgN7AYPJlHAnuK3+SCL8hQ69bW0a2u8=;
        b=mxvpULg5Iral8pImNVhKjAhNRUReYYlYOXjQCXXnCM/0A9uWqOAhNajREey1AzDWZN
         tLmngT8F40hk2FmiamQtw/T7HARvfya95kTy+XIYbajIc6nO6bDwAcPhwb2txcNASxYA
         xbkXmL3DYxGN3gAMjHAh2LWdlmd3ZR24S0MjDclU2iTDpvLok274czKXm+7Y3fA8PkrA
         mwE8hSwhjlBiFqWP45kkBLvJXNX1SKZIbnHy5FPza46Hdiau4XKr93TdhSJeZCvXt9l2
         JJfKVg2bYZceGG366EUUDaftwSiXsUgkW95rWG3GF9Qy7d1Sh7B3RCukO+PYN5BfWsga
         ETug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411434; x=1793016234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PWBhm50kJKv5rgN7AYPJlHAnuK3+SCL8hQ69bW0a2u8=;
        b=JEgKsIYv3nSHMsqkx6GE1JoJsD0gQt6MiqIrQctQoZSa0NpdPRY6DKyI/IFI7Sq4xo
         rbBybVdNEpcfNjzcirCtdeG/tWxIYQG86qwjejmC93kMBRmzEWYXoZkLvs5nVAn2h1tw
         F5lnJMiwObz6ugTQRG44PFZ+1PGGzXAbEUSVi67dog981Ya4HyCoEp/AmRLGGvfdy6RQ
         6c0J0Nm4bepl3SzC2Pvzl9FI/8riuInV3ligHWWgZoFgIG2vaM5ESfS8C/IFASDBs41E
         UTxTwtW6jMlsN0VlZjrN0jrv2Crt8qRZCo4hAURSdYigeMdWvjZ2QUkOYXnP/Zr7HYDn
         3uDg==
X-Forwarded-Encrypted: i=1; AKwUvBy0w3rbiatds9KDZwVZuOHf/FJ/WV0nFPt9xT9lceHsPYl5h5IhzAXknA2gLlSSkJLv1huP673alun7/rU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzSKU+eyexw+jmQF6lAouRkge/1NxBHsH7v6bi2K2h8dxaoshi
	5F9cKf9QxroBc44KMogsOyPCG+GPqBthvwvxn0tRDd+yUdTzrqQEaTxo
X-Gm-Gg: AYBFou3xyX8vrFW6BoVuDAVosW9UN5tbme3hJwGivO03JDFhKrUnh0KojofNNtXUIFI
	CNVX3i/Y2PZVv4B/1/BopqWNaSh17KH6rj/mFkr1PIF2ce+A9csmh0901j04x+6xAb0JBBBpRSn
	N//DQbxderNusHhoGFFl9Qu5hQIYc6b/JUghVyHOpbmNv3W+liiLVRzaK8CNbaxmnvOwsNF1QW3
	XXBQ2IBTIp39icz7bBRrVzR9j1Hh6oMFFGRPmgR+IGSaSilqbafha4WX8zBaqhLgvVNFYAa4r2k
	/sGh6zpXaqFffeddfHVL2MEYSNNqY0WKuREsfMj2IZS767FP1tVbjvSWPHSF1WCXkiqIn3NRc+1
	8vJYn7H/qX5zK0a1QMvyF3NqS0UWtpaWtpZfQ+Z2B2/AxqCW2EM166CPjLpbtVQC6DJj3QUqWf2
	UjQh4zw/nEKHJBs3DBZjfZV0mJ1UOXjr8mm/k3/1eHJiuU6PWURtz0R3Bz+EnMZSoTSsK+zqWWu
	oMowsYhJA1V6W1pNFPte702Z/650qX3MDeijYEk4qclRd1c5NKnwA7Ucd6M4LR1cdqgPrLq6djf
	XUNxijTOjxIqRp3yvHd7gEhS9raRJPunLQkfcInWZ3TG90dUEupk8z0I0KMWpxdreN8hCV2s0LN
	4v98prh6iFCTN+cKeDPZQ07TqhMo=
X-Received: by 2002:a05:600c:820e:b0:4a0:174:579e with SMTP id 5b1f17b1804b1-4a1d761637amr143638045e9.28.1792411433506;
        Mon, 19 Oct 2026 05:03:53 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-884a-68e2-6a4e-545c.rev.sfr.net. [2a02:8434:fda5:4201:884a:68e2:6a4e:545c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a35sm19555486f8f.7.2026.10.19.05.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:03:52 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools/bootconfig: Quote CPU masks containing comma-separated words
Date: Mon, 19 Oct 2026 14:03:32 +0200
Message-ID: <20261019120332.553567-1-edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ftrace2bconf.sh writes the CPU mask without quotes. For a mask selecting
CPUs 0 and 32, the output is:

  ftrace.cpumask = 00000001,00000001

Bootconfig reads the two comma-separated words as separate array values.
When bconf2ftrace.sh applies the saved settings, it writes those values
on separate lines instead of restoring the original CPU mask.

Quote the mask so the commas remain part of a single value.

Fixes: 2b86062a34a8 ("tools/bootconfig: Add a script to generates bootconfig from ftrace")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
This is my first kernel contribution, so I'd appreciate any feedback.

Tested with the exporter, bootconfig parser and generated replay commands
using tracefs fixtures for 00000001,00000001, 0f,ffffffff and 1.
The masks containing commas fail before the fix and pass afterwards;
the single-word mask passes in both cases.

 tools/bootconfig/scripts/ftrace2bconf.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index 8eed445c2..f8f288f90 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -238,7 +238,7 @@ instance_options() { # [instance-name]
 	fi
 	val=`cat $INSTANCE/tracing_cpumask`
 	if [ `echo $val | sed -e s/f//g`x != x ]; then
-		emit_kv $PREFIX.cpumask = $val
+		emit_kv $PREFIX.cpumask = "\"$val\""
 	fi
 	val=`cat $INSTANCE/tracing_on`
 	if [ "$val" = "0" ]; then

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.53.0

