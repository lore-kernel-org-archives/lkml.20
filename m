Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8942C46EF6A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792824; cv=none; b=jq5B3/eR/4Eh4jHgoWajsFIjcj7y8yKt6JLgIN9LnhHgNi8SNp+FT7k52fJcYEljxdDKe0XLje6g3TE0da7/IsRT8Cyg0v3h/rQkKyOkzataXFYesmYGdhzcS7rOoK6OaUGU5XxduLHUNoCw+SQNTzosL5QOoAOaxRqNF0r6Oz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792824; c=relaxed/simple;
	bh=rOI4hkeCoOwgt12sklzFsfgNUdEln859/ig4LK/GS9k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qkaTnOhCfG798FK/dNeiYNve1GjMjgJgTETKhNFOA7ZDJXefJuKLzmdLt05bsvSeurtLBbxnvWUVQxzLcO+w1AYobPfFtfDZMFPYDa9JdGJeez/GrXWA5Qfo8vit1Qil9UkO880wTkSWzeiojtXDTTkjYzKWofbmeER2WI14QGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e9e2db9914so4814150a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788792807; x=1789397607;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rOI4hkeCoOwgt12sklzFsfgNUdEln859/ig4LK/GS9k=;
        b=GA6ttJyv7gzBOPde2xHgHCnZ1WoQef0O9bWnTVQLDFIGeLTf/Kllkby1oz5z6CbDSF
         IJXdEfYHXTX4JpknptMS8qgk8ur9cq2EHj9Jq1dIpmmMPTE1TYf4nwyBMuQg1KQEa+aK
         3qBOvBvpjEcncYIL7lwljbhOGpGo9PmU6mCQ12/dOAGNCfTR1z1g7wbfC2rBO0IYkwF8
         xmi39NXRRQTzLOsCSAQeDrCnfFF1Jg2SG4DsKJL/HRNEMfOIbraANTZrNcm+4LLXNCPm
         aGM2HivBP7VyCS1NN+QXku48HHLO6AVEH3gzans1yzJnvGmbW6GRtOOv9xyDA8xqfDhg
         Z3MQ==
X-Gm-Message-State: AFuF++lTrolpeL1j577oN5Ub3jZ//LcDberM8FP2NNCVEsKROybSmA54
	dGaY/rQ2AH4PLboHVY4W77vUkNMqkgFtMTVWgXwO1U38DPphkbhGr+89tV6t+i8Rnke4Uumkesw
	Eso2s3Wsq154LAkxyZ87rRN5qh/hoPfZgMkizqlFZA8mw+3e1KXpX4eSw5B4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f015:b0:6b6:8fb3:583e with SMTP id
 006d021491bc7-6b68fb35acdmr10593778eaf.38.1788792806824; Mon, 07 Sep 2026
 07:53:26 -0700 (PDT)
Date: Mon, 07 Sep 2026 07:53:26 -0700
In-Reply-To: <6a9443c1.a8e469d2.cbf3.5609.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9ecfe6.6e6c5f9e.240462.0002.GAE@google.com>
Subject: Forwarded: cx231xx: reproduce USB direction warning on v7.3-rc2
From: syzbot <syzbot+ddccc0c0dbc0a38ffccb@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: cx231xx: reproduce USB direction warning on v7.3-rc2
Author: jcperdomo100@gmail.com

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
df2908090cda368b01ff43709f51890076c56157
